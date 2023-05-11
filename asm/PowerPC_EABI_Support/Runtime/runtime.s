.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn __cvt_fp2unsigned, global
/* 8005F3FC 0005B37C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8005F400 0005B380  3C 80 80 06 */	lis r4, __constants@h
/* 8005F404 0005B384  60 84 47 F0 */	ori r4, r4, __constants@l
/* 8005F408 0005B388  38 60 00 00 */	li r3, 0x0
/* 8005F40C 0005B38C  C8 04 00 00 */	lfd f0, 0x0(r4)
/* 8005F410 0005B390  C8 64 00 08 */	lfd f3, 0x8(r4)
/* 8005F414 0005B394  C8 84 00 10 */	lfd f4, 0x10(r4)
/* 8005F418 0005B398  FC 01 00 00 */	fcmpu cr0, f1, f0
/* 8005F41C 0005B39C  FF 01 18 00 */	fcmpu cr6, f1, f3
/* 8005F420 0005B3A0  41 80 00 30 */	blt .L_8005F450
/* 8005F424 0005B3A4  38 63 FF FF */	addi r3, r3, -0x1
/* 8005F428 0005B3A8  40 98 00 28 */	bge cr6, .L_8005F450
/* 8005F42C 0005B3AC  FF 81 20 00 */	fcmpu cr7, f1, f4
/* 8005F430 0005B3B0  FC 40 08 90 */	fmr f2, f1
/* 8005F434 0005B3B4  41 9C 00 08 */	blt cr7, .L_8005F43C
/* 8005F438 0005B3B8  FC 41 20 28 */	fsub f2, f1, f4
.L_8005F43C:
/* 8005F43C 0005B3BC  FC 40 10 1E */	fctiwz f2, f2
/* 8005F440 0005B3C0  D8 41 00 08 */	stfd f2, 0x8(r1)
/* 8005F444 0005B3C4  80 61 00 0C */	lwz r3, 0xc(r1)
/* 8005F448 0005B3C8  41 9C 00 08 */	blt cr7, .L_8005F450
/* 8005F44C 0005B3CC  3C 63 80 00 */	addis r3, r3, 0x8000
.L_8005F450:
/* 8005F450 0005B3D0  38 21 00 10 */	addi r1, r1, 0x10
/* 8005F454 0005B3D4  4E 80 00 20 */	blr
.endfn __cvt_fp2unsigned

