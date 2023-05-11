.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global GXCallDisplayList
GXCallDisplayList:
/* 80040954 0003C8D4  7C 08 02 A6 */	mflr r0
/* 80040958 0003C8D8  90 01 00 04 */	stw r0, 0x4(r1)
/* 8004095C 0003C8DC  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80040960 0003C8E0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80040964 0003C8E4  3B E4 00 00 */	addi r31, r4, 0x0
/* 80040968 0003C8E8  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8004096C 0003C8EC  3B C3 00 00 */	addi r30, r3, 0x0
/* 80040970 0003C8F0  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 80040974 0003C8F4  80 05 04 F0 */	lwz r0, 0x4f0(r5)
/* 80040978 0003C8F8  28 00 00 00 */	cmplwi r0, 0x0
/* 8004097C 0003C8FC  41 82 00 08 */	beq .L_80040984
/* 80040980 0003C900  4B FF C3 65 */	bl __GXSetDirtyState
.L_80040984:
/* 80040984 0003C904  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040988 0003C908  80 03 00 00 */	lwz r0, 0x0(r3)
/* 8004098C 0003C90C  28 00 00 00 */	cmplwi r0, 0x0
/* 80040990 0003C910  40 82 00 08 */	bne .L_80040998
/* 80040994 0003C914  4B FF C4 B9 */	bl __GXSendFlushPrim
.L_80040998:
/* 80040998 0003C918  38 00 00 40 */	li r0, 0x40
/* 8004099C 0003C91C  3C 60 CC 01 */	lis r3, 0xCC008000@ha
/* 800409A0 0003C920  98 03 80 00 */	stb r0, 0xCC008000@l(r3)
/* 800409A4 0003C924  93 C3 80 00 */	stw r30, -0x8000(r3)
/* 800409A8 0003C928  93 E3 80 00 */	stw r31, -0x8000(r3)
/* 800409AC 0003C92C  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800409B0 0003C930  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800409B4 0003C934  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800409B8 0003C938  38 21 00 18 */	addi r1, r1, 0x18
/* 800409BC 0003C93C  7C 08 03 A6 */	mtlr r0
/* 800409C0 0003C940  4E 80 00 20 */	blr
