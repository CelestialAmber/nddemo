#ifndef DOLPHIN_AI_H
#define DOLPHIN_AI_H
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

// Forward declarations
typedef struct OSContext;

typedef void (*AISCallback)(u32 count);
typedef void (*AIDMACallback)(void);

typedef enum {
    AI_DSP_32KHZ,
    AI_DSP_48KHZ,
} AIDSPSampleRate;

AIDMACallback AIRegisterDMACallback(AIDMACallback callback);
void AIInitDMA(void* buffer, u32 length);
void AIStartDMA(void);
void AIStopDMA(void);
void AISetStreamPlayState(u32 state);
u32 AIGetStreamPlayState(void);
void AISetStreamVolLeft(u8 volume);
u8 AIGetStreamVolLeft(void);
void AISetStreamVolRight(u8 volume);
u8 AIGetStreamVolRight(void);
u32 AIGetDMABytesLeft(void);
void AISetDSPSampleRate(u32 rate);
u32 AIGetDSPSampleRate(void);
u32 AIGetDMAStartAddr(void);
u32 AIGetDMALength(void);
u32 AIGetStreamSampleRate(void);
BOOL AICheckInit(void);
void AIInit(void* stack);

#ifdef __cplusplus
}
#endif
#endif
