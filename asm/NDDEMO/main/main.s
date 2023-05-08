.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global main
main:
/* 800065A0 00002520  7C 08 02 A6 */	mflr r0
/* 800065A4 00002524  3C 60 80 06 */	lis r3, lbl_80065000@ha
/* 800065A8 00002528  90 01 00 04 */	stw r0, 0x4(r1)
/* 800065AC 0000252C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800065B0 00002530  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800065B4 00002534  3B E3 50 00 */	addi r31, r3, lbl_80065000@l
/* 800065B8 00002538  3C 60 80 07 */	lis r3, lbl_8006D1C0@ha
/* 800065BC 0000253C  93 C1 00 08 */	stw r30, 0x8(r1)
/* 800065C0 00002540  3B C3 D1 C0 */	addi r30, r3, lbl_8006D1C0@l
/* 800065C4 00002544  48 02 12 5D */	bl OSInit
/* 800065C8 00002548  48 00 01 45 */	bl iMakeMainHeap__Fv
/* 800065CC 0000254C  48 02 B2 79 */	bl DVDInit
/* 800065D0 00002550  48 02 DF CD */	bl VIInit
/* 800065D4 00002554  48 02 FE E9 */	bl PADInit
/* 800065D8 00002558  38 7E 00 0C */	addi r3, r30, 0xc
/* 800065DC 0000255C  48 02 05 25 */	bl Initialize__6DAudioFv
/* 800065E0 00002560  38 7E 00 0C */	addi r3, r30, 0xc
/* 800065E4 00002564  38 9F 00 00 */	addi r4, r31, 0x0
/* 800065E8 00002568  48 02 07 45 */	bl ReadPoolData__6DAudioFPc
/* 800065EC 0000256C  38 7E 00 0C */	addi r3, r30, 0xc
/* 800065F0 00002570  38 9F 00 14 */	addi r4, r31, 0x14
/* 800065F4 00002574  48 02 07 AD */	bl ReadProjData__6DAudioFPc
/* 800065F8 00002578  38 7E 00 0C */	addi r3, r30, 0xc
/* 800065FC 0000257C  38 9F 00 28 */	addi r4, r31, 0x28
/* 80006600 00002580  48 02 08 15 */	bl ReadSdirData__6DAudioFPc
/* 80006604 00002584  38 7E 00 0C */	addi r3, r30, 0xc
/* 80006608 00002588  38 9F 00 3C */	addi r4, r31, 0x3c
/* 8000660C 0000258C  48 02 08 7D */	bl ReadSampData__6DAudioFPc
/* 80006610 00002590  38 7F 00 50 */	addi r3, r31, 0x50
/* 80006614 00002594  4C C6 31 82 */	crclr 4*cr1+eq
/* 80006618 00002598  48 02 35 CD */	bl OSReport
/* 8000661C 0000259C  38 7E 00 0C */	addi r3, r30, 0xc
/* 80006620 000025A0  38 80 00 00 */	li r4, 0x0
/* 80006624 000025A4  48 02 08 D9 */	bl PushGroupData__6DAudioFUs
/* 80006628 000025A8  38 7E 00 0C */	addi r3, r30, 0xc
/* 8000662C 000025AC  38 80 00 01 */	li r4, 0x1
/* 80006630 000025B0  48 02 08 CD */	bl PushGroupData__6DAudioFUs
/* 80006634 000025B4  38 00 00 00 */	li r0, 0x0
/* 80006638 000025B8  B0 1E 00 28 */	sth r0, 0x28(r30)
/* 8000663C 000025BC  38 7E 00 0C */	addi r3, r30, 0xc
/* 80006640 000025C0  48 02 08 F5 */	bl FreeSampBuffer__6DAudioFv
/* 80006644 000025C4  3C 60 00 02 */	lis r3, 0x2
/* 80006648 000025C8  38 63 1B A0 */	addi r3, r3, 0x1ba0
/* 8000664C 000025CC  48 00 C3 AD */	bl mAlloc__FUl
/* 80006650 000025D0  3B E3 00 00 */	addi r31, r3, 0x0
/* 80006654 000025D4  7F E3 FB 79 */	mr. r3, r31
/* 80006658 000025D8  41 82 00 08 */	beq lbl_80006660
/* 8000665C 000025DC  48 00 01 B5 */	bl __ct__11DMainSystemFv
lbl_80006660:
/* 80006660 000025E0  93 ED 83 40 */	stw r31, dm@sda21(r13)
/* 80006664 000025E4  80 6D 83 40 */	lwz r3, dm@sda21(r13)
/* 80006668 000025E8  48 00 0B F9 */	bl iSystemInitProc__11DMainSystemFv
/* 8000666C 000025EC  3C 60 80 00 */	lis r3, idmThread__FPv@ha
/* 80006670 000025F0  3C DE 00 01 */	addis r6, r30, 0x1
/* 80006674 000025F4  3C A0 00 01 */	lis r5, 0x1
/* 80006678 000025F8  38 83 66 C8 */	addi r4, r3, idmThread__FPv@l
/* 8000667C 000025FC  38 E5 80 00 */	addi r7, r5, -0x8000
/* 80006680 00002600  38 7E 02 B0 */	addi r3, r30, 0x2b0
/* 80006684 00002604  38 A0 00 00 */	li r5, 0x0
/* 80006688 00002608  39 00 00 11 */	li r8, 0x11
/* 8000668C 0000260C  39 20 00 01 */	li r9, 0x1
/* 80006690 00002610  38 C6 85 C0 */	addi r6, r6, -0x7a40
/* 80006694 00002614  48 02 84 19 */	bl OSCreateThread
/* 80006698 00002618  38 7E 02 B0 */	addi r3, r30, 0x2b0
/* 8000669C 0000261C  48 02 87 D1 */	bl OSResumeThread
/* 800066A0 00002620  3B E0 00 01 */	li r31, 0x1
lbl_800066A4:
/* 800066A4 00002624  48 02 E3 31 */	bl VIWaitForRetrace
/* 800066A8 00002628  9B ED 83 48 */	stb r31, v_flag@sda21(r13)
/* 800066AC 0000262C  38 7E 02 B0 */	addi r3, r30, 0x2b0
/* 800066B0 00002630  48 02 7E CD */	bl OSIsThreadSuspended
/* 800066B4 00002634  2C 03 00 00 */	cmpwi r3, 0x0
/* 800066B8 00002638  41 82 FF EC */	beq lbl_800066A4
/* 800066BC 0000263C  38 7E 02 B0 */	addi r3, r30, 0x2b0
/* 800066C0 00002640  48 02 87 AD */	bl OSResumeThread
/* 800066C4 00002644  4B FF FF E0 */	b lbl_800066A4

