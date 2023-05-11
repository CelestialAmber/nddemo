.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740


.fn sndFXCtrl14, global
/* 80047D74 00043CF4  7C 08 02 A6 */	mflr r0
/* 80047D78 00043CF8  90 01 00 04 */	stw r0, 0x4(r1)
/* 80047D7C 00043CFC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80047D80 00043D00  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80047D84 00043D04  3B E5 00 00 */	addi r31, r5, 0x0
/* 80047D88 00043D08  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80047D8C 00043D0C  3B C4 00 00 */	addi r30, r4, 0x0
/* 80047D90 00043D10  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80047D94 00043D14  3B A3 00 00 */	addi r29, r3, 0x0
/* 80047D98 00043D18  48 01 12 B9 */	bl hwDisableIrq
/* 80047D9C 00043D1C  38 7D 00 00 */	addi r3, r29, 0x0
/* 80047DA0 00043D20  38 9E 00 00 */	addi r4, r30, 0x0
/* 80047DA4 00043D24  38 BF 00 00 */	addi r5, r31, 0x0
/* 80047DA8 00043D28  4B FF F2 4D */	bl synthFXSetCtrl14
/* 80047DAC 00043D2C  7C 7F 1B 78 */	mr r31, r3
/* 80047DB0 00043D30  48 01 12 69 */	bl hwEnableIrq
/* 80047DB4 00043D34  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80047DB8 00043D38  7F E3 FB 78 */	mr r3, r31
/* 80047DBC 00043D3C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80047DC0 00043D40  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80047DC4 00043D44  7C 08 03 A6 */	mtlr r0
/* 80047DC8 00043D48  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80047DCC 00043D4C  38 21 00 20 */	addi r1, r1, 0x20
/* 80047DD0 00043D50  4E 80 00 20 */	blr
.endfn sndFXCtrl14

.fn sndFXStartEx, global
/* 80047DD4 00043D54  7C 08 02 A6 */	mflr r0
/* 80047DD8 00043D58  90 01 00 04 */	stw r0, 0x4(r1)
/* 80047DDC 00043D5C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80047DE0 00043D60  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80047DE4 00043D64  3B E6 00 00 */	addi r31, r6, 0x0
/* 80047DE8 00043D68  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80047DEC 00043D6C  3B C5 00 00 */	addi r30, r5, 0x0
/* 80047DF0 00043D70  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80047DF4 00043D74  3B A4 00 00 */	addi r29, r4, 0x0
/* 80047DF8 00043D78  93 81 00 10 */	stw r28, 0x10(r1)
/* 80047DFC 00043D7C  3B 83 00 00 */	addi r28, r3, 0x0
/* 80047E00 00043D80  48 01 12 51 */	bl hwDisableIrq
/* 80047E04 00043D84  57 E0 0D FC */	clrlslwi r0, r31, 24, 1
/* 80047E08 00043D88  38 6D 87 34 */	addi r3, r13, synthITDDefault@sda21
/* 80047E0C 00043D8C  7C 63 02 14 */	add r3, r3, r0
/* 80047E10 00043D90  88 E3 00 01 */	lbz r7, 0x1(r3)
/* 80047E14 00043D94  38 7C 00 00 */	addi r3, r28, 0x0
/* 80047E18 00043D98  38 9D 00 00 */	addi r4, r29, 0x0
/* 80047E1C 00043D9C  38 BE 00 00 */	addi r5, r30, 0x0
/* 80047E20 00043DA0  38 DF 00 00 */	addi r6, r31, 0x0
/* 80047E24 00043DA4  4B FF EE E5 */	bl synthFXStart
/* 80047E28 00043DA8  7C 7F 1B 78 */	mr r31, r3
/* 80047E2C 00043DAC  48 01 11 ED */	bl hwEnableIrq
/* 80047E30 00043DB0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80047E34 00043DB4  7F E3 FB 78 */	mr r3, r31
/* 80047E38 00043DB8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80047E3C 00043DBC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80047E40 00043DC0  7C 08 03 A6 */	mtlr r0
/* 80047E44 00043DC4  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80047E48 00043DC8  83 81 00 10 */	lwz r28, 0x10(r1)
/* 80047E4C 00043DCC  38 21 00 20 */	addi r1, r1, 0x20
/* 80047E50 00043DD0  4E 80 00 20 */	blr
.endfn sndFXStartEx

