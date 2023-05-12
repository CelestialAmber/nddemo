.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn GXSetTevIndirect, global
/* 8003F244 0003B1C4  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 8003F248 0003B1C8  54 84 07 B6 */	rlwinm r4, r4, 0, 30, 27
/* 8003F24C 0003B1CC  54 A0 10 3A */	slwi r0, r5, 2
/* 8003F250 0003B1D0  7C 80 03 78 */	or r0, r4, r0
/* 8003F254 0003B1D4  81 61 00 34 */	lwz r11, 0x34(r1)
/* 8003F258 0003B1D8  54 05 07 30 */	rlwinm r5, r0, 0, 28, 24
/* 8003F25C 0003B1DC  89 81 00 33 */	lbz r12, 0x33(r1)
/* 8003F260 0003B1E0  54 C0 20 36 */	slwi r0, r6, 4
/* 8003F264 0003B1E4  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003F268 0003B1E8  7C A0 03 78 */	or r0, r5, r0
/* 8003F26C 0003B1EC  54 05 06 6C */	rlwinm r5, r0, 0, 25, 22
/* 8003F270 0003B1F0  55 60 38 30 */	slwi r0, r11, 7
/* 8003F274 0003B1F4  7C A0 03 78 */	or r0, r5, r0
/* 8003F278 0003B1F8  54 05 05 E4 */	rlwinm r5, r0, 0, 23, 18
/* 8003F27C 0003B1FC  54 E0 48 2C */	slwi r0, r7, 9
/* 8003F280 0003B200  7C A0 03 78 */	or r0, r5, r0
/* 8003F284 0003B204  54 05 04 DE */	rlwinm r5, r0, 0, 19, 15
/* 8003F288 0003B208  55 00 68 24 */	slwi r0, r8, 13
/* 8003F28C 0003B20C  7C A0 03 78 */	or r0, r5, r0
/* 8003F290 0003B210  38 A3 00 10 */	addi r5, r3, 0x10
/* 8003F294 0003B214  54 03 04 18 */	rlwinm r3, r0, 0, 16, 12
/* 8003F298 0003B218  55 20 80 1E */	slwi r0, r9, 16
/* 8003F29C 0003B21C  7C 60 03 78 */	or r0, r3, r0
/* 8003F2A0 0003B220  54 03 03 56 */	rlwinm r3, r0, 0, 13, 11
/* 8003F2A4 0003B224  55 80 98 18 */	slwi r0, r12, 19
/* 8003F2A8 0003B228  7C 60 03 78 */	or r0, r3, r0
/* 8003F2AC 0003B22C  54 03 03 14 */	rlwinm r3, r0, 0, 12, 10
/* 8003F2B0 0003B230  55 40 A1 16 */	clrlslwi r0, r10, 24, 20
/* 8003F2B4 0003B234  7C 66 03 78 */	or r6, r3, r0
/* 8003F2B8 0003B238  38 00 00 61 */	li r0, 0x61
/* 8003F2BC 0003B23C  3C 60 CC 01 */	lis r3, 0xCC008000@ha
/* 8003F2C0 0003B240  98 03 80 00 */	stb r0, 0xCC008000@l(r3)
/* 8003F2C4 0003B244  54 A0 C0 0E */	slwi r0, r5, 24
/* 8003F2C8 0003B248  50 C0 02 3E */	rlwimi r0, r6, 0, 8, 31
/* 8003F2CC 0003B24C  90 03 80 00 */	stw r0, -0x8000(r3)
/* 8003F2D0 0003B250  38 00 00 00 */	li r0, 0x0
/* 8003F2D4 0003B254  38 21 00 28 */	addi r1, r1, 0x28
/* 8003F2D8 0003B258  B0 04 00 02 */	sth r0, 0x2(r4)
/* 8003F2DC 0003B25C  4E 80 00 20 */	blr
.endfn GXSetTevIndirect

