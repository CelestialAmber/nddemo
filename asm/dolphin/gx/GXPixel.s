.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn GXSetFog, global
/* 80040208 0003C188  7C 08 02 A6 */	mflr r0
/* 8004020C 0003C18C  FC 04 18 00 */	fcmpu cr0, f4, f3
/* 80040210 0003C190  90 01 00 04 */	stw r0, 0x4(r1)
/* 80040214 0003C194  94 21 FF B8 */	stwu r1, -0x48(r1)
/* 80040218 0003C198  93 E1 00 44 */	stw r31, 0x44(r1)
/* 8004021C 0003C19C  3B E3 00 00 */	addi r31, r3, 0x0
/* 80040220 0003C1A0  93 C1 00 40 */	stw r30, 0x40(r1)
/* 80040224 0003C1A4  93 A1 00 3C */	stw r29, 0x3c(r1)
/* 80040228 0003C1A8  3B A4 00 00 */	addi r29, r4, 0x0
/* 8004022C 0003C1AC  41 82 00 0C */	beq .L_80040238
/* 80040230 0003C1B0  FC 02 08 00 */	fcmpu cr0, f2, f1
/* 80040234 0003C1B4  40 82 00 14 */	bne .L_80040248
.L_80040238:
/* 80040238 0003C1B8  C0 62 85 90 */	lfs f3, float_800A9910@sda21(r2)
/* 8004023C 0003C1BC  C0 82 85 94 */	lfs f4, float_800A9914@sda21(r2)
/* 80040240 0003C1C0  FC A0 18 90 */	fmr f5, f3
/* 80040244 0003C1C4  48 00 00 20 */	b .L_80040264
.L_80040248:
/* 80040248 0003C1C8  EC 04 18 28 */	fsubs f0, f4, f3
/* 8004024C 0003C1CC  EC A2 08 28 */	fsubs f5, f2, f1
/* 80040250 0003C1D0  EC 44 00 F2 */	fmuls f2, f4, f3
/* 80040254 0003C1D4  EC 84 00 24 */	fdivs f4, f4, f0
/* 80040258 0003C1D8  EC 00 01 72 */	fmuls f0, f0, f5
/* 8004025C 0003C1DC  EC A1 28 24 */	fdivs f5, f1, f5
/* 80040260 0003C1E0  EC 62 00 24 */	fdivs f3, f2, f0
.L_80040264:
/* 80040264 0003C1E4  C0 22 85 94 */	lfs f1, float_800A9914@sda21(r2)
/* 80040268 0003C1E8  38 60 00 00 */	li r3, 0x0
/* 8004026C 0003C1EC  C8 02 85 98 */	lfd f0, lbl_800A9918@sda21(r2)
/* 80040270 0003C1F0  48 00 00 0C */	b .L_8004027C
.L_80040274:
/* 80040274 0003C1F4  EC 84 00 72 */	fmuls f4, f4, f1
/* 80040278 0003C1F8  38 63 00 01 */	addi r3, r3, 0x1
.L_8004027C:
/* 8004027C 0003C1FC  FC 04 00 40 */	fcmpo cr0, f4, f0
/* 80040280 0003C200  41 81 FF F4 */	bgt .L_80040274
/* 80040284 0003C204  C8 02 85 A8 */	lfd f0, lbl_800A9928@sda21(r2)
/* 80040288 0003C208  C0 42 85 A0 */	lfs f2, float_800A9920@sda21(r2)
/* 8004028C 0003C20C  C0 22 85 90 */	lfs f1, float_800A9910@sda21(r2)
/* 80040290 0003C210  48 00 00 0C */	b .L_8004029C
.L_80040294:
/* 80040294 0003C214  EC 84 00 B2 */	fmuls f4, f4, f2
/* 80040298 0003C218  38 63 FF FF */	addi r3, r3, -0x1
.L_8004029C:
/* 8004029C 0003C21C  FC 04 08 40 */	fcmpo cr0, f4, f1
/* 800402A0 0003C220  40 81 00 0C */	ble .L_800402AC
/* 800402A4 0003C224  FC 04 00 40 */	fcmpo cr0, f4, f0
/* 800402A8 0003C228  41 80 FF EC */	blt .L_80040294
.L_800402AC:
/* 800402AC 0003C22C  3B C3 00 01 */	addi r30, r3, 0x1
/* 800402B0 0003C230  C0 02 85 B0 */	lfs f0, float_800A9930@sda21(r2)
/* 800402B4 0003C234  38 00 00 01 */	li r0, 0x1
/* 800402B8 0003C238  C8 42 85 B8 */	lfd f2, lbl_800A9938@sda21(r2)
/* 800402BC 0003C23C  7C 00 F0 30 */	slw r0, r0, r30
/* 800402C0 0003C240  EC 20 01 32 */	fmuls f1, f0, f4
/* 800402C4 0003C244  6C 03 80 00 */	xoris r3, r0, 0x8000
/* 800402C8 0003C248  D0 A1 00 28 */	stfs f5, 0x28(r1)
/* 800402CC 0003C24C  3C 00 43 30 */	lis r0, 0x4330
/* 800402D0 0003C250  90 61 00 34 */	stw r3, 0x34(r1)
/* 800402D4 0003C254  90 01 00 30 */	stw r0, 0x30(r1)
/* 800402D8 0003C258  C8 01 00 30 */	lfd f0, 0x30(r1)
/* 800402DC 0003C25C  EC 00 10 28 */	fsubs f0, f0, f2
/* 800402E0 0003C260  EC 03 00 24 */	fdivs f0, f3, f0
/* 800402E4 0003C264  D0 01 00 2C */	stfs f0, 0x2c(r1)
/* 800402E8 0003C268  48 01 F1 15 */	bl __cvt_fp2unsigned
/* 800402EC 0003C26C  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800402F0 0003C270  54 69 02 3E */	clrlwi r9, r3, 8
/* 800402F4 0003C274  88 DD 00 01 */	lbz r6, 0x1(r29)
/* 800402F8 0003C278  57 C8 02 3E */	clrlwi r8, r30, 8
/* 800402FC 0003C27C  54 04 A3 68 */	rlwinm r4, r0, 20, 13, 20
/* 80040300 0003C280  50 04 A5 7E */	rlwimi r4, r0, 20, 21, 31
/* 80040304 0003C284  89 7D 00 02 */	lbz r11, 0x2(r29)
/* 80040308 0003C288  54 00 A3 18 */	rlwinm r0, r0, 20, 12, 12
/* 8004030C 0003C28C  88 BD 00 00 */	lbz r5, 0x0(r29)
/* 80040310 0003C290  50 80 03 7E */	rlwimi r0, r4, 0, 13, 31
/* 80040314 0003C294  81 81 00 28 */	lwz r12, 0x28(r1)
/* 80040318 0003C298  54 07 02 3E */	clrlwi r7, r0, 8
/* 8004031C 0003C29C  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040320 0003C2A0  64 EA EE 00 */	oris r10, r7, 0xee00
/* 80040324 0003C2A4  38 00 00 61 */	li r0, 0x61
/* 80040328 0003C2A8  3C 80 CC 01 */	lis r4, 0xCC008000@ha
/* 8004032C 0003C2AC  98 04 80 00 */	stb r0, 0xCC008000@l(r4)
/* 80040330 0003C2B0  65 27 EF 00 */	oris r7, r9, 0xef00
/* 80040334 0003C2B4  54 C6 40 2E */	slwi r6, r6, 8
/* 80040338 0003C2B8  91 44 80 00 */	stw r10, -0x8000(r4)
/* 8004033C 0003C2BC  55 8A A3 68 */	rlwinm r10, r12, 20, 13, 20
/* 80040340 0003C2C0  51 8A A5 7E */	rlwimi r10, r12, 20, 21, 31
/* 80040344 0003C2C4  98 04 80 00 */	stb r0, -0x8000(r4)
/* 80040348 0003C2C8  55 89 A3 18 */	rlwinm r9, r12, 20, 12, 12
/* 8004034C 0003C2CC  51 49 03 7E */	rlwimi r9, r10, 0, 13, 31
/* 80040350 0003C2D0  90 E4 80 00 */	stw r7, -0x8000(r4)
/* 80040354 0003C2D4  65 07 F0 00 */	oris r7, r8, 0xf000
/* 80040358 0003C2D8  51 66 06 3E */	rlwimi r6, r11, 0, 24, 31
/* 8004035C 0003C2DC  98 04 80 00 */	stb r0, -0x8000(r4)
/* 80040360 0003C2E0  90 E4 80 00 */	stw r7, -0x8000(r4)
/* 80040364 0003C2E4  57 E7 A8 14 */	slwi r7, r31, 21
/* 80040368 0003C2E8  51 27 03 3E */	rlwimi r7, r9, 0, 12, 31
/* 8004036C 0003C2EC  54 E7 02 3E */	clrlwi r7, r7, 8
/* 80040370 0003C2F0  98 04 80 00 */	stb r0, -0x8000(r4)
/* 80040374 0003C2F4  64 E7 F1 00 */	oris r7, r7, 0xf100
/* 80040378 0003C2F8  90 E4 80 00 */	stw r7, -0x8000(r4)
/* 8004037C 0003C2FC  98 04 80 00 */	stb r0, -0x8000(r4)
/* 80040380 0003C300  54 A0 80 1E */	slwi r0, r5, 16
/* 80040384 0003C304  50 C0 04 3E */	rlwimi r0, r6, 0, 16, 31
/* 80040388 0003C308  54 00 02 3E */	clrlwi r0, r0, 8
/* 8004038C 0003C30C  64 00 F2 00 */	oris r0, r0, 0xf200
/* 80040390 0003C310  90 04 80 00 */	stw r0, -0x8000(r4)
/* 80040394 0003C314  38 00 00 00 */	li r0, 0x0
/* 80040398 0003C318  B0 03 00 02 */	sth r0, 0x2(r3)
/* 8004039C 0003C31C  80 01 00 4C */	lwz r0, 0x4c(r1)
/* 800403A0 0003C320  83 E1 00 44 */	lwz r31, 0x44(r1)
/* 800403A4 0003C324  83 C1 00 40 */	lwz r30, 0x40(r1)
/* 800403A8 0003C328  7C 08 03 A6 */	mtlr r0
/* 800403AC 0003C32C  83 A1 00 3C */	lwz r29, 0x3c(r1)
/* 800403B0 0003C330  38 21 00 48 */	addi r1, r1, 0x48
/* 800403B4 0003C334  4E 80 00 20 */	blr
.endfn GXSetFog

