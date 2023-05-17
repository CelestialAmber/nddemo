.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn PSMTXIdentity, global
/* 8002F970 0002B8F0  C0 02 84 DC */	lfs f0, float_800A985C@sda21(r2)
/* 8002F974 0002B8F4  C0 22 84 D8 */	lfs f1, float_800A9858@sda21(r2)
/* 8002F978 0002B8F8  F0 03 00 08 */	psq_st f0, 0x8(r3), 0, qr0
/* 8002F97C 0002B8FC  10 40 0C 60 */	ps_merge01 f2, f0, f1
/* 8002F980 0002B900  F0 03 00 18 */	psq_st f0, 0x18(r3), 0, qr0
/* 8002F984 0002B904  10 21 04 A0 */	ps_merge10 f1, f1, f0
/* 8002F988 0002B908  F0 03 00 20 */	psq_st f0, 0x20(r3), 0, qr0
/* 8002F98C 0002B90C  F0 43 00 10 */	psq_st f2, 0x10(r3), 0, qr0
/* 8002F990 0002B910  F0 23 00 00 */	psq_st f1, 0x0(r3), 0, qr0
/* 8002F994 0002B914  F0 23 00 28 */	psq_st f1, 0x28(r3), 0, qr0
/* 8002F998 0002B918  4E 80 00 20 */	blr
.endfn PSMTXIdentity

.fn PSMTXCopy, global
/* 8002F99C 0002B91C  E0 03 00 00 */	psq_l f0, 0x0(r3), 0, qr0
/* 8002F9A0 0002B920  F0 04 00 00 */	psq_st f0, 0x0(r4), 0, qr0
/* 8002F9A4 0002B924  E0 23 00 08 */	psq_l f1, 0x8(r3), 0, qr0
/* 8002F9A8 0002B928  F0 24 00 08 */	psq_st f1, 0x8(r4), 0, qr0
/* 8002F9AC 0002B92C  E0 43 00 10 */	psq_l f2, 0x10(r3), 0, qr0
/* 8002F9B0 0002B930  F0 44 00 10 */	psq_st f2, 0x10(r4), 0, qr0
/* 8002F9B4 0002B934  E0 63 00 18 */	psq_l f3, 0x18(r3), 0, qr0
/* 8002F9B8 0002B938  F0 64 00 18 */	psq_st f3, 0x18(r4), 0, qr0
/* 8002F9BC 0002B93C  E0 83 00 20 */	psq_l f4, 0x20(r3), 0, qr0
/* 8002F9C0 0002B940  F0 84 00 20 */	psq_st f4, 0x20(r4), 0, qr0
/* 8002F9C4 0002B944  E0 A3 00 28 */	psq_l f5, 0x28(r3), 0, qr0
/* 8002F9C8 0002B948  F0 A4 00 28 */	psq_st f5, 0x28(r4), 0, qr0
/* 8002F9CC 0002B94C  4E 80 00 20 */	blr
.endfn PSMTXCopy

