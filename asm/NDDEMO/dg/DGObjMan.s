.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740



.fn __ct__8DGObjManFUs, global
/* 80015D1C 00011C9C  7C 08 02 A6 */	mflr r0
/* 80015D20 00011CA0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80015D24 00011CA4  38 00 00 00 */	li r0, 0x0
/* 80015D28 00011CA8  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80015D2C 00011CAC  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80015D30 00011CB0  7C 7F 1B 78 */	mr r31, r3
/* 80015D34 00011CB4  B0 83 00 00 */	sth r4, 0x0(r3)
/* 80015D38 00011CB8  B0 03 00 02 */	sth r0, 0x2(r3)
/* 80015D3C 00011CBC  A0 03 00 00 */	lhz r0, 0x0(r3)
/* 80015D40 00011CC0  54 03 10 3A */	slwi r3, r0, 2
/* 80015D44 00011CC4  4B FF CC B5 */	bl mAlloc__FUl
/* 80015D48 00011CC8  90 7F 00 04 */	stw r3, 0x4(r31)
/* 80015D4C 00011CCC  38 80 00 00 */	li r4, 0x0
/* 80015D50 00011CD0  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 80015D54 00011CD4  80 7F 00 04 */	lwz r3, 0x4(r31)
/* 80015D58 00011CD8  54 05 10 3A */	slwi r5, r0, 2
/* 80015D5C 00011CDC  4B FE F5 D1 */	bl memset
/* 80015D60 00011CE0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80015D64 00011CE4  7F E3 FB 78 */	mr r3, r31
/* 80015D68 00011CE8  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80015D6C 00011CEC  38 21 00 18 */	addi r1, r1, 0x18
/* 80015D70 00011CF0  7C 08 03 A6 */	mtlr r0
/* 80015D74 00011CF4  4E 80 00 20 */	blr
.endfn __ct__8DGObjManFUs

.fn __dt__8DGObjManFv, global
/* 80015D78 00011CF8  7C 08 02 A6 */	mflr r0
/* 80015D7C 00011CFC  90 01 00 04 */	stw r0, 0x4(r1)
/* 80015D80 00011D00  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80015D84 00011D04  BF 61 00 14 */	stmw r27, 0x14(r1)
/* 80015D88 00011D08  7C 7B 1B 79 */	mr. r27, r3
/* 80015D8C 00011D0C  3B 84 00 00 */	addi r28, r4, 0x0
/* 80015D90 00011D10  41 82 00 7C */	beq .L_80015E0C
/* 80015D94 00011D14  80 1B 00 04 */	lwz r0, 0x4(r27)
/* 80015D98 00011D18  28 00 00 00 */	cmplwi r0, 0x0
/* 80015D9C 00011D1C  41 82 00 48 */	beq .L_80015DE4
/* 80015DA0 00011D20  3B C0 00 00 */	li r30, 0x0
/* 80015DA4 00011D24  3B FE 00 00 */	addi r31, r30, 0x0
/* 80015DA8 00011D28  3B A0 00 00 */	li r29, 0x0
/* 80015DAC 00011D2C  48 00 00 2C */	b .L_80015DD8
.L_80015DB0:
/* 80015DB0 00011D30  80 7B 00 04 */	lwz r3, 0x4(r27)
/* 80015DB4 00011D34  7C 63 F0 2E */	lwzx r3, r3, r30
/* 80015DB8 00011D38  28 03 00 00 */	cmplwi r3, 0x0
/* 80015DBC 00011D3C  41 82 00 14 */	beq .L_80015DD0
/* 80015DC0 00011D40  38 80 00 01 */	li r4, 0x1
/* 80015DC4 00011D44  4B FF E2 31 */	bl __dt__8DGObjectFv
/* 80015DC8 00011D48  80 7B 00 04 */	lwz r3, 0x4(r27)
/* 80015DCC 00011D4C  7F E3 F1 2E */	stwx r31, r3, r30
.L_80015DD0:
/* 80015DD0 00011D50  3B DE 00 04 */	addi r30, r30, 0x4
/* 80015DD4 00011D54  3B BD 00 01 */	addi r29, r29, 0x1
.L_80015DD8:
/* 80015DD8 00011D58  A0 1B 00 00 */	lhz r0, 0x0(r27)
/* 80015DDC 00011D5C  7C 1D 00 00 */	cmpw r29, r0
/* 80015DE0 00011D60  41 80 FF D0 */	blt .L_80015DB0
.L_80015DE4:
/* 80015DE4 00011D64  80 7B 00 04 */	lwz r3, 0x4(r27)
/* 80015DE8 00011D68  28 03 00 00 */	cmplwi r3, 0x0
/* 80015DEC 00011D6C  41 82 00 10 */	beq .L_80015DFC
/* 80015DF0 00011D70  4B FF CC A9 */	bl mFree__FPv
/* 80015DF4 00011D74  38 00 00 00 */	li r0, 0x0
/* 80015DF8 00011D78  90 1B 00 04 */	stw r0, 0x4(r27)
.L_80015DFC:
/* 80015DFC 00011D7C  7F 80 07 35 */	extsh. r0, r28
/* 80015E00 00011D80  40 81 00 0C */	ble .L_80015E0C
/* 80015E04 00011D84  7F 63 DB 78 */	mr r3, r27
/* 80015E08 00011D88  4B FF CC 91 */	bl mFree__FPv
.L_80015E0C:
/* 80015E0C 00011D8C  7F 63 DB 78 */	mr r3, r27
/* 80015E10 00011D90  BB 61 00 14 */	lmw r27, 0x14(r1)
/* 80015E14 00011D94  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80015E18 00011D98  38 21 00 28 */	addi r1, r1, 0x28
/* 80015E1C 00011D9C  7C 08 03 A6 */	mtlr r0
/* 80015E20 00011DA0  4E 80 00 20 */	blr
.endfn __dt__8DGObjManFv

