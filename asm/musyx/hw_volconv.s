.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740



.fn salCalcVolume, global
/* 800538E8 0004F868  7C 08 02 A6 */	mflr r0
/* 800538EC 0004F86C  90 01 00 04 */	stw r0, 0x4(r1)
/* 800538F0 0004F870  54 60 06 3F */	clrlwi. r0, r3, 24
/* 800538F4 0004F874  3C 60 80 07 */	lis r3, musyx_vol_tab@ha
/* 800538F8 0004F878  94 21 FE A8 */	stwu r1, -0x158(r1)
/* 800538FC 0004F87C  DB E1 01 50 */	stfd f31, 0x150(r1)
/* 80053900 0004F880  FF E0 18 90 */	fmr f31, f3
/* 80053904 0004F884  DB C1 01 48 */	stfd f30, 0x148(r1)
/* 80053908 0004F888  FF C0 10 90 */	fmr f30, f2
/* 8005390C 0004F88C  DB A1 01 40 */	stfd f29, 0x140(r1)
/* 80053910 0004F890  FF A0 08 90 */	fmr f29, f1
/* 80053914 0004F894  DB 81 01 38 */	stfd f28, 0x138(r1)
/* 80053918 0004F898  DB 61 01 30 */	stfd f27, 0x130(r1)
/* 8005391C 0004F89C  DB 41 01 28 */	stfd f26, 0x128(r1)
/* 80053920 0004F8A0  DB 21 01 20 */	stfd f25, 0x120(r1)
/* 80053924 0004F8A4  DB 01 01 18 */	stfd f24, 0x118(r1)
/* 80053928 0004F8A8  DA E1 01 10 */	stfd f23, 0x110(r1)
/* 8005392C 0004F8AC  DA C1 01 08 */	stfd f22, 0x108(r1)
/* 80053930 0004F8B0  DA A1 01 00 */	stfd f21, 0x100(r1)
/* 80053934 0004F8B4  DA 81 00 F8 */	stfd f20, 0xf8(r1)
/* 80053938 0004F8B8  BE 41 00 C0 */	stmw r18, 0xc0(r1)
/* 8005393C 0004F8BC  3B C3 A0 F0 */	addi r30, r3, musyx_vol_tab@l
/* 80053940 0004F8C0  3B E4 00 00 */	addi r31, r4, 0x0
/* 80053944 0004F8C4  3A 47 00 00 */	addi r18, r7, 0x0
/* 80053948 0004F8C8  3B 88 00 00 */	addi r28, r8, 0x0
/* 8005394C 0004F8CC  40 82 00 0C */	bne .L_80053958
/* 80053950 0004F8D0  7F DD F3 78 */	mr r29, r30
/* 80053954 0004F8D4  48 00 00 0C */	b .L_80053960
.L_80053958:
/* 80053958 0004F8D8  3C 60 80 07 */	lis r3, dspDLSVolTab@ha
/* 8005395C 0004F8DC  3B A3 9E B4 */	addi r29, r3, dspDLSVolTab@l
.L_80053960:
/* 80053960 0004F8E0  3C 05 FF 80 */	addis r0, r5, 0xff80
/* 80053964 0004F8E4  28 00 00 00 */	cmplwi r0, 0x0
/* 80053968 0004F8E8  40 82 00 0C */	bne .L_80053974
/* 8005396C 0004F8EC  38 A0 00 00 */	li r5, 0x0
/* 80053970 0004F8F0  3C C0 00 7F */	lis r6, 0x7f
.L_80053974:
/* 80053974 0004F8F4  3C 00 00 01 */	lis r0, 0x1
/* 80053978 0004F8F8  7C 05 00 40 */	cmplw r5, r0
/* 8005397C 0004F8FC  41 81 00 0C */	bgt .L_80053988
/* 80053980 0004F900  38 60 00 00 */	li r3, 0x0
/* 80053984 0004F904  48 00 00 08 */	b .L_8005398C
.L_80053988:
/* 80053988 0004F908  3C 65 FF FF */	addis r3, r5, 0xffff
.L_8005398C:
/* 8005398C 0004F90C  3C 00 00 01 */	lis r0, 0x1
/* 80053990 0004F910  7C 06 00 40 */	cmplw r6, r0
/* 80053994 0004F914  41 81 00 0C */	bgt .L_800539A0
/* 80053998 0004F918  38 80 00 00 */	li r4, 0x0
/* 8005399C 0004F91C  48 00 00 08 */	b .L_800539A4
.L_800539A0:
/* 800539A0 0004F920  3C 86 FF FF */	addis r4, r6, 0xffff
.L_800539A4:
/* 800539A4 0004F924  90 61 00 BC */	stw r3, 0xbc(r1)
/* 800539A8 0004F928  3C 00 43 30 */	lis r0, 0x4330
/* 800539AC 0004F92C  C8 42 86 A0 */	lfd f2, double_800A9A20@sda21(r2)
/* 800539B0 0004F930  28 1C 00 00 */	cmplwi r28, 0x0
/* 800539B4 0004F934  90 81 00 B4 */	stw r4, 0xb4(r1)
/* 800539B8 0004F938  C0 62 86 A8 */	lfs f3, float_800A9A28@sda21(r2)
/* 800539BC 0004F93C  90 01 00 B8 */	stw r0, 0xb8(r1)
/* 800539C0 0004F940  90 01 00 B0 */	stw r0, 0xb0(r1)
/* 800539C4 0004F944  C8 21 00 B8 */	lfd f1, 0xb8(r1)
/* 800539C8 0004F948  C8 01 00 B0 */	lfd f0, 0xb0(r1)
/* 800539CC 0004F94C  EC 21 10 28 */	fsubs f1, f1, f2
/* 800539D0 0004F950  EC 00 10 28 */	fsubs f0, f0, f2
/* 800539D4 0004F954  EE 83 00 72 */	fmuls f20, f3, f1
/* 800539D8 0004F958  EE A3 00 32 */	fmuls f21, f3, f0
/* 800539DC 0004F95C  41 82 00 8C */	beq .L_80053A68
/* 800539E0 0004F960  C0 02 86 94 */	lfs f0, float_800A9A14@sda21(r2)
/* 800539E4 0004F964  FC 20 A2 10 */	fabs f1, f20
/* 800539E8 0004F968  FC 40 02 10 */	fabs f2, f0
/* 800539EC 0004F96C  FC 02 08 40 */	fcmpo cr0, f2, f1
/* 800539F0 0004F970  40 81 00 0C */	ble .L_800539FC
/* 800539F4 0004F974  FF 00 A0 90 */	fmr f24, f20
/* 800539F8 0004F978  48 00 00 1C */	b .L_80053A14
.L_800539FC:
/* 800539FC 0004F97C  EC 34 00 24 */	fdivs f1, f20, f0
/* 80053A00 0004F980  48 00 BE 85 */	bl __cvt_dbl_usll
/* 80053A04 0004F984  48 00 BD CD */	bl __cvt_sll_flt
/* 80053A08 0004F988  C0 02 86 94 */	lfs f0, float_800A9A14@sda21(r2)
/* 80053A0C 0004F98C  EC 00 00 72 */	fmuls f0, f0, f1
/* 80053A10 0004F990  EF 14 00 28 */	fsubs f24, f20, f0
.L_80053A14:
/* 80053A14 0004F994  FC 20 A0 90 */	fmr f1, f20
/* 80053A18 0004F998  48 00 B9 E5 */	bl __cvt_fp2unsigned
/* 80053A1C 0004F99C  C0 22 86 AC */	lfs f1, float_800A9A2C@sda21(r2)
/* 80053A20 0004F9A0  7C 7A 1B 78 */	mr r26, r3
/* 80053A24 0004F9A4  C0 02 86 94 */	lfs f0, float_800A9A14@sda21(r2)
/* 80053A28 0004F9A8  EE C1 A0 28 */	fsubs f22, f1, f20
/* 80053A2C 0004F9AC  FC 40 02 10 */	fabs f2, f0
/* 80053A30 0004F9B0  FC 20 B2 10 */	fabs f1, f22
/* 80053A34 0004F9B4  FC 02 08 40 */	fcmpo cr0, f2, f1
/* 80053A38 0004F9B8  40 81 00 0C */	ble .L_80053A44
/* 80053A3C 0004F9BC  FE E0 B0 90 */	fmr f23, f22
/* 80053A40 0004F9C0  48 00 00 1C */	b .L_80053A5C
.L_80053A44:
/* 80053A44 0004F9C4  EC 36 00 24 */	fdivs f1, f22, f0
/* 80053A48 0004F9C8  48 00 BE 3D */	bl __cvt_dbl_usll
/* 80053A4C 0004F9CC  48 00 BD 85 */	bl __cvt_sll_flt
/* 80053A50 0004F9D0  C0 02 86 94 */	lfs f0, float_800A9A14@sda21(r2)
/* 80053A54 0004F9D4  EC 00 00 72 */	fmuls f0, f0, f1
/* 80053A58 0004F9D8  EE F6 00 28 */	fsubs f23, f22, f0
.L_80053A5C:
/* 80053A5C 0004F9DC  FC 20 B0 90 */	fmr f1, f22
/* 80053A60 0004F9E0  48 00 B9 9D */	bl __cvt_fp2unsigned
/* 80053A64 0004F9E4  7C 7B 1B 78 */	mr r27, r3
.L_80053A68:
/* 80053A68 0004F9E8  28 12 00 00 */	cmplwi r18, 0x0
/* 80053A6C 0004F9EC  41 82 00 18 */	beq .L_80053A84
/* 80053A70 0004F9F0  C0 42 86 94 */	lfs f2, float_800A9A14@sda21(r2)
/* 80053A74 0004F9F4  C0 22 86 B0 */	lfs f1, float_800A9A30@sda21(r2)
/* 80053A78 0004F9F8  EC 14 10 28 */	fsubs f0, f20, f2
/* 80053A7C 0004F9FC  EC 01 00 32 */	fmuls f0, f1, f0
/* 80053A80 0004FA00  EE 82 00 2A */	fadds f20, f2, f0
.L_80053A84:
/* 80053A84 0004FA04  C0 02 86 94 */	lfs f0, float_800A9A14@sda21(r2)
/* 80053A88 0004FA08  FC 20 A2 10 */	fabs f1, f20
/* 80053A8C 0004FA0C  FC 40 02 10 */	fabs f2, f0
/* 80053A90 0004FA10  FC 02 08 40 */	fcmpo cr0, f2, f1
/* 80053A94 0004FA14  40 81 00 0C */	ble .L_80053AA0
/* 80053A98 0004FA18  FF 80 A0 90 */	fmr f28, f20
/* 80053A9C 0004FA1C  48 00 00 1C */	b .L_80053AB8
.L_80053AA0:
/* 80053AA0 0004FA20  EC 34 00 24 */	fdivs f1, f20, f0
/* 80053AA4 0004FA24  48 00 BD E1 */	bl __cvt_dbl_usll
/* 80053AA8 0004FA28  48 00 BD 29 */	bl __cvt_sll_flt
/* 80053AAC 0004FA2C  C0 02 86 94 */	lfs f0, float_800A9A14@sda21(r2)
/* 80053AB0 0004FA30  EC 00 00 72 */	fmuls f0, f0, f1
/* 80053AB4 0004FA34  EF 94 00 28 */	fsubs f28, f20, f0
.L_80053AB8:
/* 80053AB8 0004FA38  FC 20 A0 90 */	fmr f1, f20
/* 80053ABC 0004FA3C  48 00 B9 41 */	bl __cvt_fp2unsigned
/* 80053AC0 0004FA40  C0 02 86 94 */	lfs f0, float_800A9A14@sda21(r2)
/* 80053AC4 0004FA44  FC 20 AA 10 */	fabs f1, f21
/* 80053AC8 0004FA48  7C 79 1B 78 */	mr r25, r3
/* 80053ACC 0004FA4C  FC 40 02 10 */	fabs f2, f0
/* 80053AD0 0004FA50  FC 02 08 40 */	fcmpo cr0, f2, f1
/* 80053AD4 0004FA54  40 81 00 0C */	ble .L_80053AE0
/* 80053AD8 0004FA58  FF 60 A8 90 */	fmr f27, f21
/* 80053ADC 0004FA5C  48 00 00 1C */	b .L_80053AF8
.L_80053AE0:
/* 80053AE0 0004FA60  EC 35 00 24 */	fdivs f1, f21, f0
/* 80053AE4 0004FA64  48 00 BD A1 */	bl __cvt_dbl_usll
/* 80053AE8 0004FA68  48 00 BC E9 */	bl __cvt_sll_flt
/* 80053AEC 0004FA6C  C0 02 86 94 */	lfs f0, float_800A9A14@sda21(r2)
/* 80053AF0 0004FA70  EC 00 00 72 */	fmuls f0, f0, f1
/* 80053AF4 0004FA74  EF 75 00 28 */	fsubs f27, f21, f0
.L_80053AF8:
/* 80053AF8 0004FA78  FC 20 A8 90 */	fmr f1, f21
/* 80053AFC 0004FA7C  48 00 B9 01 */	bl __cvt_fp2unsigned
/* 80053B00 0004FA80  C0 22 86 AC */	lfs f1, float_800A9A2C@sda21(r2)
/* 80053B04 0004FA84  7C 75 1B 78 */	mr r21, r3
/* 80053B08 0004FA88  C0 02 86 94 */	lfs f0, float_800A9A14@sda21(r2)
/* 80053B0C 0004FA8C  EE C1 A0 28 */	fsubs f22, f1, f20
/* 80053B10 0004FA90  FC 40 02 10 */	fabs f2, f0
/* 80053B14 0004FA94  EE 81 A8 28 */	fsubs f20, f1, f21
/* 80053B18 0004FA98  FC 20 B2 10 */	fabs f1, f22
/* 80053B1C 0004FA9C  FC 02 08 40 */	fcmpo cr0, f2, f1
/* 80053B20 0004FAA0  40 81 00 0C */	ble .L_80053B2C
/* 80053B24 0004FAA4  FF 40 B0 90 */	fmr f26, f22
/* 80053B28 0004FAA8  48 00 00 1C */	b .L_80053B44
.L_80053B2C:
/* 80053B2C 0004FAAC  EC 36 00 24 */	fdivs f1, f22, f0
/* 80053B30 0004FAB0  48 00 BD 55 */	bl __cvt_dbl_usll
/* 80053B34 0004FAB4  48 00 BC 9D */	bl __cvt_sll_flt
/* 80053B38 0004FAB8  C0 02 86 94 */	lfs f0, float_800A9A14@sda21(r2)
/* 80053B3C 0004FABC  EC 00 00 72 */	fmuls f0, f0, f1
/* 80053B40 0004FAC0  EF 56 00 28 */	fsubs f26, f22, f0
.L_80053B44:
/* 80053B44 0004FAC4  FC 20 B0 90 */	fmr f1, f22
/* 80053B48 0004FAC8  48 00 B8 B5 */	bl __cvt_fp2unsigned
/* 80053B4C 0004FACC  C0 02 86 94 */	lfs f0, float_800A9A14@sda21(r2)
/* 80053B50 0004FAD0  FC 20 A2 10 */	fabs f1, f20
/* 80053B54 0004FAD4  7C 74 1B 78 */	mr r20, r3
/* 80053B58 0004FAD8  FC 40 02 10 */	fabs f2, f0
/* 80053B5C 0004FADC  FC 02 08 40 */	fcmpo cr0, f2, f1
/* 80053B60 0004FAE0  40 81 00 0C */	ble .L_80053B6C
/* 80053B64 0004FAE4  FF 20 A0 90 */	fmr f25, f20
/* 80053B68 0004FAE8  48 00 00 1C */	b .L_80053B84
.L_80053B6C:
/* 80053B6C 0004FAEC  EC 34 00 24 */	fdivs f1, f20, f0
/* 80053B70 0004FAF0  48 00 BD 15 */	bl __cvt_dbl_usll
/* 80053B74 0004FAF4  48 00 BC 5D */	bl __cvt_sll_flt
/* 80053B78 0004FAF8  C0 02 86 94 */	lfs f0, float_800A9A14@sda21(r2)
/* 80053B7C 0004FAFC  EC 00 00 72 */	fmuls f0, f0, f1
/* 80053B80 0004FB00  EF 34 00 28 */	fsubs f25, f20, f0
.L_80053B84:
/* 80053B84 0004FB04  FC 20 A0 90 */	fmr f1, f20
/* 80053B88 0004FB08  48 00 B8 75 */	bl __cvt_fp2unsigned
/* 80053B8C 0004FB0C  28 1C 00 00 */	cmplwi r28, 0x0
/* 80053B90 0004FB10  3A 63 00 00 */	addi r19, r3, 0x0
/* 80053B94 0004FB14  40 82 02 90 */	bne .L_80053E24
/* 80053B98 0004FB18  C0 02 86 90 */	lfs f0, float_800A9A10@sda21(r2)
/* 80053B9C 0004FB1C  EE 80 07 72 */	fmuls f20, f0, f29
/* 80053BA0 0004FB20  FC 20 A0 90 */	fmr f1, f20
/* 80053BA4 0004FB24  48 00 B8 59 */	bl __cvt_fp2unsigned
/* 80053BA8 0004FB28  90 61 00 B4 */	stw r3, 0xb4(r1)
/* 80053BAC 0004FB2C  54 60 10 3A */	slwi r0, r3, 2
/* 80053BB0 0004FB30  3E 40 43 30 */	lis r18, 0x4330
/* 80053BB4 0004FB34  C0 C2 86 94 */	lfs f6, float_800A9A14@sda21(r2)
/* 80053BB8 0004FB38  92 41 00 B0 */	stw r18, 0xb0(r1)
/* 80053BBC 0004FB3C  56 A4 10 3A */	slwi r4, r21, 2
/* 80053BC0 0004FB40  C8 22 86 A0 */	lfd f1, double_800A9A20@sda21(r2)
/* 80053BC4 0004FB44  C8 01 00 B0 */	lfd f0, 0xb0(r1)
/* 80053BC8 0004FB48  56 66 10 3A */	slwi r6, r19, 2
/* 80053BCC 0004FB4C  38 BE 02 08 */	addi r5, r30, 0x208
/* 80053BD0 0004FB50  EF 06 D8 28 */	fsubs f24, f6, f27
/* 80053BD4 0004FB54  EC 00 08 28 */	fsubs f0, f0, f1
/* 80053BD8 0004FB58  56 88 10 3A */	slwi r8, r20, 2
/* 80053BDC 0004FB5C  7C 9D 04 2E */	lfsx f4, r29, r0
/* 80053BE0 0004FB60  57 27 10 3A */	slwi r7, r25, 2
/* 80053BE4 0004FB64  EC F4 00 28 */	fsubs f7, f20, f0
/* 80053BE8 0004FB68  7C 7D 02 14 */	add r3, r29, r0
/* 80053BEC 0004FB6C  C0 62 86 98 */	lfs f3, float_800A9A18@sda21(r2)
/* 80053BF0 0004FB70  7E 65 22 14 */	add r19, r5, r4
/* 80053BF4 0004FB74  C0 43 00 04 */	lfs f2, 0x4(r3)
/* 80053BF8 0004FB78  EC A6 38 28 */	fsubs f5, f6, f7
/* 80053BFC 0004FB7C  7F 5E 22 14 */	add r26, r30, r4
/* 80053C00 0004FB80  C4 3A 02 04 */	lfsu f1, 0x204(r26)
/* 80053C04 0004FB84  EF A6 C8 28 */	fsubs f29, f6, f25
/* 80053C08 0004FB88  C0 13 00 00 */	lfs f0, 0x0(r19)
/* 80053C0C 0004FB8C  EC A5 01 32 */	fmuls f5, f5, f4
/* 80053C10 0004FB90  7E 85 32 14 */	add r20, r5, r6
/* 80053C14 0004FB94  EC 87 00 B2 */	fmuls f4, f7, f2
/* 80053C18 0004FB98  7E BE 32 14 */	add r21, r30, r6
/* 80053C1C 0004FB9C  EC 58 00 72 */	fmuls f2, f24, f1
/* 80053C20 0004FBA0  EC 3B 00 32 */	fmuls f1, f27, f0
/* 80053C24 0004FBA4  7E C5 3A 14 */	add r22, r5, r7
/* 80053C28 0004FBA8  EC 05 20 2A */	fadds f0, f5, f4
/* 80053C2C 0004FBAC  7F 3E 3A 14 */	add r25, r30, r7
/* 80053C30 0004FBB0  EE C6 E0 28 */	fsubs f22, f6, f28
/* 80053C34 0004FBB4  EC 22 08 2A */	fadds f1, f2, f1
/* 80053C38 0004FBB8  7E E5 42 14 */	add r23, r5, r8
/* 80053C3C 0004FBBC  EE A6 D0 28 */	fsubs f21, f6, f26
/* 80053C40 0004FBC0  7F 7E 42 14 */	add r27, r30, r8
/* 80053C44 0004FBC4  EC 20 00 72 */	fmuls f1, f0, f1
/* 80053C48 0004FBC8  EC 23 00 72 */	fmuls f1, f3, f1
/* 80053C4C 0004FBCC  D0 3F 00 08 */	stfs f1, 0x8(r31)
/* 80053C50 0004FBD0  C4 75 02 04 */	lfsu f3, 0x204(r21)
/* 80053C54 0004FBD4  C4 59 02 04 */	lfsu f2, 0x204(r25)
/* 80053C58 0004FBD8  C0 34 00 00 */	lfs f1, 0x0(r20)
/* 80053C5C 0004FBDC  EC 9D 00 F2 */	fmuls f4, f29, f3
/* 80053C60 0004FBE0  EC 56 00 B2 */	fmuls f2, f22, f2
/* 80053C64 0004FBE4  EC 79 00 72 */	fmuls f3, f25, f1
/* 80053C68 0004FBE8  C0 36 00 00 */	lfs f1, 0x0(r22)
/* 80053C6C 0004FBEC  EC 3C 00 72 */	fmuls f1, f28, f1
/* 80053C70 0004FBF0  EC 64 18 2A */	fadds f3, f4, f3
/* 80053C74 0004FBF4  EC 22 08 2A */	fadds f1, f2, f1
/* 80053C78 0004FBF8  EC 00 00 F2 */	fmuls f0, f0, f3
/* 80053C7C 0004FBFC  EC 20 00 72 */	fmuls f1, f0, f1
/* 80053C80 0004FC00  D0 3F 00 04 */	stfs f1, 0x4(r31)
/* 80053C84 0004FC04  C4 5B 02 04 */	lfsu f2, 0x204(r27)
/* 80053C88 0004FC08  C0 37 00 00 */	lfs f1, 0x0(r23)
/* 80053C8C 0004FC0C  EC 55 00 B2 */	fmuls f2, f21, f2
/* 80053C90 0004FC10  EC 3A 00 72 */	fmuls f1, f26, f1
/* 80053C94 0004FC14  EC 22 08 2A */	fadds f1, f2, f1
/* 80053C98 0004FC18  EC 00 00 72 */	fmuls f0, f0, f1
/* 80053C9C 0004FC1C  D0 1F 00 00 */	stfs f0, 0x0(r31)
/* 80053CA0 0004FC20  C0 02 86 90 */	lfs f0, float_800A9A10@sda21(r2)
/* 80053CA4 0004FC24  EE E0 07 B2 */	fmuls f23, f0, f30
/* 80053CA8 0004FC28  FC 20 B8 90 */	fmr f1, f23
/* 80053CAC 0004FC2C  48 00 B7 51 */	bl __cvt_fp2unsigned
/* 80053CB0 0004FC30  90 61 00 BC */	stw r3, 0xbc(r1)
/* 80053CB4 0004FC34  54 60 10 3A */	slwi r0, r3, 2
/* 80053CB8 0004FC38  7C 7D 02 14 */	add r3, r29, r0
/* 80053CBC 0004FC3C  C0 3A 00 00 */	lfs f1, 0x0(r26)
/* 80053CC0 0004FC40  92 41 00 B8 */	stw r18, 0xb8(r1)
/* 80053CC4 0004FC44  C0 13 00 00 */	lfs f0, 0x0(r19)
/* 80053CC8 0004FC48  EC 38 00 72 */	fmuls f1, f24, f1
/* 80053CCC 0004FC4C  C8 62 86 A0 */	lfd f3, double_800A9A20@sda21(r2)
/* 80053CD0 0004FC50  C8 41 00 B8 */	lfd f2, 0xb8(r1)
/* 80053CD4 0004FC54  EC 1B 00 32 */	fmuls f0, f27, f0
/* 80053CD8 0004FC58  C0 82 86 94 */	lfs f4, float_800A9A14@sda21(r2)
/* 80053CDC 0004FC5C  EC A2 18 28 */	fsubs f5, f2, f3
/* 80053CE0 0004FC60  7C 7D 04 2E */	lfsx f3, r29, r0
/* 80053CE4 0004FC64  C0 43 00 04 */	lfs f2, 0x4(r3)
/* 80053CE8 0004FC68  EC 01 00 2A */	fadds f0, f1, f0
/* 80053CEC 0004FC6C  C0 22 86 98 */	lfs f1, float_800A9A18@sda21(r2)
/* 80053CF0 0004FC70  EC B7 28 28 */	fsubs f5, f23, f5
/* 80053CF4 0004FC74  EC 84 28 28 */	fsubs f4, f4, f5
/* 80053CF8 0004FC78  EC 45 00 B2 */	fmuls f2, f5, f2
/* 80053CFC 0004FC7C  EC 64 00 F2 */	fmuls f3, f4, f3
/* 80053D00 0004FC80  EC 83 10 2A */	fadds f4, f3, f2
/* 80053D04 0004FC84  EC 04 00 32 */	fmuls f0, f4, f0
/* 80053D08 0004FC88  EC 01 00 32 */	fmuls f0, f1, f0
/* 80053D0C 0004FC8C  D0 1F 00 14 */	stfs f0, 0x14(r31)
/* 80053D10 0004FC90  C0 55 00 00 */	lfs f2, 0x0(r21)
/* 80053D14 0004FC94  C0 14 00 00 */	lfs f0, 0x0(r20)
/* 80053D18 0004FC98  C0 39 00 00 */	lfs f1, 0x0(r25)
/* 80053D1C 0004FC9C  EC 7D 00 B2 */	fmuls f3, f29, f2
/* 80053D20 0004FCA0  EC 59 00 32 */	fmuls f2, f25, f0
/* 80053D24 0004FCA4  C0 16 00 00 */	lfs f0, 0x0(r22)
/* 80053D28 0004FCA8  EC 36 00 72 */	fmuls f1, f22, f1
/* 80053D2C 0004FCAC  EC 1C 00 32 */	fmuls f0, f28, f0
/* 80053D30 0004FCB0  EC 43 10 2A */	fadds f2, f3, f2
/* 80053D34 0004FCB4  EC 01 00 2A */	fadds f0, f1, f0
/* 80053D38 0004FCB8  EC 84 00 B2 */	fmuls f4, f4, f2
/* 80053D3C 0004FCBC  EC 04 00 32 */	fmuls f0, f4, f0
/* 80053D40 0004FCC0  D0 1F 00 10 */	stfs f0, 0x10(r31)
/* 80053D44 0004FCC4  C0 3B 00 00 */	lfs f1, 0x0(r27)
/* 80053D48 0004FCC8  C0 17 00 00 */	lfs f0, 0x0(r23)
/* 80053D4C 0004FCCC  EC 35 00 72 */	fmuls f1, f21, f1
/* 80053D50 0004FCD0  EC 1A 00 32 */	fmuls f0, f26, f0
/* 80053D54 0004FCD4  EC 01 00 2A */	fadds f0, f1, f0
/* 80053D58 0004FCD8  EC 04 00 32 */	fmuls f0, f4, f0
/* 80053D5C 0004FCDC  D0 1F 00 0C */	stfs f0, 0xc(r31)
/* 80053D60 0004FCE0  C0 02 86 90 */	lfs f0, float_800A9A10@sda21(r2)
/* 80053D64 0004FCE4  EE E0 07 F2 */	fmuls f23, f0, f31
/* 80053D68 0004FCE8  FC 20 B8 90 */	fmr f1, f23
/* 80053D6C 0004FCEC  48 00 B6 91 */	bl __cvt_fp2unsigned
/* 80053D70 0004FCF0  90 61 00 AC */	stw r3, 0xac(r1)
/* 80053D74 0004FCF4  54 60 10 3A */	slwi r0, r3, 2
/* 80053D78 0004FCF8  7C 7D 02 14 */	add r3, r29, r0
/* 80053D7C 0004FCFC  C0 3A 00 00 */	lfs f1, 0x0(r26)
/* 80053D80 0004FD00  92 41 00 A8 */	stw r18, 0xa8(r1)
/* 80053D84 0004FD04  C0 13 00 00 */	lfs f0, 0x0(r19)
/* 80053D88 0004FD08  EC 38 00 72 */	fmuls f1, f24, f1
/* 80053D8C 0004FD0C  C8 62 86 A0 */	lfd f3, double_800A9A20@sda21(r2)
/* 80053D90 0004FD10  C8 41 00 A8 */	lfd f2, 0xa8(r1)
/* 80053D94 0004FD14  EC 1B 00 32 */	fmuls f0, f27, f0
/* 80053D98 0004FD18  C0 82 86 94 */	lfs f4, float_800A9A14@sda21(r2)
/* 80053D9C 0004FD1C  EC A2 18 28 */	fsubs f5, f2, f3
/* 80053DA0 0004FD20  7C 7D 04 2E */	lfsx f3, r29, r0
/* 80053DA4 0004FD24  C0 43 00 04 */	lfs f2, 0x4(r3)
/* 80053DA8 0004FD28  EC 01 00 2A */	fadds f0, f1, f0
/* 80053DAC 0004FD2C  C0 22 86 98 */	lfs f1, float_800A9A18@sda21(r2)
/* 80053DB0 0004FD30  EC B7 28 28 */	fsubs f5, f23, f5
/* 80053DB4 0004FD34  EC 84 28 28 */	fsubs f4, f4, f5
/* 80053DB8 0004FD38  EC 45 00 B2 */	fmuls f2, f5, f2
/* 80053DBC 0004FD3C  EC 64 00 F2 */	fmuls f3, f4, f3
/* 80053DC0 0004FD40  EC 83 10 2A */	fadds f4, f3, f2
/* 80053DC4 0004FD44  EC 04 00 32 */	fmuls f0, f4, f0
/* 80053DC8 0004FD48  EC 01 00 32 */	fmuls f0, f1, f0
/* 80053DCC 0004FD4C  D0 1F 00 20 */	stfs f0, 0x20(r31)
/* 80053DD0 0004FD50  C0 55 00 00 */	lfs f2, 0x0(r21)
/* 80053DD4 0004FD54  C0 14 00 00 */	lfs f0, 0x0(r20)
/* 80053DD8 0004FD58  C0 39 00 00 */	lfs f1, 0x0(r25)
/* 80053DDC 0004FD5C  EC 7D 00 B2 */	fmuls f3, f29, f2
/* 80053DE0 0004FD60  EC 59 00 32 */	fmuls f2, f25, f0
/* 80053DE4 0004FD64  C0 16 00 00 */	lfs f0, 0x0(r22)
/* 80053DE8 0004FD68  EC 36 00 72 */	fmuls f1, f22, f1
/* 80053DEC 0004FD6C  EC 1C 00 32 */	fmuls f0, f28, f0
/* 80053DF0 0004FD70  EC 43 10 2A */	fadds f2, f3, f2
/* 80053DF4 0004FD74  EC 01 00 2A */	fadds f0, f1, f0
/* 80053DF8 0004FD78  EC 84 00 B2 */	fmuls f4, f4, f2
/* 80053DFC 0004FD7C  EC 04 00 32 */	fmuls f0, f4, f0
/* 80053E00 0004FD80  D0 1F 00 1C */	stfs f0, 0x1c(r31)
/* 80053E04 0004FD84  C0 3B 00 00 */	lfs f1, 0x0(r27)
/* 80053E08 0004FD88  C0 17 00 00 */	lfs f0, 0x0(r23)
/* 80053E0C 0004FD8C  EC 35 00 72 */	fmuls f1, f21, f1
/* 80053E10 0004FD90  EC 1A 00 32 */	fmuls f0, f26, f0
/* 80053E14 0004FD94  EC 01 00 2A */	fadds f0, f1, f0
/* 80053E18 0004FD98  EC 04 00 32 */	fmuls f0, f4, f0
/* 80053E1C 0004FD9C  D0 1F 00 18 */	stfs f0, 0x18(r31)
/* 80053E20 0004FDA0  48 00 02 1C */	b .L_8005403C
.L_80053E24:
/* 80053E24 0004FDA4  C0 02 86 90 */	lfs f0, float_800A9A10@sda21(r2)
/* 80053E28 0004FDA8  EE 80 07 72 */	fmuls f20, f0, f29
/* 80053E2C 0004FDAC  FC 20 A0 90 */	fmr f1, f20
/* 80053E30 0004FDB0  48 00 B5 CD */	bl __cvt_fp2unsigned
/* 80053E34 0004FDB4  90 61 00 AC */	stw r3, 0xac(r1)
/* 80053E38 0004FDB8  54 60 10 3A */	slwi r0, r3, 2
/* 80053E3C 0004FDBC  3F 80 43 30 */	lis r28, 0x4330
/* 80053E40 0004FDC0  C0 02 86 94 */	lfs f0, float_800A9A14@sda21(r2)
/* 80053E44 0004FDC4  93 81 00 A8 */	stw r28, 0xa8(r1)
/* 80053E48 0004FDC8  56 A4 10 3A */	slwi r4, r21, 2
/* 80053E4C 0004FDCC  C8 42 86 A0 */	lfd f2, double_800A9A20@sda21(r2)
/* 80053E50 0004FDD0  C8 21 00 A8 */	lfd f1, 0xa8(r1)
/* 80053E54 0004FDD4  56 66 10 3A */	slwi r6, r19, 2
/* 80053E58 0004FDD8  38 BE 02 08 */	addi r5, r30, 0x208
/* 80053E5C 0004FDDC  EE C0 D8 28 */	fsubs f22, f0, f27
/* 80053E60 0004FDE0  EC 21 10 28 */	fsubs f1, f1, f2
/* 80053E64 0004FDE4  57 27 10 3A */	slwi r7, r25, 2
/* 80053E68 0004FDE8  EF A0 C8 28 */	fsubs f29, f0, f25
/* 80053E6C 0004FDEC  56 88 10 3A */	slwi r8, r20, 2
/* 80053E70 0004FDF0  ED 54 08 28 */	fsubs f10, f20, f1
/* 80053E74 0004FDF4  7C 7D 02 14 */	add r3, r29, r0
/* 80053E78 0004FDF8  7C FD 04 2E */	lfsx f7, r29, r0
/* 80053E7C 0004FDFC  7F 25 22 14 */	add r25, r5, r4
/* 80053E80 0004FE00  C0 23 00 04 */	lfs f1, 0x4(r3)
/* 80053E84 0004FE04  ED 00 50 28 */	fsubs f8, f0, f10
/* 80053E88 0004FE08  7E E5 32 14 */	add r23, r5, r6
/* 80053E8C 0004FE0C  7E DE 32 14 */	add r22, r30, r6
/* 80053E90 0004FE10  C0 B9 00 00 */	lfs f5, 0x0(r25)
/* 80053E94 0004FE14  7F 1E 22 14 */	add r24, r30, r4
/* 80053E98 0004FE18  ED 28 01 F2 */	fmuls f9, f8, f7
/* 80053E9C 0004FE1C  C4 D8 02 04 */	lfsu f6, 0x204(r24)
/* 80053EA0 0004FE20  7E 9E 3A 14 */	add r20, r30, r7
/* 80053EA4 0004FE24  C4 96 02 04 */	lfsu f4, 0x204(r22)
/* 80053EA8 0004FE28  EC F6 01 B2 */	fmuls f7, f22, f6
/* 80053EAC 0004FE2C  EC DB 01 72 */	fmuls f6, f27, f5
/* 80053EB0 0004FE30  C0 57 00 00 */	lfs f2, 0x0(r23)
/* 80053EB4 0004FE34  EC BD 01 32 */	fmuls f5, f29, f4
/* 80053EB8 0004FE38  7E A5 3A 14 */	add r21, r5, r7
/* 80053EBC 0004FE3C  ED 0A 00 72 */	fmuls f8, f10, f1
/* 80053EC0 0004FE40  EC 99 00 B2 */	fmuls f4, f25, f2
/* 80053EC4 0004FE44  C4 74 02 04 */	lfsu f3, 0x204(r20)
/* 80053EC8 0004FE48  EF E0 E0 28 */	fsubs f31, f0, f28
/* 80053ECC 0004FE4C  C0 35 00 00 */	lfs f1, 0x0(r21)
/* 80053ED0 0004FE50  EC 49 40 2A */	fadds f2, f9, f8
/* 80053ED4 0004FE54  EC A5 20 2A */	fadds f5, f5, f4
/* 80053ED8 0004FE58  7E 65 42 14 */	add r19, r5, r8
/* 80053EDC 0004FE5C  EC 9F 00 F2 */	fmuls f4, f31, f3
/* 80053EE0 0004FE60  7E 5E 42 14 */	add r18, r30, r8
/* 80053EE4 0004FE64  EC 7C 00 72 */	fmuls f3, f28, f1
/* 80053EE8 0004FE68  EC C7 30 2A */	fadds f6, f7, f6
/* 80053EEC 0004FE6C  57 40 10 3A */	slwi r0, r26, 2
/* 80053EF0 0004FE70  EC 64 18 2A */	fadds f3, f4, f3
/* 80053EF4 0004FE74  57 66 10 3A */	slwi r6, r27, 2
/* 80053EF8 0004FE78  EE 80 D0 28 */	fsubs f20, f0, f26
/* 80053EFC 0004FE7C  EC 22 01 B2 */	fmuls f1, f2, f6
/* 80053F00 0004FE80  7C 9E 02 14 */	add r4, r30, r0
/* 80053F04 0004FE84  EC 42 01 72 */	fmuls f2, f2, f5
/* 80053F08 0004FE88  7C 7E 32 14 */	add r3, r30, r6
/* 80053F0C 0004FE8C  EC 80 C0 28 */	fsubs f4, f0, f24
/* 80053F10 0004FE90  EC A2 00 F2 */	fmuls f5, f2, f3
/* 80053F14 0004FE94  EC 60 B8 28 */	fsubs f3, f0, f23
/* 80053F18 0004FE98  D0 BF 00 04 */	stfs f5, 0x4(r31)
/* 80053F1C 0004FE9C  C4 B2 02 04 */	lfsu f5, 0x204(r18)
/* 80053F20 0004FEA0  C0 13 00 00 */	lfs f0, 0x0(r19)
/* 80053F24 0004FEA4  EC B4 01 72 */	fmuls f5, f20, f5
/* 80053F28 0004FEA8  EC 1A 00 32 */	fmuls f0, f26, f0
/* 80053F2C 0004FEAC  EC 05 00 2A */	fadds f0, f5, f0
/* 80053F30 0004FEB0  EC 02 00 32 */	fmuls f0, f2, f0
/* 80053F34 0004FEB4  D0 1F 00 00 */	stfs f0, 0x0(r31)
/* 80053F38 0004FEB8  C0 44 02 14 */	lfs f2, 0x214(r4)
/* 80053F3C 0004FEBC  7C 05 04 2E */	lfsx f0, r5, r0
/* 80053F40 0004FEC0  EC 44 00 B2 */	fmuls f2, f4, f2
/* 80053F44 0004FEC4  EC 18 00 32 */	fmuls f0, f24, f0
/* 80053F48 0004FEC8  EC 02 00 2A */	fadds f0, f2, f0
/* 80053F4C 0004FECC  EC 01 00 32 */	fmuls f0, f1, f0
/* 80053F50 0004FED0  D0 1F 00 1C */	stfs f0, 0x1c(r31)
/* 80053F54 0004FED4  C0 43 02 14 */	lfs f2, 0x214(r3)
/* 80053F58 0004FED8  7C 05 34 2E */	lfsx f0, r5, r6
/* 80053F5C 0004FEDC  EC 43 00 B2 */	fmuls f2, f3, f2
/* 80053F60 0004FEE0  EC 17 00 32 */	fmuls f0, f23, f0
/* 80053F64 0004FEE4  EC 02 00 2A */	fadds f0, f2, f0
/* 80053F68 0004FEE8  EC 01 00 32 */	fmuls f0, f1, f0
/* 80053F6C 0004FEEC  D0 1F 00 18 */	stfs f0, 0x18(r31)
/* 80053F70 0004FEF0  C0 02 86 90 */	lfs f0, float_800A9A10@sda21(r2)
/* 80053F74 0004FEF4  EE A0 07 B2 */	fmuls f21, f0, f30
/* 80053F78 0004FEF8  FC 20 A8 90 */	fmr f1, f21
/* 80053F7C 0004FEFC  48 00 B4 81 */	bl __cvt_fp2unsigned
/* 80053F80 0004FF00  90 61 00 B4 */	stw r3, 0xb4(r1)
/* 80053F84 0004FF04  54 60 10 3A */	slwi r0, r3, 2
/* 80053F88 0004FF08  7C 7D 02 14 */	add r3, r29, r0
/* 80053F8C 0004FF0C  C0 38 00 00 */	lfs f1, 0x0(r24)
/* 80053F90 0004FF10  93 81 00 B0 */	stw r28, 0xb0(r1)
/* 80053F94 0004FF14  C0 19 00 00 */	lfs f0, 0x0(r25)
/* 80053F98 0004FF18  EC 36 00 72 */	fmuls f1, f22, f1
/* 80053F9C 0004FF1C  C8 62 86 A0 */	lfd f3, double_800A9A20@sda21(r2)
/* 80053FA0 0004FF20  C8 41 00 B0 */	lfd f2, 0xb0(r1)
/* 80053FA4 0004FF24  EC 1B 00 32 */	fmuls f0, f27, f0
/* 80053FA8 0004FF28  C0 82 86 94 */	lfs f4, float_800A9A14@sda21(r2)
/* 80053FAC 0004FF2C  EC A2 18 28 */	fsubs f5, f2, f3
/* 80053FB0 0004FF30  7C 7D 04 2E */	lfsx f3, r29, r0
/* 80053FB4 0004FF34  C0 43 00 04 */	lfs f2, 0x4(r3)
/* 80053FB8 0004FF38  EC 01 00 2A */	fadds f0, f1, f0
/* 80053FBC 0004FF3C  C0 22 86 98 */	lfs f1, float_800A9A18@sda21(r2)
/* 80053FC0 0004FF40  EC B5 28 28 */	fsubs f5, f21, f5
/* 80053FC4 0004FF44  EC 84 28 28 */	fsubs f4, f4, f5
/* 80053FC8 0004FF48  EC 45 00 B2 */	fmuls f2, f5, f2
/* 80053FCC 0004FF4C  EC 64 00 F2 */	fmuls f3, f4, f3
/* 80053FD0 0004FF50  EC 83 10 2A */	fadds f4, f3, f2
/* 80053FD4 0004FF54  EC 04 00 32 */	fmuls f0, f4, f0
/* 80053FD8 0004FF58  EC 01 00 32 */	fmuls f0, f1, f0
/* 80053FDC 0004FF5C  D0 1F 00 14 */	stfs f0, 0x14(r31)
/* 80053FE0 0004FF60  C0 56 00 00 */	lfs f2, 0x0(r22)
/* 80053FE4 0004FF64  C0 17 00 00 */	lfs f0, 0x0(r23)
/* 80053FE8 0004FF68  C0 34 00 00 */	lfs f1, 0x0(r20)
/* 80053FEC 0004FF6C  EC 7D 00 B2 */	fmuls f3, f29, f2
/* 80053FF0 0004FF70  EC 59 00 32 */	fmuls f2, f25, f0
/* 80053FF4 0004FF74  C0 15 00 00 */	lfs f0, 0x0(r21)
/* 80053FF8 0004FF78  EC 3F 00 72 */	fmuls f1, f31, f1
/* 80053FFC 0004FF7C  EC 1C 00 32 */	fmuls f0, f28, f0
/* 80054000 0004FF80  EC 43 10 2A */	fadds f2, f3, f2
/* 80054004 0004FF84  EC 01 00 2A */	fadds f0, f1, f0
/* 80054008 0004FF88  EC 84 00 B2 */	fmuls f4, f4, f2
/* 8005400C 0004FF8C  EC 04 00 32 */	fmuls f0, f4, f0
/* 80054010 0004FF90  D0 1F 00 10 */	stfs f0, 0x10(r31)
/* 80054014 0004FF94  C0 32 00 00 */	lfs f1, 0x0(r18)
/* 80054018 0004FF98  C0 13 00 00 */	lfs f0, 0x0(r19)
/* 8005401C 0004FF9C  EC 34 00 72 */	fmuls f1, f20, f1
/* 80054020 0004FFA0  EC 1A 00 32 */	fmuls f0, f26, f0
/* 80054024 0004FFA4  EC 01 00 2A */	fadds f0, f1, f0
/* 80054028 0004FFA8  EC 04 00 32 */	fmuls f0, f4, f0
/* 8005402C 0004FFAC  D0 1F 00 0C */	stfs f0, 0xc(r31)
/* 80054030 0004FFB0  C0 02 86 B4 */	lfs f0, float_800A9A34@sda21(r2)
/* 80054034 0004FFB4  D0 1F 00 08 */	stfs f0, 0x8(r31)
/* 80054038 0004FFB8  D0 1F 00 20 */	stfs f0, 0x20(r31)
.L_8005403C:
/* 8005403C 0004FFBC  BA 41 00 C0 */	lmw r18, 0xc0(r1)
/* 80054040 0004FFC0  80 01 01 5C */	lwz r0, 0x15c(r1)
/* 80054044 0004FFC4  CB E1 01 50 */	lfd f31, 0x150(r1)
/* 80054048 0004FFC8  CB C1 01 48 */	lfd f30, 0x148(r1)
/* 8005404C 0004FFCC  7C 08 03 A6 */	mtlr r0
/* 80054050 0004FFD0  CB A1 01 40 */	lfd f29, 0x140(r1)
/* 80054054 0004FFD4  CB 81 01 38 */	lfd f28, 0x138(r1)
/* 80054058 0004FFD8  CB 61 01 30 */	lfd f27, 0x130(r1)
/* 8005405C 0004FFDC  CB 41 01 28 */	lfd f26, 0x128(r1)
/* 80054060 0004FFE0  CB 21 01 20 */	lfd f25, 0x120(r1)
/* 80054064 0004FFE4  CB 01 01 18 */	lfd f24, 0x118(r1)
/* 80054068 0004FFE8  CA E1 01 10 */	lfd f23, 0x110(r1)
/* 8005406C 0004FFEC  CA C1 01 08 */	lfd f22, 0x108(r1)
/* 80054070 0004FFF0  CA A1 01 00 */	lfd f21, 0x100(r1)
/* 80054074 0004FFF4  CA 81 00 F8 */	lfd f20, 0xf8(r1)
/* 80054078 0004FFF8  38 21 01 58 */	addi r1, r1, 0x158
/* 8005407C 0004FFFC  4E 80 00 20 */	blr
.endfn salCalcVolume

