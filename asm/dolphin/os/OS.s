.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn OSGetConsoleType, global
/* 800276EC 0002366C  80 6D 84 48 */	lwz r3, BootInfo@sda21(r13)
/* 800276F0 00023670  28 03 00 00 */	cmplwi r3, 0x0
/* 800276F4 00023674  41 82 00 10 */	beq .L_80027704
/* 800276F8 00023678  80 63 00 2C */	lwz r3, 0x2c(r3)
/* 800276FC 0002367C  28 03 00 00 */	cmplwi r3, 0x0
/* 80027700 00023680  40 82 00 10 */	bne .L_80027710
.L_80027704:
/* 80027704 00023684  3C 60 10 00 */	lis r3, 0x1000
/* 80027708 00023688  38 63 00 02 */	addi r3, r3, 0x2
/* 8002770C 0002368C  48 00 00 04 */	b .L_80027710
.L_80027710:
/* 80027710 00023690  4E 80 00 20 */	blr
.endfn OSGetConsoleType

.fn ClearArena, local
/* 80027714 00023694  7C 08 02 A6 */	mflr r0
/* 80027718 00023698  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002771C 0002369C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80027720 000236A0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80027724 000236A4  93 C1 00 08 */	stw r30, 0x8(r1)
/* 80027728 000236A8  48 00 47 E9 */	bl OSGetResetCode
/* 8002772C 000236AC  3C 03 80 00 */	addis r0, r3, 0x8000
/* 80027730 000236B0  28 00 00 00 */	cmplwi r0, 0x0
/* 80027734 000236B4  41 82 00 28 */	beq .L_8002775C
/* 80027738 000236B8  48 00 15 15 */	bl OSGetArenaHi
/* 8002773C 000236BC  7C 7F 1B 78 */	mr r31, r3
/* 80027740 000236C0  48 00 15 15 */	bl OSGetArenaLo
/* 80027744 000236C4  7F E3 F8 50 */	subf r31, r3, r31
/* 80027748 000236C8  48 00 15 0D */	bl OSGetArenaLo
/* 8002774C 000236CC  7F E5 FB 78 */	mr r5, r31
/* 80027750 000236D0  38 80 00 00 */	li r4, 0x0
/* 80027754 000236D4  4B FD DB D9 */	bl memset
/* 80027758 000236D8  48 00 00 B0 */	b .L_80027808
.L_8002775C:
/* 8002775C 000236DC  3C 60 81 30 */	lis r3, 0x812FDFF0@ha
/* 80027760 000236E0  83 E3 DF F0 */	lwz r31, 0x812FDFF0@l(r3)
/* 80027764 000236E4  83 C3 DF EC */	lwz r30, -0x2014(r3)
/* 80027768 000236E8  28 1F 00 00 */	cmplwi r31, 0x0
/* 8002776C 000236EC  40 82 00 28 */	bne .L_80027794
/* 80027770 000236F0  48 00 14 DD */	bl OSGetArenaHi
/* 80027774 000236F4  7C 7F 1B 78 */	mr r31, r3
/* 80027778 000236F8  48 00 14 DD */	bl OSGetArenaLo
/* 8002777C 000236FC  7F E3 F8 50 */	subf r31, r3, r31
/* 80027780 00023700  48 00 14 D5 */	bl OSGetArenaLo
/* 80027784 00023704  7F E5 FB 78 */	mr r5, r31
/* 80027788 00023708  38 80 00 00 */	li r4, 0x0
/* 8002778C 0002370C  4B FD DB A1 */	bl memset
/* 80027790 00023710  48 00 00 78 */	b .L_80027808
.L_80027794:
/* 80027794 00023714  48 00 14 C1 */	bl OSGetArenaLo
/* 80027798 00023718  7C 03 F8 40 */	cmplw r3, r31
/* 8002779C 0002371C  40 80 00 6C */	bge .L_80027808
/* 800277A0 00023720  48 00 14 AD */	bl OSGetArenaHi
/* 800277A4 00023724  7C 03 F8 40 */	cmplw r3, r31
/* 800277A8 00023728  41 81 00 28 */	bgt .L_800277D0
/* 800277AC 0002372C  48 00 14 A1 */	bl OSGetArenaHi
/* 800277B0 00023730  7C 7F 1B 78 */	mr r31, r3
/* 800277B4 00023734  48 00 14 A1 */	bl OSGetArenaLo
/* 800277B8 00023738  7F E3 F8 50 */	subf r31, r3, r31
/* 800277BC 0002373C  48 00 14 99 */	bl OSGetArenaLo
/* 800277C0 00023740  7F E5 FB 78 */	mr r5, r31
/* 800277C4 00023744  38 80 00 00 */	li r4, 0x0
/* 800277C8 00023748  4B FD DB 65 */	bl memset
/* 800277CC 0002374C  48 00 00 3C */	b .L_80027808
.L_800277D0:
/* 800277D0 00023750  48 00 14 85 */	bl OSGetArenaLo
/* 800277D4 00023754  7F E3 F8 50 */	subf r31, r3, r31
/* 800277D8 00023758  48 00 14 7D */	bl OSGetArenaLo
/* 800277DC 0002375C  7F E5 FB 78 */	mr r5, r31
/* 800277E0 00023760  38 80 00 00 */	li r4, 0x0
/* 800277E4 00023764  4B FD DB 49 */	bl memset
/* 800277E8 00023768  48 00 14 65 */	bl OSGetArenaHi
/* 800277EC 0002376C  7C 03 F0 40 */	cmplw r3, r30
/* 800277F0 00023770  40 81 00 18 */	ble .L_80027808
/* 800277F4 00023774  48 00 14 59 */	bl OSGetArenaHi
/* 800277F8 00023778  7C BE 18 50 */	subf r5, r30, r3
/* 800277FC 0002377C  7F C3 F3 78 */	mr r3, r30
/* 80027800 00023780  38 80 00 00 */	li r4, 0x0
/* 80027804 00023784  4B FD DB 29 */	bl memset
.L_80027808:
/* 80027808 00023788  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8002780C 0002378C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80027810 00023790  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 80027814 00023794  7C 08 03 A6 */	mtlr r0
/* 80027818 00023798  38 21 00 10 */	addi r1, r1, 0x10
/* 8002781C 0002379C  4E 80 00 20 */	blr
.endfn ClearArena

