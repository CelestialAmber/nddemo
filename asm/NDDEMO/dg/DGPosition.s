.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740


.global __ct__10DGPositionFv
__ct__10DGPositionFv:
/* 80018F18 00014E98  7C 08 02 A6 */	mflr r0
/* 80018F1C 00014E9C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80018F20 00014EA0  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80018F24 00014EA4  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80018F28 00014EA8  3B E3 00 00 */	addi r31, r3, 0x0
/* 80018F2C 00014EAC  38 7F 00 24 */	addi r3, r31, 0x24
/* 80018F30 00014EB0  C0 02 81 B0 */	lfs f0, lbl_800A9530@sda21(r2)
/* 80018F34 00014EB4  D0 1F 00 00 */	stfs f0, 0x0(r31)
/* 80018F38 00014EB8  D0 1F 00 04 */	stfs f0, 0x4(r31)
/* 80018F3C 00014EBC  D0 1F 00 08 */	stfs f0, 0x8(r31)
/* 80018F40 00014EC0  D0 1F 00 0C */	stfs f0, 0xc(r31)
/* 80018F44 00014EC4  D0 1F 00 10 */	stfs f0, 0x10(r31)
/* 80018F48 00014EC8  D0 1F 00 14 */	stfs f0, 0x14(r31)
/* 80018F4C 00014ECC  C0 02 81 B4 */	lfs f0, lbl_800A9534@sda21(r2)
/* 80018F50 00014ED0  D0 1F 00 18 */	stfs f0, 0x18(r31)
/* 80018F54 00014ED4  D0 1F 00 1C */	stfs f0, 0x1c(r31)
/* 80018F58 00014ED8  D0 1F 00 20 */	stfs f0, 0x20(r31)
/* 80018F5C 00014EDC  48 01 6A 15 */	bl PSMTXIdentity
/* 80018F60 00014EE0  38 00 00 00 */	li r0, 0x0
/* 80018F64 00014EE4  98 1F 00 54 */	stb r0, 0x54(r31)
/* 80018F68 00014EE8  7F E3 FB 78 */	mr r3, r31
/* 80018F6C 00014EEC  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80018F70 00014EF0  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80018F74 00014EF4  38 21 00 18 */	addi r1, r1, 0x18
/* 80018F78 00014EF8  7C 08 03 A6 */	mtlr r0
/* 80018F7C 00014EFC  4E 80 00 20 */	blr

.global __dt__10DGPositionFv
__dt__10DGPositionFv:
/* 80018F80 00014F00  7C 08 02 A6 */	mflr r0
/* 80018F84 00014F04  90 01 00 04 */	stw r0, 0x4(r1)
/* 80018F88 00014F08  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80018F8C 00014F0C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80018F90 00014F10  7C 7F 1B 79 */	mr. r31, r3
/* 80018F94 00014F14  41 82 00 14 */	beq .L_80018FA8
/* 80018F98 00014F18  7C 80 07 35 */	extsh. r0, r4
/* 80018F9C 00014F1C  40 81 00 0C */	ble .L_80018FA8
/* 80018FA0 00014F20  7F E3 FB 78 */	mr r3, r31
/* 80018FA4 00014F24  4B FF 9A F5 */	bl mFree__FPv
.L_80018FA8:
/* 80018FA8 00014F28  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80018FAC 00014F2C  7F E3 FB 78 */	mr r3, r31
/* 80018FB0 00014F30  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80018FB4 00014F34  38 21 00 18 */	addi r1, r1, 0x18
/* 80018FB8 00014F38  7C 08 03 A6 */	mtlr r0
/* 80018FBC 00014F3C  4E 80 00 20 */	blr