.fn sndFXCheck, global
/* 80047E54 00043DD4  7C 08 02 A6 */	mflr r0
/* 80047E58 00043DD8  90 01 00 04 */	stw r0, 0x4(r1)
/* 80047E5C 00043DDC  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80047E60 00043DE0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80047E64 00043DE4  7C 7F 1B 78 */	mr r31, r3
/* 80047E68 00043DE8  48 00 6A 0D */	bl vidGetInternalId
/* 80047E6C 00043DEC  3C 03 00 01 */	addis r0, r3, 0x1
/* 80047E70 00043DF0  28 00 FF FF */	cmplwi r0, 0xffff
/* 80047E74 00043DF4  41 82 00 0C */	beq .L_80047E80
/* 80047E78 00043DF8  7F E3 FB 78 */	mr r3, r31
/* 80047E7C 00043DFC  48 00 00 08 */	b .L_80047E84
.L_80047E80:
/* 80047E80 00043E00  38 60 FF FF */	li r3, -0x1
.L_80047E84:
/* 80047E84 00043E04  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80047E88 00043E08  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80047E8C 00043E0C  38 21 00 18 */	addi r1, r1, 0x18
/* 80047E90 00043E10  7C 08 03 A6 */	mtlr r0
/* 80047E94 00043E14  4E 80 00 20 */	blr
.endfn sndFXCheck

.fn sndVolume, global
/* 80047E98 00043E18  7C 08 02 A6 */	mflr r0
/* 80047E9C 00043E1C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80047EA0 00043E20  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80047EA4 00043E24  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80047EA8 00043E28  3B E5 00 00 */	addi r31, r5, 0x0
/* 80047EAC 00043E2C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80047EB0 00043E30  3B C4 00 00 */	addi r30, r4, 0x0
/* 80047EB4 00043E34  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80047EB8 00043E38  3B A3 00 00 */	addi r29, r3, 0x0
/* 80047EBC 00043E3C  48 01 11 95 */	bl hwDisableIrq
/* 80047EC0 00043E40  38 7D 00 00 */	addi r3, r29, 0x0
/* 80047EC4 00043E44  38 9E 00 00 */	addi r4, r30, 0x0
/* 80047EC8 00043E48  38 BF 00 00 */	addi r5, r31, 0x0
/* 80047ECC 00043E4C  38 C0 00 00 */	li r6, 0x0
/* 80047ED0 00043E50  38 E0 FF FF */	li r7, -0x1
/* 80047ED4 00043E54  4B FF F3 19 */	bl synthVolume
/* 80047ED8 00043E58  48 01 11 41 */	bl hwEnableIrq
/* 80047EDC 00043E5C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80047EE0 00043E60  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80047EE4 00043E64  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80047EE8 00043E68  7C 08 03 A6 */	mtlr r0
/* 80047EEC 00043E6C  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80047EF0 00043E70  38 21 00 20 */	addi r1, r1, 0x20
/* 80047EF4 00043E74  4E 80 00 20 */	blr
.endfn sndVolume

