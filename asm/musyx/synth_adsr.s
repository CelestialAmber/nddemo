.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740


.fn adsrConvertTimeCents, global
/* 8004F9F0 0004B970  7C 08 02 A6 */	mflr r0
/* 8004F9F4 0004B974  90 01 00 04 */	stw r0, 0x4(r1)
/* 8004F9F8 0004B978  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 8004F9FC 0004B97C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8004FA00 0004B980  90 01 00 14 */	stw r0, 0x14(r1)
/* 8004FA04 0004B984  3C 00 43 30 */	lis r0, 0x4330
/* 8004FA08 0004B988  C8 42 86 78 */	lfd f2, lbl_800A99F8@sda21(r2)
/* 8004FA0C 0004B98C  90 01 00 10 */	stw r0, 0x10(r1)
/* 8004FA10 0004B990  C0 62 86 70 */	lfs f3, lbl_800A99F0@sda21(r2)
/* 8004FA14 0004B994  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 8004FA18 0004B998  C0 22 86 6C */	lfs f1, lbl_800A99EC@sda21(r2)
/* 8004FA1C 0004B99C  EC 00 10 28 */	fsubs f0, f0, f2
/* 8004FA20 0004B9A0  EC 43 00 32 */	fmuls f2, f3, f0
/* 8004FA24 0004B9A4  48 01 30 C5 */	bl powf
/* 8004FA28 0004B9A8  C0 02 86 68 */	lfs f0, lbl_800A99E8@sda21(r2)
/* 8004FA2C 0004B9AC  EC 20 00 72 */	fmuls f1, f0, f1
/* 8004FA30 0004B9B0  48 00 F9 CD */	bl __cvt_fp2unsigned
/* 8004FA34 0004B9B4  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8004FA38 0004B9B8  38 21 00 18 */	addi r1, r1, 0x18
/* 8004FA3C 0004B9BC  7C 08 03 A6 */	mtlr r0
/* 8004FA40 0004B9C0  4E 80 00 20 */	blr
.endfn adsrConvertTimeCents