.fn PSMTXConcat, global
/* 8002F9D0 0002B950  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 8002F9D4 0002B954  E0 03 00 00 */	psq_l f0, 0x0(r3), 0, qr0
/* 8002F9D8 0002B958  D9 C1 00 08 */	stfd f14, 0x8(r1)
/* 8002F9DC 0002B95C  E0 C4 00 00 */	psq_l f6, 0x0(r4), 0, qr0
/* 8002F9E0 0002B960  3C C0 80 0B */	lis r6, Unit01@ha
/* 8002F9E4 0002B964  E0 E4 00 08 */	psq_l f7, 0x8(r4), 0, qr0
/* 8002F9E8 0002B968  D9 E1 00 10 */	stfd f15, 0x10(r1)
/* 8002F9EC 0002B96C  38 C6 8C B0 */	addi r6, r6, Unit01@l
/* 8002F9F0 0002B970  DB E1 00 28 */	stfd f31, 0x28(r1)
/* 8002F9F4 0002B974  E1 04 00 10 */	psq_l f8, 0x10(r4), 0, qr0
/* 8002F9F8 0002B978  11 86 00 18 */	ps_muls0 f12, f6, f0
/* 8002F9FC 0002B97C  E0 43 00 10 */	psq_l f2, 0x10(r3), 0, qr0
/* 8002FA00 0002B980  11 A7 00 18 */	ps_muls0 f13, f7, f0
/* 8002FA04 0002B984  E3 E6 00 00 */	psq_l f31, 0x0(r6), 0, qr0
/* 8002FA08 0002B988  11 C6 00 98 */	ps_muls0 f14, f6, f2
/* 8002FA0C 0002B98C  E1 24 00 18 */	psq_l f9, 0x18(r4), 0, qr0
/* 8002FA10 0002B990  11 E7 00 98 */	ps_muls0 f15, f7, f2
/* 8002FA14 0002B994  E0 23 00 08 */	psq_l f1, 0x8(r3), 0, qr0
/* 8002FA18 0002B998  11 88 60 1E */	ps_madds1 f12, f8, f0, f12
/* 8002FA1C 0002B99C  E0 63 00 18 */	psq_l f3, 0x18(r3), 0, qr0
/* 8002FA20 0002B9A0  11 C8 70 9E */	ps_madds1 f14, f8, f2, f14
/* 8002FA24 0002B9A4  E1 44 00 20 */	psq_l f10, 0x20(r4), 0, qr0
/* 8002FA28 0002B9A8  11 A9 68 1E */	ps_madds1 f13, f9, f0, f13
/* 8002FA2C 0002B9AC  E1 64 00 28 */	psq_l f11, 0x28(r4), 0, qr0
/* 8002FA30 0002B9B0  11 E9 78 9E */	ps_madds1 f15, f9, f2, f15
/* 8002FA34 0002B9B4  E0 83 00 20 */	psq_l f4, 0x20(r3), 0, qr0
/* 8002FA38 0002B9B8  E0 A3 00 28 */	psq_l f5, 0x28(r3), 0, qr0
/* 8002FA3C 0002B9BC  11 8A 60 5C */	ps_madds0 f12, f10, f1, f12
/* 8002FA40 0002B9C0  11 AB 68 5C */	ps_madds0 f13, f11, f1, f13
/* 8002FA44 0002B9C4  11 CA 70 DC */	ps_madds0 f14, f10, f3, f14
/* 8002FA48 0002B9C8  11 EB 78 DC */	ps_madds0 f15, f11, f3, f15
/* 8002FA4C 0002B9CC  F1 85 00 00 */	psq_st f12, 0x0(r5), 0, qr0
/* 8002FA50 0002B9D0  10 46 01 18 */	ps_muls0 f2, f6, f4
/* 8002FA54 0002B9D4  11 BF 68 5E */	ps_madds1 f13, f31, f1, f13
/* 8002FA58 0002B9D8  10 07 01 18 */	ps_muls0 f0, f7, f4
/* 8002FA5C 0002B9DC  F1 C5 00 10 */	psq_st f14, 0x10(r5), 0, qr0
/* 8002FA60 0002B9E0  11 FF 78 DE */	ps_madds1 f15, f31, f3, f15
/* 8002FA64 0002B9E4  F1 A5 00 08 */	psq_st f13, 0x8(r5), 0, qr0
/* 8002FA68 0002B9E8  10 48 11 1E */	ps_madds1 f2, f8, f4, f2
/* 8002FA6C 0002B9EC  10 09 01 1E */	ps_madds1 f0, f9, f4, f0
/* 8002FA70 0002B9F0  10 4A 11 5C */	ps_madds0 f2, f10, f5, f2
/* 8002FA74 0002B9F4  C9 C1 00 08 */	lfd f14, 0x8(r1)
/* 8002FA78 0002B9F8  F1 E5 00 18 */	psq_st f15, 0x18(r5), 0, qr0
/* 8002FA7C 0002B9FC  10 0B 01 5C */	ps_madds0 f0, f11, f5, f0
/* 8002FA80 0002BA00  F0 45 00 20 */	psq_st f2, 0x20(r5), 0, qr0
/* 8002FA84 0002BA04  10 1F 01 5E */	ps_madds1 f0, f31, f5, f0
/* 8002FA88 0002BA08  C9 E1 00 10 */	lfd f15, 0x10(r1)
/* 8002FA8C 0002BA0C  F0 05 00 28 */	psq_st f0, 0x28(r5), 0, qr0
/* 8002FA90 0002BA10  CB E1 00 28 */	lfd f31, 0x28(r1)
/* 8002FA94 0002BA14  38 21 00 40 */	addi r1, r1, 0x40
/* 8002FA98 0002BA18  4E 80 00 20 */	blr
.endfn PSMTXConcat

.fn PSMTXTranspose, global
/* 8002FA9C 0002BA1C  C0 02 84 DC */	lfs f0, float_800A985C@sda21(r2)
/* 8002FAA0 0002BA20  E0 23 00 00 */	psq_l f1, 0x0(r3), 0, qr0
/* 8002FAA4 0002BA24  D0 04 00 2C */	stfs f0, 0x2c(r4)
/* 8002FAA8 0002BA28  E0 43 00 10 */	psq_l f2, 0x10(r3), 0, qr0
/* 8002FAAC 0002BA2C  10 81 14 20 */	ps_merge00 f4, f1, f2
/* 8002FAB0 0002BA30  E0 63 80 08 */	psq_l f3, 0x8(r3), 1, qr0
/* 8002FAB4 0002BA34  10 A1 14 E0 */	ps_merge11 f5, f1, f2
/* 8002FAB8 0002BA38  E0 43 80 18 */	psq_l f2, 0x18(r3), 1, qr0
/* 8002FABC 0002BA3C  F0 84 00 00 */	psq_st f4, 0x0(r4), 0, qr0
/* 8002FAC0 0002BA40  E0 23 00 20 */	psq_l f1, 0x20(r3), 0, qr0
/* 8002FAC4 0002BA44  10 43 14 20 */	ps_merge00 f2, f3, f2
/* 8002FAC8 0002BA48  F0 A4 00 10 */	psq_st f5, 0x10(r4), 0, qr0
/* 8002FACC 0002BA4C  10 81 04 20 */	ps_merge00 f4, f1, f0
/* 8002FAD0 0002BA50  F0 44 00 20 */	psq_st f2, 0x20(r4), 0, qr0
/* 8002FAD4 0002BA54  10 A1 04 A0 */	ps_merge10 f5, f1, f0
/* 8002FAD8 0002BA58  F0 84 00 08 */	psq_st f4, 0x8(r4), 0, qr0
/* 8002FADC 0002BA5C  C0 63 00 28 */	lfs f3, 0x28(r3)
/* 8002FAE0 0002BA60  F0 A4 00 18 */	psq_st f5, 0x18(r4), 0, qr0
/* 8002FAE4 0002BA64  D0 64 00 28 */	stfs f3, 0x28(r4)
/* 8002FAE8 0002BA68  4E 80 00 20 */	blr
.endfn PSMTXTranspose

