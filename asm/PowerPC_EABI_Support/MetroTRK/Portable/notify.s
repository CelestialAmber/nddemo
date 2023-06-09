.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn TRKDoNotifyStopped, global
/* 8005CECC 00058E4C  7C 08 02 A6 */	mflr r0
/* 8005CED0 00058E50  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005CED4 00058E54  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8005CED8 00058E58  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8005CEDC 00058E5C  38 81 00 0C */	addi r4, r1, 0xc
/* 8005CEE0 00058E60  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8005CEE4 00058E64  3B C3 00 00 */	addi r30, r3, 0x0
/* 8005CEE8 00058E68  38 61 00 08 */	addi r3, r1, 0x8
/* 8005CEEC 00058E6C  4B FF DE 7D */	bl TRKGetFreeBuffer
/* 8005CEF0 00058E70  7C 7F 1B 79 */	mr. r31, r3
/* 8005CEF4 00058E74  40 82 00 94 */	bne .L_8005CF88
/* 8005CEF8 00058E78  80 A1 00 0C */	lwz r5, 0xc(r1)
/* 8005CEFC 00058E7C  80 65 00 0C */	lwz r3, 0xc(r5)
/* 8005CF00 00058E80  28 03 08 80 */	cmplwi r3, 0x880
/* 8005CF04 00058E84  41 80 00 0C */	blt .L_8005CF10
/* 8005CF08 00058E88  38 80 03 01 */	li r4, 0x301
/* 8005CF0C 00058E8C  48 00 00 24 */	b .L_8005CF30
.L_8005CF10:
/* 8005CF10 00058E90  38 03 00 01 */	addi r0, r3, 0x1
/* 8005CF14 00058E94  7C 65 1A 14 */	add r3, r5, r3
/* 8005CF18 00058E98  90 05 00 0C */	stw r0, 0xc(r5)
/* 8005CF1C 00058E9C  38 80 00 00 */	li r4, 0x0
/* 8005CF20 00058EA0  9B C3 00 10 */	stb r30, 0x10(r3)
/* 8005CF24 00058EA4  80 65 00 08 */	lwz r3, 0x8(r5)
/* 8005CF28 00058EA8  38 03 00 01 */	addi r0, r3, 0x1
/* 8005CF2C 00058EAC  90 05 00 08 */	stw r0, 0x8(r5)
.L_8005CF30:
/* 8005CF30 00058EB0  2C 04 00 00 */	cmpwi r4, 0x0
/* 8005CF34 00058EB4  40 82 00 24 */	bne .L_8005CF58
/* 8005CF38 00058EB8  57 C0 06 3E */	clrlwi r0, r30, 24
/* 8005CF3C 00058EBC  28 00 00 90 */	cmplwi r0, 0x90
/* 8005CF40 00058EC0  40 82 00 10 */	bne .L_8005CF50
/* 8005CF44 00058EC4  80 61 00 0C */	lwz r3, 0xc(r1)
/* 8005CF48 00058EC8  48 00 0F 55 */	bl TRKTargetAddStopInfo
/* 8005CF4C 00058ECC  48 00 00 0C */	b .L_8005CF58
.L_8005CF50:
/* 8005CF50 00058ED0  80 61 00 0C */	lwz r3, 0xc(r1)
/* 8005CF54 00058ED4  48 00 0F D9 */	bl TRKTargetAddExceptionInfo
.L_8005CF58:
/* 8005CF58 00058ED8  80 61 00 0C */	lwz r3, 0xc(r1)
/* 8005CF5C 00058EDC  38 81 00 10 */	addi r4, r1, 0x10
/* 8005CF60 00058EE0  38 A0 00 02 */	li r5, 0x2
/* 8005CF64 00058EE4  38 C0 00 03 */	li r6, 0x3
/* 8005CF68 00058EE8  38 E0 00 01 */	li r7, 0x1
/* 8005CF6C 00058EEC  4B FF FD A5 */	bl TRKRequestSend
/* 8005CF70 00058EF0  7C 7F 1B 79 */	mr. r31, r3
/* 8005CF74 00058EF4  40 82 00 0C */	bne .L_8005CF80
/* 8005CF78 00058EF8  80 61 00 10 */	lwz r3, 0x10(r1)
/* 8005CF7C 00058EFC  4B FF DE B5 */	bl TRKReleaseBuffer
.L_8005CF80:
/* 8005CF80 00058F00  80 61 00 08 */	lwz r3, 0x8(r1)
/* 8005CF84 00058F04  4B FF DE AD */	bl TRKReleaseBuffer
.L_8005CF88:
/* 8005CF88 00058F08  7F E3 FB 78 */	mr r3, r31
/* 8005CF8C 00058F0C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8005CF90 00058F10  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8005CF94 00058F14  38 21 00 20 */	addi r1, r1, 0x20
/* 8005CF98 00058F18  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005CF9C 00058F1C  7C 08 03 A6 */	mtlr r0
/* 8005CFA0 00058F20  4E 80 00 20 */	blr
.endfn TRKDoNotifyStopped
