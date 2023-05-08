.include "macros.s"

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80 ; 0x0003B8C0

OSErrorTable:
	.skip 0x40

Ecb:
	.skip 0xA8

.skip 24

Header:
	.skip 0x20

Scb:
	.skip 0x54

.skip 4

Packet:
	.skip 0x80

Alarm:
	.skip 0xA0

TypeTime:
	.skip 0x20

XferTime:
	.skip 0x20

TypeCallback:
	.skip 0x40

RDSTHandler:
	.skip 0x10

InputBufferValid:
	.skip 0x10

InputBuffer:
	.skip 0x20

"cmdFixDevice$329":
	.skip 0x10

RunQueue:
	.skip 0x100

IdleThread:
	.skip 0x310

DefaultThread:
	.skip 0x310

IdleContext:
	.skip 0x2C8

CommandList:
	.skip 0x3C

AlarmForWA:
	.skip 0x28

AlarmForTimeout:
	.skip 0x28

AlarmForBreak:
	.skip 0x28

Prev:
	.skip 0xC

Curr:
	.skip 0xC

tmpBuffer:
	.skip 0x80

DummyCommandBlock:
	.skip 0x30

ResetAlarm:
	.skip 0x28

WaitingQueue:
	.skip 0x20

bb2Buf:
	.skip 0x40

"block$16":
	.skip 0x30

regs:
	.skip 0x76

.skip 2

shdwRegs:
	.skip 0x76

.skip 2

HorVer:
	.skip 0x58

Type:
	.skip 0x10

Origin:
	.skip 0x40

gxData:
	.skip 0x4F4

.global FifoObj
FifoObj:
	.skip 0x80

.skip 4