.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn cosf, global
/* 80062780 0005E700  7C 08 02 A6 */	mflr r0
/* 80062784 0005E704  3C 60 80 07 */	lis r3, __four_over_pi_m1@ha
/* 80062788 0005E708  90 01 00 04 */	stw r0, 0x4(r1)
/* 8006278C 0005E70C  38 63 D1 A8 */	addi r3, r3, __four_over_pi_m1@l
/* 80062790 0005E710  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80062794 0005E714  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 80062798 0005E718  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8006279C 0005E71C  D0 21 00 08 */	stfs f1, 0x8(r1)
/* 800627A0 0005E720  C0 02 87 C8 */	lfs f0, lbl_800A9B48@sda21(r2)
/* 800627A4 0005E724  80 01 00 08 */	lwz r0, 0x8(r1)
/* 800627A8 0005E728  C0 C1 00 08 */	lfs f6, 0x8(r1)
/* 800627AC 0005E72C  54 00 00 01 */	clrrwi. r0, r0, 31
/* 800627B0 0005E730  EC 20 01 B2 */	fmuls f1, f0, f6
/* 800627B4 0005E734  41 82 00 1C */	beq .L_800627D0
/* 800627B8 0005E738  C0 02 87 CC */	lfs f0, lbl_800A9B4C@sda21(r2)
/* 800627BC 0005E73C  EC 01 00 28 */	fsubs f0, f1, f0
/* 800627C0 0005E740  FC 00 00 1E */	fctiwz f0, f0
/* 800627C4 0005E744  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 800627C8 0005E748  80 81 00 14 */	lwz r4, 0x14(r1)
/* 800627CC 0005E74C  48 00 00 18 */	b .L_800627E4
.L_800627D0:
/* 800627D0 0005E750  C0 02 87 CC */	lfs f0, lbl_800A9B4C@sda21(r2)
/* 800627D4 0005E754  EC 00 08 2A */	fadds f0, f0, f1
/* 800627D8 0005E758  FC 00 00 1E */	fctiwz f0, f0
/* 800627DC 0005E75C  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 800627E0 0005E760  80 81 00 14 */	lwz r4, 0x14(r1)
.L_800627E4:
/* 800627E4 0005E764  54 80 08 3C */	slwi r0, r4, 1
/* 800627E8 0005E768  C8 22 87 D8 */	lfd f1, lbl_800A9B58@sda21(r2)
/* 800627EC 0005E76C  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 800627F0 0005E770  C0 43 00 00 */	lfs f2, 0x0(r3)
/* 800627F4 0005E774  90 01 00 14 */	stw r0, 0x14(r1)
/* 800627F8 0005E778  3C 00 43 30 */	lis r0, 0x4330
/* 800627FC 0005E77C  C0 63 00 04 */	lfs f3, 0x4(r3)
/* 80062800 0005E780  54 9F 07 BE */	clrlwi r31, r4, 30
/* 80062804 0005E784  90 01 00 10 */	stw r0, 0x10(r1)
/* 80062808 0005E788  C0 83 00 08 */	lfs f4, 0x8(r3)
/* 8006280C 0005E78C  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 80062810 0005E790  C0 A3 00 0C */	lfs f5, 0xc(r3)
/* 80062814 0005E794  EC 00 08 28 */	fsubs f0, f0, f1
/* 80062818 0005E798  EC 06 00 28 */	fsubs f0, f6, f0
/* 8006281C 0005E79C  EC 02 01 BA */	fmadds f0, f2, f6, f0
/* 80062820 0005E7A0  EC 03 01 BA */	fmadds f0, f3, f6, f0
/* 80062824 0005E7A4  EC 04 01 BA */	fmadds f0, f4, f6, f0
/* 80062828 0005E7A8  EF E5 01 BA */	fmadds f31, f5, f6, f0
/* 8006282C 0005E7AC  FC 20 F8 90 */	fmr f1, f31
/* 80062830 0005E7B0  4B FF FC 7D */	bl fabsf__Ff
/* 80062834 0005E7B4  C0 02 87 D0 */	lfs f0, lbl_800A9B50@sda21(r2)
/* 80062838 0005E7B8  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8006283C 0005E7BC  40 80 00 24 */	bge .L_80062860
/* 80062840 0005E7C0  3C 60 80 06 */	lis r3, __sincos_on_quadrant@ha
/* 80062844 0005E7C4  57 E4 18 38 */	slwi r4, r31, 3
/* 80062848 0005E7C8  38 03 4D 6C */	addi r0, r3, __sincos_on_quadrant@l
/* 8006284C 0005E7CC  7C 60 22 14 */	add r3, r0, r4
/* 80062850 0005E7D0  C0 23 00 00 */	lfs f1, 0x0(r3)
/* 80062854 0005E7D4  C0 03 00 04 */	lfs f0, 0x4(r3)
/* 80062858 0005E7D8  EC 3F 00 7C */	fnmsubs f1, f31, f1, f0
/* 8006285C 0005E7DC  48 00 00 A0 */	b .L_800628FC
.L_80062860:
/* 80062860 0005E7E0  57 E0 07 FF */	clrlwi. r0, r31, 31
/* 80062864 0005E7E4  EC 9F 07 F2 */	fmuls f4, f31, f31
/* 80062868 0005E7E8  41 82 00 50 */	beq .L_800628B8
/* 8006286C 0005E7EC  3C 60 80 06 */	lis r3, __sincos_poly@ha
/* 80062870 0005E7F0  38 83 4D 8C */	addi r4, r3, __sincos_poly@l
/* 80062874 0005E7F4  C0 44 00 04 */	lfs f2, 0x4(r4)
/* 80062878 0005E7F8  3C 60 80 06 */	lis r3, __sincos_on_quadrant@ha
/* 8006287C 0005E7FC  C0 24 00 0C */	lfs f1, 0xc(r4)
/* 80062880 0005E800  38 03 4D 6C */	addi r0, r3, __sincos_on_quadrant@l
/* 80062884 0005E804  C0 04 00 14 */	lfs f0, 0x14(r4)
/* 80062888 0005E808  EC 62 09 3A */	fmadds f3, f2, f4, f1
/* 8006288C 0005E80C  C0 44 00 1C */	lfs f2, 0x1c(r4)
/* 80062890 0005E810  C0 24 00 24 */	lfs f1, 0x24(r4)
/* 80062894 0005E814  57 E4 18 38 */	slwi r4, r31, 3
/* 80062898 0005E818  7C 60 22 14 */	add r3, r0, r4
/* 8006289C 0005E81C  EC 64 00 FA */	fmadds f3, f4, f3, f0
/* 800628A0 0005E820  C0 03 00 00 */	lfs f0, 0x0(r3)
/* 800628A4 0005E824  EC 44 10 FA */	fmadds f2, f4, f3, f2
/* 800628A8 0005E828  EC 24 08 BE */	fnmadds f1, f4, f2, f1
/* 800628AC 0005E82C  EC 3F 00 72 */	fmuls f1, f31, f1
/* 800628B0 0005E830  EC 21 00 32 */	fmuls f1, f1, f0
/* 800628B4 0005E834  48 00 00 48 */	b .L_800628FC
.L_800628B8:
/* 800628B8 0005E838  3C 60 80 06 */	lis r3, __sincos_poly@ha
/* 800628BC 0005E83C  38 83 4D 8C */	addi r4, r3, __sincos_poly@l
/* 800628C0 0005E840  C0 44 00 00 */	lfs f2, 0x0(r4)
/* 800628C4 0005E844  3C 60 80 06 */	lis r3, __sincos_on_quadrant@ha
/* 800628C8 0005E848  C0 24 00 08 */	lfs f1, 0x8(r4)
/* 800628CC 0005E84C  38 63 4D 6C */	addi r3, r3, __sincos_on_quadrant@l
/* 800628D0 0005E850  57 E0 18 38 */	slwi r0, r31, 3
/* 800628D4 0005E854  EC 62 09 3A */	fmadds f3, f2, f4, f1
/* 800628D8 0005E858  C0 04 00 10 */	lfs f0, 0x10(r4)
/* 800628DC 0005E85C  C0 44 00 18 */	lfs f2, 0x18(r4)
/* 800628E0 0005E860  7C 63 02 14 */	add r3, r3, r0
/* 800628E4 0005E864  C0 24 00 20 */	lfs f1, 0x20(r4)
/* 800628E8 0005E868  EC 64 00 FA */	fmadds f3, f4, f3, f0
/* 800628EC 0005E86C  C0 03 00 04 */	lfs f0, 0x4(r3)
/* 800628F0 0005E870  EC 44 10 FA */	fmadds f2, f4, f3, f2
/* 800628F4 0005E874  EC 24 08 BA */	fmadds f1, f4, f2, f1
/* 800628F8 0005E878  EC 21 00 32 */	fmuls f1, f1, f0
.L_800628FC:
/* 800628FC 0005E87C  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80062900 0005E880  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 80062904 0005E884  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80062908 0005E888  7C 08 03 A6 */	mtlr r0
/* 8006290C 0005E88C  38 21 00 28 */	addi r1, r1, 0x28
/* 80062910 0005E890  4E 80 00 20 */	blr
.endfn cosf

