#include "dolphin/AI.h"
#include "dolphin/DSP.h"
#include "dolphin/OS.h"

static AISCallback __AIS_Callback;
static AIDMACallback __AID_Callback;

static void* __CallbackStack;
static void* __OldStack;

static BOOL __AI_init_flag;

static s64 bound_32KHz;
static s64 bound_48KHz;

static s64 min_wait;
static s64 max_wait;
static s64 buffer;

static void __AICallbackStackSwitch(AIDMACallback callback);
static void __AISHandler(s16 intr, struct OSContext* ctx);
static void __AIDHandler(s16 intr, struct OSContext* ctx);
static void __AI_SRC_INIT(void);
static void __AI_set_stream_sample_rate(u32 rate);

AIDMACallback AIRegisterDMACallback(AIDMACallback callback) {
	BOOL enabled;
	AIDMACallback old;

	old = __AID_Callback;
	enabled = OSDisableInterrupts();

	__AID_Callback = callback;

	OSRestoreInterrupts(enabled);
	return old;
}

void AIInitDMA(void* buffer, u32 length) {
	BOOL enabled;

	enabled = OSDisableInterrupts();

	DSP_HW_REGS[DSP_AI_DMA_START_H] =
		(DSP_HW_REGS[DSP_AI_DMA_START_H] & ~0x3FF) |
		(((uintptr_t)buffer) >> 16 & 0xFFFF);

	DSP_HW_REGS[DSP_AI_DMA_START_L] =
		(DSP_HW_REGS[DSP_AI_DMA_START_L] & ~0xFFE0) |
		(((uintptr_t)buffer) & 0xFFFF);

	DSP_HW_REGS[DSP_AI_DMA_CSR] =
		(DSP_HW_REGS[DSP_AI_DMA_CSR] & ~0x7FFF) | ((length / 32) & 0xFFFF);

	OSRestoreInterrupts(enabled);
}

//unused
void AIGetDMAEnableFlag(){
}

void AIStartDMA(void) { DSP_HW_REGS[DSP_AI_DMA_CSR] |= DSP_AI_DMA_CSR_PLAY; }

void AIStopDMA(void) { DSP_HW_REGS[DSP_AI_DMA_CSR] &= ~DSP_AI_DMA_CSR_PLAY; }

//unused
u32 AIGetDMABytesLeft(void) {
}

//unused
u32 AIGetDMAStartAddr(void) {
}

//unused
u32 AIGetDMALength(void) {
}

//unused
BOOL AICheckInit(void) {
}

//unused
void AIRegisterStreamCallback(){
}

//unused
void AIGetStreamSampleCount(void){
}

void AIResetStreamSampleCount(void){
	AI_HW_REGS[0] = (AI_HW_REGS[0] & ~0x20) | 0x20;
}

void AISetStreamTrigger(u32 trigger){
	AI_HW_REGS[3] = trigger;
}

//unused
void AIGetStreamTrigger(void){
}

void AISetStreamPlayState(u32 state) {
     s32 oldInts;
    u8 volRight;
    u8 volLeft;

    if (state == AIGetStreamPlayState()) {
        return;
    }
    if ((AIGetStreamSampleRate() == 0U) && (state == 1)) {
        volRight = AIGetStreamVolRight();
        volLeft = AIGetStreamVolLeft();
        AISetStreamVolRight(0);
        AISetStreamVolLeft(0);
        oldInts = OSDisableInterrupts();
        __AI_SRC_INIT();
        AI_HW_REGS[0] = (AI_HW_REGS[0] & ~0x20) | 0x20;
        AI_HW_REGS[0] = (AI_HW_REGS[0] & ~1) | 1;
        OSRestoreInterrupts(oldInts);
        AISetStreamVolLeft(volRight);
        AISetStreamVolRight(volLeft);
    } else {
        AI_HW_REGS[0] = (AI_HW_REGS[0] & ~1) | state;
    }
}

u32 AIGetStreamPlayState(void){
	return AI_HW_REGS[0] & 1;
}


