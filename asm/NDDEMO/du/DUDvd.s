.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740


.global __ct__5DUDvdFv
__ct__5DUDvdFv:
/* 80012648 0000E5C8  7C 08 02 A6 */	mflr r0
/* 8001264C 0000E5CC  90 01 00 04 */	stw r0, 0x4(r1)
/* 80012650 0000E5D0  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80012654 0000E5D4  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80012658 0000E5D8  7C 7F 1B 78 */	mr r31, r3
/* 8001265C 0000E5DC  48 00 00 71 */	bl Init__5DUDvdFv
/* 80012660 0000E5E0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80012664 0000E5E4  7F E3 FB 78 */	mr r3, r31
/* 80012668 0000E5E8  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8001266C 0000E5EC  38 21 00 18 */	addi r1, r1, 0x18
/* 80012670 0000E5F0  7C 08 03 A6 */	mtlr r0
/* 80012674 0000E5F4  4E 80 00 20 */	blr

.global __dt__5DUDvdFv
__dt__5DUDvdFv:
/* 80012678 0000E5F8  7C 08 02 A6 */	mflr r0
/* 8001267C 0000E5FC  90 01 00 04 */	stw r0, 0x4(r1)
/* 80012680 0000E600  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80012684 0000E604  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80012688 0000E608  3B E4 00 00 */	addi r31, r4, 0x0
/* 8001268C 0000E60C  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80012690 0000E610  7C 7E 1B 79 */	mr. r30, r3
/* 80012694 0000E614  41 82 00 1C */	beq .L_800126B0
/* 80012698 0000E618  7F C3 F3 78 */	mr r3, r30
/* 8001269C 0000E61C  48 00 00 A1 */	bl Close__5DUDvdFv
/* 800126A0 0000E620  7F E0 07 35 */	extsh. r0, r31
/* 800126A4 0000E624  40 81 00 0C */	ble .L_800126B0
/* 800126A8 0000E628  7F C3 F3 78 */	mr r3, r30
/* 800126AC 0000E62C  48 00 03 ED */	bl mFree__FPv
.L_800126B0:
/* 800126B0 0000E630  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800126B4 0000E634  7F C3 F3 78 */	mr r3, r30
/* 800126B8 0000E638  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800126BC 0000E63C  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800126C0 0000E640  7C 08 03 A6 */	mtlr r0
/* 800126C4 0000E644  38 21 00 18 */	addi r1, r1, 0x18
/* 800126C8 0000E648  4E 80 00 20 */	blr

.global Init__5DUDvdFv
Init__5DUDvdFv:
/* 800126CC 0000E64C  7C 08 02 A6 */	mflr r0
/* 800126D0 0000E650  90 01 00 04 */	stw r0, 0x4(r1)
/* 800126D4 0000E654  38 00 00 00 */	li r0, 0x0
/* 800126D8 0000E658  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 800126DC 0000E65C  90 03 00 00 */	stw r0, 0x0(r3)
/* 800126E0 0000E660  90 03 00 10 */	stw r0, 0x10(r3)
/* 800126E4 0000E664  90 03 00 04 */	stw r0, 0x4(r3)
/* 800126E8 0000E668  90 03 00 08 */	stw r0, 0x8(r3)
/* 800126EC 0000E66C  90 03 00 0C */	stw r0, 0xc(r3)
/* 800126F0 0000E670  90 03 00 14 */	stw r0, 0x14(r3)
/* 800126F4 0000E674  48 00 00 15 */	bl InitDVD__5DUDvdFv
/* 800126F8 0000E678  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800126FC 0000E67C  38 21 00 08 */	addi r1, r1, 0x8
/* 80012700 0000E680  7C 08 03 A6 */	mtlr r0
/* 80012704 0000E684  4E 80 00 20 */	blr