.fn AddObject__8DGObjManFP8DGObject, global
/* 80015E24 00011DA4  7C 08 02 A6 */	mflr r0
/* 80015E28 00011DA8  39 00 00 00 */	li r8, 0x0
/* 80015E2C 00011DAC  90 01 00 04 */	stw r0, 0x4(r1)
/* 80015E30 00011DB0  38 A0 00 00 */	li r5, 0x0
/* 80015E34 00011DB4  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80015E38 00011DB8  A0 C3 00 00 */	lhz r6, 0x0(r3)
/* 80015E3C 00011DBC  48 00 00 38 */	b .L_80015E74
.L_80015E40:
/* 80015E40 00011DC0  80 E3 00 04 */	lwz r7, 0x4(r3)
/* 80015E44 00011DC4  7C 07 28 2E */	lwzx r0, r7, r5
/* 80015E48 00011DC8  28 00 00 00 */	cmplwi r0, 0x0
/* 80015E4C 00011DCC  40 82 00 20 */	bne .L_80015E6C
/* 80015E50 00011DD0  55 00 13 BA */	clrlslwi r0, r8, 16, 2
/* 80015E54 00011DD4  7C 87 01 2E */	stwx r4, r7, r0
/* 80015E58 00011DD8  A0 83 00 02 */	lhz r4, 0x2(r3)
/* 80015E5C 00011DDC  38 04 00 01 */	addi r0, r4, 0x1
/* 80015E60 00011DE0  B0 03 00 02 */	sth r0, 0x2(r3)
/* 80015E64 00011DE4  7D 03 43 78 */	mr r3, r8
/* 80015E68 00011DE8  48 00 00 30 */	b .L_80015E98
.L_80015E6C:
/* 80015E6C 00011DEC  38 A5 00 04 */	addi r5, r5, 0x4
/* 80015E70 00011DF0  39 08 00 01 */	addi r8, r8, 0x1
.L_80015E74:
/* 80015E74 00011DF4  55 00 04 3E */	clrlwi r0, r8, 16
/* 80015E78 00011DF8  7C 00 30 40 */	cmplw r0, r6
/* 80015E7C 00011DFC  41 80 FF C4 */	blt .L_80015E40
/* 80015E80 00011E00  3C 60 80 06 */	lis r3, lbl_800669C8@ha
/* 80015E84 00011E04  4C C6 31 82 */	crclr 4*cr1+eq
/* 80015E88 00011E08  38 63 69 C8 */	addi r3, r3, lbl_800669C8@l
/* 80015E8C 00011E0C  48 01 3D 59 */	bl OSReport
/* 80015E90 00011E10  3C 60 00 01 */	lis r3, 0x1
/* 80015E94 00011E14  38 63 FF FF */	addi r3, r3, -0x1
.L_80015E98:
/* 80015E98 00011E18  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80015E9C 00011E1C  38 21 00 08 */	addi r1, r1, 0x8
/* 80015EA0 00011E20  7C 08 03 A6 */	mtlr r0
/* 80015EA4 00011E24  4E 80 00 20 */	blr
.endfn AddObject__8DGObjManFP8DGObject

