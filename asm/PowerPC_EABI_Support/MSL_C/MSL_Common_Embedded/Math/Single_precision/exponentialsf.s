.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn powf, global
/* 80062AE8 0005EA68  94 21 FF 70 */	stwu r1, -0x90(r1)
/* 80062AEC 0005EA6C  3C 60 80 06 */	lis r3, __log2_F@ha
/* 80062AF0 0005EA70  38 63 4D B8 */	addi r3, r3, __log2_F@l
/* 80062AF4 0005EA74  C0 62 87 F8 */	lfs f3, float_800A9B78@sda21(r2)
/* 80062AF8 0005EA78  FC 01 18 40 */	fcmpo cr0, f1, f3
/* 80062AFC 0005EA7C  40 81 01 E4 */	ble .L_80062CE0
/* 80062B00 0005EA80  D0 21 00 60 */	stfs f1, 0x60(r1)
/* 80062B04 0005EA84  80 02 87 E8 */	lwz r0, lbl_800A9B68@sda21(r2)
/* 80062B08 0005EA88  81 21 00 60 */	lwz r9, 0x60(r1)
/* 80062B0C 0005EA8C  90 01 00 68 */	stw r0, 0x68(r1)
/* 80062B10 0005EA90  80 A2 87 EC */	lwz r5, lbl_800A9B6C@sda21(r2)
/* 80062B14 0005EA94  55 20 04 3F */	clrlwi. r0, r9, 16
/* 80062B18 0005EA98  55 24 4D FE */	srwi r4, r9, 23
/* 80062B1C 0005EA9C  90 A1 00 6C */	stw r5, 0x6c(r1)
/* 80062B20 0005EAA0  55 26 02 7E */	clrlwi r6, r9, 9
/* 80062B24 0005EAA4  39 04 FF 80 */	addi r8, r4, -0x80
/* 80062B28 0005EAA8  55 27 86 7E */	extrwi r7, r9, 7, 9
/* 80062B2C 0005EAAC  41 82 00 B4 */	beq .L_80062BE0
/* 80062B30 0005EAB0  55 24 02 5E */	rlwinm r4, r9, 0, 9, 15
/* 80062B34 0005EAB4  64 85 3F 80 */	oris r5, r4, 0x3f80
/* 80062B38 0005EAB8  64 C4 3F 80 */	oris r4, r6, 0x3f80
/* 80062B3C 0005EABC  90 A1 00 64 */	stw r5, 0x64(r1)
/* 80062B40 0005EAC0  55 20 04 21 */	rlwinm. r0, r9, 0, 16, 16
/* 80062B44 0005EAC4  90 81 00 74 */	stw r4, 0x74(r1)
/* 80062B48 0005EAC8  41 82 00 14 */	beq .L_80062B5C
/* 80062B4C 0005EACC  80 81 00 64 */	lwz r4, 0x64(r1)
/* 80062B50 0005EAD0  38 E7 00 01 */	addi r7, r7, 0x1
/* 80062B54 0005EAD4  3C 04 00 01 */	addis r0, r4, 0x1
/* 80062B58 0005EAD8  90 01 00 64 */	stw r0, 0x64(r1)
.L_80062B5C:
/* 80062B5C 0005EADC  3C 80 80 06 */	lis r4, __one_over_F@ha
/* 80062B60 0005EAE0  C0 61 00 74 */	lfs f3, 0x74(r1)
/* 80062B64 0005EAE4  C0 01 00 64 */	lfs f0, 0x64(r1)
/* 80062B68 0005EAE8  54 E5 10 3A */	slwi r5, r7, 2
/* 80062B6C 0005EAEC  38 04 4B 68 */	addi r0, r4, __one_over_F@l
/* 80062B70 0005EAF0  C0 21 00 6C */	lfs f1, 0x6c(r1)
/* 80062B74 0005EAF4  7C 80 2A 14 */	add r4, r0, r5
/* 80062B78 0005EAF8  ED 03 00 28 */	fsubs f8, f3, f0
/* 80062B7C 0005EAFC  C0 64 00 00 */	lfs f3, 0x0(r4)
/* 80062B80 0005EB00  38 82 87 E0 */	addi r4, r2, "__log2e_m1$localstatic0$__log2f__Ff"@sda21
/* 80062B84 0005EB04  C0 01 00 68 */	lfs f0, 0x68(r1)
/* 80062B88 0005EB08  6D 00 80 00 */	xoris r0, r8, 0x8000
/* 80062B8C 0005EB0C  ED 08 00 F2 */	fmuls f8, f8, f3
/* 80062B90 0005EB10  C0 84 00 04 */	lfs f4, 0x4(r4)
/* 80062B94 0005EB14  90 01 00 8C */	stw r0, 0x8c(r1)
/* 80062B98 0005EB18  3C 00 43 30 */	lis r0, 0x4330
/* 80062B9C 0005EB1C  C0 A2 87 E0 */	lfs f5, "__log2e_m1$localstatic0$__log2f__Ff"@sda21(r2)
/* 80062BA0 0005EB20  EC 68 02 32 */	fmuls f3, f8, f8
/* 80062BA4 0005EB24  90 01 00 88 */	stw r0, 0x88(r1)
/* 80062BA8 0005EB28  EC 08 00 7A */	fmadds f0, f8, f1, f0
/* 80062BAC 0005EB2C  C8 C2 88 10 */	lfd f6, double_800A9B90@sda21(r2)
/* 80062BB0 0005EB30  C8 21 00 88 */	lfd f1, 0x88(r1)
/* 80062BB4 0005EB34  EC 03 00 32 */	fmuls f0, f3, f0
/* 80062BB8 0005EB38  C0 E2 87 FC */	lfs f7, float_800A9B7C@sda21(r2)
/* 80062BBC 0005EB3C  EC 61 30 28 */	fsubs f3, f1, f6
/* 80062BC0 0005EB40  7C 23 2C 2E */	lfsx f1, r3, r5
/* 80062BC4 0005EB44  EC 04 02 3A */	fmadds f0, f4, f8, f0
/* 80062BC8 0005EB48  EC 67 18 2A */	fadds f3, f7, f3
/* 80062BCC 0005EB4C  EC 05 02 3A */	fmadds f0, f5, f8, f0
/* 80062BD0 0005EB50  EC 08 00 2A */	fadds f0, f8, f0
/* 80062BD4 0005EB54  EC 01 00 2A */	fadds f0, f1, f0
/* 80062BD8 0005EB58  EC 03 00 2A */	fadds f0, f3, f0
/* 80062BDC 0005EB5C  48 00 00 34 */	b .L_80062C10
.L_80062BE0:
/* 80062BE0 0005EB60  6D 00 80 00 */	xoris r0, r8, 0x8000
/* 80062BE4 0005EB64  C8 62 88 10 */	lfd f3, double_800A9B90@sda21(r2)
/* 80062BE8 0005EB68  90 01 00 8C */	stw r0, 0x8c(r1)
/* 80062BEC 0005EB6C  3C 80 43 30 */	lis r4, 0x4330
/* 80062BF0 0005EB70  54 E0 10 3A */	slwi r0, r7, 2
/* 80062BF4 0005EB74  C0 82 87 FC */	lfs f4, float_800A9B7C@sda21(r2)
/* 80062BF8 0005EB78  90 81 00 88 */	stw r4, 0x88(r1)
/* 80062BFC 0005EB7C  7C 03 04 2E */	lfsx f0, r3, r0
/* 80062C00 0005EB80  C8 21 00 88 */	lfd f1, 0x88(r1)
/* 80062C04 0005EB84  EC 21 18 28 */	fsubs f1, f1, f3
/* 80062C08 0005EB88  EC 24 08 2A */	fadds f1, f4, f1
/* 80062C0C 0005EB8C  EC 01 00 2A */	fadds f0, f1, f0
.L_80062C10:
/* 80062C10 0005EB90  EC 42 00 32 */	fmuls f2, f2, f0
/* 80062C14 0005EB94  3C 00 43 30 */	lis r0, 0x4330
/* 80062C18 0005EB98  C8 22 88 10 */	lfd f1, double_800A9B90@sda21(r2)
/* 80062C1C 0005EB9C  FC 00 10 1E */	fctiwz f0, f2
/* 80062C20 0005EBA0  D8 01 00 88 */	stfd f0, 0x88(r1)
/* 80062C24 0005EBA4  80 81 00 8C */	lwz r4, 0x8c(r1)
/* 80062C28 0005EBA8  90 81 00 58 */	stw r4, 0x58(r1)
/* 80062C2C 0005EBAC  80 A1 00 58 */	lwz r5, 0x58(r1)
/* 80062C30 0005EBB0  6C A4 80 00 */	xoris r4, r5, 0x8000
/* 80062C34 0005EBB4  90 81 00 84 */	stw r4, 0x84(r1)
/* 80062C38 0005EBB8  2C 05 00 80 */	cmpwi r5, 0x80
/* 80062C3C 0005EBBC  90 01 00 80 */	stw r0, 0x80(r1)
/* 80062C40 0005EBC0  C8 01 00 80 */	lfd f0, 0x80(r1)
/* 80062C44 0005EBC4  EC 00 08 28 */	fsubs f0, f0, f1
/* 80062C48 0005EBC8  ED 22 00 28 */	fsubs f9, f2, f0
/* 80062C4C 0005EBCC  40 81 00 0C */	ble .L_80062C58
/* 80062C50 0005EBD0  C0 22 87 F0 */	lfs f1, _inf@sda21(r2)
/* 80062C54 0005EBD4  48 00 05 CC */	b .L_80063220
.L_80062C58:
/* 80062C58 0005EBD8  2C 05 FF 81 */	cmpwi r5, -0x7f
/* 80062C5C 0005EBDC  40 80 00 0C */	bge .L_80062C68
/* 80062C60 0005EBE0  C0 22 87 F8 */	lfs f1, float_800A9B78@sda21(r2)
/* 80062C64 0005EBE4  48 00 05 BC */	b .L_80063220
.L_80062C68:
/* 80062C68 0005EBE8  38 05 00 7F */	addi r0, r5, 0x7f
/* 80062C6C 0005EBEC  C0 C2 88 04 */	lfs f6, float_800A9B84@sda21(r2)
/* 80062C70 0005EBF0  90 01 00 58 */	stw r0, 0x58(r1)
/* 80062C74 0005EBF4  C0 E2 88 00 */	lfs f7, float_800A9B80@sda21(r2)
/* 80062C78 0005EBF8  80 01 00 58 */	lwz r0, 0x58(r1)
/* 80062C7C 0005EBFC  54 00 B8 10 */	slwi r0, r0, 23
/* 80062C80 0005EC00  90 01 00 58 */	stw r0, 0x58(r1)
/* 80062C84 0005EC04  C0 43 02 24 */	lfs f2, 0x224(r3)
/* 80062C88 0005EC08  C0 03 02 20 */	lfs f0, 0x220(r3)
/* 80062C8C 0005EC0C  C0 23 02 1C */	lfs f1, 0x21c(r3)
/* 80062C90 0005EC10  EC 49 00 BA */	fmadds f2, f9, f2, f0
/* 80062C94 0005EC14  C0 03 02 18 */	lfs f0, 0x218(r3)
/* 80062C98 0005EC18  C0 83 02 14 */	lfs f4, 0x214(r3)
/* 80062C9C 0005EC1C  C0 63 02 10 */	lfs f3, 0x210(r3)
/* 80062CA0 0005EC20  EC A9 08 BA */	fmadds f5, f9, f2, f1
/* 80062CA4 0005EC24  C0 43 02 0C */	lfs f2, 0x20c(r3)
/* 80062CA8 0005EC28  C0 23 02 08 */	lfs f1, 0x208(r3)
/* 80062CAC 0005EC2C  EC A9 01 7A */	fmadds f5, f9, f5, f0
/* 80062CB0 0005EC30  C0 03 02 04 */	lfs f0, 0x204(r3)
/* 80062CB4 0005EC34  C1 01 00 58 */	lfs f8, 0x58(r1)
/* 80062CB8 0005EC38  EC 89 21 7A */	fmadds f4, f9, f5, f4
/* 80062CBC 0005EC3C  EC 69 19 3A */	fmadds f3, f9, f4, f3
/* 80062CC0 0005EC40  EC 49 10 FA */	fmadds f2, f9, f3, f2
/* 80062CC4 0005EC44  EC 29 08 BA */	fmadds f1, f9, f2, f1
/* 80062CC8 0005EC48  EC 09 00 7A */	fmadds f0, f9, f1, f0
/* 80062CCC 0005EC4C  EC 09 00 32 */	fmuls f0, f9, f0
/* 80062CD0 0005EC50  EC 06 00 2A */	fadds f0, f6, f0
/* 80062CD4 0005EC54  EC 07 00 2A */	fadds f0, f7, f0
/* 80062CD8 0005EC58  EC 28 00 32 */	fmuls f1, f8, f0
/* 80062CDC 0005EC5C  48 00 05 44 */	b .L_80063220
.L_80062CE0:
/* 80062CE0 0005EC60  40 80 04 18 */	bge .L_800630F8
/* 80062CE4 0005EC64  FC 00 10 1E */	fctiwz f0, f2
/* 80062CE8 0005EC68  3C A0 43 30 */	lis r5, 0x4330
/* 80062CEC 0005EC6C  C8 82 88 10 */	lfd f4, double_800A9B90@sda21(r2)
/* 80062CF0 0005EC70  D8 01 00 88 */	stfd f0, 0x88(r1)
/* 80062CF4 0005EC74  80 01 00 8C */	lwz r0, 0x8c(r1)
/* 80062CF8 0005EC78  D8 01 00 80 */	stfd f0, 0x80(r1)
/* 80062CFC 0005EC7C  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 80062D00 0005EC80  90 01 00 7C */	stw r0, 0x7c(r1)
/* 80062D04 0005EC84  80 81 00 84 */	lwz r4, 0x84(r1)
/* 80062D08 0005EC88  90 A1 00 78 */	stw r5, 0x78(r1)
/* 80062D0C 0005EC8C  C8 01 00 78 */	lfd f0, 0x78(r1)
/* 80062D10 0005EC90  EC 00 20 28 */	fsubs f0, f0, f4
/* 80062D14 0005EC94  EC 02 00 28 */	fsubs f0, f2, f0
/* 80062D18 0005EC98  FC 00 18 00 */	fcmpu cr0, f0, f3
/* 80062D1C 0005EC9C  41 82 00 0C */	beq .L_80062D28
/* 80062D20 0005ECA0  C0 22 87 F4 */	lfs f1, _nan@sda21(r2)
/* 80062D24 0005ECA4  48 00 04 FC */	b .L_80063220
.L_80062D28:
/* 80062D28 0005ECA8  7C 80 0E 70 */	srawi r0, r4, 1
/* 80062D2C 0005ECAC  7C 00 01 94 */	addze r0, r0
/* 80062D30 0005ECB0  54 00 08 3C */	slwi r0, r0, 1
/* 80062D34 0005ECB4  7C 00 20 11 */	subfc. r0, r0, r4
/* 80062D38 0005ECB8  41 82 01 E4 */	beq .L_80062F1C
/* 80062D3C 0005ECBC  FC 00 08 50 */	fneg f0, f1
/* 80062D40 0005ECC0  80 82 87 E8 */	lwz r4, lbl_800A9B68@sda21(r2)
/* 80062D44 0005ECC4  80 02 87 EC */	lwz r0, lbl_800A9B6C@sda21(r2)
/* 80062D48 0005ECC8  90 81 00 48 */	stw r4, 0x48(r1)
/* 80062D4C 0005ECCC  D0 01 00 40 */	stfs f0, 0x40(r1)
/* 80062D50 0005ECD0  81 21 00 40 */	lwz r9, 0x40(r1)
/* 80062D54 0005ECD4  90 01 00 4C */	stw r0, 0x4c(r1)
/* 80062D58 0005ECD8  55 24 4D FE */	srwi r4, r9, 23
/* 80062D5C 0005ECDC  55 20 04 3F */	clrlwi. r0, r9, 16
/* 80062D60 0005ECE0  55 26 02 7E */	clrlwi r6, r9, 9
/* 80062D64 0005ECE4  39 04 FF 80 */	addi r8, r4, -0x80
/* 80062D68 0005ECE8  55 27 86 7E */	extrwi r7, r9, 7, 9
/* 80062D6C 0005ECEC  41 82 00 B4 */	beq .L_80062E20
/* 80062D70 0005ECF0  55 24 02 5E */	rlwinm r4, r9, 0, 9, 15
/* 80062D74 0005ECF4  64 85 3F 80 */	oris r5, r4, 0x3f80
/* 80062D78 0005ECF8  64 C4 3F 80 */	oris r4, r6, 0x3f80
/* 80062D7C 0005ECFC  90 A1 00 44 */	stw r5, 0x44(r1)
/* 80062D80 0005ED00  55 20 04 21 */	rlwinm. r0, r9, 0, 16, 16
/* 80062D84 0005ED04  90 81 00 54 */	stw r4, 0x54(r1)
/* 80062D88 0005ED08  41 82 00 14 */	beq .L_80062D9C
/* 80062D8C 0005ED0C  80 81 00 44 */	lwz r4, 0x44(r1)
/* 80062D90 0005ED10  38 E7 00 01 */	addi r7, r7, 0x1
/* 80062D94 0005ED14  3C 04 00 01 */	addis r0, r4, 0x1
/* 80062D98 0005ED18  90 01 00 44 */	stw r0, 0x44(r1)
.L_80062D9C:
/* 80062D9C 0005ED1C  3C 80 80 06 */	lis r4, __one_over_F@ha
/* 80062DA0 0005ED20  C0 61 00 54 */	lfs f3, 0x54(r1)
/* 80062DA4 0005ED24  C0 01 00 44 */	lfs f0, 0x44(r1)
/* 80062DA8 0005ED28  54 E5 10 3A */	slwi r5, r7, 2
/* 80062DAC 0005ED2C  38 04 4B 68 */	addi r0, r4, __one_over_F@l
/* 80062DB0 0005ED30  C0 21 00 4C */	lfs f1, 0x4c(r1)
/* 80062DB4 0005ED34  7C 80 2A 14 */	add r4, r0, r5
/* 80062DB8 0005ED38  ED 03 00 28 */	fsubs f8, f3, f0
/* 80062DBC 0005ED3C  C0 64 00 00 */	lfs f3, 0x0(r4)
/* 80062DC0 0005ED40  38 82 87 E0 */	addi r4, r2, "__log2e_m1$localstatic0$__log2f__Ff"@sda21
/* 80062DC4 0005ED44  C0 01 00 48 */	lfs f0, 0x48(r1)
/* 80062DC8 0005ED48  6D 00 80 00 */	xoris r0, r8, 0x8000
/* 80062DCC 0005ED4C  ED 08 00 F2 */	fmuls f8, f8, f3
/* 80062DD0 0005ED50  C0 84 00 04 */	lfs f4, 0x4(r4)
/* 80062DD4 0005ED54  90 01 00 7C */	stw r0, 0x7c(r1)
/* 80062DD8 0005ED58  3C 00 43 30 */	lis r0, 0x4330
/* 80062DDC 0005ED5C  C0 A2 87 E0 */	lfs f5, "__log2e_m1$localstatic0$__log2f__Ff"@sda21(r2)
/* 80062DE0 0005ED60  EC 68 02 32 */	fmuls f3, f8, f8
/* 80062DE4 0005ED64  90 01 00 78 */	stw r0, 0x78(r1)
/* 80062DE8 0005ED68  EC 08 00 7A */	fmadds f0, f8, f1, f0
/* 80062DEC 0005ED6C  C8 C2 88 10 */	lfd f6, double_800A9B90@sda21(r2)
/* 80062DF0 0005ED70  C8 21 00 78 */	lfd f1, 0x78(r1)
/* 80062DF4 0005ED74  EC 03 00 32 */	fmuls f0, f3, f0
/* 80062DF8 0005ED78  C0 E2 87 FC */	lfs f7, float_800A9B7C@sda21(r2)
/* 80062DFC 0005ED7C  EC 61 30 28 */	fsubs f3, f1, f6
/* 80062E00 0005ED80  7C 23 2C 2E */	lfsx f1, r3, r5
/* 80062E04 0005ED84  EC 04 02 3A */	fmadds f0, f4, f8, f0
/* 80062E08 0005ED88  EC 67 18 2A */	fadds f3, f7, f3
/* 80062E0C 0005ED8C  EC 05 02 3A */	fmadds f0, f5, f8, f0
/* 80062E10 0005ED90  EC 08 00 2A */	fadds f0, f8, f0
/* 80062E14 0005ED94  EC 01 00 2A */	fadds f0, f1, f0
/* 80062E18 0005ED98  EC 03 00 2A */	fadds f0, f3, f0
/* 80062E1C 0005ED9C  48 00 00 2C */	b .L_80062E48
.L_80062E20:
/* 80062E20 0005EDA0  6D 00 80 00 */	xoris r0, r8, 0x8000
/* 80062E24 0005EDA4  C0 62 87 FC */	lfs f3, float_800A9B7C@sda21(r2)
/* 80062E28 0005EDA8  90 01 00 7C */	stw r0, 0x7c(r1)
/* 80062E2C 0005EDAC  54 E0 10 3A */	slwi r0, r7, 2
/* 80062E30 0005EDB0  7C 03 04 2E */	lfsx f0, r3, r0
/* 80062E34 0005EDB4  90 A1 00 78 */	stw r5, 0x78(r1)
/* 80062E38 0005EDB8  C8 21 00 78 */	lfd f1, 0x78(r1)
/* 80062E3C 0005EDBC  EC 21 20 28 */	fsubs f1, f1, f4
/* 80062E40 0005EDC0  EC 23 08 2A */	fadds f1, f3, f1
/* 80062E44 0005EDC4  EC 01 00 2A */	fadds f0, f1, f0
.L_80062E48:
/* 80062E48 0005EDC8  EC 42 00 32 */	fmuls f2, f2, f0
/* 80062E4C 0005EDCC  3C 00 43 30 */	lis r0, 0x4330
/* 80062E50 0005EDD0  C8 22 88 10 */	lfd f1, double_800A9B90@sda21(r2)
/* 80062E54 0005EDD4  FC 00 10 1E */	fctiwz f0, f2
/* 80062E58 0005EDD8  D8 01 00 78 */	stfd f0, 0x78(r1)
/* 80062E5C 0005EDDC  80 81 00 7C */	lwz r4, 0x7c(r1)
/* 80062E60 0005EDE0  90 81 00 38 */	stw r4, 0x38(r1)
/* 80062E64 0005EDE4  80 A1 00 38 */	lwz r5, 0x38(r1)
/* 80062E68 0005EDE8  6C A4 80 00 */	xoris r4, r5, 0x8000
/* 80062E6C 0005EDEC  90 81 00 84 */	stw r4, 0x84(r1)
/* 80062E70 0005EDF0  2C 05 00 80 */	cmpwi r5, 0x80
/* 80062E74 0005EDF4  90 01 00 80 */	stw r0, 0x80(r1)
/* 80062E78 0005EDF8  C8 01 00 80 */	lfd f0, 0x80(r1)
/* 80062E7C 0005EDFC  EC 00 08 28 */	fsubs f0, f0, f1
/* 80062E80 0005EE00  ED 22 00 28 */	fsubs f9, f2, f0
/* 80062E84 0005EE04  40 81 00 0C */	ble .L_80062E90
/* 80062E88 0005EE08  C0 02 87 F0 */	lfs f0, _inf@sda21(r2)
/* 80062E8C 0005EE0C  48 00 00 88 */	b .L_80062F14
.L_80062E90:
/* 80062E90 0005EE10  2C 05 FF 81 */	cmpwi r5, -0x7f
/* 80062E94 0005EE14  40 80 00 0C */	bge .L_80062EA0
/* 80062E98 0005EE18  C0 02 87 F8 */	lfs f0, float_800A9B78@sda21(r2)
/* 80062E9C 0005EE1C  48 00 00 78 */	b .L_80062F14
.L_80062EA0:
/* 80062EA0 0005EE20  38 05 00 7F */	addi r0, r5, 0x7f
/* 80062EA4 0005EE24  C0 C2 88 04 */	lfs f6, float_800A9B84@sda21(r2)
/* 80062EA8 0005EE28  90 01 00 38 */	stw r0, 0x38(r1)
/* 80062EAC 0005EE2C  C0 E2 88 00 */	lfs f7, float_800A9B80@sda21(r2)
/* 80062EB0 0005EE30  80 01 00 38 */	lwz r0, 0x38(r1)
/* 80062EB4 0005EE34  54 00 B8 10 */	slwi r0, r0, 23
/* 80062EB8 0005EE38  90 01 00 38 */	stw r0, 0x38(r1)
/* 80062EBC 0005EE3C  C0 43 02 24 */	lfs f2, 0x224(r3)
/* 80062EC0 0005EE40  C0 03 02 20 */	lfs f0, 0x220(r3)
/* 80062EC4 0005EE44  C0 23 02 1C */	lfs f1, 0x21c(r3)
/* 80062EC8 0005EE48  EC 49 00 BA */	fmadds f2, f9, f2, f0
/* 80062ECC 0005EE4C  C0 03 02 18 */	lfs f0, 0x218(r3)
/* 80062ED0 0005EE50  C0 83 02 14 */	lfs f4, 0x214(r3)
/* 80062ED4 0005EE54  C0 63 02 10 */	lfs f3, 0x210(r3)
/* 80062ED8 0005EE58  EC A9 08 BA */	fmadds f5, f9, f2, f1
/* 80062EDC 0005EE5C  C0 43 02 0C */	lfs f2, 0x20c(r3)
/* 80062EE0 0005EE60  C0 23 02 08 */	lfs f1, 0x208(r3)
/* 80062EE4 0005EE64  EC A9 01 7A */	fmadds f5, f9, f5, f0
/* 80062EE8 0005EE68  C0 03 02 04 */	lfs f0, 0x204(r3)
/* 80062EEC 0005EE6C  C1 01 00 38 */	lfs f8, 0x38(r1)
/* 80062EF0 0005EE70  EC 89 21 7A */	fmadds f4, f9, f5, f4
/* 80062EF4 0005EE74  EC 69 19 3A */	fmadds f3, f9, f4, f3
/* 80062EF8 0005EE78  EC 49 10 FA */	fmadds f2, f9, f3, f2
/* 80062EFC 0005EE7C  EC 29 08 BA */	fmadds f1, f9, f2, f1
/* 80062F00 0005EE80  EC 09 00 7A */	fmadds f0, f9, f1, f0
/* 80062F04 0005EE84  EC 09 00 32 */	fmuls f0, f9, f0
/* 80062F08 0005EE88  EC 06 00 2A */	fadds f0, f6, f0
/* 80062F0C 0005EE8C  EC 07 00 2A */	fadds f0, f7, f0
/* 80062F10 0005EE90  EC 08 00 32 */	fmuls f0, f8, f0
.L_80062F14:
/* 80062F14 0005EE94  FC 20 00 50 */	fneg f1, f0
/* 80062F18 0005EE98  48 00 03 08 */	b .L_80063220
.L_80062F1C:
/* 80062F1C 0005EE9C  FC 00 08 50 */	fneg f0, f1
/* 80062F20 0005EEA0  80 82 87 E8 */	lwz r4, lbl_800A9B68@sda21(r2)
/* 80062F24 0005EEA4  80 02 87 EC */	lwz r0, lbl_800A9B6C@sda21(r2)
/* 80062F28 0005EEA8  90 81 00 28 */	stw r4, 0x28(r1)
/* 80062F2C 0005EEAC  D0 01 00 20 */	stfs f0, 0x20(r1)
/* 80062F30 0005EEB0  81 21 00 20 */	lwz r9, 0x20(r1)
/* 80062F34 0005EEB4  90 01 00 2C */	stw r0, 0x2c(r1)
/* 80062F38 0005EEB8  55 24 4D FE */	srwi r4, r9, 23
/* 80062F3C 0005EEBC  55 20 04 3F */	clrlwi. r0, r9, 16
/* 80062F40 0005EEC0  55 26 02 7E */	clrlwi r6, r9, 9
/* 80062F44 0005EEC4  39 04 FF 80 */	addi r8, r4, -0x80
/* 80062F48 0005EEC8  55 27 86 7E */	extrwi r7, r9, 7, 9
/* 80062F4C 0005EECC  41 82 00 B4 */	beq .L_80063000
/* 80062F50 0005EED0  55 24 02 5E */	rlwinm r4, r9, 0, 9, 15
/* 80062F54 0005EED4  64 85 3F 80 */	oris r5, r4, 0x3f80
/* 80062F58 0005EED8  64 C4 3F 80 */	oris r4, r6, 0x3f80
/* 80062F5C 0005EEDC  90 A1 00 24 */	stw r5, 0x24(r1)
/* 80062F60 0005EEE0  55 20 04 21 */	rlwinm. r0, r9, 0, 16, 16
/* 80062F64 0005EEE4  90 81 00 34 */	stw r4, 0x34(r1)
/* 80062F68 0005EEE8  41 82 00 14 */	beq .L_80062F7C
/* 80062F6C 0005EEEC  80 81 00 24 */	lwz r4, 0x24(r1)
/* 80062F70 0005EEF0  38 E7 00 01 */	addi r7, r7, 0x1
/* 80062F74 0005EEF4  3C 04 00 01 */	addis r0, r4, 0x1
/* 80062F78 0005EEF8  90 01 00 24 */	stw r0, 0x24(r1)
.L_80062F7C:
/* 80062F7C 0005EEFC  3C 80 80 06 */	lis r4, __one_over_F@ha
/* 80062F80 0005EF00  C0 61 00 34 */	lfs f3, 0x34(r1)
/* 80062F84 0005EF04  C0 01 00 24 */	lfs f0, 0x24(r1)
/* 80062F88 0005EF08  54 E5 10 3A */	slwi r5, r7, 2
/* 80062F8C 0005EF0C  38 04 4B 68 */	addi r0, r4, __one_over_F@l
/* 80062F90 0005EF10  C0 21 00 2C */	lfs f1, 0x2c(r1)
/* 80062F94 0005EF14  7C 80 2A 14 */	add r4, r0, r5
/* 80062F98 0005EF18  ED 03 00 28 */	fsubs f8, f3, f0
/* 80062F9C 0005EF1C  C0 64 00 00 */	lfs f3, 0x0(r4)
/* 80062FA0 0005EF20  38 82 87 E0 */	addi r4, r2, "__log2e_m1$localstatic0$__log2f__Ff"@sda21
/* 80062FA4 0005EF24  C0 01 00 28 */	lfs f0, 0x28(r1)
/* 80062FA8 0005EF28  6D 00 80 00 */	xoris r0, r8, 0x8000
/* 80062FAC 0005EF2C  ED 08 00 F2 */	fmuls f8, f8, f3
/* 80062FB0 0005EF30  C0 84 00 04 */	lfs f4, 0x4(r4)
/* 80062FB4 0005EF34  90 01 00 7C */	stw r0, 0x7c(r1)
/* 80062FB8 0005EF38  3C 00 43 30 */	lis r0, 0x4330
/* 80062FBC 0005EF3C  C0 A2 87 E0 */	lfs f5, "__log2e_m1$localstatic0$__log2f__Ff"@sda21(r2)
/* 80062FC0 0005EF40  EC 68 02 32 */	fmuls f3, f8, f8
/* 80062FC4 0005EF44  90 01 00 78 */	stw r0, 0x78(r1)
/* 80062FC8 0005EF48  EC 08 00 7A */	fmadds f0, f8, f1, f0
/* 80062FCC 0005EF4C  C8 C2 88 10 */	lfd f6, double_800A9B90@sda21(r2)
/* 80062FD0 0005EF50  C8 21 00 78 */	lfd f1, 0x78(r1)
/* 80062FD4 0005EF54  EC 03 00 32 */	fmuls f0, f3, f0
/* 80062FD8 0005EF58  C0 E2 87 FC */	lfs f7, float_800A9B7C@sda21(r2)
/* 80062FDC 0005EF5C  EC 61 30 28 */	fsubs f3, f1, f6
/* 80062FE0 0005EF60  7C 23 2C 2E */	lfsx f1, r3, r5
/* 80062FE4 0005EF64  EC 04 02 3A */	fmadds f0, f4, f8, f0
/* 80062FE8 0005EF68  EC 67 18 2A */	fadds f3, f7, f3
/* 80062FEC 0005EF6C  EC 05 02 3A */	fmadds f0, f5, f8, f0
/* 80062FF0 0005EF70  EC 08 00 2A */	fadds f0, f8, f0
/* 80062FF4 0005EF74  EC 01 00 2A */	fadds f0, f1, f0
/* 80062FF8 0005EF78  EC 03 00 2A */	fadds f0, f3, f0
/* 80062FFC 0005EF7C  48 00 00 2C */	b .L_80063028
.L_80063000:
/* 80063000 0005EF80  6D 00 80 00 */	xoris r0, r8, 0x8000
/* 80063004 0005EF84  C0 62 87 FC */	lfs f3, float_800A9B7C@sda21(r2)
/* 80063008 0005EF88  90 01 00 7C */	stw r0, 0x7c(r1)
/* 8006300C 0005EF8C  54 E0 10 3A */	slwi r0, r7, 2
/* 80063010 0005EF90  7C 03 04 2E */	lfsx f0, r3, r0
/* 80063014 0005EF94  90 A1 00 78 */	stw r5, 0x78(r1)
/* 80063018 0005EF98  C8 21 00 78 */	lfd f1, 0x78(r1)
/* 8006301C 0005EF9C  EC 21 20 28 */	fsubs f1, f1, f4
/* 80063020 0005EFA0  EC 23 08 2A */	fadds f1, f3, f1
/* 80063024 0005EFA4  EC 01 00 2A */	fadds f0, f1, f0
.L_80063028:
/* 80063028 0005EFA8  EC 42 00 32 */	fmuls f2, f2, f0
/* 8006302C 0005EFAC  3C 00 43 30 */	lis r0, 0x4330
/* 80063030 0005EFB0  C8 22 88 10 */	lfd f1, double_800A9B90@sda21(r2)
/* 80063034 0005EFB4  FC 00 10 1E */	fctiwz f0, f2
/* 80063038 0005EFB8  D8 01 00 78 */	stfd f0, 0x78(r1)
/* 8006303C 0005EFBC  80 81 00 7C */	lwz r4, 0x7c(r1)
/* 80063040 0005EFC0  90 81 00 18 */	stw r4, 0x18(r1)
/* 80063044 0005EFC4  80 A1 00 18 */	lwz r5, 0x18(r1)
/* 80063048 0005EFC8  6C A4 80 00 */	xoris r4, r5, 0x8000
/* 8006304C 0005EFCC  90 81 00 84 */	stw r4, 0x84(r1)
/* 80063050 0005EFD0  2C 05 00 80 */	cmpwi r5, 0x80
/* 80063054 0005EFD4  90 01 00 80 */	stw r0, 0x80(r1)
/* 80063058 0005EFD8  C8 01 00 80 */	lfd f0, 0x80(r1)
/* 8006305C 0005EFDC  EC 00 08 28 */	fsubs f0, f0, f1
/* 80063060 0005EFE0  ED 22 00 28 */	fsubs f9, f2, f0
/* 80063064 0005EFE4  40 81 00 0C */	ble .L_80063070
/* 80063068 0005EFE8  C0 22 87 F0 */	lfs f1, _inf@sda21(r2)
/* 8006306C 0005EFEC  48 00 01 B4 */	b .L_80063220
.L_80063070:
/* 80063070 0005EFF0  2C 05 FF 81 */	cmpwi r5, -0x7f
/* 80063074 0005EFF4  40 80 00 0C */	bge .L_80063080
/* 80063078 0005EFF8  C0 22 87 F8 */	lfs f1, float_800A9B78@sda21(r2)
/* 8006307C 0005EFFC  48 00 01 A4 */	b .L_80063220
.L_80063080:
/* 80063080 0005F000  38 05 00 7F */	addi r0, r5, 0x7f
/* 80063084 0005F004  C0 C2 88 04 */	lfs f6, float_800A9B84@sda21(r2)
/* 80063088 0005F008  90 01 00 18 */	stw r0, 0x18(r1)
/* 8006308C 0005F00C  C0 E2 88 00 */	lfs f7, float_800A9B80@sda21(r2)
/* 80063090 0005F010  80 01 00 18 */	lwz r0, 0x18(r1)
/* 80063094 0005F014  54 00 B8 10 */	slwi r0, r0, 23
/* 80063098 0005F018  90 01 00 18 */	stw r0, 0x18(r1)
/* 8006309C 0005F01C  C0 43 02 24 */	lfs f2, 0x224(r3)
/* 800630A0 0005F020  C0 03 02 20 */	lfs f0, 0x220(r3)
/* 800630A4 0005F024  C0 23 02 1C */	lfs f1, 0x21c(r3)
/* 800630A8 0005F028  EC 49 00 BA */	fmadds f2, f9, f2, f0
/* 800630AC 0005F02C  C0 03 02 18 */	lfs f0, 0x218(r3)
/* 800630B0 0005F030  C0 83 02 14 */	lfs f4, 0x214(r3)
/* 800630B4 0005F034  C0 63 02 10 */	lfs f3, 0x210(r3)
/* 800630B8 0005F038  EC A9 08 BA */	fmadds f5, f9, f2, f1
/* 800630BC 0005F03C  C0 43 02 0C */	lfs f2, 0x20c(r3)
/* 800630C0 0005F040  C0 23 02 08 */	lfs f1, 0x208(r3)
/* 800630C4 0005F044  EC A9 01 7A */	fmadds f5, f9, f5, f0
/* 800630C8 0005F048  C0 03 02 04 */	lfs f0, 0x204(r3)
/* 800630CC 0005F04C  C1 01 00 18 */	lfs f8, 0x18(r1)
/* 800630D0 0005F050  EC 89 21 7A */	fmadds f4, f9, f5, f4
/* 800630D4 0005F054  EC 69 19 3A */	fmadds f3, f9, f4, f3
/* 800630D8 0005F058  EC 49 10 FA */	fmadds f2, f9, f3, f2
/* 800630DC 0005F05C  EC 29 08 BA */	fmadds f1, f9, f2, f1
/* 800630E0 0005F060  EC 09 00 7A */	fmadds f0, f9, f1, f0
/* 800630E4 0005F064  EC 09 00 32 */	fmuls f0, f9, f0
/* 800630E8 0005F068  EC 06 00 2A */	fadds f0, f6, f0
/* 800630EC 0005F06C  EC 07 00 2A */	fadds f0, f7, f0
/* 800630F0 0005F070  EC 28 00 32 */	fmuls f1, f8, f0
/* 800630F4 0005F074  48 00 01 2C */	b .L_80063220
.L_800630F8:
/* 800630F8 0005F078  D0 21 00 14 */	stfs f1, 0x14(r1)
/* 800630FC 0005F07C  3C 00 7F 80 */	lis r0, 0x7f80
/* 80063100 0005F080  80 81 00 14 */	lwz r4, 0x14(r1)
/* 80063104 0005F084  54 83 00 50 */	rlwinm r3, r4, 0, 1, 8
/* 80063108 0005F088  7C 03 00 00 */	cmpw r3, r0
/* 8006310C 0005F08C  41 82 00 14 */	beq .L_80063120
/* 80063110 0005F090  40 80 00 40 */	bge .L_80063150
/* 80063114 0005F094  2C 03 00 00 */	cmpwi r3, 0x0
/* 80063118 0005F098  41 82 00 20 */	beq .L_80063138
/* 8006311C 0005F09C  48 00 00 34 */	b .L_80063150
.L_80063120:
/* 80063120 0005F0A0  54 80 02 7F */	clrlwi. r0, r4, 9
/* 80063124 0005F0A4  41 82 00 0C */	beq .L_80063130
/* 80063128 0005F0A8  38 00 00 01 */	li r0, 0x1
/* 8006312C 0005F0AC  48 00 00 28 */	b .L_80063154
.L_80063130:
/* 80063130 0005F0B0  38 00 00 02 */	li r0, 0x2
/* 80063134 0005F0B4  48 00 00 20 */	b .L_80063154
.L_80063138:
/* 80063138 0005F0B8  54 80 02 7F */	clrlwi. r0, r4, 9
/* 8006313C 0005F0BC  41 82 00 0C */	beq .L_80063148
/* 80063140 0005F0C0  38 00 00 05 */	li r0, 0x5
/* 80063144 0005F0C4  48 00 00 10 */	b .L_80063154
.L_80063148:
/* 80063148 0005F0C8  38 00 00 03 */	li r0, 0x3
/* 8006314C 0005F0CC  48 00 00 08 */	b .L_80063154
.L_80063150:
/* 80063150 0005F0D0  38 00 00 04 */	li r0, 0x4
.L_80063154:
/* 80063154 0005F0D4  2C 00 00 01 */	cmpwi r0, 0x1
/* 80063158 0005F0D8  40 82 00 08 */	bne .L_80063160
/* 8006315C 0005F0DC  48 00 00 C4 */	b .L_80063220
.L_80063160:
/* 80063160 0005F0E0  D0 41 00 10 */	stfs f2, 0x10(r1)
/* 80063164 0005F0E4  3C 00 7F 80 */	lis r0, 0x7f80
/* 80063168 0005F0E8  80 81 00 10 */	lwz r4, 0x10(r1)
/* 8006316C 0005F0EC  54 83 00 50 */	rlwinm r3, r4, 0, 1, 8
/* 80063170 0005F0F0  7C 03 00 00 */	cmpw r3, r0
/* 80063174 0005F0F4  41 82 00 14 */	beq .L_80063188
/* 80063178 0005F0F8  40 80 00 40 */	bge .L_800631B8
/* 8006317C 0005F0FC  2C 03 00 00 */	cmpwi r3, 0x0
/* 80063180 0005F100  41 82 00 20 */	beq .L_800631A0
/* 80063184 0005F104  48 00 00 34 */	b .L_800631B8
.L_80063188:
/* 80063188 0005F108  54 80 02 7F */	clrlwi. r0, r4, 9
/* 8006318C 0005F10C  41 82 00 0C */	beq .L_80063198
/* 80063190 0005F110  38 00 00 01 */	li r0, 0x1
/* 80063194 0005F114  48 00 00 28 */	b .L_800631BC
.L_80063198:
/* 80063198 0005F118  38 00 00 02 */	li r0, 0x2
/* 8006319C 0005F11C  48 00 00 20 */	b .L_800631BC
.L_800631A0:
/* 800631A0 0005F120  54 80 02 7F */	clrlwi. r0, r4, 9
/* 800631A4 0005F124  41 82 00 0C */	beq .L_800631B0
/* 800631A8 0005F128  38 00 00 05 */	li r0, 0x5
/* 800631AC 0005F12C  48 00 00 10 */	b .L_800631BC
.L_800631B0:
/* 800631B0 0005F130  38 00 00 03 */	li r0, 0x3
/* 800631B4 0005F134  48 00 00 08 */	b .L_800631BC
.L_800631B8:
/* 800631B8 0005F138  38 00 00 04 */	li r0, 0x4
.L_800631BC:
/* 800631BC 0005F13C  2C 00 00 03 */	cmpwi r0, 0x3
/* 800631C0 0005F140  41 82 00 20 */	beq .L_800631E0
/* 800631C4 0005F144  40 80 00 10 */	bge .L_800631D4
/* 800631C8 0005F148  2C 00 00 01 */	cmpwi r0, 0x1
/* 800631CC 0005F14C  40 80 00 1C */	bge .L_800631E8
/* 800631D0 0005F150  48 00 00 4C */	b .L_8006321C
.L_800631D4:
/* 800631D4 0005F154  2C 00 00 06 */	cmpwi r0, 0x6
/* 800631D8 0005F158  40 80 00 44 */	bge .L_8006321C
/* 800631DC 0005F15C  48 00 00 14 */	b .L_800631F0
.L_800631E0:
/* 800631E0 0005F160  C0 22 88 08 */	lfs f1, float_800A9B88@sda21(r2)
/* 800631E4 0005F164  48 00 00 3C */	b .L_80063220
.L_800631E8:
/* 800631E8 0005F168  C0 22 87 F4 */	lfs f1, _nan@sda21(r2)
/* 800631EC 0005F16C  48 00 00 34 */	b .L_80063220
.L_800631F0:
/* 800631F0 0005F170  C0 02 87 F8 */	lfs f0, float_800A9B78@sda21(r2)
/* 800631F4 0005F174  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 800631F8 0005F178  40 80 00 24 */	bge .L_8006321C
/* 800631FC 0005F17C  C0 02 88 0C */	lfs f0, float_800A9B8C@sda21(r2)
/* 80063200 0005F180  FC 00 08 00 */	fcmpu cr0, f0, f1
/* 80063204 0005F184  40 82 00 10 */	bne .L_80063214
/* 80063208 0005F188  C0 02 87 F0 */	lfs f0, _inf@sda21(r2)
/* 8006320C 0005F18C  FC 20 00 50 */	fneg f1, f0
/* 80063210 0005F190  48 00 00 10 */	b .L_80063220
.L_80063214:
/* 80063214 0005F194  C0 22 87 F0 */	lfs f1, _inf@sda21(r2)
/* 80063218 0005F198  48 00 00 08 */	b .L_80063220
.L_8006321C:
/* 8006321C 0005F19C  C0 22 87 F8 */	lfs f1, float_800A9B78@sda21(r2)
.L_80063220:
/* 80063220 0005F1A0  38 21 00 90 */	addi r1, r1, 0x90
/* 80063224 0005F1A4  4E 80 00 20 */	blr
.endfn powf