.global InitDVD__5DUDvdFv
InitDVD__5DUDvdFv:
/* 80012708 0000E688  7C 08 02 A6 */	mflr r0
/* 8001270C 0000E68C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80012710 0000E690  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80012714 0000E694  88 0D 81 00 */	lbz r0, m_InitDVD__5DUDvd@sda21(r13)
/* 80012718 0000E698  28 00 00 00 */	cmplwi r0, 0x0
/* 8001271C 0000E69C  40 82 00 10 */	bne .L_8001272C
/* 80012720 0000E6A0  48 01 F1 25 */	bl DVDInit
/* 80012724 0000E6A4  38 00 00 01 */	li r0, 0x1
/* 80012728 0000E6A8  98 0D 81 00 */	stb r0, m_InitDVD__5DUDvd@sda21(r13)
.L_8001272C:
/* 8001272C 0000E6AC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80012730 0000E6B0  38 21 00 08 */	addi r1, r1, 0x8
/* 80012734 0000E6B4  7C 08 03 A6 */	mtlr r0
/* 80012738 0000E6B8  4E 80 00 20 */	blr

.global Close__5DUDvdFv
Close__5DUDvdFv:
/* 8001273C 0000E6BC  7C 08 02 A6 */	mflr r0
/* 80012740 0000E6C0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80012744 0000E6C4  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80012748 0000E6C8  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8001274C 0000E6CC  7C 7F 1B 78 */	mr r31, r3
/* 80012750 0000E6D0  80 63 00 00 */	lwz r3, 0x0(r3)
/* 80012754 0000E6D4  28 03 00 00 */	cmplwi r3, 0x0
/* 80012758 0000E6D8  41 82 00 20 */	beq .L_80012778
/* 8001275C 0000E6DC  48 01 ED 65 */	bl DVDClose
/* 80012760 0000E6E0  80 7F 00 00 */	lwz r3, 0x0(r31)
/* 80012764 0000E6E4  28 03 00 00 */	cmplwi r3, 0x0
/* 80012768 0000E6E8  41 82 00 10 */	beq .L_80012778
/* 8001276C 0000E6EC  48 00 03 2D */	bl mFree__FPv
/* 80012770 0000E6F0  38 00 00 00 */	li r0, 0x0
/* 80012774 0000E6F4  90 1F 00 00 */	stw r0, 0x0(r31)
.L_80012778:
/* 80012778 0000E6F8  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 8001277C 0000E6FC  28 03 00 00 */	cmplwi r3, 0x0
/* 80012780 0000E700  41 82 00 10 */	beq .L_80012790
/* 80012784 0000E704  48 00 03 15 */	bl mFree__FPv
/* 80012788 0000E708  38 00 00 00 */	li r0, 0x0
/* 8001278C 0000E70C  90 1F 00 10 */	stw r0, 0x10(r31)
.L_80012790:
/* 80012790 0000E710  38 00 00 00 */	li r0, 0x0
/* 80012794 0000E714  90 1F 00 04 */	stw r0, 0x4(r31)
/* 80012798 0000E718  90 1F 00 08 */	stw r0, 0x8(r31)
/* 8001279C 0000E71C  90 1F 00 0C */	stw r0, 0xc(r31)
/* 800127A0 0000E720  90 1F 00 14 */	stw r0, 0x14(r31)
/* 800127A4 0000E724  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800127A8 0000E728  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800127AC 0000E72C  38 21 00 18 */	addi r1, r1, 0x18
/* 800127B0 0000E730  7C 08 03 A6 */	mtlr r0
/* 800127B4 0000E734  4E 80 00 20 */	blr