void AISetDSPSampleRate(u32 rate) {
	    u32 state;
    s32 oldInts;
    u8 left;
    u8 right;
    u32 sampleRate;

    if (rate == AIGetDSPSampleRate()) {
        return;
    }

    AI_HW_REGS[0] &= ~0x40;
    if (rate == 0) {
        left = AIGetStreamVolLeft();
        right = AIGetStreamVolRight();
        state = AIGetStreamPlayState();
        sampleRate = AIGetStreamSampleRate();
        AISetStreamVolLeft(0);
        AISetStreamVolRight(0);
        oldInts = OSDisableInterrupts();
        __AI_SRC_INIT();
        AI_HW_REGS[0] = (AI_HW_REGS[0] & ~0x20) | 0x20;
        AI_HW_REGS[0] = (AI_HW_REGS[0] & ~2) | (sampleRate * 2);
        AI_HW_REGS[0] = (AI_HW_REGS[0] & ~1) | state;
        AI_HW_REGS[0] |= 0x40;
        OSRestoreInterrupts(oldInts);
        AISetStreamVolLeft(left);
        AISetStreamVolRight(right);
    }
}

u32 AIGetDSPSampleRate(void) {
	return ((AI_HW_REGS[AI_AICR] & AI_AICR_SAMPLERATE) >> 6) ^ 1;
}

//unused
void AISetStreamSampleRate(u32 rate){
}

//unused
void __AI_DEBUG_set_stream_sample_rate(void){
}

static void __AI_set_stream_sample_rate(u32 rate){
	s32 oldInts;
    s32 state;
    u8 left;
    u8 right;
    s32 temp_r26;

    if (rate == AIGetStreamSampleRate()) {
        return;
    }
    state = AIGetStreamPlayState();
    left = AIGetStreamVolLeft();
    right = AIGetStreamVolRight();
    AISetStreamVolRight(0);
    AISetStreamVolLeft(0);
    temp_r26 = AI_HW_REGS[0] & 0x40;
    AI_HW_REGS[0] &= ~0x40;
    oldInts = OSDisableInterrupts();
    __AI_SRC_INIT();
    AI_HW_REGS[0] |= temp_r26;
    AI_HW_REGS[0] = (AI_HW_REGS[0] & ~0x20) | 0x20;
    AI_HW_REGS[0] = (AI_HW_REGS[0] & ~2) | (rate * 2);
    OSRestoreInterrupts(oldInts);
    AISetStreamPlayState(state);
    AISetStreamVolLeft(left);
    AISetStreamVolRight(right);
}

u32 AIGetStreamSampleRate(void){
	return (AI_HW_REGS[AI_AICR] >> 1) & 1;
}

void AISetStreamVolLeft(u8 volume){
	AI_HW_REGS[1] = (AI_HW_REGS[1] & ~0xFF) | (volume & 0xFF);
}

u8 AIGetStreamVolLeft(void){
	return AI_HW_REGS[1];
}

void AISetStreamVolRight(u8 volume){
	AI_HW_REGS[1] = (AI_HW_REGS[1] & ~0xFF00) | ((volume & 0xFF) << 8);
}

u8 AIGetStreamVolRight(void){
	return AI_HW_REGS[1] >> 8;
}


void AIInit(void* stack) {
	if (__AI_init_flag != TRUE) {
		bound_32KHz = OSNanosecondsToTicks(31524);
		bound_48KHz = OSNanosecondsToTicks(42024);
		min_wait = OSNanosecondsToTicks(42000);
		max_wait = OSNanosecondsToTicks(63000);
		buffer = OSNanosecondsToTicks(3000);

		AISetStreamVolRight(0);
    	AISetStreamVolLeft(0);
    	AISetStreamTrigger(0);
    	AIResetStreamSampleCount();
    	AISetStreamSampleRate(1);
		__AI_set_stream_sample_rate(1);
    	AISetDSPSampleRate(0);

		__AIS_Callback = NULL;
		__AID_Callback = NULL;
		__CallbackStack = stack;

		__OSSetInterruptHandler(OS_INTR_DSP_AI, __AIDHandler);
		__OSUnmaskInterrupts(OS_INTR_MASK(OS_INTR_DSP_AI));
		__OSSetInterruptHandler(OS_INTR_AI_AI, __AISHandler);
		__OSUnmaskInterrupts(OS_INTR_MASK(OS_INTR_AI_AI));

		__AI_init_flag = TRUE;
	}
}

