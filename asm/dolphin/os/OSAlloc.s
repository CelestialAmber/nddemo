.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn DLInsert, local
/* 800285DC 0002455C  38 E3 00 00 */	addi r7, r3, 0x0
/* 800285E0 00024560  38 C0 00 00 */	li r6, 0x0
/* 800285E4 00024564  48 00 00 14 */	b .L_800285F8
.L_800285E8:
/* 800285E8 00024568  7C 04 38 40 */	cmplw r4, r7
/* 800285EC 0002456C  40 81 00 14 */	ble .L_80028600
/* 800285F0 00024570  7C E6 3B 78 */	mr r6, r7
/* 800285F4 00024574  80 E7 00 04 */	lwz r7, 0x4(r7)
.L_800285F8:
/* 800285F8 00024578  28 07 00 00 */	cmplwi r7, 0x0
/* 800285FC 0002457C  40 82 FF EC */	bne .L_800285E8
.L_80028600:
/* 80028600 00024580  90 E4 00 04 */	stw r7, 0x4(r4)
/* 80028604 00024584  28 07 00 00 */	cmplwi r7, 0x0
/* 80028608 00024588  90 C4 00 00 */	stw r6, 0x0(r4)
/* 8002860C 0002458C  41 82 00 38 */	beq .L_80028644
/* 80028610 00024590  90 87 00 00 */	stw r4, 0x0(r7)
/* 80028614 00024594  80 A4 00 08 */	lwz r5, 0x8(r4)
/* 80028618 00024598  7C 04 2A 14 */	add r0, r4, r5
/* 8002861C 0002459C  7C 00 38 40 */	cmplw r0, r7
/* 80028620 000245A0  40 82 00 24 */	bne .L_80028644
/* 80028624 000245A4  80 07 00 08 */	lwz r0, 0x8(r7)
/* 80028628 000245A8  7C 05 02 14 */	add r0, r5, r0
/* 8002862C 000245AC  90 04 00 08 */	stw r0, 0x8(r4)
/* 80028630 000245B0  80 E7 00 04 */	lwz r7, 0x4(r7)
/* 80028634 000245B4  28 07 00 00 */	cmplwi r7, 0x0
/* 80028638 000245B8  90 E4 00 04 */	stw r7, 0x4(r4)
/* 8002863C 000245BC  41 82 00 08 */	beq .L_80028644
/* 80028640 000245C0  90 87 00 00 */	stw r4, 0x0(r7)
.L_80028644:
/* 80028644 000245C4  28 06 00 00 */	cmplwi r6, 0x0
/* 80028648 000245C8  41 82 00 38 */	beq .L_80028680
/* 8002864C 000245CC  90 86 00 04 */	stw r4, 0x4(r6)
/* 80028650 000245D0  80 A6 00 08 */	lwz r5, 0x8(r6)
/* 80028654 000245D4  7C 06 2A 14 */	add r0, r6, r5
/* 80028658 000245D8  7C 00 20 40 */	cmplw r0, r4
/* 8002865C 000245DC  4C 82 00 20 */	bnelr
/* 80028660 000245E0  80 04 00 08 */	lwz r0, 0x8(r4)
/* 80028664 000245E4  28 07 00 00 */	cmplwi r7, 0x0
/* 80028668 000245E8  7C 05 02 14 */	add r0, r5, r0
/* 8002866C 000245EC  90 06 00 08 */	stw r0, 0x8(r6)
/* 80028670 000245F0  90 E6 00 04 */	stw r7, 0x4(r6)
/* 80028674 000245F4  4D 82 00 20 */	beqlr
/* 80028678 000245F8  90 C7 00 00 */	stw r6, 0x0(r7)
/* 8002867C 000245FC  4E 80 00 20 */	blr
.L_80028680:
/* 80028680 00024600  7C 83 23 78 */	mr r3, r4
/* 80028684 00024604  4E 80 00 20 */	blr
.endfn DLInsert

