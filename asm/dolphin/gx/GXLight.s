.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn GXInitLightAttn, global
/* 8003DC38 00039BB8  D0 23 00 10 */	stfs f1, 0x10(r3)
/* 8003DC3C 00039BBC  D0 43 00 14 */	stfs f2, 0x14(r3)
/* 8003DC40 00039BC0  D0 63 00 18 */	stfs f3, 0x18(r3)
/* 8003DC44 00039BC4  D0 83 00 1C */	stfs f4, 0x1c(r3)
/* 8003DC48 00039BC8  D0 A3 00 20 */	stfs f5, 0x20(r3)
/* 8003DC4C 00039BCC  D0 C3 00 24 */	stfs f6, 0x24(r3)
/* 8003DC50 00039BD0  4E 80 00 20 */	blr
.endfn GXInitLightAttn

.fn GXInitLightPos, global
/* 8003DC54 00039BD4  D0 23 00 28 */	stfs f1, 0x28(r3)
/* 8003DC58 00039BD8  D0 43 00 2C */	stfs f2, 0x2c(r3)
/* 8003DC5C 00039BDC  D0 63 00 30 */	stfs f3, 0x30(r3)
/* 8003DC60 00039BE0  4E 80 00 20 */	blr
.endfn GXInitLightPos

.fn GXInitLightDir, global
/* 8003DC64 00039BE4  FC 80 08 50 */	fneg f4, f1
/* 8003DC68 00039BE8  FC 20 10 50 */	fneg f1, f2
/* 8003DC6C 00039BEC  FC 00 18 50 */	fneg f0, f3
/* 8003DC70 00039BF0  D0 83 00 34 */	stfs f4, 0x34(r3)
/* 8003DC74 00039BF4  D0 23 00 38 */	stfs f1, 0x38(r3)
/* 8003DC78 00039BF8  D0 03 00 3C */	stfs f0, 0x3c(r3)
/* 8003DC7C 00039BFC  4E 80 00 20 */	blr
.endfn GXInitLightDir

.fn GXInitSpecularDir, global
/* 8003DC80 00039C00  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8003DC84 00039C04  FC 00 08 50 */	fneg f0, f1
/* 8003DC88 00039C08  FC 20 10 50 */	fneg f1, f2
/* 8003DC8C 00039C0C  C0 A2 85 44 */	lfs f5, lbl_800A98C4@sda21(r2)
/* 8003DC90 00039C10  EC C0 00 32 */	fmuls f6, f0, f0
/* 8003DC94 00039C14  C0 82 85 40 */	lfs f4, lbl_800A98C0@sda21(r2)
/* 8003DC98 00039C18  EC 45 18 28 */	fsubs f2, f5, f3
/* 8003DC9C 00039C1C  EC A1 00 72 */	fmuls f5, f1, f1
/* 8003DCA0 00039C20  EC E2 00 B2 */	fmuls f7, f2, f2
/* 8003DCA4 00039C24  EC A6 28 2A */	fadds f5, f6, f5
/* 8003DCA8 00039C28  ED 07 28 2A */	fadds f8, f7, f5
/* 8003DCAC 00039C2C  FC 08 20 40 */	fcmpo cr0, f8, f4
/* 8003DCB0 00039C30  40 81 00 5C */	ble .L_8003DD0C
/* 8003DCB4 00039C34  FC A0 40 34 */	frsqrte f5, f8
/* 8003DCB8 00039C38  C8 E2 85 48 */	lfd f7, lbl_800A98C8@sda21(r2)
/* 8003DCBC 00039C3C  C8 C2 85 50 */	lfd f6, lbl_800A98D0@sda21(r2)
/* 8003DCC0 00039C40  FC 85 01 72 */	fmul f4, f5, f5
/* 8003DCC4 00039C44  FC A7 01 72 */	fmul f5, f7, f5
/* 8003DCC8 00039C48  FC 88 01 32 */	fmul f4, f8, f4
/* 8003DCCC 00039C4C  FC 86 20 28 */	fsub f4, f6, f4
/* 8003DCD0 00039C50  FC A5 01 32 */	fmul f5, f5, f4
/* 8003DCD4 00039C54  FC 85 01 72 */	fmul f4, f5, f5
/* 8003DCD8 00039C58  FC A7 01 72 */	fmul f5, f7, f5
/* 8003DCDC 00039C5C  FC 88 01 32 */	fmul f4, f8, f4
/* 8003DCE0 00039C60  FC 86 20 28 */	fsub f4, f6, f4
/* 8003DCE4 00039C64  FC A5 01 32 */	fmul f5, f5, f4
/* 8003DCE8 00039C68  FC 85 01 72 */	fmul f4, f5, f5
/* 8003DCEC 00039C6C  FC A7 01 72 */	fmul f5, f7, f5
/* 8003DCF0 00039C70  FC 88 01 32 */	fmul f4, f8, f4
/* 8003DCF4 00039C74  FC 86 20 28 */	fsub f4, f6, f4
/* 8003DCF8 00039C78  FC 85 01 32 */	fmul f4, f5, f4
/* 8003DCFC 00039C7C  FC 88 01 32 */	fmul f4, f8, f4
/* 8003DD00 00039C80  FC 80 20 18 */	frsp f4, f4
/* 8003DD04 00039C84  D0 81 00 18 */	stfs f4, 0x18(r1)
/* 8003DD08 00039C88  C1 01 00 18 */	lfs f8, 0x18(r1)
.L_8003DD0C:
/* 8003DD0C 00039C8C  C0 82 85 44 */	lfs f4, lbl_800A98C4@sda21(r2)
/* 8003DD10 00039C90  FC 60 18 50 */	fneg f3, f3
/* 8003DD14 00039C94  EC C4 40 24 */	fdivs f6, f4, f8
/* 8003DD18 00039C98  EC A0 01 B2 */	fmuls f5, f0, f6
/* 8003DD1C 00039C9C  EC 81 01 B2 */	fmuls f4, f1, f6
/* 8003DD20 00039CA0  EC 42 01 B2 */	fmuls f2, f2, f6
/* 8003DD24 00039CA4  D0 A3 00 34 */	stfs f5, 0x34(r3)
/* 8003DD28 00039CA8  D0 83 00 38 */	stfs f4, 0x38(r3)
/* 8003DD2C 00039CAC  D0 43 00 3C */	stfs f2, 0x3c(r3)
/* 8003DD30 00039CB0  C0 82 85 58 */	lfs f4, lbl_800A98D8@sda21(r2)
/* 8003DD34 00039CB4  EC 44 00 32 */	fmuls f2, f4, f0
/* 8003DD38 00039CB8  EC 24 00 72 */	fmuls f1, f4, f1
/* 8003DD3C 00039CBC  EC 04 00 F2 */	fmuls f0, f4, f3
/* 8003DD40 00039CC0  D0 43 00 28 */	stfs f2, 0x28(r3)
/* 8003DD44 00039CC4  D0 23 00 2C */	stfs f1, 0x2c(r3)
/* 8003DD48 00039CC8  D0 03 00 30 */	stfs f0, 0x30(r3)
/* 8003DD4C 00039CCC  38 21 00 20 */	addi r1, r1, 0x20
/* 8003DD50 00039CD0  4E 80 00 20 */	blr
.endfn GXInitSpecularDir

