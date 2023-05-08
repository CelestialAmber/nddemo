.include "macros.s"

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380 ; 0x000005C0

.global BootInfo
BootInfo:
	.skip 0x4

.global BI2DebugFlag
BI2DebugFlag:
	.skip 0x4

.global AreWeInitialized
AreWeInitialized:
	.skip 0x4

.global OSExceptionTable
OSExceptionTable:
	.skip 0x4

.global __OSStartTime
__OSStartTime:
	.skip 0x8

.global AlarmQueue
AlarmQueue:
	.skip 0x8

.global HeapArray
HeapArray:
	.skip 0x4

.global NumHeaps
NumHeaps:
	.skip 0x4

.global ArenaStart
ArenaStart:
	.skip 0x4

.global ArenaEnd
ArenaEnd:
	.skip 0x4

.global __OSArenaHi
__OSArenaHi:
	.skip 0x8

.global InterruptHandlerTable
InterruptHandlerTable:
	.skip 0x8

.global SaveStart
SaveStart:
	.skip 0x4

.global SaveEnd
SaveEnd:
	.skip 0x4

.global Prepared
Prepared:
	.skip 0x8

.global ResetFunctionQueue
ResetFunctionQueue:
	.skip 0x8

.global ResetCallback
ResetCallback:
	.skip 0x4

.global Down
Down:
	.skip 0x4

.global LastState
LastState:
	.skip 0x8

.global HoldUp
HoldUp:
	.skip 0x8

.global HoldDown
HoldDown:
	.skip 0x8

.global "cmdTypeAndStatus$75"
"cmdTypeAndStatus$75":
	.skip 0x4

.global "cmdTypeAndStatus$374"
"cmdTypeAndStatus$374":
	.skip 0x4

.global SIDelay
SIDelay:
	.skip 0x8

.global __PADFixBits
__PADFixBits:
	.skip 0x8

.global RunQueueBits
RunQueueBits:
	.skip 0x4

.global RunQueueHint
RunQueueHint:
	.skip 0x4

.global Reschedule
Reschedule:
	.skip 0x8

.global serEnabled
serEnabled:
	.skip 0x8

.global __DBInterface
__DBInterface:
	.skip 0x4

.global DBVerbose
DBVerbose:
	.skip 0x4

.global StopAtNextInt
StopAtNextInt:
	.skip 0x4

.global LastLength
LastLength:
	.skip 0x4

.global Callback
Callback:
	.skip 0x4

.global ResetCoverCallback
ResetCoverCallback:
	.skip 0x4

.global LastResetEnd
LastResetEnd:
	.skip 0x8

.global ResetOccurred
ResetOccurred:
	.skip 0x4

.global WaitingCoverClose
WaitingCoverClose:
	.skip 0x4

.global Breaking
Breaking:
	.skip 0x4

.global WorkAroundType
WorkAroundType:
	.skip 0x4

.global WorkAroundSeekLocation
WorkAroundSeekLocation:
	.skip 0x8

.global LastReadFinished
LastReadFinished:
	.skip 0x8

.global LastReadIssued
LastReadIssued:
	.skip 0x8

.global LastCommandWasRead
LastCommandWasRead:
	.skip 0x4

.global NextCommandNumber
NextCommandNumber:
	.skip 0x4

.global BootInfo
BootInfo:
	.skip 0x4

.global FstStart
FstStart:
	.skip 0x4

.global FstStringStart
FstStringStart:
	.skip 0x4

.global MaxEntryNum
MaxEntryNum:
	.skip 0x4

.global currentDirectory
currentDirectory:
	.skip 0x4

.global __DVDLongFileNameFlag
__DVDLongFileNameFlag:
	.skip 0x4

.global __DVDThreadQueue
__DVDThreadQueue:
	.skip 0x8

.global executing
executing:
	.skip 0x4

.global currID
currID:
	.skip 0x4

.global bootInfo
bootInfo:
	.skip 0x4

.global PauseFlag
PauseFlag:
	.skip 0x4

.global PausingFlag
PausingFlag:
	.skip 0x4

.global AutoFinishing
AutoFinishing:
	.skip 0x4

.global FatalErrorFlag
FatalErrorFlag:
	.skip 0x4

.global CurrCommand
CurrCommand:
	.skip 0x4

.global Canceling
Canceling:
	.skip 0x4

.global CancelCallback
CancelCallback:
	.skip 0x4

.global ResumeFromHere
ResumeFromHere:
	.skip 0x4

.global CancelLastError
CancelLastError:
	.skip 0x4

.global LastError
LastError:
	.skip 0x4

.global NumInternalRetry
NumInternalRetry:
	.skip 0x4

.global ResetRequired
ResetRequired:
	.skip 0x4

.global FirstTimeInBootrom
FirstTimeInBootrom:
	.skip 0x4

.global DVDInitialized
DVDInitialized:
	.skip 0x4

.global LastState
LastState:
	.skip 0x4

.global status
status:
	.skip 0x4

.global bb2
bb2:
	.skip 0x4

.global idTmp
idTmp:
	.skip 0x8