.global GetTransMtx__10DGPositionFRA3_A4_f
GetTransMtx__10DGPositionFRA3_A4_f:
/* 80018FC0 00014F40  7C 08 02 A6 */	mflr r0
/* 80018FC4 00014F44  90 01 00 04 */	stw r0, 0x4(r1)
/* 80018FC8 00014F48  94 21 FF 88 */	stwu r1, -0x78(r1)
/* 80018FCC 00014F4C  93 E1 00 74 */	stw r31, 0x74(r1)
/* 80018FD0 00014F50  3B E4 00 00 */	addi r31, r4, 0x0
/* 80018FD4 00014F54  93 C1 00 70 */	stw r30, 0x70(r1)
/* 80018FD8 00014F58  7C 7E 1B 78 */	mr r30, r3
/* 80018FDC 00014F5C  88 03 00 54 */	lbz r0, 0x54(r3)
/* 80018FE0 00014F60  28 00 00 00 */	cmplwi r0, 0x0
/* 80018FE4 00014F64  40 82 00 BC */	bne .L_800190A0
/* 80018FE8 00014F68  C0 22 81 B8 */	lfs f1, lbl_800A9538@sda21(r2)
/* 80018FEC 00014F6C  38 61 00 40 */	addi r3, r1, 0x40
/* 80018FF0 00014F70  C0 1E 00 0C */	lfs f0, 0xc(r30)
/* 80018FF4 00014F74  38 80 00 58 */	li r4, 0x58
/* 80018FF8 00014F78  EC 21 00 32 */	fmuls f1, f1, f0
/* 80018FFC 00014F7C  48 01 6B E9 */	bl PSMTXRotRad
/* 80019000 00014F80  C0 22 81 B8 */	lfs f1, lbl_800A9538@sda21(r2)
/* 80019004 00014F84  38 7E 00 24 */	addi r3, r30, 0x24
/* 80019008 00014F88  C0 1E 00 10 */	lfs f0, 0x10(r30)
/* 8001900C 00014F8C  38 80 00 59 */	li r4, 0x59
/* 80019010 00014F90  EC 21 00 32 */	fmuls f1, f1, f0
/* 80019014 00014F94  48 01 6B D1 */	bl PSMTXRotRad
/* 80019018 00014F98  38 7E 00 24 */	addi r3, r30, 0x24
/* 8001901C 00014F9C  38 81 00 40 */	addi r4, r1, 0x40
/* 80019020 00014FA0  38 A1 00 10 */	addi r5, r1, 0x10
/* 80019024 00014FA4  48 01 69 AD */	bl PSMTXConcat
/* 80019028 00014FA8  C0 22 81 B8 */	lfs f1, lbl_800A9538@sda21(r2)
/* 8001902C 00014FAC  38 7E 00 24 */	addi r3, r30, 0x24
/* 80019030 00014FB0  C0 1E 00 14 */	lfs f0, 0x14(r30)
/* 80019034 00014FB4  38 80 00 5A */	li r4, 0x5a
/* 80019038 00014FB8  EC 21 00 32 */	fmuls f1, f1, f0
/* 8001903C 00014FBC  48 01 6B A9 */	bl PSMTXRotRad
/* 80019040 00014FC0  38 7E 00 24 */	addi r3, r30, 0x24
/* 80019044 00014FC4  38 81 00 10 */	addi r4, r1, 0x10
/* 80019048 00014FC8  38 A1 00 40 */	addi r5, r1, 0x40
/* 8001904C 00014FCC  48 01 69 85 */	bl PSMTXConcat
/* 80019050 00014FD0  C0 3E 00 00 */	lfs f1, 0x0(r30)
/* 80019054 00014FD4  38 7E 00 24 */	addi r3, r30, 0x24
/* 80019058 00014FD8  C0 5E 00 04 */	lfs f2, 0x4(r30)
/* 8001905C 00014FDC  C0 7E 00 08 */	lfs f3, 0x8(r30)
/* 80019060 00014FE0  48 01 6C 9D */	bl PSMTXTrans
/* 80019064 00014FE4  38 7E 00 24 */	addi r3, r30, 0x24
/* 80019068 00014FE8  38 81 00 40 */	addi r4, r1, 0x40
/* 8001906C 00014FEC  38 A1 00 10 */	addi r5, r1, 0x10
/* 80019070 00014FF0  48 01 69 61 */	bl PSMTXConcat
/* 80019074 00014FF4  C0 3E 00 18 */	lfs f1, 0x18(r30)
/* 80019078 00014FF8  38 61 00 40 */	addi r3, r1, 0x40
/* 8001907C 00014FFC  C0 5E 00 1C */	lfs f2, 0x1c(r30)
/* 80019080 00015000  C0 7E 00 20 */	lfs f3, 0x20(r30)
/* 80019084 00015004  48 01 6C AD */	bl PSMTXScale
/* 80019088 00015008  38 61 00 10 */	addi r3, r1, 0x10
/* 8001908C 0001500C  38 81 00 40 */	addi r4, r1, 0x40
/* 80019090 00015010  38 BE 00 24 */	addi r5, r30, 0x24
/* 80019094 00015014  48 01 69 3D */	bl PSMTXConcat
/* 80019098 00015018  38 00 00 01 */	li r0, 0x1
/* 8001909C 0001501C  98 1E 00 54 */	stb r0, 0x54(r30)
.L_800190A0:
/* 800190A0 00015020  38 7E 00 24 */	addi r3, r30, 0x24
/* 800190A4 00015024  38 9F 00 00 */	addi r4, r31, 0x0
/* 800190A8 00015028  48 01 68 F5 */	bl PSMTXCopy
/* 800190AC 0001502C  80 01 00 7C */	lwz r0, 0x7c(r1)
/* 800190B0 00015030  83 E1 00 74 */	lwz r31, 0x74(r1)
/* 800190B4 00015034  83 C1 00 70 */	lwz r30, 0x70(r1)
/* 800190B8 00015038  7C 08 03 A6 */	mtlr r0
/* 800190BC 0001503C  38 21 00 78 */	addi r1, r1, 0x78
/* 800190C0 00015040  4E 80 00 20 */	blr

