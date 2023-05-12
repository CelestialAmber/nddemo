.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740


.fn streamInit, global
/* 800482D0 00044250  38 80 00 00 */	li r4, 0x0
/* 800482D4 00044254  38 00 00 03 */	li r0, 0x3
/* 800482D8 00044258  98 8D 87 70 */	stb r4, streamCallCnt@sda21(r13)
/* 800482DC 0004425C  3C 60 80 09 */	lis r3, synthInfo@ha
/* 800482E0 00044260  38 63 EC 38 */	addi r3, r3, synthInfo@l
/* 800482E4 00044264  98 0D 87 71 */	stb r0, streamCallDelay@sda21(r13)
/* 800482E8 00044268  38 C3 02 10 */	addi r6, r3, 0x210
/* 800482EC 0004426C  88 63 02 10 */	lbz r3, 0x210(r3)
/* 800482F0 00044270  38 E0 00 00 */	li r7, 0x0
/* 800482F4 00044274  2C 03 00 00 */	cmpwi r3, 0x0
/* 800482F8 00044278  40 81 00 7C */	ble .L_80048374
/* 800482FC 0004427C  2C 03 00 08 */	cmpwi r3, 0x8
/* 80048300 00044280  38 A3 FF F8 */	addi r5, r3, -0x8
/* 80048304 00044284  40 81 00 7C */	ble .L_80048380
/* 80048308 00044288  38 05 00 07 */	addi r0, r5, 0x7
/* 8004830C 0004428C  54 00 E8 FE */	srwi r0, r0, 3
/* 80048310 00044290  3C 60 80 09 */	lis r3, streamInfo@ha
/* 80048314 00044294  7C 09 03 A6 */	mtctr r0
/* 80048318 00044298  2C 05 00 00 */	cmpwi r5, 0x0
/* 8004831C 0004429C  38 63 F9 90 */	addi r3, r3, streamInfo@l
/* 80048320 000442A0  40 81 00 60 */	ble .L_80048380
.L_80048324:
/* 80048324 000442A4  98 83 00 08 */	stb r4, 0x8(r3)
/* 80048328 000442A8  38 E7 00 08 */	addi r7, r7, 0x8
/* 8004832C 000442AC  98 83 00 68 */	stb r4, 0x68(r3)
/* 80048330 000442B0  98 83 00 C8 */	stb r4, 0xc8(r3)
/* 80048334 000442B4  98 83 01 28 */	stb r4, 0x128(r3)
/* 80048338 000442B8  98 83 01 88 */	stb r4, 0x188(r3)
/* 8004833C 000442BC  98 83 01 E8 */	stb r4, 0x1e8(r3)
/* 80048340 000442C0  98 83 02 48 */	stb r4, 0x248(r3)
/* 80048344 000442C4  98 83 02 A8 */	stb r4, 0x2a8(r3)
/* 80048348 000442C8  38 63 03 00 */	addi r3, r3, 0x300
/* 8004834C 000442CC  42 00 FF D8 */	bdnz .L_80048324
/* 80048350 000442D0  48 00 00 30 */	b .L_80048380
.L_80048354:
/* 80048354 000442D4  7C 07 28 50 */	subf r0, r7, r5
/* 80048358 000442D8  7C 07 28 00 */	cmpw r7, r5
/* 8004835C 000442DC  7C 09 03 A6 */	mtctr r0
/* 80048360 000442E0  38 00 00 00 */	li r0, 0x0
/* 80048364 000442E4  40 80 00 10 */	bge .L_80048374
.L_80048368:
/* 80048368 000442E8  98 03 00 08 */	stb r0, 0x8(r3)
/* 8004836C 000442EC  38 63 00 60 */	addi r3, r3, 0x60
/* 80048370 000442F0  42 00 FF F8 */	bdnz .L_80048368
.L_80048374:
/* 80048374 000442F4  38 00 00 00 */	li r0, 0x0
/* 80048378 000442F8  90 0D 87 74 */	stw r0, nextPublicID@sda21(r13)
/* 8004837C 000442FC  4E 80 00 20 */	blr
.L_80048380:
/* 80048380 00044300  1C 87 00 60 */	mulli r4, r7, 0x60
/* 80048384 00044304  88 A6 00 00 */	lbz r5, 0x0(r6)
/* 80048388 00044308  3C 60 80 09 */	lis r3, streamInfo@ha
/* 8004838C 0004430C  38 03 F9 90 */	addi r0, r3, streamInfo@l
/* 80048390 00044310  7C 60 22 14 */	add r3, r0, r4
/* 80048394 00044314  4B FF FF C0 */	b .L_80048354
/* 80048398 00044318  4E 80 00 20 */	blr
.endfn streamInit