.fn OSAllocFromHeap, global
/* 80028688 00024608  1C 03 00 0C */	mulli r0, r3, 0xc
/* 8002868C 0002460C  80 6D 84 68 */	lwz r3, HeapArray@sda21(r13)
/* 80028690 00024610  7C A3 02 14 */	add r5, r3, r0
/* 80028694 00024614  38 04 00 3F */	addi r0, r4, 0x3f
/* 80028698 00024618  80 C5 00 04 */	lwz r6, 0x4(r5)
/* 8002869C 0002461C  54 03 00 34 */	clrrwi r3, r0, 5
/* 800286A0 00024620  48 00 00 14 */	b .L_800286B4
.L_800286A4:
/* 800286A4 00024624  80 06 00 08 */	lwz r0, 0x8(r6)
/* 800286A8 00024628  7C 03 00 00 */	cmpw r3, r0
/* 800286AC 0002462C  40 81 00 10 */	ble .L_800286BC
/* 800286B0 00024630  80 C6 00 04 */	lwz r6, 0x4(r6)
.L_800286B4:
/* 800286B4 00024634  28 06 00 00 */	cmplwi r6, 0x0
/* 800286B8 00024638  40 82 FF EC */	bne .L_800286A4
.L_800286BC:
/* 800286BC 0002463C  28 06 00 00 */	cmplwi r6, 0x0
/* 800286C0 00024640  40 82 00 0C */	bne .L_800286CC
/* 800286C4 00024644  38 60 00 00 */	li r3, 0x0
/* 800286C8 00024648  4E 80 00 20 */	blr
.L_800286CC:
/* 800286CC 0002464C  80 06 00 08 */	lwz r0, 0x8(r6)
/* 800286D0 00024650  7C 03 00 50 */	subf r0, r3, r0
/* 800286D4 00024654  28 00 00 40 */	cmplwi r0, 0x40
/* 800286D8 00024658  40 80 00 40 */	bge .L_80028718
/* 800286DC 0002465C  80 86 00 04 */	lwz r4, 0x4(r6)
/* 800286E0 00024660  80 65 00 04 */	lwz r3, 0x4(r5)
/* 800286E4 00024664  28 04 00 00 */	cmplwi r4, 0x0
/* 800286E8 00024668  41 82 00 0C */	beq .L_800286F4
/* 800286EC 0002466C  80 06 00 00 */	lwz r0, 0x0(r6)
/* 800286F0 00024670  90 04 00 00 */	stw r0, 0x0(r4)
.L_800286F4:
/* 800286F4 00024674  80 86 00 00 */	lwz r4, 0x0(r6)
/* 800286F8 00024678  28 04 00 00 */	cmplwi r4, 0x0
/* 800286FC 0002467C  40 82 00 0C */	bne .L_80028708
/* 80028700 00024680  80 66 00 04 */	lwz r3, 0x4(r6)
/* 80028704 00024684  48 00 00 0C */	b .L_80028710
.L_80028708:
/* 80028708 00024688  80 06 00 04 */	lwz r0, 0x4(r6)
/* 8002870C 0002468C  90 04 00 04 */	stw r0, 0x4(r4)
.L_80028710:
/* 80028710 00024690  90 65 00 04 */	stw r3, 0x4(r5)
/* 80028714 00024694  48 00 00 48 */	b .L_8002875C
.L_80028718:
/* 80028718 00024698  90 66 00 08 */	stw r3, 0x8(r6)
/* 8002871C 0002469C  7C 86 1A 14 */	add r4, r6, r3
/* 80028720 000246A0  90 04 00 08 */	stw r0, 0x8(r4)
/* 80028724 000246A4  80 06 00 00 */	lwz r0, 0x0(r6)
/* 80028728 000246A8  90 04 00 00 */	stw r0, 0x0(r4)
/* 8002872C 000246AC  80 06 00 04 */	lwz r0, 0x4(r6)
/* 80028730 000246B0  90 04 00 04 */	stw r0, 0x4(r4)
/* 80028734 000246B4  80 64 00 04 */	lwz r3, 0x4(r4)
/* 80028738 000246B8  28 03 00 00 */	cmplwi r3, 0x0
/* 8002873C 000246BC  41 82 00 08 */	beq .L_80028744
/* 80028740 000246C0  90 83 00 00 */	stw r4, 0x0(r3)
.L_80028744:
/* 80028744 000246C4  80 64 00 00 */	lwz r3, 0x0(r4)
/* 80028748 000246C8  28 03 00 00 */	cmplwi r3, 0x0
/* 8002874C 000246CC  41 82 00 0C */	beq .L_80028758
/* 80028750 000246D0  90 83 00 04 */	stw r4, 0x4(r3)
/* 80028754 000246D4  48 00 00 08 */	b .L_8002875C
.L_80028758:
/* 80028758 000246D8  90 85 00 04 */	stw r4, 0x4(r5)
.L_8002875C:
/* 8002875C 000246DC  80 65 00 08 */	lwz r3, 0x8(r5)
/* 80028760 000246E0  38 00 00 00 */	li r0, 0x0
/* 80028764 000246E4  90 66 00 04 */	stw r3, 0x4(r6)
/* 80028768 000246E8  28 03 00 00 */	cmplwi r3, 0x0
/* 8002876C 000246EC  90 06 00 00 */	stw r0, 0x0(r6)
/* 80028770 000246F0  41 82 00 08 */	beq .L_80028778
/* 80028774 000246F4  90 C3 00 00 */	stw r6, 0x0(r3)
.L_80028778:
/* 80028778 000246F8  90 C5 00 08 */	stw r6, 0x8(r5)
/* 8002877C 000246FC  38 66 00 20 */	addi r3, r6, 0x20
/* 80028780 00024700  4E 80 00 20 */	blr
.endfn OSAllocFromHeap