.section .rodata, "wa"  # 0x80063D20 - 0x80065000

.balign 8


.obj __log2_F, local
	.float -0.375
	.float -0.36377275
	.float -0.352632195
	.float -0.341576993
	.float -0.330605894
	.float -0.319717556
	.float -0.308910817
	.float -0.298184395
	.float -0.287537158
	.float -0.276967913
	.float -0.266475528
	.float -0.256058931
	.float -0.245716989
	.float -0.235448644
	.float -0.225252882
	.float -0.21512866
	.float -0.205074996
	.float -0.195090905
	.float -0.185175434
	.float -0.175327659
	.float -0.165546641
	.float -0.155831486
	.float -0.146181315
	.float -0.136595264
	.float -0.127072483
	.float -0.117612153
	.float -0.108213462
	.float -0.0988755971
	.float -0.089597784
	.float -0.0803792477
	.float -0.0712192506
	.float -0.0621170439
	.float -0.0530719049
	.float -0.0440831222
	.float -0.0351499952
	.float -0.0262718461
	.float -0.017447995
	.float -0.00867778528
	.float 3.94313465E-05
	.float 0.00870429259
	.float 0.0173174236
	.float 0.0258794371
	.float 0.0343909375
	.float 0.0428525135
	.float 0.0512647554
	.float 0.0596282259
	.float 0.0679434985
	.float 0.0762111098
	.float 0.0844316185
	.float 0.0926055536
	.float 0.100733429
	.float 0.108815774
	.float 0.116853096
	.float 0.124845885
	.float 0.132794634
	.float 0.140699834
	.float 0.148561954
	.float 0.156381458
	.float 0.164158806
	.float 0.171894461
	.float 0.179588854
	.float 0.187242419
	.float 0.194855601
	.float 0.202428833
	.float 0.209962502
	.float 0.217457041
	.float 0.224912837
	.float 0.232330307
	.float 0.239709839
	.float 0.24705182
	.float 0.254356623
	.float 0.261624634
	.float 0.268856198
	.float 0.2760517
	.float 0.28321147
	.float 0.290335923
	.float 0.29742533
	.float 0.304480106
	.float 0.31150052
	.float 0.318486959
	.float 0.325439721
	.float 0.332359135
	.float 0.339245528
	.float 0.346099198
	.float 0.352920443
	.float 0.35970962
	.float 0.366466999
	.float 0.373192847
	.float 0.379887491
	.float 0.386551231
	.float 0.393184334
	.float 0.399787068
	.float 0.406359702
	.float 0.412902564
	.float 0.419415861
	.float 0.425899893
	.float 0.432354927
	.float 0.438781202
	.float 0.445178956
	.float 0.451548487
	.float 0.457890004
	.float 0.464203775
	.float 0.470490038
	.float 0.476749033
	.float 0.482980996
	.float 0.489186138
	.float 0.495364726
	.float 0.501516938
	.float 0.507643044
	.float 0.513743222
	.float 0.51981777
	.float 0.525866807
	.float 0.531890571
	.float 0.537889361
	.float 0.543863237
	.float 0.549812496
	.float 0.555737317
	.float 0.561637938
	.float 0.567514479
	.float 0.573367238
	.float 0.579196334
	.float 0.585001945
	.float 0.590784311
	.float 0.59654355
	.float 0.602279902
	.float 0.607993603
	.float 0.613684714
	.float 0.619353414
	.float 0.625