.fn salChangeADSRState, local
/* 8004FA44 0004B9C4  88 83 00 00 */	lbz r4, 0x0(r3)
/* 8004FA48 0004B9C8  38 00 00 00 */	li r0, 0x0
/* 8004FA4C 0004B9CC  2C 04 00 01 */	cmpwi r4, 0x1
/* 8004FA50 0004B9D0  41 82 00 F0 */	beq .L_8004FB40
/* 8004FA54 0004B9D4  40 80 02 54 */	bge .L_8004FCA8
/* 8004FA58 0004B9D8  2C 04 00 00 */	cmpwi r4, 0x0
/* 8004FA5C 0004B9DC  40 80 00 08 */	bge .L_8004FA64
/* 8004FA60 0004B9E0  48 00 02 48 */	b .L_8004FCA8
.L_8004FA64:
/* 8004FA64 0004B9E4  88 83 00 01 */	lbz r4, 0x1(r3)
/* 8004FA68 0004B9E8  2C 04 00 02 */	cmpwi r4, 0x2
/* 8004FA6C 0004B9EC  41 82 00 98 */	beq .L_8004FB04
/* 8004FA70 0004B9F0  40 80 00 14 */	bge .L_8004FA84
/* 8004FA74 0004B9F4  2C 04 00 00 */	cmpwi r4, 0x0
/* 8004FA78 0004B9F8  41 82 00 18 */	beq .L_8004FA90
/* 8004FA7C 0004B9FC  40 80 00 48 */	bge .L_8004FAC4
/* 8004FA80 0004BA00  48 00 02 28 */	b .L_8004FCA8
.L_8004FA84:
/* 8004FA84 0004BA04  2C 04 00 04 */	cmpwi r4, 0x4
/* 8004FA88 0004BA08  41 82 00 A8 */	beq .L_8004FB30
/* 8004FA8C 0004BA0C  48 00 02 1C */	b .L_8004FCA8
.L_8004FA90:
/* 8004FA90 0004BA10  80 83 00 14 */	lwz r4, 0x14(r3)
/* 8004FA94 0004BA14  28 04 00 00 */	cmplwi r4, 0x0
/* 8004FA98 0004BA18  90 83 00 04 */	stw r4, 0x4(r3)
/* 8004FA9C 0004BA1C  41 82 00 28 */	beq .L_8004FAC4
/* 8004FAA0 0004BA20  38 80 00 01 */	li r4, 0x1
/* 8004FAA4 0004BA24  98 83 00 01 */	stb r4, 0x1(r3)
/* 8004FAA8 0004BA28  38 80 00 00 */	li r4, 0x0
/* 8004FAAC 0004BA2C  3C A0 7F FF */	lis r5, 0x7fff
/* 8004FAB0 0004BA30  90 83 00 08 */	stw r4, 0x8(r3)
/* 8004FAB4 0004BA34  80 83 00 14 */	lwz r4, 0x14(r3)
/* 8004FAB8 0004BA38  7C 85 23 96 */	divwu r4, r5, r4
/* 8004FABC 0004BA3C  90 83 00 10 */	stw r4, 0x10(r3)
/* 8004FAC0 0004BA40  48 00 01 E8 */	b .L_8004FCA8
.L_8004FAC4:
/* 8004FAC4 0004BA44  80 83 00 18 */	lwz r4, 0x18(r3)
/* 8004FAC8 0004BA48  28 04 00 00 */	cmplwi r4, 0x0
/* 8004FACC 0004BA4C  90 83 00 04 */	stw r4, 0x4(r3)
/* 8004FAD0 0004BA50  41 82 00 34 */	beq .L_8004FB04
/* 8004FAD4 0004BA54  38 80 00 02 */	li r4, 0x2
/* 8004FAD8 0004BA58  98 83 00 01 */	stb r4, 0x1(r3)
/* 8004FADC 0004BA5C  3C C0 7F FF */	lis r6, 0x7fff
/* 8004FAE0 0004BA60  90 C3 00 08 */	stw r6, 0x8(r3)
/* 8004FAE4 0004BA64  A0 A3 00 1C */	lhz r5, 0x1c(r3)
/* 8004FAE8 0004BA68  80 83 00 18 */	lwz r4, 0x18(r3)
/* 8004FAEC 0004BA6C  54 A5 80 1E */	slwi r5, r5, 16
/* 8004FAF0 0004BA70  7C A5 30 50 */	subf r5, r5, r6
/* 8004FAF4 0004BA74  7C 85 23 96 */	divwu r4, r5, r4
/* 8004FAF8 0004BA78  7C 84 00 D0 */	neg r4, r4
/* 8004FAFC 0004BA7C  90 83 00 10 */	stw r4, 0x10(r3)
/* 8004FB00 0004BA80  48 00 01 A8 */	b .L_8004FCA8
.L_8004FB04:
/* 8004FB04 0004BA84  A0 83 00 1C */	lhz r4, 0x1c(r3)
/* 8004FB08 0004BA88  28 04 00 00 */	cmplwi r4, 0x0
/* 8004FB0C 0004BA8C  41 82 00 24 */	beq .L_8004FB30
/* 8004FB10 0004BA90  38 80 00 03 */	li r4, 0x3
/* 8004FB14 0004BA94  98 83 00 01 */	stb r4, 0x1(r3)
/* 8004FB18 0004BA98  38 80 00 00 */	li r4, 0x0
/* 8004FB1C 0004BA9C  A0 A3 00 1C */	lhz r5, 0x1c(r3)
/* 8004FB20 0004BAA0  54 A5 80 1E */	slwi r5, r5, 16
/* 8004FB24 0004BAA4  90 A3 00 08 */	stw r5, 0x8(r3)
/* 8004FB28 0004BAA8  90 83 00 10 */	stw r4, 0x10(r3)
/* 8004FB2C 0004BAAC  48 00 01 7C */	b .L_8004FCA8
.L_8004FB30:
/* 8004FB30 0004BAB0  38 00 00 00 */	li r0, 0x0
/* 8004FB34 0004BAB4  90 03 00 08 */	stw r0, 0x8(r3)
/* 8004FB38 0004BAB8  38 00 00 01 */	li r0, 0x1
/* 8004FB3C 0004BABC  48 00 01 6C */	b .L_8004FCA8
.L_8004FB40:
/* 8004FB40 0004BAC0  88 83 00 01 */	lbz r4, 0x1(r3)
/* 8004FB44 0004BAC4  2C 04 00 02 */	cmpwi r4, 0x2
/* 8004FB48 0004BAC8  41 82 00 F4 */	beq .L_8004FC3C
/* 8004FB4C 0004BACC  40 80 00 14 */	bge .L_8004FB60
/* 8004FB50 0004BAD0  2C 04 00 00 */	cmpwi r4, 0x0
/* 8004FB54 0004BAD4  41 82 00 18 */	beq .L_8004FB6C
/* 8004FB58 0004BAD8  40 80 00 74 */	bge .L_8004FBCC
/* 8004FB5C 0004BADC  48 00 01 4C */	b .L_8004FCA8
.L_8004FB60:
/* 8004FB60 0004BAE0  2C 04 00 04 */	cmpwi r4, 0x4
/* 8004FB64 0004BAE4  41 82 01 38 */	beq .L_8004FC9C
/* 8004FB68 0004BAE8  48 00 01 40 */	b .L_8004FCA8
.L_8004FB6C:
/* 8004FB6C 0004BAEC  80 83 00 14 */	lwz r4, 0x14(r3)
/* 8004FB70 0004BAF0  28 04 00 00 */	cmplwi r4, 0x0
/* 8004FB74 0004BAF4  90 83 00 04 */	stw r4, 0x4(r3)
/* 8004FB78 0004BAF8  41 82 00 54 */	beq .L_8004FBCC
/* 8004FB7C 0004BAFC  38 80 00 01 */	li r4, 0x1
/* 8004FB80 0004BB00  98 83 00 01 */	stb r4, 0x1(r3)
/* 8004FB84 0004BB04  88 83 00 26 */	lbz r4, 0x26(r3)
/* 8004FB88 0004BB08  28 04 00 00 */	cmplwi r4, 0x0
/* 8004FB8C 0004BB0C  40 82 00 20 */	bne .L_8004FBAC
/* 8004FB90 0004BB10  38 80 00 00 */	li r4, 0x0
/* 8004FB94 0004BB14  90 83 00 08 */	stw r4, 0x8(r3)
/* 8004FB98 0004BB18  3C A0 7F FF */	lis r5, 0x7fff
/* 8004FB9C 0004BB1C  80 83 00 04 */	lwz r4, 0x4(r3)
/* 8004FBA0 0004BB20  7C 85 23 96 */	divwu r4, r5, r4
/* 8004FBA4 0004BB24  90 83 00 10 */	stw r4, 0x10(r3)
/* 8004FBA8 0004BB28  48 00 01 00 */	b .L_8004FCA8
.L_8004FBAC:
/* 8004FBAC 0004BB2C  38 80 00 00 */	li r4, 0x0
/* 8004FBB0 0004BB30  90 83 00 0C */	stw r4, 0xc(r3)
/* 8004FBB4 0004BB34  3C A0 00 C1 */	lis r5, 0xc1
/* 8004FBB8 0004BB38  90 83 00 08 */	stw r4, 0x8(r3)
/* 8004FBBC 0004BB3C  80 83 00 04 */	lwz r4, 0x4(r3)
/* 8004FBC0 0004BB40  7C 85 23 96 */	divwu r4, r5, r4
/* 8004FBC4 0004BB44  90 83 00 10 */	stw r4, 0x10(r3)
/* 8004FBC8 0004BB48  48 00 00 E0 */	b .L_8004FCA8
.L_8004FBCC:
/* 8004FBCC 0004BB4C  A0 A3 00 1C */	lhz r5, 0x1c(r3)
/* 8004FBD0 0004BB50  3C 80 15 39 */	lis r4, 0x1539
/* 8004FBD4 0004BB54  38 C4 09 49 */	addi r6, r4, 0x949
/* 8004FBD8 0004BB58  80 E3 00 18 */	lwz r7, 0x18(r3)
/* 8004FBDC 0004BB5C  20 85 00 C1 */	subfic r4, r5, 0xc1
/* 8004FBE0 0004BB60  54 84 80 1E */	slwi r4, r4, 16
/* 8004FBE4 0004BB64  7C 86 20 16 */	mulhwu r4, r6, r4
/* 8004FBE8 0004BB68  54 84 E1 3E */	srwi r4, r4, 4
/* 8004FBEC 0004BB6C  7C 87 21 D6 */	mullw r4, r7, r4
/* 8004FBF0 0004BB70  54 84 84 3E */	srwi r4, r4, 16
/* 8004FBF4 0004BB74  90 83 00 04 */	stw r4, 0x4(r3)
/* 8004FBF8 0004BB78  80 83 00 04 */	lwz r4, 0x4(r3)
/* 8004FBFC 0004BB7C  28 04 00 00 */	cmplwi r4, 0x0
/* 8004FC00 0004BB80  41 82 00 3C */	beq .L_8004FC3C
/* 8004FC04 0004BB84  38 80 00 02 */	li r4, 0x2
/* 8004FC08 0004BB88  98 83 00 01 */	stb r4, 0x1(r3)
/* 8004FC0C 0004BB8C  3C A0 7F FF */	lis r5, 0x7fff
/* 8004FC10 0004BB90  3C 80 00 C1 */	lis r4, 0xc1
/* 8004FC14 0004BB94  90 A3 00 08 */	stw r5, 0x8(r3)
/* 8004FC18 0004BB98  90 83 00 0C */	stw r4, 0xc(r3)
/* 8004FC1C 0004BB9C  A0 A3 00 1C */	lhz r5, 0x1c(r3)
/* 8004FC20 0004BBA0  80 83 00 04 */	lwz r4, 0x4(r3)
/* 8004FC24 0004BBA4  20 A5 00 C1 */	subfic r5, r5, 0xc1
/* 8004FC28 0004BBA8  54 A5 80 1E */	slwi r5, r5, 16
/* 8004FC2C 0004BBAC  7C 85 23 96 */	divwu r4, r5, r4
/* 8004FC30 0004BBB0  7C 84 00 D0 */	neg r4, r4
/* 8004FC34 0004BBB4  90 83 00 10 */	stw r4, 0x10(r3)
/* 8004FC38 0004BBB8  48 00 00 70 */	b .L_8004FCA8
.L_8004FC3C:
/* 8004FC3C 0004BBBC  A0 83 00 1C */	lhz r4, 0x1c(r3)
/* 8004FC40 0004BBC0  28 04 00 00 */	cmplwi r4, 0x0
/* 8004FC44 0004BBC4  41 82 00 58 */	beq .L_8004FC9C
/* 8004FC48 0004BBC8  38 80 00 03 */	li r4, 0x3
/* 8004FC4C 0004BBCC  98 83 00 01 */	stb r4, 0x1(r3)
/* 8004FC50 0004BBD0  A0 83 00 1C */	lhz r4, 0x1c(r3)
/* 8004FC54 0004BBD4  54 84 80 1E */	slwi r4, r4, 16
/* 8004FC58 0004BBD8  90 83 00 0C */	stw r4, 0xc(r3)
/* 8004FC5C 0004BBDC  80 83 00 0C */	lwz r4, 0xc(r3)
/* 8004FC60 0004BBE0  3C 84 00 01 */	addis r4, r4, 0x1
/* 8004FC64 0004BBE4  38 84 80 00 */	addi r4, r4, -0x8000
/* 8004FC68 0004BBE8  7C 84 86 70 */	srawi r4, r4, 16
/* 8004FC6C 0004BBEC  20 A4 00 C1 */	subfic r5, r4, 0xc1
/* 8004FC70 0004BBF0  2C 05 00 00 */	cmpwi r5, 0x0
/* 8004FC74 0004BBF4  40 80 00 08 */	bge .L_8004FC7C
/* 8004FC78 0004BBF8  38 A0 00 00 */	li r5, 0x0
.L_8004FC7C:
/* 8004FC7C 0004BBFC  3C 80 80 07 */	lis r4, dspAttenuationTab@ha
/* 8004FC80 0004BC00  54 A5 08 3C */	slwi r5, r5, 1
/* 8004FC84 0004BC04  38 84 99 30 */	addi r4, r4, dspAttenuationTab@l
/* 8004FC88 0004BC08  7C 84 2A 14 */	add r4, r4, r5
/* 8004FC8C 0004BC0C  A0 84 00 00 */	lhz r4, 0x0(r4)
/* 8004FC90 0004BC10  54 84 80 1E */	slwi r4, r4, 16
/* 8004FC94 0004BC14  90 83 00 08 */	stw r4, 0x8(r3)
/* 8004FC98 0004BC18  48 00 00 10 */	b .L_8004FCA8
.L_8004FC9C:
/* 8004FC9C 0004BC1C  38 00 00 00 */	li r0, 0x0
/* 8004FCA0 0004BC20  90 03 00 08 */	stw r0, 0x8(r3)
/* 8004FCA4 0004BC24  38 00 00 01 */	li r0, 0x1
.L_8004FCA8:
/* 8004FCA8 0004BC28  7C 03 03 78 */	mr r3, r0
/* 8004FCAC 0004BC2C  4E 80 00 20 */	blr
.endfn salChangeADSRState