.fn GXSetFogRangeAdj, global
/* 800403B8 0003C338  54 60 06 3F */	clrlwi. r0, r3, 24
/* 800403BC 0003C33C  41 82 00 C0 */	beq .L_8004047C
/* 800403C0 0003C340  A1 05 00 02 */	lhz r8, 0x2(r5)
/* 800403C4 0003C344  38 00 00 61 */	li r0, 0x61
/* 800403C8 0003C348  A1 45 00 00 */	lhz r10, 0x0(r5)
/* 800403CC 0003C34C  3C C0 CC 01 */	lis r6, 0xCC008000@ha
/* 800403D0 0003C350  55 08 60 26 */	slwi r8, r8, 12
/* 800403D4 0003C354  51 48 05 3E */	rlwimi r8, r10, 0, 20, 31
/* 800403D8 0003C358  98 06 80 00 */	stb r0, 0xCC008000@l(r6)
/* 800403DC 0003C35C  38 E0 00 E9 */	li r7, 0xe9
/* 800403E0 0003C360  55 09 02 3E */	clrlwi r9, r8, 8
/* 800403E4 0003C364  50 E9 C0 0E */	rlwimi r9, r7, 24, 0, 7
/* 800403E8 0003C368  91 26 80 00 */	stw r9, -0x8000(r6)
/* 800403EC 0003C36C  38 E0 00 EA */	li r7, 0xea
/* 800403F0 0003C370  54 E9 C0 0E */	slwi r9, r7, 24
/* 800403F4 0003C374  A5 45 00 04 */	lhzu r10, 0x4(r5)
/* 800403F8 0003C378  38 E0 00 EB */	li r7, 0xeb
/* 800403FC 0003C37C  A1 05 00 02 */	lhz r8, 0x2(r5)
/* 80040400 0003C380  55 08 60 26 */	slwi r8, r8, 12
/* 80040404 0003C384  98 06 80 00 */	stb r0, -0x8000(r6)
/* 80040408 0003C388  51 48 05 3E */	rlwimi r8, r10, 0, 20, 31
/* 8004040C 0003C38C  51 09 02 3E */	rlwimi r9, r8, 0, 8, 31
/* 80040410 0003C390  91 26 80 00 */	stw r9, -0x8000(r6)
/* 80040414 0003C394  54 E9 C0 0E */	slwi r9, r7, 24
/* 80040418 0003C398  38 E0 00 EC */	li r7, 0xec
/* 8004041C 0003C39C  A1 05 00 06 */	lhz r8, 0x6(r5)
/* 80040420 0003C3A0  A1 45 00 04 */	lhz r10, 0x4(r5)
/* 80040424 0003C3A4  55 08 60 26 */	slwi r8, r8, 12
/* 80040428 0003C3A8  51 48 05 3E */	rlwimi r8, r10, 0, 20, 31
/* 8004042C 0003C3AC  98 06 80 00 */	stb r0, -0x8000(r6)
/* 80040430 0003C3B0  51 09 02 3E */	rlwimi r9, r8, 0, 8, 31
/* 80040434 0003C3B4  91 26 80 00 */	stw r9, -0x8000(r6)
/* 80040438 0003C3B8  54 E9 C0 0E */	slwi r9, r7, 24
/* 8004043C 0003C3BC  38 E0 00 ED */	li r7, 0xed
/* 80040440 0003C3C0  A1 05 00 0A */	lhz r8, 0xa(r5)
/* 80040444 0003C3C4  A1 45 00 08 */	lhz r10, 0x8(r5)
/* 80040448 0003C3C8  55 08 60 26 */	slwi r8, r8, 12
/* 8004044C 0003C3CC  51 48 05 3E */	rlwimi r8, r10, 0, 20, 31
/* 80040450 0003C3D0  98 06 80 00 */	stb r0, -0x8000(r6)
/* 80040454 0003C3D4  51 09 02 3E */	rlwimi r9, r8, 0, 8, 31
/* 80040458 0003C3D8  91 26 80 00 */	stw r9, -0x8000(r6)
/* 8004045C 0003C3DC  A1 05 00 0E */	lhz r8, 0xe(r5)
/* 80040460 0003C3E0  A1 45 00 0C */	lhz r10, 0xc(r5)
/* 80040464 0003C3E4  55 08 60 26 */	slwi r8, r8, 12
/* 80040468 0003C3E8  51 48 05 3E */	rlwimi r8, r10, 0, 20, 31
/* 8004046C 0003C3EC  98 06 80 00 */	stb r0, -0x8000(r6)
/* 80040470 0003C3F0  55 09 02 3E */	clrlwi r9, r8, 8
/* 80040474 0003C3F4  50 E9 C0 0E */	rlwimi r9, r7, 24, 0, 7
/* 80040478 0003C3F8  91 26 80 00 */	stw r9, -0x8000(r6)
.L_8004047C:
/* 8004047C 0003C3FC  54 85 04 3E */	clrlwi r5, r4, 16
/* 80040480 0003C400  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040484 0003C404  38 05 01 56 */	addi r0, r5, 0x156
/* 80040488 0003C408  54 05 05 A8 */	rlwinm r5, r0, 0, 22, 20
/* 8004048C 0003C40C  54 60 53 AA */	clrlslwi r0, r3, 24, 10
/* 80040490 0003C410  7C A0 03 78 */	or r0, r5, r0
/* 80040494 0003C414  54 05 02 3E */	clrlwi r5, r0, 8
/* 80040498 0003C418  38 00 00 61 */	li r0, 0x61
/* 8004049C 0003C41C  3C 60 CC 01 */	lis r3, 0xCC008000@ha
/* 800404A0 0003C420  98 03 80 00 */	stb r0, 0xCC008000@l(r3)
/* 800404A4 0003C424  64 A5 E8 00 */	oris r5, r5, 0xe800
/* 800404A8 0003C428  38 00 00 00 */	li r0, 0x0
/* 800404AC 0003C42C  90 A3 80 00 */	stw r5, -0x8000(r3)
/* 800404B0 0003C430  B0 04 00 02 */	sth r0, 0x2(r4)
/* 800404B4 0003C434  4E 80 00 20 */	blr
.endfn GXSetFogRangeAdj