.global Open__5DUDvdFPc20enumDU_DVD_OPEN_MODE
Open__5DUDvdFPc20enumDU_DVD_OPEN_MODE:
/* 800127B8 0000E738  7C 08 02 A6 */	mflr r0
/* 800127BC 0000E73C  90 01 00 04 */	stw r0, 0x4(r1)
/* 800127C0 0000E740  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800127C4 0000E744  93 E1 00 24 */	stw r31, 0x24(r1)
/* 800127C8 0000E748  7C 7F 1B 78 */	mr r31, r3
/* 800127CC 0000E74C  93 C1 00 20 */	stw r30, 0x20(r1)
/* 800127D0 0000E750  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 800127D4 0000E754  3B A5 00 00 */	addi r29, r5, 0x0
/* 800127D8 0000E758  93 81 00 18 */	stw r28, 0x18(r1)
/* 800127DC 0000E75C  3B 84 00 00 */	addi r28, r4, 0x0
/* 800127E0 0000E760  80 63 00 00 */	lwz r3, 0x0(r3)
/* 800127E4 0000E764  28 03 00 00 */	cmplwi r3, 0x0
/* 800127E8 0000E768  41 82 00 20 */	beq .L_80012808
/* 800127EC 0000E76C  48 01 EC D5 */	bl DVDClose
/* 800127F0 0000E770  80 7F 00 00 */	lwz r3, 0x0(r31)
/* 800127F4 0000E774  28 03 00 00 */	cmplwi r3, 0x0
/* 800127F8 0000E778  41 82 00 10 */	beq .L_80012808
/* 800127FC 0000E77C  48 00 02 9D */	bl mFree__FPv
/* 80012800 0000E780  38 00 00 00 */	li r0, 0x0
/* 80012804 0000E784  90 1F 00 00 */	stw r0, 0x0(r31)
.L_80012808:
/* 80012808 0000E788  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 8001280C 0000E78C  28 03 00 00 */	cmplwi r3, 0x0
/* 80012810 0000E790  41 82 00 10 */	beq .L_80012820
/* 80012814 0000E794  48 00 02 85 */	bl mFree__FPv
/* 80012818 0000E798  38 00 00 00 */	li r0, 0x0
/* 8001281C 0000E79C  90 1F 00 10 */	stw r0, 0x10(r31)
.L_80012820:
/* 80012820 0000E7A0  3B C0 00 00 */	li r30, 0x0
/* 80012824 0000E7A4  93 DF 00 04 */	stw r30, 0x4(r31)
/* 80012828 0000E7A8  38 60 00 3C */	li r3, 0x3c
/* 8001282C 0000E7AC  93 DF 00 08 */	stw r30, 0x8(r31)
/* 80012830 0000E7B0  93 DF 00 0C */	stw r30, 0xc(r31)
/* 80012834 0000E7B4  93 DF 00 14 */	stw r30, 0x14(r31)
/* 80012838 0000E7B8  93 BF 00 14 */	stw r29, 0x14(r31)
/* 8001283C 0000E7BC  48 00 01 BD */	bl mAlloc__FUl
/* 80012840 0000E7C0  90 7F 00 00 */	stw r3, 0x0(r31)
/* 80012844 0000E7C4  7F 83 E3 78 */	mr r3, r28
/* 80012848 0000E7C8  80 9F 00 00 */	lwz r4, 0x0(r31)
/* 8001284C 0000E7CC  48 01 EB AD */	bl DVDOpen
/* 80012850 0000E7D0  2C 03 00 01 */	cmpwi r3, 0x1
/* 80012854 0000E7D4  40 82 00 74 */	bne .L_800128C8
/* 80012858 0000E7D8  80 7F 00 00 */	lwz r3, 0x0(r31)
/* 8001285C 0000E7DC  80 03 00 34 */	lwz r0, 0x34(r3)
/* 80012860 0000E7E0  90 1F 00 04 */	stw r0, 0x4(r31)
/* 80012864 0000E7E4  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 80012868 0000E7E8  2C 00 00 02 */	cmpwi r0, 0x2
/* 8001286C 0000E7EC  41 82 00 0C */	beq .L_80012878
/* 80012870 0000E7F0  2C 00 00 03 */	cmpwi r0, 0x3
/* 80012874 0000E7F4  40 82 00 4C */	bne .L_800128C0
.L_80012878:
/* 80012878 0000E7F8  80 1F 00 04 */	lwz r0, 0x4(r31)
/* 8001287C 0000E7FC  54 00 00 34 */	clrrwi r0, r0, 5
/* 80012880 0000E800  90 1F 00 08 */	stw r0, 0x8(r31)
/* 80012884 0000E804  80 7F 00 08 */	lwz r3, 0x8(r31)
/* 80012888 0000E808  80 1F 00 04 */	lwz r0, 0x4(r31)
/* 8001288C 0000E80C  7C 03 00 40 */	cmplw r3, r0
/* 80012890 0000E810  40 80 00 0C */	bge .L_8001289C
/* 80012894 0000E814  38 03 00 20 */	addi r0, r3, 0x20
/* 80012898 0000E818  90 1F 00 08 */	stw r0, 0x8(r31)
.L_8001289C:
/* 8001289C 0000E81C  80 7F 00 08 */	lwz r3, 0x8(r31)
/* 800128A0 0000E820  48 00 01 59 */	bl mAlloc__FUl
/* 800128A4 0000E824  90 7F 00 10 */	stw r3, 0x10(r31)
/* 800128A8 0000E828  38 C0 00 00 */	li r6, 0x0
/* 800128AC 0000E82C  38 E0 00 02 */	li r7, 0x2
/* 800128B0 0000E830  80 7F 00 00 */	lwz r3, 0x0(r31)
/* 800128B4 0000E834  80 9F 00 10 */	lwz r4, 0x10(r31)
/* 800128B8 0000E838  80 BF 00 04 */	lwz r5, 0x4(r31)
/* 800128BC 0000E83C  48 01 EE 4D */	bl DVDReadPrio
.L_800128C0:
/* 800128C0 0000E840  38 60 00 01 */	li r3, 0x1
/* 800128C4 0000E844  48 00 00 2C */	b .L_800128F0
.L_800128C8:
/* 800128C8 0000E848  80 7F 00 00 */	lwz r3, 0x0(r31)
/* 800128CC 0000E84C  28 03 00 00 */	cmplwi r3, 0x0
/* 800128D0 0000E850  41 82 00 0C */	beq .L_800128DC
/* 800128D4 0000E854  48 00 01 C5 */	bl mFree__FPv
/* 800128D8 0000E858  93 DF 00 00 */	stw r30, 0x0(r31)
.L_800128DC:
/* 800128DC 0000E85C  3C 60 80 06 */	lis r3, lbl_80066248@ha
/* 800128E0 0000E860  4C C6 31 82 */	crclr 4*cr1+eq
/* 800128E4 0000E864  38 63 62 48 */	addi r3, r3, lbl_80066248@l
/* 800128E8 0000E868  48 01 72 FD */	bl OSReport
/* 800128EC 0000E86C  38 60 00 00 */	li r3, 0x0
.L_800128F0:
/* 800128F0 0000E870  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800128F4 0000E874  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800128F8 0000E878  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 800128FC 0000E87C  7C 08 03 A6 */	mtlr r0
/* 80012900 0000E880  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 80012904 0000E884  83 81 00 18 */	lwz r28, 0x18(r1)
/* 80012908 0000E888  38 21 00 28 */	addi r1, r1, 0x28
/* 8001290C 0000E88C  4E 80 00 20 */	blr