.fn OSInit, global
/* 80027820 000237A0  7C 08 02 A6 */	mflr r0
/* 80027824 000237A4  90 01 00 04 */	stw r0, 0x4(r1)
/* 80027828 000237A8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8002782C 000237AC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80027830 000237B0  93 C1 00 08 */	stw r30, 0x8(r1)
/* 80027834 000237B4  80 0D 84 50 */	lwz r0, AreWeInitialized@sda21(r13)
/* 80027838 000237B8  3C 60 80 06 */	lis r3, lbl_800674F0@ha
/* 8002783C 000237BC  3B E3 74 F0 */	addi r31, r3, lbl_800674F0@l
/* 80027840 000237C0  2C 00 00 00 */	cmpwi r0, 0x0
/* 80027844 000237C4  40 82 02 C4 */	bne .L_80027B08
/* 80027848 000237C8  38 00 00 01 */	li r0, 0x1
/* 8002784C 000237CC  90 0D 84 50 */	stw r0, AreWeInitialized@sda21(r13)
/* 80027850 000237D0  48 00 7C ED */	bl __OSGetSystemTime
/* 80027854 000237D4  90 8D 84 5C */	stw r4, __OSStartTime+4@sda21(r13)
/* 80027858 000237D8  90 6D 84 58 */	stw r3, __OSStartTime@sda21(r13)
/* 8002785C 000237DC  48 00 37 89 */	bl OSDisableInterrupts
/* 80027860 000237E0  38 00 00 00 */	li r0, 0x0
/* 80027864 000237E4  3C 60 80 00 */	lis r3, 0x800000F4@ha
/* 80027868 000237E8  90 0D 84 4C */	stw r0, BI2DebugFlag@sda21(r13)
/* 8002786C 000237EC  90 6D 84 48 */	stw r3, BootInfo@sda21(r13)
/* 80027870 000237F0  90 0D 85 54 */	stw r0, __DVDLongFileNameFlag@sda21(r13)
/* 80027874 000237F4  80 63 00 F4 */	lwz r3, 0x800000F4@l(r3)
/* 80027878 000237F8  28 03 00 00 */	cmplwi r3, 0x0
/* 8002787C 000237FC  41 82 00 1C */	beq .L_80027898
/* 80027880 00023800  38 03 00 0C */	addi r0, r3, 0xc
/* 80027884 00023804  90 0D 84 4C */	stw r0, BI2DebugFlag@sda21(r13)
/* 80027888 00023808  80 03 00 20 */	lwz r0, 0x20(r3)
/* 8002788C 0002380C  90 0D 85 54 */	stw r0, __DVDLongFileNameFlag@sda21(r13)
/* 80027890 00023810  80 03 00 24 */	lwz r0, 0x24(r3)
/* 80027894 00023814  90 0D 86 24 */	stw r0, __PADSpec@sda21(r13)
.L_80027898:
/* 80027898 00023818  3C 60 80 00 */	lis r3, 0x80000030@ha
/* 8002789C 0002381C  80 63 00 30 */	lwz r3, 0x80000030@l(r3)
/* 800278A0 00023820  28 03 00 00 */	cmplwi r3, 0x0
/* 800278A4 00023824  40 82 00 10 */	bne .L_800278B4
/* 800278A8 00023828  3C 60 80 0C */	lis r3, __ArenaLo@ha
/* 800278AC 0002382C  38 63 BB A0 */	addi r3, r3, __ArenaLo@l
/* 800278B0 00023830  48 00 00 04 */	b .L_800278B4
.L_800278B4:
/* 800278B4 00023834  48 00 13 B1 */	bl OSSetArenaLo
/* 800278B8 00023838  80 6D 84 48 */	lwz r3, BootInfo@sda21(r13)
/* 800278BC 0002383C  80 03 00 30 */	lwz r0, 0x30(r3)
/* 800278C0 00023840  28 00 00 00 */	cmplwi r0, 0x0
/* 800278C4 00023844  40 82 00 30 */	bne .L_800278F4
/* 800278C8 00023848  80 6D 84 4C */	lwz r3, BI2DebugFlag@sda21(r13)
/* 800278CC 0002384C  28 03 00 00 */	cmplwi r3, 0x0
/* 800278D0 00023850  41 82 00 24 */	beq .L_800278F4
/* 800278D4 00023854  80 03 00 00 */	lwz r0, 0x0(r3)
/* 800278D8 00023858  28 00 00 02 */	cmplwi r0, 0x2
/* 800278DC 0002385C  40 80 00 18 */	bge .L_800278F4
/* 800278E0 00023860  3C 60 80 0C */	lis r3, _stack_addr@ha
/* 800278E4 00023864  38 63 9B 98 */	addi r3, r3, _stack_addr@l
/* 800278E8 00023868  38 03 00 1F */	addi r0, r3, 0x1f
/* 800278EC 0002386C  54 03 00 34 */	clrrwi r3, r0, 5
/* 800278F0 00023870  48 00 13 75 */	bl OSSetArenaLo
.L_800278F4:
/* 800278F4 00023874  80 6D 84 48 */	lwz r3, BootInfo@sda21(r13)
/* 800278F8 00023878  80 63 00 34 */	lwz r3, 0x34(r3)
/* 800278FC 0002387C  28 03 00 00 */	cmplwi r3, 0x0
/* 80027900 00023880  40 82 00 10 */	bne .L_80027910
/* 80027904 00023884  3C 60 81 70 */	lis r3, __ArenaHi@ha
/* 80027908 00023888  38 63 00 00 */	addi r3, r3, __ArenaHi@l
/* 8002790C 0002388C  48 00 00 04 */	b .L_80027910
.L_80027910:
/* 80027910 00023890  48 00 13 4D */	bl OSSetArenaHi
/* 80027914 00023894  48 00 02 0D */	bl OSExceptionInit
/* 80027918 00023898  48 00 6A BD */	bl __OSInitSystemCall
/* 8002791C 0002389C  48 00 06 19 */	bl OSInitAlarm
/* 80027920 000238A0  48 00 3F 0D */	bl __OSModuleInit
/* 80027924 000238A4  48 00 37 3D */	bl __OSInterruptInit
/* 80027928 000238A8  3C 60 80 03 */	lis r3, __OSResetSWInterruptHandler@ha
/* 8002792C 000238AC  38 83 BF 40 */	addi r4, r3, __OSResetSWInterruptHandler@l
/* 80027930 000238B0  38 60 00 16 */	li r3, 0x16
/* 80027934 000238B4  48 00 36 FD */	bl __OSSetInterruptHandler
/* 80027938 000238B8  48 00 22 65 */	bl __OSContextInit
/* 8002793C 000238BC  48 00 19 4D */	bl __OSCacheInit
/* 80027940 000238C0  48 00 33 D1 */	bl EXIInit
/* 80027944 000238C4  48 00 59 E1 */	bl SIInit
/* 80027948 000238C8  48 00 4B 29 */	bl __OSInitSram
/* 8002794C 000238CC  48 00 6A ED */	bl __OSThreadInit
/* 80027950 000238D0  48 00 13 1D */	bl __OSInitAudioSystem
/* 80027954 000238D4  4B FF FD 81 */	bl PPCMfhid2
/* 80027958 000238D8  54 63 00 80 */	rlwinm r3, r3, 0, 2, 0
/* 8002795C 000238DC  4B FF FD 81 */	bl PPCMthid2
/* 80027960 000238E0  80 6D 84 48 */	lwz r3, BootInfo@sda21(r13)
/* 80027964 000238E4  38 83 00 2C */	addi r4, r3, 0x2c
/* 80027968 000238E8  80 04 00 00 */	lwz r0, 0x0(r4)
/* 8002796C 000238EC  54 00 00 C6 */	rlwinm r0, r0, 0, 3, 3
/* 80027970 000238F0  28 00 00 00 */	cmplwi r0, 0x0
/* 80027974 000238F4  41 82 00 14 */	beq .L_80027988
/* 80027978 000238F8  3C 60 10 00 */	lis r3, 0x1000
/* 8002797C 000238FC  38 03 00 04 */	addi r0, r3, 0x4
/* 80027980 00023900  90 04 00 00 */	stw r0, 0x0(r4)
/* 80027984 00023904  48 00 00 0C */	b .L_80027990
.L_80027988:
/* 80027988 00023908  38 00 00 01 */	li r0, 0x1
/* 8002798C 0002390C  90 04 00 00 */	stw r0, 0x0(r4)
.L_80027990:
/* 80027990 00023910  3C 60 CC 00 */	lis r3, 0xCC003000@ha
/* 80027994 00023914  80 8D 84 48 */	lwz r4, BootInfo@sda21(r13)
/* 80027998 00023918  38 63 30 00 */	addi r3, r3, 0xCC003000@l
/* 8002799C 0002391C  80 03 00 2C */	lwz r0, 0x2c(r3)
/* 800279A0 00023920  80 64 00 2C */	lwz r3, 0x2c(r4)
/* 800279A4 00023924  54 00 00 06 */	clrrwi r0, r0, 28
/* 800279A8 00023928  54 00 27 3E */	srwi r0, r0, 28
/* 800279AC 0002392C  7C 03 02 14 */	add r0, r3, r0
/* 800279B0 00023930  90 04 00 2C */	stw r0, 0x2c(r4)
/* 800279B4 00023934  48 00 3F 11 */	bl __OSInitMemoryProtection
/* 800279B8 00023938  7F E3 FB 78 */	mr r3, r31
/* 800279BC 0002393C  4C C6 31 82 */	crclr 4*cr1+eq
/* 800279C0 00023940  48 00 22 25 */	bl OSReport
/* 800279C4 00023944  38 7F 00 20 */	addi r3, r31, 0x20
/* 800279C8 00023948  4C C6 31 82 */	crclr 4*cr1+eq
/* 800279CC 0002394C  38 9F 00 38 */	addi r4, r31, 0x38
/* 800279D0 00023950  38 BF 00 44 */	addi r5, r31, 0x44
/* 800279D4 00023954  48 00 22 11 */	bl OSReport
/* 800279D8 00023958  38 7F 00 50 */	addi r3, r31, 0x50
/* 800279DC 0002395C  4C C6 31 82 */	crclr 4*cr1+eq
/* 800279E0 00023960  48 00 22 05 */	bl OSReport
/* 800279E4 00023964  80 6D 84 48 */	lwz r3, BootInfo@sda21(r13)
/* 800279E8 00023968  28 03 00 00 */	cmplwi r3, 0x0
/* 800279EC 0002396C  41 82 00 10 */	beq .L_800279FC
/* 800279F0 00023970  80 83 00 2C */	lwz r4, 0x2c(r3)
/* 800279F4 00023974  28 04 00 00 */	cmplwi r4, 0x0
/* 800279F8 00023978  40 82 00 10 */	bne .L_80027A08
.L_800279FC:
/* 800279FC 0002397C  3C 60 10 00 */	lis r3, 0x1000
/* 80027A00 00023980  38 83 00 02 */	addi r4, r3, 0x2
/* 80027A04 00023984  48 00 00 04 */	b .L_80027A08
.L_80027A08:
/* 80027A08 00023988  54 80 00 C6 */	rlwinm r0, r4, 0, 3, 3
/* 80027A0C 0002398C  28 00 00 00 */	cmplwi r0, 0x0
/* 80027A10 00023990  40 82 00 14 */	bne .L_80027A24
/* 80027A14 00023994  4C C6 31 82 */	crclr 4*cr1+eq
/* 80027A18 00023998  38 7F 00 60 */	addi r3, r31, 0x60
/* 80027A1C 0002399C  48 00 21 C9 */	bl OSReport
/* 80027A20 000239A0  48 00 00 8C */	b .L_80027AAC
.L_80027A24:
/* 80027A24 000239A4  3C 60 10 00 */	lis r3, 0x1000
/* 80027A28 000239A8  38 03 00 02 */	addi r0, r3, 0x2
/* 80027A2C 000239AC  7C 04 00 00 */	cmpw r4, r0
/* 80027A30 000239B0  41 82 00 48 */	beq .L_80027A78
/* 80027A34 000239B4  40 80 00 14 */	bge .L_80027A48
/* 80027A38 000239B8  7C 04 18 00 */	cmpw r4, r3
/* 80027A3C 000239BC  41 82 00 1C */	beq .L_80027A58
/* 80027A40 000239C0  40 80 00 28 */	bge .L_80027A68
/* 80027A44 000239C4  48 00 00 54 */	b .L_80027A98
.L_80027A48:
/* 80027A48 000239C8  38 03 00 04 */	addi r0, r3, 0x4
/* 80027A4C 000239CC  7C 04 00 00 */	cmpw r4, r0
/* 80027A50 000239D0  40 80 00 48 */	bge .L_80027A98
/* 80027A54 000239D4  48 00 00 34 */	b .L_80027A88
.L_80027A58:
/* 80027A58 000239D8  38 7F 00 6C */	addi r3, r31, 0x6c
/* 80027A5C 000239DC  4C C6 31 82 */	crclr 4*cr1+eq
/* 80027A60 000239E0  48 00 21 85 */	bl OSReport
/* 80027A64 000239E4  48 00 00 48 */	b .L_80027AAC
.L_80027A68:
/* 80027A68 000239E8  38 7F 00 7C */	addi r3, r31, 0x7c
/* 80027A6C 000239EC  4C C6 31 82 */	crclr 4*cr1+eq
/* 80027A70 000239F0  48 00 21 75 */	bl OSReport
/* 80027A74 000239F4  48 00 00 38 */	b .L_80027AAC
.L_80027A78:
/* 80027A78 000239F8  38 7F 00 8C */	addi r3, r31, 0x8c
/* 80027A7C 000239FC  4C C6 31 82 */	crclr 4*cr1+eq
/* 80027A80 00023A00  48 00 21 65 */	bl OSReport
/* 80027A84 00023A04  48 00 00 28 */	b .L_80027AAC
.L_80027A88:
/* 80027A88 00023A08  38 7F 00 9C */	addi r3, r31, 0x9c
/* 80027A8C 00023A0C  4C C6 31 82 */	crclr 4*cr1+eq
/* 80027A90 00023A10  48 00 21 55 */	bl OSReport
/* 80027A94 00023A14  48 00 00 18 */	b .L_80027AAC
.L_80027A98:
/* 80027A98 00023A18  3C 84 F0 00 */	addis r4, r4, 0xf000
/* 80027A9C 00023A1C  4C C6 31 82 */	crclr 4*cr1+eq
/* 80027AA0 00023A20  38 7F 00 AC */	addi r3, r31, 0xac
/* 80027AA4 00023A24  38 84 FF FD */	addi r4, r4, -0x3
/* 80027AA8 00023A28  48 00 21 3D */	bl OSReport
.L_80027AAC:
/* 80027AAC 00023A2C  80 8D 84 48 */	lwz r4, BootInfo@sda21(r13)
/* 80027AB0 00023A30  38 7F 00 C0 */	addi r3, r31, 0xc0
/* 80027AB4 00023A34  4C C6 31 82 */	crclr 4*cr1+eq
/* 80027AB8 00023A38  80 04 00 28 */	lwz r0, 0x28(r4)
/* 80027ABC 00023A3C  54 04 65 3E */	srwi r4, r0, 20
/* 80027AC0 00023A40  48 00 21 25 */	bl OSReport
/* 80027AC4 00023A44  48 00 11 89 */	bl OSGetArenaHi
/* 80027AC8 00023A48  7C 7E 1B 78 */	mr r30, r3
/* 80027ACC 00023A4C  48 00 11 89 */	bl OSGetArenaLo
/* 80027AD0 00023A50  7C 64 1B 78 */	mr r4, r3
/* 80027AD4 00023A54  4C C6 31 82 */	crclr 4*cr1+eq
/* 80027AD8 00023A58  7F C5 F3 78 */	mr r5, r30
/* 80027ADC 00023A5C  38 7F 00 D0 */	addi r3, r31, 0xd0
/* 80027AE0 00023A60  48 00 21 05 */	bl OSReport
/* 80027AE4 00023A64  80 6D 84 4C */	lwz r3, BI2DebugFlag@sda21(r13)
/* 80027AE8 00023A68  28 03 00 00 */	cmplwi r3, 0x0
/* 80027AEC 00023A6C  41 82 00 14 */	beq .L_80027B00
/* 80027AF0 00023A70  80 03 00 00 */	lwz r0, 0x0(r3)
/* 80027AF4 00023A74  28 00 00 02 */	cmplwi r0, 0x2
/* 80027AF8 00023A78  41 80 00 08 */	blt .L_80027B00
/* 80027AFC 00023A7C  48 03 6C 15 */	bl EnableMetroTRKInterrupts
.L_80027B00:
/* 80027B00 00023A80  4B FF FC 15 */	bl ClearArena
/* 80027B04 00023A84  48 00 34 F5 */	bl OSEnableInterrupts
.L_80027B08:
/* 80027B08 00023A88  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80027B0C 00023A8C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80027B10 00023A90  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 80027B14 00023A94  7C 08 03 A6 */	mtlr r0
/* 80027B18 00023A98  38 21 00 10 */	addi r1, r1, 0x10
/* 80027B1C 00023A9C  4E 80 00 20 */	blr
.endfn OSInit