.fn OSFreeToHeap, global
/* 80028784 00024704  7C 08 02 A6 */	mflr r0
/* 80028788 00024708  38 C4 FF E0 */	addi r6, r4, -0x20
/* 8002878C 0002470C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80028790 00024710  1C 03 00 0C */	mulli r0, r3, 0xc
/* 80028794 00024714  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80028798 00024718  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8002879C 0002471C  80 8D 84 68 */	lwz r4, HeapArray@sda21(r13)
/* 800287A0 00024720  80 66 00 04 */	lwz r3, 0x4(r6)
/* 800287A4 00024724  7F E4 02 14 */	add r31, r4, r0
/* 800287A8 00024728  28 03 00 00 */	cmplwi r3, 0x0
/* 800287AC 0002472C  80 BF 00 08 */	lwz r5, 0x8(r31)
/* 800287B0 00024730  7C C4 33 78 */	mr r4, r6
/* 800287B4 00024734  41 82 00 0C */	beq .L_800287C0
/* 800287B8 00024738  80 04 00 00 */	lwz r0, 0x0(r4)
/* 800287BC 0002473C  90 03 00 00 */	stw r0, 0x0(r3)
.L_800287C0:
/* 800287C0 00024740  80 64 00 00 */	lwz r3, 0x0(r4)
/* 800287C4 00024744  28 03 00 00 */	cmplwi r3, 0x0
/* 800287C8 00024748  40 82 00 0C */	bne .L_800287D4
/* 800287CC 0002474C  80 A4 00 04 */	lwz r5, 0x4(r4)
/* 800287D0 00024750  48 00 00 0C */	b .L_800287DC
.L_800287D4:
/* 800287D4 00024754  80 04 00 04 */	lwz r0, 0x4(r4)
/* 800287D8 00024758  90 03 00 04 */	stw r0, 0x4(r3)
.L_800287DC:
/* 800287DC 0002475C  90 BF 00 08 */	stw r5, 0x8(r31)
/* 800287E0 00024760  80 7F 00 04 */	lwz r3, 0x4(r31)
/* 800287E4 00024764  4B FF FD F9 */	bl DLInsert
/* 800287E8 00024768  90 7F 00 04 */	stw r3, 0x4(r31)
/* 800287EC 0002476C  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800287F0 00024770  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800287F4 00024774  38 21 00 18 */	addi r1, r1, 0x18
/* 800287F8 00024778  7C 08 03 A6 */	mtlr r0
/* 800287FC 0002477C  4E 80 00 20 */	blr
.endfn OSFreeToHeap

.fn OSSetCurrentHeap, global
/* 80028800 00024780  80 0D 82 18 */	lwz r0, __OSCurrHeap@sda21(r13)
/* 80028804 00024784  90 6D 82 18 */	stw r3, __OSCurrHeap@sda21(r13)
/* 80028808 00024788  7C 03 03 78 */	mr r3, r0
/* 8002880C 0002478C  4E 80 00 20 */	blr
.endfn OSSetCurrentHeap

.fn OSInitAlloc, global
/* 80028810 00024790  1C E5 00 0C */	mulli r7, r5, 0xc
/* 80028814 00024794  90 6D 84 68 */	stw r3, HeapArray@sda21(r13)
/* 80028818 00024798  90 AD 84 6C */	stw r5, NumHeaps@sda21(r13)
/* 8002881C 0002479C  38 C0 00 00 */	li r6, 0x0
/* 80028820 000247A0  38 66 00 00 */	addi r3, r6, 0x0
/* 80028824 000247A4  39 00 00 00 */	li r8, 0x0
/* 80028828 000247A8  38 A0 FF FF */	li r5, -0x1
/* 8002882C 000247AC  48 00 00 20 */	b .L_8002884C
.L_80028830:
/* 80028830 000247B0  80 0D 84 68 */	lwz r0, HeapArray@sda21(r13)
/* 80028834 000247B4  39 08 00 01 */	addi r8, r8, 0x1
/* 80028838 000247B8  7D 20 32 14 */	add r9, r0, r6
/* 8002883C 000247BC  90 A9 00 00 */	stw r5, 0x0(r9)
/* 80028840 000247C0  38 C6 00 0C */	addi r6, r6, 0xc
/* 80028844 000247C4  90 69 00 08 */	stw r3, 0x8(r9)
/* 80028848 000247C8  90 69 00 04 */	stw r3, 0x4(r9)
.L_8002884C:
/* 8002884C 000247CC  80 0D 84 6C */	lwz r0, NumHeaps@sda21(r13)
/* 80028850 000247D0  7C 08 00 00 */	cmpw r8, r0
/* 80028854 000247D4  41 80 FF DC */	blt .L_80028830
/* 80028858 000247D8  80 6D 84 68 */	lwz r3, HeapArray@sda21(r13)
/* 8002885C 000247DC  54 80 00 34 */	clrrwi r0, r4, 5
/* 80028860 000247E0  38 80 FF FF */	li r4, -0x1
/* 80028864 000247E4  90 0D 84 74 */	stw r0, ArenaEnd@sda21(r13)
/* 80028868 000247E8  7C 63 3A 14 */	add r3, r3, r7
/* 8002886C 000247EC  38 03 00 1F */	addi r0, r3, 0x1f
/* 80028870 000247F0  90 8D 82 18 */	stw r4, __OSCurrHeap@sda21(r13)
/* 80028874 000247F4  54 03 00 34 */	clrrwi r3, r0, 5
/* 80028878 000247F8  90 6D 84 70 */	stw r3, ArenaStart@sda21(r13)
/* 8002887C 000247FC  4E 80 00 20 */	blr
.endfn OSInitAlloc

