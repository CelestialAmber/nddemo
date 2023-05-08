.include "macros.s"

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80 ; 0x0003B8C0


.global gTRKEventQueue
gTRKEventQueue:
	.skip 0x28

.global gTRKBigEndian
gTRKBigEndian:
	.skip 0x4

.skip 4

.global gTRKMsgBufs
gTRKMsgBufs:
	.skip 0x19B0

.global gTRKFramingState
gTRKFramingState:
	.skip 0x14

.global gTRKInputPendingPtr
gTRKInputPendingPtr:
	.skip 0x4

.global gTRKDispatchTableSize
gTRKDispatchTableSize:
	.skip 0x4

.skip 4

.global TRK_saved_exceptionID
TRK_saved_exceptionID:
	.skip 0x2

.skip 2

.global gTRKSaveState
gTRKSaveState:
	.skip 0x94

.global TRKvalue128_temp
TRKvalue128_temp:
	.skip 0x10

.global gTRKState
gTRKState:
	.skip 0xA4

.skip 4

.global gTRKCPUState
gTRKCPUState:
	.skip 0x430

.global lc_base
lc_base:
	.skip 0x4

.skip 4

.global TRK_mainError
TRK_mainError:
	.skip 0x4

.skip 4

.global fragmentinfo
fragmentinfo:
	.skip 0xC

.skip 4

.global atexit_funcs
atexit_funcs:
	.skip 0x100

.global __atexit_funcs
__atexit_funcs:
	.skip 0x100