.fn GXInitLightColor, global
/* 8003DD54 00039CD4  88 04 00 01 */	lbz r0, 0x1(r4)
/* 8003DD58 00039CD8  88 A4 00 00 */	lbz r5, 0x0(r4)
/* 8003DD5C 00039CDC  88 C4 00 02 */	lbz r6, 0x2(r4)
/* 8003DD60 00039CE0  54 00 80 1E */	slwi r0, r0, 16
/* 8003DD64 00039CE4  50 A0 C0 0E */	rlwimi r0, r5, 24, 0, 7
/* 8003DD68 00039CE8  88 84 00 03 */	lbz r4, 0x3(r4)
/* 8003DD6C 00039CEC  50 C0 44 2E */	rlwimi r0, r6, 8, 16, 23
/* 8003DD70 00039CF0  7C 80 03 78 */	or r0, r4, r0
/* 8003DD74 00039CF4  90 03 00 0C */	stw r0, 0xc(r3)
/* 8003DD78 00039CF8  4E 80 00 20 */	blr
.endfn GXInitLightColor

.fn GXLoadLightObjImm, global
/* 8003DD7C 00039CFC  2C 04 00 10 */	cmpwi r4, 0x10
/* 8003DD80 00039D00  41 82 00 7C */	beq .L_8003DDFC
/* 8003DD84 00039D04  40 80 00 34 */	bge .L_8003DDB8
/* 8003DD88 00039D08  2C 04 00 04 */	cmpwi r4, 0x4
/* 8003DD8C 00039D0C  41 82 00 60 */	beq .L_8003DDEC
/* 8003DD90 00039D10  40 80 00 1C */	bge .L_8003DDAC
/* 8003DD94 00039D14  2C 04 00 02 */	cmpwi r4, 0x2
/* 8003DD98 00039D18  41 82 00 4C */	beq .L_8003DDE4
/* 8003DD9C 00039D1C  40 80 00 80 */	bge .L_8003DE1C
/* 8003DDA0 00039D20  2C 04 00 01 */	cmpwi r4, 0x1
/* 8003DDA4 00039D24  40 80 00 38 */	bge .L_8003DDDC
/* 8003DDA8 00039D28  48 00 00 74 */	b .L_8003DE1C
.L_8003DDAC:
/* 8003DDAC 00039D2C  2C 04 00 08 */	cmpwi r4, 0x8
/* 8003DDB0 00039D30  41 82 00 44 */	beq .L_8003DDF4
/* 8003DDB4 00039D34  48 00 00 68 */	b .L_8003DE1C
.L_8003DDB8:
/* 8003DDB8 00039D38  2C 04 00 40 */	cmpwi r4, 0x40
/* 8003DDBC 00039D3C  41 82 00 50 */	beq .L_8003DE0C
/* 8003DDC0 00039D40  40 80 00 10 */	bge .L_8003DDD0
/* 8003DDC4 00039D44  2C 04 00 20 */	cmpwi r4, 0x20
/* 8003DDC8 00039D48  41 82 00 3C */	beq .L_8003DE04
/* 8003DDCC 00039D4C  48 00 00 50 */	b .L_8003DE1C
.L_8003DDD0:
/* 8003DDD0 00039D50  2C 04 00 80 */	cmpwi r4, 0x80
/* 8003DDD4 00039D54  41 82 00 40 */	beq .L_8003DE14
/* 8003DDD8 00039D58  48 00 00 44 */	b .L_8003DE1C
.L_8003DDDC:
/* 8003DDDC 00039D5C  38 00 00 00 */	li r0, 0x0
/* 8003DDE0 00039D60  48 00 00 40 */	b .L_8003DE20
.L_8003DDE4:
/* 8003DDE4 00039D64  38 00 00 01 */	li r0, 0x1
/* 8003DDE8 00039D68  48 00 00 38 */	b .L_8003DE20
.L_8003DDEC:
/* 8003DDEC 00039D6C  38 00 00 02 */	li r0, 0x2
/* 8003DDF0 00039D70  48 00 00 30 */	b .L_8003DE20
.L_8003DDF4:
/* 8003DDF4 00039D74  38 00 00 03 */	li r0, 0x3
/* 8003DDF8 00039D78  48 00 00 28 */	b .L_8003DE20
.L_8003DDFC:
/* 8003DDFC 00039D7C  38 00 00 04 */	li r0, 0x4
/* 8003DE00 00039D80  48 00 00 20 */	b .L_8003DE20
.L_8003DE04:
/* 8003DE04 00039D84  38 00 00 05 */	li r0, 0x5
/* 8003DE08 00039D88  48 00 00 18 */	b .L_8003DE20
.L_8003DE0C:
/* 8003DE0C 00039D8C  38 00 00 06 */	li r0, 0x6
/* 8003DE10 00039D90  48 00 00 10 */	b .L_8003DE20
.L_8003DE14:
/* 8003DE14 00039D94  38 00 00 07 */	li r0, 0x7
/* 8003DE18 00039D98  48 00 00 08 */	b .L_8003DE20
.L_8003DE1C:
/* 8003DE1C 00039D9C  38 00 00 00 */	li r0, 0x0
.L_8003DE20:
/* 8003DE20 00039DA0  54 05 20 36 */	slwi r5, r0, 4
/* 8003DE24 00039DA4  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003DE28 00039DA8  38 05 06 00 */	addi r0, r5, 0x600
/* 8003DE2C 00039DAC  38 A0 00 10 */	li r5, 0x10
/* 8003DE30 00039DB0  3C C0 CC 01 */	lis r6, 0xCC008000@ha
/* 8003DE34 00039DB4  98 A6 80 00 */	stb r5, 0xCC008000@l(r6)
/* 8003DE38 00039DB8  64 00 00 0F */	oris r0, r0, 0xf
/* 8003DE3C 00039DBC  38 A0 00 00 */	li r5, 0x0
/* 8003DE40 00039DC0  90 06 80 00 */	stw r0, -0x8000(r6)
/* 8003DE44 00039DC4  38 00 00 01 */	li r0, 0x1
/* 8003DE48 00039DC8  90 A6 80 00 */	stw r5, -0x8000(r6)
/* 8003DE4C 00039DCC  90 A6 80 00 */	stw r5, -0x8000(r6)
/* 8003DE50 00039DD0  90 A6 80 00 */	stw r5, -0x8000(r6)
/* 8003DE54 00039DD4  80 A3 00 0C */	lwz r5, 0xc(r3)
/* 8003DE58 00039DD8  90 A6 80 00 */	stw r5, -0x8000(r6)
/* 8003DE5C 00039DDC  C0 03 00 10 */	lfs f0, 0x10(r3)
/* 8003DE60 00039DE0  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8003DE64 00039DE4  C0 03 00 14 */	lfs f0, 0x14(r3)
/* 8003DE68 00039DE8  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8003DE6C 00039DEC  C0 03 00 18 */	lfs f0, 0x18(r3)
/* 8003DE70 00039DF0  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8003DE74 00039DF4  C0 03 00 1C */	lfs f0, 0x1c(r3)
/* 8003DE78 00039DF8  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8003DE7C 00039DFC  C0 03 00 20 */	lfs f0, 0x20(r3)
/* 8003DE80 00039E00  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8003DE84 00039E04  C0 03 00 24 */	lfs f0, 0x24(r3)
/* 8003DE88 00039E08  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8003DE8C 00039E0C  C0 03 00 28 */	lfs f0, 0x28(r3)
/* 8003DE90 00039E10  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8003DE94 00039E14  C0 03 00 2C */	lfs f0, 0x2c(r3)
/* 8003DE98 00039E18  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8003DE9C 00039E1C  C0 03 00 30 */	lfs f0, 0x30(r3)
/* 8003DEA0 00039E20  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8003DEA4 00039E24  C0 03 00 34 */	lfs f0, 0x34(r3)
/* 8003DEA8 00039E28  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8003DEAC 00039E2C  C0 03 00 38 */	lfs f0, 0x38(r3)
/* 8003DEB0 00039E30  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8003DEB4 00039E34  C0 03 00 3C */	lfs f0, 0x3c(r3)
/* 8003DEB8 00039E38  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8003DEBC 00039E3C  B0 04 00 02 */	sth r0, 0x2(r4)
/* 8003DEC0 00039E40  4E 80 00 20 */	blr
.endfn GXLoadLightObjImm