.fn __div2u, global
/* 8005F458 0005B3D8  2C 03 00 00 */	cmpwi r3, 0x0
/* 8005F45C 0005B3DC  7C 60 00 34 */	cntlzw r0, r3
/* 8005F460 0005B3E0  7C 89 00 34 */	cntlzw r9, r4
/* 8005F464 0005B3E4  40 82 00 08 */	bne .L_8005F46C
/* 8005F468 0005B3E8  38 09 00 20 */	addi r0, r9, 0x20
.L_8005F46C:
/* 8005F46C 0005B3EC  2C 05 00 00 */	cmpwi r5, 0x0
/* 8005F470 0005B3F0  7C A9 00 34 */	cntlzw r9, r5
/* 8005F474 0005B3F4  7C CA 00 34 */	cntlzw r10, r6
/* 8005F478 0005B3F8  40 82 00 08 */	bne .L_8005F480
/* 8005F47C 0005B3FC  39 2A 00 20 */	addi r9, r10, 0x20
.L_8005F480:
/* 8005F480 0005B400  7C 00 48 00 */	cmpw r0, r9
/* 8005F484 0005B404  21 40 00 40 */	subfic r10, r0, 0x40
/* 8005F488 0005B408  41 81 00 B0 */	bgt .L_8005F538
/* 8005F48C 0005B40C  39 29 00 01 */	addi r9, r9, 0x1
/* 8005F490 0005B410  21 29 00 40 */	subfic r9, r9, 0x40
/* 8005F494 0005B414  7C 00 4A 14 */	add r0, r0, r9
/* 8005F498 0005B418  7D 29 50 50 */	subf r9, r9, r10
/* 8005F49C 0005B41C  7D 29 03 A6 */	mtctr r9
/* 8005F4A0 0005B420  2C 09 00 20 */	cmpwi r9, 0x20
/* 8005F4A4 0005B424  38 E9 FF E0 */	addi r7, r9, -0x20
/* 8005F4A8 0005B428  41 80 00 10 */	blt .L_8005F4B8
/* 8005F4AC 0005B42C  7C 68 3C 30 */	srw r8, r3, r7
/* 8005F4B0 0005B430  38 E0 00 00 */	li r7, 0x0
/* 8005F4B4 0005B434  48 00 00 18 */	b .L_8005F4CC
.L_8005F4B8:
/* 8005F4B8 0005B438  7C 88 4C 30 */	srw r8, r4, r9
/* 8005F4BC 0005B43C  20 E9 00 20 */	subfic r7, r9, 0x20
/* 8005F4C0 0005B440  7C 67 38 30 */	slw r7, r3, r7
/* 8005F4C4 0005B444  7D 08 3B 78 */	or r8, r8, r7
/* 8005F4C8 0005B448  7C 67 4C 30 */	srw r7, r3, r9
.L_8005F4CC:
/* 8005F4CC 0005B44C  2C 00 00 20 */	cmpwi r0, 0x20
/* 8005F4D0 0005B450  31 20 FF E0 */	addic r9, r0, -0x20
/* 8005F4D4 0005B454  41 80 00 10 */	blt .L_8005F4E4
/* 8005F4D8 0005B458  7C 83 48 30 */	slw r3, r4, r9
/* 8005F4DC 0005B45C  38 80 00 00 */	li r4, 0x0
/* 8005F4E0 0005B460  48 00 00 18 */	b .L_8005F4F8
.L_8005F4E4:
/* 8005F4E4 0005B464  7C 63 00 30 */	slw r3, r3, r0
/* 8005F4E8 0005B468  21 20 00 20 */	subfic r9, r0, 0x20
/* 8005F4EC 0005B46C  7C 89 4C 30 */	srw r9, r4, r9
/* 8005F4F0 0005B470  7C 63 4B 78 */	or r3, r3, r9
/* 8005F4F4 0005B474  7C 84 00 30 */	slw r4, r4, r0
.L_8005F4F8:
/* 8005F4F8 0005B478  39 40 FF FF */	li r10, -0x1
/* 8005F4FC 0005B47C  30 E7 00 00 */	addic r7, r7, 0x0
.L_8005F500:
/* 8005F500 0005B480  7C 84 21 14 */	adde r4, r4, r4
/* 8005F504 0005B484  7C 63 19 14 */	adde r3, r3, r3
/* 8005F508 0005B488  7D 08 41 14 */	adde r8, r8, r8
/* 8005F50C 0005B48C  7C E7 39 14 */	adde r7, r7, r7
/* 8005F510 0005B490  7C 06 40 10 */	subfc r0, r6, r8
/* 8005F514 0005B494  7D 25 39 11 */	subfe. r9, r5, r7
/* 8005F518 0005B498  41 80 00 10 */	blt .L_8005F528
/* 8005F51C 0005B49C  7C 08 03 78 */	mr r8, r0
/* 8005F520 0005B4A0  7D 27 4B 78 */	mr r7, r9
/* 8005F524 0005B4A4  30 0A 00 01 */	addic r0, r10, 0x1
.L_8005F528:
/* 8005F528 0005B4A8  42 00 FF D8 */	bdnz .L_8005F500
/* 8005F52C 0005B4AC  7C 84 21 14 */	adde r4, r4, r4
/* 8005F530 0005B4B0  7C 63 19 14 */	adde r3, r3, r3
/* 8005F534 0005B4B4  4E 80 00 20 */	blr
.L_8005F538:
/* 8005F538 0005B4B8  38 80 00 00 */	li r4, 0x0
/* 8005F53C 0005B4BC  38 60 00 00 */	li r3, 0x0
/* 8005F540 0005B4C0  4E 80 00 20 */	blr
.endfn __div2u