idmThread__FPv:
/* 800066C8 00002648  7C 08 02 A6 */	mflr r0
/* 800066CC 0000264C  90 01 00 04 */	stw r0, 0x4(r1)
/* 800066D0 00002650  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 800066D4 00002654  80 6D 83 40 */	lwz r3, dm@sda21(r13)
/* 800066D8 00002658  48 00 05 15 */	bl MainLoop__11DMainSystemFv
/* 800066DC 0000265C  80 6D 83 40 */	lwz r3, dm@sda21(r13)
/* 800066E0 00002660  28 03 00 00 */	cmplwi r3, 0x0
/* 800066E4 00002664  41 82 00 14 */	beq lbl_800066F8
/* 800066E8 00002668  38 80 00 01 */	li r4, 0x1
/* 800066EC 0000266C  48 00 03 F9 */	bl __dt__11DMainSystemFv
/* 800066F0 00002670  38 00 00 00 */	li r0, 0x0
/* 800066F4 00002674  90 0D 83 40 */	stw r0, dm@sda21(r13)
lbl_800066F8:
/* 800066F8 00002678  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800066FC 0000267C  38 60 00 00 */	li r3, 0x0
/* 80006700 00002680  38 21 00 08 */	addi r1, r1, 0x8
/* 80006704 00002684  7C 08 03 A6 */	mtlr r0
/* 80006708 00002688  4E 80 00 20 */	blr

