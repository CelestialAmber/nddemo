


.global TRKHandleRequestEvent
TRKHandleRequestEvent:
/* 8005A768 000566E8  7C 08 02 A6 */	mflr r0
/* 8005A76C 000566EC  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005A770 000566F0  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8005A774 000566F4  80 63 00 08 */	lwz r3, 0x8(r3)
/* 8005A778 000566F8  48 00 06 8D */	bl TRKGetBuffer
/* 8005A77C 000566FC  48 00 0F 95 */	bl TRKDispatchMessage
/* 8005A780 00056700  38 21 00 08 */	addi r1, r1, 0x8
/* 8005A784 00056704  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005A788 00056708  7C 08 03 A6 */	mtlr r0
/* 8005A78C 0005670C  4E 80 00 20 */	blr

.global TRKHandleSupportEvent
TRKHandleSupportEvent:
/* 8005A790 00056710  7C 08 02 A6 */	mflr r0
/* 8005A794 00056714  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005A798 00056718  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8005A79C 0005671C  48 00 3A 4D */	bl TRKTargetSupportRequest
/* 8005A7A0 00056720  38 21 00 08 */	addi r1, r1, 0x8
/* 8005A7A4 00056724  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005A7A8 00056728  7C 08 03 A6 */	mtlr r0
/* 8005A7AC 0005672C  4E 80 00 20 */	blr

.global TRKIdle
TRKIdle:
/* 8005A7B0 00056730  7C 08 02 A6 */	mflr r0
/* 8005A7B4 00056734  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005A7B8 00056738  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8005A7BC 0005673C  48 00 3B 59 */	bl TRKTargetStopped
/* 8005A7C0 00056740  2C 03 00 00 */	cmpwi r3, 0x0
/* 8005A7C4 00056744  40 82 00 08 */	bne .L_8005A7CC
/* 8005A7C8 00056748  48 00 48 0D */	bl TRKTargetContinue
.L_8005A7CC:
/* 8005A7CC 0005674C  38 21 00 08 */	addi r1, r1, 0x8
/* 8005A7D0 00056750  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005A7D4 00056754  7C 08 03 A6 */	mtlr r0
/* 8005A7D8 00056758  4E 80 00 20 */	blr

.global TRKNubMainLoop
TRKNubMainLoop:
/* 8005A7DC 0005675C  7C 08 02 A6 */	mflr r0
/* 8005A7E0 00056760  3C 60 80 0B */	lis r3, gTRKInputPendingPtr@ha
/* 8005A7E4 00056764  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005A7E8 00056768  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8005A7EC 0005676C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8005A7F0 00056770  3B E3 82 D4 */	addi r31, r3, gTRKInputPendingPtr@l
/* 8005A7F4 00056774  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8005A7F8 00056778  3B C0 00 00 */	li r30, 0x0
/* 8005A7FC 0005677C  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8005A800 00056780  3B A0 00 00 */	li r29, 0x0
/* 8005A804 00056784  48 00 00 A8 */	b .L_8005A8AC
.L_8005A808:
/* 8005A808 00056788  38 61 00 08 */	addi r3, r1, 0x8
/* 8005A80C 0005678C  48 00 01 45 */	bl TRKGetNextEvent
/* 8005A810 00056790  2C 03 00 00 */	cmpwi r3, 0x0
/* 8005A814 00056794  41 82 00 6C */	beq .L_8005A880
/* 8005A818 00056798  88 01 00 08 */	lbz r0, 0x8(r1)
/* 8005A81C 0005679C  3B A0 00 00 */	li r29, 0x0
/* 8005A820 000567A0  2C 00 00 02 */	cmpwi r0, 0x2
/* 8005A824 000567A4  41 82 00 28 */	beq .L_8005A84C
/* 8005A828 000567A8  40 80 00 14 */	bge .L_8005A83C
/* 8005A82C 000567AC  2C 00 00 00 */	cmpwi r0, 0x0
/* 8005A830 000567B0  41 82 00 44 */	beq .L_8005A874
/* 8005A834 000567B4  40 80 00 24 */	bge .L_8005A858
/* 8005A838 000567B8  48 00 00 3C */	b .L_8005A874
.L_8005A83C:
/* 8005A83C 000567BC  2C 00 00 05 */	cmpwi r0, 0x5
/* 8005A840 000567C0  41 82 00 2C */	beq .L_8005A86C
/* 8005A844 000567C4  40 80 00 30 */	bge .L_8005A874
/* 8005A848 000567C8  48 00 00 18 */	b .L_8005A860
.L_8005A84C:
/* 8005A84C 000567CC  38 61 00 08 */	addi r3, r1, 0x8
/* 8005A850 000567D0  4B FF FF 19 */	bl TRKHandleRequestEvent
/* 8005A854 000567D4  48 00 00 20 */	b .L_8005A874
.L_8005A858:
/* 8005A858 000567D8  3B C0 00 01 */	li r30, 0x1
/* 8005A85C 000567DC  48 00 00 18 */	b .L_8005A874
.L_8005A860:
/* 8005A860 000567E0  38 61 00 08 */	addi r3, r1, 0x8
/* 8005A864 000567E4  48 00 35 D5 */	bl TRKTargetInterrupt
/* 8005A868 000567E8  48 00 00 0C */	b .L_8005A874
.L_8005A86C:
/* 8005A86C 000567EC  38 61 00 08 */	addi r3, r1, 0x8
/* 8005A870 000567F0  4B FF FF 21 */	bl TRKHandleSupportEvent
.L_8005A874:
/* 8005A874 000567F4  38 61 00 08 */	addi r3, r1, 0x8
/* 8005A878 000567F8  48 00 02 91 */	bl TRKDestructEvent
/* 8005A87C 000567FC  48 00 00 30 */	b .L_8005A8AC
.L_8005A880:
/* 8005A880 00056800  2C 1D 00 00 */	cmpwi r29, 0x0
/* 8005A884 00056804  41 82 00 14 */	beq .L_8005A898
/* 8005A888 00056808  80 7F 00 00 */	lwz r3, 0x0(r31)
/* 8005A88C 0005680C  88 03 00 00 */	lbz r0, 0x0(r3)
/* 8005A890 00056810  28 00 00 00 */	cmplwi r0, 0x0
/* 8005A894 00056814  41 82 00 10 */	beq .L_8005A8A4
.L_8005A898:
/* 8005A898 00056818  3B A0 00 01 */	li r29, 0x1
/* 8005A89C 0005681C  48 00 0D 65 */	bl TRKGetInput
/* 8005A8A0 00056820  48 00 00 0C */	b .L_8005A8AC
.L_8005A8A4:
/* 8005A8A4 00056824  4B FF FF 0D */	bl TRKIdle
/* 8005A8A8 00056828  3B A0 00 00 */	li r29, 0x0
.L_8005A8AC:
/* 8005A8AC 0005682C  2C 1E 00 00 */	cmpwi r30, 0x0
/* 8005A8B0 00056830  41 82 FF 58 */	beq .L_8005A808
/* 8005A8B4 00056834  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8005A8B8 00056838  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8005A8BC 0005683C  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8005A8C0 00056840  38 21 00 20 */	addi r1, r1, 0x20
/* 8005A8C4 00056844  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005A8C8 00056848  7C 08 03 A6 */	mtlr r0
/* 8005A8CC 0005684C  4E 80 00 20 */	blr