.fn GetObject__8DGObjManFUs, global
/* 80015EA8 00011E28  A0 03 00 00 */	lhz r0, 0x0(r3)
/* 80015EAC 00011E2C  54 84 04 3E */	clrlwi r4, r4, 16
/* 80015EB0 00011E30  7C 04 00 40 */	cmplw r4, r0
/* 80015EB4 00011E34  40 80 00 14 */	bge .L_80015EC8
/* 80015EB8 00011E38  80 63 00 04 */	lwz r3, 0x4(r3)
/* 80015EBC 00011E3C  54 80 10 3A */	slwi r0, r4, 2
/* 80015EC0 00011E40  7C 63 00 2E */	lwzx r3, r3, r0
/* 80015EC4 00011E44  4E 80 00 20 */	blr
.L_80015EC8:
/* 80015EC8 00011E48  38 60 00 00 */	li r3, 0x0
/* 80015ECC 00011E4C  4E 80 00 20 */	blr
.endfn GetObject__8DGObjManFUs

.fn AttachObject__8DGObjManFUs, global
/* 80015ED0 00011E50  7C 08 02 A6 */	mflr r0
/* 80015ED4 00011E54  90 01 00 04 */	stw r0, 0x4(r1)
/* 80015ED8 00011E58  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80015EDC 00011E5C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80015EE0 00011E60  7C 9F 23 78 */	mr r31, r4
/* 80015EE4 00011E64  54 84 04 3E */	clrlwi r4, r4, 16
/* 80015EE8 00011E68  A0 03 00 00 */	lhz r0, 0x0(r3)
/* 80015EEC 00011E6C  7C 04 00 40 */	cmplw r4, r0
/* 80015EF0 00011E70  40 80 00 14 */	bge .L_80015F04
/* 80015EF4 00011E74  80 63 00 04 */	lwz r3, 0x4(r3)
/* 80015EF8 00011E78  54 80 10 3A */	slwi r0, r4, 2
/* 80015EFC 00011E7C  7C 03 00 2E */	lwzx r0, r3, r0
/* 80015F00 00011E80  48 00 00 08 */	b .L_80015F08
.L_80015F04:
/* 80015F04 00011E84  38 00 00 00 */	li r0, 0x0
.L_80015F08:
/* 80015F08 00011E88  28 00 00 00 */	cmplwi r0, 0x0
/* 80015F0C 00011E8C  7C 03 03 78 */	mr r3, r0
/* 80015F10 00011E90  41 82 00 10 */	beq .L_80015F20
/* 80015F14 00011E94  4B FF F9 45 */	bl IncRefer__8DGObjectFv
/* 80015F18 00011E98  7F E3 FB 78 */	mr r3, r31
/* 80015F1C 00011E9C  48 00 00 1C */	b .L_80015F38
.L_80015F20:
/* 80015F20 00011EA0  3C 60 80 06 */	lis r3, lbl_800669EC@ha
/* 80015F24 00011EA4  4C C6 31 82 */	crclr 4*cr1+eq
/* 80015F28 00011EA8  38 63 69 EC */	addi r3, r3, lbl_800669EC@l
/* 80015F2C 00011EAC  48 01 3C B9 */	bl OSReport
/* 80015F30 00011EB0  3C 60 00 01 */	lis r3, 0x1
/* 80015F34 00011EB4  38 63 FF FF */	addi r3, r3, -0x1
.L_80015F38:
/* 80015F38 00011EB8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80015F3C 00011EBC  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80015F40 00011EC0  38 21 00 18 */	addi r1, r1, 0x18
/* 80015F44 00011EC4  7C 08 03 A6 */	mtlr r0
/* 80015F48 00011EC8  4E 80 00 20 */	blr
.endfn AttachObject__8DGObjManFUs