.global SetPosition__10DGPositionFRC3Vec
SetPosition__10DGPositionFRC3Vec:
/* 800190C4 00015044  38 00 00 00 */	li r0, 0x0
/* 800190C8 00015048  98 03 00 54 */	stb r0, 0x54(r3)
/* 800190CC 0001504C  80 A4 00 00 */	lwz r5, 0x0(r4)
/* 800190D0 00015050  80 04 00 04 */	lwz r0, 0x4(r4)
/* 800190D4 00015054  90 A3 00 00 */	stw r5, 0x0(r3)
/* 800190D8 00015058  90 03 00 04 */	stw r0, 0x4(r3)
/* 800190DC 0001505C  80 04 00 08 */	lwz r0, 0x8(r4)
/* 800190E0 00015060  90 03 00 08 */	stw r0, 0x8(r3)
/* 800190E4 00015064  4E 80 00 20 */	blr

.global AddPosition__10DGPositionFRC3Vec
AddPosition__10DGPositionFRC3Vec:
/* 800190E8 00015068  38 00 00 00 */	li r0, 0x0
/* 800190EC 0001506C  98 03 00 54 */	stb r0, 0x54(r3)
/* 800190F0 00015070  C0 23 00 00 */	lfs f1, 0x0(r3)
/* 800190F4 00015074  C0 04 00 00 */	lfs f0, 0x0(r4)
/* 800190F8 00015078  EC 01 00 2A */	fadds f0, f1, f0
/* 800190FC 0001507C  D0 03 00 00 */	stfs f0, 0x0(r3)
/* 80019100 00015080  C0 23 00 04 */	lfs f1, 0x4(r3)
/* 80019104 00015084  C0 04 00 04 */	lfs f0, 0x4(r4)
/* 80019108 00015088  EC 01 00 2A */	fadds f0, f1, f0
/* 8001910C 0001508C  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 80019110 00015090  C0 23 00 08 */	lfs f1, 0x8(r3)
/* 80019114 00015094  C0 04 00 08 */	lfs f0, 0x8(r4)
/* 80019118 00015098  EC 01 00 2A */	fadds f0, f1, f0
/* 8001911C 0001509C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 80019120 000150A0  4E 80 00 20 */	blr

.global GetPosition__10DGPositionFv
GetPosition__10DGPositionFv:
/* 80019124 000150A4  80 A4 00 00 */	lwz r5, 0x0(r4)
/* 80019128 000150A8  80 04 00 04 */	lwz r0, 0x4(r4)
/* 8001912C 000150AC  90 A3 00 00 */	stw r5, 0x0(r3)
/* 80019130 000150B0  90 03 00 04 */	stw r0, 0x4(r3)
/* 80019134 000150B4  80 04 00 08 */	lwz r0, 0x8(r4)
/* 80019138 000150B8  90 03 00 08 */	stw r0, 0x8(r3)
/* 8001913C 000150BC  4E 80 00 20 */	blr