.fn OSCreateHeap, global
/* 80028880 00024800  80 CD 84 6C */	lwz r6, NumHeaps@sda21(r13)
/* 80028884 00024804  38 03 00 1F */	addi r0, r3, 0x1f
/* 80028888 00024808  80 AD 84 68 */	lwz r5, HeapArray@sda21(r13)
/* 8002888C 0002480C  54 07 00 34 */	clrrwi r7, r0, 5
/* 80028890 00024810  2C 06 00 00 */	cmpwi r6, 0x0
/* 80028894 00024814  7C C9 03 A6 */	mtctr r6
/* 80028898 00024818  54 84 00 34 */	clrrwi r4, r4, 5
/* 8002889C 0002481C  38 60 00 00 */	li r3, 0x0
/* 800288A0 00024820  40 81 00 44 */	ble .L_800288E4
.L_800288A4:
/* 800288A4 00024824  80 05 00 00 */	lwz r0, 0x0(r5)
/* 800288A8 00024828  2C 00 00 00 */	cmpwi r0, 0x0
/* 800288AC 0002482C  40 80 00 2C */	bge .L_800288D8
/* 800288B0 00024830  7C 07 20 50 */	subf r0, r7, r4
/* 800288B4 00024834  90 05 00 00 */	stw r0, 0x0(r5)
/* 800288B8 00024838  38 80 00 00 */	li r4, 0x0
/* 800288BC 0002483C  90 87 00 00 */	stw r4, 0x0(r7)
/* 800288C0 00024840  90 87 00 04 */	stw r4, 0x4(r7)
/* 800288C4 00024844  80 05 00 00 */	lwz r0, 0x0(r5)
/* 800288C8 00024848  90 07 00 08 */	stw r0, 0x8(r7)
/* 800288CC 0002484C  90 E5 00 04 */	stw r7, 0x4(r5)
/* 800288D0 00024850  90 85 00 08 */	stw r4, 0x8(r5)
/* 800288D4 00024854  4E 80 00 20 */	blr
.L_800288D8:
/* 800288D8 00024858  38 A5 00 0C */	addi r5, r5, 0xc
/* 800288DC 0002485C  38 63 00 01 */	addi r3, r3, 0x1
/* 800288E0 00024860  42 00 FF C4 */	bdnz .L_800288A4
.L_800288E4:
/* 800288E4 00024864  38 60 FF FF */	li r3, -0x1
/* 800288E8 00024868  4E 80 00 20 */	blr
.endfn OSCreateHeap