.fn OSExceptionInit, local
/* 80027B20 00023AA0  7C 08 02 A6 */	mflr r0
/* 80027B24 00023AA4  90 01 00 04 */	stw r0, 0x4(r1)
/* 80027B28 00023AA8  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 80027B2C 00023AAC  BE 81 00 08 */	stmw r20, 0x8(r1)
/* 80027B30 00023AB0  3C 60 80 00 */	lis r3, 0x80000060@ha
/* 80027B34 00023AB4  80 03 00 60 */	lwz r0, 0x80000060@l(r3)
/* 80027B38 00023AB8  3C 80 80 02 */	lis r4, __OSEVSetNumber@ha
/* 80027B3C 00023ABC  3B C4 7E 60 */	addi r30, r4, __OSEVSetNumber@l
/* 80027B40 00023AC0  3C A0 80 02 */	lis r5, OSExceptionVector@ha
/* 80027B44 00023AC4  83 3E 00 00 */	lwz r25, 0x0(r30)
/* 80027B48 00023AC8  3C 80 80 02 */	lis r4, __OSEVEnd@ha
/* 80027B4C 00023ACC  38 A5 7D F8 */	addi r5, r5, OSExceptionVector@l
/* 80027B50 00023AD0  38 84 7E 90 */	addi r4, r4, __OSEVEnd@l
/* 80027B54 00023AD4  3C C0 80 06 */	lis r6, lbl_800674F0@ha
/* 80027B58 00023AD8  28 00 00 00 */	cmplwi r0, 0x0
/* 80027B5C 00023ADC  7C B8 2B 78 */	mr r24, r5
/* 80027B60 00023AE0  3B A6 74 F0 */	addi r29, r6, lbl_800674F0@l
/* 80027B64 00023AE4  7E E5 20 50 */	subf r23, r5, r4
/* 80027B68 00023AE8  3A 83 00 60 */	addi r20, r3, 0x60
/* 80027B6C 00023AEC  40 82 00 4C */	bne .L_80027BB8
/* 80027B70 00023AF0  38 7D 01 24 */	addi r3, r29, 0x124
/* 80027B74 00023AF4  4C C6 31 82 */	crclr 4*cr1+eq
/* 80027B78 00023AF8  48 00 7D A9 */	bl DBPrintf
/* 80027B7C 00023AFC  3C 80 80 02 */	lis r4, __OSDBIntegrator@ha
/* 80027B80 00023B00  3C 60 80 02 */	lis r3, __OSDBJump@ha
/* 80027B84 00023B04  38 03 7D C4 */	addi r0, r3, __OSDBJump@l
/* 80027B88 00023B08  38 84 7D A0 */	addi r4, r4, __OSDBIntegrator@l
/* 80027B8C 00023B0C  7E A4 00 50 */	subf r21, r4, r0
/* 80027B90 00023B10  7E 83 A3 78 */	mr r3, r20
/* 80027B94 00023B14  7E A5 AB 78 */	mr r5, r21
/* 80027B98 00023B18  4B FD D8 89 */	bl memcpy
/* 80027B9C 00023B1C  7E 83 A3 78 */	mr r3, r20
/* 80027BA0 00023B20  7E A4 AB 78 */	mr r4, r21
/* 80027BA4 00023B24  48 00 14 09 */	bl DCFlushRangeNoSync
/* 80027BA8 00023B28  7C 00 04 AC */	sync
/* 80027BAC 00023B2C  7E 83 A3 78 */	mr r3, r20
/* 80027BB0 00023B30  7E A4 AB 78 */	mr r4, r21
/* 80027BB4 00023B34  48 00 14 59 */	bl ICInvalidateRange
.L_80027BB8:
/* 80027BB8 00023B38  3C 80 80 02 */	lis r4, __OSDBJump@ha
/* 80027BBC 00023B3C  3C 60 80 02 */	lis r3, __OSDBJUMPEND@ha
/* 80027BC0 00023B40  3B E4 7D C4 */	addi r31, r4, __OSDBJump@l
/* 80027BC4 00023B44  38 03 7D C8 */	addi r0, r3, __OSDBJUMPEND@l
/* 80027BC8 00023B48  3B 9D 00 E8 */	addi r28, r29, 0xe8
/* 80027BCC 00023B4C  7F 7F 00 50 */	subf r27, r31, r0
/* 80027BD0 00023B50  3B 40 00 00 */	li r26, 0x0
/* 80027BD4 00023B54  48 00 00 04 */	b .L_80027BD8
.L_80027BD8:
/* 80027BD8 00023B58  3C 60 80 02 */	lis r3, __DBVECTOR@ha
/* 80027BDC 00023B5C  3A A3 7E 50 */	addi r21, r3, __DBVECTOR@l
/* 80027BE0 00023B60  3E C0 60 00 */	lis r22, 0x6000
/* 80027BE4 00023B64  48 00 00 04 */	b .L_80027BE8
.L_80027BE8:
/* 80027BE8 00023B68  48 00 01 48 */	b .L_80027D30
.L_80027BEC:
/* 80027BEC 00023B6C  80 6D 84 4C */	lwz r3, BI2DebugFlag@sda21(r13)
/* 80027BF0 00023B70  28 03 00 00 */	cmplwi r3, 0x0
/* 80027BF4 00023B74  41 82 00 34 */	beq .L_80027C28
/* 80027BF8 00023B78  80 03 00 00 */	lwz r0, 0x0(r3)
/* 80027BFC 00023B7C  28 00 00 02 */	cmplwi r0, 0x2
/* 80027C00 00023B80  41 80 00 28 */	blt .L_80027C28
/* 80027C04 00023B84  7F 43 D3 78 */	mr r3, r26
/* 80027C08 00023B88  48 00 7C FD */	bl __DBIsExceptionMarked
/* 80027C0C 00023B8C  2C 03 00 00 */	cmpwi r3, 0x0
/* 80027C10 00023B90  41 82 00 18 */	beq .L_80027C28
/* 80027C14 00023B94  38 7D 01 40 */	addi r3, r29, 0x140
/* 80027C18 00023B98  4C C6 31 82 */	crclr 4*cr1+eq
/* 80027C1C 00023B9C  57 44 06 3E */	clrlwi r4, r26, 24
/* 80027C20 00023BA0  48 00 7D 01 */	bl DBPrintf
/* 80027C24 00023BA4  48 00 01 04 */	b .L_80027D28
.L_80027C28:
/* 80027C28 00023BA8  57 54 06 3E */	clrlwi r20, r26, 24
/* 80027C2C 00023BAC  7F 20 A3 78 */	or r0, r25, r20
/* 80027C30 00023BB0  90 1E 00 00 */	stw r0, 0x0(r30)
/* 80027C34 00023BB4  7F 43 D3 78 */	mr r3, r26
/* 80027C38 00023BB8  48 00 7C CD */	bl __DBIsExceptionMarked
/* 80027C3C 00023BBC  2C 03 00 00 */	cmpwi r3, 0x0
/* 80027C40 00023BC0  41 82 00 28 */	beq .L_80027C68
/* 80027C44 00023BC4  7E 84 A3 78 */	mr r4, r20
/* 80027C48 00023BC8  4C C6 31 82 */	crclr 4*cr1+eq
/* 80027C4C 00023BCC  38 7D 01 70 */	addi r3, r29, 0x170
/* 80027C50 00023BD0  48 00 7C D1 */	bl DBPrintf
/* 80027C54 00023BD4  7E A3 AB 78 */	mr r3, r21
/* 80027C58 00023BD8  7F E4 FB 78 */	mr r4, r31
/* 80027C5C 00023BDC  7F 65 DB 78 */	mr r5, r27
/* 80027C60 00023BE0  4B FD D7 C1 */	bl memcpy
/* 80027C64 00023BE4  48 00 00 90 */	b .L_80027CF4
.L_80027C68:
/* 80027C68 00023BE8  7E A4 AB 78 */	mr r4, r21
/* 80027C6C 00023BEC  48 00 00 04 */	b .L_80027C70
.L_80027C70:
/* 80027C70 00023BF0  28 1B 00 00 */	cmplwi r27, 0x0
/* 80027C74 00023BF4  38 7B 00 03 */	addi r3, r27, 0x3
/* 80027C78 00023BF8  54 63 F0 BE */	srwi r3, r3, 2
/* 80027C7C 00023BFC  40 81 00 78 */	ble .L_80027CF4
/* 80027C80 00023C00  54 60 E8 FE */	srwi r0, r3, 3
/* 80027C84 00023C04  28 00 00 00 */	cmplwi r0, 0x0
/* 80027C88 00023C08  7C 09 03 A6 */	mtctr r0
/* 80027C8C 00023C0C  41 82 00 54 */	beq .L_80027CE0
/* 80027C90 00023C10  48 00 00 04 */	b .L_80027C94
.L_80027C94:
/* 80027C94 00023C14  92 C4 00 00 */	stw r22, 0x0(r4)
/* 80027C98 00023C18  38 84 00 04 */	addi r4, r4, 0x4
/* 80027C9C 00023C1C  92 C4 00 00 */	stw r22, 0x0(r4)
/* 80027CA0 00023C20  38 84 00 04 */	addi r4, r4, 0x4
/* 80027CA4 00023C24  92 C4 00 00 */	stw r22, 0x0(r4)
/* 80027CA8 00023C28  38 84 00 04 */	addi r4, r4, 0x4
/* 80027CAC 00023C2C  92 C4 00 00 */	stw r22, 0x0(r4)
/* 80027CB0 00023C30  38 84 00 04 */	addi r4, r4, 0x4
/* 80027CB4 00023C34  92 C4 00 00 */	stw r22, 0x0(r4)
/* 80027CB8 00023C38  38 84 00 04 */	addi r4, r4, 0x4
/* 80027CBC 00023C3C  92 C4 00 00 */	stw r22, 0x0(r4)
/* 80027CC0 00023C40  38 84 00 04 */	addi r4, r4, 0x4
/* 80027CC4 00023C44  92 C4 00 00 */	stw r22, 0x0(r4)
/* 80027CC8 00023C48  38 84 00 04 */	addi r4, r4, 0x4
/* 80027CCC 00023C4C  92 C4 00 00 */	stw r22, 0x0(r4)
/* 80027CD0 00023C50  38 84 00 04 */	addi r4, r4, 0x4
/* 80027CD4 00023C54  42 00 FF C0 */	bdnz .L_80027C94
/* 80027CD8 00023C58  70 63 00 07 */	andi. r3, r3, 0x7
/* 80027CDC 00023C5C  41 82 00 18 */	beq .L_80027CF4
.L_80027CE0:
/* 80027CE0 00023C60  7C 69 03 A6 */	mtctr r3
/* 80027CE4 00023C64  48 00 00 04 */	b .L_80027CE8
.L_80027CE8:
/* 80027CE8 00023C68  92 C4 00 00 */	stw r22, 0x0(r4)
/* 80027CEC 00023C6C  38 84 00 04 */	addi r4, r4, 0x4
/* 80027CF0 00023C70  42 00 FF F8 */	bdnz .L_80027CE8
.L_80027CF4:
/* 80027CF4 00023C74  80 7C 00 00 */	lwz r3, 0x0(r28)
/* 80027CF8 00023C78  7F 04 C3 78 */	mr r4, r24
/* 80027CFC 00023C7C  7E E5 BB 78 */	mr r5, r23
/* 80027D00 00023C80  3E 83 80 00 */	addis r20, r3, 0x8000
/* 80027D04 00023C84  7E 83 A3 78 */	mr r3, r20
/* 80027D08 00023C88  4B FD D7 19 */	bl memcpy
/* 80027D0C 00023C8C  7E 83 A3 78 */	mr r3, r20
/* 80027D10 00023C90  7E E4 BB 78 */	mr r4, r23
/* 80027D14 00023C94  48 00 12 99 */	bl DCFlushRangeNoSync
/* 80027D18 00023C98  7C 00 04 AC */	sync
/* 80027D1C 00023C9C  7E 83 A3 78 */	mr r3, r20
/* 80027D20 00023CA0  7E E4 BB 78 */	mr r4, r23
/* 80027D24 00023CA4  48 00 12 E9 */	bl ICInvalidateRange
.L_80027D28:
/* 80027D28 00023CA8  3B 9C 00 04 */	addi r28, r28, 0x4
/* 80027D2C 00023CAC  3B 5A 00 01 */	addi r26, r26, 0x1
.L_80027D30:
/* 80027D30 00023CB0  57 40 06 3E */	clrlwi r0, r26, 24
/* 80027D34 00023CB4  28 00 00 0F */	cmplwi r0, 0xf
/* 80027D38 00023CB8  41 80 FE B4 */	blt .L_80027BEC
/* 80027D3C 00023CBC  3C 60 80 00 */	lis r3, 0x80003000@ha
/* 80027D40 00023CC0  38 03 30 00 */	addi r0, r3, 0x80003000@l
/* 80027D44 00023CC4  90 0D 84 54 */	stw r0, OSExceptionTable@sda21(r13)
/* 80027D48 00023CC8  3A 80 00 00 */	li r20, 0x0
/* 80027D4C 00023CCC  48 00 00 04 */	b .L_80027D50
.L_80027D50:
/* 80027D50 00023CD0  3C 60 80 02 */	lis r3, OSDefaultExceptionHandler@ha
/* 80027D54 00023CD4  3A E3 7E 94 */	addi r23, r3, OSDefaultExceptionHandler@l
/* 80027D58 00023CD8  48 00 00 04 */	b .L_80027D5C
.L_80027D5C:
/* 80027D5C 00023CDC  48 00 00 14 */	b .L_80027D70
.L_80027D60:
/* 80027D60 00023CE0  7E 83 A3 78 */	mr r3, r20
/* 80027D64 00023CE4  7E E4 BB 78 */	mr r4, r23
/* 80027D68 00023CE8  48 00 00 61 */	bl __OSDBJUMPEND
/* 80027D6C 00023CEC  3A 94 00 01 */	addi r20, r20, 0x1
.L_80027D70:
/* 80027D70 00023CF0  56 80 06 3E */	clrlwi r0, r20, 24
/* 80027D74 00023CF4  28 00 00 0F */	cmplwi r0, 0xf
/* 80027D78 00023CF8  41 80 FF E8 */	blt .L_80027D60
/* 80027D7C 00023CFC  93 3E 00 00 */	stw r25, 0x0(r30)
/* 80027D80 00023D00  38 7D 01 A0 */	addi r3, r29, 0x1a0
/* 80027D84 00023D04  4C C6 31 82 */	crclr 4*cr1+eq
/* 80027D88 00023D08  48 00 7B 99 */	bl DBPrintf
/* 80027D8C 00023D0C  BA 81 00 08 */	lmw r20, 0x8(r1)
/* 80027D90 00023D10  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 80027D94 00023D14  38 21 00 38 */	addi r1, r1, 0x38
/* 80027D98 00023D18  7C 08 03 A6 */	mtlr r0
/* 80027D9C 00023D1C  4E 80 00 20 */	blr
.endfn OSExceptionInit