.fn adsrSetup, global
/* 8004FCB0 0004BC30  7C 08 02 A6 */	mflr r0
/* 8004FCB4 0004BC34  90 01 00 04 */	stw r0, 0x4(r1)
/* 8004FCB8 0004BC38  38 00 00 00 */	li r0, 0x0
/* 8004FCBC 0004BC3C  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8004FCC0 0004BC40  98 03 00 01 */	stb r0, 0x1(r3)
/* 8004FCC4 0004BC44  4B FF FD 81 */	bl salChangeADSRState
/* 8004FCC8 0004BC48  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8004FCCC 0004BC4C  38 21 00 08 */	addi r1, r1, 0x8
/* 8004FCD0 0004BC50  7C 08 03 A6 */	mtlr r0
/* 8004FCD4 0004BC54  4E 80 00 20 */	blr
.endfn adsrSetup

.fn adsrStartRelease, global
/* 8004FCD8 0004BC58  7C 08 02 A6 */	mflr r0
/* 8004FCDC 0004BC5C  90 01 00 04 */	stw r0, 0x4(r1)
/* 8004FCE0 0004BC60  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 8004FCE4 0004BC64  93 E1 00 24 */	stw r31, 0x24(r1)
/* 8004FCE8 0004BC68  7C 7F 1B 78 */	mr r31, r3
/* 8004FCEC 0004BC6C  88 03 00 00 */	lbz r0, 0x0(r3)
/* 8004FCF0 0004BC70  2C 00 00 01 */	cmpwi r0, 0x1
/* 8004FCF4 0004BC74  41 82 00 54 */	beq .L_8004FD48
/* 8004FCF8 0004BC78  40 80 01 1C */	bge .L_8004FE14
/* 8004FCFC 0004BC7C  2C 00 00 00 */	cmpwi r0, 0x0
/* 8004FD00 0004BC80  40 80 00 08 */	bge .L_8004FD08
/* 8004FD04 0004BC84  48 00 01 10 */	b .L_8004FE14
.L_8004FD08:
/* 8004FD08 0004BC88  38 00 00 04 */	li r0, 0x4
/* 8004FD0C 0004BC8C  98 1F 00 01 */	stb r0, 0x1(r31)
/* 8004FD10 0004BC90  28 04 00 00 */	cmplwi r4, 0x0
/* 8004FD14 0004BC94  90 9F 00 04 */	stw r4, 0x4(r31)
/* 8004FD18 0004BC98  40 82 00 1C */	bne .L_8004FD34
/* 8004FD1C 0004BC9C  38 00 00 01 */	li r0, 0x1
/* 8004FD20 0004BCA0  90 1F 00 04 */	stw r0, 0x4(r31)
/* 8004FD24 0004BCA4  38 00 00 00 */	li r0, 0x0
/* 8004FD28 0004BCA8  38 60 00 01 */	li r3, 0x1
/* 8004FD2C 0004BCAC  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8004FD30 0004BCB0  48 00 00 E8 */	b .L_8004FE18
.L_8004FD34:
/* 8004FD34 0004BCB4  80 1F 00 08 */	lwz r0, 0x8(r31)
/* 8004FD38 0004BCB8  7C 00 23 96 */	divwu r0, r0, r4
/* 8004FD3C 0004BCBC  7C 00 00 D0 */	neg r0, r0
/* 8004FD40 0004BCC0  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8004FD44 0004BCC4  48 00 00 D0 */	b .L_8004FE14
.L_8004FD48:
/* 8004FD48 0004BCC8  88 1F 00 26 */	lbz r0, 0x26(r31)
/* 8004FD4C 0004BCCC  28 00 00 00 */	cmplwi r0, 0x0
/* 8004FD50 0004BCD0  40 82 00 34 */	bne .L_8004FD84
/* 8004FD54 0004BCD4  88 1F 00 01 */	lbz r0, 0x1(r31)
/* 8004FD58 0004BCD8  28 00 00 01 */	cmplwi r0, 0x1
/* 8004FD5C 0004BCDC  40 82 00 28 */	bne .L_8004FD84
/* 8004FD60 0004BCE0  80 BF 00 08 */	lwz r5, 0x8(r31)
/* 8004FD64 0004BCE4  3C 60 80 07 */	lis r3, dspScale2IndexTab@ha
/* 8004FD68 0004BCE8  38 03 9A B4 */	addi r0, r3, dspScale2IndexTab@l
/* 8004FD6C 0004BCEC  7C A3 AE 70 */	srawi r3, r5, 21
/* 8004FD70 0004BCF0  7C 60 1A 14 */	add r3, r0, r3
/* 8004FD74 0004BCF4  88 03 00 00 */	lbz r0, 0x0(r3)
/* 8004FD78 0004BCF8  20 00 00 C1 */	subfic r0, r0, 0xc1
/* 8004FD7C 0004BCFC  54 00 80 1E */	slwi r0, r0, 16
/* 8004FD80 0004BD00  90 1F 00 0C */	stw r0, 0xc(r31)
.L_8004FD84:
/* 8004FD84 0004BD04  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 8004FD88 0004BD08  3C 00 43 30 */	lis r0, 0x4330
/* 8004FD8C 0004BD0C  90 81 00 14 */	stw r4, 0x14(r1)
/* 8004FD90 0004BD10  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8004FD94 0004BD14  C8 42 86 78 */	lfd f2, lbl_800A99F8@sda21(r2)
/* 8004FD98 0004BD18  90 61 00 1C */	stw r3, 0x1c(r1)
/* 8004FD9C 0004BD1C  C0 62 86 80 */	lfs f3, lbl_800A9A00@sda21(r2)
/* 8004FDA0 0004BD20  90 01 00 18 */	stw r0, 0x18(r1)
/* 8004FDA4 0004BD24  C8 22 86 88 */	lfd f1, lbl_800A9A08@sda21(r2)
/* 8004FDA8 0004BD28  C8 01 00 18 */	lfd f0, 0x18(r1)
/* 8004FDAC 0004BD2C  90 01 00 10 */	stw r0, 0x10(r1)
/* 8004FDB0 0004BD30  EC 40 10 28 */	fsubs f2, f0, f2
/* 8004FDB4 0004BD34  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 8004FDB8 0004BD38  EC 43 00 B2 */	fmuls f2, f3, f2
/* 8004FDBC 0004BD3C  EC 00 08 28 */	fsubs f0, f0, f1
/* 8004FDC0 0004BD40  EC 22 00 32 */	fmuls f1, f2, f0
/* 8004FDC4 0004BD44  48 00 F6 39 */	bl __cvt_fp2unsigned
/* 8004FDC8 0004BD48  54 60 A3 3E */	srwi r0, r3, 12
/* 8004FDCC 0004BD4C  90 1F 00 04 */	stw r0, 0x4(r31)
/* 8004FDD0 0004BD50  38 00 00 04 */	li r0, 0x4
/* 8004FDD4 0004BD54  98 1F 00 01 */	stb r0, 0x1(r31)
/* 8004FDD8 0004BD58  80 7F 00 04 */	lwz r3, 0x4(r31)
/* 8004FDDC 0004BD5C  28 03 00 00 */	cmplwi r3, 0x0
/* 8004FDE0 0004BD60  40 82 00 24 */	bne .L_8004FE04
/* 8004FDE4 0004BD64  38 00 00 01 */	li r0, 0x1
/* 8004FDE8 0004BD68  90 1F 00 04 */	stw r0, 0x4(r31)
/* 8004FDEC 0004BD6C  38 00 00 00 */	li r0, 0x0
/* 8004FDF0 0004BD70  38 60 00 01 */	li r3, 0x1
/* 8004FDF4 0004BD74  90 1F 00 08 */	stw r0, 0x8(r31)
/* 8004FDF8 0004BD78  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8004FDFC 0004BD7C  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8004FE00 0004BD80  48 00 00 18 */	b .L_8004FE18
.L_8004FE04:
/* 8004FE04 0004BD84  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 8004FE08 0004BD88  7C 00 1B 96 */	divwu r0, r0, r3
/* 8004FE0C 0004BD8C  7C 00 00 D0 */	neg r0, r0
/* 8004FE10 0004BD90  90 1F 00 10 */	stw r0, 0x10(r31)
.L_8004FE14:
/* 8004FE14 0004BD94  38 60 00 00 */	li r3, 0x0
.L_8004FE18:
/* 8004FE18 0004BD98  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 8004FE1C 0004BD9C  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 8004FE20 0004BDA0  38 21 00 28 */	addi r1, r1, 0x28
/* 8004FE24 0004BDA4  7C 08 03 A6 */	mtlr r0
/* 8004FE28 0004BDA8  4E 80 00 20 */	blr
.endfn adsrStartRelease

