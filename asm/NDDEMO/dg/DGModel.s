.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740


__ct__7DGModelFP8DGObjMan:
/* 80013004 0000EF84  7C 08 02 A6 */	mflr r0
/* 80013008 0000EF88  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001300C 0000EF8C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80013010 0000EF90  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80013014 0000EF94  3B E4 00 00 */	addi r31, r4, 0x0
/* 80013018 0000EF98  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8001301C 0000EF9C  3B C3 00 00 */	addi r30, r3, 0x0
/* 80013020 0000EFA0  48 00 5E F9 */	bl __ct__10DGPositionFv
/* 80013024 0000EFA4  93 FE 00 58 */	stw r31, 0x58(r30)
/* 80013028 0000EFA8  38 00 00 00 */	li r0, 0x0
/* 8001302C 0000EFAC  38 7E 00 00 */	addi r3, r30, 0x0
/* 80013030 0000EFB0  90 1E 00 5C */	stw r0, 0x5c(r30)
/* 80013034 0000EFB4  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80013038 0000EFB8  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8001303C 0000EFBC  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 80013040 0000EFC0  38 21 00 18 */	addi r1, r1, 0x18
/* 80013044 0000EFC4  7C 08 03 A6 */	mtlr r0
/* 80013048 0000EFC8  4E 80 00 20 */	blr

__dt__7DGModelFv:
/* 8001304C 0000EFCC  7C 08 02 A6 */	mflr r0
/* 80013050 0000EFD0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80013054 0000EFD4  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80013058 0000EFD8  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8001305C 0000EFDC  3B E4 00 00 */	addi r31, r4, 0x0
/* 80013060 0000EFE0  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80013064 0000EFE4  7C 7E 1B 79 */	mr. r30, r3
/* 80013068 0000EFE8  41 82 00 3C */	beq lbl_800130A4
/* 8001306C 0000EFEC  80 7E 00 5C */	lwz r3, 0x5c(r30)
/* 80013070 0000EFF0  28 03 00 00 */	cmplwi r3, 0x0
/* 80013074 0000EFF4  41 82 00 14 */	beq lbl_80013088
/* 80013078 0000EFF8  38 80 00 01 */	li r4, 0x1
/* 8001307C 0000EFFC  48 00 30 59 */	bl __dt__7DGPartsFv
/* 80013080 0000F000  38 00 00 00 */	li r0, 0x0
/* 80013084 0000F004  90 1E 00 5C */	stw r0, 0x5c(r30)
lbl_80013088:
/* 80013088 0000F008  38 7E 00 00 */	addi r3, r30, 0x0
/* 8001308C 0000F00C  38 80 00 00 */	li r4, 0x0
/* 80013090 0000F010  48 00 5E F1 */	bl __dt__10DGPositionFv
/* 80013094 0000F014  7F E0 07 35 */	extsh. r0, r31
/* 80013098 0000F018  40 81 00 0C */	ble lbl_800130A4
/* 8001309C 0000F01C  7F C3 F3 78 */	mr r3, r30
/* 800130A0 0000F020  4B FF F9 F9 */	bl mFree__FPv
lbl_800130A4:
/* 800130A4 0000F024  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800130A8 0000F028  7F C3 F3 78 */	mr r3, r30
/* 800130AC 0000F02C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800130B0 0000F030  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800130B4 0000F034  7C 08 03 A6 */	mtlr r0
/* 800130B8 0000F038  38 21 00 18 */	addi r1, r1, 0x18
/* 800130BC 0000F03C  4E 80 00 20 */	blr

GetPartsPtr__7DGModelFPCc:
/* 800130C0 0000F040  7C 08 02 A6 */	mflr r0
/* 800130C4 0000F044  90 01 00 04 */	stw r0, 0x4(r1)
/* 800130C8 0000F048  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800130CC 0000F04C  80 03 00 5C */	lwz r0, 0x5c(r3)
/* 800130D0 0000F050  28 00 00 00 */	cmplwi r0, 0x0
/* 800130D4 0000F054  40 82 00 0C */	bne lbl_800130E0
/* 800130D8 0000F058  38 60 00 00 */	li r3, 0x0
/* 800130DC 0000F05C  48 00 00 18 */	b lbl_800130F4
lbl_800130E0:
/* 800130E0 0000F060  38 00 00 00 */	li r0, 0x0
/* 800130E4 0000F064  98 01 00 10 */	stb r0, 0x10(r1)
/* 800130E8 0000F068  38 A1 00 10 */	addi r5, r1, 0x10
/* 800130EC 0000F06C  80 63 00 5C */	lwz r3, 0x5c(r3)
/* 800130F0 0000F070  48 00 32 D1 */	bl GetPartsPtr__7DGPartsFPCcRUc
lbl_800130F4:
/* 800130F4 0000F074  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800130F8 0000F078  38 21 00 18 */	addi r1, r1, 0x18
/* 800130FC 0000F07C  7C 08 03 A6 */	mtlr r0
/* 80013100 0000F080  4E 80 00 20 */	blr

