.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global InitMetroTRK
InitMetroTRK:
/* 8005E67C 0005A5FC  38 21 FF FC */	addi r1, r1, -0x4
/* 8005E680 0005A600  90 61 00 00 */	stw r3, 0x0(r1)
/* 8005E684 0005A604  3C 60 80 0A */	lis r3, gTRKCPUState@h
/* 8005E688 0005A608  60 63 84 30 */	ori r3, r3, gTRKCPUState@l
/* 8005E68C 0005A60C  BC 03 00 00 */	stmw r0, 0x0(r3)
/* 8005E690 0005A610  80 81 00 00 */	lwz r4, 0x0(r1)
/* 8005E694 0005A614  38 21 00 04 */	addi r1, r1, 0x4
/* 8005E698 0005A618  90 23 00 04 */	stw r1, 0x4(r3)
/* 8005E69C 0005A61C  90 83 00 0C */	stw r4, 0xc(r3)
/* 8005E6A0 0005A620  7C 88 02 A6 */	mflr r4
/* 8005E6A4 0005A624  90 83 00 84 */	stw r4, 0x84(r3)
/* 8005E6A8 0005A628  90 83 00 80 */	stw r4, 0x80(r3)
/* 8005E6AC 0005A62C  7C 80 00 26 */	mfcr r4
/* 8005E6B0 0005A630  90 83 00 88 */	stw r4, 0x88(r3)
/* 8005E6B4 0005A634  7C 80 00 A6 */	mfmsr r4
/* 8005E6B8 0005A638  60 83 80 00 */	ori r3, r4, 0x8000
/* 8005E6BC 0005A63C  68 63 80 00 */	xori r3, r3, 0x8000
/* 8005E6C0 0005A640  7C 60 01 24 */	mtmsr r3
/* 8005E6C4 0005A644  7C 9B 03 A6 */	mtsrr1 r4
/* 8005E6C8 0005A648  48 00 01 F5 */	bl TRKSaveExtended1Block
/* 8005E6CC 0005A64C  3C 60 80 0A */	lis r3, gTRKCPUState@h
/* 8005E6D0 0005A650  60 63 84 30 */	ori r3, r3, gTRKCPUState@l
/* 8005E6D4 0005A654  B8 03 00 00 */	.4byte 0xB8030000  /* illegal lmw r0, 0x0(r3) */
/* 8005E6D8 0005A658  38 00 00 00 */	li r0, 0x0
/* 8005E6DC 0005A65C  7C 12 FB A6 */	mtspr IABR, r0
/* 8005E6E0 0005A660  7C 15 FB A6 */	mtspr DABR, r0
/* 8005E6E4 0005A664  3C 20 80 0B */	lis r1, _db_stack_addr@h
/* 8005E6E8 0005A668  60 21 BB 98 */	ori r1, r1, _db_stack_addr@l
/* 8005E6EC 0005A66C  7C A3 2B 78 */	mr r3, r5
/* 8005E6F0 0005A670  48 00 06 4D */	bl InitMetroTRKCommTable
/* 8005E6F4 0005A674  2C 03 00 01 */	cmpwi r3, 0x1
/* 8005E6F8 0005A678  40 82 00 14 */	bne .L_8005E70C
/* 8005E6FC 0005A67C  80 83 00 84 */	lwz r4, 0x84(r3)
/* 8005E700 0005A680  7C 88 03 A6 */	mtlr r4
/* 8005E704 0005A684  B8 03 00 00 */	.4byte 0xB8030000  /* illegal lmw r0, 0x0(r3) */
/* 8005E708 0005A688  4E 80 00 20 */	blr
.L_8005E70C:
/* 8005E70C 0005A68C  48 00 05 28 */	b TRK_main

.global EnableMetroTRKInterrupts
EnableMetroTRKInterrupts:
/* 8005E710 0005A690  7C 08 02 A6 */	mflr r0
/* 8005E714 0005A694  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005E718 0005A698  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8005E71C 0005A69C  48 00 07 4D */	bl EnableEXI2Interrupts
/* 8005E720 0005A6A0  38 21 00 08 */	addi r1, r1, 0x8
/* 8005E724 0005A6A4  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005E728 0005A6A8  7C 08 03 A6 */	mtlr r0
/* 8005E72C 0005A6AC  4E 80 00 20 */	blr