.global Read__5DUDvdFPvUll
Read__5DUDvdFPvUll:
/* 80012910 0000E890  7C 08 02 A6 */	mflr r0
/* 80012914 0000E894  90 01 00 04 */	stw r0, 0x4(r1)
/* 80012918 0000E898  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 8001291C 0000E89C  93 E1 00 24 */	stw r31, 0x24(r1)
/* 80012920 0000E8A0  3B E6 00 00 */	addi r31, r6, 0x0
/* 80012924 0000E8A4  93 C1 00 20 */	stw r30, 0x20(r1)
/* 80012928 0000E8A8  3B C5 00 00 */	addi r30, r5, 0x0
/* 8001292C 0000E8AC  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 80012930 0000E8B0  7C 7D 1B 78 */	mr r29, r3
/* 80012934 0000E8B4  80 03 00 14 */	lwz r0, 0x14(r3)
/* 80012938 0000E8B8  2C 00 00 02 */	cmpwi r0, 0x2
/* 8001293C 0000E8BC  41 82 00 0C */	beq .L_80012948
/* 80012940 0000E8C0  2C 00 00 03 */	cmpwi r0, 0x3
/* 80012944 0000E8C4  40 82 00 24 */	bne .L_80012968
.L_80012948:
/* 80012948 0000E8C8  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 8001294C 0000E8CC  7C 83 23 78 */	mr r3, r4
/* 80012950 0000E8D0  80 DD 00 10 */	lwz r6, 0x10(r29)
/* 80012954 0000E8D4  38 BE 00 00 */	addi r5, r30, 0x0
/* 80012958 0000E8D8  7C 80 FA 14 */	add r4, r0, r31
/* 8001295C 0000E8DC  7C 86 22 14 */	add r4, r6, r4
/* 80012960 0000E8E0  4B FF 2A C1 */	bl memcpy
/* 80012964 0000E8E4  48 00 00 54 */	b .L_800129B8
.L_80012968:
/* 80012968 0000E8E8  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 8001296C 0000E8EC  38 BE 00 00 */	addi r5, r30, 0x0
/* 80012970 0000E8F0  80 7D 00 00 */	lwz r3, 0x0(r29)
/* 80012974 0000E8F4  38 E0 00 02 */	li r7, 0x2
/* 80012978 0000E8F8  7C C0 FA 14 */	add r6, r0, r31
/* 8001297C 0000E8FC  48 01 ED 8D */	bl DVDReadPrio
/* 80012980 0000E900  38 C3 00 00 */	addi r6, r3, 0x0
/* 80012984 0000E904  7C 06 F0 40 */	cmplw r6, r30
/* 80012988 0000E908  41 82 00 30 */	beq .L_800129B8
/* 8001298C 0000E90C  3C 60 80 06 */	lis r3, lbl_80066258@ha
/* 80012990 0000E910  4C C6 31 82 */	crclr 4*cr1+eq
/* 80012994 0000E914  38 63 62 58 */	addi r3, r3, lbl_80066258@l
/* 80012998 0000E918  38 9E 00 00 */	addi r4, r30, 0x0
/* 8001299C 0000E91C  38 BF 00 00 */	addi r5, r31, 0x0
/* 800129A0 0000E920  48 01 72 45 */	bl OSReport
/* 800129A4 0000E924  3C 60 80 06 */	lis r3, lbl_80066280@ha
/* 800129A8 0000E928  80 9D 00 0C */	lwz r4, 0xc(r29)
/* 800129AC 0000E92C  38 63 62 80 */	addi r3, r3, lbl_80066280@l
/* 800129B0 0000E930  4C C6 31 82 */	crclr 4*cr1+eq
/* 800129B4 0000E934  48 01 72 31 */	bl OSReport
.L_800129B8:
/* 800129B8 0000E938  80 1D 00 14 */	lwz r0, 0x14(r29)
/* 800129BC 0000E93C  2C 00 00 00 */	cmpwi r0, 0x0
/* 800129C0 0000E940  41 82 00 0C */	beq .L_800129CC
/* 800129C4 0000E944  2C 00 00 02 */	cmpwi r0, 0x2
/* 800129C8 0000E948  40 82 00 14 */	bne .L_800129DC
.L_800129CC:
/* 800129CC 0000E94C  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 800129D0 0000E950  7C 1E 02 14 */	add r0, r30, r0
/* 800129D4 0000E954  7C 1F 02 14 */	add r0, r31, r0
/* 800129D8 0000E958  90 1D 00 0C */	stw r0, 0xc(r29)
.L_800129DC:
/* 800129DC 0000E95C  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800129E0 0000E960  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800129E4 0000E964  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 800129E8 0000E968  7C 08 03 A6 */	mtlr r0
/* 800129EC 0000E96C  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 800129F0 0000E970  38 21 00 28 */	addi r1, r1, 0x28
/* 800129F4 0000E974  4E 80 00 20 */	blr

.section .data, "wa"  # 0x80065000 - 0x8006D1C0 ; 0x000081C0


lbl_80066248:
	.asciz "DVD Open False\n"

lbl_80066258:
	.asciz "Error DUDvd::Read>len=%d,off=%d,ret=%d\n"

lbl_80066280:
	.asciz "Error DUDvd::Read>fptr=%d\n"
	.balign 4
	.4byte 0

.section .sdata, "wa"  # 0x800A8A80 - 0x800A8DC0 ; 0x00000340


.global m_InitDVD__5DUDvd
m_InitDVD__5DUDvd:
	.4byte 0x01000000
	.4byte 0