.section .data, "wa"  # 0x80065000 - 0x8006D1C0 ; 0x000081C0

.balign 8


.obj musyx_vol_tab, local
	.float 0
	.float 3.05185E-05
	.float 0.000152593
	.float 0.000396741
	.float 0.000701926
	.float 0.00112918
	.float 0.001648
	.float 0.00222785
	.float 0.00292978
	.float 0.00372326
	.float 0.00460829
	.float 0.00558489
	.float 0.00665304
	.float 0.00784326
	.float 0.00912503
	.float 0.0104984
	.float 0.0119633
	.float 0.0135502
	.float 0.0151982
	.float 0.0169988
	.float 0.0188604
	.float 0.0208441
	.float 0.0229194
	.float 0.0251167
	.float 0.0274056
	.float 0.0298166
	.float 0.0323191
	.float 0.0349437
	.float 0.0376598
	.float 0.0404675
	.float 0.0434278
	.float 0.0464797
	.float 0.0496231
	.float 0.0528886
	.float 0.0562761
	.float 0.0597858
	.float 0.0633869
	.float 0.0671102
	.float 0.0709555
	.float 0.0749229
	.float 0.0789819
	.float 0.0831629
	.float 0.087466
	.float 0.0919218
	.float 0.096469
	.float 0.101138
	.float 0.10593
	.float 0.110843
	.float 0.115879
	.float 0.121036
	.float 0.126347
	.float 0.131748
	.float 0.137303
	.float 0.142979
	.float 0.148778
	.float 0.154729
	.float 0.160772
	.float 0.166997
	.float 0.173315
	.float 0.179785
	.float 0.186407
	.float 0.193121
	.float 0.200018
	.float 0.207007
	.float 0.214179
	.float 0.221473
	.float 0.228919
	.float 0.236488
	.float 0.244209
	.float 0.252083
	.float 0.260079
	.float 0.268258
	.float 0.276559
	.float 0.285012
	.float 0.293649
	.float 0.302408
	.float 0.311319
	.float 0.320383
	.float 0.3296
	.float 0.339
	.float 0.348521
	.float 0.358226
	.float 0.368084
	.float 0.378094
	.float 0.388287
	.float 0.398633
	.float 0.409131
	.float 0.419813
	.float 0.430647
	.float 0.441664
	.float 0.452864
	.float 0.464217
	.float 0.475753
	.float 0.487442
	.float 0.499313
	.float 0.511399
	.float 0.523606
	.float 0.536027
	.float 0.548631
	.float 0.561419
	.float 0.574389
	.float 0.587542
	.float 0.600879
	.float 0.614399
	.float 0.628132
	.float 0.642018
	.float 0.656148
	.float 0.670431
	.float 0.684927
	.float 0.699637
	.float 0.71453
	.float 0.729637
	.float 0.744926
	.float 0.76043
	.float 0.776147
	.float 0.792077
	.float 0.808191
	.float 0.824549
	.float 0.84109
	.float 0.857845
	.float 0.874844
	.float 0.892056
	.float 0.909452
	.float 0.927122
	.float 0.945006
	.float 0.963073
	.float 0.981414
	.float 1
	.float 1
