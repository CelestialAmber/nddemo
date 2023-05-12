.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn TRKInitializeDispatcher, global
/* 8005B6FC 0005767C  3C 60 80 0B */	lis r3, gTRKDispatchTableSize@ha
/* 8005B700 00057680  38 00 00 20 */	li r0, 0x20
/* 8005B704 00057684  90 03 82 D8 */	stw r0, gTRKDispatchTableSize@l(r3)
/* 8005B708 00057688  38 60 00 00 */	li r3, 0x0
/* 8005B70C 0005768C  4E 80 00 20 */	blr
.endfn TRKInitializeDispatcher

.fn TRKDispatchMessage, global
/* 8005B710 00057690  7C 08 02 A6 */	mflr r0
/* 8005B714 00057694  38 80 00 00 */	li r4, 0x0
/* 8005B718 00057698  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005B71C 0005769C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8005B720 000576A0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8005B724 000576A4  3B E0 05 00 */	li r31, 0x500
/* 8005B728 000576A8  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8005B72C 000576AC  3B C3 00 00 */	addi r30, r3, 0x0
/* 8005B730 000576B0  4B FF F7 A9 */	bl TRKSetBufferPosition
/* 8005B734 000576B4  38 7E 00 00 */	addi r3, r30, 0x0
/* 8005B738 000576B8  38 81 00 08 */	addi r4, r1, 0x8
/* 8005B73C 000576BC  4B FF FB 21 */	bl TRKReadBuffer1_ui8
/* 8005B740 000576C0  3C 60 80 0B */	lis r3, gTRKDispatchTableSize@ha
/* 8005B744 000576C4  88 81 00 08 */	lbz r4, 0x8(r1)
/* 8005B748 000576C8  80 03 82 D8 */	lwz r0, gTRKDispatchTableSize@l(r3)
/* 8005B74C 000576CC  7C 04 00 40 */	cmplw r4, r0
/* 8005B750 000576D0  40 80 00 28 */	bge .L_8005B778
/* 8005B754 000576D4  3C 60 80 07 */	lis r3, gTRKDispatchTable@ha
/* 8005B758 000576D8  54 84 10 3A */	slwi r4, r4, 2
/* 8005B75C 000576DC  38 03 CD 60 */	addi r0, r3, gTRKDispatchTable@l
/* 8005B760 000576E0  7C 60 22 14 */	add r3, r0, r4
/* 8005B764 000576E4  81 83 00 00 */	lwz r12, 0x0(r3)
/* 8005B768 000576E8  38 7E 00 00 */	addi r3, r30, 0x0
/* 8005B76C 000576EC  7D 88 03 A6 */	mtlr r12
/* 8005B770 000576F0  4E 80 00 21 */	blrl
/* 8005B774 000576F4  7C 7F 1B 78 */	mr r31, r3
.L_8005B778:
/* 8005B778 000576F8  7F E3 FB 78 */	mr r3, r31
/* 8005B77C 000576FC  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8005B780 00057700  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8005B784 00057704  38 21 00 18 */	addi r1, r1, 0x18
/* 8005B788 00057708  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005B78C 0005770C  7C 08 03 A6 */	mtlr r0
/* 8005B790 00057710  4E 80 00 20 */	blr
.endfn TRKDispatchMessage

.section .data, "wa"  # 0x80065000 - 0x8006D1C0

.balign 8


.obj gTRKDispatchTable, global
	.4byte TRKDoUnsupported
	.4byte TRKDoConnect
	.4byte TRKDoDisconnect
	.4byte TRKDoReset
	.4byte TRKDoVersions
	.4byte TRKDoSupportMask
	.4byte TRKDoCPUType
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoReadMemory
	.4byte TRKDoWriteMemory
	.4byte TRKDoReadRegisters
	.4byte TRKDoWriteRegisters
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoFlushCache
	.4byte TRKDoUnsupported
	.4byte TRKDoContinue
	.4byte TRKDoStep
	.4byte TRKDoStop
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte 0
.endobj gTRKDispatchTable

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80

.balign 8

.obj gTRKDispatchTableSize, global
	.skip 0x4
.endobj gTRKDispatchTableSize

.skip 4