.fn sinf, global
/* 80062914 0005E894  7C 08 02 A6 */	mflr r0
/* 80062918 0005E898  3C 60 80 07 */	lis r3, __four_over_pi_m1@ha
/* 8006291C 0005E89C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80062920 0005E8A0  38 63 D1 A8 */	addi r3, r3, __four_over_pi_m1@l
/* 80062924 0005E8A4  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80062928 0005E8A8  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 8006292C 0005E8AC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80062930 0005E8B0  D0 21 00 08 */	stfs f1, 0x8(r1)
/* 80062934 0005E8B4  C0 02 87 C8 */	lfs f0, lbl_800A9B48@sda21(r2)
/* 80062938 0005E8B8  80 01 00 08 */	lwz r0, 0x8(r1)
/* 8006293C 0005E8BC  C0 C1 00 08 */	lfs f6, 0x8(r1)
/* 80062940 0005E8C0  54 00 00 01 */	clrrwi. r0, r0, 31
/* 80062944 0005E8C4  EC 20 01 B2 */	fmuls f1, f0, f6
/* 80062948 0005E8C8  41 82 00 1C */	beq .L_80062964
/* 8006294C 0005E8CC  C0 02 87 CC */	lfs f0, lbl_800A9B4C@sda21(r2)
/* 80062950 0005E8D0  EC 01 00 28 */	fsubs f0, f1, f0
/* 80062954 0005E8D4  FC 00 00 1E */	fctiwz f0, f0
/* 80062958 0005E8D8  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 8006295C 0005E8DC  80 81 00 14 */	lwz r4, 0x14(r1)
/* 80062960 0005E8E0  48 00 00 18 */	b .L_80062978
.L_80062964:
/* 80062964 0005E8E4  C0 02 87 CC */	lfs f0, lbl_800A9B4C@sda21(r2)
/* 80062968 0005E8E8  EC 00 08 2A */	fadds f0, f0, f1
/* 8006296C 0005E8EC  FC 00 00 1E */	fctiwz f0, f0
/* 80062970 0005E8F0  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 80062974 0005E8F4  80 81 00 14 */	lwz r4, 0x14(r1)
.L_80062978:
/* 80062978 0005E8F8  54 80 08 3C */	slwi r0, r4, 1
/* 8006297C 0005E8FC  C8 22 87 D8 */	lfd f1, lbl_800A9B58@sda21(r2)
/* 80062980 0005E900  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 80062984 0005E904  C0 43 00 00 */	lfs f2, 0x0(r3)
/* 80062988 0005E908  90 01 00 14 */	stw r0, 0x14(r1)
/* 8006298C 0005E90C  3C 00 43 30 */	lis r0, 0x4330
/* 80062990 0005E910  C0 63 00 04 */	lfs f3, 0x4(r3)
/* 80062994 0005E914  54 9F 07 BE */	clrlwi r31, r4, 30
/* 80062998 0005E918  90 01 00 10 */	stw r0, 0x10(r1)
/* 8006299C 0005E91C  C0 83 00 08 */	lfs f4, 0x8(r3)
/* 800629A0 0005E920  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 800629A4 0005E924  C0 A3 00 0C */	lfs f5, 0xc(r3)
/* 800629A8 0005E928  EC 00 08 28 */	fsubs f0, f0, f1
/* 800629AC 0005E92C  EC 06 00 28 */	fsubs f0, f6, f0
/* 800629B0 0005E930  EC 02 01 BA */	fmadds f0, f2, f6, f0
/* 800629B4 0005E934  EC 03 01 BA */	fmadds f0, f3, f6, f0
/* 800629B8 0005E938  EC 04 01 BA */	fmadds f0, f4, f6, f0
/* 800629BC 0005E93C  EF E5 01 BA */	fmadds f31, f5, f6, f0
/* 800629C0 0005E940  FC 20 F8 90 */	fmr f1, f31
/* 800629C4 0005E944  4B FF FA E9 */	bl fabsf__Ff
/* 800629C8 0005E948  C0 02 87 D0 */	lfs f0, lbl_800A9B50@sda21(r2)
/* 800629CC 0005E94C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800629D0 0005E950  40 80 00 34 */	bge .L_80062A04
/* 800629D4 0005E954  3C 60 80 06 */	lis r3, __sincos_on_quadrant@ha
/* 800629D8 0005E958  57 E4 18 38 */	slwi r4, r31, 3
/* 800629DC 0005E95C  38 03 4D 6C */	addi r0, r3, __sincos_on_quadrant@l
/* 800629E0 0005E960  7C 60 22 14 */	add r3, r0, r4
/* 800629E4 0005E964  C0 23 00 04 */	lfs f1, 0x4(r3)
/* 800629E8 0005E968  3C 80 80 06 */	lis r4, __sincos_poly@ha
/* 800629EC 0005E96C  38 84 4D 8C */	addi r4, r4, __sincos_poly@l
/* 800629F0 0005E970  C0 03 00 00 */	lfs f0, 0x0(r3)
/* 800629F4 0005E974  EC 3F 00 72 */	fmuls f1, f31, f1
/* 800629F8 0005E978  C0 44 00 24 */	lfs f2, 0x24(r4)
/* 800629FC 0005E97C  EC 22 00 7A */	fmadds f1, f2, f1, f0
/* 80062A00 0005E980  48 00 00 A0 */	b .L_80062AA0
.L_80062A04:
/* 80062A04 0005E984  57 E0 07 FF */	clrlwi. r0, r31, 31
/* 80062A08 0005E988  EC 9F 07 F2 */	fmuls f4, f31, f31
/* 80062A0C 0005E98C  41 82 00 4C */	beq .L_80062A58
/* 80062A10 0005E990  3C 60 80 06 */	lis r3, __sincos_poly@ha
/* 80062A14 0005E994  38 83 4D 8C */	addi r4, r3, __sincos_poly@l
/* 80062A18 0005E998  C0 44 00 00 */	lfs f2, 0x0(r4)
/* 80062A1C 0005E99C  3C 60 80 06 */	lis r3, __sincos_on_quadrant@ha
/* 80062A20 0005E9A0  C0 24 00 08 */	lfs f1, 0x8(r4)
/* 80062A24 0005E9A4  38 03 4D 6C */	addi r0, r3, __sincos_on_quadrant@l
/* 80062A28 0005E9A8  C0 04 00 10 */	lfs f0, 0x10(r4)
/* 80062A2C 0005E9AC  EC 62 09 3A */	fmadds f3, f2, f4, f1
/* 80062A30 0005E9B0  C0 44 00 18 */	lfs f2, 0x18(r4)
/* 80062A34 0005E9B4  C0 24 00 20 */	lfs f1, 0x20(r4)
/* 80062A38 0005E9B8  57 E4 18 38 */	slwi r4, r31, 3
/* 80062A3C 0005E9BC  7C 60 22 14 */	add r3, r0, r4
/* 80062A40 0005E9C0  EC 64 00 FA */	fmadds f3, f4, f3, f0
/* 80062A44 0005E9C4  C0 03 00 00 */	lfs f0, 0x0(r3)
/* 80062A48 0005E9C8  EC 44 10 FA */	fmadds f2, f4, f3, f2
/* 80062A4C 0005E9CC  EC 24 08 BA */	fmadds f1, f4, f2, f1
/* 80062A50 0005E9D0  EC 21 00 32 */	fmuls f1, f1, f0
/* 80062A54 0005E9D4  48 00 00 4C */	b .L_80062AA0
.L_80062A58:
/* 80062A58 0005E9D8  3C 60 80 06 */	lis r3, __sincos_poly@ha
/* 80062A5C 0005E9DC  38 83 4D 8C */	addi r4, r3, __sincos_poly@l
/* 80062A60 0005E9E0  C0 44 00 04 */	lfs f2, 0x4(r4)
/* 80062A64 0005E9E4  3C 60 80 06 */	lis r3, __sincos_on_quadrant@ha
/* 80062A68 0005E9E8  C0 24 00 0C */	lfs f1, 0xc(r4)
/* 80062A6C 0005E9EC  38 63 4D 6C */	addi r3, r3, __sincos_on_quadrant@l
/* 80062A70 0005E9F0  57 E0 18 38 */	slwi r0, r31, 3
/* 80062A74 0005E9F4  EC 62 09 3A */	fmadds f3, f2, f4, f1
/* 80062A78 0005E9F8  C0 04 00 14 */	lfs f0, 0x14(r4)
/* 80062A7C 0005E9FC  C0 44 00 1C */	lfs f2, 0x1c(r4)
/* 80062A80 0005EA00  7C 63 02 14 */	add r3, r3, r0
/* 80062A84 0005EA04  C0 24 00 24 */	lfs f1, 0x24(r4)
/* 80062A88 0005EA08  EC 64 00 FA */	fmadds f3, f4, f3, f0
/* 80062A8C 0005EA0C  C0 03 00 04 */	lfs f0, 0x4(r3)
/* 80062A90 0005EA10  EC 44 10 FA */	fmadds f2, f4, f3, f2
/* 80062A94 0005EA14  EC 24 08 BA */	fmadds f1, f4, f2, f1
/* 80062A98 0005EA18  EC 3F 00 72 */	fmuls f1, f31, f1
/* 80062A9C 0005EA1C  EC 21 00 32 */	fmuls f1, f1, f0
.L_80062AA0:
/* 80062AA0 0005EA20  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80062AA4 0005EA24  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 80062AA8 0005EA28  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80062AAC 0005EA2C  7C 08 03 A6 */	mtlr r0
/* 80062AB0 0005EA30  38 21 00 28 */	addi r1, r1, 0x28
/* 80062AB4 0005EA34  4E 80 00 20 */	blr
.endfn sinf

