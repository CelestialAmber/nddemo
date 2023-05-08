.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740



__ct__7DGLightFv:
/* 80012B04 0000EA84  7C 08 02 A6 */	mflr r0
/* 80012B08 0000EA88  38 A0 00 FF */	li r5, 0xff
/* 80012B0C 0000EA8C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80012B10 0000EA90  38 80 00 00 */	li r4, 0x0
/* 80012B14 0000EA94  38 00 00 01 */	li r0, 0x1
/* 80012B18 0000EA98  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80012B1C 0000EA9C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80012B20 0000EAA0  3B E3 00 00 */	addi r31, r3, 0x0
/* 80012B24 0000EAA4  C0 42 81 10 */	lfs f2, lbl_800A9490@sda21(r2)
/* 80012B28 0000EAA8  D0 43 00 00 */	stfs f2, 0x0(r3)
/* 80012B2C 0000EAAC  FC 60 10 90 */	fmr f3, f2
/* 80012B30 0000EAB0  D0 43 00 04 */	stfs f2, 0x4(r3)
/* 80012B34 0000EAB4  D0 5F 00 08 */	stfs f2, 0x8(r31)
/* 80012B38 0000EAB8  D0 5F 00 0C */	stfs f2, 0xc(r31)
/* 80012B3C 0000EABC  D0 5F 00 10 */	stfs f2, 0x10(r31)
/* 80012B40 0000EAC0  C0 22 81 14 */	lfs f1, lbl_800A9494@sda21(r2)
/* 80012B44 0000EAC4  D0 3F 00 14 */	stfs f1, 0x14(r31)
/* 80012B48 0000EAC8  98 BF 00 18 */	stb r5, 0x18(r31)
/* 80012B4C 0000EACC  98 BF 00 19 */	stb r5, 0x19(r31)
/* 80012B50 0000EAD0  98 BF 00 1A */	stb r5, 0x1a(r31)
/* 80012B54 0000EAD4  98 BF 00 1B */	stb r5, 0x1b(r31)
/* 80012B58 0000EAD8  98 9F 00 34 */	stb r4, 0x34(r31)
/* 80012B5C 0000EADC  98 1F 00 35 */	stb r0, 0x35(r31)
/* 80012B60 0000EAE0  98 9F 00 36 */	stb r4, 0x36(r31)
/* 80012B64 0000EAE4  98 9F 00 37 */	stb r4, 0x37(r31)
/* 80012B68 0000EAE8  C0 02 81 18 */	lfs f0, lbl_800A9498@sda21(r2)
/* 80012B6C 0000EAEC  D0 1F 00 38 */	stfs f0, 0x38(r31)
/* 80012B70 0000EAF0  48 00 03 19 */	bl SetAngleAttenuation__7DGLightFfff
/* 80012B74 0000EAF4  C0 42 81 10 */	lfs f2, lbl_800A9490@sda21(r2)
/* 80012B78 0000EAF8  7F E3 FB 78 */	mr r3, r31
/* 80012B7C 0000EAFC  C0 22 81 14 */	lfs f1, lbl_800A9494@sda21(r2)
/* 80012B80 0000EB00  FC 60 10 90 */	fmr f3, f2
/* 80012B84 0000EB04  48 00 02 95 */	bl SetDistanceAttenuation__7DGLightFfff
/* 80012B88 0000EB08  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80012B8C 0000EB0C  7F E3 FB 78 */	mr r3, r31
/* 80012B90 0000EB10  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80012B94 0000EB14  38 21 00 18 */	addi r1, r1, 0x18
/* 80012B98 0000EB18  7C 08 03 A6 */	mtlr r0
/* 80012B9C 0000EB1C  4E 80 00 20 */	blr