.global SetRotation__10DGPositionFRC3Vec
SetRotation__10DGPositionFRC3Vec:
/* 80019140 000150C0  7C 08 02 A6 */	mflr r0
/* 80019144 000150C4  90 01 00 04 */	stw r0, 0x4(r1)
/* 80019148 000150C8  38 00 00 00 */	li r0, 0x0
/* 8001914C 000150CC  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80019150 000150D0  98 03 00 54 */	stb r0, 0x54(r3)
/* 80019154 000150D4  80 A4 00 00 */	lwz r5, 0x0(r4)
/* 80019158 000150D8  80 04 00 04 */	lwz r0, 0x4(r4)
/* 8001915C 000150DC  90 A3 00 0C */	stw r5, 0xc(r3)
/* 80019160 000150E0  90 03 00 10 */	stw r0, 0x10(r3)
/* 80019164 000150E4  80 04 00 08 */	lwz r0, 0x8(r4)
/* 80019168 000150E8  90 03 00 14 */	stw r0, 0x14(r3)
/* 8001916C 000150EC  48 00 00 6D */	bl LimitRotation__10DGPositionFv
/* 80019170 000150F0  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80019174 000150F4  38 21 00 08 */	addi r1, r1, 0x8
/* 80019178 000150F8  7C 08 03 A6 */	mtlr r0
/* 8001917C 000150FC  4E 80 00 20 */	blr

.global AddRotation__10DGPositionFRC3Vec
AddRotation__10DGPositionFRC3Vec:
/* 80019180 00015100  7C 08 02 A6 */	mflr r0
/* 80019184 00015104  90 01 00 04 */	stw r0, 0x4(r1)
/* 80019188 00015108  38 00 00 00 */	li r0, 0x0
/* 8001918C 0001510C  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80019190 00015110  98 03 00 54 */	stb r0, 0x54(r3)
/* 80019194 00015114  C0 23 00 0C */	lfs f1, 0xc(r3)
/* 80019198 00015118  C0 04 00 00 */	lfs f0, 0x0(r4)
/* 8001919C 0001511C  EC 01 00 2A */	fadds f0, f1, f0
/* 800191A0 00015120  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 800191A4 00015124  C0 23 00 10 */	lfs f1, 0x10(r3)
/* 800191A8 00015128  C0 04 00 04 */	lfs f0, 0x4(r4)
/* 800191AC 0001512C  EC 01 00 2A */	fadds f0, f1, f0
/* 800191B0 00015130  D0 03 00 10 */	stfs f0, 0x10(r3)
/* 800191B4 00015134  C0 23 00 14 */	lfs f1, 0x14(r3)
/* 800191B8 00015138  C0 04 00 08 */	lfs f0, 0x8(r4)
/* 800191BC 0001513C  EC 01 00 2A */	fadds f0, f1, f0
/* 800191C0 00015140  D0 03 00 14 */	stfs f0, 0x14(r3)
/* 800191C4 00015144  48 00 00 15 */	bl LimitRotation__10DGPositionFv
/* 800191C8 00015148  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800191CC 0001514C  38 21 00 08 */	addi r1, r1, 0x8
/* 800191D0 00015150  7C 08 03 A6 */	mtlr r0
/* 800191D4 00015154  4E 80 00 20 */	blr