.fn PSMTXInverse, global
/* 8002FAEC 0002BA6C  E0 03 80 00 */	psq_l f0, 0x0(r3), 1, qr0
/* 8002FAF0 0002BA70  E0 23 00 04 */	psq_l f1, 0x4(r3), 0, qr0
/* 8002FAF4 0002BA74  E0 43 80 10 */	psq_l f2, 0x10(r3), 1, qr0
/* 8002FAF8 0002BA78  10 C1 04 A0 */	ps_merge10 f6, f1, f0
/* 8002FAFC 0002BA7C  E0 63 00 14 */	psq_l f3, 0x14(r3), 0, qr0
/* 8002FB00 0002BA80  E0 83 80 20 */	psq_l f4, 0x20(r3), 1, qr0
/* 8002FB04 0002BA84  10 E3 14 A0 */	ps_merge10 f7, f3, f2
/* 8002FB08 0002BA88  E0 A3 00 24 */	psq_l f5, 0x24(r3), 0, qr0
/* 8002FB0C 0002BA8C  11 63 01 B2 */	ps_mul f11, f3, f6
/* 8002FB10 0002BA90  11 A5 01 F2 */	ps_mul f13, f5, f7
/* 8002FB14 0002BA94  11 05 24 A0 */	ps_merge10 f8, f5, f4
/* 8002FB18 0002BA98  11 61 59 F8 */	ps_msub f11, f1, f7, f11
/* 8002FB1C 0002BA9C  11 81 02 32 */	ps_mul f12, f1, f8
/* 8002FB20 0002BAA0  11 A3 6A 38 */	ps_msub f13, f3, f8, f13
/* 8002FB24 0002BAA4  11 43 01 32 */	ps_mul f10, f3, f4
/* 8002FB28 0002BAA8  11 85 61 B8 */	ps_msub f12, f5, f6, f12
/* 8002FB2C 0002BAAC  11 20 01 72 */	ps_mul f9, f0, f5
/* 8002FB30 0002BAB0  11 01 00 B2 */	ps_mul f8, f1, f2
/* 8002FB34 0002BAB4  10 C6 30 28 */	ps_sub f6, f6, f6
/* 8002FB38 0002BAB8  11 42 51 78 */	ps_msub f10, f2, f5, f10
/* 8002FB3C 0002BABC  10 E0 03 72 */	ps_mul f7, f0, f13
/* 8002FB40 0002BAC0  11 21 49 38 */	ps_msub f9, f1, f4, f9
/* 8002FB44 0002BAC4  10 E2 3B 3A */	ps_madd f7, f2, f12, f7
/* 8002FB48 0002BAC8  11 00 40 F8 */	ps_msub f8, f0, f3, f8
/* 8002FB4C 0002BACC  10 E4 3A FA */	ps_madd f7, f4, f11, f7
/* 8002FB50 0002BAD0  10 07 30 40 */	ps_cmpo0 cr0, f7, f6
/* 8002FB54 0002BAD4  40 82 00 0C */	bne .L_8002FB60
/* 8002FB58 0002BAD8  38 60 00 00 */	li r3, 0x0
/* 8002FB5C 0002BADC  4E 80 00 20 */	blr
.L_8002FB60:
/* 8002FB60 0002BAE0  10 00 38 30 */	ps_res f0, f7
/* 8002FB64 0002BAE4  10 C0 00 2A */	ps_add f6, f0, f0
/* 8002FB68 0002BAE8  10 A0 00 32 */	ps_mul f5, f0, f0
/* 8002FB6C 0002BAEC  10 07 31 7C */	ps_nmsub f0, f7, f5, f6
/* 8002FB70 0002BAF0  C0 23 00 0C */	lfs f1, 0xc(r3)
/* 8002FB74 0002BAF4  11 AD 00 18 */	ps_muls0 f13, f13, f0
/* 8002FB78 0002BAF8  C0 43 00 1C */	lfs f2, 0x1c(r3)
/* 8002FB7C 0002BAFC  11 8C 00 18 */	ps_muls0 f12, f12, f0
/* 8002FB80 0002BB00  C0 63 00 2C */	lfs f3, 0x2c(r3)
/* 8002FB84 0002BB04  11 6B 00 18 */	ps_muls0 f11, f11, f0
/* 8002FB88 0002BB08  10 AD 64 20 */	ps_merge00 f5, f13, f12
/* 8002FB8C 0002BB0C  11 4A 00 18 */	ps_muls0 f10, f10, f0
/* 8002FB90 0002BB10  10 8D 64 E0 */	ps_merge11 f4, f13, f12
/* 8002FB94 0002BB14  11 29 00 18 */	ps_muls0 f9, f9, f0
/* 8002FB98 0002BB18  F0 A4 00 00 */	psq_st f5, 0x0(r4), 0, qr0
/* 8002FB9C 0002BB1C  10 CD 00 72 */	ps_mul f6, f13, f1
/* 8002FBA0 0002BB20  F0 84 00 10 */	psq_st f4, 0x10(r4), 0, qr0
/* 8002FBA4 0002BB24  11 08 00 18 */	ps_muls0 f8, f8, f0
/* 8002FBA8 0002BB28  10 CC 30 BA */	ps_madd f6, f12, f2, f6
/* 8002FBAC 0002BB2C  F1 44 80 20 */	psq_st f10, 0x20(r4), 1, qr0
/* 8002FBB0 0002BB30  10 CB 30 FE */	ps_nmadd f6, f11, f3, f6
/* 8002FBB4 0002BB34  F1 24 80 24 */	psq_st f9, 0x24(r4), 1, qr0
/* 8002FBB8 0002BB38  10 EA 00 72 */	ps_mul f7, f10, f1
/* 8002FBBC 0002BB3C  10 AB 34 20 */	ps_merge00 f5, f11, f6
/* 8002FBC0 0002BB40  F1 04 80 28 */	psq_st f8, 0x28(r4), 1, qr0
/* 8002FBC4 0002BB44  10 8B 34 E0 */	ps_merge11 f4, f11, f6
/* 8002FBC8 0002BB48  F0 A4 00 08 */	psq_st f5, 0x8(r4), 0, qr0
/* 8002FBCC 0002BB4C  10 E9 38 BA */	ps_madd f7, f9, f2, f7
/* 8002FBD0 0002BB50  F0 84 00 18 */	psq_st f4, 0x18(r4), 0, qr0
/* 8002FBD4 0002BB54  10 E8 38 FE */	ps_nmadd f7, f8, f3, f7
/* 8002FBD8 0002BB58  38 60 00 01 */	li r3, 0x1
/* 8002FBDC 0002BB5C  F0 E4 80 2C */	psq_st f7, 0x2c(r4), 1, qr0
/* 8002FBE0 0002BB60  4E 80 00 20 */	blr
.endfn PSMTXInverse