.fn GXSetChanAmbColor, global
/* 8003DEC4 00039E44  2C 03 00 03 */	cmpwi r3, 0x3
/* 8003DEC8 00039E48  41 82 00 B0 */	beq .L_8003DF78
/* 8003DECC 00039E4C  40 80 00 1C */	bge .L_8003DEE8
/* 8003DED0 00039E50  2C 03 00 01 */	cmpwi r3, 0x1
/* 8003DED4 00039E54  41 82 00 58 */	beq .L_8003DF2C
/* 8003DED8 00039E58  40 80 00 88 */	bge .L_8003DF60
/* 8003DEDC 00039E5C  2C 03 00 00 */	cmpwi r3, 0x0
/* 8003DEE0 00039E60  40 80 00 18 */	bge .L_8003DEF8
/* 8003DEE4 00039E64  4E 80 00 20 */	blr
.L_8003DEE8:
/* 8003DEE8 00039E68  2C 03 00 05 */	cmpwi r3, 0x5
/* 8003DEEC 00039E6C  41 82 00 D4 */	beq .L_8003DFC0
/* 8003DEF0 00039E70  4C 80 00 20 */	bgelr
/* 8003DEF4 00039E74  48 00 00 9C */	b .L_8003DF90
.L_8003DEF8:
/* 8003DEF8 00039E78  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 8003DEFC 00039E7C  38 60 00 00 */	li r3, 0x0
/* 8003DF00 00039E80  88 C4 00 02 */	lbz r6, 0x2(r4)
/* 8003DF04 00039E84  80 E5 00 A8 */	lwz r7, 0xa8(r5)
/* 8003DF08 00039E88  88 A4 00 01 */	lbz r5, 0x1(r4)
/* 8003DF0C 00039E8C  88 04 00 00 */	lbz r0, 0x0(r4)
/* 8003DF10 00039E90  54 E7 06 3E */	clrlwi r7, r7, 24
/* 8003DF14 00039E94  50 C7 44 2E */	rlwimi r7, r6, 8, 16, 23
/* 8003DF18 00039E98  54 A4 80 1E */	slwi r4, r5, 16
/* 8003DF1C 00039E9C  50 E4 04 3E */	rlwimi r4, r7, 0, 16, 31
/* 8003DF20 00039EA0  54 07 C0 0E */	slwi r7, r0, 24
/* 8003DF24 00039EA4  50 87 02 3E */	rlwimi r7, r4, 0, 8, 31
/* 8003DF28 00039EA8  48 00 00 CC */	b .L_8003DFF4
.L_8003DF2C:
/* 8003DF2C 00039EAC  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 8003DF30 00039EB0  38 60 00 01 */	li r3, 0x1
/* 8003DF34 00039EB4  88 C4 00 02 */	lbz r6, 0x2(r4)
/* 8003DF38 00039EB8  80 E5 00 AC */	lwz r7, 0xac(r5)
/* 8003DF3C 00039EBC  88 A4 00 01 */	lbz r5, 0x1(r4)
/* 8003DF40 00039EC0  88 04 00 00 */	lbz r0, 0x0(r4)
/* 8003DF44 00039EC4  54 E7 06 3E */	clrlwi r7, r7, 24
/* 8003DF48 00039EC8  50 C7 44 2E */	rlwimi r7, r6, 8, 16, 23
/* 8003DF4C 00039ECC  54 A4 80 1E */	slwi r4, r5, 16
/* 8003DF50 00039ED0  50 E4 04 3E */	rlwimi r4, r7, 0, 16, 31
/* 8003DF54 00039ED4  54 07 C0 0E */	slwi r7, r0, 24
/* 8003DF58 00039ED8  50 87 02 3E */	rlwimi r7, r4, 0, 8, 31
/* 8003DF5C 00039EDC  48 00 00 98 */	b .L_8003DFF4
.L_8003DF60:
/* 8003DF60 00039EE0  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 8003DF64 00039EE4  38 60 00 00 */	li r3, 0x0
/* 8003DF68 00039EE8  88 E4 00 03 */	lbz r7, 0x3(r4)
/* 8003DF6C 00039EEC  80 05 00 A8 */	lwz r0, 0xa8(r5)
/* 8003DF70 00039EF0  50 07 00 2E */	rlwimi r7, r0, 0, 0, 23
/* 8003DF74 00039EF4  48 00 00 80 */	b .L_8003DFF4
.L_8003DF78:
/* 8003DF78 00039EF8  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 8003DF7C 00039EFC  38 60 00 01 */	li r3, 0x1
/* 8003DF80 00039F00  88 E4 00 03 */	lbz r7, 0x3(r4)
/* 8003DF84 00039F04  80 05 00 AC */	lwz r0, 0xac(r5)
/* 8003DF88 00039F08  50 07 00 2E */	rlwimi r7, r0, 0, 0, 23
/* 8003DF8C 00039F0C  48 00 00 68 */	b .L_8003DFF4
.L_8003DF90:
/* 8003DF90 00039F10  88 04 00 02 */	lbz r0, 0x2(r4)
/* 8003DF94 00039F14  38 60 00 00 */	li r3, 0x0
/* 8003DF98 00039F18  88 E4 00 03 */	lbz r7, 0x3(r4)
/* 8003DF9C 00039F1C  54 06 40 2E */	slwi r6, r0, 8
/* 8003DFA0 00039F20  88 A4 00 01 */	lbz r5, 0x1(r4)
/* 8003DFA4 00039F24  88 04 00 00 */	lbz r0, 0x0(r4)
/* 8003DFA8 00039F28  50 E6 06 3E */	rlwimi r6, r7, 0, 24, 31
/* 8003DFAC 00039F2C  54 A4 80 1E */	slwi r4, r5, 16
/* 8003DFB0 00039F30  50 C4 04 3E */	rlwimi r4, r6, 0, 16, 31
/* 8003DFB4 00039F34  54 07 C0 0E */	slwi r7, r0, 24
/* 8003DFB8 00039F38  50 87 02 3E */	rlwimi r7, r4, 0, 8, 31
/* 8003DFBC 00039F3C  48 00 00 38 */	b .L_8003DFF4
.L_8003DFC0:
/* 8003DFC0 00039F40  88 04 00 02 */	lbz r0, 0x2(r4)
/* 8003DFC4 00039F44  38 60 00 01 */	li r3, 0x1
/* 8003DFC8 00039F48  88 E4 00 03 */	lbz r7, 0x3(r4)
/* 8003DFCC 00039F4C  54 06 40 2E */	slwi r6, r0, 8
/* 8003DFD0 00039F50  88 A4 00 01 */	lbz r5, 0x1(r4)
/* 8003DFD4 00039F54  88 04 00 00 */	lbz r0, 0x0(r4)
/* 8003DFD8 00039F58  50 E6 06 3E */	rlwimi r6, r7, 0, 24, 31
/* 8003DFDC 00039F5C  54 A4 80 1E */	slwi r4, r5, 16
/* 8003DFE0 00039F60  50 C4 04 3E */	rlwimi r4, r6, 0, 16, 31
/* 8003DFE4 00039F64  54 07 C0 0E */	slwi r7, r0, 24
/* 8003DFE8 00039F68  50 87 02 3E */	rlwimi r7, r4, 0, 8, 31
/* 8003DFEC 00039F6C  48 00 00 08 */	b .L_8003DFF4
/* 8003DFF0 00039F70  4E 80 00 20 */	blr
.L_8003DFF4:
/* 8003DFF4 00039F74  38 00 00 10 */	li r0, 0x10
/* 8003DFF8 00039F78  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003DFFC 00039F7C  3C C0 CC 01 */	lis r6, 0xCC008000@ha
/* 8003E000 00039F80  98 06 80 00 */	stb r0, 0xCC008000@l(r6)
/* 8003E004 00039F84  38 03 10 0A */	addi r0, r3, 0x100a
/* 8003E008 00039F88  38 A0 00 01 */	li r5, 0x1
/* 8003E00C 00039F8C  90 06 80 00 */	stw r0, -0x8000(r6)
/* 8003E010 00039F90  54 60 10 3A */	slwi r0, r3, 2
/* 8003E014 00039F94  90 E6 80 00 */	stw r7, -0x8000(r6)
/* 8003E018 00039F98  B0 A4 00 02 */	sth r5, 0x2(r4)
/* 8003E01C 00039F9C  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003E020 00039FA0  7C 63 02 14 */	add r3, r3, r0
/* 8003E024 00039FA4  90 E3 00 A8 */	stw r7, 0xa8(r3)
/* 8003E028 00039FA8  4E 80 00 20 */	blr
.endfn GXSetChanAmbColor

