.include "macros.s"

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380 ; 0x000005C0

BootInfo:
	.skip 0x4

BI2DebugFlag:
	.skip 0x4

AreWeInitialized:
	.skip 0x4

OSExceptionTable:
	.skip 0x4

.global __OSStartTime
__OSStartTime:
	.skip 0x8

AlarmQueue:
	.skip 0x8

HeapArray:
	.skip 0x4

NumHeaps:
	.skip 0x4

ArenaStart:
	.skip 0x4

ArenaEnd:
	.skip 0x4

__OSArenaHi:
	.skip 0x8

InterruptHandlerTable:
	.skip 0x8

SaveStart:
	.skip 0x4

SaveEnd:
	.skip 0x4

Prepared:
	.skip 0x8

ResetFunctionQueue:
	.skip 0x8

ResetCallback:
	.skip 0x4

Down:
	.skip 0x4

.global LastState
LastState:
	.skip 0x8

HoldUp:
	.skip 0x8

HoldDown:
	.skip 0x8

"cmdTypeAndStatus$75":
	.skip 0x4

"cmdTypeAndStatus$374":
	.skip 0x4

.global SIDelay
SIDelay:
	.skip 0x8

.global __PADFixBits
__PADFixBits:
	.skip 0x8

RunQueueBits:
	.skip 0x4

RunQueueHint:
	.skip 0x4

Reschedule:
	.skip 0x8

serEnabled:
	.skip 0x8

.global __DBInterface
__DBInterface:
	.skip 0x4

.global DBVerbose
DBVerbose:
	.skip 0x4

StopAtNextInt:
	.skip 0x4

LastLength:
	.skip 0x4

Callback:
	.skip 0x4

ResetCoverCallback:
	.skip 0x4

LastResetEnd:
	.skip 0x8

ResetOccurred:
	.skip 0x4

WaitingCoverClose:
	.skip 0x4

Breaking:
	.skip 0x4

WorkAroundType:
	.skip 0x4

WorkAroundSeekLocation:
	.skip 0x8

LastReadFinished:
	.skip 0x8

LastReadIssued:
	.skip 0x8

LastCommandWasRead:
	.skip 0x4

NextCommandNumber:
	.skip 0x4

BootInfo:
	.skip 0x4

FstStart:
	.skip 0x4

FstStringStart:
	.skip 0x4

MaxEntryNum:
	.skip 0x4

currentDirectory:
	.skip 0x4

.global __DVDLongFileNameFlag
__DVDLongFileNameFlag:
	.skip 0x4

.global __DVDThreadQueue
__DVDThreadQueue:
	.skip 0x8

executing:
	.skip 0x4

currID:
	.skip 0x4

bootInfo:
	.skip 0x4

PauseFlag:
	.skip 0x4

PausingFlag:
	.skip 0x4

AutoFinishing:
	.skip 0x4

FatalErrorFlag:
	.skip 0x4

CurrCommand:
	.skip 0x4

Canceling:
	.skip 0x4

CancelCallback:
	.skip 0x4

ResumeFromHere:
	.skip 0x4

CancelLastError:
	.skip 0x4

LastError:
	.skip 0x4

NumInternalRetry:
	.skip 0x4

ResetRequired:
	.skip 0x4

FirstTimeInBootrom:
	.skip 0x4

DVDInitialized:
	.skip 0x4

.global LastState
LastState:
	.skip 0x4

status:
	.skip 0x4

bb2:
	.skip 0x4

idTmp:
	.skip 0x8

retraceCount:
	.skip 0x4

flushFlag:
	.skip 0x4

retraceQueue:
	.skip 0x8

PreCB:
	.skip 0x4

PostCB:
	.skip 0x4

encoderType:
	.skip 0x4

displayOffsetH:
	.skip 0x2

displayOffsetV:
	.skip 0x2

changeMode:
	.skip 0x8

changed:
	.skip 0x8

shdwChangeMode:
	.skip 0x8

shdwChanged:
	.skip 0x8

FBSet:
	.skip 0x8

Initialized:
	.skip 0x4

EnabledBits:
	.skip 0x4

ResettingBits:
	.skip 0x4

RecalibrateBits:
	.skip 0x4

WaitingBits:
	.skip 0x4

CheckingBits:
	.skip 0x4

PendingBits:
	.skip 0x4

SamplingCallback:
	.skip 0x4

"recalibrated$404":
	.skip 0x4

.global __PADSpec
__PADSpec:
	.skip 0x4

__AIS_Callback:
	.skip 0x4

__AID_Callback:
	.skip 0x4

__CallbackStack:
	.skip 0x4

__OldStack:
	.skip 0x4

__AI_init_flag:
	.skip 0x8

bound_32KHz:
	.skip 0x8

bound_48KHz:
	.skip 0x8

min_wait:
	.skip 0x8

max_wait:
	.skip 0x8

buffer:
	.skip 0x8

__AR_Callback:
	.skip 0x4

__AR_Size:
	.skip 0x4

__AR_StackPointer:
	.skip 0x4

__AR_FreeBlocks:
	.skip 0x4

__AR_BlockLength:
	.skip 0x4

__AR_init_flag:
	.skip 0x4

__ARQRequestQueueHi:
	.skip 0x4

__ARQRequestTailHi:
	.skip 0x4

__ARQRequestQueueLo:
	.skip 0x4

__ARQRequestTailLo:
	.skip 0x4

__ARQRequestPendingHi:
	.skip 0x4

__ARQRequestPendingLo:
	.skip 0x4

__ARQCallbackHi:
	.skip 0x4

__ARQCallbackLo:
	.skip 0x4

__ARQChunkSize:
	.skip 0x4

__ARQ_init_flag:
	.skip 0x4

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

CPUFifo:
	.skip 0x4

GPFifo:
	.skip 0x4

__GXCurrentThread:
	.skip 0x4

CPGPLinked:
	.skip 0x4

GXOverflowSuspendInProgress:
	.skip 0x4

BreakPointCB:
	.skip 0x4

__GXOverflowCount:
	.skip 0x8

TokenCB:
	.skip 0x4

DrawDoneCB:
	.skip 0x4

DrawDone:
	.skip 0x4

FinishQueue:
	.skip 0xC