.fn __div2i, global
/* 8005F544 0005B4C4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8005F548 0005B4C8  54 69 00 01 */	clrrwi. r9, r3, 31
/* 8005F54C 0005B4CC  41 82 00 0C */	beq .L_8005F558
/* 8005F550 0005B4D0  20 84 00 00 */	subfic r4, r4, 0x0
/* 8005F554 0005B4D4  7C 63 01 90 */	subfze r3, r3
.L_8005F558:
/* 8005F558 0005B4D8  91 21 00 08 */	stw r9, 0x8(r1)
/* 8005F55C 0005B4DC  54 A9 00 01 */	clrrwi. r9, r5, 31
/* 8005F560 0005B4E0  41 82 00 0C */	beq .L_8005F56C
/* 8005F564 0005B4E4  20 C6 00 00 */	subfic r6, r6, 0x0
/* 8005F568 0005B4E8  7C A5 01 90 */	subfze r5, r5
.L_8005F56C:
/* 8005F56C 0005B4EC  91 21 00 0C */	stw r9, 0xc(r1)
/* 8005F570 0005B4F0  2C 03 00 00 */	cmpwi r3, 0x0
/* 8005F574 0005B4F4  7C 60 00 34 */	cntlzw r0, r3
/* 8005F578 0005B4F8  7C 89 00 34 */	cntlzw r9, r4
/* 8005F57C 0005B4FC  40 82 00 08 */	bne .L_8005F584
/* 8005F580 0005B500  38 09 00 20 */	addi r0, r9, 0x20
.L_8005F584:
/* 8005F584 0005B504  2C 05 00 00 */	cmpwi r5, 0x0
/* 8005F588 0005B508  7C A9 00 34 */	cntlzw r9, r5
/* 8005F58C 0005B50C  7C CA 00 34 */	cntlzw r10, r6
/* 8005F590 0005B510  40 82 00 08 */	bne .L_8005F598
/* 8005F594 0005B514  39 2A 00 20 */	addi r9, r10, 0x20
.L_8005F598:
/* 8005F598 0005B518  7C 00 48 00 */	cmpw r0, r9
/* 8005F59C 0005B51C  21 40 00 40 */	subfic r10, r0, 0x40
/* 8005F5A0 0005B520  41 81 00 CC */	bgt .L_8005F66C
/* 8005F5A4 0005B524  39 29 00 01 */	addi r9, r9, 0x1
/* 8005F5A8 0005B528  21 29 00 40 */	subfic r9, r9, 0x40
/* 8005F5AC 0005B52C  7C 00 4A 14 */	add r0, r0, r9
/* 8005F5B0 0005B530  7D 29 50 50 */	subf r9, r9, r10
/* 8005F5B4 0005B534  7D 29 03 A6 */	mtctr r9
/* 8005F5B8 0005B538  2C 09 00 20 */	cmpwi r9, 0x20
/* 8005F5BC 0005B53C  38 E9 FF E0 */	addi r7, r9, -0x20
/* 8005F5C0 0005B540  41 80 00 10 */	blt .L_8005F5D0
/* 8005F5C4 0005B544  7C 68 3C 30 */	srw r8, r3, r7
/* 8005F5C8 0005B548  38 E0 00 00 */	li r7, 0x0
/* 8005F5CC 0005B54C  48 00 00 18 */	b .L_8005F5E4
.L_8005F5D0:
/* 8005F5D0 0005B550  7C 88 4C 30 */	srw r8, r4, r9
/* 8005F5D4 0005B554  20 E9 00 20 */	subfic r7, r9, 0x20
/* 8005F5D8 0005B558  7C 67 38 30 */	slw r7, r3, r7
/* 8005F5DC 0005B55C  7D 08 3B 78 */	or r8, r8, r7
/* 8005F5E0 0005B560  7C 67 4C 30 */	srw r7, r3, r9
.L_8005F5E4:
/* 8005F5E4 0005B564  2C 00 00 20 */	cmpwi r0, 0x20
/* 8005F5E8 0005B568  31 20 FF E0 */	addic r9, r0, -0x20
/* 8005F5EC 0005B56C  41 80 00 10 */	blt .L_8005F5FC
/* 8005F5F0 0005B570  7C 83 48 30 */	slw r3, r4, r9
/* 8005F5F4 0005B574  38 80 00 00 */	li r4, 0x0
/* 8005F5F8 0005B578  48 00 00 18 */	b .L_8005F610
.L_8005F5FC:
/* 8005F5FC 0005B57C  7C 63 00 30 */	slw r3, r3, r0
/* 8005F600 0005B580  21 20 00 20 */	subfic r9, r0, 0x20
/* 8005F604 0005B584  7C 89 4C 30 */	srw r9, r4, r9
/* 8005F608 0005B588  7C 63 4B 78 */	or r3, r3, r9
/* 8005F60C 0005B58C  7C 84 00 30 */	slw r4, r4, r0
.L_8005F610:
/* 8005F610 0005B590  39 40 FF FF */	li r10, -0x1
/* 8005F614 0005B594  30 E7 00 00 */	addic r7, r7, 0x0
.L_8005F618:
/* 8005F618 0005B598  7C 84 21 14 */	adde r4, r4, r4
/* 8005F61C 0005B59C  7C 63 19 14 */	adde r3, r3, r3
/* 8005F620 0005B5A0  7D 08 41 14 */	adde r8, r8, r8
/* 8005F624 0005B5A4  7C E7 39 14 */	adde r7, r7, r7
/* 8005F628 0005B5A8  7C 06 40 10 */	subfc r0, r6, r8
/* 8005F62C 0005B5AC  7D 25 39 11 */	subfe. r9, r5, r7
/* 8005F630 0005B5B0  41 80 00 10 */	blt .L_8005F640
/* 8005F634 0005B5B4  7C 08 03 78 */	mr r8, r0
/* 8005F638 0005B5B8  7D 27 4B 78 */	mr r7, r9
/* 8005F63C 0005B5BC  30 0A 00 01 */	addic r0, r10, 0x1
.L_8005F640:
/* 8005F640 0005B5C0  42 00 FF D8 */	bdnz .L_8005F618
/* 8005F644 0005B5C4  7C 84 21 14 */	adde r4, r4, r4
/* 8005F648 0005B5C8  7C 63 19 14 */	adde r3, r3, r3
/* 8005F64C 0005B5CC  81 21 00 08 */	lwz r9, 0x8(r1)
/* 8005F650 0005B5D0  81 41 00 0C */	lwz r10, 0xc(r1)
/* 8005F654 0005B5D4  7D 27 52 79 */	xor. r7, r9, r10
/* 8005F658 0005B5D8  41 82 00 10 */	beq .L_8005F668
/* 8005F65C 0005B5DC  2C 09 00 00 */	cmpwi r9, 0x0
/* 8005F660 0005B5E0  20 84 00 00 */	subfic r4, r4, 0x0
/* 8005F664 0005B5E4  7C 63 01 90 */	subfze r3, r3
.L_8005F668:
/* 8005F668 0005B5E8  48 00 00 0C */	b .L_8005F674
.L_8005F66C:
/* 8005F66C 0005B5EC  38 80 00 00 */	li r4, 0x0
/* 8005F670 0005B5F0  38 60 00 00 */	li r3, 0x0
.L_8005F674:
/* 8005F674 0005B5F4  38 21 00 10 */	addi r1, r1, 0x10
/* 8005F678 0005B5F8  4E 80 00 20 */	blr
.endfn __div2i