//unused
void AIReset(){
}

static void __AISHandler(s16 intr, OSContext* ctx){
	OSContext tmpContext;
    AI_HW_REGS[0] |= 8;
    OSClearContext(&tmpContext);
    OSSetCurrentContext(&tmpContext);
    if (__AIS_Callback != NULL) {
        __AIS_Callback(AI_HW_REGS[2]);
    }
    OSClearContext(&tmpContext);
    OSSetCurrentContext(ctx);
}

static void __AIDHandler(s16 intr, OSContext* ctx) {

	OSContext tempCtx;

	u32 temp = DSP_HW_REGS[DSP_CSR];
	DSP_HW_REGS[DSP_CSR] = (temp & ~(DSP_CSR_ARINT | DSP_CSR_DSPINT)) | DSP_CSR_AIDINT;

	OSClearContext(&tempCtx);
	OSSetCurrentContext(&tempCtx);

	if (__AID_Callback != NULL) {
		if (__CallbackStack != NULL) {
			__AICallbackStackSwitch(__AID_Callback);
		} else {
			__AID_Callback();
		}
	}

	OSClearContext(&tempCtx);
	OSSetCurrentContext(ctx);
}

static asm void __AICallbackStackSwitch(register AIDMACallback callback) {
	fralloc

	lis r5, __OldStack@ha
	addi r5, r5, __OldStack@l
	stw r1, 0(r5)

	lis r5, __CallbackStack@ha
	addi r5, r5, __CallbackStack@l
	lwz r1, 0(r5)
		
	subi r1, r1, 0x8
	mtlr r31
	blrl
	
	lis r5, __OldStack@ha
	addi r5, r5, __OldStack@l
	lwz r1, 0(r5)

	frfree
	blr
}

static void __AI_SRC_INIT(void) {
	u8 _[16];
	s64 end = 0;
	u32 exit = FALSE;
	u32 samples = 0;
	s64 wait = 0;
	

	while (!exit) {
		s64 diff;

		AI_HW_REGS[AI_AICR] = (AI_HW_REGS[AI_AICR] & ~AI_AICR_SCRESET) | AI_AICR_SCRESET;
		AI_HW_REGS[AI_AICR] &= ~AI_AICR_AFR;
		AI_HW_REGS[AI_AICR] = (AI_HW_REGS[AI_AICR] & ~AI_AICR_PSTAT) | AI_AICR_PSTAT;

		// Waiting for one sample?
		samples = AI_HW_REGS[AI_AISCNT];
		while (samples == AI_HW_REGS[AI_AISCNT]) {
			;
		}

		{
			s64 start = OSGetTime();

			AI_HW_REGS[AI_AICR] = (AI_HW_REGS[AI_AICR] & ~AI_AICR_AFR) | AI_AICR_AFR;
			AI_HW_REGS[AI_AICR] = (AI_HW_REGS[AI_AICR] & ~AI_AICR_PSTAT) | AI_AICR_PSTAT;

			// Waiting for one sample?
			samples = AI_HW_REGS[AI_AISCNT];
			while (samples == AI_HW_REGS[AI_AISCNT]) {
				;
			}

			end = OSGetTime();
			diff = end - start;
		}

		AI_HW_REGS[AI_AICR] &= ~AI_AICR_AFR;
		AI_HW_REGS[AI_AICR] &= ~AI_AICR_PSTAT;

		if (diff < bound_32KHz - buffer) {
			wait = min_wait;
			exit = TRUE;
		} else if (diff >= bound_32KHz + buffer && diff < bound_48KHz - buffer) {
			wait = max_wait;
			exit = TRUE;
		} else {
			exit = FALSE;
		}
	}

	while (end + wait > OSGetTime()) {
		;
	}
}

//unused
static void __ai_src_get_time(){
}