.fn sndMasterVolume, global
/* 80047EF8 00043E78  7C 08 02 A6 */	mflr r0
/* 80047EFC 00043E7C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80047F00 00043E80  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80047F04 00043E84  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80047F08 00043E88  3B E6 00 00 */	addi r31, r6, 0x0
/* 80047F0C 00043E8C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80047F10 00043E90  3B C5 00 00 */	addi r30, r5, 0x0
/* 80047F14 00043E94  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80047F18 00043E98  3B A4 00 00 */	addi r29, r4, 0x0
/* 80047F1C 00043E9C  93 81 00 10 */	stw r28, 0x10(r1)
/* 80047F20 00043EA0  3B 83 00 00 */	addi r28, r3, 0x0
/* 80047F24 00043EA4  48 01 11 2D */	bl hwDisableIrq
/* 80047F28 00043EA8  57 C0 06 3F */	clrlwi. r0, r30, 24
/* 80047F2C 00043EAC  41 82 00 1C */	beq .L_80047F48
/* 80047F30 00043EB0  38 7C 00 00 */	addi r3, r28, 0x0
/* 80047F34 00043EB4  38 9D 00 00 */	addi r4, r29, 0x0
/* 80047F38 00043EB8  38 A0 00 15 */	li r5, 0x15
/* 80047F3C 00043EBC  38 C0 00 00 */	li r6, 0x0
/* 80047F40 00043EC0  38 E0 FF FF */	li r7, -0x1
/* 80047F44 00043EC4  4B FF F2 A9 */	bl synthVolume
.L_80047F48:
/* 80047F48 00043EC8  57 E0 06 3F */	clrlwi. r0, r31, 24
/* 80047F4C 00043ECC  41 82 00 1C */	beq .L_80047F68
/* 80047F50 00043ED0  38 7C 00 00 */	addi r3, r28, 0x0
/* 80047F54 00043ED4  38 9D 00 00 */	addi r4, r29, 0x0
/* 80047F58 00043ED8  38 A0 00 16 */	li r5, 0x16
/* 80047F5C 00043EDC  38 C0 00 00 */	li r6, 0x0
/* 80047F60 00043EE0  38 E0 FF FF */	li r7, -0x1
/* 80047F64 00043EE4  4B FF F2 89 */	bl synthVolume
.L_80047F68:
/* 80047F68 00043EE8  48 01 10 B1 */	bl hwEnableIrq
/* 80047F6C 00043EEC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80047F70 00043EF0  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80047F74 00043EF4  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80047F78 00043EF8  7C 08 03 A6 */	mtlr r0
/* 80047F7C 00043EFC  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80047F80 00043F00  83 81 00 10 */	lwz r28, 0x10(r1)
/* 80047F84 00043F04  38 21 00 20 */	addi r1, r1, 0x20
/* 80047F88 00043F08  4E 80 00 20 */	blr
.endfn sndMasterVolume

