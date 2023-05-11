.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740



.fn aramQueueCallback, local
/* 8005846C 000543EC  88 6D 88 7D */	lbz r3, aramQueueValid@sda21(r13)
/* 80058470 000543F0  38 03 FF FF */	addi r0, r3, -0x1
/* 80058474 000543F4  98 0D 88 7D */	stb r0, aramQueueValid@sda21(r13)
/* 80058478 000543F8  4E 80 00 20 */	blr
.endfn aramQueueCallback

.fn aramUploadData, global
/* 8005847C 000543FC  7C 08 02 A6 */	mflr r0
/* 80058480 00054400  3C E0 80 0A */	lis r7, aramQueue@ha
/* 80058484 00054404  90 01 00 04 */	stw r0, 0x4(r1)
/* 80058488 00054408  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8005848C 0005440C  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 80058490 00054410  3B 63 00 00 */	addi r27, r3, 0x0
/* 80058494 00054414  3B 84 00 00 */	addi r28, r4, 0x0
/* 80058498 00054418  3B A5 00 00 */	addi r29, r5, 0x0
/* 8005849C 0005441C  3B C6 00 00 */	addi r30, r6, 0x0
/* 800584A0 00054420  3B E7 42 68 */	addi r31, r7, aramQueue@l
.L_800584A4:
/* 800584A4 00054424  88 0D 88 7D */	lbz r0, aramQueueValid@sda21(r13)
/* 800584A8 00054428  28 00 00 10 */	cmplwi r0, 0x10
/* 800584AC 0005442C  40 80 FF F8 */	bge .L_800584A4
/* 800584B0 00054430  4B FD 2B 35 */	bl OSDisableInterrupts
/* 800584B4 00054434  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 800584B8 00054438  28 1E 00 00 */	cmplwi r30, 0x0
/* 800584BC 0005443C  38 9F 00 04 */	addi r4, r31, 0x4
/* 800584C0 00054440  54 00 28 34 */	slwi r0, r0, 5
/* 800584C4 00054444  38 A0 00 2A */	li r5, 0x2a
/* 800584C8 00054448  7C A4 01 2E */	stwx r5, r4, r0
/* 800584CC 0005444C  38 BF 00 08 */	addi r5, r31, 0x8
/* 800584D0 00054450  38 E0 00 00 */	li r7, 0x0
/* 800584D4 00054454  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 800584D8 00054458  3B C3 00 00 */	addi r30, r3, 0x0
/* 800584DC 0005445C  54 00 28 34 */	slwi r0, r0, 5
/* 800584E0 00054460  7C E5 01 2E */	stwx r7, r5, r0
/* 800584E4 00054464  41 82 00 08 */	beq .L_800584EC
/* 800584E8 00054468  38 E0 00 01 */	li r7, 0x1
.L_800584EC:
/* 800584EC 0005446C  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 800584F0 00054470  3C 60 80 06 */	lis r3, aramQueueCallback@ha
/* 800584F4 00054474  38 DF 00 0C */	addi r6, r31, 0xc
/* 800584F8 00054478  54 00 28 34 */	slwi r0, r0, 5
/* 800584FC 0005447C  7C E6 01 2E */	stwx r7, r6, r0
/* 80058500 00054480  38 FF 00 10 */	addi r7, r31, 0x10
/* 80058504 00054484  39 1F 00 14 */	addi r8, r31, 0x14
/* 80058508 00054488  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 8005850C 0005448C  39 3F 00 18 */	addi r9, r31, 0x18
/* 80058510 00054490  38 63 84 6C */	addi r3, r3, aramQueueCallback@l
/* 80058514 00054494  54 00 28 34 */	slwi r0, r0, 5
/* 80058518 00054498  7F 67 01 2E */	stwx r27, r7, r0
/* 8005851C 0005449C  39 5F 00 1C */	addi r10, r31, 0x1c
/* 80058520 000544A0  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058524 000544A4  54 00 28 34 */	slwi r0, r0, 5
/* 80058528 000544A8  7F 88 01 2E */	stwx r28, r8, r0
/* 8005852C 000544AC  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058530 000544B0  54 00 28 34 */	slwi r0, r0, 5
/* 80058534 000544B4  7F A9 01 2E */	stwx r29, r9, r0
/* 80058538 000544B8  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 8005853C 000544BC  54 00 28 34 */	slwi r0, r0, 5
/* 80058540 000544C0  7C 6A 01 2E */	stwx r3, r10, r0
/* 80058544 000544C4  88 6D 88 7C */	lbz r3, aramQueueWrite@sda21(r13)
/* 80058548 000544C8  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 8005854C 000544CC  54 63 28 34 */	slwi r3, r3, 5
/* 80058550 000544D0  7C 7F 1A 14 */	add r3, r31, r3
/* 80058554 000544D4  89 6D 88 7C */	lbz r11, aramQueueWrite@sda21(r13)
/* 80058558 000544D8  54 00 28 34 */	slwi r0, r0, 5
/* 8005855C 000544DC  7C 84 00 2E */	lwzx r4, r4, r0
/* 80058560 000544E0  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058564 000544E4  55 6B 28 34 */	slwi r11, r11, 5
/* 80058568 000544E8  7C A5 58 2E */	lwzx r5, r5, r11
/* 8005856C 000544EC  89 6D 88 7C */	lbz r11, aramQueueWrite@sda21(r13)
/* 80058570 000544F0  54 00 28 34 */	slwi r0, r0, 5
/* 80058574 000544F4  7C C6 00 2E */	lwzx r6, r6, r0
/* 80058578 000544F8  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 8005857C 000544FC  55 6B 28 34 */	slwi r11, r11, 5
/* 80058580 00054500  7C E7 58 2E */	lwzx r7, r7, r11
/* 80058584 00054504  89 6D 88 7C */	lbz r11, aramQueueWrite@sda21(r13)
/* 80058588 00054508  54 00 28 34 */	slwi r0, r0, 5
/* 8005858C 0005450C  7D 08 00 2E */	lwzx r8, r8, r0
/* 80058590 00054510  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058594 00054514  55 6B 28 34 */	slwi r11, r11, 5
/* 80058598 00054518  7D 29 58 2E */	lwzx r9, r9, r11
/* 8005859C 0005451C  54 00 28 34 */	slwi r0, r0, 5
/* 800585A0 00054520  7D 4A 00 2E */	lwzx r10, r10, r0
/* 800585A4 00054524  4B FE 0B 69 */	bl ARQPostRequest
/* 800585A8 00054528  88 8D 88 7D */	lbz r4, aramQueueValid@sda21(r13)
/* 800585AC 0005452C  38 7E 00 00 */	addi r3, r30, 0x0
/* 800585B0 00054530  38 04 00 01 */	addi r0, r4, 0x1
/* 800585B4 00054534  98 0D 88 7D */	stb r0, aramQueueValid@sda21(r13)
/* 800585B8 00054538  88 8D 88 7C */	lbz r4, aramQueueWrite@sda21(r13)
/* 800585BC 0005453C  38 84 00 01 */	addi r4, r4, 0x1
/* 800585C0 00054540  7C 80 26 70 */	srawi r0, r4, 4
/* 800585C4 00054544  7C 00 01 94 */	addze r0, r0
/* 800585C8 00054548  54 00 20 36 */	slwi r0, r0, 4
/* 800585CC 0005454C  7C 00 20 10 */	subfc r0, r0, r4
/* 800585D0 00054550  98 0D 88 7C */	stb r0, aramQueueWrite@sda21(r13)
/* 800585D4 00054554  4B FD 2A 39 */	bl OSRestoreInterrupts
/* 800585D8 00054558  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 800585DC 0005455C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800585E0 00054560  38 21 00 30 */	addi r1, r1, 0x30
/* 800585E4 00054564  7C 08 03 A6 */	mtlr r0
/* 800585E8 00054568  4E 80 00 20 */	blr
.endfn aramUploadData