.fn PSMTXRotRad, global
/* 8002FBE4 0002BB64  7C 08 02 A6 */	mflr r0
/* 8002FBE8 0002BB68  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002FBEC 0002BB6C  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 8002FBF0 0002BB70  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 8002FBF4 0002BB74  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8002FBF8 0002BB78  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8002FBFC 0002BB7C  FF E0 08 90 */	fmr f31, f1
/* 8002FC00 0002BB80  7C 7E 1B 78 */	mr r30, r3
/* 8002FC04 0002BB84  7C 9F 23 78 */	mr r31, r4
/* 8002FC08 0002BB88  FC 20 F8 90 */	fmr f1, f31
/* 8002FC0C 0002BB8C  48 03 2D 09 */	bl sinf
/* 8002FC10 0002BB90  FC 00 08 90 */	fmr f0, f1
/* 8002FC14 0002BB94  FC 20 F8 90 */	fmr f1, f31
/* 8002FC18 0002BB98  FF E0 00 90 */	fmr f31, f0
/* 8002FC1C 0002BB9C  48 03 2B 65 */	bl cosf
/* 8002FC20 0002BBA0  FC 00 08 90 */	fmr f0, f1
/* 8002FC24 0002BBA4  7F C3 F3 78 */	mr r3, r30
/* 8002FC28 0002BBA8  FC 20 F8 90 */	fmr f1, f31
/* 8002FC2C 0002BBAC  7F E4 FB 78 */	mr r4, r31
/* 8002FC30 0002BBB0  FC 40 00 90 */	fmr f2, f0
/* 8002FC34 0002BBB4  48 00 00 21 */	bl PSMTXRotTrig
/* 8002FC38 0002BBB8  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 8002FC3C 0002BBBC  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 8002FC40 0002BBC0  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8002FC44 0002BBC4  7C 08 03 A6 */	mtlr r0
/* 8002FC48 0002BBC8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8002FC4C 0002BBCC  38 21 00 28 */	addi r1, r1, 0x28
/* 8002FC50 0002BBD0  4E 80 00 20 */	blr
.endfn PSMTXRotRad