.fn GXSetIndTexMtx, global
/* 8003F2E0 0003B260  2C 03 00 08 */	cmpwi r3, 0x8
/* 8003F2E4 0003B264  94 21 FF 88 */	stwu r1, -0x78(r1)
/* 8003F2E8 0003B268  41 82 00 44 */	beq .L_8003F32C
/* 8003F2EC 0003B26C  40 80 00 1C */	bge .L_8003F308
/* 8003F2F0 0003B270  2C 03 00 04 */	cmpwi r3, 0x4
/* 8003F2F4 0003B274  41 82 00 38 */	beq .L_8003F32C
/* 8003F2F8 0003B278  40 80 00 24 */	bge .L_8003F31C
/* 8003F2FC 0003B27C  2C 03 00 01 */	cmpwi r3, 0x1
/* 8003F300 0003B280  40 80 00 14 */	bge .L_8003F314
/* 8003F304 0003B284  48 00 00 28 */	b .L_8003F32C
.L_8003F308:
/* 8003F308 0003B288  2C 03 00 0C */	cmpwi r3, 0xc
/* 8003F30C 0003B28C  40 80 00 20 */	bge .L_8003F32C
/* 8003F310 0003B290  48 00 00 14 */	b .L_8003F324
.L_8003F314:
/* 8003F314 0003B294  38 03 FF FF */	addi r0, r3, -0x1
/* 8003F318 0003B298  48 00 00 18 */	b .L_8003F330
.L_8003F31C:
/* 8003F31C 0003B29C  38 03 FF FB */	addi r0, r3, -0x5
/* 8003F320 0003B2A0  48 00 00 10 */	b .L_8003F330
.L_8003F324:
/* 8003F324 0003B2A4  38 03 FF F7 */	addi r0, r3, -0x9
/* 8003F328 0003B2A8  48 00 00 08 */	b .L_8003F330
.L_8003F32C:
/* 8003F32C 0003B2AC  38 00 00 00 */	li r0, 0x0
.L_8003F330:
/* 8003F330 0003B2B0  C0 42 85 88 */	lfs f2, float_800A9908@sda21(r2)
/* 8003F334 0003B2B4  1C 60 00 03 */	mulli r3, r0, 0x3
/* 8003F338 0003B2B8  C0 24 00 00 */	lfs f1, 0x0(r4)
/* 8003F33C 0003B2BC  C0 04 00 0C */	lfs f0, 0xc(r4)
/* 8003F340 0003B2C0  EC 22 00 72 */	fmuls f1, f2, f1
/* 8003F344 0003B2C4  39 65 00 11 */	addi r11, r5, 0x11
/* 8003F348 0003B2C8  EC 02 00 32 */	fmuls f0, f2, f0
/* 8003F34C 0003B2CC  38 03 00 06 */	addi r0, r3, 0x6
/* 8003F350 0003B2D0  7D 6B 07 74 */	extsb r11, r11
/* 8003F354 0003B2D4  FC 20 08 1E */	fctiwz f1, f1
/* 8003F358 0003B2D8  39 40 00 61 */	li r10, 0x61
/* 8003F35C 0003B2DC  FC 00 00 1E */	fctiwz f0, f0
/* 8003F360 0003B2E0  3D 20 CC 01 */	lis r9, 0xCC008000@ha
/* 8003F364 0003B2E4  99 49 80 00 */	stb r10, 0xCC008000@l(r9)
/* 8003F368 0003B2E8  D8 21 00 70 */	stfd f1, 0x70(r1)
/* 8003F36C 0003B2EC  54 00 C0 0E */	slwi r0, r0, 24
/* 8003F370 0003B2F0  38 C3 00 07 */	addi r6, r3, 0x7
/* 8003F374 0003B2F4  D8 01 00 68 */	stfd f0, 0x68(r1)
/* 8003F378 0003B2F8  38 A3 00 08 */	addi r5, r3, 0x8
/* 8003F37C 0003B2FC  81 01 00 74 */	lwz r8, 0x74(r1)
/* 8003F380 0003B300  80 E1 00 6C */	lwz r7, 0x6c(r1)
/* 8003F384 0003B304  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F388 0003B308  54 E7 5A A8 */	clrlslwi r7, r7, 21, 11
/* 8003F38C 0003B30C  51 07 05 7E */	rlwimi r7, r8, 0, 21, 31
/* 8003F390 0003B310  54 E7 02 8E */	rlwinm r7, r7, 0, 10, 7
/* 8003F394 0003B314  51 67 B2 12 */	rlwimi r7, r11, 22, 8, 9
/* 8003F398 0003B318  50 E0 02 3E */	rlwimi r0, r7, 0, 8, 31
/* 8003F39C 0003B31C  90 09 80 00 */	stw r0, -0x8000(r9)
/* 8003F3A0 0003B320  38 00 00 00 */	li r0, 0x0
/* 8003F3A4 0003B324  C0 24 00 04 */	lfs f1, 0x4(r4)
/* 8003F3A8 0003B328  C0 04 00 10 */	lfs f0, 0x10(r4)
/* 8003F3AC 0003B32C  EC 22 00 72 */	fmuls f1, f2, f1
/* 8003F3B0 0003B330  EC 02 00 32 */	fmuls f0, f2, f0
/* 8003F3B4 0003B334  99 49 80 00 */	stb r10, -0x8000(r9)
/* 8003F3B8 0003B338  FC 20 08 1E */	fctiwz f1, f1
/* 8003F3BC 0003B33C  FC 00 00 1E */	fctiwz f0, f0
/* 8003F3C0 0003B340  D8 21 00 60 */	stfd f1, 0x60(r1)
/* 8003F3C4 0003B344  D8 01 00 58 */	stfd f0, 0x58(r1)
/* 8003F3C8 0003B348  81 01 00 64 */	lwz r8, 0x64(r1)
/* 8003F3CC 0003B34C  80 E1 00 5C */	lwz r7, 0x5c(r1)
/* 8003F3D0 0003B350  54 E7 5A A8 */	clrlslwi r7, r7, 21, 11
/* 8003F3D4 0003B354  51 07 05 7E */	rlwimi r7, r8, 0, 21, 31
/* 8003F3D8 0003B358  54 E7 02 8E */	rlwinm r7, r7, 0, 10, 7
/* 8003F3DC 0003B35C  51 67 A2 12 */	rlwimi r7, r11, 20, 8, 9
/* 8003F3E0 0003B360  54 E7 02 3E */	clrlwi r7, r7, 8
/* 8003F3E4 0003B364  50 C7 C0 0E */	rlwimi r7, r6, 24, 0, 7
/* 8003F3E8 0003B368  90 E9 80 00 */	stw r7, -0x8000(r9)
/* 8003F3EC 0003B36C  C0 24 00 08 */	lfs f1, 0x8(r4)
/* 8003F3F0 0003B370  C0 04 00 14 */	lfs f0, 0x14(r4)
/* 8003F3F4 0003B374  EC 22 00 72 */	fmuls f1, f2, f1
/* 8003F3F8 0003B378  EC 02 00 32 */	fmuls f0, f2, f0
/* 8003F3FC 0003B37C  99 49 80 00 */	stb r10, -0x8000(r9)
/* 8003F400 0003B380  FC 20 08 1E */	fctiwz f1, f1
/* 8003F404 0003B384  FC 00 00 1E */	fctiwz f0, f0
/* 8003F408 0003B388  D8 21 00 50 */	stfd f1, 0x50(r1)
/* 8003F40C 0003B38C  D8 01 00 48 */	stfd f0, 0x48(r1)
/* 8003F410 0003B390  80 C1 00 54 */	lwz r6, 0x54(r1)
/* 8003F414 0003B394  80 81 00 4C */	lwz r4, 0x4c(r1)
/* 8003F418 0003B398  38 21 00 78 */	addi r1, r1, 0x78
/* 8003F41C 0003B39C  54 84 5A A8 */	clrlslwi r4, r4, 21, 11
/* 8003F420 0003B3A0  50 C4 05 7E */	rlwimi r4, r6, 0, 21, 31
/* 8003F424 0003B3A4  54 84 02 8E */	rlwinm r4, r4, 0, 10, 7
/* 8003F428 0003B3A8  51 64 92 12 */	rlwimi r4, r11, 18, 8, 9
/* 8003F42C 0003B3AC  54 84 02 3E */	clrlwi r4, r4, 8
/* 8003F430 0003B3B0  50 A4 C0 0E */	rlwimi r4, r5, 24, 0, 7
/* 8003F434 0003B3B4  90 89 80 00 */	stw r4, -0x8000(r9)
/* 8003F438 0003B3B8  B0 03 00 02 */	sth r0, 0x2(r3)
/* 8003F43C 0003B3BC  4E 80 00 20 */	blr
.endfn GXSetIndTexMtx

