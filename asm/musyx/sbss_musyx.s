.include "macros.s"

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380 ; 0x000005C0


.global cseq
cseq:
	.skip 0x4

.global noteFree
noteFree:
	.skip 0x4

.global curSeqId
curSeqId:
	.skip 0x4

.global curFadeOutState
curFadeOutState:
	.skip 0x4

.global seq_next_id
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

.global synthJobTableIndex
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

.global streamCallCnt
streamCallCnt:
	.skip 0x1

.global streamCallDelay
streamCallDelay:
	.skip 0x3

.global nextPublicID
nextPublicID:
	.skip 0x4

.global dataSmpSDirNum
dataSmpSDirNum:
	.skip 0x2

.global dataCurveNum
dataCurveNum:
	.skip 0x2

.global dataKeymapNum
dataKeymapNum:
	.skip 0x2

.global dataLayerNum
dataLayerNum:
	.skip 0x2

.global dataMacTotal
dataMacTotal:
	.skip 0x2

.global dataFXGroupNum
dataFXGroupNum:
	.skip 0x2

.global "base$554"
"base$554":
	.skip 0x4

.global "main$555"
"main$555":
	.skip 0x4

.global "key$556"
"key$556":
	.skip 0x8

.global "result$557"
"result$557":
	.skip 0x4

.global "result$569"
"result$569":
	.skip 0x4

.global "sheader$570"
"sheader$570":
	.skip 0x4

.global "key$589"
"key$589":
	.skip 0x8

.global "result$590"
"result$590":
	.skip 0x4

.global "key$596"
"key$596":
	.skip 0x8

.global "result$597"
"result$597":
	.skip 0x4

.global "result$605"
"result$605":
	.skip 0x8

.global DebugMacroSteps
DebugMacroSteps:
	.skip 0x4

.global macActiveMacroRoot
macActiveMacroRoot:
	.skip 0x4

.global macTimeQueueRoot
macTimeQueueRoot:
	.skip 0x8

.global macRealTime
macRealTime:
	.skip 0x8

.global "cstep$1061"
"cstep$1061":
	.skip 0x8

.global vidCurrentId
vidCurrentId:
	.skip 0x4

.global vidRoot
vidRoot:
	.skip 0x4

.global vidFree
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

.global sp
sp:
	.skip 0x8

.global dspARAMZeroBuffer
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

.global s3dCallCnt
s3dCallCnt:
	.skip 0x4

.global s3dEmitterRoot
s3dEmitterRoot:
	.skip 0x4

.global s3dListenerRoot
s3dListenerRoot:
	.skip 0x4

.global s3dRoomRoot
s3dRoomRoot:
	.skip 0x4

.global s3dDoorRoot
s3dDoorRoot:
	.skip 0x4

.global snd_used_studios
snd_used_studios:
	.skip 0x4

.global snd_base_studio
snd_base_studio:
	.skip 0x1

.global snd_max_studios
snd_max_studios:
	.skip 0x1

.global startGroupNum
startGroupNum:
	.skip 0x1

.global startListNumnum
startListNumnum:
	.skip 0x1

.global runListNum
runListNum:
	.skip 0x4

.global salTimeOffset
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

.global aramTop
aramTop:
	.skip 0x4

.global aramWrite
aramWrite:
	.skip 0x4

.global aramStream
aramStream:
	.skip 0x4

.global aramQueueWrite
aramQueueWrite:
	.skip 0x1

.global aramQueueValid
aramQueueValid:
	.skip 0x3

.global aramUsedStreamBuffers
aramUsedStreamBuffers:
	.skip 0x4

.global aramFreeStreamBuffers
aramFreeStreamBuffers:
	.skip 0x4

.global aramIdleStreamBuffers
aramIdleStreamBuffers:
	.skip 0x8

.global userCallback
userCallback:
	.skip 0x4

.global salAIBufferBase
salAIBufferBase:
	.skip 0x4

.global salDspIsDone
salDspIsDone:
	.skip 0x4

.global salLogicIsWaiting
salLogicIsWaiting:
	.skip 0x4

.global salLogicActive
salLogicActive:
	.skip 0x4

.global salLastTick
salLastTick:
	.skip 0x4

.global salDspInitIsDone
salDspInitIsDone:
	.skip 0x4

.global hwIrqLevel
hwIrqLevel:
	.skip 0x4

.global oldState
oldState:
	.skip 0x4

.global salAIBufferIndex
salAIBufferIndex:
	.skip 0x4