.fn GXSetBlendMode, global
/* 800404B8 0003C438  2C 03 00 01 */	cmpwi r3, 0x1
/* 800404BC 0003C43C  39 20 00 01 */	li r9, 0x1
/* 800404C0 0003C440  41 82 00 10 */	beq .L_800404D0
/* 800404C4 0003C444  2C 03 00 03 */	cmpwi r3, 0x3
/* 800404C8 0003C448  41 82 00 08 */	beq .L_800404D0
/* 800404CC 0003C44C  39 20 00 00 */	li r9, 0x0
.L_800404D0:
/* 800404D0 0003C450  81 0D 82 90 */	lwz r8, gx@sda21(r13)
/* 800404D4 0003C454  20 03 00 03 */	subfic r0, r3, 0x3
/* 800404D8 0003C458  7C 07 00 34 */	cntlzw r7, r0
/* 800404DC 0003C45C  39 48 01 D0 */	addi r10, r8, 0x1d0
/* 800404E0 0003C460  81 08 01 D0 */	lwz r8, 0x1d0(r8)
/* 800404E4 0003C464  20 03 00 02 */	subfic r0, r3, 0x2
/* 800404E8 0003C468  55 03 00 3C */	clrrwi r3, r8, 1
/* 800404EC 0003C46C  7C 63 4B 78 */	or r3, r3, r9
/* 800404F0 0003C470  90 6A 00 00 */	stw r3, 0x0(r10)
/* 800404F4 0003C474  7C 00 00 34 */	cntlzw r0, r0
/* 800404F8 0003C478  54 E3 30 28 */	extlwi r3, r7, 21, 6
/* 800404FC 0003C47C  81 2D 82 90 */	lwz r9, gx@sda21(r13)
/* 80040500 0003C480  54 08 E1 3C */	rlwinm r8, r0, 28, 4, 30
/* 80040504 0003C484  84 09 01 D0 */	lwzu r0, 0x1d0(r9)
/* 80040508 0003C488  54 C7 60 26 */	slwi r7, r6, 12
/* 8004050C 0003C48C  54 86 40 2E */	slwi r6, r4, 8
/* 80040510 0003C490  54 00 05 66 */	rlwinm r0, r0, 0, 21, 19
/* 80040514 0003C494  7C 00 1B 78 */	or r0, r0, r3
/* 80040518 0003C498  90 09 00 00 */	stw r0, 0x0(r9)
/* 8004051C 0003C49C  54 A4 28 34 */	slwi r4, r5, 5
/* 80040520 0003C4A0  38 60 00 61 */	li r3, 0x61
/* 80040524 0003C4A4  81 2D 82 90 */	lwz r9, gx@sda21(r13)
/* 80040528 0003C4A8  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 8004052C 0003C4AC  38 00 00 00 */	li r0, 0x0
/* 80040530 0003C4B0  39 49 01 D0 */	addi r10, r9, 0x1d0
/* 80040534 0003C4B4  81 29 01 D0 */	lwz r9, 0x1d0(r9)
/* 80040538 0003C4B8  55 29 07 FA */	rlwinm r9, r9, 0, 31, 29
/* 8004053C 0003C4BC  7D 28 43 78 */	or r8, r9, r8
/* 80040540 0003C4C0  91 0A 00 00 */	stw r8, 0x0(r10)
/* 80040544 0003C4C4  81 0D 82 90 */	lwz r8, gx@sda21(r13)
/* 80040548 0003C4C8  39 28 01 D0 */	addi r9, r8, 0x1d0
/* 8004054C 0003C4CC  81 08 01 D0 */	lwz r8, 0x1d0(r8)
/* 80040550 0003C4D0  55 08 05 1E */	rlwinm r8, r8, 0, 20, 15
/* 80040554 0003C4D4  7D 07 3B 78 */	or r7, r8, r7
/* 80040558 0003C4D8  90 E9 00 00 */	stw r7, 0x0(r9)
/* 8004055C 0003C4DC  80 ED 82 90 */	lwz r7, gx@sda21(r13)
/* 80040560 0003C4E0  39 07 01 D0 */	addi r8, r7, 0x1d0
/* 80040564 0003C4E4  80 E7 01 D0 */	lwz r7, 0x1d0(r7)
/* 80040568 0003C4E8  54 E7 06 28 */	rlwinm r7, r7, 0, 24, 20
/* 8004056C 0003C4EC  7C E6 33 78 */	or r6, r7, r6
/* 80040570 0003C4F0  90 C8 00 00 */	stw r6, 0x0(r8)
/* 80040574 0003C4F4  80 CD 82 90 */	lwz r6, gx@sda21(r13)
/* 80040578 0003C4F8  38 E6 01 D0 */	addi r7, r6, 0x1d0
/* 8004057C 0003C4FC  80 C6 01 D0 */	lwz r6, 0x1d0(r6)
/* 80040580 0003C500  54 C6 06 EE */	rlwinm r6, r6, 0, 27, 23
/* 80040584 0003C504  7C C4 23 78 */	or r4, r6, r4
/* 80040588 0003C508  90 87 00 00 */	stw r4, 0x0(r7)
/* 8004058C 0003C50C  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040590 0003C510  38 C4 01 D0 */	addi r6, r4, 0x1d0
/* 80040594 0003C514  80 84 01 D0 */	lwz r4, 0x1d0(r4)
/* 80040598 0003C518  54 84 02 3E */	clrlwi r4, r4, 8
/* 8004059C 0003C51C  64 84 41 00 */	oris r4, r4, 0x4100
/* 800405A0 0003C520  90 86 00 00 */	stw r4, 0x0(r6)
/* 800405A4 0003C524  98 65 80 00 */	stb r3, 0xCC008000@l(r5)
/* 800405A8 0003C528  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 800405AC 0003C52C  80 64 01 D0 */	lwz r3, 0x1d0(r4)
/* 800405B0 0003C530  90 65 80 00 */	stw r3, -0x8000(r5)
/* 800405B4 0003C534  B0 04 00 02 */	sth r0, 0x2(r4)
/* 800405B8 0003C538  4E 80 00 20 */	blr
.endfn GXSetBlendMode