.fn DetachObject__8DGObjManFUs, global
/* 80015F4C 00011ECC  7C 08 02 A6 */	mflr r0
/* 80015F50 00011ED0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80015F54 00011ED4  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80015F58 00011ED8  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80015F5C 00011EDC  3B E4 00 00 */	addi r31, r4, 0x0
/* 80015F60 00011EE0  54 84 04 3E */	clrlwi r4, r4, 16
/* 80015F64 00011EE4  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80015F68 00011EE8  3B C3 00 00 */	addi r30, r3, 0x0
/* 80015F6C 00011EEC  A0 03 00 00 */	lhz r0, 0x0(r3)
/* 80015F70 00011EF0  7C 04 00 40 */	cmplw r4, r0
/* 80015F74 00011EF4  40 80 00 14 */	bge .L_80015F88
/* 80015F78 00011EF8  80 7E 00 04 */	lwz r3, 0x4(r30)
/* 80015F7C 00011EFC  54 80 10 3A */	slwi r0, r4, 2
/* 80015F80 00011F00  7C 03 00 2E */	lwzx r0, r3, r0
/* 80015F84 00011F04  48 00 00 08 */	b .L_80015F8C
.L_80015F88:
/* 80015F88 00011F08  38 00 00 00 */	li r0, 0x0
.L_80015F8C:
/* 80015F8C 00011F0C  28 00 00 00 */	cmplwi r0, 0x0
/* 80015F90 00011F10  7C 03 03 78 */	mr r3, r0
/* 80015F94 00011F14  41 82 00 5C */	beq .L_80015FF0
/* 80015F98 00011F18  4B FF F9 39 */	bl DecRefer__8DGObjectFv
/* 80015F9C 00011F1C  54 60 04 3F */	clrlwi. r0, r3, 16
/* 80015FA0 00011F20  40 82 00 60 */	bne .L_80016000
/* 80015FA4 00011F24  A0 1E 00 00 */	lhz r0, 0x0(r30)
/* 80015FA8 00011F28  57 E4 04 3E */	clrlwi r4, r31, 16
/* 80015FAC 00011F2C  7C 04 00 40 */	cmplw r4, r0
/* 80015FB0 00011F30  40 80 00 50 */	bge .L_80016000
/* 80015FB4 00011F34  80 7E 00 04 */	lwz r3, 0x4(r30)
/* 80015FB8 00011F38  54 9F 10 3A */	slwi r31, r4, 2
/* 80015FBC 00011F3C  7C 63 F8 2E */	lwzx r3, r3, r31
/* 80015FC0 00011F40  28 03 00 00 */	cmplwi r3, 0x0
/* 80015FC4 00011F44  41 82 00 3C */	beq .L_80016000
/* 80015FC8 00011F48  41 82 00 18 */	beq .L_80015FE0
/* 80015FCC 00011F4C  38 80 00 01 */	li r4, 0x1
/* 80015FD0 00011F50  4B FF E0 25 */	bl __dt__8DGObjectFv
/* 80015FD4 00011F54  80 7E 00 04 */	lwz r3, 0x4(r30)
/* 80015FD8 00011F58  38 00 00 00 */	li r0, 0x0
/* 80015FDC 00011F5C  7C 03 F9 2E */	stwx r0, r3, r31
.L_80015FE0:
/* 80015FE0 00011F60  A0 7E 00 02 */	lhz r3, 0x2(r30)
/* 80015FE4 00011F64  38 03 FF FF */	addi r0, r3, -0x1
/* 80015FE8 00011F68  B0 1E 00 02 */	sth r0, 0x2(r30)
/* 80015FEC 00011F6C  48 00 00 14 */	b .L_80016000
.L_80015FF0:
/* 80015FF0 00011F70  3C 60 80 06 */	lis r3, lbl_80066A0C@ha
/* 80015FF4 00011F74  4C C6 31 82 */	crclr 4*cr1+eq
/* 80015FF8 00011F78  38 63 6A 0C */	addi r3, r3, lbl_80066A0C@l
/* 80015FFC 00011F7C  48 01 3B E9 */	bl OSReport
.L_80016000:
/* 80016000 00011F80  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80016004 00011F84  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80016008 00011F88  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8001600C 00011F8C  7C 08 03 A6 */	mtlr r0
/* 80016010 00011F90  38 21 00 18 */	addi r1, r1, 0x18
/* 80016014 00011F94  4E 80 00 20 */	blr
.endfn DetachObject__8DGObjManFUs

.section .data, "wa"  # 0x80065000 - 0x8006D1C0 ; 0x000081C0

.balign 8

.obj lbl_800669C8, local
	.asciz "Error DGObjMan::AddObject Faluse\n"
	.balign 4
.endobj lbl_800669C8

.obj lbl_800669EC, local
	.asciz "Error DGObjMan::AttachObject\n"
	.balign 4
.endobj lbl_800669EC

.obj lbl_80066A0C, local
	.asciz "Error DGObjMan::DetachObject\n"
	.balign 4
	.4byte 0
.endobj lbl_80066A0C