__dt__7DGLightFv:
/* 80012BA0 0000EB20  7C 08 02 A6 */	mflr r0
/* 80012BA4 0000EB24  90 01 00 04 */	stw r0, 0x4(r1)
/* 80012BA8 0000EB28  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80012BAC 0000EB2C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80012BB0 0000EB30  7C 7F 1B 79 */	mr. r31, r3
/* 80012BB4 0000EB34  41 82 00 14 */	beq lbl_80012BC8
/* 80012BB8 0000EB38  7C 80 07 35 */	extsh. r0, r4
/* 80012BBC 0000EB3C  40 81 00 0C */	ble lbl_80012BC8
/* 80012BC0 0000EB40  7F E3 FB 78 */	mr r3, r31
/* 80012BC4 0000EB44  4B FF FE D5 */	bl mFree__FPv
lbl_80012BC8:
/* 80012BC8 0000EB48  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80012BCC 0000EB4C  7F E3 FB 78 */	mr r3, r31
/* 80012BD0 0000EB50  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80012BD4 0000EB54  38 21 00 18 */	addi r1, r1, 0x18
/* 80012BD8 0000EB58  7C 08 03 A6 */	mtlr r0
/* 80012BDC 0000EB5C  4E 80 00 20 */	blr

SetLight__7DGLightF10_GXLightIDR11DGRendState:
/* 80012BE0 0000EB60  7C 08 02 A6 */	mflr r0
/* 80012BE4 0000EB64  90 01 00 04 */	stw r0, 0x4(r1)
/* 80012BE8 0000EB68  94 21 FF 50 */	stwu r1, -0xb0(r1)
/* 80012BEC 0000EB6C  93 E1 00 AC */	stw r31, 0xac(r1)
/* 80012BF0 0000EB70  3B E5 00 00 */	addi r31, r5, 0x0
/* 80012BF4 0000EB74  93 C1 00 A8 */	stw r30, 0xa8(r1)
/* 80012BF8 0000EB78  3B C4 00 00 */	addi r30, r4, 0x0
/* 80012BFC 0000EB7C  38 81 00 24 */	addi r4, r1, 0x24
/* 80012C00 0000EB80  93 A1 00 A4 */	stw r29, 0xa4(r1)
/* 80012C04 0000EB84  3B A3 00 00 */	addi r29, r3, 0x0
/* 80012C08 0000EB88  38 7F 00 00 */	addi r3, r31, 0x0
/* 80012C0C 0000EB8C  48 01 CE E1 */	bl PSMTXInverse
/* 80012C10 0000EB90  38 61 00 24 */	addi r3, r1, 0x24
/* 80012C14 0000EB94  38 83 00 00 */	addi r4, r3, 0x0
/* 80012C18 0000EB98  48 01 CE 85 */	bl PSMTXTranspose
/* 80012C1C 0000EB9C  38 61 00 24 */	addi r3, r1, 0x24
/* 80012C20 0000EBA0  38 9D 00 0C */	addi r4, r29, 0xc
/* 80012C24 0000EBA4  38 A1 00 54 */	addi r5, r1, 0x54
/* 80012C28 0000EBA8  48 01 D3 A5 */	bl PSMTXMultVecSR
/* 80012C2C 0000EBAC  38 61 00 54 */	addi r3, r1, 0x54
/* 80012C30 0000EBB0  38 83 00 00 */	addi r4, r3, 0x0
/* 80012C34 0000EBB4  48 01 D5 69 */	bl PSVECNormalize
/* 80012C38 0000EBB8  88 1D 00 37 */	lbz r0, 0x37(r29)
/* 80012C3C 0000EBBC  28 00 00 00 */	cmplwi r0, 0x0
/* 80012C40 0000EBC0  40 82 00 9C */	bne lbl_80012CDC
/* 80012C44 0000EBC4  38 7F 00 00 */	addi r3, r31, 0x0
/* 80012C48 0000EBC8  38 9D 00 00 */	addi r4, r29, 0x0
/* 80012C4C 0000EBCC  38 A1 00 18 */	addi r5, r1, 0x18
/* 80012C50 0000EBD0  48 01 D3 29 */	bl PSMTXMultVec
/* 80012C54 0000EBD4  C0 21 00 18 */	lfs f1, 0x18(r1)
/* 80012C58 0000EBD8  38 61 00 60 */	addi r3, r1, 0x60
/* 80012C5C 0000EBDC  C0 41 00 1C */	lfs f2, 0x1c(r1)
/* 80012C60 0000EBE0  C0 61 00 20 */	lfs f3, 0x20(r1)
/* 80012C64 0000EBE4  48 02 AF F1 */	bl GXInitLightPos
/* 80012C68 0000EBE8  80 1F 00 64 */	lwz r0, 0x64(r31)
/* 80012C6C 0000EBEC  38 61 00 60 */	addi r3, r1, 0x60
/* 80012C70 0000EBF0  7C 00 F3 78 */	or r0, r0, r30
/* 80012C74 0000EBF4  90 1F 00 64 */	stw r0, 0x64(r31)
/* 80012C78 0000EBF8  C0 21 00 54 */	lfs f1, 0x54(r1)
/* 80012C7C 0000EBFC  C0 41 00 58 */	lfs f2, 0x58(r1)
/* 80012C80 0000EC00  C0 61 00 5C */	lfs f3, 0x5c(r1)
/* 80012C84 0000EC04  48 02 AF E1 */	bl GXInitLightDir
/* 80012C88 0000EC08  88 1D 00 36 */	lbz r0, 0x36(r29)
/* 80012C8C 0000EC0C  28 00 00 01 */	cmplwi r0, 0x1
/* 80012C90 0000EC10  40 82 00 28 */	bne lbl_80012CB8
/* 80012C94 0000EC14  C0 3D 00 28 */	lfs f1, 0x28(r29)
/* 80012C98 0000EC18  38 61 00 60 */	addi r3, r1, 0x60
/* 80012C9C 0000EC1C  C0 5D 00 2C */	lfs f2, 0x2c(r29)
/* 80012CA0 0000EC20  C0 7D 00 30 */	lfs f3, 0x30(r29)
/* 80012CA4 0000EC24  C0 9D 00 1C */	lfs f4, 0x1c(r29)
/* 80012CA8 0000EC28  C0 BD 00 20 */	lfs f5, 0x20(r29)
/* 80012CAC 0000EC2C  C0 DD 00 24 */	lfs f6, 0x24(r29)
/* 80012CB0 0000EC30  48 02 AF 89 */	bl GXInitLightAttn
/* 80012CB4 0000EC34  48 00 00 70 */	b lbl_80012D24
lbl_80012CB8:
/* 80012CB8 0000EC38  C0 42 81 10 */	lfs f2, lbl_800A9490@sda21(r2)
/* 80012CBC 0000EC3C  38 61 00 60 */	addi r3, r1, 0x60
/* 80012CC0 0000EC40  C0 22 81 14 */	lfs f1, lbl_800A9494@sda21(r2)
/* 80012CC4 0000EC44  FC 60 10 90 */	fmr f3, f2
/* 80012CC8 0000EC48  C0 9D 00 1C */	lfs f4, 0x1c(r29)
/* 80012CCC 0000EC4C  C0 BD 00 20 */	lfs f5, 0x20(r29)
/* 80012CD0 0000EC50  C0 DD 00 24 */	lfs f6, 0x24(r29)
/* 80012CD4 0000EC54  48 02 AF 65 */	bl GXInitLightAttn
/* 80012CD8 0000EC58  48 00 00 4C */	b lbl_80012D24
lbl_80012CDC:
/* 80012CDC 0000EC5C  80 1F 00 68 */	lwz r0, 0x68(r31)
/* 80012CE0 0000EC60  38 61 00 60 */	addi r3, r1, 0x60
/* 80012CE4 0000EC64  7C 00 F3 78 */	or r0, r0, r30
/* 80012CE8 0000EC68  90 1F 00 68 */	stw r0, 0x68(r31)
/* 80012CEC 0000EC6C  C0 21 00 54 */	lfs f1, 0x54(r1)
/* 80012CF0 0000EC70  C0 41 00 58 */	lfs f2, 0x58(r1)
/* 80012CF4 0000EC74  C0 61 00 5C */	lfs f3, 0x5c(r1)
/* 80012CF8 0000EC78  48 02 AF 89 */	bl GXInitSpecularDir
/* 80012CFC 0000EC7C  C0 5D 00 38 */	lfs f2, 0x38(r29)
/* 80012D00 0000EC80  38 61 00 60 */	addi r3, r1, 0x60
/* 80012D04 0000EC84  C0 02 81 1C */	lfs f0, lbl_800A949C@sda21(r2)
/* 80012D08 0000EC88  C0 22 81 10 */	lfs f1, lbl_800A9490@sda21(r2)
/* 80012D0C 0000EC8C  EC 82 00 32 */	fmuls f4, f2, f0
/* 80012D10 0000EC90  C0 62 81 14 */	lfs f3, lbl_800A9494@sda21(r2)
/* 80012D14 0000EC94  FC 40 08 90 */	fmr f2, f1
/* 80012D18 0000EC98  FC A0 08 90 */	fmr f5, f1
/* 80012D1C 0000EC9C  EC C3 20 28 */	fsubs f6, f3, f4
/* 80012D20 0000ECA0  48 02 AF 19 */	bl GXInitLightAttn
lbl_80012D24:
/* 80012D24 0000ECA4  80 1D 00 18 */	lwz r0, 0x18(r29)
/* 80012D28 0000ECA8  38 81 00 14 */	addi r4, r1, 0x14
/* 80012D2C 0000ECAC  38 61 00 60 */	addi r3, r1, 0x60
/* 80012D30 0000ECB0  90 01 00 14 */	stw r0, 0x14(r1)
/* 80012D34 0000ECB4  48 02 B0 21 */	bl GXInitLightColor
/* 80012D38 0000ECB8  38 61 00 60 */	addi r3, r1, 0x60
/* 80012D3C 0000ECBC  38 9E 00 00 */	addi r4, r30, 0x0
/* 80012D40 0000ECC0  48 02 B0 3D */	bl GXLoadLightObjImm
/* 80012D44 0000ECC4  80 01 00 B4 */	lwz r0, 0xb4(r1)
/* 80012D48 0000ECC8  83 E1 00 AC */	lwz r31, 0xac(r1)
/* 80012D4C 0000ECCC  83 C1 00 A8 */	lwz r30, 0xa8(r1)
/* 80012D50 0000ECD0  7C 08 03 A6 */	mtlr r0
/* 80012D54 0000ECD4  83 A1 00 A4 */	lwz r29, 0xa4(r1)
/* 80012D58 0000ECD8  38 21 00 B0 */	addi r1, r1, 0xb0
/* 80012D5C 0000ECDC  4E 80 00 20 */	blr

