.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global memcmp
memcmp:
/* 800602D0 0005C250  38 C3 FF FF */	addi r6, r3, -0x1
/* 800602D4 0005C254  38 84 FF FF */	addi r4, r4, -0x1
/* 800602D8 0005C258  38 A5 00 01 */	addi r5, r5, 0x1
/* 800602DC 0005C25C  48 00 00 28 */	b .L_80060304
.L_800602E0:
/* 800602E0 0005C260  8C 66 00 01 */	lbzu r3, 0x1(r6)
/* 800602E4 0005C264  8C 04 00 01 */	lbzu r0, 0x1(r4)
/* 800602E8 0005C268  7C 03 00 40 */	cmplw r3, r0
/* 800602EC 0005C26C  41 82 00 18 */	beq .L_80060304
/* 800602F0 0005C270  40 80 00 0C */	bge .L_800602FC
/* 800602F4 0005C274  38 60 FF FF */	li r3, -0x1
/* 800602F8 0005C278  4E 80 00 20 */	blr
.L_800602FC:
/* 800602FC 0005C27C  38 60 00 01 */	li r3, 0x1
/* 80060300 0005C280  4E 80 00 20 */	blr
.L_80060304:
/* 80060304 0005C284  34 A5 FF FF */	addic. r5, r5, -0x1
/* 80060308 0005C288  40 82 FF D8 */	bne .L_800602E0
/* 8006030C 0005C28C  38 60 00 00 */	li r3, 0x0
/* 80060310 0005C290  4E 80 00 20 */	blr

.global memchr
memchr:
/* 80060314 0005C294  54 84 06 3E */	clrlwi r4, r4, 24
/* 80060318 0005C298  38 63 FF FF */	addi r3, r3, -0x1
/* 8006031C 0005C29C  38 A5 00 01 */	addi r5, r5, 0x1
/* 80060320 0005C2A0  48 00 00 10 */	b .L_80060330
.L_80060324:
/* 80060324 0005C2A4  8C 03 00 01 */	lbzu r0, 0x1(r3)
/* 80060328 0005C2A8  7C 00 20 40 */	cmplw r0, r4
/* 8006032C 0005C2AC  4D 82 00 20 */	beqlr
.L_80060330:
/* 80060330 0005C2B0  34 A5 FF FF */	addic. r5, r5, -0x1
/* 80060334 0005C2B4  40 82 FF F0 */	bne .L_80060324
/* 80060338 0005C2B8  38 60 00 00 */	li r3, 0x0
/* 8006033C 0005C2BC  4E 80 00 20 */	blr

.global memmove
memmove:
/* 80060340 0005C2C0  7C 08 02 A6 */	mflr r0
/* 80060344 0005C2C4  28 05 00 20 */	cmplwi r5, 0x20
/* 80060348 0005C2C8  90 01 00 04 */	stw r0, 0x4(r1)
/* 8006034C 0005C2CC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80060350 0005C2D0  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80060354 0005C2D4  3B E3 00 00 */	addi r31, r3, 0x0
/* 80060358 0005C2D8  7C 7F 20 10 */	subfc r3, r31, r4
/* 8006035C 0005C2DC  7C 00 01 10 */	subfe r0, r0, r0
/* 80060360 0005C2E0  7C 60 00 D0 */	neg r3, r0
/* 80060364 0005C2E4  41 80 00 54 */	blt .L_800603B8
/* 80060368 0005C2E8  7F E0 22 78 */	xor r0, r31, r4
/* 8006036C 0005C2EC  54 00 07 BF */	clrlwi. r0, r0, 30
/* 80060370 0005C2F0  41 82 00 24 */	beq .L_80060394
/* 80060374 0005C2F4  2C 03 00 00 */	cmpwi r3, 0x0
/* 80060378 0005C2F8  40 82 00 10 */	bne .L_80060388
/* 8006037C 0005C2FC  7F E3 FB 78 */	mr r3, r31
/* 80060380 0005C300  48 00 01 4D */	bl __copy_longs_unaligned
/* 80060384 0005C304  48 00 00 2C */	b .L_800603B0
.L_80060388:
/* 80060388 0005C308  7F E3 FB 78 */	mr r3, r31
/* 8006038C 0005C30C  48 00 00 91 */	bl __copy_longs_rev_unaligned
/* 80060390 0005C310  48 00 00 20 */	b .L_800603B0
.L_80060394:
/* 80060394 0005C314  2C 03 00 00 */	cmpwi r3, 0x0
/* 80060398 0005C318  40 82 00 10 */	bne .L_800603A8
/* 8006039C 0005C31C  7F E3 FB 78 */	mr r3, r31
/* 800603A0 0005C320  48 00 02 9D */	bl __copy_longs_aligned
/* 800603A4 0005C324  48 00 00 0C */	b .L_800603B0
.L_800603A8:
/* 800603A8 0005C328  7F E3 FB 78 */	mr r3, r31
/* 800603AC 0005C32C  48 00 01 E5 */	bl __copy_longs_rev_aligned
.L_800603B0:
/* 800603B0 0005C330  7F E3 FB 78 */	mr r3, r31
/* 800603B4 0005C334  48 00 00 54 */	b .L_80060408
.L_800603B8:
/* 800603B8 0005C338  2C 03 00 00 */	cmpwi r3, 0x0
/* 800603BC 0005C33C  40 82 00 28 */	bne .L_800603E4
/* 800603C0 0005C340  38 64 FF FF */	addi r3, r4, -0x1
/* 800603C4 0005C344  38 9F FF FF */	addi r4, r31, -0x1
/* 800603C8 0005C348  38 A5 00 01 */	addi r5, r5, 0x1
/* 800603CC 0005C34C  48 00 00 0C */	b .L_800603D8
.L_800603D0:
/* 800603D0 0005C350  8C 03 00 01 */	lbzu r0, 0x1(r3)
/* 800603D4 0005C354  9C 04 00 01 */	stbu r0, 0x1(r4)
.L_800603D8:
/* 800603D8 0005C358  34 A5 FF FF */	addic. r5, r5, -0x1
/* 800603DC 0005C35C  40 82 FF F4 */	bne .L_800603D0
/* 800603E0 0005C360  48 00 00 24 */	b .L_80060404
.L_800603E4:
/* 800603E4 0005C364  7C 64 2A 14 */	add r3, r4, r5
/* 800603E8 0005C368  7C 9F 2A 14 */	add r4, r31, r5
/* 800603EC 0005C36C  38 A5 00 01 */	addi r5, r5, 0x1
/* 800603F0 0005C370  48 00 00 0C */	b .L_800603FC
.L_800603F4:
/* 800603F4 0005C374  8C 03 FF FF */	lbzu r0, -0x1(r3)
/* 800603F8 0005C378  9C 04 FF FF */	stbu r0, -0x1(r4)
.L_800603FC:
/* 800603FC 0005C37C  34 A5 FF FF */	addic. r5, r5, -0x1
/* 80060400 0005C380  40 82 FF F4 */	bne .L_800603F4
.L_80060404:
/* 80060404 0005C384  7F E3 FB 78 */	mr r3, r31
.L_80060408:
/* 80060408 0005C388  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8006040C 0005C38C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80060410 0005C390  38 21 00 20 */	addi r1, r1, 0x20
/* 80060414 0005C394  7C 08 03 A6 */	mtlr r0
/* 80060418 0005C398  4E 80 00 20 */	blr