.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn __OSUnlockAllMutex, global
/* 8002B990 00027910  7C 08 02 A6 */	mflr r0
/* 8002B994 00027914  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002B998 00027918  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8002B99C 0002791C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8002B9A0 00027920  3B E0 00 00 */	li r31, 0x0
/* 8002B9A4 00027924  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8002B9A8 00027928  3B C3 00 00 */	addi r30, r3, 0x0
/* 8002B9AC 0002792C  48 00 00 30 */	b .L_8002B9DC
.L_8002B9B0:
/* 8002B9B0 00027930  80 A4 00 10 */	lwz r5, 0x10(r4)
/* 8002B9B4 00027934  38 64 00 00 */	addi r3, r4, 0x0
/* 8002B9B8 00027938  28 05 00 00 */	cmplwi r5, 0x0
/* 8002B9BC 0002793C  40 82 00 0C */	bne .L_8002B9C8
/* 8002B9C0 00027940  93 FE 02 F8 */	stw r31, 0x2f8(r30)
/* 8002B9C4 00027944  48 00 00 08 */	b .L_8002B9CC
.L_8002B9C8:
/* 8002B9C8 00027948  93 E5 00 14 */	stw r31, 0x14(r5)
.L_8002B9CC:
/* 8002B9CC 0002794C  90 BE 02 F4 */	stw r5, 0x2f4(r30)
/* 8002B9D0 00027950  93 E4 00 0C */	stw r31, 0xc(r4)
/* 8002B9D4 00027954  93 E4 00 08 */	stw r31, 0x8(r4)
/* 8002B9D8 00027958  48 00 39 79 */	bl OSWakeupThread
.L_8002B9DC:
/* 8002B9DC 0002795C  80 9E 02 F4 */	lwz r4, 0x2f4(r30)
/* 8002B9E0 00027960  28 04 00 00 */	cmplwi r4, 0x0
/* 8002B9E4 00027964  40 82 FF CC */	bne .L_8002B9B0
/* 8002B9E8 00027968  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8002B9EC 0002796C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8002B9F0 00027970  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8002B9F4 00027974  7C 08 03 A6 */	mtlr r0
/* 8002B9F8 00027978  38 21 00 18 */	addi r1, r1, 0x18
/* 8002B9FC 0002797C  4E 80 00 20 */	blr
.endfn __OSUnlockAllMutex
