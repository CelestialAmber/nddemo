.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn DCEnable, global
/* 80028F00 00024E80  7C 00 04 AC */	sync
/* 80028F04 00024E84  7C 70 FA A6 */	mfspr r3, HID0
/* 80028F08 00024E88  60 63 40 00 */	ori r3, r3, 0x4000
/* 80028F0C 00024E8C  7C 70 FB A6 */	mtspr HID0, r3
/* 80028F10 00024E90  4E 80 00 20 */	blr
.endfn DCEnable

.fn DCInvalidateRange, global
/* 80028F14 00024E94  28 04 00 00 */	cmplwi r4, 0x0
/* 80028F18 00024E98  4C 81 00 20 */	blelr
/* 80028F1C 00024E9C  54 65 06 FF */	clrlwi. r5, r3, 27
/* 80028F20 00024EA0  41 82 00 08 */	beq .L_80028F28
/* 80028F24 00024EA4  38 84 00 20 */	addi r4, r4, 0x20
.L_80028F28:
/* 80028F28 00024EA8  38 84 00 1F */	addi r4, r4, 0x1f
/* 80028F2C 00024EAC  54 84 D9 7E */	srwi r4, r4, 5
/* 80028F30 00024EB0  7C 89 03 A6 */	mtctr r4
.L_80028F34:
/* 80028F34 00024EB4  7C 00 1B AC */	dcbi r0, r3
/* 80028F38 00024EB8  38 63 00 20 */	addi r3, r3, 0x20
/* 80028F3C 00024EBC  42 00 FF F8 */	bdnz .L_80028F34
/* 80028F40 00024EC0  4E 80 00 20 */	blr
.endfn DCInvalidateRange

.fn DCFlushRange, global
/* 80028F44 00024EC4  28 04 00 00 */	cmplwi r4, 0x0
/* 80028F48 00024EC8  4C 81 00 20 */	blelr
/* 80028F4C 00024ECC  54 65 06 FF */	clrlwi. r5, r3, 27
/* 80028F50 00024ED0  41 82 00 08 */	beq .L_80028F58
/* 80028F54 00024ED4  38 84 00 20 */	addi r4, r4, 0x20
.L_80028F58:
/* 80028F58 00024ED8  38 84 00 1F */	addi r4, r4, 0x1f
/* 80028F5C 00024EDC  54 84 D9 7E */	srwi r4, r4, 5
/* 80028F60 00024EE0  7C 89 03 A6 */	mtctr r4
.L_80028F64:
/* 80028F64 00024EE4  7C 00 18 AC */	dcbf r0, r3
/* 80028F68 00024EE8  38 63 00 20 */	addi r3, r3, 0x20
/* 80028F6C 00024EEC  42 00 FF F8 */	bdnz .L_80028F64
/* 80028F70 00024EF0  44 00 00 02 */	sc
/* 80028F74 00024EF4  4E 80 00 20 */	blr
.endfn DCFlushRange

.fn DCStoreRange, global
/* 80028F78 00024EF8  28 04 00 00 */	cmplwi r4, 0x0
/* 80028F7C 00024EFC  4C 81 00 20 */	blelr
/* 80028F80 00024F00  54 65 06 FF */	clrlwi. r5, r3, 27
/* 80028F84 00024F04  41 82 00 08 */	beq .L_80028F8C
/* 80028F88 00024F08  38 84 00 20 */	addi r4, r4, 0x20
.L_80028F8C:
/* 80028F8C 00024F0C  38 84 00 1F */	addi r4, r4, 0x1f
/* 80028F90 00024F10  54 84 D9 7E */	srwi r4, r4, 5
/* 80028F94 00024F14  7C 89 03 A6 */	mtctr r4
.L_80028F98:
/* 80028F98 00024F18  7C 00 18 6C */	dcbst r0, r3
/* 80028F9C 00024F1C  38 63 00 20 */	addi r3, r3, 0x20
/* 80028FA0 00024F20  42 00 FF F8 */	bdnz .L_80028F98
/* 80028FA4 00024F24  44 00 00 02 */	sc
/* 80028FA8 00024F28  4E 80 00 20 */	blr
.endfn DCStoreRange

