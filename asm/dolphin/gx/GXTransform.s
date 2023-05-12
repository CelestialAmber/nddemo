.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn GXSetProjection, global
/* 800409C4 0003C944  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 800409C8 0003C948  2C 04 00 01 */	cmpwi r4, 0x1
/* 800409CC 0003C94C  90 85 04 20 */	stw r4, 0x420(r5)
/* 800409D0 0003C950  C0 03 00 00 */	lfs f0, 0x0(r3)
/* 800409D4 0003C954  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 800409D8 0003C958  D0 04 04 24 */	stfs f0, 0x424(r4)
/* 800409DC 0003C95C  C0 03 00 14 */	lfs f0, 0x14(r3)
/* 800409E0 0003C960  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 800409E4 0003C964  D0 04 04 2C */	stfs f0, 0x42c(r4)
/* 800409E8 0003C968  C0 03 00 28 */	lfs f0, 0x28(r3)
/* 800409EC 0003C96C  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 800409F0 0003C970  D0 04 04 34 */	stfs f0, 0x434(r4)
/* 800409F4 0003C974  C0 03 00 2C */	lfs f0, 0x2c(r3)
/* 800409F8 0003C978  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 800409FC 0003C97C  D0 04 04 38 */	stfs f0, 0x438(r4)
/* 80040A00 0003C980  40 82 00 20 */	bne .L_80040A20
/* 80040A04 0003C984  C0 03 00 0C */	lfs f0, 0xc(r3)
/* 80040A08 0003C988  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040A0C 0003C98C  D0 04 04 28 */	stfs f0, 0x428(r4)
/* 80040A10 0003C990  C0 03 00 1C */	lfs f0, 0x1c(r3)
/* 80040A14 0003C994  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040A18 0003C998  D0 03 04 30 */	stfs f0, 0x430(r3)
/* 80040A1C 0003C99C  48 00 00 1C */	b .L_80040A38
.L_80040A20:
/* 80040A20 0003C9A0  C0 03 00 08 */	lfs f0, 0x8(r3)
/* 80040A24 0003C9A4  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040A28 0003C9A8  D0 04 04 28 */	stfs f0, 0x428(r4)
/* 80040A2C 0003C9AC  C0 03 00 18 */	lfs f0, 0x18(r3)
/* 80040A30 0003C9B0  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040A34 0003C9B4  D0 03 04 30 */	stfs f0, 0x430(r3)
.L_80040A38:
/* 80040A38 0003C9B8  38 00 00 10 */	li r0, 0x10
/* 80040A3C 0003C9BC  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040A40 0003C9C0  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 80040A44 0003C9C4  3C 60 00 06 */	lis r3, 0x6
/* 80040A48 0003C9C8  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 80040A4C 0003C9CC  38 03 10 20 */	addi r0, r3, 0x1020
/* 80040A50 0003C9D0  90 05 80 00 */	stw r0, -0x8000(r5)
/* 80040A54 0003C9D4  38 00 00 01 */	li r0, 0x1
/* 80040A58 0003C9D8  C0 04 04 24 */	lfs f0, 0x424(r4)
/* 80040A5C 0003C9DC  D0 05 80 00 */	stfs f0, -0x8000(r5)
/* 80040A60 0003C9E0  C0 04 04 28 */	lfs f0, 0x428(r4)
/* 80040A64 0003C9E4  D0 05 80 00 */	stfs f0, -0x8000(r5)
/* 80040A68 0003C9E8  C0 04 04 2C */	lfs f0, 0x42c(r4)
/* 80040A6C 0003C9EC  D0 05 80 00 */	stfs f0, -0x8000(r5)
/* 80040A70 0003C9F0  C0 04 04 30 */	lfs f0, 0x430(r4)
/* 80040A74 0003C9F4  D0 05 80 00 */	stfs f0, -0x8000(r5)
/* 80040A78 0003C9F8  C0 04 04 34 */	lfs f0, 0x434(r4)
/* 80040A7C 0003C9FC  D0 05 80 00 */	stfs f0, -0x8000(r5)
/* 80040A80 0003CA00  C0 04 04 38 */	lfs f0, 0x438(r4)
/* 80040A84 0003CA04  D0 05 80 00 */	stfs f0, -0x8000(r5)
/* 80040A88 0003CA08  80 64 04 20 */	lwz r3, 0x420(r4)
/* 80040A8C 0003CA0C  90 65 80 00 */	stw r3, -0x8000(r5)
/* 80040A90 0003CA10  B0 04 00 02 */	sth r0, 0x2(r4)
/* 80040A94 0003CA14  4E 80 00 20 */	blr
.endfn GXSetProjection