.fn GXSetIndTexCoordScale, global
/* 8003F440 0003B3C0  2C 03 00 02 */	cmpwi r3, 0x2
/* 8003F444 0003B3C4  41 82 00 F4 */	beq .L_8003F538
/* 8003F448 0003B3C8  40 80 00 14 */	bge .L_8003F45C
/* 8003F44C 0003B3CC  2C 03 00 00 */	cmpwi r3, 0x0
/* 8003F450 0003B3D0  41 82 00 18 */	beq .L_8003F468
/* 8003F454 0003B3D4  40 80 00 7C */	bge .L_8003F4D0
/* 8003F458 0003B3D8  48 00 01 AC */	b .L_8003F604
.L_8003F45C:
/* 8003F45C 0003B3DC  2C 03 00 04 */	cmpwi r3, 0x4
/* 8003F460 0003B3E0  40 80 01 A4 */	bge .L_8003F604
/* 8003F464 0003B3E4  48 00 01 3C */	b .L_8003F5A0
.L_8003F468:
/* 8003F468 0003B3E8  80 CD 82 90 */	lwz r6, gx@sda21(r13)
/* 8003F46C 0003B3EC  54 A3 20 36 */	slwi r3, r5, 4
/* 8003F470 0003B3F0  38 00 00 61 */	li r0, 0x61
/* 8003F474 0003B3F4  38 E6 01 28 */	addi r7, r6, 0x128
/* 8003F478 0003B3F8  80 C6 01 28 */	lwz r6, 0x128(r6)
/* 8003F47C 0003B3FC  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 8003F480 0003B400  54 C6 00 36 */	clrrwi r6, r6, 4
/* 8003F484 0003B404  7C C4 23 78 */	or r4, r6, r4
/* 8003F488 0003B408  90 87 00 00 */	stw r4, 0x0(r7)
/* 8003F48C 0003B40C  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003F490 0003B410  38 C4 01 28 */	addi r6, r4, 0x128
/* 8003F494 0003B414  80 84 01 28 */	lwz r4, 0x128(r4)
/* 8003F498 0003B418  54 84 07 2E */	rlwinm r4, r4, 0, 28, 23
/* 8003F49C 0003B41C  7C 83 1B 78 */	or r3, r4, r3
/* 8003F4A0 0003B420  90 66 00 00 */	stw r3, 0x0(r6)
/* 8003F4A4 0003B424  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F4A8 0003B428  38 83 01 28 */	addi r4, r3, 0x128
/* 8003F4AC 0003B42C  80 63 01 28 */	lwz r3, 0x128(r3)
/* 8003F4B0 0003B430  54 63 02 3E */	clrlwi r3, r3, 8
/* 8003F4B4 0003B434  64 63 25 00 */	oris r3, r3, 0x2500
/* 8003F4B8 0003B438  90 64 00 00 */	stw r3, 0x0(r4)
/* 8003F4BC 0003B43C  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 8003F4C0 0003B440  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F4C4 0003B444  80 03 01 28 */	lwz r0, 0x128(r3)
/* 8003F4C8 0003B448  90 05 80 00 */	stw r0, -0x8000(r5)
/* 8003F4CC 0003B44C  48 00 01 38 */	b .L_8003F604
.L_8003F4D0:
/* 8003F4D0 0003B450  80 ED 82 90 */	lwz r7, gx@sda21(r13)
/* 8003F4D4 0003B454  54 A3 60 26 */	slwi r3, r5, 12
/* 8003F4D8 0003B458  84 A7 01 28 */	lwzu r5, 0x128(r7)
/* 8003F4DC 0003B45C  54 86 40 2E */	slwi r6, r4, 8
/* 8003F4E0 0003B460  38 00 00 61 */	li r0, 0x61
/* 8003F4E4 0003B464  54 A5 06 26 */	rlwinm r5, r5, 0, 24, 19
/* 8003F4E8 0003B468  7C A5 33 78 */	or r5, r5, r6
/* 8003F4EC 0003B46C  90 A7 00 00 */	stw r5, 0x0(r7)
/* 8003F4F0 0003B470  3C 80 CC 01 */	lis r4, 0xCC008000@ha
/* 8003F4F4 0003B474  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 8003F4F8 0003B478  38 C5 01 28 */	addi r6, r5, 0x128
/* 8003F4FC 0003B47C  80 A5 01 28 */	lwz r5, 0x128(r5)
/* 8003F500 0003B480  54 A5 05 1E */	rlwinm r5, r5, 0, 20, 15
/* 8003F504 0003B484  7C A3 1B 78 */	or r3, r5, r3
/* 8003F508 0003B488  90 66 00 00 */	stw r3, 0x0(r6)
/* 8003F50C 0003B48C  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F510 0003B490  38 A3 01 28 */	addi r5, r3, 0x128
/* 8003F514 0003B494  80 63 01 28 */	lwz r3, 0x128(r3)
/* 8003F518 0003B498  54 63 02 3E */	clrlwi r3, r3, 8
/* 8003F51C 0003B49C  64 63 25 00 */	oris r3, r3, 0x2500
/* 8003F520 0003B4A0  90 65 00 00 */	stw r3, 0x0(r5)
/* 8003F524 0003B4A4  98 04 80 00 */	stb r0, 0xCC008000@l(r4)
/* 8003F528 0003B4A8  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F52C 0003B4AC  80 03 01 28 */	lwz r0, 0x128(r3)
/* 8003F530 0003B4B0  90 04 80 00 */	stw r0, -0x8000(r4)
/* 8003F534 0003B4B4  48 00 00 D0 */	b .L_8003F604
.L_8003F538:
/* 8003F538 0003B4B8  80 CD 82 90 */	lwz r6, gx@sda21(r13)
/* 8003F53C 0003B4BC  54 A3 20 36 */	slwi r3, r5, 4
/* 8003F540 0003B4C0  38 00 00 61 */	li r0, 0x61
/* 8003F544 0003B4C4  38 E6 01 2C */	addi r7, r6, 0x12c
/* 8003F548 0003B4C8  80 C6 01 2C */	lwz r6, 0x12c(r6)
/* 8003F54C 0003B4CC  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 8003F550 0003B4D0  54 C6 00 36 */	clrrwi r6, r6, 4
/* 8003F554 0003B4D4  7C C4 23 78 */	or r4, r6, r4
/* 8003F558 0003B4D8  90 87 00 00 */	stw r4, 0x0(r7)
/* 8003F55C 0003B4DC  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003F560 0003B4E0  38 C4 01 2C */	addi r6, r4, 0x12c
/* 8003F564 0003B4E4  80 84 01 2C */	lwz r4, 0x12c(r4)
/* 8003F568 0003B4E8  54 84 07 2E */	rlwinm r4, r4, 0, 28, 23
/* 8003F56C 0003B4EC  7C 83 1B 78 */	or r3, r4, r3
/* 8003F570 0003B4F0  90 66 00 00 */	stw r3, 0x0(r6)
/* 8003F574 0003B4F4  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F578 0003B4F8  38 83 01 2C */	addi r4, r3, 0x12c
/* 8003F57C 0003B4FC  80 63 01 2C */	lwz r3, 0x12c(r3)
/* 8003F580 0003B500  54 63 02 3E */	clrlwi r3, r3, 8
/* 8003F584 0003B504  64 63 26 00 */	oris r3, r3, 0x2600
/* 8003F588 0003B508  90 64 00 00 */	stw r3, 0x0(r4)
/* 8003F58C 0003B50C  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 8003F590 0003B510  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F594 0003B514  80 03 01 2C */	lwz r0, 0x12c(r3)
/* 8003F598 0003B518  90 05 80 00 */	stw r0, -0x8000(r5)
/* 8003F59C 0003B51C  48 00 00 68 */	b .L_8003F604
.L_8003F5A0:
/* 8003F5A0 0003B520  80 ED 82 90 */	lwz r7, gx@sda21(r13)
/* 8003F5A4 0003B524  54 A3 60 26 */	slwi r3, r5, 12
/* 8003F5A8 0003B528  84 A7 01 2C */	lwzu r5, 0x12c(r7)
/* 8003F5AC 0003B52C  54 86 40 2E */	slwi r6, r4, 8
/* 8003F5B0 0003B530  38 00 00 61 */	li r0, 0x61
/* 8003F5B4 0003B534  54 A5 06 26 */	rlwinm r5, r5, 0, 24, 19
/* 8003F5B8 0003B538  7C A5 33 78 */	or r5, r5, r6
/* 8003F5BC 0003B53C  90 A7 00 00 */	stw r5, 0x0(r7)
/* 8003F5C0 0003B540  3C 80 CC 01 */	lis r4, 0xCC008000@ha
/* 8003F5C4 0003B544  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 8003F5C8 0003B548  38 C5 01 2C */	addi r6, r5, 0x12c
/* 8003F5CC 0003B54C  80 A5 01 2C */	lwz r5, 0x12c(r5)
/* 8003F5D0 0003B550  54 A5 05 1E */	rlwinm r5, r5, 0, 20, 15
/* 8003F5D4 0003B554  7C A3 1B 78 */	or r3, r5, r3
/* 8003F5D8 0003B558  90 66 00 00 */	stw r3, 0x0(r6)
/* 8003F5DC 0003B55C  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F5E0 0003B560  38 A3 01 2C */	addi r5, r3, 0x12c
/* 8003F5E4 0003B564  80 63 01 2C */	lwz r3, 0x12c(r3)
/* 8003F5E8 0003B568  54 63 02 3E */	clrlwi r3, r3, 8
/* 8003F5EC 0003B56C  64 63 26 00 */	oris r3, r3, 0x2600
/* 8003F5F0 0003B570  90 65 00 00 */	stw r3, 0x0(r5)
/* 8003F5F4 0003B574  98 04 80 00 */	stb r0, 0xCC008000@l(r4)
/* 8003F5F8 0003B578  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F5FC 0003B57C  80 03 01 2C */	lwz r0, 0x12c(r3)
/* 8003F600 0003B580  90 04 80 00 */	stw r0, -0x8000(r4)
.L_8003F604:
/* 8003F604 0003B584  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F608 0003B588  38 00 00 00 */	li r0, 0x0
/* 8003F60C 0003B58C  B0 03 00 02 */	sth r0, 0x2(r3)
/* 8003F610 0003B590  4E 80 00 20 */	blr
.endfn GXSetIndTexCoordScale