.fn PSMTXRotTrig, global
/* 8002FC54 0002BBD4  C0 02 84 DC */	lfs f0, float_800A985C@sda21(r2)
/* 8002FC58 0002BBD8  C0 62 84 D8 */	lfs f3, float_800A9858@sda21(r2)
/* 8002FC5C 0002BBDC  60 80 00 20 */	ori r0, r4, 0x20
/* 8002FC60 0002BBE0  10 80 08 50 */	ps_neg f4, f1
/* 8002FC64 0002BBE4  28 00 00 78 */	cmplwi r0, 0x78
/* 8002FC68 0002BBE8  41 82 00 18 */	beq .L_8002FC80
/* 8002FC6C 0002BBEC  28 00 00 79 */	cmplwi r0, 0x79
/* 8002FC70 0002BBF0  41 82 00 38 */	beq .L_8002FCA8
/* 8002FC74 0002BBF4  28 00 00 7A */	cmplwi r0, 0x7a
/* 8002FC78 0002BBF8  41 82 00 5C */	beq .L_8002FCD4
/* 8002FC7C 0002BBFC  48 00 00 7C */	b .L_8002FCF8
.L_8002FC80:
/* 8002FC80 0002BC00  F0 63 80 00 */	psq_st f3, 0x0(r3), 1, qr0
/* 8002FC84 0002BC04  F0 03 00 04 */	psq_st f0, 0x4(r3), 0, qr0
/* 8002FC88 0002BC08  10 A1 14 20 */	ps_merge00 f5, f1, f2
/* 8002FC8C 0002BC0C  F0 03 00 0C */	psq_st f0, 0xc(r3), 0, qr0
/* 8002FC90 0002BC10  10 42 24 20 */	ps_merge00 f2, f2, f4
/* 8002FC94 0002BC14  F0 03 00 1C */	psq_st f0, 0x1c(r3), 0, qr0
/* 8002FC98 0002BC18  F0 03 80 2C */	psq_st f0, 0x2c(r3), 1, qr0
/* 8002FC9C 0002BC1C  F0 A3 00 24 */	psq_st f5, 0x24(r3), 0, qr0
/* 8002FCA0 0002BC20  F0 43 00 14 */	psq_st f2, 0x14(r3), 0, qr0
/* 8002FCA4 0002BC24  48 00 00 54 */	b .L_8002FCF8
.L_8002FCA8:
/* 8002FCA8 0002BC28  10 A2 04 20 */	ps_merge00 f5, f2, f0
/* 8002FCAC 0002BC2C  10 40 1C 20 */	ps_merge00 f2, f0, f3
/* 8002FCB0 0002BC30  F0 03 00 18 */	psq_st f0, 0x18(r3), 0, qr0
/* 8002FCB4 0002BC34  F0 A3 00 00 */	psq_st f5, 0x0(r3), 0, qr0
/* 8002FCB8 0002BC38  10 84 04 20 */	ps_merge00 f4, f4, f0
/* 8002FCBC 0002BC3C  10 01 04 20 */	ps_merge00 f0, f1, f0
/* 8002FCC0 0002BC40  F0 A3 00 28 */	psq_st f5, 0x28(r3), 0, qr0
/* 8002FCC4 0002BC44  F0 43 00 10 */	psq_st f2, 0x10(r3), 0, qr0
/* 8002FCC8 0002BC48  F0 03 00 08 */	psq_st f0, 0x8(r3), 0, qr0
/* 8002FCCC 0002BC4C  F0 83 00 20 */	psq_st f4, 0x20(r3), 0, qr0
/* 8002FCD0 0002BC50  48 00 00 28 */	b .L_8002FCF8
.L_8002FCD4:
/* 8002FCD4 0002BC54  F0 03 00 08 */	psq_st f0, 0x8(r3), 0, qr0
/* 8002FCD8 0002BC58  10 A1 14 20 */	ps_merge00 f5, f1, f2
/* 8002FCDC 0002BC5C  10 82 24 20 */	ps_merge00 f4, f2, f4
/* 8002FCE0 0002BC60  F0 03 00 18 */	psq_st f0, 0x18(r3), 0, qr0
/* 8002FCE4 0002BC64  F0 03 00 20 */	psq_st f0, 0x20(r3), 0, qr0
/* 8002FCE8 0002BC68  10 43 04 20 */	ps_merge00 f2, f3, f0
/* 8002FCEC 0002BC6C  F0 A3 00 10 */	psq_st f5, 0x10(r3), 0, qr0
/* 8002FCF0 0002BC70  F0 83 00 00 */	psq_st f4, 0x0(r3), 0, qr0
/* 8002FCF4 0002BC74  F0 43 00 28 */	psq_st f2, 0x28(r3), 0, qr0
.L_8002FCF8:
/* 8002FCF8 0002BC78  4E 80 00 20 */	blr
.endfn PSMTXRotTrig

.fn PSMTXTrans, global
/* 8002FCFC 0002BC7C  C0 02 84 DC */	lfs f0, float_800A985C@sda21(r2)
/* 8002FD00 0002BC80  C0 82 84 D8 */	lfs f4, float_800A9858@sda21(r2)
/* 8002FD04 0002BC84  D0 23 00 0C */	stfs f1, 0xc(r3)
/* 8002FD08 0002BC88  D0 43 00 1C */	stfs f2, 0x1c(r3)
/* 8002FD0C 0002BC8C  F0 03 00 04 */	psq_st f0, 0x4(r3), 0, qr0
/* 8002FD10 0002BC90  F0 03 00 20 */	psq_st f0, 0x20(r3), 0, qr0
/* 8002FD14 0002BC94  D0 03 00 10 */	stfs f0, 0x10(r3)
/* 8002FD18 0002BC98  D0 83 00 14 */	stfs f4, 0x14(r3)
/* 8002FD1C 0002BC9C  D0 03 00 18 */	stfs f0, 0x18(r3)
/* 8002FD20 0002BCA0  D0 83 00 28 */	stfs f4, 0x28(r3)
/* 8002FD24 0002BCA4  D0 63 00 2C */	stfs f3, 0x2c(r3)
/* 8002FD28 0002BCA8  D0 83 00 00 */	stfs f4, 0x0(r3)
/* 8002FD2C 0002BCAC  4E 80 00 20 */	blr
.endfn PSMTXTrans