.fn GXGetProjectionv, global
/* 80040A98 0003CA18  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80040A9C 0003CA1C  3C 00 43 30 */	lis r0, 0x4330
/* 80040AA0 0003CA20  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040AA4 0003CA24  C8 22 85 C8 */	lfd f1, lbl_800A9948@sda21(r2)
/* 80040AA8 0003CA28  80 84 04 20 */	lwz r4, 0x420(r4)
/* 80040AAC 0003CA2C  90 81 00 14 */	stw r4, 0x14(r1)
/* 80040AB0 0003CA30  90 01 00 10 */	stw r0, 0x10(r1)
/* 80040AB4 0003CA34  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 80040AB8 0003CA38  38 21 00 18 */	addi r1, r1, 0x18
/* 80040ABC 0003CA3C  EC 00 08 28 */	fsubs f0, f0, f1
/* 80040AC0 0003CA40  D0 03 00 00 */	stfs f0, 0x0(r3)
/* 80040AC4 0003CA44  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040AC8 0003CA48  C0 04 04 24 */	lfs f0, 0x424(r4)
/* 80040ACC 0003CA4C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80040AD0 0003CA50  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040AD4 0003CA54  C0 04 04 28 */	lfs f0, 0x428(r4)
/* 80040AD8 0003CA58  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80040ADC 0003CA5C  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040AE0 0003CA60  C0 04 04 2C */	lfs f0, 0x42c(r4)
/* 80040AE4 0003CA64  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 80040AE8 0003CA68  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040AEC 0003CA6C  C0 04 04 30 */	lfs f0, 0x430(r4)
/* 80040AF0 0003CA70  D0 03 00 10 */	stfs f0, 0x10(r3)
/* 80040AF4 0003CA74  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040AF8 0003CA78  C0 04 04 34 */	lfs f0, 0x434(r4)
/* 80040AFC 0003CA7C  D0 03 00 14 */	stfs f0, 0x14(r3)
/* 80040B00 0003CA80  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040B04 0003CA84  C0 04 04 38 */	lfs f0, 0x438(r4)
/* 80040B08 0003CA88  D0 03 00 18 */	stfs f0, 0x18(r3)
/* 80040B0C 0003CA8C  4E 80 00 20 */	blr
.endfn GXGetProjectionv

.fn WriteMTXPS4x3, local
/* 80040B10 0003CA90  E0 03 00 00 */	psq_l f0, 0x0(r3), 0, qr0
/* 80040B14 0003CA94  E0 23 00 08 */	psq_l f1, 0x8(r3), 0, qr0
/* 80040B18 0003CA98  E0 43 00 10 */	psq_l f2, 0x10(r3), 0, qr0
/* 80040B1C 0003CA9C  E0 63 00 18 */	psq_l f3, 0x18(r3), 0, qr0
/* 80040B20 0003CAA0  E0 83 00 20 */	psq_l f4, 0x20(r3), 0, qr0
/* 80040B24 0003CAA4  E0 A3 00 28 */	psq_l f5, 0x28(r3), 0, qr0
/* 80040B28 0003CAA8  F0 04 00 00 */	psq_st f0, 0x0(r4), 0, qr0
/* 80040B2C 0003CAAC  F0 24 00 00 */	psq_st f1, 0x0(r4), 0, qr0
/* 80040B30 0003CAB0  F0 44 00 00 */	psq_st f2, 0x0(r4), 0, qr0
/* 80040B34 0003CAB4  F0 64 00 00 */	psq_st f3, 0x0(r4), 0, qr0
/* 80040B38 0003CAB8  F0 84 00 00 */	psq_st f4, 0x0(r4), 0, qr0
/* 80040B3C 0003CABC  F0 A4 00 00 */	psq_st f5, 0x0(r4), 0, qr0
/* 80040B40 0003CAC0  4E 80 00 20 */	blr
.endfn WriteMTXPS4x3