.fn streamHandle, global
/* 8004839C 0004431C  7C 08 02 A6 */	mflr r0
/* 800483A0 00044320  90 01 00 04 */	stw r0, 0x4(r1)
/* 800483A4 00044324  94 21 FF 70 */	stwu r1, -0x90(r1)
/* 800483A8 00044328  DB E1 00 88 */	stfd f31, 0x88(r1)
/* 800483AC 0004432C  DB C1 00 80 */	stfd f30, 0x80(r1)
/* 800483B0 00044330  DB A1 00 78 */	stfd f29, 0x78(r1)
/* 800483B4 00044334  BF 01 00 58 */	stmw r24, 0x58(r1)
/* 800483B8 00044338  88 6D 87 70 */	lbz r3, streamCallCnt@sda21(r13)
/* 800483BC 0004433C  28 03 00 00 */	cmplwi r3, 0x0
/* 800483C0 00044340  41 82 00 10 */	beq .L_800483D0
/* 800483C4 00044344  38 03 FF FF */	addi r0, r3, -0x1
/* 800483C8 00044348  98 0D 87 70 */	stb r0, streamCallCnt@sda21(r13)
/* 800483CC 0004434C  48 00 06 DC */	b .L_80048AA8
.L_800483D0:
/* 800483D0 00044350  88 AD 87 71 */	lbz r5, streamCallDelay@sda21(r13)
/* 800483D4 00044354  3C 60 80 09 */	lis r3, streamInfo@ha
/* 800483D8 00044358  38 03 F9 90 */	addi r0, r3, streamInfo@l
/* 800483DC 0004435C  CB A2 86 20 */	lfd f29, lbl_800A99A0@sda21(r2)
/* 800483E0 00044360  3C 60 24 92 */	lis r3, 0x2492
/* 800483E4 00044364  3C 80 80 09 */	lis r4, synthInfo@ha
/* 800483E8 00044368  98 AD 87 70 */	stb r5, streamCallCnt@sda21(r13)
/* 800483EC 0004436C  C3 C2 86 18 */	lfs f30, float_800A9998@sda21(r2)
/* 800483F0 00044370  7C 1A 03 78 */	mr r26, r0
/* 800483F4 00044374  C3 E2 86 1C */	lfs f31, float_800A999C@sda21(r2)
/* 800483F8 00044378  3B E3 49 25 */	addi r31, r3, 0x4925
/* 800483FC 0004437C  3B C4 EC 38 */	addi r30, r4, synthInfo@l
/* 80048400 00044380  3B 60 00 00 */	li r27, 0x0
/* 80048404 00044384  3F 80 00 01 */	lis r28, 0x1
/* 80048408 00044388  3F A0 43 30 */	lis r29, 0x4330
/* 8004840C 0004438C  48 00 06 90 */	b .L_80048A9C
.L_80048410:
/* 80048410 00044390  88 1A 00 08 */	lbz r0, 0x8(r26)
/* 80048414 00044394  2C 00 00 02 */	cmpwi r0, 0x2
/* 80048418 00044398  41 82 01 A0 */	beq .L_800485B8
/* 8004841C 0004439C  40 80 06 78 */	bge .L_80048A94
/* 80048420 000443A0  2C 00 00 01 */	cmpwi r0, 0x1
/* 80048424 000443A4  40 80 00 08 */	bge .L_8004842C
/* 80048428 000443A8  48 00 06 6C */	b .L_80048A94
.L_8004842C:
/* 8004842C 000443AC  80 1A 00 50 */	lwz r0, 0x50(r26)
/* 80048430 000443B0  64 00 40 00 */	oris r0, r0, 0x4000
/* 80048434 000443B4  90 01 00 08 */	stw r0, 0x8(r1)
/* 80048438 000443B8  88 7A 00 5B */	lbz r3, 0x5b(r26)
/* 8004843C 000443BC  48 00 FE 19 */	bl hwGetStreamPlayBuffer
/* 80048440 000443C0  90 61 00 0C */	stw r3, 0xc(r1)
/* 80048444 000443C4  38 60 00 00 */	li r3, 0x0
/* 80048448 000443C8  38 80 00 01 */	li r4, 0x1
/* 8004844C 000443CC  90 61 00 14 */	stw r3, 0x14(r1)
/* 80048450 000443D0  80 1A 00 14 */	lwz r0, 0x14(r26)
/* 80048454 000443D4  90 01 00 18 */	stw r0, 0x18(r1)
/* 80048458 000443D8  90 61 00 1C */	stw r3, 0x1c(r1)
/* 8004845C 000443DC  80 1A 00 14 */	lwz r0, 0x14(r26)
/* 80048460 000443E0  90 01 00 20 */	stw r0, 0x20(r1)
/* 80048464 000443E4  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 80048468 000443E8  88 03 00 00 */	lbz r0, 0x0(r3)
/* 8004846C 000443EC  98 1A 00 22 */	stb r0, 0x22(r26)
/* 80048470 000443F0  98 1A 00 23 */	stb r0, 0x23(r26)
/* 80048474 000443F4  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 80048478 000443F8  4B FE 0A 9D */	bl DCInvalidateRange
/* 8004847C 000443FC  88 1A 00 09 */	lbz r0, 0x9(r26)
/* 80048480 00044400  2C 00 00 01 */	cmpwi r0, 0x1
/* 80048484 00044404  41 82 00 20 */	beq .L_800484A4
/* 80048488 00044408  40 80 00 2C */	bge .L_800484B4
/* 8004848C 0004440C  2C 00 00 00 */	cmpwi r0, 0x0
/* 80048490 00044410  40 80 00 08 */	bge .L_80048498
/* 80048494 00044414  48 00 00 20 */	b .L_800484B4
.L_80048498:
/* 80048498 00044418  38 00 00 02 */	li r0, 0x2
/* 8004849C 0004441C  98 01 00 24 */	stb r0, 0x24(r1)
/* 800484A0 00044420  48 00 00 14 */	b .L_800484B4
.L_800484A4:
/* 800484A4 00044424  38 1A 00 20 */	addi r0, r26, 0x20
/* 800484A8 00044428  90 01 00 10 */	stw r0, 0x10(r1)
/* 800484AC 0004442C  38 00 00 04 */	li r0, 0x4
/* 800484B0 00044430  98 01 00 24 */	stb r0, 0x24(r1)
.L_800484B4:
/* 800484B4 00044434  80 7A 00 48 */	lwz r3, 0x48(r26)
/* 800484B8 00044438  38 9C FF FF */	addi r4, r28, -0x1
/* 800484BC 0004443C  38 A1 00 08 */	addi r5, r1, 0x8
/* 800484C0 00044440  38 C0 00 01 */	li r6, 0x1
/* 800484C4 00044444  38 E0 FF FF */	li r7, -0x1
/* 800484C8 00044448  39 00 FF FF */	li r8, -0x1
/* 800484CC 0004444C  39 20 00 01 */	li r9, 0x1
/* 800484D0 00044450  39 40 00 01 */	li r10, 0x1
/* 800484D4 00044454  48 00 F2 DD */	bl hwInitSamplePlayback
/* 800484D8 00044458  80 7A 00 50 */	lwz r3, 0x50(r26)
/* 800484DC 0004445C  80 1E 00 00 */	lwz r0, 0x0(r30)
/* 800484E0 00044460  90 61 00 54 */	stw r3, 0x54(r1)
/* 800484E4 00044464  80 7A 00 48 */	lwz r3, 0x48(r26)
/* 800484E8 00044468  90 01 00 4C */	stw r0, 0x4c(r1)
/* 800484EC 0004446C  93 A1 00 50 */	stw r29, 0x50(r1)
/* 800484F0 00044470  93 A1 00 48 */	stw r29, 0x48(r1)
/* 800484F4 00044474  C8 21 00 50 */	lfd f1, 0x50(r1)
/* 800484F8 00044478  C8 01 00 48 */	lfd f0, 0x48(r1)
/* 800484FC 0004447C  EC 21 E8 28 */	fsubs f1, f1, f29
/* 80048500 00044480  EC 00 E8 28 */	fsubs f0, f0, f29
/* 80048504 00044484  EC 01 00 24 */	fdivs f0, f1, f0
/* 80048508 00044488  EC 1E 00 32 */	fmuls f0, f30, f0
/* 8004850C 0004448C  FC 00 00 1E */	fctiwz f0, f0
/* 80048510 00044490  D8 01 00 40 */	stfd f0, 0x40(r1)
/* 80048514 00044494  80 81 00 44 */	lwz r4, 0x44(r1)
/* 80048518 00044498  48 00 F7 11 */	bl hwSetPitch
/* 8004851C 0004449C  88 BA 00 55 */	lbz r5, 0x55(r26)
/* 80048520 000444A0  38 80 00 00 */	li r4, 0x0
/* 80048524 000444A4  88 7A 00 58 */	lbz r3, 0x58(r26)
/* 80048528 000444A8  88 1A 00 59 */	lbz r0, 0x59(r26)
/* 8004852C 000444AC  90 A1 00 3C */	stw r5, 0x3c(r1)
/* 80048530 000444B0  88 BA 00 56 */	lbz r5, 0x56(r26)
/* 80048534 000444B4  90 61 00 34 */	stw r3, 0x34(r1)
/* 80048538 000444B8  88 DA 00 57 */	lbz r6, 0x57(r26)
/* 8004853C 000444BC  54 A5 80 1E */	slwi r5, r5, 16
/* 80048540 000444C0  90 01 00 2C */	stw r0, 0x2c(r1)
/* 80048544 000444C4  80 7A 00 48 */	lwz r3, 0x48(r26)
/* 80048548 000444C8  54 C6 80 1E */	slwi r6, r6, 16
/* 8004854C 000444CC  93 A1 00 38 */	stw r29, 0x38(r1)
/* 80048550 000444D0  93 A1 00 30 */	stw r29, 0x30(r1)
/* 80048554 000444D4  C8 01 00 38 */	lfd f0, 0x38(r1)
/* 80048558 000444D8  93 A1 00 28 */	stw r29, 0x28(r1)
/* 8004855C 000444DC  C8 21 00 30 */	lfd f1, 0x30(r1)
/* 80048560 000444E0  EC 60 E8 28 */	fsubs f3, f0, f29
/* 80048564 000444E4  C8 01 00 28 */	lfd f0, 0x28(r1)
/* 80048568 000444E8  EC 41 E8 28 */	fsubs f2, f1, f29
/* 8004856C 000444EC  EC 00 E8 28 */	fsubs f0, f0, f29
/* 80048570 000444F0  EC 3F 00 F2 */	fmuls f1, f31, f3
/* 80048574 000444F4  EC 5F 00 B2 */	fmuls f2, f31, f2
/* 80048578 000444F8  EC 7F 00 32 */	fmuls f3, f31, f0
/* 8004857C 000444FC  48 00 F7 D9 */	bl hwSetVolume
/* 80048580 00044500  80 7A 00 48 */	lwz r3, 0x48(r26)
/* 80048584 00044504  88 9A 00 5A */	lbz r4, 0x5a(r26)
/* 80048588 00044508  48 00 F6 3D */	bl hwStart
/* 8004858C 0004450C  38 00 00 02 */	li r0, 0x2
/* 80048590 00044510  98 1A 00 08 */	stb r0, 0x8(r26)
/* 80048594 00044514  80 1A 00 04 */	lwz r0, 0x4(r26)
/* 80048598 00044518  54 00 03 9D */	rlwinm. r0, r0, 0, 14, 14
/* 8004859C 0004451C  40 82 04 F8 */	bne .L_80048A94
/* 800485A0 00044520  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 800485A4 00044524  38 80 00 00 */	li r4, 0x0
/* 800485A8 00044528  80 BA 00 18 */	lwz r5, 0x18(r26)
/* 800485AC 0004452C  88 DA 00 5B */	lbz r6, 0x5b(r26)
/* 800485B0 00044530  48 00 FC 15 */	bl hwFlushStream
/* 800485B4 00044534  48 00 04 E0 */	b .L_80048A94
.L_800485B8:
/* 800485B8 00044538  80 7A 00 48 */	lwz r3, 0x48(r26)
/* 800485BC 0004453C  48 00 FB 65 */	bl hwGetPos
/* 800485C0 00044540  88 9A 00 09 */	lbz r4, 0x9(r26)
/* 800485C4 00044544  38 C3 00 00 */	addi r6, r3, 0x0
/* 800485C8 00044548  28 04 00 01 */	cmplwi r4, 0x1
/* 800485CC 0004454C  40 82 00 1C */	bne .L_800485E8
/* 800485D0 00044550  7C 7F 30 16 */	mulhwu r3, r31, r6
/* 800485D4 00044554  7C 03 30 50 */	subf r0, r3, r6
/* 800485D8 00044558  54 00 F8 7E */	srwi r0, r0, 1
/* 800485DC 0004455C  7C 00 1A 14 */	add r0, r0, r3
/* 800485E0 00044560  54 00 E8 FE */	srwi r0, r0, 3
/* 800485E4 00044564  1C C0 00 0E */	mulli r6, r0, 0xe
.L_800485E8:
/* 800485E8 00044568  80 1A 00 1C */	lwz r0, 0x1c(r26)
/* 800485EC 0004456C  7C 00 30 40 */	cmplw r0, r6
/* 800485F0 00044570  41 82 04 A4 */	beq .L_80048A94
/* 800485F4 00044574  40 80 01 88 */	bge .L_8004877C
/* 800485F8 00044578  2C 04 00 01 */	cmpwi r4, 0x1
/* 800485FC 0004457C  41 82 00 B8 */	beq .L_800486B4
/* 80048600 00044580  40 80 04 58 */	bge .L_80048A58
/* 80048604 00044584  2C 04 00 00 */	cmpwi r4, 0x0
/* 80048608 00044588  40 80 00 08 */	bge .L_80048610
/* 8004860C 0004458C  48 00 04 4C */	b .L_80048A58
.L_80048610:
/* 80048610 00044590  81 9A 00 0C */	lwz r12, 0xc(r26)
/* 80048614 00044594  54 03 08 3C */	slwi r3, r0, 1
/* 80048618 00044598  80 BA 00 10 */	lwz r5, 0x10(r26)
/* 8004861C 0004459C  7C 80 30 50 */	subf r4, r0, r6
/* 80048620 000445A0  7D 88 03 A6 */	mtlr r12
/* 80048624 000445A4  80 FA 00 4C */	lwz r7, 0x4c(r26)
/* 80048628 000445A8  7C 65 1A 14 */	add r3, r5, r3
/* 8004862C 000445AC  38 A0 00 00 */	li r5, 0x0
/* 80048630 000445B0  38 C0 00 00 */	li r6, 0x0
/* 80048634 000445B4  4E 80 00 21 */	blrl
/* 80048638 000445B8  28 03 00 00 */	cmplwi r3, 0x0
/* 8004863C 000445BC  41 82 04 1C */	beq .L_80048A58
/* 80048640 000445C0  88 1A 00 08 */	lbz r0, 0x8(r26)
/* 80048644 000445C4  28 00 00 02 */	cmplwi r0, 0x2
/* 80048648 000445C8  40 82 04 10 */	bne .L_80048A58
/* 8004864C 000445CC  80 BA 00 1C */	lwz r5, 0x1c(r26)
/* 80048650 000445D0  80 DA 00 14 */	lwz r6, 0x14(r26)
/* 80048654 000445D4  7C 85 1A 14 */	add r4, r5, r3
/* 80048658 000445D8  80 1A 00 04 */	lwz r0, 0x4(r26)
/* 8004865C 000445DC  7C 64 33 96 */	divwu r3, r4, r6
/* 80048660 000445E0  7C 63 31 D6 */	mullw r3, r3, r6
/* 80048664 000445E4  54 00 03 9D */	rlwinm. r0, r0, 0, 14, 14
/* 80048668 000445E8  7F 03 20 50 */	subf r24, r3, r4
/* 8004866C 000445EC  40 82 00 40 */	bne .L_800486AC
/* 80048670 000445F0  28 18 00 00 */	cmplwi r24, 0x0
/* 80048674 000445F4  41 82 00 20 */	beq .L_80048694
/* 80048678 000445F8  7C 05 C0 50 */	subf r0, r5, r24
/* 8004867C 000445FC  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 80048680 00044600  88 DA 00 5B */	lbz r6, 0x5b(r26)
/* 80048684 00044604  54 A4 08 3C */	slwi r4, r5, 1
/* 80048688 00044608  54 05 08 3C */	slwi r5, r0, 1
/* 8004868C 0004460C  48 00 FB 39 */	bl hwFlushStream
/* 80048690 00044610  48 00 00 1C */	b .L_800486AC
.L_80048694:
/* 80048694 00044614  7C 05 30 50 */	subf r0, r5, r6
/* 80048698 00044618  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 8004869C 0004461C  88 DA 00 5B */	lbz r6, 0x5b(r26)
/* 800486A0 00044620  54 A4 08 3C */	slwi r4, r5, 1
/* 800486A4 00044624  54 05 08 3C */	slwi r5, r0, 1
/* 800486A8 00044628  48 00 FB 1D */	bl hwFlushStream
.L_800486AC:
/* 800486AC 0004462C  93 1A 00 1C */	stw r24, 0x1c(r26)
/* 800486B0 00044630  48 00 03 A8 */	b .L_80048A58
.L_800486B4:
/* 800486B4 00044634  7C BF 00 16 */	mulhwu r5, r31, r0
/* 800486B8 00044638  81 9A 00 0C */	lwz r12, 0xc(r26)
/* 800486BC 0004463C  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 800486C0 00044640  7D 88 03 A6 */	mtlr r12
/* 800486C4 00044644  80 FA 00 4C */	lwz r7, 0x4c(r26)
/* 800486C8 00044648  7C 85 00 50 */	subf r4, r5, r0
/* 800486CC 0004464C  54 84 F8 7E */	srwi r4, r4, 1
/* 800486D0 00044650  7C 84 2A 14 */	add r4, r4, r5
/* 800486D4 00044654  54 99 00 38 */	clrrwi r25, r4, 3
/* 800486D8 00044658  7C 80 30 50 */	subf r4, r0, r6
/* 800486DC 0004465C  7C 63 CA 14 */	add r3, r3, r25
/* 800486E0 00044660  38 A0 00 00 */	li r5, 0x0
/* 800486E4 00044664  38 C0 00 00 */	li r6, 0x0
/* 800486E8 00044668  4E 80 00 21 */	blrl
/* 800486EC 0004466C  28 03 00 00 */	cmplwi r3, 0x0
/* 800486F0 00044670  41 82 03 68 */	beq .L_80048A58
/* 800486F4 00044674  88 1A 00 08 */	lbz r0, 0x8(r26)
/* 800486F8 00044678  28 00 00 02 */	cmplwi r0, 0x2
/* 800486FC 0004467C  40 82 03 5C */	bne .L_80048A58
/* 80048700 00044680  80 1A 00 1C */	lwz r0, 0x1c(r26)
/* 80048704 00044684  80 9A 00 14 */	lwz r4, 0x14(r26)
/* 80048708 00044688  7C A0 1A 14 */	add r5, r0, r3
/* 8004870C 0004468C  80 1A 00 04 */	lwz r0, 0x4(r26)
/* 80048710 00044690  7C 65 23 96 */	divwu r3, r5, r4
/* 80048714 00044694  7C 63 21 D6 */	mullw r3, r3, r4
/* 80048718 00044698  54 00 03 9D */	rlwinm. r0, r0, 0, 14, 14
/* 8004871C 0004469C  7F 03 28 50 */	subf r24, r3, r5
/* 80048720 000446A0  40 82 00 54 */	bne .L_80048774
/* 80048724 000446A4  28 18 00 00 */	cmplwi r24, 0x0
/* 80048728 000446A8  41 82 00 34 */	beq .L_8004875C
/* 8004872C 000446AC  38 18 00 0D */	addi r0, r24, 0xd
/* 80048730 000446B0  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 80048734 000446B4  7C 9F 00 16 */	mulhwu r4, r31, r0
/* 80048738 000446B8  88 DA 00 5B */	lbz r6, 0x5b(r26)
/* 8004873C 000446BC  7C 04 00 50 */	subf r0, r4, r0
/* 80048740 000446C0  54 00 F8 7E */	srwi r0, r0, 1
/* 80048744 000446C4  7C 00 22 14 */	add r0, r0, r4
/* 80048748 000446C8  54 00 00 38 */	clrrwi r0, r0, 3
/* 8004874C 000446CC  38 99 00 00 */	addi r4, r25, 0x0
/* 80048750 000446D0  7C B9 00 50 */	subf r5, r25, r0
/* 80048754 000446D4  48 00 FA 71 */	bl hwFlushStream
/* 80048758 000446D8  48 00 00 1C */	b .L_80048774
.L_8004875C:
/* 8004875C 000446DC  80 1A 00 18 */	lwz r0, 0x18(r26)
/* 80048760 000446E0  7F 24 CB 78 */	mr r4, r25
/* 80048764 000446E4  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 80048768 000446E8  88 DA 00 5B */	lbz r6, 0x5b(r26)
/* 8004876C 000446EC  7C B9 00 50 */	subf r5, r25, r0
/* 80048770 000446F0  48 00 FA 55 */	bl hwFlushStream
.L_80048774:
/* 80048774 000446F4  93 1A 00 1C */	stw r24, 0x1c(r26)
/* 80048778 000446F8  48 00 02 E0 */	b .L_80048A58
.L_8004877C:
/* 8004877C 000446FC  28 06 00 00 */	cmplwi r6, 0x0
/* 80048780 00044700  40 82 01 34 */	bne .L_800488B4
/* 80048784 00044704  2C 04 00 01 */	cmpwi r4, 0x1
/* 80048788 00044708  41 82 00 98 */	beq .L_80048820
/* 8004878C 0004470C  40 80 02 CC */	bge .L_80048A58
/* 80048790 00044710  2C 04 00 00 */	cmpwi r4, 0x0
/* 80048794 00044714  40 80 00 08 */	bge .L_8004879C
/* 80048798 00044718  48 00 02 C0 */	b .L_80048A58
.L_8004879C:
/* 8004879C 0004471C  81 9A 00 0C */	lwz r12, 0xc(r26)
/* 800487A0 00044720  54 03 08 3C */	slwi r3, r0, 1
/* 800487A4 00044724  80 DA 00 10 */	lwz r6, 0x10(r26)
/* 800487A8 00044728  38 A0 00 00 */	li r5, 0x0
/* 800487AC 0004472C  80 9A 00 14 */	lwz r4, 0x14(r26)
/* 800487B0 00044730  7D 88 03 A6 */	mtlr r12
/* 800487B4 00044734  80 FA 00 4C */	lwz r7, 0x4c(r26)
/* 800487B8 00044738  7C 66 1A 14 */	add r3, r6, r3
/* 800487BC 0004473C  7C 80 20 50 */	subf r4, r0, r4
/* 800487C0 00044740  38 C0 00 00 */	li r6, 0x0
/* 800487C4 00044744  4E 80 00 21 */	blrl
/* 800487C8 00044748  28 03 00 00 */	cmplwi r3, 0x0
/* 800487CC 0004474C  41 82 02 8C */	beq .L_80048A58
/* 800487D0 00044750  88 1A 00 08 */	lbz r0, 0x8(r26)
/* 800487D4 00044754  28 00 00 02 */	cmplwi r0, 0x2
/* 800487D8 00044758  40 82 02 80 */	bne .L_80048A58
/* 800487DC 0004475C  80 DA 00 1C */	lwz r6, 0x1c(r26)
/* 800487E0 00044760  80 9A 00 14 */	lwz r4, 0x14(r26)
/* 800487E4 00044764  7C A6 1A 14 */	add r5, r6, r3
/* 800487E8 00044768  80 1A 00 04 */	lwz r0, 0x4(r26)
/* 800487EC 0004476C  7C 65 23 96 */	divwu r3, r5, r4
/* 800487F0 00044770  7C 63 21 D6 */	mullw r3, r3, r4
/* 800487F4 00044774  54 00 03 9D */	rlwinm. r0, r0, 0, 14, 14
/* 800487F8 00044778  7F 03 28 50 */	subf r24, r3, r5
/* 800487FC 0004477C  40 82 00 1C */	bne .L_80048818
/* 80048800 00044780  80 1A 00 18 */	lwz r0, 0x18(r26)
/* 80048804 00044784  54 C4 08 3C */	slwi r4, r6, 1
/* 80048808 00044788  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 8004880C 0004478C  88 DA 00 5B */	lbz r6, 0x5b(r26)
/* 80048810 00044790  7C A4 00 50 */	subf r5, r4, r0
/* 80048814 00044794  48 00 F9 B1 */	bl hwFlushStream
.L_80048818:
/* 80048818 00044798  93 1A 00 1C */	stw r24, 0x1c(r26)
/* 8004881C 0004479C  48 00 02 3C */	b .L_80048A58
.L_80048820:
/* 80048820 000447A0  7C DF 00 16 */	mulhwu r6, r31, r0
/* 80048824 000447A4  81 9A 00 0C */	lwz r12, 0xc(r26)
/* 80048828 000447A8  80 9A 00 14 */	lwz r4, 0x14(r26)
/* 8004882C 000447AC  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 80048830 000447B0  7D 88 03 A6 */	mtlr r12
/* 80048834 000447B4  7C A6 00 50 */	subf r5, r6, r0
/* 80048838 000447B8  80 FA 00 4C */	lwz r7, 0x4c(r26)
/* 8004883C 000447BC  54 A5 F8 7E */	srwi r5, r5, 1
/* 80048840 000447C0  7C A5 32 14 */	add r5, r5, r6
/* 80048844 000447C4  54 B9 00 38 */	clrrwi r25, r5, 3
/* 80048848 000447C8  7C 63 CA 14 */	add r3, r3, r25
/* 8004884C 000447CC  7C 80 20 50 */	subf r4, r0, r4
/* 80048850 000447D0  38 A0 00 00 */	li r5, 0x0
/* 80048854 000447D4  38 C0 00 00 */	li r6, 0x0
/* 80048858 000447D8  4E 80 00 21 */	blrl
/* 8004885C 000447DC  28 03 00 00 */	cmplwi r3, 0x0
/* 80048860 000447E0  41 82 01 F8 */	beq .L_80048A58
/* 80048864 000447E4  88 1A 00 08 */	lbz r0, 0x8(r26)
/* 80048868 000447E8  28 00 00 02 */	cmplwi r0, 0x2
/* 8004886C 000447EC  40 82 01 EC */	bne .L_80048A58
/* 80048870 000447F0  80 1A 00 1C */	lwz r0, 0x1c(r26)
/* 80048874 000447F4  80 9A 00 14 */	lwz r4, 0x14(r26)
/* 80048878 000447F8  7C A0 1A 14 */	add r5, r0, r3
/* 8004887C 000447FC  80 1A 00 04 */	lwz r0, 0x4(r26)
/* 80048880 00044800  7C 65 23 96 */	divwu r3, r5, r4
/* 80048884 00044804  7C 63 21 D6 */	mullw r3, r3, r4
/* 80048888 00044808  54 00 03 9D */	rlwinm. r0, r0, 0, 14, 14
/* 8004888C 0004480C  7F 03 28 50 */	subf r24, r3, r5
/* 80048890 00044810  40 82 00 1C */	bne .L_800488AC
/* 80048894 00044814  80 1A 00 18 */	lwz r0, 0x18(r26)
/* 80048898 00044818  7F 24 CB 78 */	mr r4, r25
/* 8004889C 0004481C  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 800488A0 00044820  88 DA 00 5B */	lbz r6, 0x5b(r26)
/* 800488A4 00044824  7C B9 00 50 */	subf r5, r25, r0
/* 800488A8 00044828  48 00 F9 1D */	bl hwFlushStream
.L_800488AC:
/* 800488AC 0004482C  93 1A 00 1C */	stw r24, 0x1c(r26)
/* 800488B0 00044830  48 00 01 A8 */	b .L_80048A58
.L_800488B4:
/* 800488B4 00044834  2C 04 00 01 */	cmpwi r4, 0x1
/* 800488B8 00044838  41 82 00 CC */	beq .L_80048984
/* 800488BC 0004483C  40 80 01 9C */	bge .L_80048A58
/* 800488C0 00044840  2C 04 00 00 */	cmpwi r4, 0x0
/* 800488C4 00044844  40 80 00 08 */	bge .L_800488CC
/* 800488C8 00044848  48 00 01 90 */	b .L_80048A58
.L_800488CC:
/* 800488CC 0004484C  81 9A 00 0C */	lwz r12, 0xc(r26)
/* 800488D0 00044850  54 03 08 3C */	slwi r3, r0, 1
/* 800488D4 00044854  80 BA 00 10 */	lwz r5, 0x10(r26)
/* 800488D8 00044858  80 9A 00 14 */	lwz r4, 0x14(r26)
/* 800488DC 0004485C  7D 88 03 A6 */	mtlr r12
/* 800488E0 00044860  80 FA 00 4C */	lwz r7, 0x4c(r26)
/* 800488E4 00044864  7C 65 1A 14 */	add r3, r5, r3
/* 800488E8 00044868  7C 80 20 50 */	subf r4, r0, r4
/* 800488EC 0004486C  4E 80 00 21 */	blrl
/* 800488F0 00044870  28 03 00 00 */	cmplwi r3, 0x0
/* 800488F4 00044874  41 82 01 64 */	beq .L_80048A58
/* 800488F8 00044878  88 1A 00 08 */	lbz r0, 0x8(r26)
/* 800488FC 0004487C  28 00 00 02 */	cmplwi r0, 0x2
/* 80048900 00044880  40 82 01 58 */	bne .L_80048A58
/* 80048904 00044884  80 DA 00 1C */	lwz r6, 0x1c(r26)
/* 80048908 00044888  80 FA 00 14 */	lwz r7, 0x14(r26)
/* 8004890C 0004488C  7C A6 1A 14 */	add r5, r6, r3
/* 80048910 00044890  80 1A 00 04 */	lwz r0, 0x4(r26)
/* 80048914 00044894  7C 85 3B 96 */	divwu r4, r5, r7
/* 80048918 00044898  7C 84 39 D6 */	mullw r4, r4, r7
/* 8004891C 0004489C  54 00 03 9D */	rlwinm. r0, r0, 0, 14, 14
/* 80048920 000448A0  7F 04 28 50 */	subf r24, r4, r5
/* 80048924 000448A4  40 82 00 58 */	bne .L_8004897C
/* 80048928 000448A8  7C 06 38 50 */	subf r0, r6, r7
/* 8004892C 000448AC  7C 03 00 40 */	cmplw r3, r0
/* 80048930 000448B0  40 81 00 34 */	ble .L_80048964
/* 80048934 000448B4  80 1A 00 18 */	lwz r0, 0x18(r26)
/* 80048938 000448B8  54 C4 08 3C */	slwi r4, r6, 1
/* 8004893C 000448BC  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 80048940 000448C0  88 DA 00 5B */	lbz r6, 0x5b(r26)
/* 80048944 000448C4  7C A4 00 50 */	subf r5, r4, r0
/* 80048948 000448C8  48 00 F8 7D */	bl hwFlushStream
/* 8004894C 000448CC  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 80048950 000448D0  57 05 08 3C */	slwi r5, r24, 1
/* 80048954 000448D4  88 DA 00 5B */	lbz r6, 0x5b(r26)
/* 80048958 000448D8  38 80 00 00 */	li r4, 0x0
/* 8004895C 000448DC  48 00 F8 69 */	bl hwFlushStream
/* 80048960 000448E0  48 00 00 1C */	b .L_8004897C
.L_80048964:
/* 80048964 000448E4  80 1A 00 18 */	lwz r0, 0x18(r26)
/* 80048968 000448E8  54 C4 08 3C */	slwi r4, r6, 1
/* 8004896C 000448EC  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 80048970 000448F0  88 DA 00 5B */	lbz r6, 0x5b(r26)
/* 80048974 000448F4  7C A4 00 50 */	subf r5, r4, r0
/* 80048978 000448F8  48 00 F8 4D */	bl hwFlushStream
.L_8004897C:
/* 8004897C 000448FC  93 1A 00 1C */	stw r24, 0x1c(r26)
/* 80048980 00044900  48 00 00 D8 */	b .L_80048A58
.L_80048984:
/* 80048984 00044904  7D 1F 00 16 */	mulhwu r8, r31, r0
/* 80048988 00044908  81 9A 00 0C */	lwz r12, 0xc(r26)
/* 8004898C 0004490C  80 9A 00 14 */	lwz r4, 0x14(r26)
/* 80048990 00044910  80 BA 00 10 */	lwz r5, 0x10(r26)
/* 80048994 00044914  7D 88 03 A6 */	mtlr r12
/* 80048998 00044918  7C 68 00 50 */	subf r3, r8, r0
/* 8004899C 0004491C  80 FA 00 4C */	lwz r7, 0x4c(r26)
/* 800489A0 00044920  54 63 F8 7E */	srwi r3, r3, 1
/* 800489A4 00044924  7C 63 42 14 */	add r3, r3, r8
/* 800489A8 00044928  54 79 00 38 */	clrrwi r25, r3, 3
/* 800489AC 0004492C  7C 65 CA 14 */	add r3, r5, r25
/* 800489B0 00044930  7C 80 20 50 */	subf r4, r0, r4
/* 800489B4 00044934  4E 80 00 21 */	blrl
/* 800489B8 00044938  28 03 00 00 */	cmplwi r3, 0x0
/* 800489BC 0004493C  41 82 00 9C */	beq .L_80048A58
/* 800489C0 00044940  88 1A 00 08 */	lbz r0, 0x8(r26)
/* 800489C4 00044944  28 00 00 02 */	cmplwi r0, 0x2
/* 800489C8 00044948  40 82 00 90 */	bne .L_80048A58
/* 800489CC 0004494C  80 DA 00 1C */	lwz r6, 0x1c(r26)
/* 800489D0 00044950  80 FA 00 14 */	lwz r7, 0x14(r26)
/* 800489D4 00044954  7C A6 1A 14 */	add r5, r6, r3
/* 800489D8 00044958  80 1A 00 04 */	lwz r0, 0x4(r26)
/* 800489DC 0004495C  7C 85 3B 96 */	divwu r4, r5, r7
/* 800489E0 00044960  7C 84 39 D6 */	mullw r4, r4, r7
/* 800489E4 00044964  54 00 03 9D */	rlwinm. r0, r0, 0, 14, 14
/* 800489E8 00044968  7F 04 28 50 */	subf r24, r4, r5
/* 800489EC 0004496C  40 82 00 68 */	bne .L_80048A54
/* 800489F0 00044970  7C 06 38 50 */	subf r0, r6, r7
/* 800489F4 00044974  7C 03 00 40 */	cmplw r3, r0
/* 800489F8 00044978  40 81 00 44 */	ble .L_80048A3C
/* 800489FC 0004497C  80 1A 00 18 */	lwz r0, 0x18(r26)
/* 80048A00 00044980  7F 24 CB 78 */	mr r4, r25
/* 80048A04 00044984  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 80048A08 00044988  88 DA 00 5B */	lbz r6, 0x5b(r26)
/* 80048A0C 0004498C  7C B9 00 50 */	subf r5, r25, r0
/* 80048A10 00044990  48 00 F7 B5 */	bl hwFlushStream
/* 80048A14 00044994  7C 9F C0 16 */	mulhwu r4, r31, r24
/* 80048A18 00044998  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 80048A1C 0004499C  88 DA 00 5B */	lbz r6, 0x5b(r26)
/* 80048A20 000449A0  7C 04 C0 50 */	subf r0, r4, r24
/* 80048A24 000449A4  54 00 F8 7E */	srwi r0, r0, 1
/* 80048A28 000449A8  7C 00 22 14 */	add r0, r0, r4
/* 80048A2C 000449AC  54 05 00 38 */	clrrwi r5, r0, 3
/* 80048A30 000449B0  38 80 00 00 */	li r4, 0x0
/* 80048A34 000449B4  48 00 F7 91 */	bl hwFlushStream
/* 80048A38 000449B8  48 00 00 1C */	b .L_80048A54
.L_80048A3C:
/* 80048A3C 000449BC  80 1A 00 18 */	lwz r0, 0x18(r26)
/* 80048A40 000449C0  7F 24 CB 78 */	mr r4, r25
/* 80048A44 000449C4  80 7A 00 10 */	lwz r3, 0x10(r26)
/* 80048A48 000449C8  88 DA 00 5B */	lbz r6, 0x5b(r26)
/* 80048A4C 000449CC  7C B9 00 50 */	subf r5, r25, r0
/* 80048A50 000449D0  48 00 F7 75 */	bl hwFlushStream
.L_80048A54:
/* 80048A54 000449D4  93 1A 00 1C */	stw r24, 0x1c(r26)
.L_80048A58:
/* 80048A58 000449D8  88 1A 00 08 */	lbz r0, 0x8(r26)
/* 80048A5C 000449DC  28 00 00 02 */	cmplwi r0, 0x2
/* 80048A60 000449E0  40 82 00 34 */	bne .L_80048A94
/* 80048A64 000449E4  80 1A 00 04 */	lwz r0, 0x4(r26)
/* 80048A68 000449E8  54 00 03 9D */	rlwinm. r0, r0, 0, 14, 14
/* 80048A6C 000449EC  40 82 00 28 */	bne .L_80048A94
/* 80048A70 000449F0  88 1A 00 09 */	lbz r0, 0x9(r26)
/* 80048A74 000449F4  28 00 00 01 */	cmplwi r0, 0x1
/* 80048A78 000449F8  40 82 00 1C */	bne .L_80048A94
/* 80048A7C 000449FC  80 9A 00 10 */	lwz r4, 0x10(r26)
/* 80048A80 00044A00  80 7A 00 48 */	lwz r3, 0x48(r26)
/* 80048A84 00044A04  3C 84 40 00 */	addis r4, r4, 0x4000
/* 80048A88 00044A08  80 04 00 00 */	lwz r0, 0x0(r4)
/* 80048A8C 00044A0C  54 04 46 3E */	srwi r4, r0, 24
/* 80048A90 00044A10  48 00 F1 21 */	bl hwSetStreamLoopPS
.L_80048A94:
/* 80048A94 00044A14  3B 7B 00 01 */	addi r27, r27, 0x1
/* 80048A98 00044A18  3B 5A 00 60 */	addi r26, r26, 0x60
.L_80048A9C:
/* 80048A9C 00044A1C  88 1E 02 10 */	lbz r0, 0x210(r30)
/* 80048AA0 00044A20  7C 1B 00 40 */	cmplw r27, r0
/* 80048AA4 00044A24  41 80 F9 6C */	blt .L_80048410
.L_80048AA8:
/* 80048AA8 00044A28  BB 01 00 58 */	lmw r24, 0x58(r1)
/* 80048AAC 00044A2C  80 01 00 94 */	lwz r0, 0x94(r1)
/* 80048AB0 00044A30  CB E1 00 88 */	lfd f31, 0x88(r1)
/* 80048AB4 00044A34  CB C1 00 80 */	lfd f30, 0x80(r1)
/* 80048AB8 00044A38  7C 08 03 A6 */	mtlr r0
/* 80048ABC 00044A3C  CB A1 00 78 */	lfd f29, 0x78(r1)
/* 80048AC0 00044A40  38 21 00 90 */	addi r1, r1, 0x90
/* 80048AC4 00044A44  4E 80 00 20 */	blr
.endfn streamHandle

