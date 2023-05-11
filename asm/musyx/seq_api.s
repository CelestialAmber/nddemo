.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740


.global sndSeqGetValid
sndSeqGetValid:
/* 80047BE8 00043B68  7C 08 02 A6 */	mflr r0
/* 80047BEC 00043B6C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80047BF0 00043B70  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80047BF4 00043B74  4B FF A0 01 */	bl seqGetPrivateId
/* 80047BF8 00043B78  20 63 FF FF */	subfic r3, r3, -0x1
/* 80047BFC 00043B7C  30 03 FF FF */	addic r0, r3, -0x1
/* 80047C00 00043B80  7C 60 19 10 */	subfe r3, r0, r3
/* 80047C04 00043B84  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80047C08 00043B88  38 21 00 08 */	addi r1, r1, 0x8
/* 80047C0C 00043B8C  7C 08 03 A6 */	mtlr r0
/* 80047C10 00043B90  4E 80 00 20 */	blr

.global sndSeqSpeed
sndSeqSpeed:
/* 80047C14 00043B94  7C 08 02 A6 */	mflr r0
/* 80047C18 00043B98  90 01 00 04 */	stw r0, 0x4(r1)
/* 80047C1C 00043B9C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80047C20 00043BA0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80047C24 00043BA4  3B E4 00 00 */	addi r31, r4, 0x0
/* 80047C28 00043BA8  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80047C2C 00043BAC  3B C3 00 00 */	addi r30, r3, 0x0
/* 80047C30 00043BB0  48 01 14 21 */	bl hwDisableIrq
/* 80047C34 00043BB4  38 7E 00 00 */	addi r3, r30, 0x0
/* 80047C38 00043BB8  38 9F 00 00 */	addi r4, r31, 0x0
/* 80047C3C 00043BBC  4B FF AF 2D */	bl seqSpeed
/* 80047C40 00043BC0  48 01 13 D9 */	bl hwEnableIrq
/* 80047C44 00043BC4  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80047C48 00043BC8  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80047C4C 00043BCC  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 80047C50 00043BD0  7C 08 03 A6 */	mtlr r0
/* 80047C54 00043BD4  38 21 00 18 */	addi r1, r1, 0x18
/* 80047C58 00043BD8  4E 80 00 20 */	blr

.global sndSeqContinue
sndSeqContinue:
/* 80047C5C 00043BDC  7C 08 02 A6 */	mflr r0
/* 80047C60 00043BE0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80047C64 00043BE4  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80047C68 00043BE8  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80047C6C 00043BEC  7C 7F 1B 78 */	mr r31, r3
/* 80047C70 00043BF0  48 01 13 E1 */	bl hwDisableIrq
/* 80047C74 00043BF4  7F E3 FB 78 */	mr r3, r31
/* 80047C78 00043BF8  4B FF AF CD */	bl seqContinue
/* 80047C7C 00043BFC  48 01 13 9D */	bl hwEnableIrq
/* 80047C80 00043C00  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80047C84 00043C04  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80047C88 00043C08  38 21 00 18 */	addi r1, r1, 0x18
/* 80047C8C 00043C0C  7C 08 03 A6 */	mtlr r0
/* 80047C90 00043C10  4E 80 00 20 */	blr

.global sndSeqMute
sndSeqMute:
/* 80047C94 00043C14  7C 08 02 A6 */	mflr r0
/* 80047C98 00043C18  90 01 00 04 */	stw r0, 0x4(r1)
/* 80047C9C 00043C1C  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80047CA0 00043C20  93 E1 00 24 */	stw r31, 0x24(r1)
/* 80047CA4 00043C24  3B E5 00 00 */	addi r31, r5, 0x0
/* 80047CA8 00043C28  93 C1 00 20 */	stw r30, 0x20(r1)
/* 80047CAC 00043C2C  3B C4 00 00 */	addi r30, r4, 0x0
/* 80047CB0 00043C30  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 80047CB4 00043C34  3B A3 00 00 */	addi r29, r3, 0x0
/* 80047CB8 00043C38  48 01 13 99 */	bl hwDisableIrq
/* 80047CBC 00043C3C  38 7D 00 00 */	addi r3, r29, 0x0
/* 80047CC0 00043C40  38 9E 00 00 */	addi r4, r30, 0x0
/* 80047CC4 00043C44  38 BF 00 00 */	addi r5, r31, 0x0
/* 80047CC8 00043C48  4B FF B0 89 */	bl seqMute
/* 80047CCC 00043C4C  48 01 13 4D */	bl hwEnableIrq
/* 80047CD0 00043C50  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80047CD4 00043C54  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 80047CD8 00043C58  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 80047CDC 00043C5C  7C 08 03 A6 */	mtlr r0
/* 80047CE0 00043C60  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 80047CE4 00043C64  38 21 00 28 */	addi r1, r1, 0x28
/* 80047CE8 00043C68  4E 80 00 20 */	blr

