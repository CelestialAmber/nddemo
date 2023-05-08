.include "macros.s"

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380 ; 0x000005C0


cseq:
	.skip 0x4

noteFree:
	.skip 0x4

curSeqId:
	.skip 0x4

curFadeOutState:
	.skip 0x4

seq_next_id:
	.skip 0x4

.global seqFreeRoot
seqFreeRoot:
	.skip 0x4

.global seqPausedRoot
seqPausedRoot:
	.skip 0x4

.global seqActiveRoot
seqActiveRoot:
	.skip 0x4

.global sndActive
sndActive:
	.skip 0x1

synthJobTableIndex:
	.skip 0x3

.global synthITDDefault
synthITDDefault:
	.skip 0x8

.global synthAuxBMIDISet
synthAuxBMIDISet:
	.skip 0x4

.global synthAuxBMIDI
synthAuxBMIDI:
	.skip 0x4

.global synthAuxAMIDISet
synthAuxAMIDISet:
	.skip 0x4

.global synthAuxAMIDI
synthAuxAMIDI:
	.skip 0x4

.global synthMasterFaderPauseActiveFlags
synthMasterFaderPauseActiveFlags:
	.skip 0x4

.global synthMasterFaderActiveFlags
synthMasterFaderActiveFlags:
	.skip 0x4

.global synthHasSurround
synthHasSurround:
	.skip 0x1

.global synthIsMono
synthIsMono:
	.skip 0x3

.global synthVoice
synthVoice:
	.skip 0x4

.global synthMessageCallback
synthMessageCallback:
	.skip 0x4

.global synthIdleWaitActive
synthIdleWaitActive:
	.skip 0x8

.global synthRealTime
synthRealTime:
	.skip 0x8

streamCallCnt:
	.skip 0x1

streamCallDelay:
	.skip 0x3

nextPublicID:
	.skip 0x4

dataSmpSDirNum:
	.skip 0x2

dataCurveNum:
	.skip 0x2

dataKeymapNum:
	.skip 0x2

dataLayerNum:
	.skip 0x2

dataMacTotal:
	.skip 0x2

dataFXGroupNum:
	.skip 0x2

"base$554":
	.skip 0x4

"main$555":
	.skip 0x4

"key$556":
	.skip 0x8

"result$557":
	.skip 0x4

"result$569":
	.skip 0x4

"sheader$570":
	.skip 0x4

"key$589":
	.skip 0x8

"result$590":
	.skip 0x4

"key$596":
	.skip 0x8

"result$597":
	.skip 0x4

"result$605":
	.skip 0x8

DebugMacroSteps:
	.skip 0x4

macActiveMacroRoot:
	.skip 0x4

macTimeQueueRoot:
	.skip 0x8

macRealTime:
	.skip 0x8

"cstep$1061":
	.skip 0x8

vidCurrentId:
	.skip 0x4

vidRoot:
	.skip 0x4

vidFree:
	.skip 0x4

.global voicePrioSortRootListRoot
voicePrioSortRootListRoot:
	.skip 0x2

.global voiceMusicRunning
voiceMusicRunning:
	.skip 0x1

.global voiceFxRunning
voiceFxRunning:
	.skip 0x1

.global voiceListInsert
voiceListInsert:
	.skip 0x1

.global voiceListRoot
voiceListRoot:
	.skip 0x7

sp:
	.skip 0x8

dspARAMZeroBuffer:
	.skip 0x4

.global dspCmdLastLoad
dspCmdLastLoad:
	.skip 0x4

.global dspCmdLastBase
dspCmdLastBase:
	.skip 0x4

.global dspCmdLastSize
dspCmdLastSize:
	.skip 0x4

.global dspCmdCurBase
dspCmdCurBase:
	.skip 0x4

.global dspCmdMaxPtr
dspCmdMaxPtr:
	.skip 0x4

.global dspCmdPtr
dspCmdPtr:
	.skip 0x4

.global dspCmdFirstSize
dspCmdFirstSize:
	.skip 0x4

.global dspCmdList
dspCmdList:
	.skip 0x4

.global dspHRTFOn
dspHRTFOn:
	.skip 0x4

.global dspHrtfHistoryBuffer
dspHrtfHistoryBuffer:
	.skip 0x4

.global dspSurround
dspSurround:
	.skip 0x4

.global dspITDBuffer
dspITDBuffer:
	.skip 0x4

.global dspVoice
dspVoice:
	.skip 0x4

.global salMessageCallback
salMessageCallback:
	.skip 0x8

s3dCallCnt:
	.skip 0x4

s3dEmitterRoot:
	.skip 0x4

s3dListenerRoot:
	.skip 0x4

s3dRoomRoot:
	.skip 0x4

s3dDoorRoot:
	.skip 0x4

snd_used_studios:
	.skip 0x4

snd_base_studio:
	.skip 0x1

snd_max_studios:
	.skip 0x1

startGroupNum:
	.skip 0x1

startListNumnum:
	.skip 0x1

runListNum:
	.skip 0x4

salTimeOffset:
	.skip 0x4

.global salHooks
salHooks:
	.skip 0x8

.global salNumVoices
salNumVoices:
	.skip 0x1

.global salAuxFrame
salAuxFrame:
	.skip 0x1

.global salFrame
salFrame:
	.skip 0x2

aramTop:
	.skip 0x4

aramWrite:
	.skip 0x4

aramStream:
	.skip 0x4

aramQueueWrite:
	.skip 0x1

aramQueueValid:
	.skip 0x3

aramUsedStreamBuffers:
	.skip 0x4

aramFreeStreamBuffers:
	.skip 0x4

aramIdleStreamBuffers:
	.skip 0x8

userCallback:
	.skip 0x4

salAIBufferBase:
	.skip 0x4

salDspIsDone:
	.skip 0x4

salLogicIsWaiting:
	.skip 0x4

salLogicActive:
	.skip 0x4

salLastTick:
	.skip 0x4

salDspInitIsDone:
	.skip 0x4

hwIrqLevel:
	.skip 0x4

oldState:
	.skip 0x4

.global salAIBufferIndex
salAIBufferIndex:
	.skip 0x4