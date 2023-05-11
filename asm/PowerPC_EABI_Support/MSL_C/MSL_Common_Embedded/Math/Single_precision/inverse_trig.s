.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn atanf, global
/* 800624B4 0005E434  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800624B8 0005E438  3C 60 80 06 */	lis r3, "atan_coeff$96"@ha
/* 800624BC 0005E43C  38 83 4A A0 */	addi r4, r3, "atan_coeff$96"@l
/* 800624C0 0005E440  D0 21 00 08 */	stfs f1, 0x8(r1)
/* 800624C4 0005E444  38 C0 FF FF */	li r6, -0x1
/* 800624C8 0005E448  C0 02 87 B0 */	lfs f0, lbl_800A9B30@sda21(r2)
/* 800624CC 0005E44C  38 E0 00 00 */	li r7, 0x0
/* 800624D0 0005E450  80 61 00 08 */	lwz r3, 0x8(r1)
/* 800624D4 0005E454  54 60 00 7E */	clrlwi r0, r3, 1
/* 800624D8 0005E458  90 01 00 08 */	stw r0, 0x8(r1)
/* 800624DC 0005E45C  54 68 00 00 */	clrrwi r8, r3, 31
/* 800624E0 0005E460  C0 41 00 08 */	lfs f2, 0x8(r1)
/* 800624E4 0005E464  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 800624E8 0005E468  4C 41 13 82 */	cror eq, gt, eq
/* 800624EC 0005E46C  40 82 00 18 */	bne .L_80062504
/* 800624F0 0005E470  C0 02 87 B4 */	lfs f0, lbl_800A9B34@sda21(r2)
/* 800624F4 0005E474  38 E0 00 01 */	li r7, 0x1
/* 800624F8 0005E478  EC 00 10 24 */	fdivs f0, f0, f2
/* 800624FC 0005E47C  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 80062500 0005E480  48 00 00 F4 */	b .L_800625F4
.L_80062504:
/* 80062504 0005E484  C0 02 87 B8 */	lfs f0, lbl_800A9B38@sda21(r2)
/* 80062508 0005E488  FC 00 10 40 */	fcmpo cr0, f0, f2
/* 8006250C 0005E48C  40 80 00 E4 */	bge .L_800625F0
/* 80062510 0005E490  80 A1 00 08 */	lwz r5, 0x8(r1)
/* 80062514 0005E494  3C 00 3F 80 */	lis r0, 0x3f80
/* 80062518 0005E498  38 C0 00 00 */	li r6, 0x0
/* 8006251C 0005E49C  54 A3 00 50 */	rlwinm r3, r5, 0, 1, 8
/* 80062520 0005E4A0  7C 03 00 00 */	cmpw r3, r0
/* 80062524 0005E4A4  41 82 00 54 */	beq .L_80062578
/* 80062528 0005E4A8  40 80 00 14 */	bge .L_8006253C
/* 8006252C 0005E4AC  3C 00 3F 00 */	lis r0, 0x3f00
/* 80062530 0005E4B0  7C 03 00 00 */	cmpw r3, r0
/* 80062534 0005E4B4  41 82 00 18 */	beq .L_8006254C
/* 80062538 0005E4B8  48 00 00 74 */	b .L_800625AC
.L_8006253C:
/* 8006253C 0005E4BC  3C 00 40 00 */	lis r0, 0x4000
/* 80062540 0005E4C0  7C 03 00 00 */	cmpw r3, r0
/* 80062544 0005E4C4  41 82 00 64 */	beq .L_800625A8
/* 80062548 0005E4C8  48 00 00 64 */	b .L_800625AC
.L_8006254C:
/* 8006254C 0005E4CC  3C 60 3F 09 */	lis r3, 0x3f09
/* 80062550 0005E4D0  38 03 D5 B9 */	addi r0, r3, -0x2a47
/* 80062554 0005E4D4  7C 05 00 00 */	cmpw r5, r0
/* 80062558 0005E4D8  41 80 00 08 */	blt .L_80062560
/* 8006255C 0005E4DC  38 C0 00 01 */	li r6, 0x1
.L_80062560:
/* 80062560 0005E4E0  3C 60 3F 52 */	lis r3, 0x3f52
/* 80062564 0005E4E4  38 03 18 01 */	addi r0, r3, 0x1801
/* 80062568 0005E4E8  7C 05 00 00 */	cmpw r5, r0
/* 8006256C 0005E4EC  41 80 00 40 */	blt .L_800625AC
/* 80062570 0005E4F0  38 C6 00 01 */	addi r6, r6, 0x1
/* 80062574 0005E4F4  48 00 00 38 */	b .L_800625AC
.L_80062578:
/* 80062578 0005E4F8  3C 60 3F 9C */	lis r3, 0x3f9c
/* 8006257C 0005E4FC  38 03 F7 EC */	addi r0, r3, -0x814
/* 80062580 0005E500  7C 05 00 00 */	cmpw r5, r0
/* 80062584 0005E504  38 C0 00 02 */	li r6, 0x2
/* 80062588 0005E508  41 80 00 08 */	blt .L_80062590
/* 8006258C 0005E50C  38 C0 00 03 */	li r6, 0x3
.L_80062590:
/* 80062590 0005E510  3C 60 3F EF */	lis r3, 0x3fef
/* 80062594 0005E514  38 03 78 9E */	addi r0, r3, 0x789e
/* 80062598 0005E518  7C 05 00 00 */	cmpw r5, r0
/* 8006259C 0005E51C  41 80 00 10 */	blt .L_800625AC
/* 800625A0 0005E520  38 C6 00 01 */	addi r6, r6, 0x1
/* 800625A4 0005E524  48 00 00 08 */	b .L_800625AC
.L_800625A8:
/* 800625A8 0005E528  38 C0 00 04 */	li r6, 0x4
.L_800625AC:
/* 800625AC 0005E52C  54 C0 10 3A */	slwi r0, r6, 2
/* 800625B0 0005E530  C0 22 87 B4 */	lfs f1, lbl_800A9B34@sda21(r2)
/* 800625B4 0005E534  7C 64 02 14 */	add r3, r4, r0
/* 800625B8 0005E538  C0 63 00 9C */	lfs f3, 0x9c(r3)
/* 800625BC 0005E53C  C0 83 00 84 */	lfs f4, 0x84(r3)
/* 800625C0 0005E540  EC 02 18 2A */	fadds f0, f2, f3
/* 800625C4 0005E544  EC 04 00 2A */	fadds f0, f4, f0
/* 800625C8 0005E548  EC 01 00 24 */	fdivs f0, f1, f0
/* 800625CC 0005E54C  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 800625D0 0005E550  C0 41 00 0C */	lfs f2, 0xc(r1)
/* 800625D4 0005E554  C0 23 00 1C */	lfs f1, 0x1c(r3)
/* 800625D8 0005E558  C0 03 00 34 */	lfs f0, 0x34(r3)
/* 800625DC 0005E55C  EC 22 20 7C */	fnmsubs f1, f2, f1, f4
/* 800625E0 0005E560  EC 02 18 3C */	fnmsubs f0, f2, f0, f3
/* 800625E4 0005E564  EC 01 00 2A */	fadds f0, f1, f0
/* 800625E8 0005E568  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 800625EC 0005E56C  48 00 00 08 */	b .L_800625F4
.L_800625F0:
/* 800625F0 0005E570  D0 41 00 0C */	stfs f2, 0xc(r1)
.L_800625F4:
/* 800625F4 0005E574  C0 A1 00 0C */	lfs f5, 0xc(r1)
/* 800625F8 0005E578  54 C0 10 3A */	slwi r0, r6, 2
/* 800625FC 0005E57C  C0 44 00 18 */	lfs f2, 0x18(r4)
/* 80062600 0005E580  7C 64 02 14 */	add r3, r4, r0
/* 80062604 0005E584  EC C5 01 72 */	fmuls f6, f5, f5
/* 80062608 0005E588  C0 24 00 14 */	lfs f1, 0x14(r4)
/* 8006260C 0005E58C  2C 07 00 00 */	cmpwi r7, 0x0
/* 80062610 0005E590  C0 04 00 10 */	lfs f0, 0x10(r4)
/* 80062614 0005E594  EC 66 08 BA */	fmadds f3, f6, f2, f1
/* 80062618 0005E598  C0 44 00 0C */	lfs f2, 0xc(r4)
/* 8006261C 0005E59C  EC 85 01 B2 */	fmuls f4, f5, f6
/* 80062620 0005E5A0  C0 24 00 08 */	lfs f1, 0x8(r4)
/* 80062624 0005E5A4  EC 66 00 FA */	fmadds f3, f6, f3, f0
/* 80062628 0005E5A8  C0 04 00 04 */	lfs f0, 0x4(r4)
/* 8006262C 0005E5AC  EC 46 10 FA */	fmadds f2, f6, f3, f2
/* 80062630 0005E5B0  EC 26 08 BA */	fmadds f1, f6, f2, f1
/* 80062634 0005E5B4  EC 06 00 7A */	fmadds f0, f6, f1, f0
/* 80062638 0005E5B8  EC 04 28 3A */	fmadds f0, f4, f0, f5
/* 8006263C 0005E5BC  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 80062640 0005E5C0  C0 21 00 0C */	lfs f1, 0xc(r1)
/* 80062644 0005E5C4  C0 03 00 6C */	lfs f0, 0x6c(r3)
/* 80062648 0005E5C8  EC 01 00 2A */	fadds f0, f1, f0
/* 8006264C 0005E5CC  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 80062650 0005E5D0  C0 21 00 0C */	lfs f1, 0xc(r1)
/* 80062654 0005E5D4  C0 03 00 50 */	lfs f0, 0x50(r3)
/* 80062658 0005E5D8  EC 01 00 2A */	fadds f0, f1, f0
/* 8006265C 0005E5DC  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 80062660 0005E5E0  41 82 00 30 */	beq .L_80062690
/* 80062664 0005E5E4  C0 21 00 0C */	lfs f1, 0xc(r1)
/* 80062668 0005E5E8  2C 08 00 00 */	cmpwi r8, 0x0
/* 8006266C 0005E5EC  C0 02 87 BC */	lfs f0, lbl_800A9B3C@sda21(r2)
/* 80062670 0005E5F0  EC 01 00 28 */	fsubs f0, f1, f0
/* 80062674 0005E5F4  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 80062678 0005E5F8  41 82 00 0C */	beq .L_80062684
/* 8006267C 0005E5FC  C0 21 00 0C */	lfs f1, 0xc(r1)
/* 80062680 0005E600  48 00 00 20 */	b .L_800626A0
.L_80062684:
/* 80062684 0005E604  C0 01 00 0C */	lfs f0, 0xc(r1)
/* 80062688 0005E608  FC 20 00 50 */	fneg f1, f0
/* 8006268C 0005E60C  48 00 00 14 */	b .L_800626A0
.L_80062690:
/* 80062690 0005E610  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80062694 0005E614  7C 00 43 78 */	or r0, r0, r8
/* 80062698 0005E618  90 01 00 0C */	stw r0, 0xc(r1)
/* 8006269C 0005E61C  C0 21 00 0C */	lfs f1, 0xc(r1)
.L_800626A0:
/* 800626A0 0005E620  38 21 00 10 */	addi r1, r1, 0x10
/* 800626A4 0005E624  4E 80 00 20 */	blr
.endfn atanf