.global __OSDBINTSTART
__OSDBINTSTART:

.fn __OSDBIntegrator, local
/* 80027DA0 00023D20  38 A0 00 40 */	li r5, 0x40
/* 80027DA4 00023D24  7C 68 02 A6 */	mflr r3
/* 80027DA8 00023D28  90 65 00 0C */	stw r3, 0xc(r5)
/* 80027DAC 00023D2C  80 65 00 08 */	lwz r3, 0x8(r5)
/* 80027DB0 00023D30  64 63 80 00 */	oris r3, r3, 0x8000
/* 80027DB4 00023D34  7C 68 03 A6 */	mtlr r3
/* 80027DB8 00023D38  38 60 00 30 */	li r3, 0x30
/* 80027DBC 00023D3C  7C 60 01 24 */	mtmsr r3
/* 80027DC0 00023D40  4E 80 00 20 */	blr
.endfn __OSDBIntegrator

.global __OSDBINTEND
__OSDBINTEND:

.global __OSDBJUMPSTART
__OSDBJUMPSTART:

.fn __OSDBJump, local
/* 80027DC4 00023D44  48 00 00 63 */	bla 0x60
.endfn __OSDBJump

.fn __OSDBJUMPEND, global
/* 80027DC8 00023D48  54 60 06 3E */	clrlwi r0, r3, 24
/* 80027DCC 00023D4C  80 6D 84 54 */	lwz r3, OSExceptionTable@sda21(r13)
/* 80027DD0 00023D50  54 00 10 3A */	slwi r0, r0, 2
/* 80027DD4 00023D54  7C A3 02 14 */	add r5, r3, r0
/* 80027DD8 00023D58  80 65 00 00 */	lwz r3, 0x0(r5)
/* 80027DDC 00023D5C  90 85 00 00 */	stw r4, 0x0(r5)
/* 80027DE0 00023D60  4E 80 00 20 */	blr
.endfn __OSDBJUMPEND