.fn sndSetAuxProcessingCallbacks, global
/* 80047F8C 00043F0C  7C 08 02 A6 */	mflr r0
/* 80047F90 00043F10  90 01 00 04 */	stw r0, 0x4(r1)
/* 80047F94 00043F14  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 80047F98 00043F18  BE C1 00 28 */	stmw r22, 0x28(r1)
/* 80047F9C 00043F1C  3B 23 00 00 */	addi r25, r3, 0x0
/* 80047FA0 00043F20  83 E1 00 58 */	lwz r31, 0x58(r1)
/* 80047FA4 00043F24  3B 44 00 00 */	addi r26, r4, 0x0
/* 80047FA8 00043F28  3B 65 00 00 */	addi r27, r5, 0x0
/* 80047FAC 00043F2C  3A C6 00 00 */	addi r22, r6, 0x0
/* 80047FB0 00043F30  3A E7 00 00 */	addi r23, r7, 0x0
/* 80047FB4 00043F34  3B 88 00 00 */	addi r28, r8, 0x0
/* 80047FB8 00043F38  3B A9 00 00 */	addi r29, r9, 0x0
/* 80047FBC 00043F3C  3B CA 00 00 */	addi r30, r10, 0x0
/* 80047FC0 00043F40  48 01 10 91 */	bl hwDisableIrq
/* 80047FC4 00043F44  28 1A 00 00 */	cmplwi r26, 0x0
/* 80047FC8 00043F48  41 82 00 54 */	beq .L_8004801C
/* 80047FCC 00043F4C  56 C0 06 3E */	clrlwi r0, r22, 24
/* 80047FD0 00043F50  28 00 00 FF */	cmplwi r0, 0xff
/* 80047FD4 00043F54  57 38 06 3E */	clrlwi r24, r25, 24
/* 80047FD8 00043F58  38 6D 87 48 */	addi r3, r13, synthAuxAMIDI@sda21
/* 80047FDC 00043F5C  7E C3 C1 AE */	stbx r22, r3, r24
/* 80047FE0 00043F60  41 82 00 64 */	beq .L_80048044
/* 80047FE4 00043F64  7E E3 BB 78 */	mr r3, r23
/* 80047FE8 00043F68  4B FF 9C 0D */	bl seqGetPrivateId
/* 80047FEC 00043F6C  3C A0 80 09 */	lis r5, synthAuxACallback@ha
/* 80047FF0 00043F70  38 CD 87 44 */	addi r6, r13, synthAuxAMIDISet@sda21
/* 80047FF4 00043F74  7C 66 C1 AE */	stbx r3, r6, r24
/* 80047FF8 00043F78  57 06 10 3A */	slwi r6, r24, 2
/* 80047FFC 00043F7C  38 05 F4 9C */	addi r0, r5, synthAuxACallback@l
/* 80048000 00043F80  7C 60 32 14 */	add r3, r0, r6
/* 80048004 00043F84  3C 80 80 09 */	lis r4, synthAuxAUser@ha
/* 80048008 00043F88  93 43 00 00 */	stw r26, 0x0(r3)
/* 8004800C 00043F8C  38 04 F4 8C */	addi r0, r4, synthAuxAUser@l
/* 80048010 00043F90  7C 60 32 14 */	add r3, r0, r6
/* 80048014 00043F94  93 63 00 00 */	stw r27, 0x0(r3)
/* 80048018 00043F98  48 00 00 2C */	b .L_80048044
.L_8004801C:
/* 8004801C 00043F9C  57 25 06 3E */	clrlwi r5, r25, 24
/* 80048020 00043FA0  3C 60 80 09 */	lis r3, synthAuxACallback@ha
/* 80048024 00043FA4  57 24 15 BA */	clrlslwi r4, r25, 24, 2
/* 80048028 00043FA8  38 03 F4 9C */	addi r0, r3, synthAuxACallback@l
/* 8004802C 00043FAC  7C 60 22 14 */	add r3, r0, r4
/* 80048030 00043FB0  38 00 00 00 */	li r0, 0x0
/* 80048034 00043FB4  90 03 00 00 */	stw r0, 0x0(r3)
/* 80048038 00043FB8  38 00 00 FF */	li r0, 0xff
/* 8004803C 00043FBC  38 6D 87 48 */	addi r3, r13, synthAuxAMIDI@sda21
/* 80048040 00043FC0  7C 03 29 AE */	stbx r0, r3, r5
.L_80048044:
/* 80048044 00043FC4  28 1C 00 00 */	cmplwi r28, 0x0
/* 80048048 00043FC8  41 82 00 54 */	beq .L_8004809C
/* 8004804C 00043FCC  57 C0 06 3E */	clrlwi r0, r30, 24
/* 80048050 00043FD0  28 00 00 FF */	cmplwi r0, 0xff
/* 80048054 00043FD4  57 38 06 3E */	clrlwi r24, r25, 24
/* 80048058 00043FD8  38 6D 87 40 */	addi r3, r13, synthAuxBMIDI@sda21
/* 8004805C 00043FDC  7F C3 C1 AE */	stbx r30, r3, r24
/* 80048060 00043FE0  41 82 00 64 */	beq .L_800480C4
/* 80048064 00043FE4  7F E3 FB 78 */	mr r3, r31
/* 80048068 00043FE8  4B FF 9B 8D */	bl seqGetPrivateId
/* 8004806C 00043FEC  3C A0 80 09 */	lis r5, synthAuxBCallback@ha
/* 80048070 00043FF0  38 CD 87 3C */	addi r6, r13, synthAuxBMIDISet@sda21
/* 80048074 00043FF4  7C 66 C1 AE */	stbx r3, r6, r24
/* 80048078 00043FF8  57 06 10 3A */	slwi r6, r24, 2
/* 8004807C 00043FFC  38 05 F4 BC */	addi r0, r5, synthAuxBCallback@l
/* 80048080 00044000  7C 60 32 14 */	add r3, r0, r6
/* 80048084 00044004  3C 80 80 09 */	lis r4, synthAuxBUser@ha
/* 80048088 00044008  93 83 00 00 */	stw r28, 0x0(r3)
/* 8004808C 0004400C  38 04 F4 AC */	addi r0, r4, synthAuxBUser@l
/* 80048090 00044010  7C 60 32 14 */	add r3, r0, r6
/* 80048094 00044014  93 A3 00 00 */	stw r29, 0x0(r3)
/* 80048098 00044018  48 00 00 2C */	b .L_800480C4
.L_8004809C:
/* 8004809C 0004401C  57 25 06 3E */	clrlwi r5, r25, 24
/* 800480A0 00044020  3C 60 80 09 */	lis r3, synthAuxBCallback@ha
/* 800480A4 00044024  57 24 15 BA */	clrlslwi r4, r25, 24, 2
/* 800480A8 00044028  38 03 F4 BC */	addi r0, r3, synthAuxBCallback@l
/* 800480AC 0004402C  7C 60 22 14 */	add r3, r0, r4
/* 800480B0 00044030  38 00 00 00 */	li r0, 0x0
/* 800480B4 00044034  90 03 00 00 */	stw r0, 0x0(r3)
/* 800480B8 00044038  38 00 00 FF */	li r0, 0xff
/* 800480BC 0004403C  38 6D 87 40 */	addi r3, r13, synthAuxBMIDI@sda21
/* 800480C0 00044040  7C 03 29 AE */	stbx r0, r3, r5
.L_800480C4:
/* 800480C4 00044044  38 79 00 00 */	addi r3, r25, 0x0
/* 800480C8 00044048  38 9A 00 00 */	addi r4, r26, 0x0
/* 800480CC 0004404C  38 BB 00 00 */	addi r5, r27, 0x0
/* 800480D0 00044050  38 DC 00 00 */	addi r6, r28, 0x0
/* 800480D4 00044054  38 FD 00 00 */	addi r7, r29, 0x0
/* 800480D8 00044058  48 00 FF 79 */	bl hwSetAUXProcessingCallbacks
/* 800480DC 0004405C  48 01 0F 3D */	bl hwEnableIrq
/* 800480E0 00044060  BA C1 00 28 */	lmw r22, 0x28(r1)
/* 800480E4 00044064  80 01 00 54 */	lwz r0, 0x54(r1)
/* 800480E8 00044068  38 21 00 50 */	addi r1, r1, 0x50
/* 800480EC 0004406C  7C 08 03 A6 */	mtlr r0
/* 800480F0 00044070  4E 80 00 20 */	blr
.endfn sndSetAuxProcessingCallbacks