.fn GXSetColorUpdate, global
/* 800405BC 0003C53C  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 800405C0 0003C540  54 60 1D 78 */	clrlslwi r0, r3, 24, 3
/* 800405C4 0003C544  38 60 00 61 */	li r3, 0x61
/* 800405C8 0003C548  38 C4 01 D0 */	addi r6, r4, 0x1d0
/* 800405CC 0003C54C  80 84 01 D0 */	lwz r4, 0x1d0(r4)
/* 800405D0 0003C550  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800405D4 0003C554  54 84 07 76 */	rlwinm r4, r4, 0, 29, 27
/* 800405D8 0003C558  7C 80 03 78 */	or r0, r4, r0
/* 800405DC 0003C55C  90 06 00 00 */	stw r0, 0x0(r6)
/* 800405E0 0003C560  38 00 00 00 */	li r0, 0x0
/* 800405E4 0003C564  98 65 80 00 */	stb r3, 0xCC008000@l(r5)
/* 800405E8 0003C568  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 800405EC 0003C56C  80 64 01 D0 */	lwz r3, 0x1d0(r4)
/* 800405F0 0003C570  90 65 80 00 */	stw r3, -0x8000(r5)
/* 800405F4 0003C574  B0 04 00 02 */	sth r0, 0x2(r4)
/* 800405F8 0003C578  4E 80 00 20 */	blr
.endfn GXSetColorUpdate