.fn DCFlushRangeNoSync, global
/* 80028FAC 00024F2C  28 04 00 00 */	cmplwi r4, 0x0
/* 80028FB0 00024F30  4C 81 00 20 */	blelr
/* 80028FB4 00024F34  54 65 06 FF */	clrlwi. r5, r3, 27
/* 80028FB8 00024F38  41 82 00 08 */	beq .L_80028FC0
/* 80028FBC 00024F3C  38 84 00 20 */	addi r4, r4, 0x20
.L_80028FC0:
/* 80028FC0 00024F40  38 84 00 1F */	addi r4, r4, 0x1f
/* 80028FC4 00024F44  54 84 D9 7E */	srwi r4, r4, 5
/* 80028FC8 00024F48  7C 89 03 A6 */	mtctr r4
.L_80028FCC:
/* 80028FCC 00024F4C  7C 00 18 AC */	dcbf r0, r3
/* 80028FD0 00024F50  38 63 00 20 */	addi r3, r3, 0x20
/* 80028FD4 00024F54  42 00 FF F8 */	bdnz .L_80028FCC
/* 80028FD8 00024F58  4E 80 00 20 */	blr
.endfn DCFlushRangeNoSync

.fn DCStoreRangeNoSync, global
/* 80028FDC 00024F5C  28 04 00 00 */	cmplwi r4, 0x0
/* 80028FE0 00024F60  4C 81 00 20 */	blelr
/* 80028FE4 00024F64  54 65 06 FF */	clrlwi. r5, r3, 27
/* 80028FE8 00024F68  41 82 00 08 */	beq .L_80028FF0
/* 80028FEC 00024F6C  38 84 00 20 */	addi r4, r4, 0x20
.L_80028FF0:
/* 80028FF0 00024F70  38 84 00 1F */	addi r4, r4, 0x1f
/* 80028FF4 00024F74  54 84 D9 7E */	srwi r4, r4, 5
/* 80028FF8 00024F78  7C 89 03 A6 */	mtctr r4
.L_80028FFC:
/* 80028FFC 00024F7C  7C 00 18 6C */	dcbst r0, r3
/* 80029000 00024F80  38 63 00 20 */	addi r3, r3, 0x20
/* 80029004 00024F84  42 00 FF F8 */	bdnz .L_80028FFC
/* 80029008 00024F88  4E 80 00 20 */	blr
.endfn DCStoreRangeNoSync

.fn ICInvalidateRange, global
/* 8002900C 00024F8C  28 04 00 00 */	cmplwi r4, 0x0
/* 80029010 00024F90  4C 81 00 20 */	blelr
/* 80029014 00024F94  54 65 06 FF */	clrlwi. r5, r3, 27
/* 80029018 00024F98  41 82 00 08 */	beq .L_80029020
/* 8002901C 00024F9C  38 84 00 20 */	addi r4, r4, 0x20
.L_80029020:
/* 80029020 00024FA0  38 84 00 1F */	addi r4, r4, 0x1f
/* 80029024 00024FA4  54 84 D9 7E */	srwi r4, r4, 5
/* 80029028 00024FA8  7C 89 03 A6 */	mtctr r4
.L_8002902C:
/* 8002902C 00024FAC  7C 00 1F AC */	icbi r0, r3
/* 80029030 00024FB0  38 63 00 20 */	addi r3, r3, 0x20
/* 80029034 00024FB4  42 00 FF F8 */	bdnz .L_8002902C
/* 80029038 00024FB8  7C 00 04 AC */	sync
/* 8002903C 00024FBC  4C 00 01 2C */	isync
/* 80029040 00024FC0  4E 80 00 20 */	blr
.endfn ICInvalidateRange