.fn PSMTXScale, global
/* 8002FD30 0002BCB0  C0 02 84 DC */	lfs f0, float_800A985C@sda21(r2)
/* 8002FD34 0002BCB4  D0 23 00 00 */	stfs f1, 0x0(r3)
/* 8002FD38 0002BCB8  F0 03 00 04 */	psq_st f0, 0x4(r3), 0, qr0
/* 8002FD3C 0002BCBC  F0 03 00 0C */	psq_st f0, 0xc(r3), 0, qr0
/* 8002FD40 0002BCC0  D0 43 00 14 */	stfs f2, 0x14(r3)
/* 8002FD44 0002BCC4  F0 03 00 18 */	psq_st f0, 0x18(r3), 0, qr0
/* 8002FD48 0002BCC8  F0 03 00 20 */	psq_st f0, 0x20(r3), 0, qr0
/* 8002FD4C 0002BCCC  D0 63 00 28 */	stfs f3, 0x28(r3)
/* 8002FD50 0002BCD0  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 8002FD54 0002BCD4  4E 80 00 20 */	blr
.endfn PSMTXScale

.fn C_MTXLookAt, global
/* 8002FD58 0002BCD8  7C 08 02 A6 */	mflr r0
/* 8002FD5C 0002BCDC  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002FD60 0002BCE0  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 8002FD64 0002BCE4  93 E1 00 4C */	stw r31, 0x4c(r1)
/* 8002FD68 0002BCE8  93 C1 00 48 */	stw r30, 0x48(r1)
/* 8002FD6C 0002BCEC  93 A1 00 44 */	stw r29, 0x44(r1)
/* 8002FD70 0002BCF0  7C 7D 1B 78 */	mr r29, r3
/* 8002FD74 0002BCF4  7C 9E 23 78 */	mr r30, r4
/* 8002FD78 0002BCF8  7C BF 2B 78 */	mr r31, r5
/* 8002FD7C 0002BCFC  C0 3E 00 00 */	lfs f1, 0x0(r30)
/* 8002FD80 0002BD00  38 61 00 30 */	addi r3, r1, 0x30
/* 8002FD84 0002BD04  C0 06 00 00 */	lfs f0, 0x0(r6)
/* 8002FD88 0002BD08  7C 64 1B 78 */	mr r4, r3
/* 8002FD8C 0002BD0C  EC 01 00 28 */	fsubs f0, f1, f0
/* 8002FD90 0002BD10  D0 01 00 30 */	stfs f0, 0x30(r1)
/* 8002FD94 0002BD14  C0 3E 00 04 */	lfs f1, 0x4(r30)
/* 8002FD98 0002BD18  C0 06 00 04 */	lfs f0, 0x4(r6)
/* 8002FD9C 0002BD1C  EC 01 00 28 */	fsubs f0, f1, f0
/* 8002FDA0 0002BD20  D0 01 00 34 */	stfs f0, 0x34(r1)
/* 8002FDA4 0002BD24  C0 3E 00 08 */	lfs f1, 0x8(r30)
/* 8002FDA8 0002BD28  C0 06 00 08 */	lfs f0, 0x8(r6)
/* 8002FDAC 0002BD2C  EC 01 00 28 */	fsubs f0, f1, f0
/* 8002FDB0 0002BD30  D0 01 00 38 */	stfs f0, 0x38(r1)
/* 8002FDB4 0002BD34  48 00 03 E9 */	bl PSVECNormalize
/* 8002FDB8 0002BD38  7F E3 FB 78 */	mr r3, r31
/* 8002FDBC 0002BD3C  38 81 00 30 */	addi r4, r1, 0x30
/* 8002FDC0 0002BD40  38 A1 00 24 */	addi r5, r1, 0x24
/* 8002FDC4 0002BD44  48 00 04 79 */	bl PSVECCrossProduct
/* 8002FDC8 0002BD48  38 61 00 24 */	addi r3, r1, 0x24
/* 8002FDCC 0002BD4C  7C 64 1B 78 */	mr r4, r3
/* 8002FDD0 0002BD50  48 00 03 CD */	bl PSVECNormalize
/* 8002FDD4 0002BD54  38 61 00 30 */	addi r3, r1, 0x30
/* 8002FDD8 0002BD58  38 81 00 24 */	addi r4, r1, 0x24
/* 8002FDDC 0002BD5C  38 A1 00 18 */	addi r5, r1, 0x18
/* 8002FDE0 0002BD60  48 00 04 5D */	bl PSVECCrossProduct
/* 8002FDE4 0002BD64  C0 01 00 24 */	lfs f0, 0x24(r1)
/* 8002FDE8 0002BD68  D0 1D 00 00 */	stfs f0, 0x0(r29)
/* 8002FDEC 0002BD6C  C0 01 00 28 */	lfs f0, 0x28(r1)
/* 8002FDF0 0002BD70  D0 1D 00 04 */	stfs f0, 0x4(r29)
/* 8002FDF4 0002BD74  C0 01 00 2C */	lfs f0, 0x2c(r1)
/* 8002FDF8 0002BD78  D0 1D 00 08 */	stfs f0, 0x8(r29)
/* 8002FDFC 0002BD7C  C0 7E 00 00 */	lfs f3, 0x0(r30)
/* 8002FE00 0002BD80  C0 41 00 24 */	lfs f2, 0x24(r1)
/* 8002FE04 0002BD84  C0 3E 00 04 */	lfs f1, 0x4(r30)
/* 8002FE08 0002BD88  C0 01 00 28 */	lfs f0, 0x28(r1)
/* 8002FE0C 0002BD8C  EC 43 00 B2 */	fmuls f2, f3, f2
/* 8002FE10 0002BD90  C0 7E 00 08 */	lfs f3, 0x8(r30)
/* 8002FE14 0002BD94  EC 01 00 32 */	fmuls f0, f1, f0
/* 8002FE18 0002BD98  C0 21 00 2C */	lfs f1, 0x2c(r1)
/* 8002FE1C 0002BD9C  EC 23 00 72 */	fmuls f1, f3, f1
/* 8002FE20 0002BDA0  EC 02 00 2A */	fadds f0, f2, f0
/* 8002FE24 0002BDA4  EC 01 00 2A */	fadds f0, f1, f0
/* 8002FE28 0002BDA8  FC 00 00 50 */	fneg f0, f0
/* 8002FE2C 0002BDAC  D0 1D 00 0C */	stfs f0, 0xc(r29)
/* 8002FE30 0002BDB0  C0 01 00 18 */	lfs f0, 0x18(r1)
/* 8002FE34 0002BDB4  D0 1D 00 10 */	stfs f0, 0x10(r29)
/* 8002FE38 0002BDB8  C0 01 00 1C */	lfs f0, 0x1c(r1)
/* 8002FE3C 0002BDBC  D0 1D 00 14 */	stfs f0, 0x14(r29)
/* 8002FE40 0002BDC0  C0 01 00 20 */	lfs f0, 0x20(r1)
/* 8002FE44 0002BDC4  D0 1D 00 18 */	stfs f0, 0x18(r29)
/* 8002FE48 0002BDC8  C0 7E 00 00 */	lfs f3, 0x0(r30)
/* 8002FE4C 0002BDCC  C0 41 00 18 */	lfs f2, 0x18(r1)
/* 8002FE50 0002BDD0  C0 3E 00 04 */	lfs f1, 0x4(r30)
/* 8002FE54 0002BDD4  C0 01 00 1C */	lfs f0, 0x1c(r1)
/* 8002FE58 0002BDD8  EC 43 00 B2 */	fmuls f2, f3, f2
/* 8002FE5C 0002BDDC  C0 7E 00 08 */	lfs f3, 0x8(r30)
/* 8002FE60 0002BDE0  EC 01 00 32 */	fmuls f0, f1, f0
/* 8002FE64 0002BDE4  C0 21 00 20 */	lfs f1, 0x20(r1)
/* 8002FE68 0002BDE8  EC 23 00 72 */	fmuls f1, f3, f1
/* 8002FE6C 0002BDEC  EC 02 00 2A */	fadds f0, f2, f0
/* 8002FE70 0002BDF0  EC 01 00 2A */	fadds f0, f1, f0
/* 8002FE74 0002BDF4  FC 00 00 50 */	fneg f0, f0
/* 8002FE78 0002BDF8  D0 1D 00 1C */	stfs f0, 0x1c(r29)
/* 8002FE7C 0002BDFC  C0 01 00 30 */	lfs f0, 0x30(r1)
/* 8002FE80 0002BE00  D0 1D 00 20 */	stfs f0, 0x20(r29)
/* 8002FE84 0002BE04  C0 01 00 34 */	lfs f0, 0x34(r1)
/* 8002FE88 0002BE08  D0 1D 00 24 */	stfs f0, 0x24(r29)
/* 8002FE8C 0002BE0C  C0 01 00 38 */	lfs f0, 0x38(r1)
/* 8002FE90 0002BE10  D0 1D 00 28 */	stfs f0, 0x28(r29)
/* 8002FE94 0002BE14  C0 7E 00 00 */	lfs f3, 0x0(r30)
/* 8002FE98 0002BE18  C0 41 00 30 */	lfs f2, 0x30(r1)
/* 8002FE9C 0002BE1C  C0 3E 00 04 */	lfs f1, 0x4(r30)
/* 8002FEA0 0002BE20  C0 01 00 34 */	lfs f0, 0x34(r1)
/* 8002FEA4 0002BE24  EC 43 00 B2 */	fmuls f2, f3, f2
/* 8002FEA8 0002BE28  C0 7E 00 08 */	lfs f3, 0x8(r30)
/* 8002FEAC 0002BE2C  EC 01 00 32 */	fmuls f0, f1, f0
/* 8002FEB0 0002BE30  C0 21 00 38 */	lfs f1, 0x38(r1)
/* 8002FEB4 0002BE34  EC 23 00 72 */	fmuls f1, f3, f1
/* 8002FEB8 0002BE38  EC 02 00 2A */	fadds f0, f2, f0
/* 8002FEBC 0002BE3C  EC 01 00 2A */	fadds f0, f1, f0
/* 8002FEC0 0002BE40  FC 00 00 50 */	fneg f0, f0
/* 8002FEC4 0002BE44  D0 1D 00 2C */	stfs f0, 0x2c(r29)
/* 8002FEC8 0002BE48  80 01 00 54 */	lwz r0, 0x54(r1)
/* 8002FECC 0002BE4C  83 E1 00 4C */	lwz r31, 0x4c(r1)
/* 8002FED0 0002BE50  83 C1 00 48 */	lwz r30, 0x48(r1)
/* 8002FED4 0002BE54  7C 08 03 A6 */	mtlr r0
/* 8002FED8 0002BE58  83 A1 00 44 */	lwz r29, 0x44(r1)
/* 8002FEDC 0002BE5C  38 21 00 50 */	addi r1, r1, 0x50
/* 8002FEE0 0002BE60  4E 80 00 20 */	blr
.endfn C_MTXLookAt