.fn GXSetAlphaUpdate, global
/* 800405FC 0003C57C  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040600 0003C580  54 60 25 36 */	clrlslwi r0, r3, 24, 4
/* 80040604 0003C584  38 60 00 61 */	li r3, 0x61
/* 80040608 0003C588  38 C4 01 D0 */	addi r6, r4, 0x1d0
/* 8004060C 0003C58C  80 84 01 D0 */	lwz r4, 0x1d0(r4)
/* 80040610 0003C590  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 80040614 0003C594  54 84 07 34 */	rlwinm r4, r4, 0, 28, 26
/* 80040618 0003C598  7C 80 03 78 */	or r0, r4, r0
/* 8004061C 0003C59C  90 06 00 00 */	stw r0, 0x0(r6)
/* 80040620 0003C5A0  38 00 00 00 */	li r0, 0x0
/* 80040624 0003C5A4  98 65 80 00 */	stb r3, 0xCC008000@l(r5)
/* 80040628 0003C5A8  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8004062C 0003C5AC  80 64 01 D0 */	lwz r3, 0x1d0(r4)
/* 80040630 0003C5B0  90 65 80 00 */	stw r3, -0x8000(r5)
/* 80040634 0003C5B4  B0 04 00 02 */	sth r0, 0x2(r4)
/* 80040638 0003C5B8  4E 80 00 20 */	blr
.endfn GXSetAlphaUpdate

.fn GXSetZMode, global
/* 8004063C 0003C5BC  80 CD 82 90 */	lwz r6, gx@sda21(r13)
/* 80040640 0003C5C0  54 60 06 3E */	clrlwi r0, r3, 24
/* 80040644 0003C5C4  80 66 01 D8 */	lwz r3, 0x1d8(r6)
/* 80040648 0003C5C8  38 E6 01 D8 */	addi r7, r6, 0x1d8
/* 8004064C 0003C5CC  54 86 08 3C */	slwi r6, r4, 1
/* 80040650 0003C5D0  54 63 00 3C */	clrrwi r3, r3, 1
/* 80040654 0003C5D4  7C 60 03 78 */	or r0, r3, r0
/* 80040658 0003C5D8  90 07 00 00 */	stw r0, 0x0(r7)
/* 8004065C 0003C5DC  54 A4 25 36 */	clrlslwi r4, r5, 24, 4
/* 80040660 0003C5E0  38 60 00 61 */	li r3, 0x61
/* 80040664 0003C5E4  80 ED 82 90 */	lwz r7, gx@sda21(r13)
/* 80040668 0003C5E8  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 8004066C 0003C5EC  38 00 00 00 */	li r0, 0x0
/* 80040670 0003C5F0  39 07 01 D8 */	addi r8, r7, 0x1d8
/* 80040674 0003C5F4  80 E7 01 D8 */	lwz r7, 0x1d8(r7)
/* 80040678 0003C5F8  54 E7 07 F6 */	rlwinm r7, r7, 0, 31, 27
/* 8004067C 0003C5FC  7C E6 33 78 */	or r6, r7, r6
/* 80040680 0003C600  90 C8 00 00 */	stw r6, 0x0(r8)
/* 80040684 0003C604  80 CD 82 90 */	lwz r6, gx@sda21(r13)
/* 80040688 0003C608  38 E6 01 D8 */	addi r7, r6, 0x1d8
/* 8004068C 0003C60C  80 C6 01 D8 */	lwz r6, 0x1d8(r6)
/* 80040690 0003C610  54 C6 07 34 */	rlwinm r6, r6, 0, 28, 26
/* 80040694 0003C614  7C C4 23 78 */	or r4, r6, r4
/* 80040698 0003C618  90 87 00 00 */	stw r4, 0x0(r7)
/* 8004069C 0003C61C  98 65 80 00 */	stb r3, 0xCC008000@l(r5)
/* 800406A0 0003C620  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 800406A4 0003C624  80 64 01 D8 */	lwz r3, 0x1d8(r4)
/* 800406A8 0003C628  90 65 80 00 */	stw r3, -0x8000(r5)
/* 800406AC 0003C62C  B0 04 00 02 */	sth r0, 0x2(r4)
/* 800406B0 0003C630  4E 80 00 20 */	blr
.endfn GXSetZMode