Draw__7DGModelFR11DGRendState:
/* 80013104 0000F084  7C 08 02 A6 */	mflr r0
/* 80013108 0000F088  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001310C 0000F08C  94 21 FF B8 */	stwu r1, -0x48(r1)
/* 80013110 0000F090  93 E1 00 44 */	stw r31, 0x44(r1)
/* 80013114 0000F094  3B E4 00 00 */	addi r31, r4, 0x0
/* 80013118 0000F098  38 81 00 10 */	addi r4, r1, 0x10
/* 8001311C 0000F09C  93 C1 00 40 */	stw r30, 0x40(r1)
/* 80013120 0000F0A0  3B C3 00 00 */	addi r30, r3, 0x0
/* 80013124 0000F0A4  48 00 5E 9D */	bl GetTransMtx__10DGPositionFRA3_A4_f
/* 80013128 0000F0A8  38 7F 00 30 */	addi r3, r31, 0x30
/* 8001312C 0000F0AC  38 A3 00 00 */	addi r5, r3, 0x0
/* 80013130 0000F0B0  38 81 00 10 */	addi r4, r1, 0x10
/* 80013134 0000F0B4  48 01 C8 9D */	bl PSMTXConcat
/* 80013138 0000F0B8  80 7E 00 5C */	lwz r3, 0x5c(r30)
/* 8001313C 0000F0BC  28 03 00 00 */	cmplwi r3, 0x0
/* 80013140 0000F0C0  41 82 00 0C */	beq lbl_8001314C
/* 80013144 0000F0C4  7F E4 FB 78 */	mr r4, r31
/* 80013148 0000F0C8  48 00 33 95 */	bl Draw__7DGPartsFR11DGRendState
lbl_8001314C:
/* 8001314C 0000F0CC  80 01 00 4C */	lwz r0, 0x4c(r1)
/* 80013150 0000F0D0  83 E1 00 44 */	lwz r31, 0x44(r1)
/* 80013154 0000F0D4  83 C1 00 40 */	lwz r30, 0x40(r1)
/* 80013158 0000F0D8  7C 08 03 A6 */	mtlr r0
/* 8001315C 0000F0DC  38 21 00 48 */	addi r1, r1, 0x48
/* 80013160 0000F0E0  4E 80 00 20 */	blr