.fn streamCorrectLoops, global
/* 80048AC8 00044A48  4E 80 00 20 */	blr
.endfn streamCorrectLoops

.fn streamKill, global
/* 80048ACC 00044A4C  7C 08 02 A6 */	mflr r0
/* 80048AD0 00044A50  1C 83 00 60 */	mulli r4, r3, 0x60
/* 80048AD4 00044A54  90 01 00 04 */	stw r0, 0x4(r1)
/* 80048AD8 00044A58  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80048ADC 00044A5C  3C 60 80 09 */	lis r3, streamInfo@ha
/* 80048AE0 00044A60  38 03 F9 90 */	addi r0, r3, streamInfo@l
/* 80048AE4 00044A64  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80048AE8 00044A68  7F E0 22 14 */	add r31, r0, r4
/* 80048AEC 00044A6C  88 1F 00 08 */	lbz r0, 0x8(r31)
/* 80048AF0 00044A70  2C 00 00 03 */	cmpwi r0, 0x3
/* 80048AF4 00044A74  40 80 00 48 */	bge .L_80048B3C
/* 80048AF8 00044A78  2C 00 00 01 */	cmpwi r0, 0x1
/* 80048AFC 00044A7C  40 80 00 08 */	bge .L_80048B04
/* 80048B00 00044A80  48 00 00 3C */	b .L_80048B3C
.L_80048B04:
/* 80048B04 00044A84  28 00 00 02 */	cmplwi r0, 0x2
/* 80048B08 00044A88  40 82 00 0C */	bne .L_80048B14
/* 80048B0C 00044A8C  80 7F 00 48 */	lwz r3, 0x48(r31)
/* 80048B10 00044A90  48 00 68 81 */	bl voiceUnblock
.L_80048B14:
/* 80048B14 00044A94  38 00 00 03 */	li r0, 0x3
/* 80048B18 00044A98  98 1F 00 08 */	stb r0, 0x8(r31)
/* 80048B1C 00044A9C  38 60 00 00 */	li r3, 0x0
/* 80048B20 00044AA0  38 80 00 00 */	li r4, 0x0
/* 80048B24 00044AA4  81 9F 00 0C */	lwz r12, 0xc(r31)
/* 80048B28 00044AA8  38 A0 00 00 */	li r5, 0x0
/* 80048B2C 00044AAC  80 FF 00 4C */	lwz r7, 0x4c(r31)
/* 80048B30 00044AB0  38 C0 00 00 */	li r6, 0x0
/* 80048B34 00044AB4  7D 88 03 A6 */	mtlr r12
/* 80048B38 00044AB8  4E 80 00 21 */	blrl
.L_80048B3C:
/* 80048B3C 00044ABC  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80048B40 00044AC0  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80048B44 00044AC4  38 21 00 18 */	addi r1, r1, 0x18
/* 80048B48 00044AC8  7C 08 03 A6 */	mtlr r0
/* 80048B4C 00044ACC  4E 80 00 20 */	blr
.endfn streamKill

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0