.fn synthActivateStudio, global
/* 800480F4 00044074  7C 08 02 A6 */	mflr r0
/* 800480F8 00044078  90 01 00 04 */	stw r0, 0x4(r1)
/* 800480FC 0004407C  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80048100 00044080  93 E1 00 24 */	stw r31, 0x24(r1)
/* 80048104 00044084  3B E5 00 00 */	addi r31, r5, 0x0
/* 80048108 00044088  93 C1 00 20 */	stw r30, 0x20(r1)
/* 8004810C 0004408C  3B C4 00 00 */	addi r30, r4, 0x0
/* 80048110 00044090  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 80048114 00044094  3B A3 00 00 */	addi r29, r3, 0x0
/* 80048118 00044098  48 01 0F 39 */	bl hwDisableIrq
/* 8004811C 0004409C  57 A7 06 3E */	clrlwi r7, r29, 24
/* 80048120 000440A0  3C 80 80 09 */	lis r4, synthAuxACallback@ha
/* 80048124 000440A4  3C 60 80 09 */	lis r3, synthAuxBCallback@ha
/* 80048128 000440A8  57 A6 15 BA */	clrlslwi r6, r29, 24, 2
/* 8004812C 000440AC  38 84 F4 9C */	addi r4, r4, synthAuxACallback@l
/* 80048130 000440B0  38 03 F4 BC */	addi r0, r3, synthAuxBCallback@l
/* 80048134 000440B4  7C 64 32 14 */	add r3, r4, r6
/* 80048138 000440B8  38 A0 00 00 */	li r5, 0x0
/* 8004813C 000440BC  90 A3 00 00 */	stw r5, 0x0(r3)
/* 80048140 000440C0  7C 60 32 14 */	add r3, r0, r6
/* 80048144 000440C4  38 00 00 FF */	li r0, 0xff
/* 80048148 000440C8  90 A3 00 00 */	stw r5, 0x0(r3)
/* 8004814C 000440CC  38 8D 87 48 */	addi r4, r13, synthAuxAMIDI@sda21
/* 80048150 000440D0  38 6D 87 40 */	addi r3, r13, synthAuxBMIDI@sda21
/* 80048154 000440D4  7C 04 39 AE */	stbx r0, r4, r7
/* 80048158 000440D8  57 A6 0D FC */	clrlslwi r6, r29, 24, 1
/* 8004815C 000440DC  38 8D 87 34 */	addi r4, r13, synthITDDefault@sda21
/* 80048160 000440E0  7C 03 39 AE */	stbx r0, r3, r7
/* 80048164 000440E4  7C 64 32 14 */	add r3, r4, r6
/* 80048168 000440E8  98 A3 00 01 */	stb r5, 0x1(r3)
/* 8004816C 000440EC  7C A4 31 AE */	stbx r5, r4, r6
/* 80048170 000440F0  48 01 0E A9 */	bl hwEnableIrq
/* 80048174 000440F4  38 7D 00 00 */	addi r3, r29, 0x0
/* 80048178 000440F8  38 9E 00 00 */	addi r4, r30, 0x0
/* 8004817C 000440FC  38 BF 00 00 */	addi r5, r31, 0x0
/* 80048180 00044100  48 00 FE F9 */	bl hwActivateStudio
/* 80048184 00044104  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80048188 00044108  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 8004818C 0004410C  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 80048190 00044110  7C 08 03 A6 */	mtlr r0
/* 80048194 00044114  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 80048198 00044118  38 21 00 28 */	addi r1, r1, 0x28
/* 8004819C 0004411C  4E 80 00 20 */	blr
.endfn synthActivateStudio