.fn aramSyncTransferQueue, global
/* 800585EC 0005456C  88 0D 88 7D */	lbz r0, aramQueueValid@sda21(r13)
/* 800585F0 00054570  28 00 00 00 */	cmplwi r0, 0x0
/* 800585F4 00054574  40 82 FF F8 */	bne aramSyncTransferQueue
/* 800585F8 00054578  4E 80 00 20 */	blr
.endfn aramSyncTransferQueue

.fn aramInit, global
/* 800585FC 0005457C  7C 08 02 A6 */	mflr r0
/* 80058600 00054580  3C 80 80 0A */	lis r4, aramQueue@ha
/* 80058604 00054584  90 01 00 04 */	stw r0, 0x4(r1)
/* 80058608 00054588  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8005860C 0005458C  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 80058610 00054590  3B 63 00 00 */	addi r27, r3, 0x0
/* 80058614 00054594  3B C4 42 68 */	addi r30, r4, aramQueue@l
/* 80058618 00054598  4B FD F9 69 */	bl ARGetBaseAddress
/* 8005861C 0005459C  3B E3 00 00 */	addi r31, r3, 0x0
/* 80058620 000545A0  38 60 05 00 */	li r3, 0x500
/* 80058624 000545A4  48 00 0A A5 */	bl salMalloc
/* 80058628 000545A8  38 00 00 08 */	li r0, 0x8
/* 8005862C 000545AC  7C 09 03 A6 */	mtctr r0
/* 80058630 000545B0  3B 83 00 00 */	addi r28, r3, 0x0
/* 80058634 000545B4  38 00 00 00 */	li r0, 0x0
.L_80058638:
/* 80058638 000545B8  B0 03 00 00 */	sth r0, 0x0(r3)
/* 8005863C 000545BC  B0 03 00 02 */	sth r0, 0x2(r3)
/* 80058640 000545C0  B0 03 00 04 */	sth r0, 0x4(r3)
/* 80058644 000545C4  B0 03 00 06 */	sth r0, 0x6(r3)
/* 80058648 000545C8  B0 03 00 08 */	sth r0, 0x8(r3)
/* 8005864C 000545CC  B0 03 00 0A */	sth r0, 0xa(r3)
/* 80058650 000545D0  B0 03 00 0C */	sth r0, 0xc(r3)
/* 80058654 000545D4  B0 03 00 0E */	sth r0, 0xe(r3)
/* 80058658 000545D8  B0 03 00 10 */	sth r0, 0x10(r3)
/* 8005865C 000545DC  B0 03 00 12 */	sth r0, 0x12(r3)
/* 80058660 000545E0  B0 03 00 14 */	sth r0, 0x14(r3)
/* 80058664 000545E4  B0 03 00 16 */	sth r0, 0x16(r3)
/* 80058668 000545E8  B0 03 00 18 */	sth r0, 0x18(r3)
/* 8005866C 000545EC  B0 03 00 1A */	sth r0, 0x1a(r3)
/* 80058670 000545F0  B0 03 00 1C */	sth r0, 0x1c(r3)
/* 80058674 000545F4  B0 03 00 1E */	sth r0, 0x1e(r3)
/* 80058678 000545F8  B0 03 00 20 */	sth r0, 0x20(r3)
/* 8005867C 000545FC  B0 03 00 22 */	sth r0, 0x22(r3)
/* 80058680 00054600  B0 03 00 24 */	sth r0, 0x24(r3)
/* 80058684 00054604  B0 03 00 26 */	sth r0, 0x26(r3)
/* 80058688 00054608  B0 03 00 28 */	sth r0, 0x28(r3)
/* 8005868C 0005460C  B0 03 00 2A */	sth r0, 0x2a(r3)
/* 80058690 00054610  B0 03 00 2C */	sth r0, 0x2c(r3)
/* 80058694 00054614  B0 03 00 2E */	sth r0, 0x2e(r3)
/* 80058698 00054618  B0 03 00 30 */	sth r0, 0x30(r3)
/* 8005869C 0005461C  B0 03 00 32 */	sth r0, 0x32(r3)
/* 800586A0 00054620  B0 03 00 34 */	sth r0, 0x34(r3)
/* 800586A4 00054624  B0 03 00 36 */	sth r0, 0x36(r3)
/* 800586A8 00054628  B0 03 00 38 */	sth r0, 0x38(r3)
/* 800586AC 0005462C  B0 03 00 3A */	sth r0, 0x3a(r3)
/* 800586B0 00054630  B0 03 00 3C */	sth r0, 0x3c(r3)
/* 800586B4 00054634  B0 03 00 3E */	sth r0, 0x3e(r3)
/* 800586B8 00054638  B0 03 00 40 */	sth r0, 0x40(r3)
/* 800586BC 0005463C  B0 03 00 42 */	sth r0, 0x42(r3)
/* 800586C0 00054640  B0 03 00 44 */	sth r0, 0x44(r3)
/* 800586C4 00054644  B0 03 00 46 */	sth r0, 0x46(r3)
/* 800586C8 00054648  B0 03 00 48 */	sth r0, 0x48(r3)
/* 800586CC 0005464C  B0 03 00 4A */	sth r0, 0x4a(r3)
/* 800586D0 00054650  B0 03 00 4C */	sth r0, 0x4c(r3)
/* 800586D4 00054654  B0 03 00 4E */	sth r0, 0x4e(r3)
/* 800586D8 00054658  B0 03 00 50 */	sth r0, 0x50(r3)
/* 800586DC 0005465C  B0 03 00 52 */	sth r0, 0x52(r3)
/* 800586E0 00054660  B0 03 00 54 */	sth r0, 0x54(r3)
/* 800586E4 00054664  B0 03 00 56 */	sth r0, 0x56(r3)
/* 800586E8 00054668  B0 03 00 58 */	sth r0, 0x58(r3)
/* 800586EC 0005466C  B0 03 00 5A */	sth r0, 0x5a(r3)
/* 800586F0 00054670  B0 03 00 5C */	sth r0, 0x5c(r3)
/* 800586F4 00054674  B0 03 00 5E */	sth r0, 0x5e(r3)
/* 800586F8 00054678  B0 03 00 60 */	sth r0, 0x60(r3)
/* 800586FC 0005467C  B0 03 00 62 */	sth r0, 0x62(r3)
/* 80058700 00054680  B0 03 00 64 */	sth r0, 0x64(r3)
/* 80058704 00054684  B0 03 00 66 */	sth r0, 0x66(r3)
/* 80058708 00054688  B0 03 00 68 */	sth r0, 0x68(r3)
/* 8005870C 0005468C  B0 03 00 6A */	sth r0, 0x6a(r3)
/* 80058710 00054690  B0 03 00 6C */	sth r0, 0x6c(r3)
/* 80058714 00054694  B0 03 00 6E */	sth r0, 0x6e(r3)
/* 80058718 00054698  B0 03 00 70 */	sth r0, 0x70(r3)
/* 8005871C 0005469C  B0 03 00 72 */	sth r0, 0x72(r3)
/* 80058720 000546A0  B0 03 00 74 */	sth r0, 0x74(r3)
/* 80058724 000546A4  B0 03 00 76 */	sth r0, 0x76(r3)
/* 80058728 000546A8  B0 03 00 78 */	sth r0, 0x78(r3)
/* 8005872C 000546AC  B0 03 00 7A */	sth r0, 0x7a(r3)
/* 80058730 000546B0  B0 03 00 7C */	sth r0, 0x7c(r3)
/* 80058734 000546B4  B0 03 00 7E */	sth r0, 0x7e(r3)
/* 80058738 000546B8  B0 03 00 80 */	sth r0, 0x80(r3)
/* 8005873C 000546BC  B0 03 00 82 */	sth r0, 0x82(r3)
/* 80058740 000546C0  B0 03 00 84 */	sth r0, 0x84(r3)
/* 80058744 000546C4  B0 03 00 86 */	sth r0, 0x86(r3)
/* 80058748 000546C8  B0 03 00 88 */	sth r0, 0x88(r3)
/* 8005874C 000546CC  B0 03 00 8A */	sth r0, 0x8a(r3)
/* 80058750 000546D0  B0 03 00 8C */	sth r0, 0x8c(r3)
/* 80058754 000546D4  B0 03 00 8E */	sth r0, 0x8e(r3)
/* 80058758 000546D8  B0 03 00 90 */	sth r0, 0x90(r3)
/* 8005875C 000546DC  B0 03 00 92 */	sth r0, 0x92(r3)
/* 80058760 000546E0  B0 03 00 94 */	sth r0, 0x94(r3)
/* 80058764 000546E4  B0 03 00 96 */	sth r0, 0x96(r3)
/* 80058768 000546E8  B0 03 00 98 */	sth r0, 0x98(r3)
/* 8005876C 000546EC  B0 03 00 9A */	sth r0, 0x9a(r3)
/* 80058770 000546F0  B0 03 00 9C */	sth r0, 0x9c(r3)
/* 80058774 000546F4  B0 03 00 9E */	sth r0, 0x9e(r3)
/* 80058778 000546F8  38 63 00 A0 */	addi r3, r3, 0xa0
/* 8005877C 000546FC  42 00 FE BC */	bdnz .L_80058638
/* 80058780 00054700  38 7C 00 00 */	addi r3, r28, 0x0
/* 80058784 00054704  38 80 05 00 */	li r4, 0x500
/* 80058788 00054708  4B FD 07 BD */	bl DCFlushRange
/* 8005878C 0005470C  38 00 00 00 */	li r0, 0x0
/* 80058790 00054710  98 0D 88 7D */	stb r0, aramQueueValid@sda21(r13)
/* 80058794 00054714  98 0D 88 7C */	stb r0, aramQueueWrite@sda21(r13)
.L_80058798:
/* 80058798 00054718  88 0D 88 7D */	lbz r0, aramQueueValid@sda21(r13)
/* 8005879C 0005471C  28 00 00 10 */	cmplwi r0, 0x10
/* 800587A0 00054720  40 80 FF F8 */	bge .L_80058798
/* 800587A4 00054724  4B FD 28 41 */	bl OSDisableInterrupts
/* 800587A8 00054728  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 800587AC 0005472C  3D 40 80 06 */	lis r10, aramQueueCallback@ha
/* 800587B0 00054730  39 6A 84 6C */	addi r11, r10, aramQueueCallback@l
/* 800587B4 00054734  38 9E 00 04 */	addi r4, r30, 0x4
/* 800587B8 00054738  54 00 28 34 */	slwi r0, r0, 5
/* 800587BC 0005473C  38 A0 00 2A */	li r5, 0x2a
/* 800587C0 00054740  7C A4 01 2E */	stwx r5, r4, r0
/* 800587C4 00054744  38 BE 00 08 */	addi r5, r30, 0x8
/* 800587C8 00054748  3B A0 00 00 */	li r29, 0x0
/* 800587CC 0005474C  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 800587D0 00054750  38 DE 00 0C */	addi r6, r30, 0xc
/* 800587D4 00054754  38 FE 00 10 */	addi r7, r30, 0x10
/* 800587D8 00054758  54 00 28 34 */	slwi r0, r0, 5
/* 800587DC 0005475C  7F A5 01 2E */	stwx r29, r5, r0
/* 800587E0 00054760  39 1E 00 14 */	addi r8, r30, 0x14
/* 800587E4 00054764  39 3E 00 18 */	addi r9, r30, 0x18
/* 800587E8 00054768  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 800587EC 0005476C  39 80 05 00 */	li r12, 0x500
/* 800587F0 00054770  39 5E 00 1C */	addi r10, r30, 0x1c
/* 800587F4 00054774  54 00 28 34 */	slwi r0, r0, 5
/* 800587F8 00054778  7F A6 01 2E */	stwx r29, r6, r0
/* 800587FC 0005477C  3B A3 00 00 */	addi r29, r3, 0x0
/* 80058800 00054780  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058804 00054784  54 00 28 34 */	slwi r0, r0, 5
/* 80058808 00054788  7F 87 01 2E */	stwx r28, r7, r0
/* 8005880C 0005478C  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058810 00054790  54 00 28 34 */	slwi r0, r0, 5
/* 80058814 00054794  7F E8 01 2E */	stwx r31, r8, r0
/* 80058818 00054798  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 8005881C 0005479C  54 00 28 34 */	slwi r0, r0, 5
/* 80058820 000547A0  7D 89 01 2E */	stwx r12, r9, r0
/* 80058824 000547A4  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058828 000547A8  54 00 28 34 */	slwi r0, r0, 5
/* 8005882C 000547AC  7D 6A 01 2E */	stwx r11, r10, r0
/* 80058830 000547B0  88 6D 88 7C */	lbz r3, aramQueueWrite@sda21(r13)
/* 80058834 000547B4  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058838 000547B8  54 63 28 34 */	slwi r3, r3, 5
/* 8005883C 000547BC  7C 7E 1A 14 */	add r3, r30, r3
/* 80058840 000547C0  89 6D 88 7C */	lbz r11, aramQueueWrite@sda21(r13)
/* 80058844 000547C4  54 00 28 34 */	slwi r0, r0, 5
/* 80058848 000547C8  7C 84 00 2E */	lwzx r4, r4, r0
/* 8005884C 000547CC  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058850 000547D0  55 6B 28 34 */	slwi r11, r11, 5
/* 80058854 000547D4  7C A5 58 2E */	lwzx r5, r5, r11
/* 80058858 000547D8  89 6D 88 7C */	lbz r11, aramQueueWrite@sda21(r13)
/* 8005885C 000547DC  54 00 28 34 */	slwi r0, r0, 5
/* 80058860 000547E0  7C C6 00 2E */	lwzx r6, r6, r0
/* 80058864 000547E4  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058868 000547E8  55 6B 28 34 */	slwi r11, r11, 5
/* 8005886C 000547EC  7C E7 58 2E */	lwzx r7, r7, r11
/* 80058870 000547F0  89 6D 88 7C */	lbz r11, aramQueueWrite@sda21(r13)
/* 80058874 000547F4  54 00 28 34 */	slwi r0, r0, 5
/* 80058878 000547F8  7D 08 00 2E */	lwzx r8, r8, r0
/* 8005887C 000547FC  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058880 00054800  55 6B 28 34 */	slwi r11, r11, 5
/* 80058884 00054804  7D 29 58 2E */	lwzx r9, r9, r11
/* 80058888 00054808  54 00 28 34 */	slwi r0, r0, 5
/* 8005888C 0005480C  7D 4A 00 2E */	lwzx r10, r10, r0
/* 80058890 00054810  4B FE 08 7D */	bl ARQPostRequest
/* 80058894 00054814  88 8D 88 7D */	lbz r4, aramQueueValid@sda21(r13)
/* 80058898 00054818  38 7D 00 00 */	addi r3, r29, 0x0
/* 8005889C 0005481C  38 04 00 01 */	addi r0, r4, 0x1
/* 800588A0 00054820  98 0D 88 7D */	stb r0, aramQueueValid@sda21(r13)
/* 800588A4 00054824  88 8D 88 7C */	lbz r4, aramQueueWrite@sda21(r13)
/* 800588A8 00054828  38 84 00 01 */	addi r4, r4, 0x1
/* 800588AC 0005482C  7C 80 26 70 */	srawi r0, r4, 4
/* 800588B0 00054830  7C 00 01 94 */	addze r0, r0
/* 800588B4 00054834  54 00 20 36 */	slwi r0, r0, 4
/* 800588B8 00054838  7C 00 20 10 */	subfc r0, r0, r4
/* 800588BC 0005483C  98 0D 88 7C */	stb r0, aramQueueWrite@sda21(r13)
/* 800588C0 00054840  4B FD 27 4D */	bl OSRestoreInterrupts
.L_800588C4:
/* 800588C4 00054844  88 0D 88 7D */	lbz r0, aramQueueValid@sda21(r13)
/* 800588C8 00054848  28 00 00 00 */	cmplwi r0, 0x0
/* 800588CC 0005484C  40 82 FF F8 */	bne .L_800588C4
/* 800588D0 00054850  7F 83 E3 78 */	mr r3, r28
/* 800588D4 00054854  48 00 08 1D */	bl salFree
/* 800588D8 00054858  7C 1F DA 14 */	add r0, r31, r27
/* 800588DC 0005485C  90 0D 88 70 */	stw r0, aramTop@sda21(r13)
/* 800588E0 00054860  4B FD F6 A9 */	bl ARGetSize
/* 800588E4 00054864  80 0D 88 70 */	lwz r0, aramTop@sda21(r13)
/* 800588E8 00054868  7C 00 18 40 */	cmplw r0, r3
/* 800588EC 0005486C  40 81 00 0C */	ble .L_800588F8
/* 800588F0 00054870  4B FD F6 99 */	bl ARGetSize
/* 800588F4 00054874  90 6D 88 70 */	stw r3, aramTop@sda21(r13)
.L_800588F8:
/* 800588F8 00054878  38 1F 05 00 */	addi r0, r31, 0x500
/* 800588FC 0005487C  90 0D 88 74 */	stw r0, aramWrite@sda21(r13)
/* 80058900 00054880  48 00 01 CD */	bl InitStreamBuffers
/* 80058904 00054884  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 80058908 00054888  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8005890C 0005488C  38 21 00 30 */	addi r1, r1, 0x30
/* 80058910 00054890  7C 08 03 A6 */	mtlr r0
/* 80058914 00054894  4E 80 00 20 */	blr
.endfn aramInit