.global retraceCount
retraceCount:
	.skip 0x4

.global flushFlag
flushFlag:
	.skip 0x4

.global retraceQueue
retraceQueue:
	.skip 0x8

.global PreCB
PreCB:
	.skip 0x4

.global PostCB
PostCB:
	.skip 0x4

.global encoderType
encoderType:
	.skip 0x4

.global displayOffsetH
displayOffsetH:
	.skip 0x2

.global displayOffsetV
displayOffsetV:
	.skip 0x2

.global changeMode
changeMode:
	.skip 0x8

.global changed
changed:
	.skip 0x8

.global shdwChangeMode
shdwChangeMode:
	.skip 0x8

.global shdwChanged
shdwChanged:
	.skip 0x8

.global FBSet
FBSet:
	.skip 0x8

.global Initialized
Initialized:
	.skip 0x4

.global EnabledBits
EnabledBits:
	.skip 0x4

.global ResettingBits
ResettingBits:
	.skip 0x4

.global RecalibrateBits
RecalibrateBits:
	.skip 0x4

.global WaitingBits
WaitingBits:
	.skip 0x4

.global CheckingBits
CheckingBits:
	.skip 0x4

.global PendingBits
PendingBits:
	.skip 0x4

.global SamplingCallback
SamplingCallback:
	.skip 0x4

.global "recalibrated$404"
"recalibrated$404":
	.skip 0x4

.global __PADSpec
__PADSpec:
	.skip 0x4

.global __AIS_Callback
__AIS_Callback:
	.skip 0x4

.global __AID_Callback
__AID_Callback:
	.skip 0x4

.global __CallbackStack
__CallbackStack:
	.skip 0x4

.global __OldStack
__OldStack:
	.skip 0x4

.global __AI_init_flag
__AI_init_flag:
	.skip 0x8

.global bound_32KHz
bound_32KHz:
	.skip 0x8

.global bound_48KHz
bound_48KHz:
	.skip 0x8

.global min_wait
min_wait:
	.skip 0x8

.global max_wait
max_wait:
	.skip 0x8

.global buffer
buffer:
	.skip 0x8

.global __AR_Callback
__AR_Callback:
	.skip 0x4

.global __AR_Size
__AR_Size:
	.skip 0x4

.global __AR_StackPointer
__AR_StackPointer:
	.skip 0x4

.global __AR_FreeBlocks
__AR_FreeBlocks:
	.skip 0x4

.global __AR_BlockLength
__AR_BlockLength:
	.skip 0x4

.global __AR_init_flag
__AR_init_flag:
	.skip 0x4

.global __ARQRequestQueueHi
__ARQRequestQueueHi:
	.skip 0x4

.global __ARQRequestTailHi
__ARQRequestTailHi:
	.skip 0x4

.global __ARQRequestQueueLo
__ARQRequestQueueLo:
	.skip 0x4

.global __ARQRequestTailLo
__ARQRequestTailLo:
	.skip 0x4

.global __ARQRequestPendingHi
__ARQRequestPendingHi:
	.skip 0x4

.global __ARQRequestPendingLo
__ARQRequestPendingLo:
	.skip 0x4

.global __ARQCallbackHi
__ARQCallbackHi:
	.skip 0x4

.global __ARQCallbackLo
__ARQCallbackLo:
	.skip 0x4

.global __ARQChunkSize
__ARQChunkSize:
	.skip 0x4

.global __ARQ_init_flag
__ARQ_init_flag:
	.skip 0x4

.global __DSP_init_flag
__DSP_init_flag:
	.skip 0x8

.global __DSP_rude_task_pending
__DSP_rude_task_pending:
	.skip 0x4

.global __DSP_rude_task
__DSP_rude_task:
	.skip 0x4

.global __DSP_tmp_task
__DSP_tmp_task:
	.skip 0x4

.global __DSP_last_task
__DSP_last_task:
	.skip 0x4

.global __DSP_first_task
__DSP_first_task:
	.skip 0x4

.global __DSP_curr_task
__DSP_curr_task:
	.skip 0x4

.global __piReg
__piReg:
	.skip 0x4

.global __cpReg
__cpReg:
	.skip 0x4

.global __peReg
__peReg:
	.skip 0x4

.global __memReg
__memReg:
	.skip 0x4

.global CPUFifo
CPUFifo:
	.skip 0x4

.global GPFifo
GPFifo:
	.skip 0x4

.global __GXCurrentThread
__GXCurrentThread:
	.skip 0x4

.global CPGPLinked
CPGPLinked:
	.skip 0x4

.global GXOverflowSuspendInProgress
GXOverflowSuspendInProgress:
	.skip 0x4

.global BreakPointCB
BreakPointCB:
	.skip 0x4

.global __GXOverflowCount
__GXOverflowCount:
	.skip 0x8

.global TokenCB
TokenCB:
	.skip 0x4

.global DrawDoneCB
DrawDoneCB:
	.skip 0x4

.global DrawDone
DrawDone:
	.skip 0x4

.global FinishQueue
FinishQueue:
	.skip 0xC