.fn OSCheckHeap, global
/* 800288EC 0002486C  7C 08 02 A6 */	mflr r0
/* 800288F0 00024870  3C 80 80 06 */	lis r4, lbl_800676B0@ha
/* 800288F4 00024874  90 01 00 04 */	stw r0, 0x4(r1)
/* 800288F8 00024878  38 C4 76 B0 */	addi r6, r4, lbl_800676B0@l
/* 800288FC 0002487C  38 00 00 00 */	li r0, 0x0
/* 80028900 00024880  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80028904 00024884  38 80 00 00 */	li r4, 0x0
/* 80028908 00024888  80 ED 84 68 */	lwz r7, HeapArray@sda21(r13)
/* 8002890C 0002488C  28 07 00 00 */	cmplwi r7, 0x0
/* 80028910 00024890  40 82 00 1C */	bne .L_8002892C
/* 80028914 00024894  38 66 00 00 */	addi r3, r6, 0x0
/* 80028918 00024898  4C C6 31 82 */	crclr 4*cr1+eq
/* 8002891C 0002489C  38 80 03 7D */	li r4, 0x37d
/* 80028920 000248A0  48 00 12 C5 */	bl OSReport
/* 80028924 000248A4  38 60 FF FF */	li r3, -0x1
/* 80028928 000248A8  48 00 03 14 */	b .L_80028C3C
.L_8002892C:
/* 8002892C 000248AC  2C 03 00 00 */	cmpwi r3, 0x0
/* 80028930 000248B0  41 80 00 10 */	blt .L_80028940
/* 80028934 000248B4  80 AD 84 6C */	lwz r5, NumHeaps@sda21(r13)
/* 80028938 000248B8  7C 03 28 00 */	cmpw r3, r5
/* 8002893C 000248BC  41 80 00 1C */	blt .L_80028958
.L_80028940:
/* 80028940 000248C0  38 66 00 24 */	addi r3, r6, 0x24
/* 80028944 000248C4  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028948 000248C8  38 80 03 7E */	li r4, 0x37e
/* 8002894C 000248CC  48 00 12 99 */	bl OSReport
/* 80028950 000248D0  38 60 FF FF */	li r3, -0x1
/* 80028954 000248D4  48 00 02 E8 */	b .L_80028C3C
.L_80028958:
/* 80028958 000248D8  1C 63 00 0C */	mulli r3, r3, 0xc
/* 8002895C 000248DC  7C A7 1A 14 */	add r5, r7, r3
/* 80028960 000248E0  80 65 00 00 */	lwz r3, 0x0(r5)
/* 80028964 000248E4  2C 03 00 00 */	cmpwi r3, 0x0
/* 80028968 000248E8  40 80 00 1C */	bge .L_80028984
/* 8002896C 000248EC  38 66 00 5C */	addi r3, r6, 0x5c
/* 80028970 000248F0  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028974 000248F4  38 80 03 81 */	li r4, 0x381
/* 80028978 000248F8  48 00 12 6D */	bl OSReport
/* 8002897C 000248FC  38 60 FF FF */	li r3, -0x1
/* 80028980 00024900  48 00 02 BC */	b .L_80028C3C
.L_80028984:
/* 80028984 00024904  80 E5 00 08 */	lwz r7, 0x8(r5)
/* 80028988 00024908  28 07 00 00 */	cmplwi r7, 0x0
/* 8002898C 0002490C  41 82 00 28 */	beq .L_800289B4
/* 80028990 00024910  80 67 00 00 */	lwz r3, 0x0(r7)
/* 80028994 00024914  28 03 00 00 */	cmplwi r3, 0x0
/* 80028998 00024918  41 82 00 1C */	beq .L_800289B4
/* 8002899C 0002491C  38 66 00 84 */	addi r3, r6, 0x84
/* 800289A0 00024920  4C C6 31 82 */	crclr 4*cr1+eq
/* 800289A4 00024924  38 80 03 83 */	li r4, 0x383
/* 800289A8 00024928  48 00 12 3D */	bl OSReport
/* 800289AC 0002492C  38 60 FF FF */	li r3, -0x1
/* 800289B0 00024930  48 00 02 8C */	b .L_80028C3C
.L_800289B4:
/* 800289B4 00024934  81 2D 84 70 */	lwz r9, ArenaStart@sda21(r13)
/* 800289B8 00024938  7C E8 3B 78 */	mr r8, r7
/* 800289BC 0002493C  81 4D 84 74 */	lwz r10, ArenaEnd@sda21(r13)
/* 800289C0 00024940  48 00 00 F0 */	b .L_80028AB0
.L_800289C4:
/* 800289C4 00024944  7C 09 40 40 */	cmplw r9, r8
/* 800289C8 00024948  41 81 00 0C */	bgt .L_800289D4
/* 800289CC 0002494C  7C 08 50 40 */	cmplw r8, r10
/* 800289D0 00024950  41 80 00 1C */	blt .L_800289EC
.L_800289D4:
/* 800289D4 00024954  38 66 00 D4 */	addi r3, r6, 0xd4
/* 800289D8 00024958  4C C6 31 82 */	crclr 4*cr1+eq
/* 800289DC 0002495C  38 80 03 86 */	li r4, 0x386
/* 800289E0 00024960  48 00 12 05 */	bl OSReport
/* 800289E4 00024964  38 60 FF FF */	li r3, -0x1
/* 800289E8 00024968  48 00 02 54 */	b .L_80028C3C
.L_800289EC:
/* 800289EC 0002496C  55 03 06 FF */	clrlwi. r3, r8, 27
/* 800289F0 00024970  41 82 00 1C */	beq .L_80028A0C
/* 800289F4 00024974  38 66 01 14 */	addi r3, r6, 0x114
/* 800289F8 00024978  4C C6 31 82 */	crclr 4*cr1+eq
/* 800289FC 0002497C  38 80 03 87 */	li r4, 0x387
/* 80028A00 00024980  48 00 11 E5 */	bl OSReport
/* 80028A04 00024984  38 60 FF FF */	li r3, -0x1
/* 80028A08 00024988  48 00 02 34 */	b .L_80028C3C
.L_80028A0C:
/* 80028A0C 0002498C  80 E8 00 04 */	lwz r7, 0x4(r8)
/* 80028A10 00024990  28 07 00 00 */	cmplwi r7, 0x0
/* 80028A14 00024994  41 82 00 28 */	beq .L_80028A3C
/* 80028A18 00024998  80 67 00 00 */	lwz r3, 0x0(r7)
/* 80028A1C 0002499C  7C 03 40 40 */	cmplw r3, r8
/* 80028A20 000249A0  41 82 00 1C */	beq .L_80028A3C
/* 80028A24 000249A4  38 66 01 4C */	addi r3, r6, 0x14c
/* 80028A28 000249A8  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028A2C 000249AC  38 80 03 88 */	li r4, 0x388
/* 80028A30 000249B0  48 00 11 B5 */	bl OSReport
/* 80028A34 000249B4  38 60 FF FF */	li r3, -0x1
/* 80028A38 000249B8  48 00 02 04 */	b .L_80028C3C
.L_80028A3C:
/* 80028A3C 000249BC  81 08 00 08 */	lwz r8, 0x8(r8)
/* 80028A40 000249C0  28 08 00 40 */	cmplwi r8, 0x40
/* 80028A44 000249C4  40 80 00 1C */	bge .L_80028A60
/* 80028A48 000249C8  38 66 01 98 */	addi r3, r6, 0x198
/* 80028A4C 000249CC  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028A50 000249D0  38 80 03 89 */	li r4, 0x389
/* 80028A54 000249D4  48 00 11 91 */	bl OSReport
/* 80028A58 000249D8  38 60 FF FF */	li r3, -0x1
/* 80028A5C 000249DC  48 00 01 E0 */	b .L_80028C3C
.L_80028A60:
/* 80028A60 000249E0  55 03 06 FF */	clrlwi. r3, r8, 27
/* 80028A64 000249E4  41 82 00 1C */	beq .L_80028A80
/* 80028A68 000249E8  38 66 01 CC */	addi r3, r6, 0x1cc
/* 80028A6C 000249EC  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028A70 000249F0  38 80 03 8A */	li r4, 0x38a
/* 80028A74 000249F4  48 00 11 71 */	bl OSReport
/* 80028A78 000249F8  38 60 FF FF */	li r3, -0x1
/* 80028A7C 000249FC  48 00 01 C0 */	b .L_80028C3C
.L_80028A80:
/* 80028A80 00024A00  7C 00 42 15 */	add. r0, r0, r8
/* 80028A84 00024A04  40 81 00 10 */	ble .L_80028A94
/* 80028A88 00024A08  80 65 00 00 */	lwz r3, 0x0(r5)
/* 80028A8C 00024A0C  7C 00 18 00 */	cmpw r0, r3
/* 80028A90 00024A10  40 81 00 1C */	ble .L_80028AAC
.L_80028A94:
/* 80028A94 00024A14  38 66 02 0C */	addi r3, r6, 0x20c
/* 80028A98 00024A18  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028A9C 00024A1C  38 80 03 8D */	li r4, 0x38d
/* 80028AA0 00024A20  48 00 11 45 */	bl OSReport
/* 80028AA4 00024A24  38 60 FF FF */	li r3, -0x1
/* 80028AA8 00024A28  48 00 01 94 */	b .L_80028C3C
.L_80028AAC:
/* 80028AAC 00024A2C  7C E8 3B 78 */	mr r8, r7
.L_80028AB0:
/* 80028AB0 00024A30  28 08 00 00 */	cmplwi r8, 0x0
/* 80028AB4 00024A34  40 82 FF 10 */	bne .L_800289C4
/* 80028AB8 00024A38  81 65 00 04 */	lwz r11, 0x4(r5)
/* 80028ABC 00024A3C  28 0B 00 00 */	cmplwi r11, 0x0
/* 80028AC0 00024A40  41 82 01 4C */	beq .L_80028C0C
/* 80028AC4 00024A44  80 6B 00 00 */	lwz r3, 0x0(r11)
/* 80028AC8 00024A48  28 03 00 00 */	cmplwi r3, 0x0
/* 80028ACC 00024A4C  41 82 01 40 */	beq .L_80028C0C
/* 80028AD0 00024A50  38 66 02 48 */	addi r3, r6, 0x248
/* 80028AD4 00024A54  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028AD8 00024A58  38 80 03 95 */	li r4, 0x395
/* 80028ADC 00024A5C  48 00 11 09 */	bl OSReport
/* 80028AE0 00024A60  38 60 FF FF */	li r3, -0x1
/* 80028AE4 00024A64  48 00 01 58 */	b .L_80028C3C
/* 80028AE8 00024A68  48 00 01 24 */	b .L_80028C0C
.L_80028AEC:
/* 80028AEC 00024A6C  7C 09 58 40 */	cmplw r9, r11
/* 80028AF0 00024A70  41 81 00 0C */	bgt .L_80028AFC
/* 80028AF4 00024A74  7C 0B 50 40 */	cmplw r11, r10
/* 80028AF8 00024A78  41 80 00 1C */	blt .L_80028B14
.L_80028AFC:
/* 80028AFC 00024A7C  38 66 00 D4 */	addi r3, r6, 0xd4
/* 80028B00 00024A80  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028B04 00024A84  38 80 03 98 */	li r4, 0x398
/* 80028B08 00024A88  48 00 10 DD */	bl OSReport
/* 80028B0C 00024A8C  38 60 FF FF */	li r3, -0x1
/* 80028B10 00024A90  48 00 01 2C */	b .L_80028C3C
.L_80028B14:
/* 80028B14 00024A94  55 63 06 FF */	clrlwi. r3, r11, 27
/* 80028B18 00024A98  41 82 00 1C */	beq .L_80028B34
/* 80028B1C 00024A9C  38 66 01 14 */	addi r3, r6, 0x114
/* 80028B20 00024AA0  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028B24 00024AA4  38 80 03 99 */	li r4, 0x399
/* 80028B28 00024AA8  48 00 10 BD */	bl OSReport
/* 80028B2C 00024AAC  38 60 FF FF */	li r3, -0x1
/* 80028B30 00024AB0  48 00 01 0C */	b .L_80028C3C
.L_80028B34:
/* 80028B34 00024AB4  80 EB 00 04 */	lwz r7, 0x4(r11)
/* 80028B38 00024AB8  28 07 00 00 */	cmplwi r7, 0x0
/* 80028B3C 00024ABC  41 82 00 28 */	beq .L_80028B64
/* 80028B40 00024AC0  80 67 00 00 */	lwz r3, 0x0(r7)
/* 80028B44 00024AC4  7C 03 58 40 */	cmplw r3, r11
/* 80028B48 00024AC8  41 82 00 1C */	beq .L_80028B64
/* 80028B4C 00024ACC  38 66 01 4C */	addi r3, r6, 0x14c
/* 80028B50 00024AD0  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028B54 00024AD4  38 80 03 9A */	li r4, 0x39a
/* 80028B58 00024AD8  48 00 10 8D */	bl OSReport
/* 80028B5C 00024ADC  38 60 FF FF */	li r3, -0x1
/* 80028B60 00024AE0  48 00 00 DC */	b .L_80028C3C
.L_80028B64:
/* 80028B64 00024AE4  81 0B 00 08 */	lwz r8, 0x8(r11)
/* 80028B68 00024AE8  28 08 00 40 */	cmplwi r8, 0x40
/* 80028B6C 00024AEC  40 80 00 1C */	bge .L_80028B88
/* 80028B70 00024AF0  38 66 01 98 */	addi r3, r6, 0x198
/* 80028B74 00024AF4  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028B78 00024AF8  38 80 03 9B */	li r4, 0x39b
/* 80028B7C 00024AFC  48 00 10 69 */	bl OSReport
/* 80028B80 00024B00  38 60 FF FF */	li r3, -0x1
/* 80028B84 00024B04  48 00 00 B8 */	b .L_80028C3C
.L_80028B88:
/* 80028B88 00024B08  55 03 06 FF */	clrlwi. r3, r8, 27
/* 80028B8C 00024B0C  41 82 00 1C */	beq .L_80028BA8
/* 80028B90 00024B10  38 66 01 CC */	addi r3, r6, 0x1cc
/* 80028B94 00024B14  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028B98 00024B18  38 80 03 9C */	li r4, 0x39c
/* 80028B9C 00024B1C  48 00 10 49 */	bl OSReport
/* 80028BA0 00024B20  38 60 FF FF */	li r3, -0x1
/* 80028BA4 00024B24  48 00 00 98 */	b .L_80028C3C
.L_80028BA8:
/* 80028BA8 00024B28  28 07 00 00 */	cmplwi r7, 0x0
/* 80028BAC 00024B2C  41 82 00 28 */	beq .L_80028BD4
/* 80028BB0 00024B30  7C 6B 42 14 */	add r3, r11, r8
/* 80028BB4 00024B34  7C 03 38 40 */	cmplw r3, r7
/* 80028BB8 00024B38  41 80 00 1C */	blt .L_80028BD4
/* 80028BBC 00024B3C  38 66 02 90 */	addi r3, r6, 0x290
/* 80028BC0 00024B40  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028BC4 00024B44  38 80 03 9D */	li r4, 0x39d
/* 80028BC8 00024B48  48 00 10 1D */	bl OSReport
/* 80028BCC 00024B4C  38 60 FF FF */	li r3, -0x1
/* 80028BD0 00024B50  48 00 00 6C */	b .L_80028C3C
.L_80028BD4:
/* 80028BD4 00024B54  7C 00 42 15 */	add. r0, r0, r8
/* 80028BD8 00024B58  7C 88 22 14 */	add r4, r8, r4
/* 80028BDC 00024B5C  38 84 FF E0 */	addi r4, r4, -0x20
/* 80028BE0 00024B60  40 81 00 10 */	ble .L_80028BF0
/* 80028BE4 00024B64  80 65 00 00 */	lwz r3, 0x0(r5)
/* 80028BE8 00024B68  7C 00 18 00 */	cmpw r0, r3
/* 80028BEC 00024B6C  40 81 00 1C */	ble .L_80028C08
.L_80028BF0:
/* 80028BF0 00024B70  38 66 02 0C */	addi r3, r6, 0x20c
/* 80028BF4 00024B74  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028BF8 00024B78  38 80 03 A1 */	li r4, 0x3a1
/* 80028BFC 00024B7C  48 00 0F E9 */	bl OSReport
/* 80028C00 00024B80  38 60 FF FF */	li r3, -0x1
/* 80028C04 00024B84  48 00 00 38 */	b .L_80028C3C
.L_80028C08:
/* 80028C08 00024B88  7C EB 3B 78 */	mr r11, r7
.L_80028C0C:
/* 80028C0C 00024B8C  28 0B 00 00 */	cmplwi r11, 0x0
/* 80028C10 00024B90  40 82 FE DC */	bne .L_80028AEC
/* 80028C14 00024B94  80 65 00 00 */	lwz r3, 0x0(r5)
/* 80028C18 00024B98  7C 00 18 00 */	cmpw r0, r3
/* 80028C1C 00024B9C  41 82 00 1C */	beq .L_80028C38
/* 80028C20 00024BA0  38 66 02 F0 */	addi r3, r6, 0x2f0
/* 80028C24 00024BA4  4C C6 31 82 */	crclr 4*cr1+eq
/* 80028C28 00024BA8  38 80 03 A8 */	li r4, 0x3a8
/* 80028C2C 00024BAC  48 00 0F B9 */	bl OSReport
/* 80028C30 00024BB0  38 60 FF FF */	li r3, -0x1
/* 80028C34 00024BB4  48 00 00 08 */	b .L_80028C3C
.L_80028C38:
/* 80028C38 00024BB8  7C 83 23 78 */	mr r3, r4
.L_80028C3C:
/* 80028C3C 00024BBC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80028C40 00024BC0  38 21 00 08 */	addi r1, r1, 0x8
/* 80028C44 00024BC4  7C 08 03 A6 */	mtlr r0
/* 80028C48 00024BC8  4E 80 00 20 */	blr
.endfn OSCheckHeap