.fn adsrRelease, global
/* 8004FE2C 0004BDAC  7C 08 02 A6 */	mflr r0
/* 8004FE30 0004BDB0  90 01 00 04 */	stw r0, 0x4(r1)
/* 8004FE34 0004BDB4  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8004FE38 0004BDB8  88 03 00 00 */	lbz r0, 0x0(r3)
/* 8004FE3C 0004BDBC  2C 00 00 02 */	cmpwi r0, 0x2
/* 8004FE40 0004BDC0  40 80 00 1C */	bge .L_8004FE5C
/* 8004FE44 0004BDC4  2C 00 00 00 */	cmpwi r0, 0x0
/* 8004FE48 0004BDC8  40 80 00 08 */	bge .L_8004FE50
/* 8004FE4C 0004BDCC  48 00 00 10 */	b .L_8004FE5C
.L_8004FE50:
/* 8004FE50 0004BDD0  80 83 00 20 */	lwz r4, 0x20(r3)
/* 8004FE54 0004BDD4  4B FF FE 85 */	bl adsrStartRelease
/* 8004FE58 0004BDD8  48 00 00 08 */	b .L_8004FE60
.L_8004FE5C:
/* 8004FE5C 0004BDDC  38 60 00 00 */	li r3, 0x0
.L_8004FE60:
/* 8004FE60 0004BDE0  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8004FE64 0004BDE4  38 21 00 08 */	addi r1, r1, 0x8
/* 8004FE68 0004BDE8  7C 08 03 A6 */	mtlr r0
/* 8004FE6C 0004BDEC  4E 80 00 20 */	blr
.endfn adsrRelease

