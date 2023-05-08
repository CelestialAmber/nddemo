.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

__ct__10DGAniModelFP8DGObjMan:
/* 8001A504 00016484  7C 08 02 A6 */	mflr r0
/* 8001A508 00016488  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001A50C 0001648C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8001A510 00016490  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8001A514 00016494  7C 7F 1B 78 */	mr r31, r3
/* 8001A518 00016498  4B FF 8A ED */	bl __ct__7DGModelFP8DGObjMan
/* 8001A51C 0001649C  38 80 00 00 */	li r4, 0x0
/* 8001A520 000164A0  98 9F 00 60 */	stb r4, 0x60(r31)
/* 8001A524 000164A4  3C 60 00 01 */	lis r3, 0x1
/* 8001A528 000164A8  38 03 FF FF */	addi r0, r3, -0x1
/* 8001A52C 000164AC  B0 9F 00 62 */	sth r4, 0x62(r31)
/* 8001A530 000164B0  7F E3 FB 78 */	mr r3, r31
/* 8001A534 000164B4  90 9F 00 64 */	stw r4, 0x64(r31)
/* 8001A538 000164B8  90 9F 00 68 */	stw r4, 0x68(r31)
/* 8001A53C 000164BC  90 9F 00 6C */	stw r4, 0x6c(r31)
/* 8001A540 000164C0  B0 1F 00 70 */	sth r0, 0x70(r31)
/* 8001A544 000164C4  B0 9F 00 72 */	sth r4, 0x72(r31)
/* 8001A548 000164C8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8001A54C 000164CC  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8001A550 000164D0  38 21 00 18 */	addi r1, r1, 0x18
/* 8001A554 000164D4  7C 08 03 A6 */	mtlr r0
/* 8001A558 000164D8  4E 80 00 20 */	blr

__dt__10DGAniModelFv:
/* 8001A55C 000164DC  7C 08 02 A6 */	mflr r0
/* 8001A560 000164E0  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001A564 000164E4  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8001A568 000164E8  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8001A56C 000164EC  3B E4 00 00 */	addi r31, r4, 0x0
/* 8001A570 000164F0  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8001A574 000164F4  7C 7E 1B 79 */	mr. r30, r3
/* 8001A578 000164F8  41 82 00 3C */	beq lbl_8001A5B4
/* 8001A57C 000164FC  88 1E 00 60 */	lbz r0, 0x60(r30)
/* 8001A580 00016500  28 00 00 01 */	cmplwi r0, 0x1
/* 8001A584 00016504  40 82 00 0C */	bne lbl_8001A590
/* 8001A588 00016508  38 00 00 00 */	li r0, 0x0
/* 8001A58C 0001650C  90 1E 00 5C */	stw r0, 0x5c(r30)
lbl_8001A590:
/* 8001A590 00016510  7F C3 F3 78 */	mr r3, r30
/* 8001A594 00016514  48 00 00 3D */	bl DeleteAniModelArray__10DGAniModelFv
/* 8001A598 00016518  38 7E 00 00 */	addi r3, r30, 0x0
/* 8001A59C 0001651C  38 80 00 00 */	li r4, 0x0
/* 8001A5A0 00016520  4B FF 8A AD */	bl __dt__7DGModelFv
/* 8001A5A4 00016524  7F E0 07 35 */	extsh. r0, r31
/* 8001A5A8 00016528  40 81 00 0C */	ble lbl_8001A5B4
/* 8001A5AC 0001652C  7F C3 F3 78 */	mr r3, r30
/* 8001A5B0 00016530  4B FF 84 E9 */	bl mFree__FPv
lbl_8001A5B4:
/* 8001A5B4 00016534  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8001A5B8 00016538  7F C3 F3 78 */	mr r3, r30
/* 8001A5BC 0001653C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8001A5C0 00016540  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8001A5C4 00016544  7C 08 03 A6 */	mtlr r0
/* 8001A5C8 00016548  38 21 00 18 */	addi r1, r1, 0x18
/* 8001A5CC 0001654C  4E 80 00 20 */	blr

