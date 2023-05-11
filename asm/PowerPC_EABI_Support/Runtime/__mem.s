.include "macros.inc"

.section .init, "ax"  # 0x80003100 - 0x80005520 ; 0x00002420

.fn memset, global
/* 8000532C 0000232C  7C 08 02 A6 */	mflr r0
/* 80005330 00002330  90 01 00 04 */	stw r0, 0x4(r1)
/* 80005334 00002334  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80005338 00002338  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8000533C 0000233C  7C 7F 1B 78 */	mr r31, r3
/* 80005340 00002340  48 00 00 1D */	bl __fill_mem
/* 80005344 00002344  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80005348 00002348  7F E3 FB 78 */	mr r3, r31
/* 8000534C 0000234C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80005350 00002350  38 21 00 20 */	addi r1, r1, 0x20
/* 80005354 00002354  7C 08 03 A6 */	mtlr r0
/* 80005358 00002358  4E 80 00 20 */	blr
.endfn memset

.fn __fill_mem, global
/* 8000535C 0000235C  28 05 00 20 */	cmplwi r5, 0x20
/* 80005360 00002360  54 80 06 3E */	clrlwi r0, r4, 24
/* 80005364 00002364  7C 07 03 78 */	mr r7, r0
/* 80005368 00002368  38 C3 FF FF */	addi r6, r3, -0x1
/* 8000536C 0000236C  41 80 00 98 */	blt .L_80005404
/* 80005370 00002370  7C C0 30 F8 */	nor r0, r6, r6
/* 80005374 00002374  54 00 07 BF */	clrlwi. r0, r0, 30
/* 80005378 00002378  7C 03 03 78 */	mr r3, r0
/* 8000537C 0000237C  41 82 00 18 */	beq .L_80005394
/* 80005380 00002380  7C A3 28 50 */	subf r5, r3, r5
/* 80005384 00002384  54 E0 06 3E */	clrlwi r0, r7, 24
.L_80005388:
/* 80005388 00002388  34 63 FF FF */	addic. r3, r3, -0x1
/* 8000538C 0000238C  9C 06 00 01 */	stbu r0, 0x1(r6)
/* 80005390 00002390  40 82 FF F8 */	bne .L_80005388
.L_80005394:
/* 80005394 00002394  28 07 00 00 */	cmplwi r7, 0x0
/* 80005398 00002398  41 82 00 1C */	beq .L_800053B4
/* 8000539C 0000239C  54 E3 C0 0E */	slwi r3, r7, 24
/* 800053A0 000023A0  54 E0 80 1E */	slwi r0, r7, 16
/* 800053A4 000023A4  54 E4 40 2E */	slwi r4, r7, 8
/* 800053A8 000023A8  7C 60 03 78 */	or r0, r3, r0
/* 800053AC 000023AC  7C 80 03 78 */	or r0, r4, r0
/* 800053B0 000023B0  7C E7 03 78 */	or r7, r7, r0
.L_800053B4:
/* 800053B4 000023B4  54 A0 D9 7F */	srwi. r0, r5, 5
/* 800053B8 000023B8  38 66 FF FD */	addi r3, r6, -0x3
/* 800053BC 000023BC  41 82 00 2C */	beq .L_800053E8
.L_800053C0:
/* 800053C0 000023C0  90 E3 00 04 */	stw r7, 0x4(r3)
/* 800053C4 000023C4  34 00 FF FF */	addic. r0, r0, -0x1
/* 800053C8 000023C8  90 E3 00 08 */	stw r7, 0x8(r3)
/* 800053CC 000023CC  90 E3 00 0C */	stw r7, 0xc(r3)
/* 800053D0 000023D0  90 E3 00 10 */	stw r7, 0x10(r3)
/* 800053D4 000023D4  90 E3 00 14 */	stw r7, 0x14(r3)
/* 800053D8 000023D8  90 E3 00 18 */	stw r7, 0x18(r3)
/* 800053DC 000023DC  90 E3 00 1C */	stw r7, 0x1c(r3)
/* 800053E0 000023E0  94 E3 00 20 */	stwu r7, 0x20(r3)
/* 800053E4 000023E4  40 82 FF DC */	bne .L_800053C0
.L_800053E8:
/* 800053E8 000023E8  54 A0 F7 7F */	extrwi. r0, r5, 3, 27
/* 800053EC 000023EC  41 82 00 10 */	beq .L_800053FC
.L_800053F0:
/* 800053F0 000023F0  34 00 FF FF */	addic. r0, r0, -0x1
/* 800053F4 000023F4  94 E3 00 04 */	stwu r7, 0x4(r3)
/* 800053F8 000023F8  40 82 FF F8 */	bne .L_800053F0
.L_800053FC:
/* 800053FC 000023FC  38 C3 00 03 */	addi r6, r3, 0x3
/* 80005400 00002400  54 A5 07 BE */	clrlwi r5, r5, 30
.L_80005404:
/* 80005404 00002404  28 05 00 00 */	cmplwi r5, 0x0
/* 80005408 00002408  4D 82 00 20 */	beqlr
/* 8000540C 0000240C  54 E0 06 3E */	clrlwi r0, r7, 24
.L_80005410:
/* 80005410 00002410  34 A5 FF FF */	addic. r5, r5, -0x1
/* 80005414 00002414  9C 06 00 01 */	stbu r0, 0x1(r6)
/* 80005418 00002418  40 82 FF F8 */	bne .L_80005410
/* 8000541C 0000241C  4E 80 00 20 */	blr
.endfn __fill_mem

.fn memcpy, global
/* 80005420 00002420  7C 04 18 40 */	cmplw r4, r3
/* 80005424 00002424  41 80 00 28 */	blt .L_8000544C
/* 80005428 00002428  38 84 FF FF */	addi r4, r4, -0x1
/* 8000542C 0000242C  38 C3 FF FF */	addi r6, r3, -0x1
/* 80005430 00002430  38 A5 00 01 */	addi r5, r5, 0x1
/* 80005434 00002434  48 00 00 0C */	b .L_80005440
.L_80005438:
/* 80005438 00002438  8C 04 00 01 */	lbzu r0, 0x1(r4)
/* 8000543C 0000243C  9C 06 00 01 */	stbu r0, 0x1(r6)
.L_80005440:
/* 80005440 00002440  34 A5 FF FF */	addic. r5, r5, -0x1
/* 80005444 00002444  40 82 FF F4 */	bne .L_80005438
/* 80005448 00002448  4E 80 00 20 */	blr
.L_8000544C:
/* 8000544C 0000244C  7C 84 2A 14 */	add r4, r4, r5
/* 80005450 00002450  7C C3 2A 14 */	add r6, r3, r5
/* 80005454 00002454  38 A5 00 01 */	addi r5, r5, 0x1
/* 80005458 00002458  48 00 00 0C */	b .L_80005464
.L_8000545C:
/* 8000545C 0000245C  8C 04 FF FF */	lbzu r0, -0x1(r4)
/* 80005460 00002460  9C 06 FF FF */	stbu r0, -0x1(r6)
.L_80005464:
/* 80005464 00002464  34 A5 FF FF */	addic. r5, r5, -0x1
/* 80005468 00002468  40 82 FF F4 */	bne .L_8000545C
/* 8000546C 0000246C  4E 80 00 20 */	blr
.endfn memcpy