.fn aramExit, global
/* 80058918 00054898  4E 80 00 20 */	blr
.endfn aramExit

.fn aramGetZeroBuffer, global
/* 8005891C 0005489C  7C 08 02 A6 */	mflr r0
/* 80058920 000548A0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80058924 000548A4  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80058928 000548A8  4B FD F6 59 */	bl ARGetBaseAddress
/* 8005892C 000548AC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80058930 000548B0  38 21 00 08 */	addi r1, r1, 0x8
/* 80058934 000548B4  7C 08 03 A6 */	mtlr r0
/* 80058938 000548B8  4E 80 00 20 */	blr
.endfn aramGetZeroBuffer

.fn aramStoreData, global
/* 8005893C 000548BC  7C 08 02 A6 */	mflr r0
/* 80058940 000548C0  3C A0 80 0A */	lis r5, aramQueue@ha
/* 80058944 000548C4  90 01 00 04 */	stw r0, 0x4(r1)
/* 80058948 000548C8  38 04 00 1F */	addi r0, r4, 0x1f
/* 8005894C 000548CC  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80058950 000548D0  BF 61 00 14 */	stmw r27, 0x14(r1)
/* 80058954 000548D4  54 1C 00 34 */	clrrwi r28, r0, 5
/* 80058958 000548D8  3B 63 00 00 */	addi r27, r3, 0x0
/* 8005895C 000548DC  38 9C 00 00 */	addi r4, r28, 0x0
/* 80058960 000548E0  3B E5 42 68 */	addi r31, r5, aramQueue@l
/* 80058964 000548E4  4B FD 05 E1 */	bl DCFlushRange
/* 80058968 000548E8  83 AD 88 74 */	lwz r29, aramWrite@sda21(r13)
.L_8005896C:
/* 8005896C 000548EC  88 0D 88 7D */	lbz r0, aramQueueValid@sda21(r13)
/* 80058970 000548F0  28 00 00 10 */	cmplwi r0, 0x10
/* 80058974 000548F4  40 80 FF F8 */	bge .L_8005896C
/* 80058978 000548F8  4B FD 26 6D */	bl OSDisableInterrupts
/* 8005897C 000548FC  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058980 00054900  3D 40 80 06 */	lis r10, aramQueueCallback@ha
/* 80058984 00054904  39 6A 84 6C */	addi r11, r10, aramQueueCallback@l
/* 80058988 00054908  38 9F 00 04 */	addi r4, r31, 0x4
/* 8005898C 0005490C  54 00 28 34 */	slwi r0, r0, 5
/* 80058990 00054910  38 A0 00 2A */	li r5, 0x2a
/* 80058994 00054914  7C A4 01 2E */	stwx r5, r4, r0
/* 80058998 00054918  38 BF 00 08 */	addi r5, r31, 0x8
/* 8005899C 0005491C  39 80 00 00 */	li r12, 0x0
/* 800589A0 00054920  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 800589A4 00054924  38 DF 00 0C */	addi r6, r31, 0xc
/* 800589A8 00054928  38 FF 00 10 */	addi r7, r31, 0x10
/* 800589AC 0005492C  54 00 28 34 */	slwi r0, r0, 5
/* 800589B0 00054930  7D 85 01 2E */	stwx r12, r5, r0
/* 800589B4 00054934  39 1F 00 14 */	addi r8, r31, 0x14
/* 800589B8 00054938  39 3F 00 18 */	addi r9, r31, 0x18
/* 800589BC 0005493C  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 800589C0 00054940  39 5F 00 1C */	addi r10, r31, 0x1c
/* 800589C4 00054944  7C 7E 1B 78 */	mr r30, r3
/* 800589C8 00054948  54 00 28 34 */	slwi r0, r0, 5
/* 800589CC 0005494C  7D 86 01 2E */	stwx r12, r6, r0
/* 800589D0 00054950  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 800589D4 00054954  54 00 28 34 */	slwi r0, r0, 5
/* 800589D8 00054958  7F 67 01 2E */	stwx r27, r7, r0
/* 800589DC 0005495C  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 800589E0 00054960  54 00 28 34 */	slwi r0, r0, 5
/* 800589E4 00054964  7F A8 01 2E */	stwx r29, r8, r0
/* 800589E8 00054968  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 800589EC 0005496C  54 00 28 34 */	slwi r0, r0, 5
/* 800589F0 00054970  7F 89 01 2E */	stwx r28, r9, r0
/* 800589F4 00054974  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 800589F8 00054978  54 00 28 34 */	slwi r0, r0, 5
/* 800589FC 0005497C  7D 6A 01 2E */	stwx r11, r10, r0
/* 80058A00 00054980  88 6D 88 7C */	lbz r3, aramQueueWrite@sda21(r13)
/* 80058A04 00054984  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058A08 00054988  54 63 28 34 */	slwi r3, r3, 5
/* 80058A0C 0005498C  7C 7F 1A 14 */	add r3, r31, r3
/* 80058A10 00054990  89 6D 88 7C */	lbz r11, aramQueueWrite@sda21(r13)
/* 80058A14 00054994  54 00 28 34 */	slwi r0, r0, 5
/* 80058A18 00054998  7C 84 00 2E */	lwzx r4, r4, r0
/* 80058A1C 0005499C  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058A20 000549A0  55 6B 28 34 */	slwi r11, r11, 5
/* 80058A24 000549A4  7C A5 58 2E */	lwzx r5, r5, r11
/* 80058A28 000549A8  89 6D 88 7C */	lbz r11, aramQueueWrite@sda21(r13)
/* 80058A2C 000549AC  54 00 28 34 */	slwi r0, r0, 5
/* 80058A30 000549B0  7C C6 00 2E */	lwzx r6, r6, r0
/* 80058A34 000549B4  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058A38 000549B8  55 6B 28 34 */	slwi r11, r11, 5
/* 80058A3C 000549BC  7C E7 58 2E */	lwzx r7, r7, r11
/* 80058A40 000549C0  89 6D 88 7C */	lbz r11, aramQueueWrite@sda21(r13)
/* 80058A44 000549C4  54 00 28 34 */	slwi r0, r0, 5
/* 80058A48 000549C8  7D 08 00 2E */	lwzx r8, r8, r0
/* 80058A4C 000549CC  88 0D 88 7C */	lbz r0, aramQueueWrite@sda21(r13)
/* 80058A50 000549D0  55 6B 28 34 */	slwi r11, r11, 5
/* 80058A54 000549D4  7D 29 58 2E */	lwzx r9, r9, r11
/* 80058A58 000549D8  54 00 28 34 */	slwi r0, r0, 5
/* 80058A5C 000549DC  7D 4A 00 2E */	lwzx r10, r10, r0
/* 80058A60 000549E0  4B FE 06 AD */	bl ARQPostRequest
/* 80058A64 000549E4  88 8D 88 7D */	lbz r4, aramQueueValid@sda21(r13)
/* 80058A68 000549E8  38 7E 00 00 */	addi r3, r30, 0x0
/* 80058A6C 000549EC  38 04 00 01 */	addi r0, r4, 0x1
/* 80058A70 000549F0  98 0D 88 7D */	stb r0, aramQueueValid@sda21(r13)
/* 80058A74 000549F4  88 8D 88 7C */	lbz r4, aramQueueWrite@sda21(r13)
/* 80058A78 000549F8  38 84 00 01 */	addi r4, r4, 0x1
/* 80058A7C 000549FC  7C 80 26 70 */	srawi r0, r4, 4
/* 80058A80 00054A00  7C 00 01 94 */	addze r0, r0
/* 80058A84 00054A04  54 00 20 36 */	slwi r0, r0, 4
/* 80058A88 00054A08  7C 00 20 10 */	subfc r0, r0, r4
/* 80058A8C 00054A0C  98 0D 88 7C */	stb r0, aramQueueWrite@sda21(r13)
/* 80058A90 00054A10  4B FD 25 7D */	bl OSRestoreInterrupts
/* 80058A94 00054A14  80 6D 88 74 */	lwz r3, aramWrite@sda21(r13)
/* 80058A98 00054A18  7C 03 E2 14 */	add r0, r3, r28
/* 80058A9C 00054A1C  90 0D 88 74 */	stw r0, aramWrite@sda21(r13)
/* 80058AA0 00054A20  BB 61 00 14 */	lmw r27, 0x14(r1)
/* 80058AA4 00054A24  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80058AA8 00054A28  38 21 00 28 */	addi r1, r1, 0x28
/* 80058AAC 00054A2C  7C 08 03 A6 */	mtlr r0
/* 80058AB0 00054A30  4E 80 00 20 */	blr
.endfn aramStoreData