.fn adsrHandle, global
/* 8004FE70 0004BDF0  7C 08 02 A6 */	mflr r0
/* 8004FE74 0004BDF4  90 01 00 04 */	stw r0, 0x4(r1)
/* 8004FE78 0004BDF8  38 00 00 00 */	li r0, 0x0
/* 8004FE7C 0004BDFC  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8004FE80 0004BE00  88 C3 00 00 */	lbz r6, 0x0(r3)
/* 8004FE84 0004BE04  2C 06 00 01 */	cmpwi r6, 0x1
/* 8004FE88 0004BE08  41 82 00 94 */	beq .L_8004FF1C
/* 8004FE8C 0004BE0C  40 80 01 70 */	bge .L_8004FFFC
/* 8004FE90 0004BE10  2C 06 00 00 */	cmpwi r6, 0x0
/* 8004FE94 0004BE14  40 80 00 08 */	bge .L_8004FE9C
/* 8004FE98 0004BE18  48 00 01 64 */	b .L_8004FFFC
.L_8004FE9C:
/* 8004FE9C 0004BE1C  88 C3 00 01 */	lbz r6, 0x1(r3)
/* 8004FEA0 0004BE20  28 06 00 03 */	cmplwi r6, 0x3
/* 8004FEA4 0004BE24  41 82 00 60 */	beq .L_8004FF04
/* 8004FEA8 0004BE28  81 03 00 08 */	lwz r8, 0x8(r3)
/* 8004FEAC 0004BE2C  80 E3 00 10 */	lwz r7, 0x10(r3)
/* 8004FEB0 0004BE30  7D 06 86 70 */	srawi r6, r8, 16
/* 8004FEB4 0004BE34  7C E8 3A 14 */	add r7, r8, r7
/* 8004FEB8 0004BE38  90 E3 00 08 */	stw r7, 0x8(r3)
/* 8004FEBC 0004BE3C  B0 C4 00 00 */	sth r6, 0x0(r4)
/* 8004FEC0 0004BE40  80 83 00 10 */	lwz r4, 0x10(r3)
/* 8004FEC4 0004BE44  2C 04 00 00 */	cmpwi r4, 0x0
/* 8004FEC8 0004BE48  41 80 00 10 */	blt .L_8004FED8
/* 8004FECC 0004BE4C  7C 84 AE 70 */	srawi r4, r4, 21
/* 8004FED0 0004BE50  B0 85 00 00 */	sth r4, 0x0(r5)
/* 8004FED4 0004BE54  48 00 00 14 */	b .L_8004FEE8
.L_8004FED8:
/* 8004FED8 0004BE58  7C 84 00 D0 */	neg r4, r4
/* 8004FEDC 0004BE5C  7C 84 AE 70 */	srawi r4, r4, 21
/* 8004FEE0 0004BE60  7C 84 00 D0 */	neg r4, r4
/* 8004FEE4 0004BE64  B0 85 00 00 */	sth r4, 0x0(r5)
.L_8004FEE8:
/* 8004FEE8 0004BE68  80 83 00 04 */	lwz r4, 0x4(r3)
/* 8004FEEC 0004BE6C  34 84 FF FF */	addic. r4, r4, -0x1
/* 8004FEF0 0004BE70  90 83 00 04 */	stw r4, 0x4(r3)
/* 8004FEF4 0004BE74  40 82 01 08 */	bne .L_8004FFFC
/* 8004FEF8 0004BE78  4B FF FB 4D */	bl salChangeADSRState
/* 8004FEFC 0004BE7C  7C 60 1B 78 */	mr r0, r3
/* 8004FF00 0004BE80  48 00 00 FC */	b .L_8004FFFC
.L_8004FF04:
/* 8004FF04 0004BE84  80 C3 00 08 */	lwz r6, 0x8(r3)
/* 8004FF08 0004BE88  38 60 00 00 */	li r3, 0x0
/* 8004FF0C 0004BE8C  7C C6 86 70 */	srawi r6, r6, 16
/* 8004FF10 0004BE90  B0 C4 00 00 */	sth r6, 0x0(r4)
/* 8004FF14 0004BE94  B0 65 00 00 */	sth r3, 0x0(r5)
/* 8004FF18 0004BE98  48 00 00 E4 */	b .L_8004FFFC
.L_8004FF1C:
/* 8004FF1C 0004BE9C  88 E3 00 01 */	lbz r7, 0x1(r3)
/* 8004FF20 0004BEA0  28 07 00 03 */	cmplwi r7, 0x3
/* 8004FF24 0004BEA4  41 82 00 C4 */	beq .L_8004FFE8
/* 8004FF28 0004BEA8  88 C3 00 26 */	lbz r6, 0x26(r3)
/* 8004FF2C 0004BEAC  81 03 00 08 */	lwz r8, 0x8(r3)
/* 8004FF30 0004BEB0  28 06 00 00 */	cmplwi r6, 0x0
/* 8004FF34 0004BEB4  40 82 00 1C */	bne .L_8004FF50
/* 8004FF38 0004BEB8  28 07 00 01 */	cmplwi r7, 0x1
/* 8004FF3C 0004BEBC  40 82 00 14 */	bne .L_8004FF50
/* 8004FF40 0004BEC0  80 C3 00 10 */	lwz r6, 0x10(r3)
/* 8004FF44 0004BEC4  7C C8 32 14 */	add r6, r8, r6
/* 8004FF48 0004BEC8  90 C3 00 08 */	stw r6, 0x8(r3)
/* 8004FF4C 0004BECC  48 00 00 50 */	b .L_8004FF9C
.L_8004FF50:
/* 8004FF50 0004BED0  80 E3 00 0C */	lwz r7, 0xc(r3)
/* 8004FF54 0004BED4  80 C3 00 10 */	lwz r6, 0x10(r3)
/* 8004FF58 0004BED8  7C C7 32 14 */	add r6, r7, r6
/* 8004FF5C 0004BEDC  90 C3 00 0C */	stw r6, 0xc(r3)
/* 8004FF60 0004BEE0  80 C3 00 0C */	lwz r6, 0xc(r3)
/* 8004FF64 0004BEE4  3C C6 00 01 */	addis r6, r6, 0x1
/* 8004FF68 0004BEE8  38 C6 80 00 */	addi r6, r6, -0x8000
/* 8004FF6C 0004BEEC  7C C6 86 70 */	srawi r6, r6, 16
/* 8004FF70 0004BEF0  20 E6 00 C1 */	subfic r7, r6, 0xc1
/* 8004FF74 0004BEF4  2C 07 00 00 */	cmpwi r7, 0x0
/* 8004FF78 0004BEF8  40 80 00 08 */	bge .L_8004FF80
/* 8004FF7C 0004BEFC  38 E0 00 00 */	li r7, 0x0
.L_8004FF80:
/* 8004FF80 0004BF00  3C C0 80 07 */	lis r6, dspAttenuationTab@ha
/* 8004FF84 0004BF04  54 E7 08 3C */	slwi r7, r7, 1
/* 8004FF88 0004BF08  38 C6 99 30 */	addi r6, r6, dspAttenuationTab@l
/* 8004FF8C 0004BF0C  7C C6 3A 14 */	add r6, r6, r7
/* 8004FF90 0004BF10  A0 C6 00 00 */	lhz r6, 0x0(r6)
/* 8004FF94 0004BF14  54 C6 80 1E */	slwi r6, r6, 16
/* 8004FF98 0004BF18  90 C3 00 08 */	stw r6, 0x8(r3)
.L_8004FF9C:
/* 8004FF9C 0004BF1C  7D 06 86 70 */	srawi r6, r8, 16
/* 8004FFA0 0004BF20  B0 C4 00 00 */	sth r6, 0x0(r4)
/* 8004FFA4 0004BF24  80 83 00 08 */	lwz r4, 0x8(r3)
/* 8004FFA8 0004BF28  7C 88 20 51 */	subf. r4, r8, r4
/* 8004FFAC 0004BF2C  41 80 00 10 */	blt .L_8004FFBC
/* 8004FFB0 0004BF30  7C 84 AE 70 */	srawi r4, r4, 21
/* 8004FFB4 0004BF34  B0 85 00 00 */	sth r4, 0x0(r5)
/* 8004FFB8 0004BF38  48 00 00 14 */	b .L_8004FFCC
.L_8004FFBC:
/* 8004FFBC 0004BF3C  7C 84 00 D0 */	neg r4, r4
/* 8004FFC0 0004BF40  7C 84 AE 70 */	srawi r4, r4, 21
/* 8004FFC4 0004BF44  7C 84 00 D0 */	neg r4, r4
/* 8004FFC8 0004BF48  B0 85 00 00 */	sth r4, 0x0(r5)
.L_8004FFCC:
/* 8004FFCC 0004BF4C  80 83 00 04 */	lwz r4, 0x4(r3)
/* 8004FFD0 0004BF50  34 84 FF FF */	addic. r4, r4, -0x1
/* 8004FFD4 0004BF54  90 83 00 04 */	stw r4, 0x4(r3)
/* 8004FFD8 0004BF58  40 82 00 24 */	bne .L_8004FFFC
/* 8004FFDC 0004BF5C  4B FF FA 69 */	bl salChangeADSRState
/* 8004FFE0 0004BF60  7C 60 1B 78 */	mr r0, r3
/* 8004FFE4 0004BF64  48 00 00 18 */	b .L_8004FFFC
.L_8004FFE8:
/* 8004FFE8 0004BF68  80 C3 00 08 */	lwz r6, 0x8(r3)
/* 8004FFEC 0004BF6C  38 60 00 00 */	li r3, 0x0
/* 8004FFF0 0004BF70  7C C6 86 70 */	srawi r6, r6, 16
/* 8004FFF4 0004BF74  B0 C4 00 00 */	sth r6, 0x0(r4)
/* 8004FFF8 0004BF78  B0 65 00 00 */	sth r3, 0x0(r5)
.L_8004FFFC:
/* 8004FFFC 0004BF7C  7C 03 03 78 */	mr r3, r0
/* 80050000 0004BF80  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80050004 0004BF84  38 21 00 08 */	addi r1, r1, 0x8
/* 80050008 0004BF88  7C 08 03 A6 */	mtlr r0
/* 8005000C 0004BF8C  4E 80 00 20 */	blr
.endfn adsrHandle