.global TRKTargetTranslate
TRKTargetTranslate:
/* 8005E730 0005A6B0  3C 80 80 0B */	lis r4, lc_base@ha
/* 8005E734 0005A6B4  38 84 88 60 */	addi r4, r4, lc_base@l
/* 8005E738 0005A6B8  80 84 00 00 */	lwz r4, 0x0(r4)
/* 8005E73C 0005A6BC  7C 03 20 40 */	cmplw r3, r4
/* 8005E740 0005A6C0  41 80 00 2C */	blt .L_8005E76C
/* 8005E744 0005A6C4  38 04 40 00 */	addi r0, r4, 0x4000
/* 8005E748 0005A6C8  7C 03 00 40 */	cmplw r3, r0
/* 8005E74C 0005A6CC  40 80 00 20 */	bge .L_8005E76C
/* 8005E750 0005A6D0  3C 80 80 0B */	lis r4, gTRKCPUState@ha
/* 8005E754 0005A6D4  38 84 84 30 */	addi r4, r4, gTRKCPUState@l
/* 8005E758 0005A6D8  80 04 02 38 */	lwz r0, 0x238(r4)
/* 8005E75C 0005A6DC  54 00 07 BE */	clrlwi r0, r0, 30
/* 8005E760 0005A6E0  28 00 00 00 */	cmplwi r0, 0x0
/* 8005E764 0005A6E4  41 82 00 08 */	beq .L_8005E76C
/* 8005E768 0005A6E8  48 00 00 0C */	b .L_8005E774
.L_8005E76C:
/* 8005E76C 0005A6EC  54 60 00 BE */	clrlwi r0, r3, 2
/* 8005E770 0005A6F0  64 03 80 00 */	oris r3, r0, 0x8000
.L_8005E774:
/* 8005E774 0005A6F4  4E 80 00 20 */	blr

.global TRK_copy_vector
TRK_copy_vector:
/* 8005E778 0005A6F8  7C 08 02 A6 */	mflr r0
/* 8005E77C 0005A6FC  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005E780 0005A700  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8005E784 0005A704  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8005E788 0005A708  93 C1 00 08 */	stw r30, 0x8(r1)
/* 8005E78C 0005A70C  7C 7E 1B 78 */	mr r30, r3
/* 8005E790 0005A710  7F C3 F3 78 */	mr r3, r30
/* 8005E794 0005A714  4B FF FF 9D */	bl TRKTargetTranslate
/* 8005E798 0005A718  3C 80 80 00 */	lis r4, gTRKInterruptVectorTable@ha
/* 8005E79C 0005A71C  38 04 33 D8 */	addi r0, r4, gTRKInterruptVectorTable@l
/* 8005E7A0 0005A720  7C 7F 1B 78 */	mr r31, r3
/* 8005E7A4 0005A724  7C 80 F2 14 */	add r4, r0, r30
/* 8005E7A8 0005A728  7F E3 FB 78 */	mr r3, r31
/* 8005E7AC 0005A72C  38 A0 01 00 */	li r5, 0x100
/* 8005E7B0 0005A730  4B FA 4B D5 */	bl TRK_memcpy
/* 8005E7B4 0005A734  7F E3 FB 78 */	mr r3, r31
/* 8005E7B8 0005A738  38 80 01 00 */	li r4, 0x100
/* 8005E7BC 0005A73C  4B FF E7 E9 */	bl TRK_flush_cache
/* 8005E7C0 0005A740  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8005E7C4 0005A744  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 8005E7C8 0005A748  38 21 00 10 */	addi r1, r1, 0x10
/* 8005E7CC 0005A74C  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005E7D0 0005A750  7C 08 03 A6 */	mtlr r0
/* 8005E7D4 0005A754  4E 80 00 20 */	blr