.fn __mod2u, global
/* 8005F67C 0005B5FC  2C 03 00 00 */	cmpwi r3, 0x0
/* 8005F680 0005B600  7C 60 00 34 */	cntlzw r0, r3
/* 8005F684 0005B604  7C 89 00 34 */	cntlzw r9, r4
/* 8005F688 0005B608  40 82 00 08 */	bne .L_8005F690
/* 8005F68C 0005B60C  38 09 00 20 */	addi r0, r9, 0x20
.L_8005F690:
/* 8005F690 0005B610  2C 05 00 00 */	cmpwi r5, 0x0
/* 8005F694 0005B614  7C A9 00 34 */	cntlzw r9, r5
/* 8005F698 0005B618  7C CA 00 34 */	cntlzw r10, r6
/* 8005F69C 0005B61C  40 82 00 08 */	bne .L_8005F6A4
/* 8005F6A0 0005B620  39 2A 00 20 */	addi r9, r10, 0x20
.L_8005F6A4:
/* 8005F6A4 0005B624  7C 00 48 00 */	cmpw r0, r9
/* 8005F6A8 0005B628  21 40 00 40 */	subfic r10, r0, 0x40
/* 8005F6AC 0005B62C  41 81 00 B0 */	bgt .L_8005F75C
/* 8005F6B0 0005B630  39 29 00 01 */	addi r9, r9, 0x1
/* 8005F6B4 0005B634  21 29 00 40 */	subfic r9, r9, 0x40
/* 8005F6B8 0005B638  7C 00 4A 14 */	add r0, r0, r9
/* 8005F6BC 0005B63C  7D 29 50 50 */	subf r9, r9, r10
/* 8005F6C0 0005B640  7D 29 03 A6 */	mtctr r9
/* 8005F6C4 0005B644  2C 09 00 20 */	cmpwi r9, 0x20
/* 8005F6C8 0005B648  38 E9 FF E0 */	addi r7, r9, -0x20
/* 8005F6CC 0005B64C  41 80 00 10 */	blt .L_8005F6DC
/* 8005F6D0 0005B650  7C 68 3C 30 */	srw r8, r3, r7
/* 8005F6D4 0005B654  38 E0 00 00 */	li r7, 0x0
/* 8005F6D8 0005B658  48 00 00 18 */	b .L_8005F6F0
.L_8005F6DC:
/* 8005F6DC 0005B65C  7C 88 4C 30 */	srw r8, r4, r9
/* 8005F6E0 0005B660  20 E9 00 20 */	subfic r7, r9, 0x20
/* 8005F6E4 0005B664  7C 67 38 30 */	slw r7, r3, r7
/* 8005F6E8 0005B668  7D 08 3B 78 */	or r8, r8, r7
/* 8005F6EC 0005B66C  7C 67 4C 30 */	srw r7, r3, r9
.L_8005F6F0:
/* 8005F6F0 0005B670  2C 00 00 20 */	cmpwi r0, 0x20
/* 8005F6F4 0005B674  31 20 FF E0 */	addic r9, r0, -0x20
/* 8005F6F8 0005B678  41 80 00 10 */	blt .L_8005F708
/* 8005F6FC 0005B67C  7C 83 48 30 */	slw r3, r4, r9
/* 8005F700 0005B680  38 80 00 00 */	li r4, 0x0
/* 8005F704 0005B684  48 00 00 18 */	b .L_8005F71C
.L_8005F708:
/* 8005F708 0005B688  7C 63 00 30 */	slw r3, r3, r0
/* 8005F70C 0005B68C  21 20 00 20 */	subfic r9, r0, 0x20
/* 8005F710 0005B690  7C 89 4C 30 */	srw r9, r4, r9
/* 8005F714 0005B694  7C 63 4B 78 */	or r3, r3, r9
/* 8005F718 0005B698  7C 84 00 30 */	slw r4, r4, r0
.L_8005F71C:
/* 8005F71C 0005B69C  39 40 FF FF */	li r10, -0x1
/* 8005F720 0005B6A0  30 E7 00 00 */	addic r7, r7, 0x0
.L_8005F724:
/* 8005F724 0005B6A4  7C 84 21 14 */	adde r4, r4, r4
/* 8005F728 0005B6A8  7C 63 19 14 */	adde r3, r3, r3
/* 8005F72C 0005B6AC  7D 08 41 14 */	adde r8, r8, r8
/* 8005F730 0005B6B0  7C E7 39 14 */	adde r7, r7, r7
/* 8005F734 0005B6B4  7C 06 40 10 */	subfc r0, r6, r8
/* 8005F738 0005B6B8  7D 25 39 11 */	subfe. r9, r5, r7
/* 8005F73C 0005B6BC  41 80 00 10 */	blt .L_8005F74C
/* 8005F740 0005B6C0  7C 08 03 78 */	mr r8, r0
/* 8005F744 0005B6C4  7D 27 4B 78 */	mr r7, r9
/* 8005F748 0005B6C8  30 0A 00 01 */	addic r0, r10, 0x1
.L_8005F74C:
/* 8005F74C 0005B6CC  42 00 FF D8 */	bdnz .L_8005F724
/* 8005F750 0005B6D0  7D 04 43 78 */	mr r4, r8
/* 8005F754 0005B6D4  7C E3 3B 78 */	mr r3, r7
/* 8005F758 0005B6D8  4E 80 00 20 */	blr
.L_8005F75C:
/* 8005F75C 0005B6DC  4E 80 00 20 */	blr
.endfn __mod2u