.fn WriteMTXPS3x3from3x4, local
/* 80040B44 0003CAC4  E0 03 00 00 */	psq_l f0, 0x0(r3), 0, qr0
/* 80040B48 0003CAC8  C0 23 00 08 */	lfs f1, 0x8(r3)
/* 80040B4C 0003CACC  E0 43 00 10 */	psq_l f2, 0x10(r3), 0, qr0
/* 80040B50 0003CAD0  C0 63 00 18 */	lfs f3, 0x18(r3)
/* 80040B54 0003CAD4  E0 83 00 20 */	psq_l f4, 0x20(r3), 0, qr0
/* 80040B58 0003CAD8  C0 A3 00 28 */	lfs f5, 0x28(r3)
/* 80040B5C 0003CADC  F0 04 00 00 */	psq_st f0, 0x0(r4), 0, qr0
/* 80040B60 0003CAE0  D0 24 00 00 */	stfs f1, 0x0(r4)
/* 80040B64 0003CAE4  F0 44 00 00 */	psq_st f2, 0x0(r4), 0, qr0
/* 80040B68 0003CAE8  D0 64 00 00 */	stfs f3, 0x0(r4)
/* 80040B6C 0003CAEC  F0 84 00 00 */	psq_st f4, 0x0(r4), 0, qr0
/* 80040B70 0003CAF0  D0 A4 00 00 */	stfs f5, 0x0(r4)
/* 80040B74 0003CAF4  4E 80 00 20 */	blr
.endfn WriteMTXPS3x3from3x4

.fn WriteMTXPS4x2, local
/* 80040B78 0003CAF8  E0 03 00 00 */	psq_l f0, 0x0(r3), 0, qr0
/* 80040B7C 0003CAFC  E0 23 00 08 */	psq_l f1, 0x8(r3), 0, qr0
/* 80040B80 0003CB00  E0 43 00 10 */	psq_l f2, 0x10(r3), 0, qr0
/* 80040B84 0003CB04  E0 63 00 18 */	psq_l f3, 0x18(r3), 0, qr0
/* 80040B88 0003CB08  F0 04 00 00 */	psq_st f0, 0x0(r4), 0, qr0
/* 80040B8C 0003CB0C  F0 24 00 00 */	psq_st f1, 0x0(r4), 0, qr0
/* 80040B90 0003CB10  F0 44 00 00 */	psq_st f2, 0x0(r4), 0, qr0
/* 80040B94 0003CB14  F0 64 00 00 */	psq_st f3, 0x0(r4), 0, qr0
/* 80040B98 0003CB18  4E 80 00 20 */	blr
.endfn WriteMTXPS4x2

.fn GXLoadPosMtxImm, global
/* 80040B9C 0003CB1C  7C 08 02 A6 */	mflr r0
/* 80040BA0 0003CB20  90 01 00 04 */	stw r0, 0x4(r1)
/* 80040BA4 0003CB24  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80040BA8 0003CB28  38 C0 00 10 */	li r6, 0x10
/* 80040BAC 0003CB2C  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 80040BB0 0003CB30  54 80 10 3A */	slwi r0, r4, 2
/* 80040BB4 0003CB34  98 C5 80 00 */	stb r6, 0xCC008000@l(r5)
/* 80040BB8 0003CB38  64 00 00 0B */	oris r0, r0, 0xb
/* 80040BBC 0003CB3C  90 05 80 00 */	stw r0, -0x8000(r5)
/* 80040BC0 0003CB40  38 85 80 00 */	addi r4, r5, -0x8000
/* 80040BC4 0003CB44  4B FF FF 4D */	bl WriteMTXPS4x3
/* 80040BC8 0003CB48  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80040BCC 0003CB4C  38 21 00 08 */	addi r1, r1, 0x8
/* 80040BD0 0003CB50  7C 08 03 A6 */	mtlr r0
/* 80040BD4 0003CB54  4E 80 00 20 */	blr
.endfn GXLoadPosMtxImm

.fn GXLoadNrmMtxImm, global
/* 80040BD8 0003CB58  7C 08 02 A6 */	mflr r0
/* 80040BDC 0003CB5C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80040BE0 0003CB60  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80040BE4 0003CB64  1C 84 00 03 */	mulli r4, r4, 0x3
/* 80040BE8 0003CB68  38 04 04 00 */	addi r0, r4, 0x400
/* 80040BEC 0003CB6C  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 80040BF0 0003CB70  38 C0 00 10 */	li r6, 0x10
/* 80040BF4 0003CB74  98 C5 80 00 */	stb r6, 0xCC008000@l(r5)
/* 80040BF8 0003CB78  64 00 00 08 */	oris r0, r0, 0x8
/* 80040BFC 0003CB7C  38 85 80 00 */	addi r4, r5, -0x8000
/* 80040C00 0003CB80  90 05 80 00 */	stw r0, -0x8000(r5)
/* 80040C04 0003CB84  4B FF FF 41 */	bl WriteMTXPS3x3from3x4
/* 80040C08 0003CB88  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80040C0C 0003CB8C  38 21 00 08 */	addi r1, r1, 0x8
/* 80040C10 0003CB90  7C 08 03 A6 */	mtlr r0
/* 80040C14 0003CB94  4E 80 00 20 */	blr
.endfn GXLoadNrmMtxImm