.fn adsrHandleLowPrecision, global
/* 80050010 0004BF90  7C 08 02 A6 */	mflr r0
/* 80050014 0004BF94  90 01 00 04 */	stw r0, 0x4(r1)
/* 80050018 0004BF98  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 8005001C 0004BF9C  93 E1 00 24 */	stw r31, 0x24(r1)
/* 80050020 0004BFA0  3B E0 00 00 */	li r31, 0x0
/* 80050024 0004BFA4  93 C1 00 20 */	stw r30, 0x20(r1)
/* 80050028 0004BFA8  3B C5 00 00 */	addi r30, r5, 0x0
/* 8005002C 0004BFAC  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 80050030 0004BFB0  3B A4 00 00 */	addi r29, r4, 0x0
/* 80050034 0004BFB4  93 81 00 18 */	stw r28, 0x18(r1)
/* 80050038 0004BFB8  3B 83 00 00 */	addi r28, r3, 0x0
/* 8005003C 0004BFBC  48 00 00 28 */	b .L_80050064
.L_80050040:
/* 80050040 0004BFC0  38 7C 00 00 */	addi r3, r28, 0x0
/* 80050044 0004BFC4  38 9D 00 00 */	addi r4, r29, 0x0
/* 80050048 0004BFC8  38 BE 00 00 */	addi r5, r30, 0x0
/* 8005004C 0004BFCC  4B FF FE 25 */	bl adsrHandle
/* 80050050 0004BFD0  28 03 00 00 */	cmplwi r3, 0x0
/* 80050054 0004BFD4  41 82 00 0C */	beq .L_80050060
/* 80050058 0004BFD8  38 60 00 01 */	li r3, 0x1
/* 8005005C 0004BFDC  48 00 00 18 */	b .L_80050074
.L_80050060:
/* 80050060 0004BFE0  3B FF 00 01 */	addi r31, r31, 0x1
.L_80050064:
/* 80050064 0004BFE4  57 E0 06 3E */	clrlwi r0, r31, 24
/* 80050068 0004BFE8  28 00 00 0F */	cmplwi r0, 0xf
/* 8005006C 0004BFEC  41 80 FF D4 */	blt .L_80050040
/* 80050070 0004BFF0  38 60 00 00 */	li r3, 0x0
.L_80050074:
/* 80050074 0004BFF4  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80050078 0004BFF8  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 8005007C 0004BFFC  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 80050080 0004C000  7C 08 03 A6 */	mtlr r0
/* 80050084 0004C004  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 80050088 0004C008  83 81 00 18 */	lwz r28, 0x18(r1)
/* 8005008C 0004C00C  38 21 00 28 */	addi r1, r1, 0x28
/* 80050090 0004C010  4E 80 00 20 */	blr
.endfn adsrHandleLowPrecision

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0