.endobj musyx_vol_tab

.obj pan_tab, local
	.4byte 0
	.float 0.7079
	.float 1
	.float 1
.endobj pan_tab

.obj pan_tab_dpl2, local
	.float 0.575
	.float 0.7079
	.float 1
	.float 1
.endobj pan_tab_dpl2

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0

.balign 8


.obj float_800A9A10, local
	.float 127
.endobj float_800A9A10

.obj float_800A9A14, local
	.float 1
.endobj float_800A9A14

.obj float_800A9A18, local
	.float 0.7079
.endobj float_800A9A18

.4byte 0

.obj double_800A9A20, local
	.8byte 0x4330000000000000
.endobj double_800A9A20

.obj float_800A9A28, local
	.float 0.00000024220301
.endobj float_800A9A28

.obj float_800A9A2C, local
	.float 2
.endobj float_800A9A2C

.obj float_800A9A30, local
	.float 0.76604002
.endobj float_800A9A30

.obj float_800A9A34, local
	.float 0
.endobj float_800A9A34

.section extab, "a"  # 0x80005520 - 0x80005BC0

.obj "@etb_80005910", local
.hidden "@etb_80005910"
	.4byte 0x73080000
	.4byte 0
.endobj "@etb_80005910"

.section extabindex, "a"  # 0x80005BC0 - 0x800065A0

.obj "@eti_800061A8", local
.hidden "@eti_800061A8"
	.4byte salCalcVolume
	.4byte 0x00000798
	.4byte "@etb_80005910"
.endobj "@eti_800061A8"