.fn __OSGetExceptionHandler, global
/* 80027DE4 00023D64  54 60 06 3E */	clrlwi r0, r3, 24
/* 80027DE8 00023D68  80 6D 84 54 */	lwz r3, OSExceptionTable@sda21(r13)
/* 80027DEC 00023D6C  54 00 10 3A */	slwi r0, r0, 2
/* 80027DF0 00023D70  7C 63 00 2E */	lwzx r3, r3, r0
/* 80027DF4 00023D74  4E 80 00 20 */	blr
.endfn __OSGetExceptionHandler

.global __OSEVStart
__OSEVStart:

.fn OSExceptionVector, local
/* 80027DF8 00023D78  7C 90 43 A6 */	mtsprg 0, r4
/* 80027DFC 00023D7C  80 80 00 C0 */	lwz r4, 0xc0(r0)
/* 80027E00 00023D80  90 64 00 0C */	stw r3, 0xc(r4)
/* 80027E04 00023D84  7C 70 42 A6 */	mfsprg r3, 0
/* 80027E08 00023D88  90 64 00 10 */	stw r3, 0x10(r4)
/* 80027E0C 00023D8C  90 A4 00 14 */	stw r5, 0x14(r4)
/* 80027E10 00023D90  A0 64 01 A2 */	lhz r3, 0x1a2(r4)
/* 80027E14 00023D94  60 63 00 02 */	ori r3, r3, 0x2
/* 80027E18 00023D98  B0 64 01 A2 */	sth r3, 0x1a2(r4)
/* 80027E1C 00023D9C  7C 60 00 26 */	mfcr r3
/* 80027E20 00023DA0  90 64 00 80 */	stw r3, 0x80(r4)
/* 80027E24 00023DA4  7C 68 02 A6 */	mflr r3
/* 80027E28 00023DA8  90 64 00 84 */	stw r3, 0x84(r4)
/* 80027E2C 00023DAC  7C 69 02 A6 */	mfctr r3
/* 80027E30 00023DB0  90 64 00 88 */	stw r3, 0x88(r4)
/* 80027E34 00023DB4  7C 61 02 A6 */	mfxer r3
/* 80027E38 00023DB8  90 64 00 8C */	stw r3, 0x8c(r4)
/* 80027E3C 00023DBC  7C 7A 02 A6 */	mfsrr0 r3
/* 80027E40 00023DC0  90 64 01 98 */	stw r3, 0x198(r4)
/* 80027E44 00023DC4  7C 7B 02 A6 */	mfsrr1 r3
/* 80027E48 00023DC8  90 64 01 9C */	stw r3, 0x19c(r4)
/* 80027E4C 00023DCC  7C 65 1B 78 */	mr r5, r3
.endfn OSExceptionVector