.fn C_MTXLightFrustum, global
/* 8002FEE4 0002BE64  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8002FEE8 0002BE68  C1 81 00 38 */	lfs f12, 0x38(r1)
/* 8002FEEC 0002BE6C  ED 44 18 28 */	fsubs f10, f4, f3
/* 8002FEF0 0002BE70  C1 62 84 D8 */	lfs f11, float_800A9858@sda21(r2)
/* 8002FEF4 0002BE74  EC 01 10 28 */	fsubs f0, f1, f2
/* 8002FEF8 0002BE78  C1 22 84 E0 */	lfs f9, float_800A9860@sda21(r2)
/* 8002FEFC 0002BE7C  EC 64 18 2A */	fadds f3, f4, f3
/* 8002FF00 0002BE80  ED 4B 50 24 */	fdivs f10, f11, f10
/* 8002FF04 0002BE84  EC A9 01 72 */	fmuls f5, f9, f5
/* 8002FF08 0002BE88  ED 2B 00 24 */	fdivs f9, f11, f0
/* 8002FF0C 0002BE8C  EC 85 02 B2 */	fmuls f4, f5, f10
/* 8002FF10 0002BE90  EC 6A 00 F2 */	fmuls f3, f10, f3
/* 8002FF14 0002BE94  EC 01 10 2A */	fadds f0, f1, f2
/* 8002FF18 0002BE98  EC 26 01 32 */	fmuls f1, f6, f4
/* 8002FF1C 0002BE9C  EC 46 00 F2 */	fmuls f2, f6, f3
/* 8002FF20 0002BEA0  EC 09 00 32 */	fmuls f0, f9, f0
/* 8002FF24 0002BEA4  D0 23 00 00 */	stfs f1, 0x0(r3)
/* 8002FF28 0002BEA8  EC 25 02 72 */	fmuls f1, f5, f9
/* 8002FF2C 0002BEAC  EC 42 40 28 */	fsubs f2, f2, f8
/* 8002FF30 0002BEB0  C0 62 84 DC */	lfs f3, float_800A985C@sda21(r2)
/* 8002FF34 0002BEB4  EC 07 00 32 */	fmuls f0, f7, f0
/* 8002FF38 0002BEB8  D0 63 00 04 */	stfs f3, 0x4(r3)
/* 8002FF3C 0002BEBC  EC 27 00 72 */	fmuls f1, f7, f1
/* 8002FF40 0002BEC0  D0 43 00 08 */	stfs f2, 0x8(r3)
/* 8002FF44 0002BEC4  EC 00 60 28 */	fsubs f0, f0, f12
/* 8002FF48 0002BEC8  D0 63 00 0C */	stfs f3, 0xc(r3)
/* 8002FF4C 0002BECC  D0 63 00 10 */	stfs f3, 0x10(r3)
/* 8002FF50 0002BED0  D0 23 00 14 */	stfs f1, 0x14(r3)
/* 8002FF54 0002BED4  D0 03 00 18 */	stfs f0, 0x18(r3)
/* 8002FF58 0002BED8  D0 63 00 1C */	stfs f3, 0x1c(r3)
/* 8002FF5C 0002BEDC  D0 63 00 20 */	stfs f3, 0x20(r3)
/* 8002FF60 0002BEE0  D0 63 00 24 */	stfs f3, 0x24(r3)
/* 8002FF64 0002BEE4  C0 02 84 E4 */	lfs f0, float_800A9864@sda21(r2)
/* 8002FF68 0002BEE8  D0 03 00 28 */	stfs f0, 0x28(r3)
/* 8002FF6C 0002BEEC  D0 63 00 2C */	stfs f3, 0x2c(r3)
/* 8002FF70 0002BEF0  38 21 00 30 */	addi r1, r1, 0x30
/* 8002FF74 0002BEF4  4E 80 00 20 */	blr
.endfn C_MTXLightFrustum

.section .sdata, "wa"  # 0x800A8A80 - 0x800A8DC0

.balign 8

.obj Unit01, local
	.4byte 0
	.float 1
.endobj Unit01

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0

.balign 8


.obj float_800A9858, local
	.float 1
.endobj float_800A9858

.obj float_800A985C, local
	.4byte 0
.endobj float_800A985C

.obj float_800A9860, local
	.float 2
.endobj float_800A9860

.obj float_800A9864, local
	.float -1
.endobj float_800A9864