DeleteAniModelArray__10DGAniModelFv:
/* 8001A5D0 00016550  7C 08 02 A6 */	mflr r0
/* 8001A5D4 00016554  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001A5D8 00016558  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8001A5DC 0001655C  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 8001A5E0 00016560  7C 7C 1B 78 */	mr r28, r3
/* 8001A5E4 00016564  80 63 00 64 */	lwz r3, 0x64(r3)
/* 8001A5E8 00016568  28 03 00 00 */	cmplwi r3, 0x0
/* 8001A5EC 0001656C  41 82 00 10 */	beq lbl_8001A5FC
/* 8001A5F0 00016570  4B FF 84 A9 */	bl mFree__FPv
/* 8001A5F4 00016574  38 00 00 00 */	li r0, 0x0
/* 8001A5F8 00016578  90 1C 00 64 */	stw r0, 0x64(r28)
lbl_8001A5FC:
/* 8001A5FC 0001657C  80 1C 00 6C */	lwz r0, 0x6c(r28)
/* 8001A600 00016580  28 00 00 00 */	cmplwi r0, 0x0
/* 8001A604 00016584  41 82 00 D4 */	beq lbl_8001A6D8
/* 8001A608 00016588  3B E0 00 00 */	li r31, 0x0
/* 8001A60C 0001658C  3B DF 00 00 */	addi r30, r31, 0x0
/* 8001A610 00016590  3B A0 00 00 */	li r29, 0x0
/* 8001A614 00016594  48 00 00 84 */	b lbl_8001A698
lbl_8001A618:
/* 8001A618 00016598  3B 40 00 00 */	li r26, 0x0
/* 8001A61C 0001659C  3B 7A 00 00 */	addi r27, r26, 0x0
/* 8001A620 000165A0  3B 20 00 00 */	li r25, 0x0
/* 8001A624 000165A4  48 00 00 34 */	b lbl_8001A658
lbl_8001A628:
/* 8001A628 000165A8  80 1C 00 6C */	lwz r0, 0x6c(r28)
/* 8001A62C 000165AC  7C 7F 00 2E */	lwzx r3, r31, r0
/* 8001A630 000165B0  7C 63 D0 2E */	lwzx r3, r3, r26
/* 8001A634 000165B4  28 03 00 00 */	cmplwi r3, 0x0
/* 8001A638 000165B8  41 82 00 18 */	beq lbl_8001A650
/* 8001A63C 000165BC  38 80 00 01 */	li r4, 0x1
/* 8001A640 000165C0  4B FF BA 95 */	bl __dt__7DGPartsFv
/* 8001A644 000165C4  80 1C 00 6C */	lwz r0, 0x6c(r28)
/* 8001A648 000165C8  7C 7F 00 2E */	lwzx r3, r31, r0
/* 8001A64C 000165CC  7F 63 D1 2E */	stwx r27, r3, r26
lbl_8001A650:
/* 8001A650 000165D0  3B 5A 00 04 */	addi r26, r26, 0x4
/* 8001A654 000165D4  3B 39 00 01 */	addi r25, r25, 0x1
lbl_8001A658:
/* 8001A658 000165D8  80 1C 00 68 */	lwz r0, 0x68(r28)
/* 8001A65C 000165DC  57 23 04 3E */	clrlwi r3, r25, 16
/* 8001A660 000165E0  7C 1E 02 2E */	lhzx r0, r30, r0
/* 8001A664 000165E4  7C 03 00 40 */	cmplw r3, r0
/* 8001A668 000165E8  41 80 FF C0 */	blt lbl_8001A628
/* 8001A66C 000165EC  80 7C 00 6C */	lwz r3, 0x6c(r28)
/* 8001A670 000165F0  7C 63 F8 2E */	lwzx r3, r3, r31
/* 8001A674 000165F4  28 03 00 00 */	cmplwi r3, 0x0
/* 8001A678 000165F8  41 82 00 14 */	beq lbl_8001A68C
/* 8001A67C 000165FC  4B FF 84 1D */	bl mFree__FPv
/* 8001A680 00016600  80 7C 00 6C */	lwz r3, 0x6c(r28)
/* 8001A684 00016604  38 00 00 00 */	li r0, 0x0
/* 8001A688 00016608  7C 03 F9 2E */	stwx r0, r3, r31
lbl_8001A68C:
/* 8001A68C 0001660C  3B FF 00 04 */	addi r31, r31, 0x4
/* 8001A690 00016610  3B DE 00 02 */	addi r30, r30, 0x2
/* 8001A694 00016614  3B BD 00 01 */	addi r29, r29, 0x1
lbl_8001A698:
/* 8001A698 00016618  A0 1C 00 62 */	lhz r0, 0x62(r28)
/* 8001A69C 0001661C  57 A3 04 3E */	clrlwi r3, r29, 16
/* 8001A6A0 00016620  7C 03 00 40 */	cmplw r3, r0
/* 8001A6A4 00016624  41 80 FF 74 */	blt lbl_8001A618
/* 8001A6A8 00016628  80 7C 00 68 */	lwz r3, 0x68(r28)
/* 8001A6AC 0001662C  28 03 00 00 */	cmplwi r3, 0x0
/* 8001A6B0 00016630  41 82 00 10 */	beq lbl_8001A6C0
/* 8001A6B4 00016634  4B FF 83 E5 */	bl mFree__FPv
/* 8001A6B8 00016638  38 00 00 00 */	li r0, 0x0
/* 8001A6BC 0001663C  90 1C 00 68 */	stw r0, 0x68(r28)
lbl_8001A6C0:
/* 8001A6C0 00016640  80 7C 00 6C */	lwz r3, 0x6c(r28)
/* 8001A6C4 00016644  28 03 00 00 */	cmplwi r3, 0x0
/* 8001A6C8 00016648  41 82 00 10 */	beq lbl_8001A6D8
/* 8001A6CC 0001664C  4B FF 83 CD */	bl mFree__FPv
/* 8001A6D0 00016650  38 00 00 00 */	li r0, 0x0
/* 8001A6D4 00016654  90 1C 00 6C */	stw r0, 0x6c(r28)
lbl_8001A6D8:
/* 8001A6D8 00016658  38 00 00 00 */	li r0, 0x0
/* 8001A6DC 0001665C  B0 1C 00 62 */	sth r0, 0x62(r28)
/* 8001A6E0 00016660  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 8001A6E4 00016664  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8001A6E8 00016668  38 21 00 30 */	addi r1, r1, 0x30
/* 8001A6EC 0001666C  7C 08 03 A6 */	mtlr r0
/* 8001A6F0 00016670  4E 80 00 20 */	blr

