

.global __num2dec
__num2dec:
/* 8005FAD8 0005BA58  7C 08 02 A6 */	mflr r0
/* 8005FADC 0005BA5C  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005FAE0 0005BA60  94 21 FF 98 */	stwu r1, -0x68(r1)
/* 8005FAE4 0005BA64  DB E1 00 60 */	stfd f31, 0x60(r1)
/* 8005FAE8 0005BA68  FF E0 08 90 */	fmr f31, f1
/* 8005FAEC 0005BA6C  93 E1 00 5C */	stw r31, 0x5c(r1)
/* 8005FAF0 0005BA70  93 C1 00 58 */	stw r30, 0x58(r1)
/* 8005FAF4 0005BA74  3B C4 00 00 */	addi r30, r4, 0x0
/* 8005FAF8 0005BA78  93 A1 00 54 */	stw r29, 0x54(r1)
/* 8005FAFC 0005BA7C  7C 7D 1B 78 */	mr r29, r3
/* 8005FB00 0005BA80  A8 03 00 02 */	lha r0, 0x2(r3)
/* 8005FB04 0005BA84  2C 00 00 10 */	cmpwi r0, 0x10
/* 8005FB08 0005BA88  7C 1F 03 78 */	mr r31, r0
/* 8005FB0C 0005BA8C  40 81 00 08 */	ble .L_8005FB14
/* 8005FB10 0005BA90  3B E0 00 10 */	li r31, 0x10
.L_8005FB14:
/* 8005FB14 0005BA94  38 60 00 00 */	li r3, 0x0
/* 8005FB18 0005BA98  98 7E 00 00 */	stb r3, 0x0(r30)
/* 8005FB1C 0005BA9C  38 00 00 01 */	li r0, 0x1
/* 8005FB20 0005BAA0  B0 7E 00 02 */	sth r3, 0x2(r30)
/* 8005FB24 0005BAA4  98 1E 00 04 */	stb r0, 0x4(r30)
/* 8005FB28 0005BAA8  C8 02 87 78 */	lfd f0, lbl_800A9AF8@sda21(r2)
/* 8005FB2C 0005BAAC  FC 00 F8 00 */	fcmpu cr0, f0, f31
/* 8005FB30 0005BAB0  40 82 00 10 */	bne .L_8005FB40
/* 8005FB34 0005BAB4  38 00 00 30 */	li r0, 0x30
/* 8005FB38 0005BAB8  98 1E 00 05 */	stb r0, 0x5(r30)
/* 8005FB3C 0005BABC  48 00 03 30 */	b .L_8005FE6C
.L_8005FB40:
/* 8005FB40 0005BAC0  DB E1 00 28 */	stfd f31, 0x28(r1)
/* 8005FB44 0005BAC4  3C 00 7F F0 */	lis r0, 0x7ff0
/* 8005FB48 0005BAC8  80 81 00 28 */	lwz r4, 0x28(r1)
/* 8005FB4C 0005BACC  54 83 00 56 */	rlwinm r3, r4, 0, 1, 11
/* 8005FB50 0005BAD0  7C 03 00 00 */	cmpw r3, r0
/* 8005FB54 0005BAD4  41 82 00 14 */	beq .L_8005FB68
/* 8005FB58 0005BAD8  40 80 00 58 */	bge .L_8005FBB0
/* 8005FB5C 0005BADC  2C 03 00 00 */	cmpwi r3, 0x0
/* 8005FB60 0005BAE0  41 82 00 2C */	beq .L_8005FB8C
/* 8005FB64 0005BAE4  48 00 00 4C */	b .L_8005FBB0
.L_8005FB68:
/* 8005FB68 0005BAE8  54 80 03 3F */	clrlwi. r0, r4, 12
/* 8005FB6C 0005BAEC  40 82 00 10 */	bne .L_8005FB7C
/* 8005FB70 0005BAF0  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 8005FB74 0005BAF4  2C 00 00 00 */	cmpwi r0, 0x0
/* 8005FB78 0005BAF8  41 82 00 0C */	beq .L_8005FB84
.L_8005FB7C:
/* 8005FB7C 0005BAFC  38 00 00 01 */	li r0, 0x1
/* 8005FB80 0005BB00  48 00 00 34 */	b .L_8005FBB4
.L_8005FB84:
/* 8005FB84 0005BB04  38 00 00 02 */	li r0, 0x2
/* 8005FB88 0005BB08  48 00 00 2C */	b .L_8005FBB4
.L_8005FB8C:
/* 8005FB8C 0005BB0C  54 80 03 3F */	clrlwi. r0, r4, 12
/* 8005FB90 0005BB10  40 82 00 10 */	bne .L_8005FBA0
/* 8005FB94 0005BB14  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 8005FB98 0005BB18  2C 00 00 00 */	cmpwi r0, 0x0
/* 8005FB9C 0005BB1C  41 82 00 0C */	beq .L_8005FBA8
.L_8005FBA0:
/* 8005FBA0 0005BB20  38 00 00 05 */	li r0, 0x5
/* 8005FBA4 0005BB24  48 00 00 10 */	b .L_8005FBB4
.L_8005FBA8:
/* 8005FBA8 0005BB28  38 00 00 03 */	li r0, 0x3
/* 8005FBAC 0005BB2C  48 00 00 08 */	b .L_8005FBB4
.L_8005FBB0:
/* 8005FBB0 0005BB30  38 00 00 04 */	li r0, 0x4
.L_8005FBB4:
/* 8005FBB4 0005BB34  2C 00 00 02 */	cmpwi r0, 0x2
/* 8005FBB8 0005BB38  41 81 00 94 */	bgt .L_8005FC4C
/* 8005FBBC 0005BB3C  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 8005FBC0 0005BB40  3C 00 7F F0 */	lis r0, 0x7ff0
/* 8005FBC4 0005BB44  80 81 00 20 */	lwz r4, 0x20(r1)
/* 8005FBC8 0005BB48  54 83 00 56 */	rlwinm r3, r4, 0, 1, 11
/* 8005FBCC 0005BB4C  7C 03 00 00 */	cmpw r3, r0
/* 8005FBD0 0005BB50  41 82 00 14 */	beq .L_8005FBE4
/* 8005FBD4 0005BB54  40 80 00 58 */	bge .L_8005FC2C
/* 8005FBD8 0005BB58  2C 03 00 00 */	cmpwi r3, 0x0
/* 8005FBDC 0005BB5C  41 82 00 2C */	beq .L_8005FC08
/* 8005FBE0 0005BB60  48 00 00 4C */	b .L_8005FC2C
.L_8005FBE4:
/* 8005FBE4 0005BB64  54 80 03 3F */	clrlwi. r0, r4, 12
/* 8005FBE8 0005BB68  40 82 00 10 */	bne .L_8005FBF8
/* 8005FBEC 0005BB6C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8005FBF0 0005BB70  2C 00 00 00 */	cmpwi r0, 0x0
/* 8005FBF4 0005BB74  41 82 00 0C */	beq .L_8005FC00
.L_8005FBF8:
/* 8005FBF8 0005BB78  38 00 00 01 */	li r0, 0x1
/* 8005FBFC 0005BB7C  48 00 00 34 */	b .L_8005FC30
.L_8005FC00:
/* 8005FC00 0005BB80  38 00 00 02 */	li r0, 0x2
/* 8005FC04 0005BB84  48 00 00 2C */	b .L_8005FC30
.L_8005FC08:
/* 8005FC08 0005BB88  54 80 03 3F */	clrlwi. r0, r4, 12
/* 8005FC0C 0005BB8C  40 82 00 10 */	bne .L_8005FC1C
/* 8005FC10 0005BB90  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8005FC14 0005BB94  2C 00 00 00 */	cmpwi r0, 0x0
/* 8005FC18 0005BB98  41 82 00 0C */	beq .L_8005FC24
.L_8005FC1C:
/* 8005FC1C 0005BB9C  38 00 00 05 */	li r0, 0x5
/* 8005FC20 0005BBA0  48 00 00 10 */	b .L_8005FC30
.L_8005FC24:
/* 8005FC24 0005BBA4  38 00 00 03 */	li r0, 0x3
/* 8005FC28 0005BBA8  48 00 00 08 */	b .L_8005FC30
.L_8005FC2C:
/* 8005FC2C 0005BBAC  38 00 00 04 */	li r0, 0x4
.L_8005FC30:
/* 8005FC30 0005BBB0  2C 00 00 01 */	cmpwi r0, 0x1
/* 8005FC34 0005BBB4  40 82 00 0C */	bne .L_8005FC40
/* 8005FC38 0005BBB8  38 00 00 4E */	li r0, 0x4e
/* 8005FC3C 0005BBBC  48 00 00 08 */	b .L_8005FC44
.L_8005FC40:
/* 8005FC40 0005BBC0  38 00 00 49 */	li r0, 0x49
.L_8005FC44:
/* 8005FC44 0005BBC4  98 1E 00 05 */	stb r0, 0x5(r30)
/* 8005FC48 0005BBC8  48 00 02 24 */	b .L_8005FE6C
.L_8005FC4C:
/* 8005FC4C 0005BBCC  38 00 00 00 */	li r0, 0x0
/* 8005FC50 0005BBD0  98 1E 00 04 */	stb r0, 0x4(r30)
/* 8005FC54 0005BBD4  C8 02 87 78 */	lfd f0, lbl_800A9AF8@sda21(r2)
/* 8005FC58 0005BBD8  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 8005FC5C 0005BBDC  40 80 00 10 */	bge .L_8005FC6C
/* 8005FC60 0005BBE0  38 00 00 01 */	li r0, 0x1
/* 8005FC64 0005BBE4  FF E0 F8 50 */	fneg f31, f31
/* 8005FC68 0005BBE8  98 1E 00 00 */	stb r0, 0x0(r30)
.L_8005FC6C:
/* 8005FC6C 0005BBEC  FC 20 F8 90 */	fmr f1, f31
/* 8005FC70 0005BBF0  38 61 00 30 */	addi r3, r1, 0x30
/* 8005FC74 0005BBF4  48 00 27 9D */	bl frexp
/* 8005FC78 0005BBF8  3C 60 00 05 */	lis r3, 0x5
/* 8005FC7C 0005BBFC  80 81 00 30 */	lwz r4, 0x30(r1)
/* 8005FC80 0005BC00  38 03 97 E5 */	addi r0, r3, -0x681b
/* 8005FC84 0005BC04  7C 04 01 D6 */	mullw r0, r4, r0
/* 8005FC88 0005BC08  3C 60 43 1C */	lis r3, 0x431c
/* 8005FC8C 0005BC0C  38 63 DE 83 */	addi r3, r3, -0x217d
/* 8005FC90 0005BC10  7C 03 00 96 */	mulhw r0, r3, r0
/* 8005FC94 0005BC14  7C 00 96 70 */	srawi r0, r0, 18
/* 8005FC98 0005BC18  54 03 0F FE */	srwi r3, r0, 31
/* 8005FC9C 0005BC1C  7C 80 1A 15 */	add. r4, r0, r3
/* 8005FCA0 0005BC20  3C 60 80 06 */	lis r3, bit_values@ha
/* 8005FCA4 0005BC24  38 03 48 08 */	addi r0, r3, bit_values@l
/* 8005FCA8 0005BC28  38 64 00 00 */	addi r3, r4, 0x0
/* 8005FCAC 0005BC2C  7C 05 03 78 */	mr r5, r0
/* 8005FCB0 0005BC30  40 80 00 30 */	bge .L_8005FCE0
/* 8005FCB4 0005BC34  7C 84 00 D0 */	neg r4, r4
/* 8005FCB8 0005BC38  48 00 00 1C */	b .L_8005FCD4
.L_8005FCBC:
/* 8005FCBC 0005BC3C  54 80 07 FF */	clrlwi. r0, r4, 31
/* 8005FCC0 0005BC40  41 82 00 0C */	beq .L_8005FCCC
/* 8005FCC4 0005BC44  C8 05 00 00 */	lfd f0, 0x0(r5)
/* 8005FCC8 0005BC48  FF FF 00 32 */	fmul f31, f31, f0
.L_8005FCCC:
/* 8005FCCC 0005BC4C  7C 84 0E 70 */	srawi r4, r4, 1
/* 8005FCD0 0005BC50  38 A5 00 08 */	addi r5, r5, 0x8
.L_8005FCD4:
/* 8005FCD4 0005BC54  2C 04 00 00 */	cmpwi r4, 0x0
/* 8005FCD8 0005BC58  40 82 FF E4 */	bne .L_8005FCBC
/* 8005FCDC 0005BC5C  48 00 00 34 */	b .L_8005FD10
.L_8005FCE0:
/* 8005FCE0 0005BC60  40 81 00 30 */	ble .L_8005FD10
/* 8005FCE4 0005BC64  C8 22 87 80 */	lfd f1, lbl_800A9B00@sda21(r2)
/* 8005FCE8 0005BC68  48 00 00 1C */	b .L_8005FD04
.L_8005FCEC:
/* 8005FCEC 0005BC6C  54 80 07 FF */	clrlwi. r0, r4, 31
/* 8005FCF0 0005BC70  41 82 00 0C */	beq .L_8005FCFC
/* 8005FCF4 0005BC74  C8 05 00 00 */	lfd f0, 0x0(r5)
/* 8005FCF8 0005BC78  FC 21 00 32 */	fmul f1, f1, f0
.L_8005FCFC:
/* 8005FCFC 0005BC7C  7C 84 0E 70 */	srawi r4, r4, 1
/* 8005FD00 0005BC80  38 A5 00 08 */	addi r5, r5, 0x8
.L_8005FD04:
/* 8005FD04 0005BC84  2C 04 00 00 */	cmpwi r4, 0x0
/* 8005FD08 0005BC88  40 82 FF E4 */	bne .L_8005FCEC
/* 8005FD0C 0005BC8C  FF FF 08 24 */	fdiv f31, f31, f1
.L_8005FD10:
/* 8005FD10 0005BC90  C8 22 87 90 */	lfd f1, lbl_800A9B10@sda21(r2)
/* 8005FD14 0005BC94  C8 02 87 80 */	lfd f0, lbl_800A9B00@sda21(r2)
/* 8005FD18 0005BC98  48 00 00 0C */	b .L_8005FD24
.L_8005FD1C:
/* 8005FD1C 0005BC9C  FF FF 00 72 */	fmul f31, f31, f1
/* 8005FD20 0005BCA0  38 63 00 01 */	addi r3, r3, 0x1
.L_8005FD24:
/* 8005FD24 0005BCA4  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 8005FD28 0005BCA8  4C 41 13 82 */	cror eq, gt, eq
/* 8005FD2C 0005BCAC  41 82 FF F0 */	beq .L_8005FD1C
/* 8005FD30 0005BCB0  C8 22 87 98 */	lfd f1, lbl_800A9B18@sda21(r2)
/* 8005FD34 0005BCB4  C8 02 87 90 */	lfd f0, lbl_800A9B10@sda21(r2)
/* 8005FD38 0005BCB8  48 00 00 0C */	b .L_8005FD44
.L_8005FD3C:
/* 8005FD3C 0005BCBC  FF FF 00 72 */	fmul f31, f31, f1
/* 8005FD40 0005BCC0  38 63 FF FF */	addi r3, r3, -0x1
.L_8005FD44:
/* 8005FD44 0005BCC4  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 8005FD48 0005BCC8  41 80 FF F4 */	blt .L_8005FD3C
/* 8005FD4C 0005BCCC  3C A0 66 66 */	lis r5, 0x6666
/* 8005FD50 0005BCD0  C8 22 87 88 */	lfd f1, lbl_800A9B08@sda21(r2)
/* 8005FD54 0005BCD4  3C C0 80 06 */	lis r6, digit_values@ha
/* 8005FD58 0005BCD8  38 9E 00 05 */	addi r4, r30, 0x5
/* 8005FD5C 0005BCDC  38 E5 66 67 */	addi r7, r5, 0x6667
/* 8005FD60 0005BCE0  39 46 48 50 */	addi r10, r6, digit_values@l
/* 8005FD64 0005BCE4  3D 20 43 30 */	lis r9, 0x4330
/* 8005FD68 0005BCE8  48 00 00 AC */	b .L_8005FE14
.L_8005FD6C:
/* 8005FD6C 0005BCEC  2C 1F 00 08 */	cmpwi r31, 0x8
/* 8005FD70 0005BCF0  39 9F 00 00 */	addi r12, r31, 0x0
/* 8005FD74 0005BCF4  40 81 00 08 */	ble .L_8005FD7C
/* 8005FD78 0005BCF8  39 80 00 08 */	li r12, 0x8
.L_8005FD7C:
/* 8005FD7C 0005BCFC  88 DE 00 04 */	lbz r6, 0x4(r30)
/* 8005FD80 0005BD00  55 80 18 38 */	slwi r0, r12, 3
/* 8005FD84 0005BD04  7C AA 02 14 */	add r5, r10, r0
/* 8005FD88 0005BD08  7C 06 62 14 */	add r0, r6, r12
/* 8005FD8C 0005BD0C  98 1E 00 04 */	stb r0, 0x4(r30)
/* 8005FD90 0005BD10  7F EC F8 50 */	subf r31, r12, r31
/* 8005FD94 0005BD14  7C 6C 18 50 */	subf r3, r12, r3
/* 8005FD98 0005BD18  C8 05 FF F8 */	lfd f0, -0x8(r5)
/* 8005FD9C 0005BD1C  7C 84 62 14 */	add r4, r4, r12
/* 8005FDA0 0005BD20  39 6C 00 01 */	addi r11, r12, 0x1
/* 8005FDA4 0005BD24  FF FF 00 32 */	fmul f31, f31, f0
/* 8005FDA8 0005BD28  FC 00 F8 1E */	fctiwz f0, f31
/* 8005FDAC 0005BD2C  D8 01 00 40 */	stfd f0, 0x40(r1)
/* 8005FDB0 0005BD30  80 01 00 44 */	lwz r0, 0x44(r1)
/* 8005FDB4 0005BD34  D8 01 00 48 */	stfd f0, 0x48(r1)
/* 8005FDB8 0005BD38  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 8005FDBC 0005BD3C  90 01 00 3C */	stw r0, 0x3c(r1)
/* 8005FDC0 0005BD40  80 C1 00 4C */	lwz r6, 0x4c(r1)
/* 8005FDC4 0005BD44  91 21 00 38 */	stw r9, 0x38(r1)
/* 8005FDC8 0005BD48  C8 01 00 38 */	lfd f0, 0x38(r1)
/* 8005FDCC 0005BD4C  FC 00 08 28 */	fsub f0, f0, f1
/* 8005FDD0 0005BD50  FF FF 00 28 */	fsub f31, f31, f0
/* 8005FDD4 0005BD54  48 00 00 34 */	b .L_8005FE08
.L_8005FDD8:
/* 8005FDD8 0005BD58  7D 07 30 96 */	mulhw r8, r7, r6
/* 8005FDDC 0005BD5C  7D 00 16 70 */	srawi r0, r8, 2
/* 8005FDE0 0005BD60  54 05 0F FE */	srwi r5, r0, 31
/* 8005FDE4 0005BD64  7C 00 2A 14 */	add r0, r0, r5
/* 8005FDE8 0005BD68  1C 00 00 0A */	mulli r0, r0, 0xa
/* 8005FDEC 0005BD6C  7C C0 30 50 */	subf r6, r0, r6
/* 8005FDF0 0005BD70  7D 00 16 70 */	srawi r0, r8, 2
/* 8005FDF4 0005BD74  38 C6 00 30 */	addi r6, r6, 0x30
/* 8005FDF8 0005BD78  98 C4 FF FF */	stb r6, -0x1(r4)
/* 8005FDFC 0005BD7C  54 05 0F FE */	srwi r5, r0, 31
/* 8005FE00 0005BD80  7C C0 2A 14 */	add r6, r0, r5
/* 8005FE04 0005BD84  38 84 FF FF */	addi r4, r4, -0x1
.L_8005FE08:
/* 8005FE08 0005BD88  35 6B FF FF */	addic. r11, r11, -0x1
/* 8005FE0C 0005BD8C  40 82 FF CC */	bne .L_8005FDD8
/* 8005FE10 0005BD90  7C 84 62 14 */	add r4, r4, r12
.L_8005FE14:
/* 8005FE14 0005BD94  2C 1F 00 00 */	cmpwi r31, 0x0
/* 8005FE18 0005BD98  40 82 FF 54 */	bne .L_8005FD6C
/* 8005FE1C 0005BD9C  A8 BD 00 02 */	lha r5, 0x2(r29)
/* 8005FE20 0005BDA0  2C 05 00 24 */	cmpwi r5, 0x24
/* 8005FE24 0005BDA4  40 81 00 08 */	ble .L_8005FE2C
/* 8005FE28 0005BDA8  38 A0 00 24 */	li r5, 0x24
.L_8005FE2C:
/* 8005FE2C 0005BDAC  88 1E 00 04 */	lbz r0, 0x4(r30)
/* 8005FE30 0005BDB0  7C A0 28 51 */	subf. r5, r0, r5
/* 8005FE34 0005BDB4  40 81 00 30 */	ble .L_8005FE64
/* 8005FE38 0005BDB8  38 C5 00 01 */	addi r6, r5, 0x1
/* 8005FE3C 0005BDBC  38 00 00 30 */	li r0, 0x30
/* 8005FE40 0005BDC0  48 00 00 0C */	b .L_8005FE4C
.L_8005FE44:
/* 8005FE44 0005BDC4  98 04 00 00 */	stb r0, 0x0(r4)
/* 8005FE48 0005BDC8  38 84 00 01 */	addi r4, r4, 0x1
.L_8005FE4C:
/* 8005FE4C 0005BDCC  34 C6 FF FF */	addic. r6, r6, -0x1
/* 8005FE50 0005BDD0  40 82 FF F4 */	bne .L_8005FE44
/* 8005FE54 0005BDD4  88 1E 00 04 */	lbz r0, 0x4(r30)
/* 8005FE58 0005BDD8  7C 65 18 50 */	subf r3, r5, r3
/* 8005FE5C 0005BDDC  7C 00 2A 14 */	add r0, r0, r5
/* 8005FE60 0005BDE0  98 1E 00 04 */	stb r0, 0x4(r30)
.L_8005FE64:
/* 8005FE64 0005BDE4  7C 60 07 34 */	extsh r0, r3
/* 8005FE68 0005BDE8  B0 1E 00 02 */	sth r0, 0x2(r30)
.L_8005FE6C:
/* 8005FE6C 0005BDEC  80 01 00 6C */	lwz r0, 0x6c(r1)
/* 8005FE70 0005BDF0  CB E1 00 60 */	lfd f31, 0x60(r1)
/* 8005FE74 0005BDF4  83 E1 00 5C */	lwz r31, 0x5c(r1)
/* 8005FE78 0005BDF8  7C 08 03 A6 */	mtlr r0
/* 8005FE7C 0005BDFC  83 C1 00 58 */	lwz r30, 0x58(r1)
/* 8005FE80 0005BE00  83 A1 00 54 */	lwz r29, 0x54(r1)
/* 8005FE84 0005BE04  38 21 00 68 */	addi r1, r1, 0x68
/* 8005FE88 0005BE08  4E 80 00 20 */	blr