.fn ICFlashInvalidate, global
/* 80029044 00024FC4  7C 70 FA A6 */	mfspr r3, HID0
/* 80029048 00024FC8  60 63 08 00 */	ori r3, r3, 0x800
/* 8002904C 00024FCC  7C 70 FB A6 */	mtspr HID0, r3
/* 80029050 00024FD0  4E 80 00 20 */	blr
.endfn ICFlashInvalidate

.fn ICEnable, global
/* 80029054 00024FD4  4C 00 01 2C */	isync
/* 80029058 00024FD8  7C 70 FA A6 */	mfspr r3, HID0
/* 8002905C 00024FDC  60 63 80 00 */	ori r3, r3, 0x8000
/* 80029060 00024FE0  7C 70 FB A6 */	mtspr HID0, r3
/* 80029064 00024FE4  4E 80 00 20 */	blr
.endfn ICEnable

.fn LCDisable, global
/* 80029068 00024FE8  3C 60 E0 00 */	lis r3, 0xE0000020@ha
/* 8002906C 00024FEC  38 80 02 00 */	li r4, 0x200
/* 80029070 00024FF0  7C 89 03 A6 */	mtctr r4
.L_80029074:
/* 80029074 00024FF4  7C 00 1B AC */	dcbi r0, r3
/* 80029078 00024FF8  38 63 00 20 */	addi r3, r3, 0xE0000020@l
/* 8002907C 00024FFC  42 00 FF F8 */	bdnz .L_80029074
/* 80029080 00025000  7C 98 E2 A6 */	mfspr r4, HID2
/* 80029084 00025004  54 84 01 04 */	rlwinm r4, r4, 0, 4, 2
/* 80029088 00025008  7C 98 E3 A6 */	mtspr HID2, r4
/* 8002908C 0002500C  4E 80 00 20 */	blr
.endfn LCDisable

.fn L2GlobalInvalidate, global
/* 80029090 00025010  7C 08 02 A6 */	mflr r0
/* 80029094 00025014  90 01 00 04 */	stw r0, 0x4(r1)
/* 80029098 00025018  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8002909C 0002501C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800290A0 00025020  7C 00 04 AC */	sync
/* 800290A4 00025024  4B FF E5 FD */	bl PPCMfl2cr
/* 800290A8 00025028  54 63 00 7E */	clrlwi r3, r3, 1
/* 800290AC 0002502C  4B FF E5 FD */	bl PPCMtl2cr
/* 800290B0 00025030  7C 00 04 AC */	sync
/* 800290B4 00025034  4B FF E5 ED */	bl PPCMfl2cr
/* 800290B8 00025038  64 63 00 20 */	oris r3, r3, 0x20
/* 800290BC 0002503C  4B FF E5 ED */	bl PPCMtl2cr
/* 800290C0 00025040  48 00 00 04 */	b .L_800290C4
.L_800290C4:
/* 800290C4 00025044  48 00 00 04 */	b .L_800290C8
.L_800290C8:
/* 800290C8 00025048  4B FF E5 D9 */	bl PPCMfl2cr
/* 800290CC 0002504C  54 60 07 FE */	clrlwi r0, r3, 31
/* 800290D0 00025050  28 00 00 00 */	cmplwi r0, 0x0
/* 800290D4 00025054  40 82 FF F4 */	bne .L_800290C8
/* 800290D8 00025058  4B FF E5 C9 */	bl PPCMfl2cr
/* 800290DC 0002505C  54 63 02 D2 */	rlwinm r3, r3, 0, 11, 9
/* 800290E0 00025060  4B FF E5 C9 */	bl PPCMtl2cr
/* 800290E4 00025064  48 00 00 04 */	b .L_800290E8
.L_800290E8:
/* 800290E8 00025068  3C 60 80 06 */	lis r3, lbl_80067AC8@ha
/* 800290EC 0002506C  3B E3 7A C8 */	addi r31, r3, lbl_80067AC8@l
/* 800290F0 00025070  48 00 00 04 */	b .L_800290F4
.L_800290F4:
/* 800290F4 00025074  48 00 00 10 */	b .L_80029104
.L_800290F8:
/* 800290F8 00025078  7F E3 FB 78 */	mr r3, r31
/* 800290FC 0002507C  4C C6 31 82 */	crclr 4*cr1+eq
/* 80029100 00025080  48 00 68 21 */	bl DBPrintf
.L_80029104:
/* 80029104 00025084  4B FF E5 9D */	bl PPCMfl2cr
/* 80029108 00025088  54 60 07 FE */	clrlwi r0, r3, 31
/* 8002910C 0002508C  28 00 00 00 */	cmplwi r0, 0x0
/* 80029110 00025090  40 82 FF E8 */	bne .L_800290F8
/* 80029114 00025094  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80029118 00025098  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8002911C 0002509C  38 21 00 10 */	addi r1, r1, 0x10
/* 80029120 000250A0  7C 08 03 A6 */	mtlr r0
/* 80029124 000250A4  4E 80 00 20 */	blr
.endfn L2GlobalInvalidate