ReconstructToAnimodelStruct__10DGAniModelFv:
/* 8001A6F4 00016674  7C 08 02 A6 */	mflr r0
/* 8001A6F8 00016678  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001A6FC 0001667C  38 00 00 01 */	li r0, 0x1
/* 8001A700 00016680  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 8001A704 00016684  BE C1 00 10 */	stmw r22, 0x10(r1)
/* 8001A708 00016688  3A C3 00 00 */	addi r22, r3, 0x0
/* 8001A70C 0001668C  98 03 00 60 */	stb r0, 0x60(r3)
/* 8001A710 00016690  4B FF FE C1 */	bl DeleteAniModelArray__10DGAniModelFv
/* 8001A714 00016694  80 76 00 5C */	lwz r3, 0x5c(r22)
/* 8001A718 00016698  28 03 00 00 */	cmplwi r3, 0x0
/* 8001A71C 0001669C  41 82 02 24 */	beq lbl_8001A940
/* 8001A720 000166A0  4B FF BC 75 */	bl NumOfChild__7DGPartsFv
/* 8001A724 000166A4  B0 76 00 62 */	sth r3, 0x62(r22)
/* 8001A728 000166A8  A0 16 00 62 */	lhz r0, 0x62(r22)
/* 8001A72C 000166AC  54 03 20 36 */	slwi r3, r0, 4
/* 8001A730 000166B0  4B FF 82 C9 */	bl mAlloc__FUl
/* 8001A734 000166B4  90 76 00 64 */	stw r3, 0x64(r22)
/* 8001A738 000166B8  A0 16 00 62 */	lhz r0, 0x62(r22)
/* 8001A73C 000166BC  54 03 08 3C */	slwi r3, r0, 1
/* 8001A740 000166C0  4B FF 82 B9 */	bl mAlloc__FUl
/* 8001A744 000166C4  90 76 00 68 */	stw r3, 0x68(r22)
/* 8001A748 000166C8  A0 16 00 62 */	lhz r0, 0x62(r22)
/* 8001A74C 000166CC  54 03 10 3A */	slwi r3, r0, 2
/* 8001A750 000166D0  4B FF 82 A9 */	bl mAlloc__FUl
/* 8001A754 000166D4  38 E0 00 00 */	li r7, 0x0
/* 8001A758 000166D8  90 76 00 6C */	stw r3, 0x6c(r22)
/* 8001A75C 000166DC  39 07 00 00 */	addi r8, r7, 0x0
/* 8001A760 000166E0  39 27 00 00 */	addi r9, r7, 0x0
/* 8001A764 000166E4  38 C7 00 00 */	addi r6, r7, 0x0
/* 8001A768 000166E8  38 A7 00 00 */	addi r5, r7, 0x0
/* 8001A76C 000166EC  38 87 00 00 */	addi r4, r7, 0x0
/* 8001A770 000166F0  39 40 00 00 */	li r10, 0x0
/* 8001A774 000166F4  48 00 00 2C */	b lbl_8001A7A0
lbl_8001A778:
/* 8001A778 000166F8  80 76 00 64 */	lwz r3, 0x64(r22)
/* 8001A77C 000166FC  39 4A 00 01 */	addi r10, r10, 0x1
/* 8001A780 00016700  7C C3 39 AE */	stbx r6, r3, r7
/* 8001A784 00016704  38 E7 00 10 */	addi r7, r7, 0x10
/* 8001A788 00016708  80 76 00 68 */	lwz r3, 0x68(r22)
/* 8001A78C 0001670C  7C A3 43 2E */	sthx r5, r3, r8
/* 8001A790 00016710  39 08 00 02 */	addi r8, r8, 0x2
/* 8001A794 00016714  80 76 00 6C */	lwz r3, 0x6c(r22)
/* 8001A798 00016718  7C 83 49 2E */	stwx r4, r3, r9
/* 8001A79C 0001671C  39 29 00 04 */	addi r9, r9, 0x4
lbl_8001A7A0:
/* 8001A7A0 00016720  A0 16 00 62 */	lhz r0, 0x62(r22)
/* 8001A7A4 00016724  55 43 04 3E */	clrlwi r3, r10, 16
/* 8001A7A8 00016728  7C 03 00 40 */	cmplw r3, r0
/* 8001A7AC 0001672C  41 80 FF CC */	blt lbl_8001A778
/* 8001A7B0 00016730  3B 80 00 00 */	li r28, 0x0
/* 8001A7B4 00016734  3C 80 51 EC */	lis r4, 0x51ec
/* 8001A7B8 00016738  3C 60 66 66 */	lis r3, 0x6666
/* 8001A7BC 0001673C  3B 7C 00 00 */	addi r27, r28, 0x0
/* 8001A7C0 00016740  57 9A 20 36 */	slwi r26, r28, 4
/* 8001A7C4 00016744  3B C4 85 1F */	addi r30, r4, -0x7ae1
/* 8001A7C8 00016748  3B E3 66 67 */	addi r31, r3, 0x6667
/* 8001A7CC 0001674C  3B 20 00 00 */	li r25, 0x0
/* 8001A7D0 00016750  48 00 01 44 */	b lbl_8001A914
lbl_8001A7D4:
/* 8001A7D4 00016754  80 76 00 5C */	lwz r3, 0x5c(r22)
/* 8001A7D8 00016758  38 80 00 00 */	li r4, 0x0
/* 8001A7DC 0001675C  4B FF BA 49 */	bl CullPartsListNo__7DGPartsFUs
/* 8001A7E0 00016760  7C 78 1B 79 */	mr. r24, r3
/* 8001A7E4 00016764  41 82 01 20 */	beq lbl_8001A904
/* 8001A7E8 00016768  7F 03 C3 78 */	mr r3, r24
/* 8001A7EC 0001676C  4B FF BB A9 */	bl NumOfChild__7DGPartsFv
/* 8001A7F0 00016770  80 96 00 68 */	lwz r4, 0x68(r22)
/* 8001A7F4 00016774  7C 64 E3 2E */	sthx r3, r4, r28
/* 8001A7F8 00016778  80 76 00 68 */	lwz r3, 0x68(r22)
/* 8001A7FC 0001677C  7C 03 E2 2E */	lhzx r0, r3, r28
/* 8001A800 00016780  54 03 10 3A */	slwi r3, r0, 2
/* 8001A804 00016784  4B FF 81 F5 */	bl mAlloc__FUl
/* 8001A808 00016788  80 96 00 6C */	lwz r4, 0x6c(r22)
/* 8001A80C 0001678C  3B A0 00 00 */	li r29, 0x0
/* 8001A810 00016790  3A E0 00 00 */	li r23, 0x0
/* 8001A814 00016794  7C 64 D9 2E */	stwx r3, r4, r27
/* 8001A818 00016798  9B A1 00 0F */	stb r29, 0xf(r1)
/* 8001A81C 0001679C  48 00 00 A4 */	b lbl_8001A8C0
lbl_8001A820:
/* 8001A820 000167A0  56 E0 04 3E */	clrlwi r0, r23, 16
/* 8001A824 000167A4  7C 7E 00 96 */	mulhw r3, r30, r0
/* 8001A828 000167A8  7C 63 2E 70 */	srawi r3, r3, 5
/* 8001A82C 000167AC  54 64 0F FE */	srwi r4, r3, 31
/* 8001A830 000167B0  7D 03 22 14 */	add r8, r3, r4
/* 8001A834 000167B4  7C 7F 40 96 */	mulhw r3, r31, r8
/* 8001A838 000167B8  7C 67 16 70 */	srawi r7, r3, 2
/* 8001A83C 000167BC  7C BF 00 96 */	mulhw r5, r31, r0
/* 8001A840 000167C0  7C A3 16 70 */	srawi r3, r5, 2
/* 8001A844 000167C4  54 64 0F FE */	srwi r4, r3, 31
/* 8001A848 000167C8  7C C3 22 14 */	add r6, r3, r4
/* 8001A84C 000167CC  7C 7F 30 96 */	mulhw r3, r31, r6
/* 8001A850 000167D0  7C 63 16 70 */	srawi r3, r3, 2
/* 8001A854 000167D4  54 E4 0F FE */	srwi r4, r7, 31
/* 8001A858 000167D8  7C 87 22 14 */	add r4, r7, r4
/* 8001A85C 000167DC  1C E4 00 0A */	mulli r7, r4, 0xa
/* 8001A860 000167E0  54 64 0F FE */	srwi r4, r3, 31
/* 8001A864 000167E4  7C 83 22 14 */	add r4, r3, r4
/* 8001A868 000167E8  7C A3 16 70 */	srawi r3, r5, 2
/* 8001A86C 000167EC  1C A4 00 0A */	mulli r5, r4, 0xa
/* 8001A870 000167F0  54 64 0F FE */	srwi r4, r3, 31
/* 8001A874 000167F4  7C E7 40 50 */	subf r7, r7, r8
/* 8001A878 000167F8  7C 63 22 14 */	add r3, r3, r4
/* 8001A87C 000167FC  38 87 00 30 */	addi r4, r7, 0x30
/* 8001A880 00016800  1C 63 00 0A */	mulli r3, r3, 0xa
/* 8001A884 00016804  98 81 00 0C */	stb r4, 0xc(r1)
/* 8001A888 00016808  7C 85 30 50 */	subf r4, r5, r6
/* 8001A88C 0001680C  38 84 00 30 */	addi r4, r4, 0x30
/* 8001A890 00016810  7C 63 00 50 */	subf r3, r3, r0
/* 8001A894 00016814  98 81 00 0D */	stb r4, 0xd(r1)
/* 8001A898 00016818  38 03 00 30 */	addi r0, r3, 0x30
/* 8001A89C 0001681C  98 01 00 0E */	stb r0, 0xe(r1)
/* 8001A8A0 00016820  38 78 00 00 */	addi r3, r24, 0x0
/* 8001A8A4 00016824  38 81 00 0C */	addi r4, r1, 0xc
/* 8001A8A8 00016828  4B FF B8 A1 */	bl CullPartsListStr__7DGPartsFPCc
/* 8001A8AC 0001682C  80 16 00 6C */	lwz r0, 0x6c(r22)
/* 8001A8B0 00016830  3A F7 00 01 */	addi r23, r23, 0x1
/* 8001A8B4 00016834  7C 9B 00 2E */	lwzx r4, r27, r0
/* 8001A8B8 00016838  7C 64 E9 2E */	stwx r3, r4, r29
/* 8001A8BC 0001683C  3B BD 00 04 */	addi r29, r29, 0x4
lbl_8001A8C0:
/* 8001A8C0 00016840  80 16 00 68 */	lwz r0, 0x68(r22)
/* 8001A8C4 00016844  56 E3 04 3E */	clrlwi r3, r23, 16
/* 8001A8C8 00016848  7C 1C 02 2E */	lhzx r0, r28, r0
/* 8001A8CC 0001684C  7C 03 00 40 */	cmplw r3, r0
/* 8001A8D0 00016850  41 80 FF 50 */	blt lbl_8001A820
/* 8001A8D4 00016854  7F 03 C3 78 */	mr r3, r24
/* 8001A8D8 00016858  4B FF BB FD */	bl GetNamePtr__7DGPartsFv
/* 8001A8DC 0001685C  80 16 00 64 */	lwz r0, 0x64(r22)
/* 8001A8E0 00016860  38 83 00 00 */	addi r4, r3, 0x0
/* 8001A8E4 00016864  38 A0 00 10 */	li r5, 0x10
/* 8001A8E8 00016868  7C 60 D2 14 */	add r3, r0, r26
/* 8001A8EC 0001686C  48 04 78 0D */	bl strncpy
/* 8001A8F0 00016870  28 18 00 00 */	cmplwi r24, 0x0
/* 8001A8F4 00016874  41 82 00 10 */	beq lbl_8001A904
/* 8001A8F8 00016878  38 78 00 00 */	addi r3, r24, 0x0
/* 8001A8FC 0001687C  38 80 00 01 */	li r4, 0x1
/* 8001A900 00016880  4B FF B7 D5 */	bl __dt__7DGPartsFv
lbl_8001A904:
/* 8001A904 00016884  3B 9C 00 02 */	addi r28, r28, 0x2
/* 8001A908 00016888  3B 7B 00 04 */	addi r27, r27, 0x4
/* 8001A90C 0001688C  3B 5A 00 10 */	addi r26, r26, 0x10
/* 8001A910 00016890  3B 39 00 01 */	addi r25, r25, 0x1
lbl_8001A914:
/* 8001A914 00016894  A0 16 00 62 */	lhz r0, 0x62(r22)
/* 8001A918 00016898  57 23 04 3E */	clrlwi r3, r25, 16
/* 8001A91C 0001689C  7C 03 00 40 */	cmplw r3, r0
/* 8001A920 000168A0  41 80 FE B4 */	blt lbl_8001A7D4
/* 8001A924 000168A4  80 76 00 5C */	lwz r3, 0x5c(r22)
/* 8001A928 000168A8  28 03 00 00 */	cmplwi r3, 0x0
/* 8001A92C 000168AC  41 82 00 14 */	beq lbl_8001A940
/* 8001A930 000168B0  38 80 00 01 */	li r4, 0x1
/* 8001A934 000168B4  4B FF B7 A1 */	bl __dt__7DGPartsFv
/* 8001A938 000168B8  38 00 00 00 */	li r0, 0x0
/* 8001A93C 000168BC  90 16 00 5C */	stw r0, 0x5c(r22)
lbl_8001A940:
/* 8001A940 000168C0  BA C1 00 10 */	lmw r22, 0x10(r1)
/* 8001A944 000168C4  38 60 00 01 */	li r3, 0x1
/* 8001A948 000168C8  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 8001A94C 000168CC  38 21 00 38 */	addi r1, r1, 0x38
/* 8001A950 000168D0  7C 08 03 A6 */	mtlr r0
/* 8001A954 000168D4  4E 80 00 20 */	blr