.fn __shl2i, global
/* 8005F760 0005B6E0  21 05 00 20 */	subfic r8, r5, 0x20
/* 8005F764 0005B6E4  31 25 FF E0 */	addic r9, r5, -0x20
/* 8005F768 0005B6E8  7C 63 28 30 */	slw r3, r3, r5
/* 8005F76C 0005B6EC  7C 8A 44 30 */	srw r10, r4, r8
/* 8005F770 0005B6F0  7C 63 53 78 */	or r3, r3, r10
/* 8005F774 0005B6F4  7C 8A 48 30 */	slw r10, r4, r9
/* 8005F778 0005B6F8  7C 63 53 78 */	or r3, r3, r10
/* 8005F77C 0005B6FC  7C 84 28 30 */	slw r4, r4, r5
/* 8005F780 0005B700  4E 80 00 20 */	blr
.endfn __shl2i

.fn __shr2u, global
/* 8005F784 0005B704  21 05 00 20 */	subfic r8, r5, 0x20
/* 8005F788 0005B708  31 25 FF E0 */	addic r9, r5, -0x20
/* 8005F78C 0005B70C  7C 84 2C 30 */	srw r4, r4, r5
/* 8005F790 0005B710  7C 6A 40 30 */	slw r10, r3, r8
/* 8005F794 0005B714  7C 84 53 78 */	or r4, r4, r10
/* 8005F798 0005B718  7C 6A 4C 30 */	srw r10, r3, r9
/* 8005F79C 0005B71C  7C 84 53 78 */	or r4, r4, r10
/* 8005F7A0 0005B720  7C 63 2C 30 */	srw r3, r3, r5
/* 8005F7A4 0005B724  4E 80 00 20 */	blr
.endfn __shr2u