.fn atan2f, global
/* 800626A8 0005E628  7C 08 02 A6 */	mflr r0
/* 800626AC 0005E62C  90 01 00 04 */	stw r0, 0x4(r1)
/* 800626B0 0005E630  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800626B4 0005E634  D0 21 00 08 */	stfs f1, 0x8(r1)
/* 800626B8 0005E638  D0 41 00 0C */	stfs f2, 0xc(r1)
/* 800626BC 0005E63C  80 01 00 08 */	lwz r0, 0x8(r1)
/* 800626C0 0005E640  80 61 00 0C */	lwz r3, 0xc(r1)
/* 800626C4 0005E644  54 04 00 00 */	clrrwi r4, r0, 31
/* 800626C8 0005E648  54 60 00 00 */	clrrwi r0, r3, 31
/* 800626CC 0005E64C  7C 00 20 00 */	cmpw r0, r4
/* 800626D0 0005E650  40 82 00 50 */	bne .L_80062720
/* 800626D4 0005E654  2C 00 00 00 */	cmpwi r0, 0x0
/* 800626D8 0005E658  41 82 00 20 */	beq .L_800626F8
/* 800626DC 0005E65C  C0 21 00 08 */	lfs f1, 0x8(r1)
/* 800626E0 0005E660  C0 01 00 0C */	lfs f0, 0xc(r1)
/* 800626E4 0005E664  EC 21 00 24 */	fdivs f1, f1, f0
/* 800626E8 0005E668  4B FF FD CD */	bl atanf
/* 800626EC 0005E66C  C0 02 87 C4 */	lfs f0, lbl_800A9B44@sda21(r2)
/* 800626F0 0005E670  EC 21 00 28 */	fsubs f1, f1, f0
/* 800626F4 0005E674  48 00 00 7C */	b .L_80062770
.L_800626F8:
/* 800626F8 0005E678  C0 21 00 0C */	lfs f1, 0xc(r1)
/* 800626FC 0005E67C  C0 02 87 C0 */	lfs f0, lbl_800A9B40@sda21(r2)
/* 80062700 0005E680  FC 01 00 00 */	fcmpu cr0, f1, f0
/* 80062704 0005E684  41 82 00 14 */	beq .L_80062718
/* 80062708 0005E688  C0 01 00 08 */	lfs f0, 0x8(r1)
/* 8006270C 0005E68C  EC 20 08 24 */	fdivs f1, f0, f1
/* 80062710 0005E690  4B FF FD A5 */	bl atanf
/* 80062714 0005E694  48 00 00 5C */	b .L_80062770
.L_80062718:
/* 80062718 0005E698  C0 22 87 BC */	lfs f1, lbl_800A9B3C@sda21(r2)
/* 8006271C 0005E69C  48 00 00 54 */	b .L_80062770
.L_80062720:
/* 80062720 0005E6A0  C0 21 00 0C */	lfs f1, 0xc(r1)
/* 80062724 0005E6A4  C0 02 87 C0 */	lfs f0, lbl_800A9B40@sda21(r2)
/* 80062728 0005E6A8  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8006272C 0005E6AC  40 80 00 1C */	bge .L_80062748
/* 80062730 0005E6B0  C0 01 00 08 */	lfs f0, 0x8(r1)
/* 80062734 0005E6B4  EC 20 08 24 */	fdivs f1, f0, f1
/* 80062738 0005E6B8  4B FF FD 7D */	bl atanf
/* 8006273C 0005E6BC  C0 02 87 C4 */	lfs f0, lbl_800A9B44@sda21(r2)
/* 80062740 0005E6C0  EC 20 08 2A */	fadds f1, f0, f1
/* 80062744 0005E6C4  48 00 00 2C */	b .L_80062770
.L_80062748:
/* 80062748 0005E6C8  FC 01 00 00 */	fcmpu cr0, f1, f0
/* 8006274C 0005E6CC  41 82 00 14 */	beq .L_80062760
/* 80062750 0005E6D0  C0 01 00 08 */	lfs f0, 0x8(r1)
/* 80062754 0005E6D4  EC 20 08 24 */	fdivs f1, f0, f1
/* 80062758 0005E6D8  4B FF FD 5D */	bl atanf
/* 8006275C 0005E6DC  48 00 00 14 */	b .L_80062770
.L_80062760:
/* 80062760 0005E6E0  3C 64 3F C9 */	addis r3, r4, 0x3fc9
/* 80062764 0005E6E4  38 03 0F DB */	addi r0, r3, 0xfdb
/* 80062768 0005E6E8  90 01 00 08 */	stw r0, 0x8(r1)
/* 8006276C 0005E6EC  C0 21 00 08 */	lfs f1, 0x8(r1)
.L_80062770:
/* 80062770 0005E6F0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80062774 0005E6F4  38 21 00 10 */	addi r1, r1, 0x10
/* 80062778 0005E6F8  7C 08 03 A6 */	mtlr r0
/* 8006277C 0005E6FC  4E 80 00 20 */	blr
.endfn atan2f