.fn __DBVECTOR, global
/* 80027E50 00023DD0  60 00 00 00 */	nop
/* 80027E54 00023DD4  7C 60 00 A6 */	mfmsr r3
/* 80027E58 00023DD8  60 63 00 30 */	ori r3, r3, 0x30
/* 80027E5C 00023DDC  7C 7B 03 A6 */	mtsrr1 r3
.endfn __DBVECTOR

.fn __OSEVSetNumber, global
/* 80027E60 00023DE0  38 60 00 00 */	li r3, 0x0
/* 80027E64 00023DE4  80 80 00 D4 */	lwz r4, 0xd4(r0)
/* 80027E68 00023DE8  54 A5 07 BD */	rlwinm. r5, r5, 0, 30, 30
/* 80027E6C 00023DEC  40 82 00 14 */	bne .L_80027E80
/* 80027E70 00023DF0  3C A0 80 02 */	lis r5, OSDefaultExceptionHandler@ha
/* 80027E74 00023DF4  38 A5 7E 94 */	addi r5, r5, OSDefaultExceptionHandler@l
/* 80027E78 00023DF8  7C BA 03 A6 */	mtsrr0 r5
/* 80027E7C 00023DFC  4C 00 00 64 */	rfi
.L_80027E80:
/* 80027E80 00023E00  54 65 15 BA */	clrlslwi r5, r3, 24, 2
/* 80027E84 00023E04  80 A5 30 00 */	lwz r5, 0x3000(r5)
/* 80027E88 00023E08  7C BA 03 A6 */	mtsrr0 r5
/* 80027E8C 00023E0C  4C 00 00 64 */	rfi
.endfn __OSEVSetNumber