SetPosition__7DGLightFRC3Vec:
/* 80012D60 0000ECE0  80 A4 00 00 */	lwz r5, 0x0(r4)
/* 80012D64 0000ECE4  80 04 00 04 */	lwz r0, 0x4(r4)
/* 80012D68 0000ECE8  90 A3 00 00 */	stw r5, 0x0(r3)
/* 80012D6C 0000ECEC  90 03 00 04 */	stw r0, 0x4(r3)
/* 80012D70 0000ECF0  80 04 00 08 */	lwz r0, 0x8(r4)
/* 80012D74 0000ECF4  90 03 00 08 */	stw r0, 0x8(r3)
/* 80012D78 0000ECF8  4E 80 00 20 */	blr

AddPosition__7DGLightFRC3Vec:
/* 80012D7C 0000ECFC  C0 23 00 00 */	lfs f1, 0x0(r3)
/* 80012D80 0000ED00  C0 04 00 00 */	lfs f0, 0x0(r4)
/* 80012D84 0000ED04  EC 01 00 2A */	fadds f0, f1, f0
/* 80012D88 0000ED08  D0 03 00 00 */	stfs f0, 0x0(r3)
/* 80012D8C 0000ED0C  C0 23 00 04 */	lfs f1, 0x4(r3)
/* 80012D90 0000ED10  C0 04 00 04 */	lfs f0, 0x4(r4)
/* 80012D94 0000ED14  EC 01 00 2A */	fadds f0, f1, f0
/* 80012D98 0000ED18  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80012D9C 0000ED1C  C0 23 00 08 */	lfs f1, 0x8(r3)
/* 80012DA0 0000ED20  C0 04 00 08 */	lfs f0, 0x8(r4)
/* 80012DA4 0000ED24  EC 01 00 2A */	fadds f0, f1, f0
/* 80012DA8 0000ED28  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80012DAC 0000ED2C  4E 80 00 20 */	blr