.fn GXSetCurrentMtx, global
/* 80040C18 0003CB98  7C 08 02 A6 */	mflr r0
/* 80040C1C 0003CB9C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80040C20 0003CBA0  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80040C24 0003CBA4  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040C28 0003CBA8  38 84 00 80 */	addi r4, r4, 0x80
/* 80040C2C 0003CBAC  80 04 00 00 */	lwz r0, 0x0(r4)
/* 80040C30 0003CBB0  54 00 00 32 */	clrrwi r0, r0, 6
/* 80040C34 0003CBB4  7C 00 1B 78 */	or r0, r0, r3
/* 80040C38 0003CBB8  90 04 00 00 */	stw r0, 0x0(r4)
/* 80040C3C 0003CBBC  38 60 00 00 */	li r3, 0x0
/* 80040C40 0003CBC0  48 00 02 F5 */	bl __GXSetMatrixIndex
/* 80040C44 0003CBC4  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80040C48 0003CBC8  38 21 00 08 */	addi r1, r1, 0x8
/* 80040C4C 0003CBCC  7C 08 03 A6 */	mtlr r0
/* 80040C50 0003CBD0  4E 80 00 20 */	blr
.endfn GXSetCurrentMtx

.fn GXLoadTexMtxImm, global
/* 80040C54 0003CBD4  7C 08 02 A6 */	mflr r0
/* 80040C58 0003CBD8  90 01 00 04 */	stw r0, 0x4(r1)
/* 80040C5C 0003CBDC  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80040C60 0003CBE0  28 04 00 40 */	cmplwi r4, 0x40
/* 80040C64 0003CBE4  41 80 00 14 */	blt .L_80040C78
/* 80040C68 0003CBE8  38 04 FF C0 */	addi r0, r4, -0x40
/* 80040C6C 0003CBEC  54 04 10 3A */	slwi r4, r0, 2
/* 80040C70 0003CBF0  38 E4 05 00 */	addi r7, r4, 0x500
/* 80040C74 0003CBF4  48 00 00 08 */	b .L_80040C7C
.L_80040C78:
/* 80040C78 0003CBF8  54 87 10 3A */	slwi r7, r4, 2
.L_80040C7C:
/* 80040C7C 0003CBFC  2C 05 00 01 */	cmpwi r5, 0x1
/* 80040C80 0003CC00  40 82 00 0C */	bne .L_80040C8C
/* 80040C84 0003CC04  38 80 00 08 */	li r4, 0x8
/* 80040C88 0003CC08  48 00 00 08 */	b .L_80040C90
.L_80040C8C:
/* 80040C8C 0003CC0C  38 80 00 0C */	li r4, 0xc
.L_80040C90:
/* 80040C90 0003CC10  38 04 FF FF */	addi r0, r4, -0x1
/* 80040C94 0003CC14  54 00 80 1E */	slwi r0, r0, 16
/* 80040C98 0003CC18  38 C0 00 10 */	li r6, 0x10
/* 80040C9C 0003CC1C  3C 80 CC 01 */	lis r4, 0xCC008000@ha
/* 80040CA0 0003CC20  98 C4 80 00 */	stb r6, 0xCC008000@l(r4)
/* 80040CA4 0003CC24  7C E0 03 78 */	or r0, r7, r0
/* 80040CA8 0003CC28  2C 05 00 00 */	cmpwi r5, 0x0
/* 80040CAC 0003CC2C  90 04 80 00 */	stw r0, -0x8000(r4)
/* 80040CB0 0003CC30  40 82 00 10 */	bne .L_80040CC0
/* 80040CB4 0003CC34  38 84 80 00 */	addi r4, r4, -0x8000
/* 80040CB8 0003CC38  4B FF FE 59 */	bl WriteMTXPS4x3
/* 80040CBC 0003CC3C  48 00 00 0C */	b .L_80040CC8
.L_80040CC0:
/* 80040CC0 0003CC40  38 84 80 00 */	addi r4, r4, -0x8000
/* 80040CC4 0003CC44  4B FF FE B5 */	bl WriteMTXPS4x2
.L_80040CC8:
/* 80040CC8 0003CC48  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80040CCC 0003CC4C  38 21 00 08 */	addi r1, r1, 0x8
/* 80040CD0 0003CC50  7C 08 03 A6 */	mtlr r0
/* 80040CD4 0003CC54  4E 80 00 20 */	blr
.endfn GXLoadTexMtxImm