GetAniType__10DGAniModelFPCc:
/* 8001A958 000168D8  7C 08 02 A6 */	mflr r0
/* 8001A95C 000168DC  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001A960 000168E0  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8001A964 000168E4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8001A968 000168E8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8001A96C 000168EC  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8001A970 000168F0  7C 9D 23 79 */	mr. r29, r4
/* 8001A974 000168F4  93 81 00 10 */	stw r28, 0x10(r1)
/* 8001A978 000168F8  3B 83 00 00 */	addi r28, r3, 0x0
/* 8001A97C 000168FC  41 82 00 50 */	beq lbl_8001A9CC
/* 8001A980 00016900  38 00 00 00 */	li r0, 0x0
/* 8001A984 00016904  54 1F 20 36 */	slwi r31, r0, 4
/* 8001A988 00016908  3B C0 00 00 */	li r30, 0x0
/* 8001A98C 0001690C  48 00 00 30 */	b lbl_8001A9BC
lbl_8001A990:
/* 8001A990 00016910  80 1C 00 64 */	lwz r0, 0x64(r28)
/* 8001A994 00016914  38 9D 00 00 */	addi r4, r29, 0x0
/* 8001A998 00016918  38 A0 00 10 */	li r5, 0x10
/* 8001A99C 0001691C  7C 60 FA 14 */	add r3, r0, r31
/* 8001A9A0 00016920  48 04 77 19 */	bl strncmp
/* 8001A9A4 00016924  2C 03 00 00 */	cmpwi r3, 0x0
/* 8001A9A8 00016928  40 82 00 0C */	bne lbl_8001A9B4
/* 8001A9AC 0001692C  7F C3 F3 78 */	mr r3, r30
/* 8001A9B0 00016930  48 00 00 24 */	b lbl_8001A9D4
lbl_8001A9B4:
/* 8001A9B4 00016934  3B FF 00 10 */	addi r31, r31, 0x10
/* 8001A9B8 00016938  3B DE 00 01 */	addi r30, r30, 0x1
lbl_8001A9BC:
/* 8001A9BC 0001693C  A0 1C 00 62 */	lhz r0, 0x62(r28)
/* 8001A9C0 00016940  57 C3 04 3E */	clrlwi r3, r30, 16
/* 8001A9C4 00016944  7C 03 00 40 */	cmplw r3, r0
/* 8001A9C8 00016948  41 80 FF C8 */	blt lbl_8001A990
lbl_8001A9CC:
/* 8001A9CC 0001694C  3C 60 00 01 */	lis r3, 0x1
/* 8001A9D0 00016950  38 63 FF FF */	addi r3, r3, -0x1
lbl_8001A9D4:
/* 8001A9D4 00016954  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8001A9D8 00016958  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8001A9DC 0001695C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8001A9E0 00016960  7C 08 03 A6 */	mtlr r0
/* 8001A9E4 00016964  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8001A9E8 00016968  83 81 00 10 */	lwz r28, 0x10(r1)
/* 8001A9EC 0001696C  38 21 00 20 */	addi r1, r1, 0x20
/* 8001A9F0 00016970  4E 80 00 20 */	blr