SetDirectionFromObserve__7DGLightFR3Vec:
/* 80012DB0 0000ED30  7C 08 02 A6 */	mflr r0
/* 80012DB4 0000ED34  90 01 00 04 */	stw r0, 0x4(r1)
/* 80012DB8 0000ED38  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80012DBC 0000ED3C  93 E1 00 24 */	stw r31, 0x24(r1)
/* 80012DC0 0000ED40  3B E3 00 00 */	addi r31, r3, 0x0
/* 80012DC4 0000ED44  38 64 00 00 */	addi r3, r4, 0x0
/* 80012DC8 0000ED48  38 9F 00 00 */	addi r4, r31, 0x0
/* 80012DCC 0000ED4C  38 A1 00 10 */	addi r5, r1, 0x10
/* 80012DD0 0000ED50  48 01 D3 A9 */	bl PSVECSubtract
/* 80012DD4 0000ED54  38 61 00 10 */	addi r3, r1, 0x10
/* 80012DD8 0000ED58  38 9F 00 0C */	addi r4, r31, 0xc
/* 80012DDC 0000ED5C  48 01 D3 C1 */	bl PSVECNormalize
/* 80012DE0 0000ED60  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80012DE4 0000ED64  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 80012DE8 0000ED68  38 21 00 28 */	addi r1, r1, 0x28
/* 80012DEC 0000ED6C  7C 08 03 A6 */	mtlr r0
/* 80012DF0 0000ED70  4E 80 00 20 */	blr