.fn synthDeactivateStudio, global
/* 800481A0 00044120  7C 08 02 A6 */	mflr r0
/* 800481A4 00044124  90 01 00 04 */	stw r0, 0x4(r1)
/* 800481A8 00044128  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800481AC 0004412C  BF 61 00 14 */	stmw r27, 0x14(r1)
/* 800481B0 00044130  3B E3 00 00 */	addi r31, r3, 0x0
/* 800481B4 00044134  3C 60 80 09 */	lis r3, synthInfo@ha
/* 800481B8 00044138  57 FD 06 3E */	clrlwi r29, r31, 24
/* 800481BC 0004413C  3B C3 EC 38 */	addi r30, r3, synthInfo@l
/* 800481C0 00044140  3B 60 00 00 */	li r27, 0x0
/* 800481C4 00044144  3B 80 00 00 */	li r28, 0x0
/* 800481C8 00044148  48 00 00 58 */	b .L_80048220
.L_800481CC:
/* 800481CC 0004414C  80 0D 87 58 */	lwz r0, synthVoice@sda21(r13)
/* 800481D0 00044150  7C 80 E2 14 */	add r4, r0, r28
/* 800481D4 00044154  88 04 01 1F */	lbz r0, 0x11f(r4)
/* 800481D8 00044158  7C 1D 00 40 */	cmplw r29, r0
/* 800481DC 0004415C  40 82 00 3C */	bne .L_80048218
/* 800481E0 00044160  80 64 00 F4 */	lwz r3, 0xf4(r4)
/* 800481E4 00044164  3C 03 00 01 */	addis r0, r3, 0x1
/* 800481E8 00044168  28 00 FF FF */	cmplwi r0, 0xffff
/* 800481EC 0004416C  41 82 00 14 */	beq .L_80048200
/* 800481F0 00044170  80 64 00 F8 */	lwz r3, 0xf8(r4)
/* 800481F4 00044174  80 63 00 08 */	lwz r3, 0x8(r3)
/* 800481F8 00044178  48 00 72 B9 */	bl voiceKillSound
/* 800481FC 0004417C  48 00 00 1C */	b .L_80048218
.L_80048200:
/* 80048200 00044180  7F 63 DB 78 */	mr r3, r27
/* 80048204 00044184  48 00 F5 71 */	bl hwIsActive
/* 80048208 00044188  28 03 00 00 */	cmplwi r3, 0x0
/* 8004820C 0004418C  41 82 00 0C */	beq .L_80048218
/* 80048210 00044190  7F 63 DB 78 */	mr r3, r27
/* 80048214 00044194  48 00 FE 11 */	bl hwOff
.L_80048218:
/* 80048218 00044198  3B 9C 04 08 */	addi r28, r28, 0x408
/* 8004821C 0004419C  3B 7B 00 01 */	addi r27, r27, 0x1
.L_80048220:
/* 80048220 000441A0  88 1E 02 10 */	lbz r0, 0x210(r30)
/* 80048224 000441A4  7C 1B 00 40 */	cmplw r27, r0
/* 80048228 000441A8  41 80 FF A4 */	blt .L_800481CC
/* 8004822C 000441AC  48 01 0E 25 */	bl hwDisableIrq
/* 80048230 000441B0  57 E6 06 3E */	clrlwi r6, r31, 24
/* 80048234 000441B4  3C 80 80 09 */	lis r4, synthAuxACallback@ha
/* 80048238 000441B8  3C 60 80 09 */	lis r3, synthAuxBCallback@ha
/* 8004823C 000441BC  57 E5 15 BA */	clrlslwi r5, r31, 24, 2
/* 80048240 000441C0  38 84 F4 9C */	addi r4, r4, synthAuxACallback@l
/* 80048244 000441C4  38 03 F4 BC */	addi r0, r3, synthAuxBCallback@l
/* 80048248 000441C8  7C 64 2A 14 */	add r3, r4, r5
/* 8004824C 000441CC  38 80 00 00 */	li r4, 0x0
/* 80048250 000441D0  90 83 00 00 */	stw r4, 0x0(r3)
/* 80048254 000441D4  7C 60 2A 14 */	add r3, r0, r5
/* 80048258 000441D8  38 00 00 FF */	li r0, 0xff
/* 8004825C 000441DC  90 83 00 00 */	stw r4, 0x0(r3)
/* 80048260 000441E0  38 8D 87 48 */	addi r4, r13, synthAuxAMIDI@sda21
/* 80048264 000441E4  38 6D 87 40 */	addi r3, r13, synthAuxBMIDI@sda21
/* 80048268 000441E8  7C 04 31 AE */	stbx r0, r4, r6
/* 8004826C 000441EC  7C 03 31 AE */	stbx r0, r3, r6
/* 80048270 000441F0  48 01 0D A9 */	bl hwEnableIrq
/* 80048274 000441F4  7F E3 FB 78 */	mr r3, r31
/* 80048278 000441F8  48 00 FE 21 */	bl hwDeactivateStudio
/* 8004827C 000441FC  BB 61 00 14 */	lmw r27, 0x14(r1)
/* 80048280 00044200  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80048284 00044204  38 21 00 28 */	addi r1, r1, 0x28
/* 80048288 00044208  7C 08 03 A6 */	mtlr r0
/* 8004828C 0004420C  4E 80 00 20 */	blr
.endfn synthDeactivateStudio