.fn __shr2i, global
/* 8005F7A8 0005B728  21 05 00 20 */	subfic r8, r5, 0x20
/* 8005F7AC 0005B72C  35 25 FF E0 */	addic. r9, r5, -0x20
/* 8005F7B0 0005B730  7C 84 2C 30 */	srw r4, r4, r5
/* 8005F7B4 0005B734  7C 6A 40 30 */	slw r10, r3, r8
/* 8005F7B8 0005B738  7C 84 53 78 */	or r4, r4, r10
/* 8005F7BC 0005B73C  7C 6A 4E 30 */	sraw r10, r3, r9
/* 8005F7C0 0005B740  40 81 00 08 */	ble .L_8005F7C8
/* 8005F7C4 0005B744  7C 84 53 78 */	or r4, r4, r10
.L_8005F7C8:
/* 8005F7C8 0005B748  7C 63 2E 30 */	sraw r3, r3, r5
/* 8005F7CC 0005B74C  4E 80 00 20 */	blr
.endfn __shr2i

.fn __cvt_sll_flt, global
/* 8005F7D0 0005B750  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8005F7D4 0005B754  54 65 00 01 */	clrrwi. r5, r3, 31
/* 8005F7D8 0005B758  41 82 00 0C */	beq .L_8005F7E4
/* 8005F7DC 0005B75C  20 84 00 00 */	subfic r4, r4, 0x0
/* 8005F7E0 0005B760  7C 63 01 90 */	subfze r3, r3
.L_8005F7E4:
/* 8005F7E4 0005B764  7C 67 23 79 */	or. r7, r3, r4
/* 8005F7E8 0005B768  38 C0 00 00 */	li r6, 0x0
/* 8005F7EC 0005B76C  41 82 00 80 */	beq .L_8005F86C
/* 8005F7F0 0005B770  7C 67 00 34 */	cntlzw r7, r3
/* 8005F7F4 0005B774  7C 88 00 34 */	cntlzw r8, r4
/* 8005F7F8 0005B778  54 E9 D0 08 */	extlwi r9, r7, 5, 26
/* 8005F7FC 0005B77C  7D 29 FE 70 */	srawi r9, r9, 31
/* 8005F800 0005B780  7D 29 40 38 */	and r9, r9, r8
/* 8005F804 0005B784  7C E7 4A 14 */	add r7, r7, r9
/* 8005F808 0005B788  21 07 00 20 */	subfic r8, r7, 0x20
/* 8005F80C 0005B78C  31 27 FF E0 */	addic r9, r7, -0x20
/* 8005F810 0005B790  7C 63 38 30 */	slw r3, r3, r7
/* 8005F814 0005B794  7C 8A 44 30 */	srw r10, r4, r8
/* 8005F818 0005B798  7C 63 53 78 */	or r3, r3, r10
/* 8005F81C 0005B79C  7C 8A 48 30 */	slw r10, r4, r9
/* 8005F820 0005B7A0  7C 63 53 78 */	or r3, r3, r10
/* 8005F824 0005B7A4  7C 84 38 30 */	slw r4, r4, r7
/* 8005F828 0005B7A8  7C C7 30 50 */	subf r6, r7, r6
/* 8005F82C 0005B7AC  54 87 05 7E */	clrlwi r7, r4, 21
/* 8005F830 0005B7B0  2C 07 04 00 */	cmpwi r7, 0x400
/* 8005F834 0005B7B4  38 C6 04 3E */	addi r6, r6, 0x43e
/* 8005F838 0005B7B8  41 80 00 1C */	blt .L_8005F854
/* 8005F83C 0005B7BC  41 81 00 0C */	bgt .L_8005F848
/* 8005F840 0005B7C0  54 87 05 29 */	rlwinm. r7, r4, 0, 20, 20
/* 8005F844 0005B7C4  41 82 00 10 */	beq .L_8005F854
.L_8005F848:
/* 8005F848 0005B7C8  30 84 08 00 */	addic r4, r4, 0x800
/* 8005F84C 0005B7CC  7C 63 01 94 */	addze r3, r3
/* 8005F850 0005B7D0  7C C6 01 94 */	addze r6, r6
.L_8005F854:
/* 8005F854 0005B7D4  54 84 A8 3E */	rotrwi r4, r4, 11
/* 8005F858 0005B7D8  50 64 A8 14 */	rlwimi r4, r3, 21, 0, 10
/* 8005F85C 0005B7DC  54 63 AB 3E */	extrwi r3, r3, 20, 1
/* 8005F860 0005B7E0  54 C6 A0 16 */	slwi r6, r6, 20
/* 8005F864 0005B7E4  7C C3 1B 78 */	or r3, r6, r3
/* 8005F868 0005B7E8  7C A3 1B 78 */	or r3, r5, r3
.L_8005F86C:
/* 8005F86C 0005B7EC  90 61 00 08 */	stw r3, 0x8(r1)
/* 8005F870 0005B7F0  90 81 00 0C */	stw r4, 0xc(r1)
/* 8005F874 0005B7F4  C8 21 00 08 */	lfd f1, 0x8(r1)
/* 8005F878 0005B7F8  FC 20 08 18 */	frsp f1, f1
/* 8005F87C 0005B7FC  38 21 00 10 */	addi r1, r1, 0x10
/* 8005F880 0005B800  4E 80 00 20 */	blr
.endfn __cvt_sll_flt