.fn aramRemoveData, global
/* 80058AB4 00054A34  38 64 00 1F */	addi r3, r4, 0x1f
/* 80058AB8 00054A38  80 0D 88 74 */	lwz r0, aramWrite@sda21(r13)
/* 80058ABC 00054A3C  54 63 00 34 */	clrrwi r3, r3, 5
/* 80058AC0 00054A40  7C 03 00 50 */	subf r0, r3, r0
/* 80058AC4 00054A44  90 0D 88 74 */	stw r0, aramWrite@sda21(r13)
/* 80058AC8 00054A48  4E 80 00 20 */	blr
.endfn aramRemoveData

.fn InitStreamBuffers, local
/* 80058ACC 00054A4C  3C 60 80 0A */	lis r3, aramQueue@ha
/* 80058AD0 00054A50  38 C3 42 68 */	addi r6, r3, aramQueue@l
/* 80058AD4 00054A54  38 80 00 00 */	li r4, 0x0
/* 80058AD8 00054A58  38 66 02 00 */	addi r3, r6, 0x200
/* 80058ADC 00054A5C  90 8D 88 80 */	stw r4, aramUsedStreamBuffers@sda21(r13)
/* 80058AE0 00054A60  38 00 00 07 */	li r0, 0x7
/* 80058AE4 00054A64  90 8D 88 84 */	stw r4, aramFreeStreamBuffers@sda21(r13)
/* 80058AE8 00054A68  7C 09 03 A6 */	mtctr r0
/* 80058AEC 00054A6C  38 E6 02 10 */	addi r7, r6, 0x210
/* 80058AF0 00054A70  90 6D 88 88 */	stw r3, aramIdleStreamBuffers@sda21(r13)
/* 80058AF4 00054A74  39 00 00 01 */	li r8, 0x1
.L_80058AF8:
/* 80058AF8 00054A78  90 E7 FF F0 */	stw r7, -0x10(r7)
/* 80058AFC 00054A7C  38 07 00 10 */	addi r0, r7, 0x10
/* 80058B00 00054A80  38 67 00 20 */	addi r3, r7, 0x20
/* 80058B04 00054A84  90 07 00 00 */	stw r0, 0x0(r7)
/* 80058B08 00054A88  38 07 00 30 */	addi r0, r7, 0x30
/* 80058B0C 00054A8C  38 A7 00 40 */	addi r5, r7, 0x40
/* 80058B10 00054A90  90 67 00 10 */	stw r3, 0x10(r7)
/* 80058B14 00054A94  38 87 00 50 */	addi r4, r7, 0x50
/* 80058B18 00054A98  38 67 00 60 */	addi r3, r7, 0x60
/* 80058B1C 00054A9C  90 07 00 20 */	stw r0, 0x20(r7)
/* 80058B20 00054AA0  38 07 00 70 */	addi r0, r7, 0x70
/* 80058B24 00054AA4  39 08 00 08 */	addi r8, r8, 0x8
/* 80058B28 00054AA8  90 A7 00 30 */	stw r5, 0x30(r7)
/* 80058B2C 00054AAC  90 87 00 40 */	stw r4, 0x40(r7)
/* 80058B30 00054AB0  90 67 00 50 */	stw r3, 0x50(r7)
/* 80058B34 00054AB4  90 07 00 60 */	stw r0, 0x60(r7)
/* 80058B38 00054AB8  38 E7 00 80 */	addi r7, r7, 0x80
/* 80058B3C 00054ABC  42 00 FF BC */	bdnz .L_80058AF8
/* 80058B40 00054AC0  48 00 00 40 */	b .L_80058B80
.L_80058B44:
/* 80058B44 00054AC4  20 08 00 40 */	subfic r0, r8, 0x40
/* 80058B48 00054AC8  28 08 00 40 */	cmplwi r8, 0x40
/* 80058B4C 00054ACC  7C 09 03 A6 */	mtctr r0
/* 80058B50 00054AD0  40 80 00 14 */	bge .L_80058B64
.L_80058B54:
/* 80058B54 00054AD4  90 63 FF F0 */	stw r3, -0x10(r3)
/* 80058B58 00054AD8  38 63 00 10 */	addi r3, r3, 0x10
/* 80058B5C 00054ADC  39 08 00 01 */	addi r8, r8, 0x1
/* 80058B60 00054AE0  42 00 FF F4 */	bdnz .L_80058B54
.L_80058B64:
/* 80058B64 00054AE4  55 00 20 36 */	slwi r0, r8, 4
/* 80058B68 00054AE8  7C 66 02 14 */	add r3, r6, r0
/* 80058B6C 00054AEC  38 00 00 00 */	li r0, 0x0
/* 80058B70 00054AF0  90 03 01 F0 */	stw r0, 0x1f0(r3)
/* 80058B74 00054AF4  80 0D 88 70 */	lwz r0, aramTop@sda21(r13)
/* 80058B78 00054AF8  90 0D 88 78 */	stw r0, aramStream@sda21(r13)
/* 80058B7C 00054AFC  4E 80 00 20 */	blr
.L_80058B80:
/* 80058B80 00054B00  55 00 20 36 */	slwi r0, r8, 4
/* 80058B84 00054B04  7C 66 02 14 */	add r3, r6, r0
/* 80058B88 00054B08  38 63 02 00 */	addi r3, r3, 0x200
/* 80058B8C 00054B0C  4B FF FF B8 */	b .L_80058B44
/* 80058B90 00054B10  4E 80 00 20 */	blr
.endfn InitStreamBuffers