SetLightColor__7DGLightFRC8_GXColor:
/* 80012DF4 0000ED74  80 04 00 00 */	lwz r0, 0x0(r4)
/* 80012DF8 0000ED78  90 03 00 18 */	stw r0, 0x18(r3)
/* 80012DFC 0000ED7C  4E 80 00 20 */	blr

EnableSpecularLight__7DGLightFUc:
/* 80012E00 0000ED80  98 83 00 37 */	stb r4, 0x37(r3)
/* 80012E04 0000ED84  4E 80 00 20 */	blr

SetShininess__7DGLightFf:
/* 80012E08 0000ED88  D0 23 00 38 */	stfs f1, 0x38(r3)
/* 80012E0C 0000ED8C  4E 80 00 20 */	blr

EnableSpotLight__7DGLightFUc:
/* 80012E10 0000ED90  98 83 00 36 */	stb r4, 0x36(r3)
/* 80012E14 0000ED94  4E 80 00 20 */	blr

SetDistanceAttenuation__7DGLightFfff:
/* 80012E18 0000ED98  D0 23 00 1C */	stfs f1, 0x1c(r3)
/* 80012E1C 0000ED9C  D0 43 00 20 */	stfs f2, 0x20(r3)
/* 80012E20 0000EDA0  D0 63 00 24 */	stfs f3, 0x24(r3)
/* 80012E24 0000EDA4  4E 80 00 20 */	blr

SetDistanceAttenuation_0__7DGLightFf:
/* 80012E28 0000EDA8  D0 23 00 1C */	stfs f1, 0x1c(r3)
/* 80012E2C 0000EDAC  C0 02 81 10 */	lfs f0, lbl_800A9490@sda21(r2)
/* 80012E30 0000EDB0  D0 03 00 20 */	stfs f0, 0x20(r3)
/* 80012E34 0000EDB4  D0 03 00 24 */	stfs f0, 0x24(r3)
/* 80012E38 0000EDB8  4E 80 00 20 */	blr