.fn GXSetZCompLoc, global
/* 800406B4 0003C634  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 800406B8 0003C638  54 60 34 B2 */	clrlslwi r0, r3, 24, 6
/* 800406BC 0003C63C  38 60 00 61 */	li r3, 0x61
/* 800406C0 0003C640  38 C4 01 DC */	addi r6, r4, 0x1dc
/* 800406C4 0003C644  80 84 01 DC */	lwz r4, 0x1dc(r4)
/* 800406C8 0003C648  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800406CC 0003C64C  54 84 06 B0 */	rlwinm r4, r4, 0, 26, 24
/* 800406D0 0003C650  7C 80 03 78 */	or r0, r4, r0
/* 800406D4 0003C654  90 06 00 00 */	stw r0, 0x0(r6)
/* 800406D8 0003C658  38 00 00 00 */	li r0, 0x0
/* 800406DC 0003C65C  98 65 80 00 */	stb r3, 0xCC008000@l(r5)
/* 800406E0 0003C660  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 800406E4 0003C664  80 64 01 DC */	lwz r3, 0x1dc(r4)
/* 800406E8 0003C668  90 65 80 00 */	stw r3, -0x8000(r5)
/* 800406EC 0003C66C  B0 04 00 02 */	sth r0, 0x2(r4)
/* 800406F0 0003C670  4E 80 00 20 */	blr
.endfn GXSetZCompLoc

.fn GXSetPixelFmt, global
/* 800406F4 0003C674  80 ED 82 90 */	lwz r7, gx@sda21(r13)
/* 800406F8 0003C678  3C A0 80 07 */	lis r5, "p2f$194"@ha
/* 800406FC 0003C67C  54 66 10 3A */	slwi r6, r3, 2
/* 80040700 0003C680  39 07 01 DC */	addi r8, r7, 0x1dc
/* 80040704 0003C684  38 05 8F 30 */	addi r0, r5, "p2f$194"@l
/* 80040708 0003C688  80 E7 01 DC */	lwz r7, 0x1dc(r7)
/* 8004070C 0003C68C  7D 20 32 14 */	add r9, r0, r6
/* 80040710 0003C690  80 A9 00 00 */	lwz r5, 0x0(r9)
/* 80040714 0003C694  54 E6 00 38 */	clrrwi r6, r7, 3
/* 80040718 0003C698  54 80 18 38 */	slwi r0, r4, 3
/* 8004071C 0003C69C  7C C4 2B 78 */	or r4, r6, r5
/* 80040720 0003C6A0  90 88 00 00 */	stw r4, 0x0(r8)
/* 80040724 0003C6A4  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040728 0003C6A8  38 A4 01 DC */	addi r5, r4, 0x1dc
/* 8004072C 0003C6AC  80 84 01 DC */	lwz r4, 0x1dc(r4)
/* 80040730 0003C6B0  54 84 07 72 */	rlwinm r4, r4, 0, 29, 25
/* 80040734 0003C6B4  7C 80 03 78 */	or r0, r4, r0
/* 80040738 0003C6B8  90 05 00 00 */	stw r0, 0x0(r5)
/* 8004073C 0003C6BC  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040740 0003C6C0  80 A4 01 DC */	lwz r5, 0x1dc(r4)
/* 80040744 0003C6C4  7C 07 28 40 */	cmplw r7, r5
/* 80040748 0003C6C8  41 82 00 54 */	beq .L_8004079C
/* 8004074C 0003C6CC  38 00 00 61 */	li r0, 0x61
/* 80040750 0003C6D0  3C 80 CC 01 */	lis r4, 0xCC008000@ha
/* 80040754 0003C6D4  98 04 80 00 */	stb r0, 0xCC008000@l(r4)
/* 80040758 0003C6D8  2C 03 00 02 */	cmpwi r3, 0x2
/* 8004075C 0003C6DC  90 A4 80 00 */	stw r5, -0x8000(r4)
/* 80040760 0003C6E0  40 82 00 0C */	bne .L_8004076C
/* 80040764 0003C6E4  38 00 00 01 */	li r0, 0x1
/* 80040768 0003C6E8  48 00 00 08 */	b .L_80040770
.L_8004076C:
/* 8004076C 0003C6EC  38 00 00 00 */	li r0, 0x0
.L_80040770:
/* 80040770 0003C6F0  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040774 0003C6F4  54 00 4B EC */	clrlslwi r0, r0, 24, 9
/* 80040778 0003C6F8  38 A4 02 04 */	addi r5, r4, 0x204
/* 8004077C 0003C6FC  80 84 02 04 */	lwz r4, 0x204(r4)
/* 80040780 0003C700  54 84 05 EA */	rlwinm r4, r4, 0, 23, 21
/* 80040784 0003C704  7C 80 03 78 */	or r0, r4, r0
/* 80040788 0003C708  90 05 00 00 */	stw r0, 0x0(r5)
/* 8004078C 0003C70C  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040790 0003C710  80 04 04 F0 */	lwz r0, 0x4f0(r4)
/* 80040794 0003C714  60 00 00 04 */	ori r0, r0, 0x4
/* 80040798 0003C718  90 04 04 F0 */	stw r0, 0x4f0(r4)
.L_8004079C:
/* 8004079C 0003C71C  80 09 00 00 */	lwz r0, 0x0(r9)
/* 800407A0 0003C720  28 00 00 04 */	cmplwi r0, 0x4
/* 800407A4 0003C724  40 82 00 50 */	bne .L_800407F4
/* 800407A8 0003C728  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 800407AC 0003C72C  38 63 FF FC */	addi r3, r3, -0x4
/* 800407B0 0003C730  38 00 00 61 */	li r0, 0x61
/* 800407B4 0003C734  38 A4 01 D4 */	addi r5, r4, 0x1d4
/* 800407B8 0003C738  80 84 01 D4 */	lwz r4, 0x1d4(r4)
/* 800407BC 0003C73C  54 84 05 E8 */	rlwinm r4, r4, 0, 23, 20
/* 800407C0 0003C740  50 64 4D 6C */	rlwimi r4, r3, 9, 21, 22
/* 800407C4 0003C744  90 85 00 00 */	stw r4, 0x0(r5)
/* 800407C8 0003C748  3C 80 CC 01 */	lis r4, 0xCC008000@ha
/* 800407CC 0003C74C  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 800407D0 0003C750  38 A3 01 D4 */	addi r5, r3, 0x1d4
/* 800407D4 0003C754  80 63 01 D4 */	lwz r3, 0x1d4(r3)
/* 800407D8 0003C758  54 63 02 3E */	clrlwi r3, r3, 8
/* 800407DC 0003C75C  64 63 42 00 */	oris r3, r3, 0x4200
/* 800407E0 0003C760  90 65 00 00 */	stw r3, 0x0(r5)
/* 800407E4 0003C764  98 04 80 00 */	stb r0, 0xCC008000@l(r4)
/* 800407E8 0003C768  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 800407EC 0003C76C  80 03 01 D4 */	lwz r0, 0x1d4(r3)
/* 800407F0 0003C770  90 04 80 00 */	stw r0, -0x8000(r4)
.L_800407F4:
/* 800407F4 0003C774  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 800407F8 0003C778  38 00 00 00 */	li r0, 0x0
/* 800407FC 0003C77C  B0 03 00 02 */	sth r0, 0x2(r3)
/* 80040800 0003C780  4E 80 00 20 */	blr
.endfn GXSetPixelFmt