.fn aramGetStreamBufferAddress, global
/* 80058B94 00054B14  28 04 00 00 */	cmplwi r4, 0x0
/* 80058B98 00054B18  41 82 00 1C */	beq .L_80058BB4
/* 80058B9C 00054B1C  3C A0 80 0A */	lis r5, aramStreamBuffers@ha
/* 80058BA0 00054B20  38 A5 44 68 */	addi r5, r5, aramStreamBuffers@l
/* 80058BA4 00054B24  54 60 25 36 */	clrlslwi r0, r3, 24, 4
/* 80058BA8 00054B28  7C A5 02 14 */	add r5, r5, r0
/* 80058BAC 00054B2C  80 05 00 08 */	lwz r0, 0x8(r5)
/* 80058BB0 00054B30  90 04 00 00 */	stw r0, 0x0(r4)
.L_80058BB4:
/* 80058BB4 00054B34  3C 80 80 0A */	lis r4, aramStreamBuffers@ha
/* 80058BB8 00054B38  38 84 44 68 */	addi r4, r4, aramStreamBuffers@l
/* 80058BBC 00054B3C  54 60 25 36 */	clrlslwi r0, r3, 24, 4
/* 80058BC0 00054B40  7C 64 02 14 */	add r3, r4, r0
/* 80058BC4 00054B44  80 63 00 04 */	lwz r3, 0x4(r3)
/* 80058BC8 00054B48  4E 80 00 20 */	blr
.endfn aramGetStreamBufferAddress

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80