.global __TRK_copy_vectors
__TRK_copy_vectors:
/* 8005E7D8 0005A758  7C 08 02 A6 */	mflr r0
/* 8005E7DC 0005A75C  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005E7E0 0005A760  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8005E7E4 0005A764  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8005E7E8 0005A768  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8005E7EC 0005A76C  93 A1 00 0C */	stw r29, 0xc(r1)
/* 8005E7F0 0005A770  93 81 00 08 */	stw r28, 0x8(r1)
/* 8005E7F4 0005A774  38 60 00 44 */	li r3, 0x44
/* 8005E7F8 0005A778  4B FF FF 39 */	bl TRKTargetTranslate
/* 8005E7FC 0005A77C  3B A0 00 00 */	li r29, 0x0
/* 8005E800 0005A780  83 83 00 00 */	lwz r28, 0x0(r3)
/* 8005E804 0005A784  3C 60 80 07 */	lis r3, TRK_ISR_OFFSETS@ha
/* 8005E808 0005A788  57 A4 10 3A */	slwi r4, r29, 2
/* 8005E80C 0005A78C  38 03 CE 50 */	addi r0, r3, TRK_ISR_OFFSETS@l
/* 8005E810 0005A790  7F C0 22 14 */	add r30, r0, r4
/* 8005E814 0005A794  48 00 00 04 */	b .L_8005E818
.L_8005E818:
/* 8005E818 0005A798  3B E0 00 01 */	li r31, 0x1
/* 8005E81C 0005A79C  48 00 00 04 */	b .L_8005E820
.L_8005E820:
/* 8005E820 0005A7A0  48 00 00 04 */	b .L_8005E824
.L_8005E824:
/* 8005E824 0005A7A4  7F E0 E8 30 */	slw r0, r31, r29
/* 8005E828 0005A7A8  7F 80 00 38 */	and r0, r28, r0
/* 8005E82C 0005A7AC  28 00 00 00 */	cmplwi r0, 0x0
/* 8005E830 0005A7B0  41 82 00 0C */	beq .L_8005E83C
/* 8005E834 0005A7B4  80 7E 00 00 */	lwz r3, 0x0(r30)
/* 8005E838 0005A7B8  4B FF FF 41 */	bl TRK_copy_vector
.L_8005E83C:
/* 8005E83C 0005A7BC  3B DE 00 04 */	addi r30, r30, 0x4
/* 8005E840 0005A7C0  3B BD 00 01 */	addi r29, r29, 0x1
/* 8005E844 0005A7C4  2C 1D 00 0E */	cmpwi r29, 0xe
/* 8005E848 0005A7C8  40 81 FF DC */	ble .L_8005E824
/* 8005E84C 0005A7CC  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8005E850 0005A7D0  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8005E854 0005A7D4  83 A1 00 0C */	lwz r29, 0xc(r1)
/* 8005E858 0005A7D8  83 81 00 08 */	lwz r28, 0x8(r1)
/* 8005E85C 0005A7DC  38 21 00 18 */	addi r1, r1, 0x18
/* 8005E860 0005A7E0  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005E864 0005A7E4  7C 08 03 A6 */	mtlr r0
/* 8005E868 0005A7E8  4E 80 00 20 */	blr

.global TRKInitializeTarget
TRKInitializeTarget:
/* 8005E86C 0005A7EC  7C 08 02 A6 */	mflr r0
/* 8005E870 0005A7F0  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005E874 0005A7F4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8005E878 0005A7F8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8005E87C 0005A7FC  3C 60 80 0B */	lis r3, gTRKState@ha
/* 8005E880 0005A800  3B E3 83 88 */	addi r31, r3, gTRKState@l
/* 8005E884 0005A804  38 00 00 01 */	li r0, 0x1
/* 8005E888 0005A808  90 1F 00 98 */	stw r0, 0x98(r31)
/* 8005E88C 0005A80C  4B FF E8 15 */	bl __TRK_get_MSR
/* 8005E890 0005A810  90 7F 00 8C */	stw r3, 0x8c(r31)
/* 8005E894 0005A814  3C 60 80 0B */	lis r3, lc_base@ha
/* 8005E898 0005A818  38 63 88 60 */	addi r3, r3, lc_base@l
/* 8005E89C 0005A81C  3C 00 E0 00 */	lis r0, 0xe000
/* 8005E8A0 0005A820  90 03 00 00 */	stw r0, 0x0(r3)
/* 8005E8A4 0005A824  38 60 00 00 */	li r3, 0x0
/* 8005E8A8 0005A828  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8005E8AC 0005A82C  38 21 00 10 */	addi r1, r1, 0x10
/* 8005E8B0 0005A830  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005E8B4 0005A834  7C 08 03 A6 */	mtlr r0
/* 8005E8B8 0005A838  4E 80 00 20 */	blr

.section .init, "ax"  # 0x80003100 - 0x80005520 ; 0x00002420

.global __TRK_reset
__TRK_reset:
/* 8000530C 0000230C  7C 08 02 A6 */	mflr r0
/* 80005310 00002310  90 01 00 04 */	stw r0, 0x4(r1)
/* 80005314 00002314  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80005318 00002318  48 05 94 C1 */	bl __TRK_copy_vectors
/* 8000531C 0000231C  38 21 00 08 */	addi r1, r1, 0x8
/* 80005320 00002320  80 01 00 04 */	lwz r0, 0x4(r1)
/* 80005324 00002324  7C 08 03 A6 */	mtlr r0
/* 80005328 00002328  4E 80 00 20 */	blr

.section .data, "wa"  # 0x80065000 - 0x8006D1C0

TRK_ISR_OFFSETS:
	.4byte 0x00000100
	.4byte 0x00000200
	.4byte 0x00000300
	.4byte 0x00000400
	.4byte 0x00000500
	.4byte 0x00000600
	.4byte 0x00000700
	.4byte 0x00000800
	.4byte 0x00000900
	.4byte 0x00000C00
	.4byte 0x00000D00
	.4byte 0x00000F00
	.4byte 0x00001300
	.4byte 0x00001400
	.4byte 0x00001700
	.4byte 0

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80

lc_base:
	.skip 0x4

.skip 4