.fn GXSetViewportJitter, global
/* 80040CD8 0003CC58  7C 08 02 A6 */	mflr r0
/* 80040CDC 0003CC5C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80040CE0 0003CC60  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 80040CE4 0003CC64  DB E1 00 58 */	stfd f31, 0x58(r1)
/* 80040CE8 0003CC68  DB C1 00 50 */	stfd f30, 0x50(r1)
/* 80040CEC 0003CC6C  DB A1 00 48 */	stfd f29, 0x48(r1)
/* 80040CF0 0003CC70  DB 81 00 40 */	stfd f28, 0x40(r1)
/* 80040CF4 0003CC74  DB 61 00 38 */	stfd f27, 0x38(r1)
/* 80040CF8 0003CC78  DB 41 00 30 */	stfd f26, 0x30(r1)
/* 80040CFC 0003CC7C  28 03 00 00 */	cmplwi r3, 0x0
/* 80040D00 0003CC80  40 82 00 0C */	bne .L_80040D0C
/* 80040D04 0003CC84  C0 02 85 C0 */	lfs f0, float_800A9940@sda21(r2)
/* 80040D08 0003CC88  EC 42 00 28 */	fsubs f2, f2, f0
.L_80040D0C:
/* 80040D0C 0003CC8C  C1 62 85 C0 */	lfs f11, float_800A9940@sda21(r2)
/* 80040D10 0003CC90  FD 40 20 50 */	fneg f10, f4
/* 80040D14 0003CC94  C0 02 85 D4 */	lfs f0, float_800A9954@sda21(r2)
/* 80040D18 0003CC98  C1 22 85 D0 */	lfs f9, float_800A9950@sda21(r2)
/* 80040D1C 0003CC9C  EF E3 02 F2 */	fmuls f31, f3, f11
/* 80040D20 0003CCA0  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040D24 0003CCA4  EC E4 02 F2 */	fmuls f7, f4, f11
/* 80040D28 0003CCA8  D0 23 04 3C */	stfs f1, 0x43c(r3)
/* 80040D2C 0003CCAC  ED 01 F8 2A */	fadds f8, f1, f31
/* 80040D30 0003CCB0  EF C0 01 B2 */	fmuls f30, f0, f6
/* 80040D34 0003CCB4  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040D38 0003CCB8  EC 22 38 2A */	fadds f1, f2, f7
/* 80040D3C 0003CCBC  D0 43 04 40 */	stfs f2, 0x440(r3)
/* 80040D40 0003CCC0  EC 00 01 72 */	fmuls f0, f0, f5
/* 80040D44 0003CCC4  EF AA 02 F2 */	fmuls f29, f10, f11
/* 80040D48 0003CCC8  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040D4C 0003CCCC  EF 69 40 2A */	fadds f27, f9, f8
/* 80040D50 0003CCD0  D0 63 04 44 */	stfs f3, 0x444(r3)
/* 80040D54 0003CCD4  EF 49 08 2A */	fadds f26, f9, f1
/* 80040D58 0003CCD8  EF 9E 00 28 */	fsubs f28, f30, f0
/* 80040D5C 0003CCDC  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040D60 0003CCE0  D0 83 04 48 */	stfs f4, 0x448(r3)
/* 80040D64 0003CCE4  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040D68 0003CCE8  D0 A3 04 4C */	stfs f5, 0x44c(r3)
/* 80040D6C 0003CCEC  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040D70 0003CCF0  D0 C3 04 50 */	stfs f6, 0x450(r3)
/* 80040D74 0003CCF4  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040D78 0003CCF8  88 03 04 54 */	lbz r0, 0x454(r3)
/* 80040D7C 0003CCFC  28 00 00 00 */	cmplwi r0, 0x0
/* 80040D80 0003CD00  41 82 00 10 */	beq .L_80040D90
/* 80040D84 0003CD04  FC 20 28 90 */	fmr f1, f5
/* 80040D88 0003CD08  C0 43 04 58 */	lfs f2, 0x458(r3)
/* 80040D8C 0003CD0C  4B FF FB C5 */	bl __GXSetRange
.L_80040D90:
/* 80040D90 0003CD10  38 00 00 10 */	li r0, 0x10
/* 80040D94 0003CD14  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040D98 0003CD18  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 80040D9C 0003CD1C  3C 80 00 05 */	lis r4, 0x5
/* 80040DA0 0003CD20  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 80040DA4 0003CD24  38 04 10 1A */	addi r0, r4, 0x101a
/* 80040DA8 0003CD28  90 05 80 00 */	stw r0, -0x8000(r5)
/* 80040DAC 0003CD2C  38 00 00 01 */	li r0, 0x1
/* 80040DB0 0003CD30  D3 E5 80 00 */	stfs f31, -0x8000(r5)
/* 80040DB4 0003CD34  D3 A5 80 00 */	stfs f29, -0x8000(r5)
/* 80040DB8 0003CD38  D3 85 80 00 */	stfs f28, -0x8000(r5)
/* 80040DBC 0003CD3C  D3 65 80 00 */	stfs f27, -0x8000(r5)
/* 80040DC0 0003CD40  D3 45 80 00 */	stfs f26, -0x8000(r5)
/* 80040DC4 0003CD44  D3 C5 80 00 */	stfs f30, -0x8000(r5)
/* 80040DC8 0003CD48  B0 03 00 02 */	sth r0, 0x2(r3)
/* 80040DCC 0003CD4C  80 01 00 64 */	lwz r0, 0x64(r1)
/* 80040DD0 0003CD50  CB E1 00 58 */	lfd f31, 0x58(r1)
/* 80040DD4 0003CD54  CB C1 00 50 */	lfd f30, 0x50(r1)
/* 80040DD8 0003CD58  7C 08 03 A6 */	mtlr r0
/* 80040DDC 0003CD5C  CB A1 00 48 */	lfd f29, 0x48(r1)
/* 80040DE0 0003CD60  CB 81 00 40 */	lfd f28, 0x40(r1)
/* 80040DE4 0003CD64  CB 61 00 38 */	lfd f27, 0x38(r1)
/* 80040DE8 0003CD68  CB 41 00 30 */	lfd f26, 0x30(r1)
/* 80040DEC 0003CD6C  38 21 00 60 */	addi r1, r1, 0x60
/* 80040DF0 0003CD70  4E 80 00 20 */	blr
.endfn GXSetViewportJitter