.fn __sinit_trigf_c, global
/* 80062AB8 0005EA38  3C 60 80 06 */	lis r3, tmp_float@ha
/* 80062ABC 0005EA3C  38 83 4B 58 */	addi r4, r3, tmp_float@l
/* 80062AC0 0005EA40  C0 04 00 00 */	lfs f0, 0x0(r4)
/* 80062AC4 0005EA44  3C 60 80 07 */	lis r3, __four_over_pi_m1@ha
/* 80062AC8 0005EA48  D4 03 D1 A8 */	stfsu f0, __four_over_pi_m1@l(r3)
/* 80062ACC 0005EA4C  C0 04 00 04 */	lfs f0, 0x4(r4)
/* 80062AD0 0005EA50  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80062AD4 0005EA54  C0 04 00 08 */	lfs f0, 0x8(r4)
/* 80062AD8 0005EA58  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80062ADC 0005EA5C  C0 04 00 0C */	lfs f0, 0xc(r4)
/* 80062AE0 0005EA60  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 80062AE4 0005EA64  4E 80 00 20 */	blr
.endfn __sinit_trigf_c


.section .ctors, "wa"  # 0x80063CE0 - 0x80063D00

.4byte __sinit_trigf_c

.section .rodata, "wa"  # 0x80063D20 - 0x80065000

.balign 8

.obj tmp_float, local
	.4byte 0x3E800000
	.4byte 0x3CBE6080
	.4byte 0x34372200
	.4byte 0x2DA44152
.endobj tmp_float

.section .data, "wa"  # 0x80065000 - 0x8006D1C0

.balign 8

.obj __four_over_pi_m1, local
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
.endobj __four_over_pi_m1

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0

.balign 8

.obj lbl_800A9B48, local
	.4byte 0x3F22F983
.endobj lbl_800A9B48

.obj lbl_800A9B4C, local
	.4byte 0x3F000000
.endobj lbl_800A9B4C

.obj lbl_800A9B50, local
	.4byte 0x39B504F3
	.4byte 0
.endobj lbl_800A9B50

.obj lbl_800A9B58, local
	.4byte 0x43300000
	.4byte 0x80000000
.endobj lbl_800A9B58