.fn DMAErrorHandler, global
/* 80029128 000250A8  7C 08 02 A6 */	mflr r0
/* 8002912C 000250AC  90 01 00 04 */	stw r0, 0x4(r1)
/* 80029130 000250B0  94 21 FF 80 */	stwu r1, -0x80(r1)
/* 80029134 000250B4  93 E1 00 7C */	stw r31, 0x7c(r1)
/* 80029138 000250B8  93 C1 00 78 */	stw r30, 0x78(r1)
/* 8002913C 000250BC  93 A1 00 74 */	stw r29, 0x74(r1)
/* 80029140 000250C0  40 86 00 24 */	bne cr1, .L_80029164
/* 80029144 000250C4  D8 21 00 28 */	stfd f1, 0x28(r1)
/* 80029148 000250C8  D8 41 00 30 */	stfd f2, 0x30(r1)
/* 8002914C 000250CC  D8 61 00 38 */	stfd f3, 0x38(r1)
/* 80029150 000250D0  D8 81 00 40 */	stfd f4, 0x40(r1)
/* 80029154 000250D4  D8 A1 00 48 */	stfd f5, 0x48(r1)
/* 80029158 000250D8  D8 C1 00 50 */	stfd f6, 0x50(r1)
/* 8002915C 000250DC  D8 E1 00 58 */	stfd f7, 0x58(r1)
/* 80029160 000250E0  D9 01 00 60 */	stfd f8, 0x60(r1)
.L_80029164:
/* 80029164 000250E4  90 61 00 08 */	stw r3, 0x8(r1)
/* 80029168 000250E8  90 81 00 0C */	stw r4, 0xc(r1)
/* 8002916C 000250EC  90 A1 00 10 */	stw r5, 0x10(r1)
/* 80029170 000250F0  90 C1 00 14 */	stw r6, 0x14(r1)
/* 80029174 000250F4  90 E1 00 18 */	stw r7, 0x18(r1)
/* 80029178 000250F8  91 01 00 1C */	stw r8, 0x1c(r1)
/* 8002917C 000250FC  91 21 00 20 */	stw r9, 0x20(r1)
/* 80029180 00025100  91 41 00 24 */	stw r10, 0x24(r1)
/* 80029184 00025104  7C 9D 23 78 */	mr r29, r4
/* 80029188 00025108  3C 60 80 06 */	lis r3, lbl_80067AC8@ha
/* 8002918C 0002510C  3B E3 7A C8 */	addi r31, r3, lbl_80067AC8@l
/* 80029190 00025110  4B FF E5 45 */	bl PPCMfhid2
/* 80029194 00025114  7C 7E 1B 78 */	mr r30, r3
/* 80029198 00025118  4C C6 31 82 */	crclr 4*cr1+eq
/* 8002919C 0002511C  38 7F 00 2C */	addi r3, r31, 0x2c
/* 800291A0 00025120  48 00 0A 45 */	bl OSReport
/* 800291A4 00025124  80 BD 01 9C */	lwz r5, 0x19c(r29)
/* 800291A8 00025128  7F C4 F3 78 */	mr r4, r30
/* 800291AC 0002512C  38 7F 00 44 */	addi r3, r31, 0x44
/* 800291B0 00025130  4C C6 31 82 */	crclr 4*cr1+eq
/* 800291B4 00025134  48 00 0A 31 */	bl OSReport
/* 800291B8 00025138  57 C0 02 16 */	rlwinm r0, r30, 0, 8, 11
/* 800291BC 0002513C  28 00 00 00 */	cmplwi r0, 0x0
/* 800291C0 00025140  41 82 00 14 */	beq .L_800291D4
/* 800291C4 00025144  80 1D 01 9C */	lwz r0, 0x19c(r29)
/* 800291C8 00025148  54 00 02 94 */	rlwinm r0, r0, 0, 10, 10
/* 800291CC 0002514C  28 00 00 00 */	cmplwi r0, 0x0
/* 800291D0 00025150  40 82 00 1C */	bne .L_800291EC
.L_800291D4:
/* 800291D4 00025154  38 7F 00 60 */	addi r3, r31, 0x60
/* 800291D8 00025158  4C C6 31 82 */	crclr 4*cr1+eq
/* 800291DC 0002515C  48 00 0A 09 */	bl OSReport
/* 800291E0 00025160  7F A3 EB 78 */	mr r3, r29
/* 800291E4 00025164  48 00 06 8D */	bl OSDumpContext
/* 800291E8 00025168  4B FF E4 D9 */	bl PPCHalt
.L_800291EC:
/* 800291EC 0002516C  38 7F 00 90 */	addi r3, r31, 0x90
/* 800291F0 00025170  4C C6 31 82 */	crclr 4*cr1+eq
/* 800291F4 00025174  48 00 09 F1 */	bl OSReport
/* 800291F8 00025178  38 7F 00 CC */	addi r3, r31, 0xcc
/* 800291FC 0002517C  4C C6 31 82 */	crclr 4*cr1+eq
/* 80029200 00025180  48 00 09 E5 */	bl OSReport
/* 80029204 00025184  57 C0 02 10 */	rlwinm r0, r30, 0, 8, 8
/* 80029208 00025188  28 00 00 00 */	cmplwi r0, 0x0
/* 8002920C 0002518C  41 82 00 10 */	beq .L_8002921C
/* 80029210 00025190  38 7F 01 04 */	addi r3, r31, 0x104
/* 80029214 00025194  4C C6 31 82 */	crclr 4*cr1+eq
/* 80029218 00025198  48 00 09 CD */	bl OSReport
.L_8002921C:
/* 8002921C 0002519C  57 C0 02 52 */	rlwinm r0, r30, 0, 9, 9
/* 80029220 000251A0  28 00 00 00 */	cmplwi r0, 0x0
/* 80029224 000251A4  41 82 00 10 */	beq .L_80029234
/* 80029228 000251A8  38 7F 01 44 */	addi r3, r31, 0x144
/* 8002922C 000251AC  4C C6 31 82 */	crclr 4*cr1+eq
/* 80029230 000251B0  48 00 09 B5 */	bl OSReport
.L_80029234:
/* 80029234 000251B4  57 C0 02 94 */	rlwinm r0, r30, 0, 10, 10
/* 80029238 000251B8  28 00 00 00 */	cmplwi r0, 0x0
/* 8002923C 000251BC  41 82 00 10 */	beq .L_8002924C
/* 80029240 000251C0  38 7F 01 70 */	addi r3, r31, 0x170
/* 80029244 000251C4  4C C6 31 82 */	crclr 4*cr1+eq
/* 80029248 000251C8  48 00 09 9D */	bl OSReport
.L_8002924C:
/* 8002924C 000251CC  57 C0 02 D6 */	rlwinm r0, r30, 0, 11, 11
/* 80029250 000251D0  28 00 00 00 */	cmplwi r0, 0x0
/* 80029254 000251D4  41 82 00 10 */	beq .L_80029264
/* 80029258 000251D8  38 7F 01 90 */	addi r3, r31, 0x190
/* 8002925C 000251DC  4C C6 31 82 */	crclr 4*cr1+eq
/* 80029260 000251E0  48 00 09 85 */	bl OSReport
.L_80029264:
/* 80029264 000251E4  7F C3 F3 78 */	mr r3, r30
/* 80029268 000251E8  4B FF E4 75 */	bl PPCMthid2
/* 8002926C 000251EC  80 01 00 84 */	lwz r0, 0x84(r1)
/* 80029270 000251F0  83 E1 00 7C */	lwz r31, 0x7c(r1)
/* 80029274 000251F4  83 C1 00 78 */	lwz r30, 0x78(r1)
/* 80029278 000251F8  7C 08 03 A6 */	mtlr r0
/* 8002927C 000251FC  83 A1 00 74 */	lwz r29, 0x74(r1)
/* 80029280 00025200  38 21 00 80 */	addi r1, r1, 0x80
/* 80029284 00025204  4E 80 00 20 */	blr
.endfn DMAErrorHandler

