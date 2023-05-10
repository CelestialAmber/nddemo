.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740


.global mAlloc__FUl
mAlloc__FUl:
/* 800129F8 0000E978  7C 08 02 A6 */	mflr r0
/* 800129FC 0000E97C  3C 80 80 06 */	lis r4, lbl_800662A0@ha
/* 80012A00 0000E980  90 01 00 04 */	stw r0, 0x4(r1)
/* 80012A04 0000E984  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80012A08 0000E988  BF 61 00 14 */	stmw r27, 0x14(r1)
/* 80012A0C 0000E98C  3B E4 62 A0 */	addi r31, r4, lbl_800662A0@l
/* 80012A10 0000E990  3B 63 00 00 */	addi r27, r3, 0x0
/* 80012A14 0000E994  48 01 BB 5D */	bl OSGetCurrentThread
/* 80012A18 0000E998  7C 7D 1B 78 */	mr r29, r3
/* 80012A1C 0000E99C  48 01 CA F9 */	bl OSGetThreadPriority
/* 80012A20 0000E9A0  3B 83 00 00 */	addi r28, r3, 0x0
/* 80012A24 0000E9A4  38 7D 00 00 */	addi r3, r29, 0x0
/* 80012A28 0000E9A8  38 80 00 0F */	li r4, 0xf
/* 80012A2C 0000E9AC  48 01 CA 29 */	bl OSSetThreadPriority
/* 80012A30 0000E9B0  38 60 00 00 */	li r3, 0x0
/* 80012A34 0000E9B4  38 9B 00 00 */	addi r4, r27, 0x0
/* 80012A38 0000E9B8  48 01 5C 51 */	bl OSAllocFromHeap
/* 80012A3C 0000E9BC  7C 7E 1B 79 */	mr. r30, r3
/* 80012A40 0000E9C0  40 82 00 34 */	bne .L_80012A74
/* 80012A44 0000E9C4  38 60 00 00 */	li r3, 0x0
/* 80012A48 0000E9C8  48 01 5E A5 */	bl OSCheckHeap
/* 80012A4C 0000E9CC  38 83 00 00 */	addi r4, r3, 0x0
/* 80012A50 0000E9D0  4C C6 31 82 */	crclr 4*cr1+eq
/* 80012A54 0000E9D4  38 7F 00 00 */	addi r3, r31, 0x0
/* 80012A58 0000E9D8  38 BB 00 00 */	addi r5, r27, 0x0
/* 80012A5C 0000E9DC  48 01 71 89 */	bl OSReport
/* 80012A60 0000E9E0  38 7F 00 1C */	addi r3, r31, 0x1c
/* 80012A64 0000E9E4  4C C6 31 82 */	crclr 4*cr1+eq
/* 80012A68 0000E9E8  38 BF 00 28 */	addi r5, r31, 0x28
/* 80012A6C 0000E9EC  38 80 00 2D */	li r4, 0x2d
/* 80012A70 0000E9F0  48 01 71 F5 */	bl OSPanic
.L_80012A74:
/* 80012A74 0000E9F4  38 7D 00 00 */	addi r3, r29, 0x0
/* 80012A78 0000E9F8  38 9C 00 00 */	addi r4, r28, 0x0
/* 80012A7C 0000E9FC  48 01 C9 D9 */	bl OSSetThreadPriority
/* 80012A80 0000EA00  7F C3 F3 78 */	mr r3, r30
/* 80012A84 0000EA04  BB 61 00 14 */	lmw r27, 0x14(r1)
/* 80012A88 0000EA08  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80012A8C 0000EA0C  38 21 00 28 */	addi r1, r1, 0x28
/* 80012A90 0000EA10  7C 08 03 A6 */	mtlr r0
/* 80012A94 0000EA14  4E 80 00 20 */	blr

.global mFree__FPv
mFree__FPv:
/* 80012A98 0000EA18  7C 08 02 A6 */	mflr r0
/* 80012A9C 0000EA1C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80012AA0 0000EA20  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80012AA4 0000EA24  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80012AA8 0000EA28  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80012AAC 0000EA2C  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80012AB0 0000EA30  7C 7D 1B 78 */	mr r29, r3
/* 80012AB4 0000EA34  48 01 BA BD */	bl OSGetCurrentThread
/* 80012AB8 0000EA38  7C 7F 1B 78 */	mr r31, r3
/* 80012ABC 0000EA3C  48 01 CA 59 */	bl OSGetThreadPriority
/* 80012AC0 0000EA40  3B C3 00 00 */	addi r30, r3, 0x0
/* 80012AC4 0000EA44  38 7F 00 00 */	addi r3, r31, 0x0
/* 80012AC8 0000EA48  38 80 00 0F */	li r4, 0xf
/* 80012ACC 0000EA4C  48 01 C9 89 */	bl OSSetThreadPriority
/* 80012AD0 0000EA50  38 60 00 00 */	li r3, 0x0
/* 80012AD4 0000EA54  38 9D 00 00 */	addi r4, r29, 0x0
/* 80012AD8 0000EA58  48 01 5C AD */	bl OSFreeToHeap
/* 80012ADC 0000EA5C  38 7F 00 00 */	addi r3, r31, 0x0
/* 80012AE0 0000EA60  38 9E 00 00 */	addi r4, r30, 0x0
/* 80012AE4 0000EA64  48 01 C9 71 */	bl OSSetThreadPriority
/* 80012AE8 0000EA68  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80012AEC 0000EA6C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80012AF0 0000EA70  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80012AF4 0000EA74  7C 08 03 A6 */	mtlr r0
/* 80012AF8 0000EA78  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80012AFC 0000EA7C  38 21 00 20 */	addi r1, r1, 0x20
/* 80012B00 0000EA80  4E 80 00 20 */	blr

.section .data, "wa"  # 0x80065000 - 0x8006D1C0 ; 0x000081C0

lbl_800662A0:
	.asciz "Heap free %d blocksize %d\n"
	.balign 4
	.asciz "DUMacro.cpp"
	.asciz "No memory\n"
	.balign 4
	.4byte 0