.fn GXSetIndTexOrder, global
/* 8003F614 0003B594  2C 03 00 02 */	cmpwi r3, 0x2
/* 8003F618 0003B598  41 82 00 94 */	beq .L_8003F6AC
/* 8003F61C 0003B59C  40 80 00 14 */	bge .L_8003F630
/* 8003F620 0003B5A0  2C 03 00 00 */	cmpwi r3, 0x0
/* 8003F624 0003B5A4  41 82 00 18 */	beq .L_8003F63C
/* 8003F628 0003B5A8  40 80 00 4C */	bge .L_8003F674
/* 8003F62C 0003B5AC  48 00 00 EC */	b .L_8003F718
.L_8003F630:
/* 8003F630 0003B5B0  2C 03 00 04 */	cmpwi r3, 0x4
/* 8003F634 0003B5B4  40 80 00 E4 */	bge .L_8003F718
/* 8003F638 0003B5B8  48 00 00 AC */	b .L_8003F6E4
.L_8003F63C:
/* 8003F63C 0003B5BC  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F640 0003B5C0  54 80 18 38 */	slwi r0, r4, 3
/* 8003F644 0003B5C4  38 83 01 20 */	addi r4, r3, 0x120
/* 8003F648 0003B5C8  80 63 01 20 */	lwz r3, 0x120(r3)
/* 8003F64C 0003B5CC  54 63 00 38 */	clrrwi r3, r3, 3
/* 8003F650 0003B5D0  7C 63 2B 78 */	or r3, r3, r5
/* 8003F654 0003B5D4  90 64 00 00 */	stw r3, 0x0(r4)
/* 8003F658 0003B5D8  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F65C 0003B5DC  38 83 01 20 */	addi r4, r3, 0x120
/* 8003F660 0003B5E0  80 63 01 20 */	lwz r3, 0x120(r3)
/* 8003F664 0003B5E4  54 63 07 72 */	rlwinm r3, r3, 0, 29, 25
/* 8003F668 0003B5E8  7C 60 03 78 */	or r0, r3, r0
/* 8003F66C 0003B5EC  90 04 00 00 */	stw r0, 0x0(r4)
/* 8003F670 0003B5F0  48 00 00 A8 */	b .L_8003F718
.L_8003F674:
/* 8003F674 0003B5F4  80 CD 82 90 */	lwz r6, gx@sda21(r13)
/* 8003F678 0003B5F8  54 80 48 2C */	slwi r0, r4, 9
/* 8003F67C 0003B5FC  54 A3 30 32 */	slwi r3, r5, 6
/* 8003F680 0003B600  80 86 01 20 */	lwz r4, 0x120(r6)
/* 8003F684 0003B604  54 84 06 AC */	rlwinm r4, r4, 0, 26, 22
/* 8003F688 0003B608  7C 83 1B 78 */	or r3, r4, r3
/* 8003F68C 0003B60C  90 66 01 20 */	stw r3, 0x120(r6)
/* 8003F690 0003B610  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F694 0003B614  38 83 01 20 */	addi r4, r3, 0x120
/* 8003F698 0003B618  80 63 01 20 */	lwz r3, 0x120(r3)
/* 8003F69C 0003B61C  54 63 05 E6 */	rlwinm r3, r3, 0, 23, 19
/* 8003F6A0 0003B620  7C 60 03 78 */	or r0, r3, r0
/* 8003F6A4 0003B624  90 04 00 00 */	stw r0, 0x0(r4)
/* 8003F6A8 0003B628  48 00 00 70 */	b .L_8003F718
.L_8003F6AC:
/* 8003F6AC 0003B62C  80 CD 82 90 */	lwz r6, gx@sda21(r13)
/* 8003F6B0 0003B630  54 80 78 20 */	slwi r0, r4, 15
/* 8003F6B4 0003B634  54 A3 60 26 */	slwi r3, r5, 12
/* 8003F6B8 0003B638  80 86 01 20 */	lwz r4, 0x120(r6)
/* 8003F6BC 0003B63C  54 84 05 20 */	rlwinm r4, r4, 0, 20, 16
/* 8003F6C0 0003B640  7C 83 1B 78 */	or r3, r4, r3
/* 8003F6C4 0003B644  90 66 01 20 */	stw r3, 0x120(r6)
/* 8003F6C8 0003B648  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F6CC 0003B64C  38 83 01 20 */	addi r4, r3, 0x120
/* 8003F6D0 0003B650  80 63 01 20 */	lwz r3, 0x120(r3)
/* 8003F6D4 0003B654  54 63 04 5A */	rlwinm r3, r3, 0, 17, 13
/* 8003F6D8 0003B658  7C 60 03 78 */	or r0, r3, r0
/* 8003F6DC 0003B65C  90 04 00 00 */	stw r0, 0x0(r4)
/* 8003F6E0 0003B660  48 00 00 38 */	b .L_8003F718
.L_8003F6E4:
/* 8003F6E4 0003B664  80 CD 82 90 */	lwz r6, gx@sda21(r13)
/* 8003F6E8 0003B668  54 80 A8 14 */	slwi r0, r4, 21
/* 8003F6EC 0003B66C  54 A3 90 1A */	slwi r3, r5, 18
/* 8003F6F0 0003B670  80 86 01 20 */	lwz r4, 0x120(r6)
/* 8003F6F4 0003B674  54 84 03 94 */	rlwinm r4, r4, 0, 14, 10
/* 8003F6F8 0003B678  7C 83 1B 78 */	or r3, r4, r3
/* 8003F6FC 0003B67C  90 66 01 20 */	stw r3, 0x120(r6)
/* 8003F700 0003B680  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F704 0003B684  38 83 01 20 */	addi r4, r3, 0x120
/* 8003F708 0003B688  80 63 01 20 */	lwz r3, 0x120(r3)
/* 8003F70C 0003B68C  54 63 02 CE */	rlwinm r3, r3, 0, 11, 7
/* 8003F710 0003B690  7C 60 03 78 */	or r0, r3, r0
/* 8003F714 0003B694  90 04 00 00 */	stw r0, 0x0(r4)
.L_8003F718:
/* 8003F718 0003B698  38 00 00 61 */	li r0, 0x61
/* 8003F71C 0003B69C  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003F720 0003B6A0  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 8003F724 0003B6A4  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 8003F728 0003B6A8  38 00 00 00 */	li r0, 0x0
/* 8003F72C 0003B6AC  80 64 01 20 */	lwz r3, 0x120(r4)
/* 8003F730 0003B6B0  90 65 80 00 */	stw r3, -0x8000(r5)
/* 8003F734 0003B6B4  80 64 04 F0 */	lwz r3, 0x4f0(r4)
/* 8003F738 0003B6B8  60 63 00 03 */	ori r3, r3, 0x3
/* 8003F73C 0003B6BC  90 64 04 F0 */	stw r3, 0x4f0(r4)
/* 8003F740 0003B6C0  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F744 0003B6C4  B0 03 00 02 */	sth r0, 0x2(r3)
/* 8003F748 0003B6C8  4E 80 00 20 */	blr
.endfn GXSetIndTexOrder