.obj lbl_800A99E8, local
	.4byte 0x447A0000
.endobj lbl_800A99E8

.obj lbl_800A99EC, local
	.4byte 0x40000000
.endobj lbl_800A99EC

.obj lbl_800A99F0, local
	.4byte 0x325A740E
	.4byte 0
.endobj lbl_800A99F0

.obj lbl_800A99F8, local
	.4byte 0x43300000
	.4byte 0x80000000
.endobj lbl_800A99F8

.obj lbl_800A9A00, local
	.4byte 0x39A9C84A
	.4byte 0
.endobj lbl_800A9A00

.obj lbl_800A9A08, local
	.4byte 0x43300000
	.4byte 0
.endobj lbl_800A9A08

.section extab_, "wa"  # 0x80005520 - 0x80005BC0


.obj lbl_80005870, local
	.4byte 0x00080000
	.4byte 0
.endobj lbl_80005870

.obj lbl_80005878, local
	.4byte 0x00080000
	.4byte 0
.endobj lbl_80005878

.obj lbl_80005880, local
	.4byte 0x08080000
	.4byte 0
.endobj lbl_80005880

.obj lbl_80005888, local
	.4byte 0x00080000
	.4byte 0
.endobj lbl_80005888

.obj lbl_80005890, local
	.4byte 0x00080000
	.4byte 0
.endobj lbl_80005890

.obj lbl_80005898, local
	.4byte 0x20080000
	.4byte 0
.endobj lbl_80005898

.section extabindex_, "wa"  # 0x80005BC0 - 0x800065A0

.obj lbl_800060B8, local
    .4byte adsrConvertTimeCents
    .4byte 0x00000054
    .4byte lbl_80005870
.endobj lbl_800060B8

.obj lbl_800060C4, local
    .4byte adsrSetup
    .4byte 0x00000028
    .4byte lbl_80005878
.endobj lbl_800060C4

.obj lbl_800060D0, local
    .4byte adsrStartRelease
    .4byte 0x00000154
    .4byte lbl_80005880
.endobj lbl_800060D0

.obj lbl_800060DC, local
    .4byte adsrRelease
    .4byte 0x00000044
    .4byte lbl_80005888
.endobj lbl_800060DC

.obj lbl_800060E8, local
    .4byte adsrHandle
    .4byte 0x000001A0
    .4byte lbl_80005890
.endobj lbl_800060E8

.obj lbl_800060F4, local
    .4byte adsrHandleLowPrecision
    .4byte 0x00000084
    .4byte lbl_80005898
.endobj lbl_800060F4