.fn __OSEVEnd, global
/* 80027E90 00023E10  60 00 00 00 */	nop
.endfn __OSEVEnd

.fn OSDefaultExceptionHandler, local
/* 80027E94 00023E14  90 04 00 00 */	stw r0, 0x0(r4)
/* 80027E98 00023E18  90 24 00 04 */	stw r1, 0x4(r4)
/* 80027E9C 00023E1C  90 44 00 08 */	stw r2, 0x8(r4)
/* 80027EA0 00023E20  BC C4 00 18 */	stmw r6, 0x18(r4)
/* 80027EA4 00023E24  7C 11 E2 A6 */	mfspr r0, GQR1
/* 80027EA8 00023E28  90 04 01 A8 */	stw r0, 0x1a8(r4)
/* 80027EAC 00023E2C  7C 12 E2 A6 */	mfspr r0, GQR2
/* 80027EB0 00023E30  90 04 01 AC */	stw r0, 0x1ac(r4)
/* 80027EB4 00023E34  7C 13 E2 A6 */	mfspr r0, GQR3
/* 80027EB8 00023E38  90 04 01 B0 */	stw r0, 0x1b0(r4)
/* 80027EBC 00023E3C  7C 14 E2 A6 */	mfspr r0, GQR4
/* 80027EC0 00023E40  90 04 01 B4 */	stw r0, 0x1b4(r4)
/* 80027EC4 00023E44  7C 15 E2 A6 */	mfspr r0, GQR5
/* 80027EC8 00023E48  90 04 01 B8 */	stw r0, 0x1b8(r4)
/* 80027ECC 00023E4C  7C 16 E2 A6 */	mfspr r0, GQR6
/* 80027ED0 00023E50  90 04 01 BC */	stw r0, 0x1bc(r4)
/* 80027ED4 00023E54  7C 17 E2 A6 */	mfspr r0, GQR7
/* 80027ED8 00023E58  90 04 01 C0 */	stw r0, 0x1c0(r4)
/* 80027EDC 00023E5C  7C B2 02 A6 */	mfdsisr r5
/* 80027EE0 00023E60  7C D3 02 A6 */	mfdar r6
/* 80027EE4 00023E64  48 00 1E C8 */	b __OSUnhandledException
.endfn OSDefaultExceptionHandler