.fn GXSetNumIndStages, global
/* 8003F74C 0003B6CC  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003F750 0003B6D0  54 60 82 1E */	clrlslwi r0, r3, 24, 16
/* 8003F754 0003B6D4  84 64 02 04 */	lwzu r3, 0x204(r4)
/* 8003F758 0003B6D8  54 63 04 18 */	rlwinm r3, r3, 0, 16, 12
/* 8003F75C 0003B6DC  7C 60 03 78 */	or r0, r3, r0
/* 8003F760 0003B6E0  90 04 00 00 */	stw r0, 0x0(r4)
/* 8003F764 0003B6E4  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F768 0003B6E8  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 8003F76C 0003B6EC  60 00 00 06 */	ori r0, r0, 0x6
/* 8003F770 0003B6F0  90 03 04 F0 */	stw r0, 0x4f0(r3)
/* 8003F774 0003B6F4  4E 80 00 20 */	blr
.endfn GXSetNumIndStages

.fn GXSetTevDirect, global
/* 8003F778 0003B6F8  7C 08 02 A6 */	mflr r0
/* 8003F77C 0003B6FC  38 80 00 00 */	li r4, 0x0
/* 8003F780 0003B700  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003F784 0003B704  38 00 00 00 */	li r0, 0x0
/* 8003F788 0003B708  38 A0 00 00 */	li r5, 0x0
/* 8003F78C 0003B70C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8003F790 0003B710  38 C0 00 00 */	li r6, 0x0
/* 8003F794 0003B714  38 E0 00 00 */	li r7, 0x0
/* 8003F798 0003B718  90 01 00 08 */	stw r0, 0x8(r1)
/* 8003F79C 0003B71C  39 00 00 00 */	li r8, 0x0
/* 8003F7A0 0003B720  39 20 00 00 */	li r9, 0x0
/* 8003F7A4 0003B724  90 01 00 0C */	stw r0, 0xc(r1)
/* 8003F7A8 0003B728  39 40 00 00 */	li r10, 0x0
/* 8003F7AC 0003B72C  4B FF FA 99 */	bl GXSetTevIndirect
/* 8003F7B0 0003B730  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8003F7B4 0003B734  38 21 00 18 */	addi r1, r1, 0x18
/* 8003F7B8 0003B738  7C 08 03 A6 */	mtlr r0
/* 8003F7BC 0003B73C  4E 80 00 20 */	blr
.endfn GXSetTevDirect