.fn synthAddStudioInput, global
/* 80048290 00044210  7C 08 02 A6 */	mflr r0
/* 80048294 00044214  90 01 00 04 */	stw r0, 0x4(r1)
/* 80048298 00044218  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8004829C 0004421C  48 00 FE 1D */	bl hwAddInput
/* 800482A0 00044220  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800482A4 00044224  38 21 00 08 */	addi r1, r1, 0x8
/* 800482A8 00044228  7C 08 03 A6 */	mtlr r0
/* 800482AC 0004422C  4E 80 00 20 */	blr
.endfn synthAddStudioInput

.fn synthRemoveStudioInput, global
/* 800482B0 00044230  7C 08 02 A6 */	mflr r0
/* 800482B4 00044234  90 01 00 04 */	stw r0, 0x4(r1)
/* 800482B8 00044238  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 800482BC 0004423C  48 00 FE 31 */	bl hwRemoveInput
/* 800482C0 00044240  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800482C4 00044244  38 21 00 08 */	addi r1, r1, 0x8
/* 800482C8 00044248  7C 08 03 A6 */	mtlr r0
/* 800482CC 0004424C  4E 80 00 20 */	blr
.endfn synthRemoveStudioInput

.section extab_, "wa"  # 0x80005520 - 0x80005BC0


