.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

OnReset:
/* 8002B844 000277C4  7C 08 02 A6 */	mflr r0
/* 8002B848 000277C8  2C 03 00 00 */	cmpwi r3, 0x0
/* 8002B84C 000277CC  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002B850 000277D0  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8002B854 000277D4  41 82 00 18 */	beq .L_8002B86C
/* 8002B858 000277D8  3C 60 CC 00 */	lis r3, 0xCC004010@ha
/* 8002B85C 000277DC  38 00 00 FF */	li r0, 0xff
/* 8002B860 000277E0  B0 03 40 10 */	sth r0, 0xCC004010@l(r3)
/* 8002B864 000277E4  3C 60 F0 00 */	lis r3, 0xf000
/* 8002B868 000277E8  4B FF FB 45 */	bl __OSMaskInterrupts
.L_8002B86C:
/* 8002B86C 000277EC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8002B870 000277F0  38 60 00 01 */	li r3, 0x1
/* 8002B874 000277F4  38 21 00 08 */	addi r1, r1, 0x8
/* 8002B878 000277F8  7C 08 03 A6 */	mtlr r0
/* 8002B87C 000277FC  4E 80 00 20 */	blr

MEMIntrruptHandler:
/* 8002B880 00027800  7C 08 02 A6 */	mflr r0
/* 8002B884 00027804  3C 60 CC 00 */	lis r3, 0xCC004000@ha
/* 8002B888 00027808  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002B88C 0002780C  39 03 40 00 */	addi r8, r3, 0xCC004000@l
/* 8002B890 00027810  38 00 00 00 */	li r0, 0x0
/* 8002B894 00027814  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8002B898 00027818  A0 E3 40 24 */	lhz r7, 0x4024(r3)
/* 8002B89C 0002781C  A0 C3 40 22 */	lhz r6, 0x4022(r3)
/* 8002B8A0 00027820  A0 A3 40 1E */	lhz r5, 0x401e(r3)
/* 8002B8A4 00027824  50 E6 81 9E */	rlwimi r6, r7, 16, 6, 15
/* 8002B8A8 00027828  38 60 00 0F */	li r3, 0xf
/* 8002B8AC 0002782C  B0 08 00 20 */	sth r0, 0x20(r8)
/* 8002B8B0 00027830  4B FF E4 FD */	bl __OSUnhandledException
/* 8002B8B4 00027834  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8002B8B8 00027838  38 21 00 08 */	addi r1, r1, 0x8
/* 8002B8BC 0002783C  7C 08 03 A6 */	mtlr r0
/* 8002B8C0 00027840  4E 80 00 20 */	blr

.global __OSInitMemoryProtection
__OSInitMemoryProtection:
/* 8002B8C4 00027844  7C 08 02 A6 */	mflr r0
/* 8002B8C8 00027848  3C 60 CC 00 */	lis r3, 0xCC004000@ha
/* 8002B8CC 0002784C  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002B8D0 00027850  38 00 00 00 */	li r0, 0x0
/* 8002B8D4 00027854  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8002B8D8 00027858  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 8002B8DC 0002785C  93 C1 00 28 */	stw r30, 0x28(r1)
/* 8002B8E0 00027860  3B C3 40 00 */	addi r30, r3, 0xCC004000@l
/* 8002B8E4 00027864  B0 03 40 20 */	sth r0, 0x4020(r3)
/* 8002B8E8 00027868  38 00 00 FF */	li r0, 0xff
/* 8002B8EC 0002786C  3C 60 F0 00 */	lis r3, 0xf000
/* 8002B8F0 00027870  B0 1E 00 10 */	sth r0, 0x10(r30)
/* 8002B8F4 00027874  4B FF FA B9 */	bl __OSMaskInterrupts
/* 8002B8F8 00027878  3C 60 80 03 */	lis r3, MEMIntrruptHandler@ha
/* 8002B8FC 0002787C  3B E3 B8 80 */	addi r31, r3, MEMIntrruptHandler@l
/* 8002B900 00027880  38 9F 00 00 */	addi r4, r31, 0x0
/* 8002B904 00027884  38 60 00 00 */	li r3, 0x0
/* 8002B908 00027888  4B FF F7 29 */	bl __OSSetInterruptHandler
/* 8002B90C 0002788C  38 9F 00 00 */	addi r4, r31, 0x0
/* 8002B910 00027890  38 60 00 01 */	li r3, 0x1
/* 8002B914 00027894  4B FF F7 1D */	bl __OSSetInterruptHandler
/* 8002B918 00027898  38 9F 00 00 */	addi r4, r31, 0x0
/* 8002B91C 0002789C  38 60 00 02 */	li r3, 0x2
/* 8002B920 000278A0  4B FF F7 11 */	bl __OSSetInterruptHandler
/* 8002B924 000278A4  38 9F 00 00 */	addi r4, r31, 0x0
/* 8002B928 000278A8  38 60 00 03 */	li r3, 0x3
/* 8002B92C 000278AC  4B FF F7 05 */	bl __OSSetInterruptHandler
/* 8002B930 000278B0  38 9F 00 00 */	addi r4, r31, 0x0
/* 8002B934 000278B4  38 60 00 04 */	li r3, 0x4
/* 8002B938 000278B8  4B FF F6 F9 */	bl __OSSetInterruptHandler
/* 8002B93C 000278BC  3C 60 80 07 */	lis r3, ResetFunctionInfo@ha
/* 8002B940 000278C0  38 63 81 38 */	addi r3, r3, ResetFunctionInfo@l
/* 8002B944 000278C4  48 00 02 D5 */	bl OSRegisterResetFunction
/* 8002B948 000278C8  3C 60 80 00 */	lis r3, 0x800000F0@ha
/* 8002B94C 000278CC  80 83 00 F0 */	lwz r4, 0x800000F0@l(r3)
/* 8002B950 000278D0  80 03 00 28 */	lwz r0, 0x28(r3)
/* 8002B954 000278D4  7C 04 00 40 */	cmplw r4, r0
/* 8002B958 000278D8  40 80 00 18 */	bge .L_8002B970
/* 8002B95C 000278DC  3C 04 FE 80 */	addis r0, r4, 0xfe80
/* 8002B960 000278E0  28 00 00 00 */	cmplwi r0, 0x0
/* 8002B964 000278E4  40 82 00 0C */	bne .L_8002B970
/* 8002B968 000278E8  38 00 00 02 */	li r0, 0x2
/* 8002B96C 000278EC  B0 1E 00 28 */	sth r0, 0x28(r30)
.L_8002B970:
/* 8002B970 000278F0  3C 60 08 00 */	lis r3, 0x800
/* 8002B974 000278F4  4B FF FA C1 */	bl __OSUnmaskInterrupts
/* 8002B978 000278F8  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8002B97C 000278FC  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 8002B980 00027900  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 8002B984 00027904  7C 08 03 A6 */	mtlr r0
/* 8002B988 00027908  38 21 00 30 */	addi r1, r1, 0x30
/* 8002B98C 0002790C  4E 80 00 20 */	blr

.section .data, "wa"  # 0x80065000 - 0x8006D1C0

ResetFunctionInfo:
	.4byte OnReset
	.4byte 0x0000007F
	.4byte 0
	.4byte 0