.fn GXSetTevIndBumpXYZ, global
/* 8003F7C0 0003B740  7C 08 02 A6 */	mflr r0
/* 8003F7C4 0003B744  38 E5 00 00 */	addi r7, r5, 0x0
/* 8003F7C8 0003B748  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003F7CC 0003B74C  38 00 00 00 */	li r0, 0x0
/* 8003F7D0 0003B750  38 A0 00 00 */	li r5, 0x0
/* 8003F7D4 0003B754  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8003F7D8 0003B758  38 C0 00 07 */	li r6, 0x7
/* 8003F7DC 0003B75C  39 00 00 00 */	li r8, 0x0
/* 8003F7E0 0003B760  90 01 00 08 */	stw r0, 0x8(r1)
/* 8003F7E4 0003B764  39 20 00 00 */	li r9, 0x0
/* 8003F7E8 0003B768  39 40 00 00 */	li r10, 0x0
/* 8003F7EC 0003B76C  90 01 00 0C */	stw r0, 0xc(r1)
/* 8003F7F0 0003B770  4B FF FA 55 */	bl GXSetTevIndirect
/* 8003F7F4 0003B774  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8003F7F8 0003B778  38 21 00 20 */	addi r1, r1, 0x20
/* 8003F7FC 0003B77C  7C 08 03 A6 */	mtlr r0
/* 8003F800 0003B780  4E 80 00 20 */	blr
.endfn GXSetTevIndBumpXYZ