.fn GXSetViewport, global
/* 80040DF4 0003CD74  7C 08 02 A6 */	mflr r0
/* 80040DF8 0003CD78  90 01 00 04 */	stw r0, 0x4(r1)
/* 80040DFC 0003CD7C  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80040E00 0003CD80  38 60 00 01 */	li r3, 0x1
/* 80040E04 0003CD84  4B FF FE D5 */	bl GXSetViewportJitter
/* 80040E08 0003CD88  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80040E0C 0003CD8C  38 21 00 08 */	addi r1, r1, 0x8
/* 80040E10 0003CD90  7C 08 03 A6 */	mtlr r0
/* 80040E14 0003CD94  4E 80 00 20 */	blr
.endfn GXSetViewport

.fn GXSetScissor, global
/* 80040E18 0003CD98  80 ED 82 90 */	lwz r7, gx@sda21(r13)
/* 80040E1C 0003CD9C  39 03 01 56 */	addi r8, r3, 0x156
/* 80040E20 0003CDA0  38 05 FF FF */	addi r0, r5, -0x1
/* 80040E24 0003CDA4  38 A7 00 F8 */	addi r5, r7, 0xf8
/* 80040E28 0003CDA8  80 65 00 00 */	lwz r3, 0x0(r5)
/* 80040E2C 0003CDAC  7C 08 02 14 */	add r0, r8, r0
/* 80040E30 0003CDB0  38 84 01 56 */	addi r4, r4, 0x156
/* 80040E34 0003CDB4  54 63 00 28 */	clrrwi r3, r3, 11
/* 80040E38 0003CDB8  7C 63 23 78 */	or r3, r3, r4
/* 80040E3C 0003CDBC  90 65 00 00 */	stw r3, 0x0(r5)
/* 80040E40 0003CDC0  38 66 FF FF */	addi r3, r6, -0x1
/* 80040E44 0003CDC4  55 07 60 26 */	slwi r7, r8, 12
/* 80040E48 0003CDC8  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 80040E4C 0003CDCC  7C 84 1A 14 */	add r4, r4, r3
/* 80040E50 0003CDD0  54 03 60 26 */	slwi r3, r0, 12
/* 80040E54 0003CDD4  39 05 00 F8 */	addi r8, r5, 0xf8
/* 80040E58 0003CDD8  80 08 00 00 */	lwz r0, 0x0(r8)
/* 80040E5C 0003CDDC  38 C0 00 61 */	li r6, 0x61
/* 80040E60 0003CDE0  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 80040E64 0003CDE4  54 00 05 10 */	rlwinm r0, r0, 0, 20, 8
/* 80040E68 0003CDE8  7C 00 3B 78 */	or r0, r0, r7
/* 80040E6C 0003CDEC  90 08 00 00 */	stw r0, 0x0(r8)
/* 80040E70 0003CDF0  38 00 00 00 */	li r0, 0x0
/* 80040E74 0003CDF4  80 ED 82 90 */	lwz r7, gx@sda21(r13)
/* 80040E78 0003CDF8  39 07 00 FC */	addi r8, r7, 0xfc
/* 80040E7C 0003CDFC  80 E8 00 00 */	lwz r7, 0x0(r8)
/* 80040E80 0003CE00  54 E7 00 28 */	clrrwi r7, r7, 11
/* 80040E84 0003CE04  7C E4 23 78 */	or r4, r7, r4
/* 80040E88 0003CE08  90 88 00 00 */	stw r4, 0x0(r8)
/* 80040E8C 0003CE0C  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040E90 0003CE10  38 E4 00 FC */	addi r7, r4, 0xfc
/* 80040E94 0003CE14  80 87 00 00 */	lwz r4, 0x0(r7)
/* 80040E98 0003CE18  54 84 05 10 */	rlwinm r4, r4, 0, 20, 8
/* 80040E9C 0003CE1C  7C 83 1B 78 */	or r3, r4, r3
/* 80040EA0 0003CE20  90 67 00 00 */	stw r3, 0x0(r7)
/* 80040EA4 0003CE24  98 C5 80 00 */	stb r6, 0xCC008000@l(r5)
/* 80040EA8 0003CE28  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040EAC 0003CE2C  80 64 00 F8 */	lwz r3, 0xf8(r4)
/* 80040EB0 0003CE30  90 65 80 00 */	stw r3, -0x8000(r5)
/* 80040EB4 0003CE34  98 C5 80 00 */	stb r6, -0x8000(r5)
/* 80040EB8 0003CE38  80 64 00 FC */	lwz r3, 0xfc(r4)
/* 80040EBC 0003CE3C  90 65 80 00 */	stw r3, -0x8000(r5)
/* 80040EC0 0003CE40  B0 04 00 02 */	sth r0, 0x2(r4)
/* 80040EC4 0003CE44  4E 80 00 20 */	blr
.endfn GXSetScissor