.global LimitRotation__10DGPositionFv
LimitRotation__10DGPositionFv:
/* 800191D8 00015158  C0 22 81 BC */	lfs f1, lbl_800A953C@sda21(r2)
/* 800191DC 0001515C  48 00 00 10 */	b .L_800191EC
.L_800191E0:
/* 800191E0 00015160  C0 03 00 0C */	lfs f0, 0xc(r3)
/* 800191E4 00015164  EC 00 08 28 */	fsubs f0, f0, f1
/* 800191E8 00015168  D0 03 00 0C */	stfs f0, 0xc(r3)
.L_800191EC:
/* 800191EC 0001516C  C0 03 00 0C */	lfs f0, 0xc(r3)
/* 800191F0 00015170  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 800191F4 00015174  4C 41 13 82 */	cror eq, gt, eq
/* 800191F8 00015178  41 82 FF E8 */	beq .L_800191E0
/* 800191FC 0001517C  C0 42 81 BC */	lfs f2, lbl_800A953C@sda21(r2)
/* 80019200 00015180  C0 02 81 C0 */	lfs f0, lbl_800A9540@sda21(r2)
/* 80019204 00015184  48 00 00 10 */	b .L_80019214
.L_80019208:
/* 80019208 00015188  C0 23 00 0C */	lfs f1, 0xc(r3)
/* 8001920C 0001518C  EC 21 10 2A */	fadds f1, f1, f2
/* 80019210 00015190  D0 23 00 0C */	stfs f1, 0xc(r3)
.L_80019214:
/* 80019214 00015194  C0 23 00 0C */	lfs f1, 0xc(r3)
/* 80019218 00015198  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8001921C 0001519C  4C 40 13 82 */	cror eq, lt, eq
/* 80019220 000151A0  41 82 FF E8 */	beq .L_80019208
/* 80019224 000151A4  C0 22 81 BC */	lfs f1, lbl_800A953C@sda21(r2)
/* 80019228 000151A8  48 00 00 10 */	b .L_80019238
.L_8001922C:
/* 8001922C 000151AC  C0 03 00 10 */	lfs f0, 0x10(r3)
/* 80019230 000151B0  EC 00 08 28 */	fsubs f0, f0, f1
/* 80019234 000151B4  D0 03 00 10 */	stfs f0, 0x10(r3)
.L_80019238:
/* 80019238 000151B8  C0 03 00 10 */	lfs f0, 0x10(r3)
/* 8001923C 000151BC  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 80019240 000151C0  4C 41 13 82 */	cror eq, gt, eq
/* 80019244 000151C4  41 82 FF E8 */	beq .L_8001922C
/* 80019248 000151C8  C0 42 81 BC */	lfs f2, lbl_800A953C@sda21(r2)
/* 8001924C 000151CC  C0 02 81 C0 */	lfs f0, lbl_800A9540@sda21(r2)
/* 80019250 000151D0  48 00 00 10 */	b .L_80019260
.L_80019254:
/* 80019254 000151D4  C0 23 00 10 */	lfs f1, 0x10(r3)
/* 80019258 000151D8  EC 21 10 2A */	fadds f1, f1, f2
/* 8001925C 000151DC  D0 23 00 10 */	stfs f1, 0x10(r3)
.L_80019260:
/* 80019260 000151E0  C0 23 00 10 */	lfs f1, 0x10(r3)
/* 80019264 000151E4  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80019268 000151E8  4C 40 13 82 */	cror eq, lt, eq
/* 8001926C 000151EC  41 82 FF E8 */	beq .L_80019254
/* 80019270 000151F0  C0 22 81 BC */	lfs f1, lbl_800A953C@sda21(r2)
/* 80019274 000151F4  48 00 00 10 */	b .L_80019284
.L_80019278:
/* 80019278 000151F8  C0 03 00 14 */	lfs f0, 0x14(r3)
/* 8001927C 000151FC  EC 00 08 28 */	fsubs f0, f0, f1
/* 80019280 00015200  D0 03 00 14 */	stfs f0, 0x14(r3)
.L_80019284:
/* 80019284 00015204  C0 03 00 14 */	lfs f0, 0x14(r3)
/* 80019288 00015208  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 8001928C 0001520C  4C 41 13 82 */	cror eq, gt, eq
/* 80019290 00015210  41 82 FF E8 */	beq .L_80019278
/* 80019294 00015214  C0 42 81 BC */	lfs f2, lbl_800A953C@sda21(r2)
/* 80019298 00015218  C0 02 81 C0 */	lfs f0, lbl_800A9540@sda21(r2)
/* 8001929C 0001521C  48 00 00 10 */	b .L_800192AC
.L_800192A0:
/* 800192A0 00015220  C0 23 00 14 */	lfs f1, 0x14(r3)
/* 800192A4 00015224  EC 21 10 2A */	fadds f1, f1, f2
/* 800192A8 00015228  D0 23 00 14 */	stfs f1, 0x14(r3)
.L_800192AC:
/* 800192AC 0001522C  C0 23 00 14 */	lfs f1, 0x14(r3)
/* 800192B0 00015230  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800192B4 00015234  4C 40 13 82 */	cror eq, lt, eq
/* 800192B8 00015238  41 82 FF E8 */	beq .L_800192A0
/* 800192BC 0001523C  4E 80 00 20 */	blr

.global GetRotation__10DGPositionFv
GetRotation__10DGPositionFv:
/* 800192C0 00015240  80 A4 00 0C */	lwz r5, 0xc(r4)
/* 800192C4 00015244  80 04 00 10 */	lwz r0, 0x10(r4)
/* 800192C8 00015248  90 A3 00 00 */	stw r5, 0x0(r3)
/* 800192CC 0001524C  90 03 00 04 */	stw r0, 0x4(r3)
/* 800192D0 00015250  80 04 00 14 */	lwz r0, 0x14(r4)
/* 800192D4 00015254  90 03 00 08 */	stw r0, 0x8(r3)
/* 800192D8 00015258  4E 80 00 20 */	blr