NumOfAniTypePat__10DGAniModelFUs:
/* 8001A9F4 00016974  A0 03 00 62 */	lhz r0, 0x62(r3)
/* 8001A9F8 00016978  54 84 04 3E */	clrlwi r4, r4, 16
/* 8001A9FC 0001697C  7C 04 00 40 */	cmplw r4, r0
/* 8001AA00 00016980  40 80 00 14 */	bge lbl_8001AA14
/* 8001AA04 00016984  80 63 00 68 */	lwz r3, 0x68(r3)
/* 8001AA08 00016988  54 80 08 3C */	slwi r0, r4, 1
/* 8001AA0C 0001698C  7C 63 02 2E */	lhzx r3, r3, r0
/* 8001AA10 00016990  4E 80 00 20 */	blr
lbl_8001AA14:
/* 8001AA14 00016994  38 60 00 00 */	li r3, 0x0
/* 8001AA18 00016998  4E 80 00 20 */	blr

SetAniPat__10DGAniModelFUsUs:
/* 8001AA1C 0001699C  A0 03 00 62 */	lhz r0, 0x62(r3)
/* 8001AA20 000169A0  54 88 04 3E */	clrlwi r8, r4, 16
/* 8001AA24 000169A4  7C 08 00 40 */	cmplw r8, r0
/* 8001AA28 000169A8  40 80 00 40 */	bge lbl_8001AA68
/* 8001AA2C 000169AC  80 C3 00 68 */	lwz r6, 0x68(r3)
/* 8001AA30 000169B0  55 00 08 3C */	slwi r0, r8, 1
/* 8001AA34 000169B4  54 A7 04 3E */	clrlwi r7, r5, 16
/* 8001AA38 000169B8  7C 06 02 2E */	lhzx r0, r6, r0
/* 8001AA3C 000169BC  7C 07 00 40 */	cmplw r7, r0
/* 8001AA40 000169C0  40 80 00 28 */	bge lbl_8001AA68
/* 8001AA44 000169C4  B0 83 00 70 */	sth r4, 0x70(r3)
/* 8001AA48 000169C8  55 04 10 3A */	slwi r4, r8, 2
/* 8001AA4C 000169CC  54 E0 10 3A */	slwi r0, r7, 2
/* 8001AA50 000169D0  B0 A3 00 72 */	sth r5, 0x72(r3)
/* 8001AA54 000169D4  80 A3 00 6C */	lwz r5, 0x6c(r3)
/* 8001AA58 000169D8  7C 85 20 2E */	lwzx r4, r5, r4
/* 8001AA5C 000169DC  7C 04 00 2E */	lwzx r0, r4, r0
/* 8001AA60 000169E0  90 03 00 5C */	stw r0, 0x5c(r3)
/* 8001AA64 000169E4  4E 80 00 20 */	blr
lbl_8001AA68:
/* 8001AA68 000169E8  3C 80 00 01 */	lis r4, 0x1
/* 8001AA6C 000169EC  38 04 FF FF */	addi r0, r4, -0x1
/* 8001AA70 000169F0  B0 03 00 70 */	sth r0, 0x70(r3)
/* 8001AA74 000169F4  38 00 00 00 */	li r0, 0x0
/* 8001AA78 000169F8  B0 03 00 72 */	sth r0, 0x72(r3)
/* 8001AA7C 000169FC  90 03 00 5C */	stw r0, 0x5c(r3)
/* 8001AA80 00016A00  4E 80 00 20 */	blr