.fn __cvt_dbl_usll, global
/* 8005F884 0005B804  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8005F888 0005B808  D8 21 00 08 */	stfd f1, 0x8(r1)
/* 8005F88C 0005B80C  80 61 00 08 */	lwz r3, 0x8(r1)
/* 8005F890 0005B810  80 81 00 0C */	lwz r4, 0xc(r1)
/* 8005F894 0005B814  54 65 65 7E */	extrwi r5, r3, 11, 1
/* 8005F898 0005B818  28 05 03 FF */	cmplwi r5, 0x3ff
/* 8005F89C 0005B81C  40 80 00 10 */	bge .L_8005F8AC
/* 8005F8A0 0005B820  38 60 00 00 */	li r3, 0x0
/* 8005F8A4 0005B824  38 80 00 00 */	li r4, 0x0
/* 8005F8A8 0005B828  48 00 00 A0 */	b .L_8005F948
.L_8005F8AC:
/* 8005F8AC 0005B82C  7C 66 1B 78 */	mr r6, r3
/* 8005F8B0 0005B830  54 63 03 3E */	clrlwi r3, r3, 12
/* 8005F8B4 0005B834  64 63 00 10 */	oris r3, r3, 0x10
/* 8005F8B8 0005B838  38 A5 FB CD */	addi r5, r5, -0x433
/* 8005F8BC 0005B83C  2C 05 00 00 */	cmpwi r5, 0x0
/* 8005F8C0 0005B840  40 80 00 2C */	bge .L_8005F8EC
/* 8005F8C4 0005B844  7C A5 00 D0 */	neg r5, r5
/* 8005F8C8 0005B848  21 05 00 20 */	subfic r8, r5, 0x20
/* 8005F8CC 0005B84C  31 25 FF E0 */	addic r9, r5, -0x20
/* 8005F8D0 0005B850  7C 84 2C 30 */	srw r4, r4, r5
/* 8005F8D4 0005B854  7C 6A 40 30 */	slw r10, r3, r8
/* 8005F8D8 0005B858  7C 84 53 78 */	or r4, r4, r10
/* 8005F8DC 0005B85C  7C 6A 4C 30 */	srw r10, r3, r9
/* 8005F8E0 0005B860  7C 84 53 78 */	or r4, r4, r10
/* 8005F8E4 0005B864  7C 63 2C 30 */	srw r3, r3, r5
/* 8005F8E8 0005B868  48 00 00 50 */	b .L_8005F938
.L_8005F8EC:
/* 8005F8EC 0005B86C  2C 05 00 0A */	cmpwi r5, 0xa
/* 8005F8F0 0005B870  40 A1 00 28 */	ble+ .L_8005F918
/* 8005F8F4 0005B874  54 C6 00 01 */	clrrwi. r6, r6, 31
/* 8005F8F8 0005B878  41 82 00 10 */	beq .L_8005F908
/* 8005F8FC 0005B87C  3C 60 80 00 */	lis r3, 0x8000
/* 8005F900 0005B880  38 80 00 00 */	li r4, 0x0
/* 8005F904 0005B884  48 00 00 44 */	b .L_8005F948
.L_8005F908:
/* 8005F908 0005B888  3C 60 7F FF */	lis r3, 0x7fff
/* 8005F90C 0005B88C  60 63 FF FF */	ori r3, r3, 0xffff
/* 8005F910 0005B890  38 80 FF FF */	li r4, -0x1
/* 8005F914 0005B894  48 00 00 34 */	b .L_8005F948
.L_8005F918:
/* 8005F918 0005B898  21 05 00 20 */	subfic r8, r5, 0x20
/* 8005F91C 0005B89C  31 25 FF E0 */	addic r9, r5, -0x20
/* 8005F920 0005B8A0  7C 63 28 30 */	slw r3, r3, r5
/* 8005F924 0005B8A4  7C 8A 44 30 */	srw r10, r4, r8
/* 8005F928 0005B8A8  7C 63 53 78 */	or r3, r3, r10
/* 8005F92C 0005B8AC  7C 8A 48 30 */	slw r10, r4, r9
/* 8005F930 0005B8B0  7C 63 53 78 */	or r3, r3, r10
/* 8005F934 0005B8B4  7C 84 28 30 */	slw r4, r4, r5
.L_8005F938:
/* 8005F938 0005B8B8  54 C6 00 01 */	clrrwi. r6, r6, 31
/* 8005F93C 0005B8BC  41 82 00 0C */	beq .L_8005F948
/* 8005F940 0005B8C0  20 84 00 00 */	subfic r4, r4, 0x0
/* 8005F944 0005B8C4  7C 63 01 90 */	subfze r3, r3
.L_8005F948:
/* 8005F948 0005B8C8  38 21 00 10 */	addi r1, r1, 0x10
/* 8005F94C 0005B8CC  4E 80 00 20 */	blr
.endfn __cvt_dbl_usll

.section .rodata, "wa"  # 0x80063D20 - 0x80065000

.obj __constants, local
	.4byte 0
	.4byte 0
	.4byte 0x41F00000
	.4byte 0
	.4byte 0x41E00000
	.4byte 0
.endobj __constants
