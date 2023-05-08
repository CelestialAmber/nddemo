.include "macros.s"

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80 ; 0x0003B8C0

.global OSErrorTable
OSErrorTable:
	.skip 0x40

.global Ecb
Ecb:
	.skip 0xC0

#.skip 24

.global Header
Header:
	.skip 0x20

.global Scb
Scb:
	.skip 0x58

#.skip 4

.global Packet
Packet:
	.skip 0x80

.global Alarm
Alarm:
	.skip 0xA0

.global TypeTime
TypeTime:
	.skip 0x20

.global XferTime
XferTime:
	.skip 0x20

.global TypeCallback
TypeCallback:
	.skip 0x40

.global RDSTHandler
RDSTHandler:
	.skip 0x10

.global InputBufferValid
InputBufferValid:
	.skip 0x10

.global InputBuffer
InputBuffer:
	.skip 0x20

.global "cmdFixDevice$329"
"cmdFixDevice$329":
	.skip 0x10

.global RunQueue
RunQueue:
	.skip 0x100

.global IdleThread
IdleThread:
	.skip 0x310

.global DefaultThread
DefaultThread:
	.skip 0x310

.global IdleContext
IdleContext:
	.skip 0x2C8

.global CommandList
CommandList:
	.skip 0x3C

.global AlarmForWA
AlarmForWA:
	.skip 0x28

.global AlarmForTimeout
AlarmForTimeout:
	.skip 0x28

.global AlarmForBreak
AlarmForBreak:
	.skip 0x28

Prev:
	.skip 0xC

Curr:
	.skip 0xC

.global tmpBuffer
tmpBuffer:
	.skip 0x80

.global DummyCommandBlock
DummyCommandBlock:
	.skip 0x30

.global ResetAlarm
ResetAlarm:
	.skip 0x28

.global WaitingQueue
WaitingQueue:
	.skip 0x20

.global bb2Buf
bb2Buf:
	.skip 0x40

.global "block$16"
"block$16":
	.skip 0x30

.global regs
regs:
	.skip 0x76

.skip 2

.global shdwRegs
shdwRegs:
	.skip 0x76

.skip 2

.global HorVer
HorVer:
	.skip 0x58

.global Type
Type:
	.skip 0x10

.global Origin
Origin:
	.skip 0x40

.global gxData
gxData:
	.skip 0x4F4

.global FifoObj
FifoObj:
	.skip 0x80

.skip 4