.section .rodata, "wa"  # 0x80063D20 - 0x80065000

.obj "atan_coeff$96", local
	.4byte 0x3F800000
	.4byte 0xBEAAAAAA
	.4byte 0x3E4CCC81
	.4byte 0xBE123E7D
	.4byte 0x3DE21F95
	.4byte 0xBDAD417C
	.4byte 0x3D41186D
	.4byte 0x40DA826B
	.4byte 0x404F5958
	.4byte 0x40000000
	.4byte 0x3FB925AB
	.4byte 0x3F95F61A
	.4byte 0x3F851081
	.4byte 0x36EF692F
	.4byte 0x355C1DF9
	.4byte 0
	.4byte 0x35291D45
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3EC90EAA
	.4byte 0x3F16CBE4
	.4byte 0x3F490FDA
	.4byte 0x3F7B53C5
	.4byte 0x3F96CBE2
	.4byte 0x3FAFEDD9
	.4byte 0
	.4byte 0x37185D99
	.4byte 0x32C59189
	.4byte 0x33874A9E
	.4byte 0x353CFA83
	.4byte 0x348637BD
	.4byte 0x35541063
	.4byte 0x401A8277
	.4byte 0x3FBF90C7
	.4byte 0x3F800000
	.4byte 0x3F2B0DC1
	.4byte 0x3ED413CD
	.4byte 0x3E4BAFAF
	.4byte 0x3516DC59
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
.endobj "atan_coeff$96"

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0

.obj lbl_800A9B30, local
	.4byte 0x401A827A
.endobj lbl_800A9B30

.obj lbl_800A9B34, local
	.4byte 0x3F800000
.endobj lbl_800A9B34

.obj lbl_800A9B38, local
	.4byte 0x3ED413CD
.endobj lbl_800A9B38

.obj lbl_800A9B3C, local
	.4byte 0x3FC90FDB
.endobj lbl_800A9B3C

.obj lbl_800A9B40, local
	.4byte 0
.endobj lbl_800A9B40

.obj lbl_800A9B44, local
	.4byte 0x40490FDB
.endobj lbl_800A9B44