iMakeMainHeap__Fv:
/* 8000670C 0000268C  7C 08 02 A6 */	mflr r0
/* 80006710 00002690  90 01 00 04 */	stw r0, 0x4(r1)
/* 80006714 00002694  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80006718 00002698  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8000671C 0000269C  93 C1 00 08 */	stw r30, 0x8(r1)
/* 80006720 000026A0  48 02 25 35 */	bl OSGetArenaLo
/* 80006724 000026A4  38 03 00 1F */	addi r0, r3, 0x1f
/* 80006728 000026A8  54 1E 00 34 */	clrrwi r30, r0, 5
/* 8000672C 000026AC  48 02 25 21 */	bl OSGetArenaHi
/* 80006730 000026B0  7F C3 F3 78 */	mr r3, r30
/* 80006734 000026B4  48 02 25 31 */	bl OSSetArenaLo
/* 80006738 000026B8  48 02 25 1D */	bl OSGetArenaLo
/* 8000673C 000026BC  7C 7F 1B 78 */	mr r31, r3
/* 80006740 000026C0  48 02 25 0D */	bl OSGetArenaHi
/* 80006744 000026C4  3B C3 00 00 */	addi r30, r3, 0x0
/* 80006748 000026C8  38 7F 00 00 */	addi r3, r31, 0x0
/* 8000674C 000026CC  38 9E 00 00 */	addi r4, r30, 0x0
/* 80006750 000026D0  38 A0 00 01 */	li r5, 0x1
/* 80006754 000026D4  48 02 20 BD */	bl OSInitAlloc
/* 80006758 000026D8  7C 7F 1B 78 */	mr r31, r3
/* 8000675C 000026DC  48 02 25 09 */	bl OSSetArenaLo
/* 80006760 000026E0  38 1F 00 1F */	addi r0, r31, 0x1f
/* 80006764 000026E4  54 1F 00 34 */	clrrwi r31, r0, 5
/* 80006768 000026E8  57 DE 00 34 */	clrrwi r30, r30, 5
/* 8000676C 000026EC  38 7F 00 00 */	addi r3, r31, 0x0
/* 80006770 000026F0  38 9E 00 00 */	addi r4, r30, 0x0
/* 80006774 000026F4  48 02 21 0D */	bl OSCreateHeap
/* 80006778 000026F8  48 02 20 89 */	bl OSSetCurrentHeap
/* 8000677C 000026FC  3C 60 80 06 */	lis r3, lbl_80065064@ha
/* 80006780 00002700  4C C6 31 82 */	crclr 4*cr1+eq
/* 80006784 00002704  38 63 50 64 */	addi r3, r3, lbl_80065064@l
/* 80006788 00002708  38 9F 00 00 */	addi r4, r31, 0x0
/* 8000678C 0000270C  38 BE 00 00 */	addi r5, r30, 0x0
/* 80006790 00002710  48 02 34 55 */	bl OSReport
/* 80006794 00002714  7F C3 F3 78 */	mr r3, r30
/* 80006798 00002718  48 02 24 CD */	bl OSSetArenaLo
/* 8000679C 0000271C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800067A0 00002720  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800067A4 00002724  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 800067A8 00002728  7C 08 03 A6 */	mtlr r0
/* 800067AC 0000272C  38 21 00 10 */	addi r1, r1, 0x10
/* 800067B0 00002730  4E 80 00 20 */	blr

.global __sinit_main_cpp
__sinit_main_cpp:
/* 800067B4 00002734  7C 08 02 A6 */	mflr r0
/* 800067B8 00002738  3C 60 80 07 */	lis r3, audio@ha
/* 800067BC 0000273C  90 01 00 04 */	stw r0, 0x4(r1)
/* 800067C0 00002740  38 63 D1 CC */	addi r3, r3, audio@l
/* 800067C4 00002744  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 800067C8 00002748  48 02 02 C9 */	bl __ct__6DAudioFv
/* 800067CC 0000274C  3C 80 80 02 */	lis r4, __dt__6DAudioFv@ha
/* 800067D0 00002750  3C A0 80 07 */	lis r5, lbl_8006D1C0@ha
/* 800067D4 00002754  38 84 6A C0 */	addi r4, r4, __dt__6DAudioFv@l
/* 800067D8 00002758  38 A5 D1 C0 */	addi r5, r5, lbl_8006D1C0@l
/* 800067DC 0000275C  48 05 89 69 */	bl __register_global_object
/* 800067E0 00002760  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800067E4 00002764  38 21 00 08 */	addi r1, r1, 0x8
/* 800067E8 00002768  7C 08 03 A6 */	mtlr r0
/* 800067EC 0000276C  4E 80 00 20 */	blr


.section .data, "wa"  # 0x80065000 - 0x8006D1C0 ; 0x000081C0


.global lbl_80065000
lbl_80065000:

	# ROM: 0x62000
	.asciz "audio/nddemo.pol"
	.balign 4
	.asciz "audio/nddemo.prj"
	.balign 4
	.asciz "audio/nddemo.sdr"
	.balign 4
	.asciz "audio/nddemo.smp"
	.balign 4
	.asciz "Read Audio data\n"
	.balign 4

.global lbl_80065064
lbl_80065064:

	# ROM: 0x62064
	.asciz "iMakeMainHeap>start=%x / end=%x\n"
	.balign 4

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80 ; 0x0003B8C0

.global lbl_8006D1C0
lbl_8006D1C0:
	.skip 0xC

.global audio
audio:
	.skip 0x2A4
