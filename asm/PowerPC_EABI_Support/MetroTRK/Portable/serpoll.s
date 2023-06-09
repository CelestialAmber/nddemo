.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn TRKTestForPacket, global
/* 8005B530 000574B0  7C 08 02 A6 */	mflr r0
/* 8005B534 000574B4  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005B538 000574B8  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8005B53C 000574BC  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8005B540 000574C0  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8005B544 000574C4  48 00 39 55 */	bl TRKPollUART
/* 8005B548 000574C8  7C 7E 1B 79 */	mr. r30, r3
/* 8005B54C 000574CC  40 81 00 88 */	ble .L_8005B5D4
/* 8005B550 000574D0  38 61 00 08 */	addi r3, r1, 0x8
/* 8005B554 000574D4  38 81 00 0C */	addi r4, r1, 0xc
/* 8005B558 000574D8  4B FF F8 11 */	bl TRKGetFreeBuffer
/* 8005B55C 000574DC  2C 1E 08 80 */	cmpwi r30, 0x880
/* 8005B560 000574E0  40 81 00 4C */	ble .L_8005B5AC
/* 8005B564 000574E4  48 00 00 2C */	b .L_8005B590
.L_8005B568:
/* 8005B568 000574E8  2C 1E 08 80 */	cmpwi r30, 0x880
/* 8005B56C 000574EC  40 81 00 0C */	ble .L_8005B578
/* 8005B570 000574F0  3B E0 08 80 */	li r31, 0x880
/* 8005B574 000574F4  48 00 00 08 */	b .L_8005B57C
.L_8005B578:
/* 8005B578 000574F8  7F DF F3 78 */	mr r31, r30
.L_8005B57C:
/* 8005B57C 000574FC  80 61 00 0C */	lwz r3, 0xc(r1)
/* 8005B580 00057500  38 9F 00 00 */	addi r4, r31, 0x0
/* 8005B584 00057504  38 63 00 10 */	addi r3, r3, 0x10
/* 8005B588 00057508  48 00 39 41 */	bl TRKReadUARTN
/* 8005B58C 0005750C  7F DF F0 50 */	subf r30, r31, r30
.L_8005B590:
/* 8005B590 00057510  2C 1E 00 00 */	cmpwi r30, 0x0
/* 8005B594 00057514  41 81 FF D4 */	bgt .L_8005B568
/* 8005B598 00057518  80 61 00 0C */	lwz r3, 0xc(r1)
/* 8005B59C 0005751C  38 80 00 FF */	li r4, 0xff
/* 8005B5A0 00057520  38 A0 00 06 */	li r5, 0x6
/* 8005B5A4 00057524  48 00 02 D9 */	bl TRKStandardACK
/* 8005B5A8 00057528  48 00 00 2C */	b .L_8005B5D4
.L_8005B5AC:
/* 8005B5AC 0005752C  80 61 00 0C */	lwz r3, 0xc(r1)
/* 8005B5B0 00057530  38 9E 00 00 */	addi r4, r30, 0x0
/* 8005B5B4 00057534  38 63 00 10 */	addi r3, r3, 0x10
/* 8005B5B8 00057538  48 00 39 11 */	bl TRKReadUARTN
/* 8005B5BC 0005753C  2C 03 00 00 */	cmpwi r3, 0x0
/* 8005B5C0 00057540  40 82 00 14 */	bne .L_8005B5D4
/* 8005B5C4 00057544  80 61 00 0C */	lwz r3, 0xc(r1)
/* 8005B5C8 00057548  93 C3 00 08 */	stw r30, 0x8(r3)
/* 8005B5CC 0005754C  80 61 00 08 */	lwz r3, 0x8(r1)
/* 8005B5D0 00057550  48 00 00 18 */	b .L_8005B5E8
.L_8005B5D4:
/* 8005B5D4 00057554  80 61 00 08 */	lwz r3, 0x8(r1)
/* 8005B5D8 00057558  2C 03 FF FF */	cmpwi r3, -0x1
/* 8005B5DC 0005755C  41 82 00 08 */	beq .L_8005B5E4
/* 8005B5E0 00057560  4B FF F8 51 */	bl TRKReleaseBuffer
.L_8005B5E4:
/* 8005B5E4 00057564  38 60 FF FF */	li r3, -0x1
.L_8005B5E8:
/* 8005B5E8 00057568  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8005B5EC 0005756C  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8005B5F0 00057570  38 21 00 18 */	addi r1, r1, 0x18
/* 8005B5F4 00057574  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005B5F8 00057578  7C 08 03 A6 */	mtlr r0
/* 8005B5FC 0005757C  4E 80 00 20 */	blr
.endfn TRKTestForPacket