.balign 8

.obj float_800A9998, local
	.4byte 0x45800000
.endobj float_800A9998

.obj float_800A999C, local
	.4byte 0x3C010204
.endobj float_800A999C

.obj lbl_800A99A0, local
	.8byte 0x4330000000000000
.endobj lbl_800A99A0

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80

.balign 8

.obj streamInfo, local
	.skip 0x1800
.endobj streamInfo


.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380

.balign 8

.obj streamCallCnt, local
	.skip 0x1
.endobj streamCallCnt

.obj streamCallDelay, local
	.skip 0x1
.endobj streamCallDelay

.skip 2

.obj nextPublicID, local
	.skip 0x4
.endobj nextPublicID

.section extab, "a"  # 0x80005520 - 0x80005BC0

.obj "@etb_800056A8", local
.hidden "@etb_800056A8"
	.4byte 0x40C80000
	.4byte 0
.endobj "@etb_800056A8"

.obj "@etb_800056B0", local
.hidden "@etb_800056B0"
	.4byte 0x08080000
	.4byte 0
.endobj "@etb_800056B0"

.section extabindex, "a"  # 0x80005BC0 - 0x800065A0


.obj "@eti_80005E0C", local
.hidden "@eti_80005E0C"
	.4byte streamHandle
	.4byte 0x0000072C
	.4byte "@etb_800056A8"
.endobj "@eti_80005E0C"

.obj "@eti_80005E18", local
.hidden "@eti_80005E18"
	.4byte streamKill
	.4byte 0x00000084
	.4byte "@etb_800056B0"
.endobj "@eti_80005E18"