.section .data, "wa"  # 0x80065000 - 0x8006D1C0


.obj lbl_800676B0, local
	.asciz "OSCheckHeap: Failed HeapArray in %d"
	.asciz "OSCheckHeap: Failed 0 <= heap && heap < NumHeaps in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed 0 <= hd->size in %d"
	.asciz "OSCheckHeap: Failed hd->allocated == NULL || hd->allocated->prev == NULL in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed InRange(cell, ArenaStart, ArenaEnd) in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed OFFSET(cell, ALIGNMENT) == 0 in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed cell->next == NULL || cell->next->prev == cell in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed MINOBJSIZE <= cell->size in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed OFFSET(cell->size, ALIGNMENT) == 0 in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed 0 < total && total <= hd->size in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed hd->free == NULL || hd->free->prev == NULL in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed cell->next == NULL || (char*) cell + cell->size < (char*) cell->next in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed total == hd->size in %d"
	.asciz "\nOSDumpHeap(%d):\n"
	.balign 4
	.asciz "--------Inactive\n"
	.balign 4
	.asciz "addr\tsize\t\tend\tprev\tnext\n"
	.balign 4
	.asciz "--------Allocated\n"
	.balign 4
	.asciz "%x\t%d\t%x\t%x\t%x\n"
	.asciz "--------Free\n"
	.balign 4
	.4byte 0
.endobj lbl_800676B0

.section .sdata, "wa"  # 0x800A8A80 - 0x800A8DC0

.obj __OSCurrHeap, global
	.4byte 0xFFFFFFFF
	.4byte 0
.endobj __OSCurrHeap

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380


.obj HeapArray, local
	.skip 0x4
.endobj HeapArray

.obj NumHeaps, local
	.skip 0x4
.endobj NumHeaps

.obj ArenaStart, local
	.skip 0x4
.endobj ArenaStart

.obj ArenaEnd, local
	.skip 0x4
.endobj ArenaEnd