.fn GXSetChanMatColor, global
/* 8003E02C 00039FAC  2C 03 00 03 */	cmpwi r3, 0x3
/* 8003E030 00039FB0  41 82 00 B0 */	beq .L_8003E0E0
/* 8003E034 00039FB4  40 80 00 1C */	bge .L_8003E050
/* 8003E038 00039FB8  2C 03 00 01 */	cmpwi r3, 0x1
/* 8003E03C 00039FBC  41 82 00 58 */	beq .L_8003E094
/* 8003E040 00039FC0  40 80 00 88 */	bge .L_8003E0C8
/* 8003E044 00039FC4  2C 03 00 00 */	cmpwi r3, 0x0
/* 8003E048 00039FC8  40 80 00 18 */	bge .L_8003E060
/* 8003E04C 00039FCC  4E 80 00 20 */	blr
.L_8003E050:
/* 8003E050 00039FD0  2C 03 00 05 */	cmpwi r3, 0x5
/* 8003E054 00039FD4  41 82 00 D4 */	beq .L_8003E128
/* 8003E058 00039FD8  4C 80 00 20 */	bgelr
/* 8003E05C 00039FDC  48 00 00 9C */	b .L_8003E0F8
.L_8003E060:
/* 8003E060 00039FE0  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 8003E064 00039FE4  38 60 00 00 */	li r3, 0x0
/* 8003E068 00039FE8  88 C4 00 02 */	lbz r6, 0x2(r4)
/* 8003E06C 00039FEC  80 E5 00 B0 */	lwz r7, 0xb0(r5)
/* 8003E070 00039FF0  88 A4 00 01 */	lbz r5, 0x1(r4)
/* 8003E074 00039FF4  88 04 00 00 */	lbz r0, 0x0(r4)
/* 8003E078 00039FF8  54 E7 06 3E */	clrlwi r7, r7, 24
/* 8003E07C 00039FFC  50 C7 44 2E */	rlwimi r7, r6, 8, 16, 23
/* 8003E080 0003A000  54 A4 80 1E */	slwi r4, r5, 16
/* 8003E084 0003A004  50 E4 04 3E */	rlwimi r4, r7, 0, 16, 31
/* 8003E088 0003A008  54 07 C0 0E */	slwi r7, r0, 24
/* 8003E08C 0003A00C  50 87 02 3E */	rlwimi r7, r4, 0, 8, 31
/* 8003E090 0003A010  48 00 00 CC */	b .L_8003E15C
.L_8003E094:
/* 8003E094 0003A014  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 8003E098 0003A018  38 60 00 01 */	li r3, 0x1
/* 8003E09C 0003A01C  88 C4 00 02 */	lbz r6, 0x2(r4)
/* 8003E0A0 0003A020  80 E5 00 B4 */	lwz r7, 0xb4(r5)
/* 8003E0A4 0003A024  88 A4 00 01 */	lbz r5, 0x1(r4)
/* 8003E0A8 0003A028  88 04 00 00 */	lbz r0, 0x0(r4)
/* 8003E0AC 0003A02C  54 E7 06 3E */	clrlwi r7, r7, 24
/* 8003E0B0 0003A030  50 C7 44 2E */	rlwimi r7, r6, 8, 16, 23
/* 8003E0B4 0003A034  54 A4 80 1E */	slwi r4, r5, 16
/* 8003E0B8 0003A038  50 E4 04 3E */	rlwimi r4, r7, 0, 16, 31
/* 8003E0BC 0003A03C  54 07 C0 0E */	slwi r7, r0, 24
/* 8003E0C0 0003A040  50 87 02 3E */	rlwimi r7, r4, 0, 8, 31
/* 8003E0C4 0003A044  48 00 00 98 */	b .L_8003E15C
.L_8003E0C8:
/* 8003E0C8 0003A048  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 8003E0CC 0003A04C  38 60 00 00 */	li r3, 0x0
/* 8003E0D0 0003A050  88 E4 00 03 */	lbz r7, 0x3(r4)
/* 8003E0D4 0003A054  80 05 00 B0 */	lwz r0, 0xb0(r5)
/* 8003E0D8 0003A058  50 07 00 2E */	rlwimi r7, r0, 0, 0, 23
/* 8003E0DC 0003A05C  48 00 00 80 */	b .L_8003E15C
.L_8003E0E0:
/* 8003E0E0 0003A060  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 8003E0E4 0003A064  38 60 00 01 */	li r3, 0x1
/* 8003E0E8 0003A068  88 E4 00 03 */	lbz r7, 0x3(r4)
/* 8003E0EC 0003A06C  80 05 00 B4 */	lwz r0, 0xb4(r5)
/* 8003E0F0 0003A070  50 07 00 2E */	rlwimi r7, r0, 0, 0, 23
/* 8003E0F4 0003A074  48 00 00 68 */	b .L_8003E15C
.L_8003E0F8:
/* 8003E0F8 0003A078  88 04 00 02 */	lbz r0, 0x2(r4)
/* 8003E0FC 0003A07C  38 60 00 00 */	li r3, 0x0
/* 8003E100 0003A080  88 E4 00 03 */	lbz r7, 0x3(r4)
/* 8003E104 0003A084  54 06 40 2E */	slwi r6, r0, 8
/* 8003E108 0003A088  88 A4 00 01 */	lbz r5, 0x1(r4)
/* 8003E10C 0003A08C  88 04 00 00 */	lbz r0, 0x0(r4)
/* 8003E110 0003A090  50 E6 06 3E */	rlwimi r6, r7, 0, 24, 31
/* 8003E114 0003A094  54 A4 80 1E */	slwi r4, r5, 16
/* 8003E118 0003A098  50 C4 04 3E */	rlwimi r4, r6, 0, 16, 31
/* 8003E11C 0003A09C  54 07 C0 0E */	slwi r7, r0, 24
/* 8003E120 0003A0A0  50 87 02 3E */	rlwimi r7, r4, 0, 8, 31
/* 8003E124 0003A0A4  48 00 00 38 */	b .L_8003E15C
.L_8003E128:
/* 8003E128 0003A0A8  88 04 00 02 */	lbz r0, 0x2(r4)
/* 8003E12C 0003A0AC  38 60 00 01 */	li r3, 0x1
/* 8003E130 0003A0B0  88 E4 00 03 */	lbz r7, 0x3(r4)
/* 8003E134 0003A0B4  54 06 40 2E */	slwi r6, r0, 8
/* 8003E138 0003A0B8  88 A4 00 01 */	lbz r5, 0x1(r4)
/* 8003E13C 0003A0BC  88 04 00 00 */	lbz r0, 0x0(r4)
/* 8003E140 0003A0C0  50 E6 06 3E */	rlwimi r6, r7, 0, 24, 31
/* 8003E144 0003A0C4  54 A4 80 1E */	slwi r4, r5, 16
/* 8003E148 0003A0C8  50 C4 04 3E */	rlwimi r4, r6, 0, 16, 31
/* 8003E14C 0003A0CC  54 07 C0 0E */	slwi r7, r0, 24
/* 8003E150 0003A0D0  50 87 02 3E */	rlwimi r7, r4, 0, 8, 31
/* 8003E154 0003A0D4  48 00 00 08 */	b .L_8003E15C
/* 8003E158 0003A0D8  4E 80 00 20 */	blr
.L_8003E15C:
/* 8003E15C 0003A0DC  38 00 00 10 */	li r0, 0x10
/* 8003E160 0003A0E0  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003E164 0003A0E4  3C C0 CC 01 */	lis r6, 0xCC008000@ha
/* 8003E168 0003A0E8  98 06 80 00 */	stb r0, 0xCC008000@l(r6)
/* 8003E16C 0003A0EC  38 03 10 0C */	addi r0, r3, 0x100c
/* 8003E170 0003A0F0  38 A0 00 01 */	li r5, 0x1
/* 8003E174 0003A0F4  90 06 80 00 */	stw r0, -0x8000(r6)
/* 8003E178 0003A0F8  54 60 10 3A */	slwi r0, r3, 2
/* 8003E17C 0003A0FC  90 E6 80 00 */	stw r7, -0x8000(r6)
/* 8003E180 0003A100  B0 A4 00 02 */	sth r5, 0x2(r4)
/* 8003E184 0003A104  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003E188 0003A108  7C 63 02 14 */	add r3, r3, r0
/* 8003E18C 0003A10C  90 E3 00 B0 */	stw r7, 0xb0(r3)
/* 8003E190 0003A110  4E 80 00 20 */	blr
.endfn GXSetChanMatColor