.fn GXSetDither, global
/* 80040804 0003C784  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040808 0003C788  54 60 15 BA */	clrlslwi r0, r3, 24, 2
/* 8004080C 0003C78C  38 60 00 61 */	li r3, 0x61
/* 80040810 0003C790  38 C4 01 D0 */	addi r6, r4, 0x1d0
/* 80040814 0003C794  80 84 01 D0 */	lwz r4, 0x1d0(r4)
/* 80040818 0003C798  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 8004081C 0003C79C  54 84 07 B8 */	rlwinm r4, r4, 0, 30, 28
/* 80040820 0003C7A0  7C 80 03 78 */	or r0, r4, r0
/* 80040824 0003C7A4  90 06 00 00 */	stw r0, 0x0(r6)
/* 80040828 0003C7A8  38 00 00 00 */	li r0, 0x0
/* 8004082C 0003C7AC  98 65 80 00 */	stb r3, 0xCC008000@l(r5)
/* 80040830 0003C7B0  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040834 0003C7B4  80 64 01 D0 */	lwz r3, 0x1d0(r4)
/* 80040838 0003C7B8  90 65 80 00 */	stw r3, -0x8000(r5)
/* 8004083C 0003C7BC  B0 04 00 02 */	sth r0, 0x2(r4)
/* 80040840 0003C7C0  4E 80 00 20 */	blr
.endfn GXSetDither

.fn GXSetDstAlpha, global
/* 80040844 0003C7C4  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 80040848 0003C7C8  54 66 44 2E */	clrlslwi r6, r3, 24, 8
/* 8004084C 0003C7CC  84 05 01 D4 */	lwzu r0, 0x1d4(r5)
/* 80040850 0003C7D0  38 60 00 61 */	li r3, 0x61
/* 80040854 0003C7D4  54 00 00 2E */	clrrwi r0, r0, 8
/* 80040858 0003C7D8  50 80 06 3E */	rlwimi r0, r4, 0, 24, 31
/* 8004085C 0003C7DC  90 05 00 00 */	stw r0, 0x0(r5)
/* 80040860 0003C7E0  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 80040864 0003C7E4  38 00 00 00 */	li r0, 0x0
/* 80040868 0003C7E8  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8004086C 0003C7EC  38 E4 01 D4 */	addi r7, r4, 0x1d4
/* 80040870 0003C7F0  80 84 01 D4 */	lwz r4, 0x1d4(r4)
/* 80040874 0003C7F4  54 84 06 2C */	rlwinm r4, r4, 0, 24, 22
/* 80040878 0003C7F8  7C 84 33 78 */	or r4, r4, r6
/* 8004087C 0003C7FC  90 87 00 00 */	stw r4, 0x0(r7)
/* 80040880 0003C800  98 65 80 00 */	stb r3, 0xCC008000@l(r5)
/* 80040884 0003C804  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 80040888 0003C808  80 64 01 D4 */	lwz r3, 0x1d4(r4)
/* 8004088C 0003C80C  90 65 80 00 */	stw r3, -0x8000(r5)
/* 80040890 0003C810  B0 04 00 02 */	sth r0, 0x2(r4)
/* 80040894 0003C814  4E 80 00 20 */	blr
.endfn GXSetDstAlpha