.obj lbl_80005658, local
	.4byte 0x18080000
	.4byte 0
.endobj lbl_80005658

.obj lbl_80005660, local
	.4byte 0x20080000
	.4byte 0
.endobj lbl_80005660

.obj lbl_80005668, local
	.4byte 0x08080000
	.4byte 0
.endobj lbl_80005668

.obj lbl_80005670, local
	.4byte 0x18080000
	.4byte 0
.endobj lbl_80005670

.obj lbl_80005678, local
	.4byte 0x20080000
	.4byte 0
.endobj lbl_80005678

.obj lbl_80005680, local
	.4byte 0x50080000
	.4byte 0
.endobj lbl_80005680

.obj lbl_80005688, local
	.4byte 0x18080000
	.4byte 0
.endobj lbl_80005688

.obj lbl_80005690, local
	.4byte 0x28080000
	.4byte 0
.endobj lbl_80005690

.obj lbl_80005698, local
	.4byte 0x00080000
	.4byte 0
.endobj lbl_80005698

.obj lbl_800056A0, local
	.4byte 0x00080000
	.4byte 0
.endobj lbl_800056A0

.section extabindex_, "wa"  # 0x80005BC0 - 0x800065A0


.obj lbl_80005D94, local
	.4byte sndFXCtrl14
	.4byte 0x00000060
	.4byte lbl_80005658
.endobj lbl_80005D94

.obj lbl_80005DA0, local
    .4byte sndFXStartEx
    .4byte 0x00000080
    .4byte lbl_80005660
.endobj lbl_80005DA0

.obj lbl_80005DAC, local
    .4byte sndFXCheck
    .4byte 0x00000044
    .4byte lbl_80005668
.endobj lbl_80005DAC

.obj lbl_80005DB8, local
    .4byte sndVolume
    .4byte 0x00000060
    .4byte lbl_80005670
.endobj lbl_80005DB8

.obj lbl_80005DC4, local
    .4byte sndMasterVolume
    .4byte 0x00000094
    .4byte lbl_80005678
.endobj lbl_80005DC4

.obj lbl_80005DD0, local
    .4byte sndSetAuxProcessingCallbacks
    .4byte 0x00000168
    .4byte lbl_80005680
.endobj lbl_80005DD0

.obj lbl_80005DDC, local
    .4byte synthActivateStudio
    .4byte 0x000000AC
    .4byte lbl_80005688
.endobj lbl_80005DDC

.obj lbl_80005DE8, local
    .4byte synthDeactivateStudio
    .4byte 0x000000F0
    .4byte lbl_80005690
.endobj lbl_80005DE8

.obj lbl_80005DF4, local
    .4byte synthAddStudioInput
    .4byte 0x00000020
    .4byte lbl_80005698
.endobj lbl_80005DF4

.obj lbl_80005E00, local
    .4byte synthRemoveStudioInput
    .4byte 0x00000020
    .4byte lbl_800056A0
.endobj lbl_80005E00