.fn GXSetNumChans, global
/* 8003E194 0003A114  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003E198 0003A118  54 67 06 3E */	clrlwi r7, r3, 24
/* 8003E19C 0003A11C  54 60 25 36 */	clrlslwi r0, r3, 24, 4
/* 8003E1A0 0003A120  38 C4 02 04 */	addi r6, r4, 0x204
/* 8003E1A4 0003A124  80 A4 02 04 */	lwz r5, 0x204(r4)
/* 8003E1A8 0003A128  38 60 00 10 */	li r3, 0x10
/* 8003E1AC 0003A12C  3C 80 CC 01 */	lis r4, 0xCC008000@ha
/* 8003E1B0 0003A130  54 A5 07 30 */	rlwinm r5, r5, 0, 28, 24
/* 8003E1B4 0003A134  7C A0 03 78 */	or r0, r5, r0
/* 8003E1B8 0003A138  90 06 00 00 */	stw r0, 0x0(r6)
/* 8003E1BC 0003A13C  38 00 10 09 */	li r0, 0x1009
/* 8003E1C0 0003A140  98 64 80 00 */	stb r3, 0xCC008000@l(r4)
/* 8003E1C4 0003A144  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003E1C8 0003A148  90 04 80 00 */	stw r0, -0x8000(r4)
/* 8003E1CC 0003A14C  90 E4 80 00 */	stw r7, -0x8000(r4)
/* 8003E1D0 0003A150  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 8003E1D4 0003A154  60 00 00 04 */	ori r0, r0, 0x4
/* 8003E1D8 0003A158  90 03 04 F0 */	stw r0, 0x4f0(r3)
/* 8003E1DC 0003A15C  4E 80 00 20 */	blr
.endfn GXSetNumChans