.global sndSeqVolume
sndSeqVolume:
/* 80047CEC 00043C6C  7C 08 02 A6 */	mflr r0
/* 80047CF0 00043C70  90 01 00 04 */	stw r0, 0x4(r1)
/* 80047CF4 00043C74  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80047CF8 00043C78  93 E1 00 24 */	stw r31, 0x24(r1)
/* 80047CFC 00043C7C  3B E6 00 00 */	addi r31, r6, 0x0
/* 80047D00 00043C80  93 C1 00 20 */	stw r30, 0x20(r1)
/* 80047D04 00043C84  3B C5 00 00 */	addi r30, r5, 0x0
/* 80047D08 00043C88  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 80047D0C 00043C8C  3B A4 00 00 */	addi r29, r4, 0x0
/* 80047D10 00043C90  93 81 00 18 */	stw r28, 0x18(r1)
/* 80047D14 00043C94  3B 83 00 00 */	addi r28, r3, 0x0
/* 80047D18 00043C98  48 01 13 39 */	bl hwDisableIrq
/* 80047D1C 00043C9C  38 7C 00 00 */	addi r3, r28, 0x0
/* 80047D20 00043CA0  38 9D 00 00 */	addi r4, r29, 0x0
/* 80047D24 00043CA4  38 BE 00 00 */	addi r5, r30, 0x0
/* 80047D28 00043CA8  38 DF 00 00 */	addi r6, r31, 0x0
/* 80047D2C 00043CAC  4B FF B0 D9 */	bl seqVolume
/* 80047D30 00043CB0  48 01 12 E9 */	bl hwEnableIrq
/* 80047D34 00043CB4  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80047D38 00043CB8  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 80047D3C 00043CBC  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 80047D40 00043CC0  7C 08 03 A6 */	mtlr r0
/* 80047D44 00043CC4  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 80047D48 00043CC8  83 81 00 18 */	lwz r28, 0x18(r1)
/* 80047D4C 00043CCC  38 21 00 28 */	addi r1, r1, 0x28
/* 80047D50 00043CD0  4E 80 00 20 */	blr

.global seqGetMIDIPriority
seqGetMIDIPriority:
/* 80047D54 00043CD4  3C A0 80 09 */	lis r5, seqMIDIPriority@ha
/* 80047D58 00043CD8  54 63 2C F4 */	clrlslwi r3, r3, 24, 5
/* 80047D5C 00043CDC  38 05 E7 78 */	addi r0, r5, seqMIDIPriority@l
/* 80047D60 00043CE0  7C 60 1A 14 */	add r3, r0, r3
/* 80047D64 00043CE4  54 80 0D FC */	clrlslwi r0, r4, 24, 1
/* 80047D68 00043CE8  7C 63 02 14 */	add r3, r3, r0
/* 80047D6C 00043CEC  A0 63 00 00 */	lhz r3, 0x0(r3)
/* 80047D70 00043CF0  4E 80 00 20 */	blr

.section extab_, "wa"  # 0x80005520 - 0x80005BC0


lbl_80005630:
	.4byte 0x00080000
	.4byte 0

lbl_80005638:
	.4byte 0x10080000
	.4byte 0

lbl_80005640:
	.4byte 0x08080000
	.4byte 0

lbl_80005648:
	.4byte 0x18080000
	.4byte 0

lbl_80005650:
	.4byte 0x20080000
	.4byte 0

.section extabindex_, "wa"  # 0x80005BC0 - 0x800065A0

lbl_80005D58:
	.4byte sndSeqGetValid
	.4byte 0x0000002C
	.4byte lbl_80005630

lbl_80005D64:
	.4byte sndSeqSpeed
	.4byte 0x00000048
	.4byte lbl_80005638

lbl_80005D70:
	.4byte sndSeqContinue
	.4byte 0x00000038
	.4byte lbl_80005640

lbl_80005D7C:
	.4byte sndSeqMute
	.4byte 0x00000058
	.4byte lbl_80005648

lbl_80005D88:
	.4byte sndSeqVolume
	.4byte 0x00000068
	.4byte lbl_80005650