SetDistanceAttenuation_1__7DGLightFfff:
/* 80012E3C 0000EDBC  C0 82 81 10 */	lfs f4, lbl_800A9490@sda21(r2)
/* 80012E40 0000EDC0  FC 04 10 00 */	fcmpu cr0, f4, f2
/* 80012E44 0000EDC4  4D 82 00 20 */	beqlr
/* 80012E48 0000EDC8  EC 03 08 28 */	fsubs f0, f3, f1
/* 80012E4C 0000EDCC  D0 23 00 1C */	stfs f1, 0x1c(r3)
/* 80012E50 0000EDD0  EC 00 10 24 */	fdivs f0, f0, f2
/* 80012E54 0000EDD4  D0 03 00 20 */	stfs f0, 0x20(r3)
/* 80012E58 0000EDD8  D0 83 00 24 */	stfs f4, 0x24(r3)
/* 80012E5C 0000EDDC  4E 80 00 20 */	blr

SetDistanceAttenuation_2__7DGLightFfff:
/* 80012E60 0000EDE0  C0 82 81 10 */	lfs f4, lbl_800A9490@sda21(r2)
/* 80012E64 0000EDE4  FC 04 10 00 */	fcmpu cr0, f4, f2
/* 80012E68 0000EDE8  4D 82 00 20 */	beqlr
/* 80012E6C 0000EDEC  EC 63 08 28 */	fsubs f3, f3, f1
/* 80012E70 0000EDF0  D0 23 00 1C */	stfs f1, 0x1c(r3)
/* 80012E74 0000EDF4  EC 02 00 B2 */	fmuls f0, f2, f2
/* 80012E78 0000EDF8  D0 83 00 20 */	stfs f4, 0x20(r3)
/* 80012E7C 0000EDFC  EC 03 00 24 */	fdivs f0, f3, f0
/* 80012E80 0000EE00  D0 03 00 24 */	stfs f0, 0x24(r3)
/* 80012E84 0000EE04  4E 80 00 20 */	blr

SetAngleAttenuation__7DGLightFfff:
/* 80012E88 0000EE08  D0 23 00 28 */	stfs f1, 0x28(r3)
/* 80012E8C 0000EE0C  D0 43 00 2C */	stfs f2, 0x2c(r3)
/* 80012E90 0000EE10  D0 63 00 30 */	stfs f3, 0x30(r3)
/* 80012E94 0000EE14  4E 80 00 20 */	blr

SetAngleAttenuation_Cos__7DGLightFff:
/* 80012E98 0000EE18  7C 08 02 A6 */	mflr r0
/* 80012E9C 0000EE1C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80012EA0 0000EE20  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80012EA4 0000EE24  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 80012EA8 0000EE28  FF E0 10 90 */	fmr f31, f2
/* 80012EAC 0000EE2C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80012EB0 0000EE30  7C 7F 1B 78 */	mr r31, r3
/* 80012EB4 0000EE34  C0 62 81 20 */	lfs f3, lbl_800A94A0@sda21(r2)
/* 80012EB8 0000EE38  C0 02 81 24 */	lfs f0, lbl_800A94A4@sda21(r2)
/* 80012EBC 0000EE3C  EC 23 00 72 */	fmuls f1, f3, f1
/* 80012EC0 0000EE40  EC 21 00 24 */	fdivs f1, f1, f0
/* 80012EC4 0000EE44  48 04 F8 BD */	bl cosf
/* 80012EC8 0000EE48  C0 42 81 14 */	lfs f2, lbl_800A9494@sda21(r2)
/* 80012ECC 0000EE4C  C0 62 81 10 */	lfs f3, lbl_800A9490@sda21(r2)
/* 80012ED0 0000EE50  EC 02 08 28 */	fsubs f0, f2, f1
/* 80012ED4 0000EE54  FC 03 00 00 */	fcmpu cr0, f3, f0
/* 80012ED8 0000EE58  41 82 00 20 */	beq lbl_80012EF8
/* 80012EDC 0000EE5C  EC 02 00 24 */	fdivs f0, f2, f0
/* 80012EE0 0000EE60  EC 3F 00 32 */	fmuls f1, f31, f0
/* 80012EE4 0000EE64  EC 02 00 28 */	fsubs f0, f2, f0
/* 80012EE8 0000EE68  D0 3F 00 2C */	stfs f1, 0x2c(r31)
/* 80012EEC 0000EE6C  EC 1F 00 32 */	fmuls f0, f31, f0
/* 80012EF0 0000EE70  D0 7F 00 30 */	stfs f3, 0x30(r31)
/* 80012EF4 0000EE74  D0 1F 00 28 */	stfs f0, 0x28(r31)
lbl_80012EF8:
/* 80012EF8 0000EE78  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80012EFC 0000EE7C  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 80012F00 0000EE80  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80012F04 0000EE84  7C 08 03 A6 */	mtlr r0
/* 80012F08 0000EE88  38 21 00 28 */	addi r1, r1, 0x28
/* 80012F0C 0000EE8C  4E 80 00 20 */	blr