.fn GXSetScissorBoxOffset, global
/* 80040EC8 0003CE48  38 A3 01 56 */	addi r5, r3, 0x156
/* 80040ECC 0003CE4C  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040ED0 0003CE50  38 04 01 56 */	addi r0, r4, 0x156
/* 80040ED4 0003CE54  54 A4 F8 7E */	srwi r4, r5, 1
/* 80040ED8 0003CE58  54 00 F8 7E */	srwi r0, r0, 1
/* 80040EDC 0003CE5C  54 84 05 96 */	rlwinm r4, r4, 0, 22, 11
/* 80040EE0 0003CE60  54 00 50 2A */	slwi r0, r0, 10
/* 80040EE4 0003CE64  7C 80 03 78 */	or r0, r4, r0
/* 80040EE8 0003CE68  54 05 02 3E */	clrlwi r5, r0, 8
/* 80040EEC 0003CE6C  38 00 00 61 */	li r0, 0x61
/* 80040EF0 0003CE70  3C 80 CC 01 */	lis r4, 0xCC008000@ha
/* 80040EF4 0003CE74  98 04 80 00 */	stb r0, 0xCC008000@l(r4)
/* 80040EF8 0003CE78  64 A5 59 00 */	oris r5, r5, 0x5900
/* 80040EFC 0003CE7C  38 00 00 00 */	li r0, 0x0
/* 80040F00 0003CE80  90 A4 80 00 */	stw r5, -0x8000(r4)
/* 80040F04 0003CE84  B0 03 00 02 */	sth r0, 0x2(r3)
/* 80040F08 0003CE88  4E 80 00 20 */	blr
.endfn GXSetScissorBoxOffset