.global GetDirectionalVec__10DGPositionFR3VecR3Vec
GetDirectionalVec__10DGPositionFR3VecR3Vec:
/* 800192DC 0001525C  7C 08 02 A6 */	mflr r0
/* 800192E0 00015260  90 01 00 04 */	stw r0, 0x4(r1)
/* 800192E4 00015264  94 21 FF 78 */	stwu r1, -0x88(r1)
/* 800192E8 00015268  93 E1 00 84 */	stw r31, 0x84(r1)
/* 800192EC 0001526C  3B E5 00 00 */	addi r31, r5, 0x0
/* 800192F0 00015270  93 C1 00 80 */	stw r30, 0x80(r1)
/* 800192F4 00015274  3B C4 00 00 */	addi r30, r4, 0x0
/* 800192F8 00015278  38 80 00 58 */	li r4, 0x58
/* 800192FC 0001527C  93 A1 00 7C */	stw r29, 0x7c(r1)
/* 80019300 00015280  7C 7D 1B 78 */	mr r29, r3
/* 80019304 00015284  C0 03 00 0C */	lfs f0, 0xc(r3)
/* 80019308 00015288  38 61 00 14 */	addi r3, r1, 0x14
/* 8001930C 0001528C  C0 22 81 B8 */	lfs f1, lbl_800A9538@sda21(r2)
/* 80019310 00015290  EC 21 00 32 */	fmuls f1, f1, f0
/* 80019314 00015294  48 01 68 D1 */	bl PSMTXRotRad
/* 80019318 00015298  C0 22 81 B8 */	lfs f1, lbl_800A9538@sda21(r2)
/* 8001931C 0001529C  38 61 00 44 */	addi r3, r1, 0x44
/* 80019320 000152A0  C0 1D 00 10 */	lfs f0, 0x10(r29)
/* 80019324 000152A4  38 80 00 59 */	li r4, 0x59
/* 80019328 000152A8  EC 21 00 32 */	fmuls f1, f1, f0
/* 8001932C 000152AC  48 01 68 B9 */	bl PSMTXRotRad
/* 80019330 000152B0  38 81 00 14 */	addi r4, r1, 0x14
/* 80019334 000152B4  38 A4 00 00 */	addi r5, r4, 0x0
/* 80019338 000152B8  38 61 00 44 */	addi r3, r1, 0x44
/* 8001933C 000152BC  48 01 66 95 */	bl PSMTXConcat
/* 80019340 000152C0  C0 22 81 B8 */	lfs f1, lbl_800A9538@sda21(r2)
/* 80019344 000152C4  38 61 00 44 */	addi r3, r1, 0x44
/* 80019348 000152C8  C0 1D 00 14 */	lfs f0, 0x14(r29)
/* 8001934C 000152CC  38 80 00 5A */	li r4, 0x5a
/* 80019350 000152D0  EC 21 00 32 */	fmuls f1, f1, f0
/* 80019354 000152D4  48 01 68 91 */	bl PSMTXRotRad
/* 80019358 000152D8  38 81 00 14 */	addi r4, r1, 0x14
/* 8001935C 000152DC  38 A4 00 00 */	addi r5, r4, 0x0
/* 80019360 000152E0  38 61 00 44 */	addi r3, r1, 0x44
/* 80019364 000152E4  48 01 66 6D */	bl PSMTXConcat
/* 80019368 000152E8  38 9E 00 00 */	addi r4, r30, 0x0
/* 8001936C 000152EC  38 BF 00 00 */	addi r5, r31, 0x0
/* 80019370 000152F0  38 61 00 14 */	addi r3, r1, 0x14
/* 80019374 000152F4  48 01 6C 59 */	bl PSMTXMultVecSR
/* 80019378 000152F8  80 01 00 8C */	lwz r0, 0x8c(r1)
/* 8001937C 000152FC  83 E1 00 84 */	lwz r31, 0x84(r1)
/* 80019380 00015300  83 C1 00 80 */	lwz r30, 0x80(r1)
/* 80019384 00015304  7C 08 03 A6 */	mtlr r0
/* 80019388 00015308  83 A1 00 7C */	lwz r29, 0x7c(r1)
/* 8001938C 0001530C  38 21 00 88 */	addi r1, r1, 0x88
/* 80019390 00015310  4E 80 00 20 */	blr

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0 ; 0x00000820

lbl_800A9530:

	# ROM: 0x6A6B0
	.4byte 0

lbl_800A9534:

	# ROM: 0x6A6B4
	.4byte 0x3F800000

lbl_800A9538:

	# ROM: 0x6A6B8
	.4byte 0x3C8EFA35

lbl_800A953C:

	# ROM: 0x6A6BC
	.4byte 0x43B40000

lbl_800A9540:

	# ROM: 0x6A6C0
	.4byte 0xC3B40000
	.4byte 0