SetAngleAttenuation_Cos2__7DGLightFff:
/* 80012F10 0000EE90  7C 08 02 A6 */	mflr r0
/* 80012F14 0000EE94  90 01 00 04 */	stw r0, 0x4(r1)
/* 80012F18 0000EE98  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80012F1C 0000EE9C  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 80012F20 0000EEA0  FF E0 10 90 */	fmr f31, f2
/* 80012F24 0000EEA4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80012F28 0000EEA8  7C 7F 1B 78 */	mr r31, r3
/* 80012F2C 0000EEAC  C0 62 81 20 */	lfs f3, lbl_800A94A0@sda21(r2)
/* 80012F30 0000EEB0  C0 02 81 24 */	lfs f0, lbl_800A94A4@sda21(r2)
/* 80012F34 0000EEB4  EC 23 00 72 */	fmuls f1, f3, f1
/* 80012F38 0000EEB8  EC 21 00 24 */	fdivs f1, f1, f0
/* 80012F3C 0000EEBC  48 04 F8 45 */	bl cosf
/* 80012F40 0000EEC0  EC 21 00 72 */	fmuls f1, f1, f1
/* 80012F44 0000EEC4  C0 02 81 14 */	lfs f0, lbl_800A9494@sda21(r2)
/* 80012F48 0000EEC8  C0 42 81 10 */	lfs f2, lbl_800A9490@sda21(r2)
/* 80012F4C 0000EECC  EC 20 08 28 */	fsubs f1, f0, f1
/* 80012F50 0000EED0  FC 02 08 00 */	fcmpu cr0, f2, f1
/* 80012F54 0000EED4  41 82 00 98 */	beq lbl_80012FEC
/* 80012F58 0000EED8  EC A0 08 24 */	fdivs f5, f0, f1
/* 80012F5C 0000EEDC  D0 5F 00 2C */	stfs f2, 0x2c(r31)
/* 80012F60 0000EEE0  EC 9F 01 72 */	fmuls f4, f31, f5
/* 80012F64 0000EEE4  FC 04 10 40 */	fcmpo cr0, f4, f2
/* 80012F68 0000EEE8  40 81 00 70 */	ble lbl_80012FD8
/* 80012F6C 0000EEEC  FC 20 20 34 */	frsqrte f1, f4
/* 80012F70 0000EEF0  C8 62 81 28 */	lfd f3, lbl_800A94A8@sda21(r2)
/* 80012F74 0000EEF4  C8 42 81 30 */	lfd f2, lbl_800A94B0@sda21(r2)
/* 80012F78 0000EEF8  FC 01 00 72 */	fmul f0, f1, f1
/* 80012F7C 0000EEFC  FC 23 00 72 */	fmul f1, f3, f1
/* 80012F80 0000EF00  FC 04 00 32 */	fmul f0, f4, f0
/* 80012F84 0000EF04  FC 02 00 28 */	fsub f0, f2, f0
/* 80012F88 0000EF08  FC 21 00 32 */	fmul f1, f1, f0
/* 80012F8C 0000EF0C  FC 01 00 72 */	fmul f0, f1, f1
/* 80012F90 0000EF10  FC 23 00 72 */	fmul f1, f3, f1
/* 80012F94 0000EF14  FC 04 00 32 */	fmul f0, f4, f0
/* 80012F98 0000EF18  FC 02 00 28 */	fsub f0, f2, f0
/* 80012F9C 0000EF1C  FC 21 00 32 */	fmul f1, f1, f0
/* 80012FA0 0000EF20  FC 01 00 72 */	fmul f0, f1, f1
/* 80012FA4 0000EF24  FC 23 00 72 */	fmul f1, f3, f1
/* 80012FA8 0000EF28  FC 04 00 32 */	fmul f0, f4, f0
/* 80012FAC 0000EF2C  FC 02 00 28 */	fsub f0, f2, f0
/* 80012FB0 0000EF30  FC 21 00 32 */	fmul f1, f1, f0
/* 80012FB4 0000EF34  FC 01 00 72 */	fmul f0, f1, f1
/* 80012FB8 0000EF38  FC 23 00 72 */	fmul f1, f3, f1
/* 80012FBC 0000EF3C  FC 04 00 32 */	fmul f0, f4, f0
/* 80012FC0 0000EF40  FC 02 00 28 */	fsub f0, f2, f0
/* 80012FC4 0000EF44  FC 01 00 32 */	fmul f0, f1, f0
/* 80012FC8 0000EF48  FC 04 00 32 */	fmul f0, f4, f0
/* 80012FCC 0000EF4C  FC 00 00 18 */	frsp f0, f0
/* 80012FD0 0000EF50  D0 01 00 14 */	stfs f0, 0x14(r1)
/* 80012FD4 0000EF54  C0 81 00 14 */	lfs f4, 0x14(r1)
lbl_80012FD8:
/* 80012FD8 0000EF58  D0 9F 00 30 */	stfs f4, 0x30(r31)
/* 80012FDC 0000EF5C  C0 02 81 14 */	lfs f0, lbl_800A9494@sda21(r2)
/* 80012FE0 0000EF60  EC 00 28 28 */	fsubs f0, f0, f5
/* 80012FE4 0000EF64  EC 1F 00 32 */	fmuls f0, f31, f0
/* 80012FE8 0000EF68  D0 1F 00 28 */	stfs f0, 0x28(r31)
lbl_80012FEC:
/* 80012FEC 0000EF6C  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80012FF0 0000EF70  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 80012FF4 0000EF74  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80012FF8 0000EF78  7C 08 03 A6 */	mtlr r0
/* 80012FFC 0000EF7C  38 21 00 28 */	addi r1, r1, 0x28
/* 80013000 0000EF80  4E 80 00 20 */	blr

#sdata2

.global lbl_800A9490
lbl_800A9490:

	# ROM: 0x6A610
	.4byte 0

.global lbl_800A9494
lbl_800A9494:

	# ROM: 0x6A614
	.4byte 0x3F800000

.global lbl_800A9498
lbl_800A9498:

	# ROM: 0x6A618
	.4byte 0x42000000

.global lbl_800A949C
lbl_800A949C:

	# ROM: 0x6A61C
	.4byte 0x3F000000

.global lbl_800A94A0
lbl_800A94A0:

	# ROM: 0x6A620
	.4byte 0x40490FDB

.global lbl_800A94A4
lbl_800A94A4:

	# ROM: 0x6A624
	.4byte 0x43340000

.global lbl_800A94A8
lbl_800A94A8:

	# ROM: 0x6A628
	.4byte 0x3FE00000
	.4byte 0

.global lbl_800A94B0
lbl_800A94B0:

	# ROM: 0x6A630
	.4byte 0x40080000
	.4byte 0
