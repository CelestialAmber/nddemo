.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global DBInit
DBInit:
/* 8002F884 0002B804  3C 80 80 00 */	lis r4, 0x80000040@ha
/* 8002F888 0002B808  38 04 00 40 */	addi r0, r4, 0x80000040@l
/* 8002F88C 0002B80C  3C 60 80 03 */	lis r3, __DBExceptionDestination@ha
/* 8002F890 0002B810  90 0D 84 F0 */	stw r0, __DBInterface@sda21(r13)
/* 8002F894 0002B814  38 63 F8 F4 */	addi r3, r3, __DBExceptionDestination@l
/* 8002F898 0002B818  3C 03 80 00 */	addis r0, r3, 0x8000
/* 8002F89C 0002B81C  90 04 00 48 */	stw r0, 0x48(r4)
/* 8002F8A0 0002B820  38 00 00 01 */	li r0, 0x1
/* 8002F8A4 0002B824  90 0D 84 F4 */	stw r0, DBVerbose@sda21(r13)
/* 8002F8A8 0002B828  4E 80 00 20 */	blr

.global __DBExceptionDestinationAux
__DBExceptionDestinationAux:
/* 8002F8AC 0002B82C  7C 08 02 A6 */	mflr r0
/* 8002F8B0 0002B830  3C 60 80 07 */	lis r3, lbl_80068200@ha
/* 8002F8B4 0002B834  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002F8B8 0002B838  38 63 82 00 */	addi r3, r3, lbl_80068200@l
/* 8002F8BC 0002B83C  4C C6 31 82 */	crclr 4*cr1+eq
/* 8002F8C0 0002B840  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8002F8C4 0002B844  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8002F8C8 0002B848  80 80 00 C0 */	lwz r4, 0xc0(r0)
/* 8002F8CC 0002B84C  3F E4 80 00 */	addis r31, r4, 0x8000
/* 8002F8D0 0002B850  4B FF A3 15 */	bl OSReport
/* 8002F8D4 0002B854  7F E3 FB 78 */	mr r3, r31
/* 8002F8D8 0002B858  4B FF 9F 99 */	bl OSDumpContext
/* 8002F8DC 0002B85C  4B FF 7D E5 */	bl PPCHalt
/* 8002F8E0 0002B860  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8002F8E4 0002B864  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8002F8E8 0002B868  38 21 00 18 */	addi r1, r1, 0x18
/* 8002F8EC 0002B86C  7C 08 03 A6 */	mtlr r0
/* 8002F8F0 0002B870  4E 80 00 20 */	blr

.global __DBExceptionDestination
__DBExceptionDestination:
/* 8002F8F4 0002B874  7C 60 00 A6 */	mfmsr r3
/* 8002F8F8 0002B878  60 63 00 30 */	ori r3, r3, 0x30
/* 8002F8FC 0002B87C  7C 60 01 24 */	mtmsr r3
/* 8002F900 0002B880  4B FF FF AC */	b __DBExceptionDestinationAux

.global __DBIsExceptionMarked
__DBIsExceptionMarked:
/* 8002F904 0002B884  80 8D 84 F0 */	lwz r4, __DBInterface@sda21(r13)
/* 8002F908 0002B888  54 60 06 3E */	clrlwi r0, r3, 24
/* 8002F90C 0002B88C  38 60 00 01 */	li r3, 0x1
/* 8002F910 0002B890  80 84 00 04 */	lwz r4, 0x4(r4)
/* 8002F914 0002B894  7C 60 00 30 */	slw r0, r3, r0
/* 8002F918 0002B898  7C 83 00 38 */	and r3, r4, r0
/* 8002F91C 0002B89C  4E 80 00 20 */	blr

.global DBPrintf
DBPrintf:
/* 8002F920 0002B8A0  94 21 FF 90 */	stwu r1, -0x70(r1)
/* 8002F924 0002B8A4  40 86 00 24 */	bne cr1, .L_8002F948
/* 8002F928 0002B8A8  D8 21 00 28 */	stfd f1, 0x28(r1)
/* 8002F92C 0002B8AC  D8 41 00 30 */	stfd f2, 0x30(r1)
/* 8002F930 0002B8B0  D8 61 00 38 */	stfd f3, 0x38(r1)
/* 8002F934 0002B8B4  D8 81 00 40 */	stfd f4, 0x40(r1)
/* 8002F938 0002B8B8  D8 A1 00 48 */	stfd f5, 0x48(r1)
/* 8002F93C 0002B8BC  D8 C1 00 50 */	stfd f6, 0x50(r1)
/* 8002F940 0002B8C0  D8 E1 00 58 */	stfd f7, 0x58(r1)
/* 8002F944 0002B8C4  D9 01 00 60 */	stfd f8, 0x60(r1)
.L_8002F948:
/* 8002F948 0002B8C8  90 61 00 08 */	stw r3, 0x8(r1)
/* 8002F94C 0002B8CC  90 81 00 0C */	stw r4, 0xc(r1)
/* 8002F950 0002B8D0  90 A1 00 10 */	stw r5, 0x10(r1)
/* 8002F954 0002B8D4  90 C1 00 14 */	stw r6, 0x14(r1)
/* 8002F958 0002B8D8  90 E1 00 18 */	stw r7, 0x18(r1)
/* 8002F95C 0002B8DC  91 01 00 1C */	stw r8, 0x1c(r1)
/* 8002F960 0002B8E0  91 21 00 20 */	stw r9, 0x20(r1)
/* 8002F964 0002B8E4  91 41 00 24 */	stw r10, 0x24(r1)
/* 8002F968 0002B8E8  38 21 00 70 */	addi r1, r1, 0x70
/* 8002F96C 0002B8EC  4E 80 00 20 */	blr

.section .data, "wa"  # 0x80065000 - 0x8006D1C0

lbl_80068200:
	.asciz "DBExceptionDestination\n"

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380

.global __DBInterface
__DBInterface:
	.skip 0x4

.global DBVerbose
DBVerbose:
	.skip 0x4