.fn GXSetChanCtrl, global
/* 8003E1E0 0003A160  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 8003E1E4 0003A164  2C 03 00 04 */	cmpwi r3, 0x4
/* 8003E1E8 0003A168  93 E1 00 34 */	stw r31, 0x34(r1)
/* 8003E1EC 0003A16C  93 C1 00 30 */	stw r30, 0x30(r1)
/* 8003E1F0 0003A170  93 A1 00 2C */	stw r29, 0x2c(r1)
/* 8003E1F4 0003A174  93 81 00 28 */	stw r28, 0x28(r1)
/* 8003E1F8 0003A178  40 82 00 0C */	bne .L_8003E204
/* 8003E1FC 0003A17C  39 60 00 00 */	li r11, 0x0
/* 8003E200 0003A180  48 00 00 18 */	b .L_8003E218
.L_8003E204:
/* 8003E204 0003A184  2C 03 00 05 */	cmpwi r3, 0x5
/* 8003E208 0003A188  40 82 00 0C */	bne .L_8003E214
/* 8003E20C 0003A18C  39 60 00 01 */	li r11, 0x1
/* 8003E210 0003A190  48 00 00 08 */	b .L_8003E218
.L_8003E214:
/* 8003E214 0003A194  7C 6B 1B 78 */	mr r11, r3
.L_8003E218:
/* 8003E218 0003A198  54 84 0D FC */	clrlslwi r4, r4, 24, 1
/* 8003E21C 0003A19C  7C 8A 33 78 */	or r10, r4, r6
/* 8003E220 0003A1A0  54 E0 07 FE */	clrlwi r0, r7, 31
/* 8003E224 0003A1A4  7C C0 00 D0 */	neg r6, r0
/* 8003E228 0003A1A8  30 86 FF FF */	addic r4, r6, -0x1
/* 8003E22C 0003A1AC  54 E0 07 BC */	rlwinm r0, r7, 0, 30, 30
/* 8003E230 0003A1B0  7D 80 00 D0 */	neg r12, r0
/* 8003E234 0003A1B4  7C C4 31 10 */	subfe r6, r4, r6
/* 8003E238 0003A1B8  30 8C FF FF */	addic r4, r12, -0x1
/* 8003E23C 0003A1BC  7C 84 61 10 */	subfe r4, r4, r12
/* 8003E240 0003A1C0  54 E0 07 7A */	rlwinm r0, r7, 0, 29, 29
/* 8003E244 0003A1C4  7F 80 00 D0 */	neg r28, r0
/* 8003E248 0003A1C8  30 1C FF FF */	addic r0, r28, -0x1
/* 8003E24C 0003A1CC  54 EC 07 38 */	rlwinm r12, r7, 0, 28, 28
/* 8003E250 0003A1D0  7C 00 E1 10 */	subfe r0, r0, r28
/* 8003E254 0003A1D4  7F AC 00 D0 */	neg r29, r12
/* 8003E258 0003A1D8  33 9D FF FF */	addic r28, r29, -0x1
/* 8003E25C 0003A1DC  54 EC 06 F6 */	rlwinm r12, r7, 0, 27, 27
/* 8003E260 0003A1E0  7F CC 00 D0 */	neg r30, r12
/* 8003E264 0003A1E4  7F 9C E9 10 */	subfe r28, r28, r29
/* 8003E268 0003A1E8  33 BE FF FF */	addic r29, r30, -0x1
/* 8003E26C 0003A1EC  54 EC 06 B4 */	rlwinm r12, r7, 0, 26, 26
/* 8003E270 0003A1F0  7F EC 00 D0 */	neg r31, r12
/* 8003E274 0003A1F4  7F BD F1 10 */	subfe r29, r29, r30
/* 8003E278 0003A1F8  33 DF FF FF */	addic r30, r31, -0x1
/* 8003E27C 0003A1FC  54 EC 06 72 */	rlwinm r12, r7, 0, 25, 25
/* 8003E280 0003A200  7F DE F9 10 */	subfe r30, r30, r31
/* 8003E284 0003A204  7F EC 00 D0 */	neg r31, r12
/* 8003E288 0003A208  31 9F FF FF */	addic r12, r31, -0x1
/* 8003E28C 0003A20C  55 4A 06 B0 */	rlwinm r10, r10, 0, 26, 24
/* 8003E290 0003A210  54 A5 30 32 */	slwi r5, r5, 6
/* 8003E294 0003A214  7D 45 2B 78 */	or r5, r10, r5
/* 8003E298 0003A218  54 AA 07 B8 */	rlwinm r10, r5, 0, 30, 28
/* 8003E29C 0003A21C  54 C5 10 3A */	slwi r5, r6, 2
/* 8003E2A0 0003A220  7D 45 2B 78 */	or r5, r10, r5
/* 8003E2A4 0003A224  54 A5 07 76 */	rlwinm r5, r5, 0, 29, 27
/* 8003E2A8 0003A228  54 84 18 38 */	slwi r4, r4, 3
/* 8003E2AC 0003A22C  7C A4 23 78 */	or r4, r5, r4
/* 8003E2B0 0003A230  54 84 07 34 */	rlwinm r4, r4, 0, 28, 26
/* 8003E2B4 0003A234  54 00 20 36 */	slwi r0, r0, 4
/* 8003E2B8 0003A238  7C 80 03 78 */	or r0, r4, r0
/* 8003E2BC 0003A23C  54 04 06 F2 */	rlwinm r4, r0, 0, 27, 25
/* 8003E2C0 0003A240  57 80 28 34 */	slwi r0, r28, 5
/* 8003E2C4 0003A244  7C 80 03 78 */	or r0, r4, r0
/* 8003E2C8 0003A248  54 04 05 66 */	rlwinm r4, r0, 0, 21, 19
/* 8003E2CC 0003A24C  57 A0 58 28 */	slwi r0, r29, 11
/* 8003E2D0 0003A250  7C 80 03 78 */	or r0, r4, r0
/* 8003E2D4 0003A254  54 04 05 24 */	rlwinm r4, r0, 0, 20, 18
/* 8003E2D8 0003A258  57 C0 60 26 */	slwi r0, r30, 12
/* 8003E2DC 0003A25C  7C 80 03 78 */	or r0, r4, r0
/* 8003E2E0 0003A260  54 E7 06 30 */	rlwinm r7, r7, 0, 24, 24
/* 8003E2E4 0003A264  7F EC F9 10 */	subfe r31, r12, r31
/* 8003E2E8 0003A268  7D 87 00 D0 */	neg r12, r7
/* 8003E2EC 0003A26C  30 EC FF FF */	addic r7, r12, -0x1
/* 8003E2F0 0003A270  54 04 04 E2 */	rlwinm r4, r0, 0, 19, 17
/* 8003E2F4 0003A274  57 E0 68 24 */	slwi r0, r31, 13
/* 8003E2F8 0003A278  7C 80 03 78 */	or r0, r4, r0
/* 8003E2FC 0003A27C  7C E7 61 10 */	subfe r7, r7, r12
/* 8003E300 0003A280  54 04 04 A0 */	rlwinm r4, r0, 0, 18, 16
/* 8003E304 0003A284  54 E0 70 22 */	slwi r0, r7, 14
/* 8003E308 0003A288  2C 09 00 00 */	cmpwi r9, 0x0
/* 8003E30C 0003A28C  7C 86 03 78 */	or r6, r4, r0
/* 8003E310 0003A290  40 82 00 08 */	bne .L_8003E318
/* 8003E314 0003A294  39 00 00 00 */	li r8, 0x0
.L_8003E318:
/* 8003E318 0003A298  20 A9 00 02 */	subfic r5, r9, 0x2
/* 8003E31C 0003A29C  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003E320 0003A2A0  30 05 FF FF */	addic r0, r5, -0x1
/* 8003E324 0003A2A4  7D 40 29 10 */	subfe r10, r0, r5
/* 8003E328 0003A2A8  7C A9 00 D0 */	neg r5, r9
/* 8003E32C 0003A2AC  30 05 FF FF */	addic r0, r5, -0x1
/* 8003E330 0003A2B0  7C E0 29 10 */	subfe r7, r0, r5
/* 8003E334 0003A2B4  54 C5 06 6C */	rlwinm r5, r6, 0, 25, 22
/* 8003E338 0003A2B8  55 00 38 30 */	slwi r0, r8, 7
/* 8003E33C 0003A2BC  7C A8 03 78 */	or r8, r5, r0
/* 8003E340 0003A2C0  38 C0 00 10 */	li r6, 0x10
/* 8003E344 0003A2C4  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 8003E348 0003A2C8  98 C5 80 00 */	stb r6, 0xCC008000@l(r5)
/* 8003E34C 0003A2CC  38 0B 10 0E */	addi r0, r11, 0x100e
/* 8003E350 0003A2D0  55 09 05 EA */	rlwinm r9, r8, 0, 23, 21
/* 8003E354 0003A2D4  55 48 48 2C */	slwi r8, r10, 9
/* 8003E358 0003A2D8  90 05 80 00 */	stw r0, -0x8000(r5)
/* 8003E35C 0003A2DC  7D 20 43 78 */	or r0, r9, r8
/* 8003E360 0003A2E0  54 08 05 A8 */	rlwinm r8, r0, 0, 22, 20
/* 8003E364 0003A2E4  54 E0 50 2A */	slwi r0, r7, 10
/* 8003E368 0003A2E8  7D 07 03 78 */	or r7, r8, r0
/* 8003E36C 0003A2EC  90 E5 80 00 */	stw r7, -0x8000(r5)
/* 8003E370 0003A2F0  38 00 00 01 */	li r0, 0x1
/* 8003E374 0003A2F4  2C 03 00 04 */	cmpwi r3, 0x4
/* 8003E378 0003A2F8  B0 04 00 02 */	sth r0, 0x2(r4)
/* 8003E37C 0003A2FC  40 82 00 18 */	bne .L_8003E394
/* 8003E380 0003A300  98 C5 80 00 */	stb r6, -0x8000(r5)
/* 8003E384 0003A304  38 00 10 10 */	li r0, 0x1010
/* 8003E388 0003A308  90 05 80 00 */	stw r0, -0x8000(r5)
/* 8003E38C 0003A30C  90 E5 80 00 */	stw r7, -0x8000(r5)
/* 8003E390 0003A310  48 00 00 1C */	b .L_8003E3AC
.L_8003E394:
/* 8003E394 0003A314  2C 03 00 05 */	cmpwi r3, 0x5
/* 8003E398 0003A318  40 82 00 14 */	bne .L_8003E3AC
/* 8003E39C 0003A31C  98 C5 80 00 */	stb r6, -0x8000(r5)
/* 8003E3A0 0003A320  38 00 10 11 */	li r0, 0x1011
/* 8003E3A4 0003A324  90 05 80 00 */	stw r0, -0x8000(r5)
/* 8003E3A8 0003A328  90 E5 80 00 */	stw r7, -0x8000(r5)
.L_8003E3AC:
/* 8003E3AC 0003A32C  83 E1 00 34 */	lwz r31, 0x34(r1)
/* 8003E3B0 0003A330  83 C1 00 30 */	lwz r30, 0x30(r1)
/* 8003E3B4 0003A334  83 A1 00 2C */	lwz r29, 0x2c(r1)
/* 8003E3B8 0003A338  83 81 00 28 */	lwz r28, 0x28(r1)
/* 8003E3BC 0003A33C  38 21 00 38 */	addi r1, r1, 0x38
/* 8003E3C0 0003A340  4E 80 00 20 */	blr
.endfn GXSetChanCtrl

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0


lbl_800A98C0:
	.4byte 0

lbl_800A98C4:
	.4byte 0x3F800000

lbl_800A98C8:
	.4byte 0x3FE00000
	.4byte 0

lbl_800A98D0:
	.4byte 0x40080000
	.4byte 0

lbl_800A98D8:
	.4byte 0x49800000
	.4byte 0