.fn TRKGetInput, global
/* 8005B600 00057580  7C 08 02 A6 */	mflr r0
/* 8005B604 00057584  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005B608 00057588  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8005B60C 0005758C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8005B610 00057590  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8005B614 00057594  4B FF FF 1D */	bl TRKTestForPacket
/* 8005B618 00057598  3B C3 00 00 */	addi r30, r3, 0x0
/* 8005B61C 0005759C  2C 1E FF FF */	cmpwi r30, -0x1
/* 8005B620 000575A0  41 82 00 44 */	beq .L_8005B664
/* 8005B624 000575A4  7F C3 F3 78 */	mr r3, r30
/* 8005B628 000575A8  4B FF F7 DD */	bl TRKGetBuffer
/* 8005B62C 000575AC  3B E3 00 00 */	addi r31, r3, 0x0
/* 8005B630 000575B0  38 80 00 00 */	li r4, 0x0
/* 8005B634 000575B4  4B FF F8 A5 */	bl TRKSetBufferPosition
/* 8005B638 000575B8  38 7F 00 00 */	addi r3, r31, 0x0
/* 8005B63C 000575BC  38 81 00 08 */	addi r4, r1, 0x8
/* 8005B640 000575C0  4B FF FC 1D */	bl TRKReadBuffer1_ui8
/* 8005B644 000575C4  88 01 00 08 */	lbz r0, 0x8(r1)
/* 8005B648 000575C8  28 00 00 80 */	cmplwi r0, 0x80
/* 8005B64C 000575CC  40 80 00 10 */	bge .L_8005B65C
/* 8005B650 000575D0  7F C3 F3 78 */	mr r3, r30
/* 8005B654 000575D4  48 00 00 29 */	bl TRKProcessInput
/* 8005B658 000575D8  48 00 00 0C */	b .L_8005B664
.L_8005B65C:
/* 8005B65C 000575DC  7F C3 F3 78 */	mr r3, r30
/* 8005B660 000575E0  4B FF F7 D1 */	bl TRKReleaseBuffer
.L_8005B664:
/* 8005B664 000575E4  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8005B668 000575E8  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8005B66C 000575EC  38 21 00 18 */	addi r1, r1, 0x18
/* 8005B670 000575F0  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005B674 000575F4  7C 08 03 A6 */	mtlr r0
/* 8005B678 000575F8  4E 80 00 20 */	blr
.endfn TRKGetInput

.fn TRKProcessInput, global
/* 8005B67C 000575FC  7C 08 02 A6 */	mflr r0
/* 8005B680 00057600  38 80 00 02 */	li r4, 0x2
/* 8005B684 00057604  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005B688 00057608  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8005B68C 0005760C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8005B690 00057610  3B E3 00 00 */	addi r31, r3, 0x0
/* 8005B694 00057614  38 61 00 08 */	addi r3, r1, 0x8
/* 8005B698 00057618  4B FF F4 59 */	bl TRKConstructEvent
/* 8005B69C 0005761C  3C 60 80 0B */	lis r3, gTRKFramingState@ha
/* 8005B6A0 00057620  93 E1 00 10 */	stw r31, 0x10(r1)
/* 8005B6A4 00057624  38 83 82 C0 */	addi r4, r3, gTRKFramingState@l
/* 8005B6A8 00057628  38 61 00 08 */	addi r3, r1, 0x8
/* 8005B6AC 0005762C  38 00 FF FF */	li r0, -0x1
/* 8005B6B0 00057630  90 04 00 00 */	stw r0, 0x0(r4)
/* 8005B6B4 00057634  4B FF F3 5D */	bl TRKPostEvent
/* 8005B6B8 00057638  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8005B6BC 0005763C  38 21 00 18 */	addi r1, r1, 0x18
/* 8005B6C0 00057640  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005B6C4 00057644  7C 08 03 A6 */	mtlr r0
/* 8005B6C8 00057648  4E 80 00 20 */	blr
.endfn TRKProcessInput

.fn TRKInitializeSerialHandler, global
/* 8005B6CC 0005764C  3C 60 80 0B */	lis r3, gTRKFramingState@ha
/* 8005B6D0 00057650  38 83 82 C0 */	addi r4, r3, gTRKFramingState@l
/* 8005B6D4 00057654  38 00 FF FF */	li r0, -0x1
/* 8005B6D8 00057658  90 04 00 00 */	stw r0, 0x0(r4)
/* 8005B6DC 0005765C  38 00 00 00 */	li r0, 0x0
/* 8005B6E0 00057660  38 60 00 00 */	li r3, 0x0
/* 8005B6E4 00057664  98 04 00 08 */	stb r0, 0x8(r4)
/* 8005B6E8 00057668  90 04 00 0C */	stw r0, 0xc(r4)
/* 8005B6EC 0005766C  4E 80 00 20 */	blr
.endfn TRKInitializeSerialHandler

.fn TRKTerminateSerialHandler, global
/* 8005B6F0 00057670  38 60 00 00 */	li r3, 0x0
/* 8005B6F4 00057674  4E 80 00 20 */	blr
.endfn TRKTerminateSerialHandler

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80

.balign 8

.obj gTRKFramingState, local
	.skip 0x14
.endobj gTRKFramingState

.obj gTRKInputPendingPtr, global
	.skip 0x4
.endobj gTRKInputPendingPtr