.fn GXSetFieldMask, global
/* 80040898 0003C818  54 80 06 3E */	clrlwi r0, r4, 24
/* 8004089C 0003C81C  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 800408A0 0003C820  54 05 07 FA */	rlwinm r5, r0, 0, 31, 29
/* 800408A4 0003C824  54 60 0D FC */	clrlslwi r0, r3, 24, 1
/* 800408A8 0003C828  7C A0 03 78 */	or r0, r5, r0
/* 800408AC 0003C82C  54 05 02 3E */	clrlwi r5, r0, 8
/* 800408B0 0003C830  38 00 00 61 */	li r0, 0x61
/* 800408B4 0003C834  3C 60 CC 01 */	lis r3, 0xCC008000@ha
/* 800408B8 0003C838  98 03 80 00 */	stb r0, 0xCC008000@l(r3)
/* 800408BC 0003C83C  64 A5 44 00 */	oris r5, r5, 0x4400
/* 800408C0 0003C840  38 00 00 00 */	li r0, 0x0
/* 800408C4 0003C844  90 A3 80 00 */	stw r5, -0x8000(r3)
/* 800408C8 0003C848  B0 04 00 02 */	sth r0, 0x2(r4)
/* 800408CC 0003C84C  4E 80 00 20 */	blr
.endfn GXSetFieldMask

.fn GXSetFieldMode, global
/* 800408D0 0003C850  7C 08 02 A6 */	mflr r0
/* 800408D4 0003C854  90 01 00 04 */	stw r0, 0x4(r1)
/* 800408D8 0003C858  54 80 B0 92 */	clrlslwi r0, r4, 24, 22
/* 800408DC 0003C85C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800408E0 0003C860  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800408E4 0003C864  3F E0 CC 01 */	lis r31, 0xCC008000@ha
/* 800408E8 0003C868  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800408EC 0003C86C  3B C0 00 61 */	li r30, 0x61
/* 800408F0 0003C870  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800408F4 0003C874  7C 7D 1B 78 */	mr r29, r3
/* 800408F8 0003C878  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 800408FC 0003C87C  84 85 00 7C */	lwzu r4, 0x7c(r5)
/* 80040900 0003C880  54 84 02 90 */	rlwinm r4, r4, 0, 10, 8
/* 80040904 0003C884  7C 80 03 78 */	or r0, r4, r0
/* 80040908 0003C888  90 05 00 00 */	stw r0, 0x0(r5)
/* 8004090C 0003C88C  9B DF 80 00 */	stb r30, 0xCC008000@l(r31)
/* 80040910 0003C890  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 80040914 0003C894  80 03 00 7C */	lwz r0, 0x7c(r3)
/* 80040918 0003C898  90 1F 80 00 */	stw r0, -0x8000(r31)
/* 8004091C 0003C89C  4B FF EF B5 */	bl __GXFlushTextureState
/* 80040920 0003C8A0  57 A0 06 3E */	clrlwi r0, r29, 24
/* 80040924 0003C8A4  9B DF 80 00 */	stb r30, -0x8000(r31)
/* 80040928 0003C8A8  64 00 68 00 */	oris r0, r0, 0x6800
/* 8004092C 0003C8AC  90 1F 80 00 */	stw r0, -0x8000(r31)
/* 80040930 0003C8B0  4B FF EF A1 */	bl __GXFlushTextureState
/* 80040934 0003C8B4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80040938 0003C8B8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8004093C 0003C8BC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80040940 0003C8C0  7C 08 03 A6 */	mtlr r0
/* 80040944 0003C8C4  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80040948 0003C8C8  38 21 00 20 */	addi r1, r1, 0x20
/* 8004094C 0003C8CC  4E 80 00 20 */	blr
.endfn GXSetFieldMode

.section .data, "wa"  # 0x80065000 - 0x8006D1C0

.balign 8

.obj "p2f$194", local
	.4byte 0
	.4byte 0x00000001
	.4byte 0x00000002
	.4byte 0x00000003
	.4byte 0x00000004
	.4byte 0x00000004
	.4byte 0x00000004
	.4byte 0x00000005
.endobj "p2f$194"

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0

.balign 8

.obj float_800A9910, local
	.4byte 0
.endobj float_800A9910

.obj float_800A9914, local
	.4byte 0x3F000000
.endobj float_800A9914

.obj lbl_800A9918, local
	.8byte 0x3FF0000000000000
.endobj lbl_800A9918

.obj float_800A9920, local
	.4byte 0x40000000
.endobj float_800A9920

.4byte 0

.obj lbl_800A9928, local
	.8byte 0x3FE0000000000000
.endobj lbl_800A9928

.obj float_800A9930, local
	.4byte 0x4B00001E
.endobj float_800A9930

.4byte 0

.obj lbl_800A9938, local
	.8byte 0x4330000080000000
.endobj lbl_800A9938