.fn GXSetClipMode, global
/* 80040F0C 0003CE8C  38 00 00 10 */	li r0, 0x10
/* 80040F10 0003CE90  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040F14 0003CE94  3C C0 CC 01 */	lis r6, 0xCC008000@ha
/* 80040F18 0003CE98  98 06 80 00 */	stb r0, 0xCC008000@l(r6)
/* 80040F1C 0003CE9C  38 A0 10 05 */	li r5, 0x1005
/* 80040F20 0003CEA0  38 00 00 01 */	li r0, 0x1
/* 80040F24 0003CEA4  90 A6 80 00 */	stw r5, -0x8000(r6)
/* 80040F28 0003CEA8  90 66 80 00 */	stw r3, -0x8000(r6)
/* 80040F2C 0003CEAC  B0 04 00 02 */	sth r0, 0x2(r4)
/* 80040F30 0003CEB0  4E 80 00 20 */	blr
.endfn GXSetClipMode

.fn __GXSetMatrixIndex, global
/* 80040F34 0003CEB4  2C 03 00 05 */	cmpwi r3, 0x5
/* 80040F38 0003CEB8  40 80 00 3C */	bge .L_80040F74
/* 80040F3C 0003CEBC  38 00 00 08 */	li r0, 0x8
/* 80040F40 0003CEC0  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040F44 0003CEC4  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 80040F48 0003CEC8  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 80040F4C 0003CECC  38 00 00 30 */	li r0, 0x30
/* 80040F50 0003CED0  38 60 00 10 */	li r3, 0x10
/* 80040F54 0003CED4  98 05 80 00 */	stb r0, -0x8000(r5)
/* 80040F58 0003CED8  38 00 10 18 */	li r0, 0x1018
/* 80040F5C 0003CEDC  80 84 00 80 */	lwz r4, 0x80(r4)
/* 80040F60 0003CEE0  90 85 80 00 */	stw r4, -0x8000(r5)
/* 80040F64 0003CEE4  98 65 80 00 */	stb r3, -0x8000(r5)
/* 80040F68 0003CEE8  90 05 80 00 */	stw r0, -0x8000(r5)
/* 80040F6C 0003CEEC  90 85 80 00 */	stw r4, -0x8000(r5)
/* 80040F70 0003CEF0  48 00 00 38 */	b .L_80040FA8
.L_80040F74:
/* 80040F74 0003CEF4  38 00 00 08 */	li r0, 0x8
/* 80040F78 0003CEF8  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040F7C 0003CEFC  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 80040F80 0003CF00  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 80040F84 0003CF04  38 00 00 40 */	li r0, 0x40
/* 80040F88 0003CF08  38 60 00 10 */	li r3, 0x10
/* 80040F8C 0003CF0C  98 05 80 00 */	stb r0, -0x8000(r5)
/* 80040F90 0003CF10  38 00 10 19 */	li r0, 0x1019
/* 80040F94 0003CF14  80 84 00 84 */	lwz r4, 0x84(r4)
/* 80040F98 0003CF18  90 85 80 00 */	stw r4, -0x8000(r5)
/* 80040F9C 0003CF1C  98 65 80 00 */	stb r3, -0x8000(r5)
/* 80040FA0 0003CF20  90 05 80 00 */	stw r0, -0x8000(r5)
/* 80040FA4 0003CF24  90 85 80 00 */	stw r4, -0x8000(r5)
.L_80040FA8:
/* 80040FA8 0003CF28  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040FAC 0003CF2C  38 00 00 01 */	li r0, 0x1
/* 80040FB0 0003CF30  B0 03 00 02 */	sth r0, 0x2(r3)
/* 80040FB4 0003CF34  4E 80 00 20 */	blr
.endfn __GXSetMatrixIndex

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0 ; 0x00000820

.balign 8


.obj float_800A9940, local
	.4byte 0x3F000000
.endobj float_800A9940

.4byte 0

.obj lbl_800A9948, local
	.8byte 0x4330000000000000
.endobj lbl_800A9948

.obj float_800A9950, local
	.4byte 0x43AB0000
.endobj float_800A9950

.obj float_800A9954, local
	.4byte 0x4B7FFFFF
.endobj float_800A9954