.fn __OSCacheInit, global
/* 80029288 00025208  7C 08 02 A6 */	mflr r0
/* 8002928C 0002520C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80029290 00025210  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80029294 00025214  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80029298 00025218  93 C1 00 08 */	stw r30, 0x8(r1)
/* 8002929C 0002521C  3C 60 80 06 */	lis r3, lbl_80067AC8@ha
/* 800292A0 00025220  3B E3 7A C8 */	addi r31, r3, lbl_80067AC8@l
/* 800292A4 00025224  4B FF E3 F5 */	bl PPCMfhid0
/* 800292A8 00025228  54 60 04 20 */	rlwinm r0, r3, 0, 16, 16
/* 800292AC 0002522C  28 00 00 00 */	cmplwi r0, 0x0
/* 800292B0 00025230  40 82 00 14 */	bne .L_800292C4
/* 800292B4 00025234  4B FF FD A1 */	bl ICEnable
/* 800292B8 00025238  38 7F 01 AC */	addi r3, r31, 0x1ac
/* 800292BC 0002523C  4C C6 31 82 */	crclr 4*cr1+eq
/* 800292C0 00025240  48 00 66 61 */	bl DBPrintf
.L_800292C4:
/* 800292C4 00025244  4B FF E3 D5 */	bl PPCMfhid0
/* 800292C8 00025248  54 60 04 62 */	rlwinm r0, r3, 0, 17, 17
/* 800292CC 0002524C  28 00 00 00 */	cmplwi r0, 0x0
/* 800292D0 00025250  40 82 00 14 */	bne .L_800292E4
/* 800292D4 00025254  4B FF FC 2D */	bl DCEnable
/* 800292D8 00025258  38 7F 01 C8 */	addi r3, r31, 0x1c8
/* 800292DC 0002525C  4C C6 31 82 */	crclr 4*cr1+eq
/* 800292E0 00025260  48 00 66 41 */	bl DBPrintf
.L_800292E4:
/* 800292E4 00025264  4B FF E3 BD */	bl PPCMfl2cr
/* 800292E8 00025268  54 60 00 00 */	clrrwi r0, r3, 31
/* 800292EC 0002526C  28 00 00 00 */	cmplwi r0, 0x0
/* 800292F0 00025270  40 82 00 58 */	bne .L_80029348
/* 800292F4 00025274  4B FF E3 95 */	bl PPCMfmsr
/* 800292F8 00025278  7C 7E 1B 78 */	mr r30, r3
/* 800292FC 0002527C  7C 00 04 AC */	sync
/* 80029300 00025280  38 60 00 30 */	li r3, 0x30
/* 80029304 00025284  4B FF E3 8D */	bl PPCMtmsr
/* 80029308 00025288  7C 00 04 AC */	sync
/* 8002930C 0002528C  7C 00 04 AC */	sync
/* 80029310 00025290  4B FF E3 91 */	bl PPCMfl2cr
/* 80029314 00025294  54 63 00 7E */	clrlwi r3, r3, 1
/* 80029318 00025298  4B FF E3 91 */	bl PPCMtl2cr
/* 8002931C 0002529C  7C 00 04 AC */	sync
/* 80029320 000252A0  4B FF FD 71 */	bl L2GlobalInvalidate
/* 80029324 000252A4  7F C3 F3 78 */	mr r3, r30
/* 80029328 000252A8  4B FF E3 69 */	bl PPCMtmsr
/* 8002932C 000252AC  4B FF E3 75 */	bl PPCMfl2cr
/* 80029330 000252B0  64 60 80 00 */	oris r0, r3, 0x8000
/* 80029334 000252B4  54 03 02 D2 */	rlwinm r3, r0, 0, 11, 9
/* 80029338 000252B8  4B FF E3 71 */	bl PPCMtl2cr
/* 8002933C 000252BC  38 7F 01 E4 */	addi r3, r31, 0x1e4
/* 80029340 000252C0  4C C6 31 82 */	crclr 4*cr1+eq
/* 80029344 000252C4  48 00 65 DD */	bl DBPrintf
.L_80029348:
/* 80029348 000252C8  3C 60 80 03 */	lis r3, DMAErrorHandler@ha
/* 8002934C 000252CC  38 83 91 28 */	addi r4, r3, DMAErrorHandler@l
/* 80029350 000252D0  38 60 00 01 */	li r3, 0x1
/* 80029354 000252D4  48 00 0A 3D */	bl OSSetErrorHandler
/* 80029358 000252D8  38 7F 01 FC */	addi r3, r31, 0x1fc
/* 8002935C 000252DC  4C C6 31 82 */	crclr 4*cr1+eq
/* 80029360 000252E0  48 00 65 C1 */	bl DBPrintf
/* 80029364 000252E4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80029368 000252E8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8002936C 000252EC  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 80029370 000252F0  7C 08 03 A6 */	mtlr r0
/* 80029374 000252F4  38 21 00 10 */	addi r1, r1, 0x10
/* 80029378 000252F8  4E 80 00 20 */	blr
.endfn __OSCacheInit

.section .data, "wa"  # 0x80065000 - 0x8006D1C0

.balign 8



.obj lbl_80067AC8, local
	.asciz ">>> L2 INVALIDATE : SHOULD NEVER HAPPEN\n"
	.balign 4
	.asciz "Machine check received\n"
	.asciz "HID2 = 0x%x   SRR1 = 0x%x\n"
	.balign 4
	.asciz "Machine check was not DMA/locked cache related\n"
	.asciz "DMAErrorHandler(): An error occurred while processing DMA.\n"
	.asciz "The following errors have been detected and cleared :\n"
	.balign 4
	.asciz "\t- Requested a locked cache tag that was already in the cache\n"
	.balign 4
	.asciz "\t- DMA attempted to access normal cache\n"
	.balign 4
	.asciz "\t- DMA missed in data cache\n"
	.balign 4
	.asciz "\t- DMA queue overflowed\n"
	.balign 4
	.asciz "L1 i-caches initialized\n"
	.balign 4
	.asciz "L1 d-caches initialized\n"
	.balign 4
	.asciz "L2 cache initialized\n"
	.balign 4
	.asciz "Locked cache machine check handler installed\n"
	.balign 4
	.4byte 0
.endobj lbl_80067AC8