.fn __GXUpdateBPMask, global
/* 8003F804 0003B784  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003F808 0003B788  38 C0 00 00 */	li r6, 0x0
/* 8003F80C 0003B78C  38 80 00 00 */	li r4, 0x0
/* 8003F810 0003B790  80 03 02 04 */	lwz r0, 0x204(r3)
/* 8003F814 0003B794  54 00 87 7E */	extrwi r0, r0, 3, 13
/* 8003F818 0003B798  28 00 00 00 */	cmplwi r0, 0x0
/* 8003F81C 0003B79C  7C 09 03 A6 */	mtctr r0
/* 8003F820 0003B7A0  40 81 00 6C */	ble .L_8003F88C
.L_8003F824:
/* 8003F824 0003B7A4  2C 04 00 02 */	cmpwi r4, 0x2
/* 8003F828 0003B7A8  41 82 00 3C */	beq .L_8003F864
/* 8003F82C 0003B7AC  40 80 00 14 */	bge .L_8003F840
/* 8003F830 0003B7B0  2C 04 00 00 */	cmpwi r4, 0x0
/* 8003F834 0003B7B4  41 82 00 18 */	beq .L_8003F84C
/* 8003F838 0003B7B8  40 80 00 20 */	bge .L_8003F858
/* 8003F83C 0003B7BC  48 00 00 3C */	b .L_8003F878
.L_8003F840:
/* 8003F840 0003B7C0  2C 04 00 04 */	cmpwi r4, 0x4
/* 8003F844 0003B7C4  40 80 00 34 */	bge .L_8003F878
/* 8003F848 0003B7C8  48 00 00 28 */	b .L_8003F870
.L_8003F84C:
/* 8003F84C 0003B7CC  80 03 01 20 */	lwz r0, 0x120(r3)
/* 8003F850 0003B7D0  54 05 07 7E */	clrlwi r5, r0, 29
/* 8003F854 0003B7D4  48 00 00 24 */	b .L_8003F878
.L_8003F858:
/* 8003F858 0003B7D8  80 03 01 20 */	lwz r0, 0x120(r3)
/* 8003F85C 0003B7DC  54 05 D7 7E */	extrwi r5, r0, 3, 23
/* 8003F860 0003B7E0  48 00 00 18 */	b .L_8003F878
.L_8003F864:
/* 8003F864 0003B7E4  80 03 01 20 */	lwz r0, 0x120(r3)
/* 8003F868 0003B7E8  54 05 A7 7E */	extrwi r5, r0, 3, 17
/* 8003F86C 0003B7EC  48 00 00 0C */	b .L_8003F878
.L_8003F870:
/* 8003F870 0003B7F0  80 03 01 20 */	lwz r0, 0x120(r3)
/* 8003F874 0003B7F4  54 05 77 7E */	extrwi r5, r0, 3, 11
.L_8003F878:
/* 8003F878 0003B7F8  38 00 00 01 */	li r0, 0x1
/* 8003F87C 0003B7FC  7C 00 28 30 */	slw r0, r0, r5
/* 8003F880 0003B800  7C C6 03 78 */	or r6, r6, r0
/* 8003F884 0003B804  38 84 00 01 */	addi r4, r4, 0x1
/* 8003F888 0003B808  42 00 FF 9C */	bdnz .L_8003F824
.L_8003F88C:
/* 8003F88C 0003B80C  38 83 01 24 */	addi r4, r3, 0x124
/* 8003F890 0003B810  80 63 01 24 */	lwz r3, 0x124(r3)
/* 8003F894 0003B814  54 60 06 3E */	clrlwi r0, r3, 24
/* 8003F898 0003B818  7C 00 30 40 */	cmplw r0, r6
/* 8003F89C 0003B81C  4D 82 00 20 */	beqlr
/* 8003F8A0 0003B820  54 60 00 2E */	clrrwi r0, r3, 8
/* 8003F8A4 0003B824  7C 00 33 78 */	or r0, r0, r6
/* 8003F8A8 0003B828  90 04 00 00 */	stw r0, 0x0(r4)
/* 8003F8AC 0003B82C  38 00 00 61 */	li r0, 0x61
/* 8003F8B0 0003B830  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 8003F8B4 0003B834  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 8003F8B8 0003B838  38 00 00 00 */	li r0, 0x0
/* 8003F8BC 0003B83C  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003F8C0 0003B840  80 64 01 24 */	lwz r3, 0x124(r4)
/* 8003F8C4 0003B844  90 65 80 00 */	stw r3, -0x8000(r5)
/* 8003F8C8 0003B848  B0 04 00 02 */	sth r0, 0x2(r4)
/* 8003F8CC 0003B84C  4E 80 00 20 */	blr
.endfn __GXUpdateBPMask

.fn __GXFlushTextureState, global
/* 8003F8D0 0003B850  38 00 00 61 */	li r0, 0x61
/* 8003F8D4 0003B854  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003F8D8 0003B858  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 8003F8DC 0003B85C  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 8003F8E0 0003B860  38 00 00 00 */	li r0, 0x0
/* 8003F8E4 0003B864  80 64 01 24 */	lwz r3, 0x124(r4)
/* 8003F8E8 0003B868  90 65 80 00 */	stw r3, -0x8000(r5)
/* 8003F8EC 0003B86C  B0 04 00 02 */	sth r0, 0x2(r4)
/* 8003F8F0 0003B870  4E 80 00 20 */	blr
.endfn __GXFlushTextureState

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0

.balign 8


.obj float_800A9908, local
	.4byte 0x44800000
	.4byte 0
.endobj float_800A9908