.obj aramQueue, local
	.skip 0x200
.endobj aramQueue

.obj aramStreamBuffers, local
	.skip 0x400
.endobj aramStreamBuffers

.skip 0x18

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380

.obj aramTop, local
	.skip 0x4
.endobj aramTop

.obj aramWrite, local
	.skip 0x4
.endobj aramWrite

.obj aramStream, local
	.skip 0x4
.endobj aramStream

.obj aramQueueWrite, local
	.skip 0x1
.endobj aramQueueWrite

.obj aramQueueValid, local
	.skip 0x1
.endobj aramQueueValid

.skip 2

.obj aramUsedStreamBuffers, local
	.skip 0x4
.endobj aramUsedStreamBuffers

.obj aramFreeStreamBuffers, local
	.skip 0x4
.endobj aramFreeStreamBuffers

.obj aramIdleStreamBuffers, local
	.skip 0x4
.endobj aramIdleStreamBuffers

.skip 4

.section extabindex_, "wa"  # 0x80005BC0 - 0x800065A0


.obj lbl_80006424, local
    .4byte aramUploadData
    .4byte 0x00000170
    .4byte lbl_80005AB8
.endobj lbl_80006424

.obj lbl_80006430, local
    .4byte aramInit
    .4byte 0x0000031C
    .4byte lbl_80005AC0
.endobj lbl_80006430

.obj lbl_8000643C, local
    .4byte aramGetZeroBuffer
    .4byte 0x00000020
    .4byte lbl_80005AC8
.endobj lbl_8000643C

.obj lbl_80006448, local
    .4byte aramStoreData
    .4byte 0x00000178
    .4byte lbl_80005AD0
.endobj lbl_80006448

.section extab_, "wa"  # 0x80005520 - 0x80005BC0


.obj lbl_80005AB8, local
	.4byte 0x28080000
	.4byte 0
.endobj lbl_80005AB8

.obj lbl_80005AC0, local
	.4byte 0x28080000
	.4byte 0
.endobj lbl_80005AC0

.obj lbl_80005AC8, local
	.4byte 0x00080000
	.4byte 0
.endobj lbl_80005AC8

.obj lbl_80005AD0, local
	.4byte 0x28080000
	.4byte 0
.endobj lbl_80005AD0