CreateInstance__7DGModelFPUc:
/* 80013164 0000F0E4  7C 08 02 A6 */	mflr r0
/* 80013168 0000F0E8  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001316C 0000F0EC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80013170 0000F0F0  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80013174 0000F0F4  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80013178 0000F0F8  7C 7E 1B 78 */	mr r30, r3
/* 8001317C 0000F0FC  90 81 00 10 */	stw r4, 0x10(r1)
/* 80013180 0000F100  80 63 00 5C */	lwz r3, 0x5c(r3)
/* 80013184 0000F104  28 03 00 00 */	cmplwi r3, 0x0
/* 80013188 0000F108  41 82 00 14 */	beq lbl_8001319C
/* 8001318C 0000F10C  38 80 00 01 */	li r4, 0x1
/* 80013190 0000F110  48 00 2F 45 */	bl __dt__7DGPartsFv
/* 80013194 0000F114  38 00 00 00 */	li r0, 0x0
/* 80013198 0000F118  90 1E 00 5C */	stw r0, 0x5c(r30)
lbl_8001319C:
/* 8001319C 0000F11C  38 60 00 8C */	li r3, 0x8c
/* 800131A0 0000F120  4B FF F8 59 */	bl mAlloc__FUl
/* 800131A4 0000F124  3B E3 00 00 */	addi r31, r3, 0x0
/* 800131A8 0000F128  7F E3 FB 79 */	mr. r3, r31
/* 800131AC 0000F12C  41 82 00 0C */	beq lbl_800131B8
/* 800131B0 0000F130  80 9E 00 58 */	lwz r4, 0x58(r30)
/* 800131B4 0000F134  48 00 2E 65 */	bl __ct__7DGPartsFP8DGObjMan
lbl_800131B8:
/* 800131B8 0000F138  80 61 00 10 */	lwz r3, 0x10(r1)
/* 800131BC 0000F13C  88 03 00 00 */	lbz r0, 0x0(r3)
/* 800131C0 0000F140  28 00 00 01 */	cmplwi r0, 0x1
/* 800131C4 0000F144  40 82 00 58 */	bne lbl_8001321C
/* 800131C8 0000F148  38 03 00 01 */	addi r0, r3, 0x1
/* 800131CC 0000F14C  90 01 00 10 */	stw r0, 0x10(r1)
/* 800131D0 0000F150  38 7F 00 00 */	addi r3, r31, 0x0
/* 800131D4 0000F154  38 81 00 10 */	addi r4, r1, 0x10
/* 800131D8 0000F158  48 00 3B 35 */	bl CreateInstance__7DGPartsFRPUc
/* 800131DC 0000F15C  54 60 06 3E */	clrlwi r0, r3, 24
/* 800131E0 0000F160  28 00 00 01 */	cmplwi r0, 0x1
/* 800131E4 0000F164  40 82 00 0C */	bne lbl_800131F0
/* 800131E8 0000F168  93 FE 00 5C */	stw r31, 0x5c(r30)
/* 800131EC 0000F16C  48 00 00 30 */	b lbl_8001321C
lbl_800131F0:
/* 800131F0 0000F170  3C 60 80 06 */	lis r3, lbl_800662D8@ha
/* 800131F4 0000F174  4C C6 31 82 */	crclr 4*cr1+eq
/* 800131F8 0000F178  38 63 62 D8 */	addi r3, r3, lbl_800662D8@l
/* 800131FC 0000F17C  48 01 69 E9 */	bl OSReport
/* 80013200 0000F180  28 1F 00 00 */	cmplwi r31, 0x0
/* 80013204 0000F184  41 82 00 10 */	beq lbl_80013214
/* 80013208 0000F188  38 7F 00 00 */	addi r3, r31, 0x0
/* 8001320C 0000F18C  38 80 00 01 */	li r4, 0x1
/* 80013210 0000F190  48 00 2E C5 */	bl __dt__7DGPartsFv
lbl_80013214:
/* 80013214 0000F194  38 60 00 00 */	li r3, 0x0
/* 80013218 0000F198  48 00 00 08 */	b lbl_80013220
lbl_8001321C:
/* 8001321C 0000F19C  38 60 00 01 */	li r3, 0x1
lbl_80013220:
/* 80013220 0000F1A0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80013224 0000F1A4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80013228 0000F1A8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8001322C 0000F1AC  7C 08 03 A6 */	mtlr r0
/* 80013230 0000F1B0  38 21 00 20 */	addi r1, r1, 0x20
/* 80013234 0000F1B4  4E 80 00 20 */	blr

SetPartsWorldPosition__7DGModelFv:
/* 80013238 0000F1B8  7C 08 02 A6 */	mflr r0
/* 8001323C 0000F1BC  90 01 00 04 */	stw r0, 0x4(r1)
/* 80013240 0000F1C0  94 21 FF B8 */	stwu r1, -0x48(r1)
/* 80013244 0000F1C4  93 E1 00 44 */	stw r31, 0x44(r1)
/* 80013248 0000F1C8  7C 7F 1B 78 */	mr r31, r3
/* 8001324C 0000F1CC  80 03 00 5C */	lwz r0, 0x5c(r3)
/* 80013250 0000F1D0  28 00 00 00 */	cmplwi r0, 0x0
/* 80013254 0000F1D4  41 82 00 1C */	beq lbl_80013270
/* 80013258 0000F1D8  38 7F 00 00 */	addi r3, r31, 0x0
/* 8001325C 0000F1DC  38 81 00 0C */	addi r4, r1, 0xc
/* 80013260 0000F1E0  48 00 5D 61 */	bl GetTransMtx__10DGPositionFRA3_A4_f
/* 80013264 0000F1E4  80 7F 00 5C */	lwz r3, 0x5c(r31)
/* 80013268 0000F1E8  38 81 00 0C */	addi r4, r1, 0xc
/* 8001326C 0000F1EC  48 00 3E 15 */	bl SetWorldPosition__7DGPartsFRA3_A4_f
lbl_80013270:
/* 80013270 0000F1F0  80 01 00 4C */	lwz r0, 0x4c(r1)
/* 80013274 0000F1F4  83 E1 00 44 */	lwz r31, 0x44(r1)
/* 80013278 0000F1F8  38 21 00 48 */	addi r1, r1, 0x48
/* 8001327C 0000F1FC  7C 08 03 A6 */	mtlr r0
/* 80013280 0000F200  4E 80 00 20 */	blr