.endobj __log2_F

.obj __two_to_x, local
	.float 0.693147182
	.float 0.240226507
	.float 0.0555041581
	.float 0.00961813424
	.float 0.00133318256
	.float 0.00015401977
	.float 1.54832742E-05
	.float 1.33928177E-06
	.float 1.02999984E-07
.endobj __two_to_x

.obj "__exp_to_x$105", local
	.float 0.999999881
	.float 0.49999997
	.float 0.166667983
	.float 0.0416668877
	.float 0.00832859613
	.float 0.001388276
	.float 0.000204699929
	.float 2.54991846E-05
.endobj "__exp_to_x$105"

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0 ; 0x00000820

.balign 8

#weak
.obj "__log2e_m1$localstatic0$__log2f__Ff", local
	.float 0.41015625
	.float 0.03253879
.endobj "__log2e_m1$localstatic0$__log2f__Ff"

.obj lbl_800A9B68, local
	.4byte 0xBF38AA80
.endobj lbl_800A9B68

.obj lbl_800A9B6C, local
	.4byte 0x3EF637A6
.endobj lbl_800A9B6C

.obj _inf, local
	.4byte 0x7F800000
.endobj _inf

.obj _nan, local
	.4byte 0x7FFFFFFF
.endobj _nan

.obj float_800A9B78, local
	.float 0
.endobj float_800A9B78

.obj float_800A9B7C, local
	.float 1.375
.endobj float_800A9B7C

.obj float_800A9B80, local
	.float 0.75
.endobj float_800A9B80

.obj float_800A9B84, local
	.float 0.25
.endobj float_800A9B84

.obj float_800A9B88, local
	.float 1
.endobj float_800A9B88

.obj float_800A9B8C, local
	.float -0
.endobj float_800A9B8C

.obj double_800A9B90, local
	.8byte 0x4330000080000000
.endobj double_800A9B90