.fn __OSPSInit, global
/* 80027EE8 00023E68  7C 08 02 A6 */	mflr r0
/* 80027EEC 00023E6C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80027EF0 00023E70  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80027EF4 00023E74  4B FF F7 E1 */	bl PPCMfhid2
/* 80027EF8 00023E78  64 63 A0 00 */	oris r3, r3, 0xa000
/* 80027EFC 00023E7C  4B FF F7 E1 */	bl PPCMthid2
/* 80027F00 00023E80  48 00 11 45 */	bl ICFlashInvalidate
/* 80027F04 00023E84  7C 00 04 AC */	sync
/* 80027F08 00023E88  38 60 00 00 */	li r3, 0x0
/* 80027F0C 00023E8C  7C 70 E3 A6 */	mtspr GQR0, r3
/* 80027F10 00023E90  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80027F14 00023E94  38 21 00 08 */	addi r1, r1, 0x8
/* 80027F18 00023E98  7C 08 03 A6 */	mtlr r0
/* 80027F1C 00023E9C  4E 80 00 20 */	blr
.endfn __OSPSInit

.fn __OSGetDIConfig, global
/* 80027F20 00023EA0  3C 60 CC 00 */	lis r3, 0xCC006000@ha
/* 80027F24 00023EA4  38 63 60 00 */	addi r3, r3, 0xCC006000@l
/* 80027F28 00023EA8  80 03 00 24 */	lwz r0, 0x24(r3)
/* 80027F2C 00023EAC  54 03 06 3E */	clrlwi r3, r0, 24
/* 80027F30 00023EB0  4E 80 00 20 */	blr
.endfn __OSGetDIConfig

.section .data, "wa"  # 0x80065000 - 0x8006D1C0

.balign 8


.obj lbl_800674F0, local
	.asciz "\nDolphin OS $Revision: 45 $.\n"
	.balign 4
	.asciz "Kernel built : %s %s\n"
	.balign 4
	.asciz "Sep  8 2001"
	.asciz "01:49:37"
	.balign 4
	.asciz "Console Type : "
	.asciz "Retail %d\n"
	.balign 4
	.asciz "Mac Emulator\n"
	.balign 4
	.asciz "PC Emulator\n"
	.balign 4
	.asciz "EPPC Arthur\n"
	.balign 4
	.asciz "EPPC Minnow\n"
	.balign 4
	.asciz "Development HW%d\n"
	.balign 4
	.asciz "Memory %d MB\n"
	.balign 4
	.asciz "Arena : 0x%x - 0x%x\n"
	.balign 4
.endobj lbl_800674F0

.obj __OSExceptionLocations, local
	.4byte 0x00000100
	.4byte 0x00000200
	.4byte 0x00000300
	.4byte 0x00000400
	.4byte 0x00000500
	.4byte 0x00000600
	.4byte 0x00000700
	.4byte 0x00000800
	.4byte 0x00000900
	.4byte 0x00000C00
	.4byte 0x00000D00
	.4byte 0x00000F00
	.4byte 0x00001300
	.4byte 0x00001400
	.4byte 0x00001700
.endobj __OSExceptionLocations

	.asciz "Installing OSDBIntegrator\n"
	.balign 4
	.asciz ">>> OSINIT: exception %d commandeered by TRK\n"
	.balign 4
	.asciz ">>> OSINIT: exception %d vectored to debugger\n"
	.balign 4
	.asciz "Exceptions initialized...\n"
	.balign 4
	.4byte 0

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380

.balign 8


.obj BootInfo, local
	.skip 0x4
.endobj BootInfo

.obj BI2DebugFlag, local
	.skip 0x4
.endobj BI2DebugFlag

.obj AreWeInitialized, local
	.skip 0x4
.endobj AreWeInitialized

.obj OSExceptionTable, local
	.skip 0x4
.endobj OSExceptionTable

.obj __OSStartTime, global
	.skip 0x8
.endobj __OSStartTime