GetPartsWorldPosition__7DGModelFPCc:
/* 80013284 0000F204  7C 08 02 A6 */	mflr r0
/* 80013288 0000F208  38 C5 00 00 */	addi r6, r5, 0x0
/* 8001328C 0000F20C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80013290 0000F210  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80013294 0000F214  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80013298 0000F218  3B E3 00 00 */	addi r31, r3, 0x0
/* 8001329C 0000F21C  80 04 00 5C */	lwz r0, 0x5c(r4)
/* 800132A0 0000F220  28 00 00 00 */	cmplwi r0, 0x0
/* 800132A4 0000F224  40 82 00 0C */	bne lbl_800132B0
/* 800132A8 0000F228  38 60 00 00 */	li r3, 0x0
/* 800132AC 0000F22C  48 00 00 1C */	b lbl_800132C8
lbl_800132B0:
/* 800132B0 0000F230  38 00 00 00 */	li r0, 0x0
/* 800132B4 0000F234  98 01 00 14 */	stb r0, 0x14(r1)
/* 800132B8 0000F238  38 A1 00 14 */	addi r5, r1, 0x14
/* 800132BC 0000F23C  80 64 00 5C */	lwz r3, 0x5c(r4)
/* 800132C0 0000F240  7C C4 33 78 */	mr r4, r6
/* 800132C4 0000F244  48 00 30 FD */	bl GetPartsPtr__7DGPartsFPCcRUc
lbl_800132C8:
/* 800132C8 0000F248  28 03 00 00 */	cmplwi r3, 0x0
/* 800132CC 0000F24C  38 83 00 00 */	addi r4, r3, 0x0
/* 800132D0 0000F250  41 82 00 10 */	beq lbl_800132E0
/* 800132D4 0000F254  7F E3 FB 78 */	mr r3, r31
/* 800132D8 0000F258  48 00 3E 81 */	bl GetWorldPosition__7DGPartsFv
/* 800132DC 0000F25C  48 00 00 24 */	b lbl_80013300
lbl_800132E0:
/* 800132E0 0000F260  3C 60 80 06 */	lis r3, "miss$155"@ha
/* 800132E4 0000F264  38 83 3E 80 */	addi r4, r3, "miss$155"@l
/* 800132E8 0000F268  80 64 00 00 */	lwz r3, 0x0(r4)
/* 800132EC 0000F26C  80 04 00 04 */	lwz r0, 0x4(r4)
/* 800132F0 0000F270  90 7F 00 00 */	stw r3, 0x0(r31)
/* 800132F4 0000F274  90 1F 00 04 */	stw r0, 0x4(r31)
/* 800132F8 0000F278  80 04 00 08 */	lwz r0, 0x8(r4)
/* 800132FC 0000F27C  90 1F 00 08 */	stw r0, 0x8(r31)
lbl_80013300:
/* 80013300 0000F280  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80013304 0000F284  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80013308 0000F288  38 21 00 20 */	addi r1, r1, 0x20
/* 8001330C 0000F28C  7C 08 03 A6 */	mtlr r0
/* 80013310 0000F290  4E 80 00 20 */	blr

#rodata

.global "miss$155"
"miss$155":

	# ROM: 0x60E80
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0

#data

.global lbl_800662D8
lbl_800662D8:

	# ROM: 0x632D8
	.asciz "Error DGModel::CreateInstance False\n"
	.balign 4
