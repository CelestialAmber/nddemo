.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

__OSLoadFPUContext:
/* 8002937C 000252FC  A0 A4 01 A2 */	lhz r5, 0x1a2(r4)
/* 80029380 00025300  54 A5 07 FF */	clrlwi. r5, r5, 31
/* 80029384 00025304  41 82 01 18 */	beq .L_8002949C
/* 80029388 00025308  C8 04 01 90 */	lfd f0, 0x190(r4)
/* 8002938C 0002530C  FD FE 05 8E */	mtfsf 255, f0
/* 80029390 00025310  7C B8 E2 A6 */	mfspr r5, HID2
/* 80029394 00025314  54 A5 1F FF */	extrwi. r5, r5, 1, 2
/* 80029398 00025318  41 82 00 84 */	beq .L_8002941C
/* 8002939C 0002531C  E0 04 01 C8 */	psq_l f0, 0x1c8(r4), 0, qr0
/* 800293A0 00025320  E0 24 01 D0 */	psq_l f1, 0x1d0(r4), 0, qr0
/* 800293A4 00025324  E0 44 01 D8 */	psq_l f2, 0x1d8(r4), 0, qr0
/* 800293A8 00025328  E0 64 01 E0 */	psq_l f3, 0x1e0(r4), 0, qr0
/* 800293AC 0002532C  E0 84 01 E8 */	psq_l f4, 0x1e8(r4), 0, qr0
/* 800293B0 00025330  E0 A4 01 F0 */	psq_l f5, 0x1f0(r4), 0, qr0
/* 800293B4 00025334  E0 C4 01 F8 */	psq_l f6, 0x1f8(r4), 0, qr0
/* 800293B8 00025338  E0 E4 02 00 */	psq_l f7, 0x200(r4), 0, qr0
/* 800293BC 0002533C  E1 04 02 08 */	psq_l f8, 0x208(r4), 0, qr0
/* 800293C0 00025340  E1 24 02 10 */	psq_l f9, 0x210(r4), 0, qr0
/* 800293C4 00025344  E1 44 02 18 */	psq_l f10, 0x218(r4), 0, qr0
/* 800293C8 00025348  E1 64 02 20 */	psq_l f11, 0x220(r4), 0, qr0
/* 800293CC 0002534C  E1 84 02 28 */	psq_l f12, 0x228(r4), 0, qr0
/* 800293D0 00025350  E1 A4 02 30 */	psq_l f13, 0x230(r4), 0, qr0
/* 800293D4 00025354  E1 C4 02 38 */	psq_l f14, 0x238(r4), 0, qr0
/* 800293D8 00025358  E1 E4 02 40 */	psq_l f15, 0x240(r4), 0, qr0
/* 800293DC 0002535C  E2 04 02 48 */	psq_l f16, 0x248(r4), 0, qr0
/* 800293E0 00025360  E2 24 02 50 */	psq_l f17, 0x250(r4), 0, qr0
/* 800293E4 00025364  E2 44 02 58 */	psq_l f18, 0x258(r4), 0, qr0
/* 800293E8 00025368  E2 64 02 60 */	psq_l f19, 0x260(r4), 0, qr0
/* 800293EC 0002536C  E2 84 02 68 */	psq_l f20, 0x268(r4), 0, qr0
/* 800293F0 00025370  E2 A4 02 70 */	psq_l f21, 0x270(r4), 0, qr0
/* 800293F4 00025374  E2 C4 02 78 */	psq_l f22, 0x278(r4), 0, qr0
/* 800293F8 00025378  E2 E4 02 80 */	psq_l f23, 0x280(r4), 0, qr0
/* 800293FC 0002537C  E3 04 02 88 */	psq_l f24, 0x288(r4), 0, qr0
/* 80029400 00025380  E3 24 02 90 */	psq_l f25, 0x290(r4), 0, qr0
/* 80029404 00025384  E3 44 02 98 */	psq_l f26, 0x298(r4), 0, qr0
/* 80029408 00025388  E3 64 02 A0 */	psq_l f27, 0x2a0(r4), 0, qr0
/* 8002940C 0002538C  E3 84 02 A8 */	psq_l f28, 0x2a8(r4), 0, qr0
/* 80029410 00025390  E3 A4 02 B0 */	psq_l f29, 0x2b0(r4), 0, qr0
/* 80029414 00025394  E3 C4 02 B8 */	psq_l f30, 0x2b8(r4), 0, qr0
/* 80029418 00025398  E3 E4 02 C0 */	psq_l f31, 0x2c0(r4), 0, qr0
.L_8002941C:
/* 8002941C 0002539C  C8 04 00 90 */	lfd f0, 0x90(r4)
/* 80029420 000253A0  C8 24 00 98 */	lfd f1, 0x98(r4)
/* 80029424 000253A4  C8 44 00 A0 */	lfd f2, 0xa0(r4)
/* 80029428 000253A8  C8 64 00 A8 */	lfd f3, 0xa8(r4)
/* 8002942C 000253AC  C8 84 00 B0 */	lfd f4, 0xb0(r4)
/* 80029430 000253B0  C8 A4 00 B8 */	lfd f5, 0xb8(r4)
/* 80029434 000253B4  C8 C4 00 C0 */	lfd f6, 0xc0(r4)
/* 80029438 000253B8  C8 E4 00 C8 */	lfd f7, 0xc8(r4)
/* 8002943C 000253BC  C9 04 00 D0 */	lfd f8, 0xd0(r4)
/* 80029440 000253C0  C9 24 00 D8 */	lfd f9, 0xd8(r4)
/* 80029444 000253C4  C9 44 00 E0 */	lfd f10, 0xe0(r4)
/* 80029448 000253C8  C9 64 00 E8 */	lfd f11, 0xe8(r4)
/* 8002944C 000253CC  C9 84 00 F0 */	lfd f12, 0xf0(r4)
/* 80029450 000253D0  C9 A4 00 F8 */	lfd f13, 0xf8(r4)
/* 80029454 000253D4  C9 C4 01 00 */	lfd f14, 0x100(r4)
/* 80029458 000253D8  C9 E4 01 08 */	lfd f15, 0x108(r4)
/* 8002945C 000253DC  CA 04 01 10 */	lfd f16, 0x110(r4)
/* 80029460 000253E0  CA 24 01 18 */	lfd f17, 0x118(r4)
/* 80029464 000253E4  CA 44 01 20 */	lfd f18, 0x120(r4)
/* 80029468 000253E8  CA 64 01 28 */	lfd f19, 0x128(r4)
/* 8002946C 000253EC  CA 84 01 30 */	lfd f20, 0x130(r4)
/* 80029470 000253F0  CA A4 01 38 */	lfd f21, 0x138(r4)
/* 80029474 000253F4  CA C4 01 40 */	lfd f22, 0x140(r4)
/* 80029478 000253F8  CA E4 01 48 */	lfd f23, 0x148(r4)
/* 8002947C 000253FC  CB 04 01 50 */	lfd f24, 0x150(r4)
/* 80029480 00025400  CB 24 01 58 */	lfd f25, 0x158(r4)
/* 80029484 00025404  CB 44 01 60 */	lfd f26, 0x160(r4)
/* 80029488 00025408  CB 64 01 68 */	lfd f27, 0x168(r4)
/* 8002948C 0002540C  CB 84 01 70 */	lfd f28, 0x170(r4)
/* 80029490 00025410  CB A4 01 78 */	lfd f29, 0x178(r4)
/* 80029494 00025414  CB C4 01 80 */	lfd f30, 0x180(r4)
/* 80029498 00025418  CB E4 01 88 */	lfd f31, 0x188(r4)
.L_8002949C:
/* 8002949C 0002541C  4E 80 00 20 */	blr

__OSSaveFPUContext:
/* 800294A0 00025420  A0 65 01 A2 */	lhz r3, 0x1a2(r5)
/* 800294A4 00025424  60 63 00 01 */	ori r3, r3, 0x1
/* 800294A8 00025428  B0 65 01 A2 */	sth r3, 0x1a2(r5)
/* 800294AC 0002542C  D8 05 00 90 */	stfd f0, 0x90(r5)
/* 800294B0 00025430  D8 25 00 98 */	stfd f1, 0x98(r5)
/* 800294B4 00025434  D8 45 00 A0 */	stfd f2, 0xa0(r5)
/* 800294B8 00025438  D8 65 00 A8 */	stfd f3, 0xa8(r5)
/* 800294BC 0002543C  D8 85 00 B0 */	stfd f4, 0xb0(r5)
/* 800294C0 00025440  D8 A5 00 B8 */	stfd f5, 0xb8(r5)
/* 800294C4 00025444  D8 C5 00 C0 */	stfd f6, 0xc0(r5)
/* 800294C8 00025448  D8 E5 00 C8 */	stfd f7, 0xc8(r5)
/* 800294CC 0002544C  D9 05 00 D0 */	stfd f8, 0xd0(r5)
/* 800294D0 00025450  D9 25 00 D8 */	stfd f9, 0xd8(r5)
/* 800294D4 00025454  D9 45 00 E0 */	stfd f10, 0xe0(r5)
/* 800294D8 00025458  D9 65 00 E8 */	stfd f11, 0xe8(r5)
/* 800294DC 0002545C  D9 85 00 F0 */	stfd f12, 0xf0(r5)
/* 800294E0 00025460  D9 A5 00 F8 */	stfd f13, 0xf8(r5)
/* 800294E4 00025464  D9 C5 01 00 */	stfd f14, 0x100(r5)
/* 800294E8 00025468  D9 E5 01 08 */	stfd f15, 0x108(r5)
/* 800294EC 0002546C  DA 05 01 10 */	stfd f16, 0x110(r5)
/* 800294F0 00025470  DA 25 01 18 */	stfd f17, 0x118(r5)
/* 800294F4 00025474  DA 45 01 20 */	stfd f18, 0x120(r5)
/* 800294F8 00025478  DA 65 01 28 */	stfd f19, 0x128(r5)
/* 800294FC 0002547C  DA 85 01 30 */	stfd f20, 0x130(r5)
/* 80029500 00025480  DA A5 01 38 */	stfd f21, 0x138(r5)
/* 80029504 00025484  DA C5 01 40 */	stfd f22, 0x140(r5)
/* 80029508 00025488  DA E5 01 48 */	stfd f23, 0x148(r5)
/* 8002950C 0002548C  DB 05 01 50 */	stfd f24, 0x150(r5)
/* 80029510 00025490  DB 25 01 58 */	stfd f25, 0x158(r5)
/* 80029514 00025494  DB 45 01 60 */	stfd f26, 0x160(r5)
/* 80029518 00025498  DB 65 01 68 */	stfd f27, 0x168(r5)
/* 8002951C 0002549C  DB 85 01 70 */	stfd f28, 0x170(r5)
/* 80029520 000254A0  DB A5 01 78 */	stfd f29, 0x178(r5)
/* 80029524 000254A4  DB C5 01 80 */	stfd f30, 0x180(r5)
/* 80029528 000254A8  DB E5 01 88 */	stfd f31, 0x188(r5)
/* 8002952C 000254AC  FC 00 04 8E */	mffs f0
/* 80029530 000254B0  D8 05 01 90 */	stfd f0, 0x190(r5)
/* 80029534 000254B4  C8 05 00 90 */	lfd f0, 0x90(r5)
/* 80029538 000254B8  7C 78 E2 A6 */	mfspr r3, HID2
/* 8002953C 000254BC  54 63 1F FF */	extrwi. r3, r3, 1, 2
/* 80029540 000254C0  41 82 00 84 */	beq .L_800295C4
/* 80029544 000254C4  F0 05 01 C8 */	psq_st f0, 0x1c8(r5), 0, qr0
/* 80029548 000254C8  F0 25 01 D0 */	psq_st f1, 0x1d0(r5), 0, qr0
/* 8002954C 000254CC  F0 45 01 D8 */	psq_st f2, 0x1d8(r5), 0, qr0
/* 80029550 000254D0  F0 65 01 E0 */	psq_st f3, 0x1e0(r5), 0, qr0
/* 80029554 000254D4  F0 85 01 E8 */	psq_st f4, 0x1e8(r5), 0, qr0
/* 80029558 000254D8  F0 A5 01 F0 */	psq_st f5, 0x1f0(r5), 0, qr0
/* 8002955C 000254DC  F0 C5 01 F8 */	psq_st f6, 0x1f8(r5), 0, qr0
/* 80029560 000254E0  F0 E5 02 00 */	psq_st f7, 0x200(r5), 0, qr0
/* 80029564 000254E4  F1 05 02 08 */	psq_st f8, 0x208(r5), 0, qr0
/* 80029568 000254E8  F1 25 02 10 */	psq_st f9, 0x210(r5), 0, qr0
/* 8002956C 000254EC  F1 45 02 18 */	psq_st f10, 0x218(r5), 0, qr0
/* 80029570 000254F0  F1 65 02 20 */	psq_st f11, 0x220(r5), 0, qr0
/* 80029574 000254F4  F1 85 02 28 */	psq_st f12, 0x228(r5), 0, qr0
/* 80029578 000254F8  F1 A5 02 30 */	psq_st f13, 0x230(r5), 0, qr0
/* 8002957C 000254FC  F1 C5 02 38 */	psq_st f14, 0x238(r5), 0, qr0
/* 80029580 00025500  F1 E5 02 40 */	psq_st f15, 0x240(r5), 0, qr0
/* 80029584 00025504  F2 05 02 48 */	psq_st f16, 0x248(r5), 0, qr0
/* 80029588 00025508  F2 25 02 50 */	psq_st f17, 0x250(r5), 0, qr0
/* 8002958C 0002550C  F2 45 02 58 */	psq_st f18, 0x258(r5), 0, qr0
/* 80029590 00025510  F2 65 02 60 */	psq_st f19, 0x260(r5), 0, qr0
/* 80029594 00025514  F2 85 02 68 */	psq_st f20, 0x268(r5), 0, qr0
/* 80029598 00025518  F2 A5 02 70 */	psq_st f21, 0x270(r5), 0, qr0
/* 8002959C 0002551C  F2 C5 02 78 */	psq_st f22, 0x278(r5), 0, qr0
/* 800295A0 00025520  F2 E5 02 80 */	psq_st f23, 0x280(r5), 0, qr0
/* 800295A4 00025524  F3 05 02 88 */	psq_st f24, 0x288(r5), 0, qr0
/* 800295A8 00025528  F3 25 02 90 */	psq_st f25, 0x290(r5), 0, qr0
/* 800295AC 0002552C  F3 45 02 98 */	psq_st f26, 0x298(r5), 0, qr0
/* 800295B0 00025530  F3 65 02 A0 */	psq_st f27, 0x2a0(r5), 0, qr0
/* 800295B4 00025534  F3 85 02 A8 */	psq_st f28, 0x2a8(r5), 0, qr0
/* 800295B8 00025538  F3 A5 02 B0 */	psq_st f29, 0x2b0(r5), 0, qr0
/* 800295BC 0002553C  F3 C5 02 B8 */	psq_st f30, 0x2b8(r5), 0, qr0
/* 800295C0 00025540  F3 E5 02 C0 */	psq_st f31, 0x2c0(r5), 0, qr0
.L_800295C4:
/* 800295C4 00025544  4E 80 00 20 */	blr

.global OSSetCurrentContext
OSSetCurrentContext:
/* 800295C8 00025548  3C 80 80 00 */	lis r4, 0x800000D4@ha
/* 800295CC 0002554C  90 64 00 D4 */	stw r3, 0x800000D4@l(r4)
/* 800295D0 00025550  54 65 00 BE */	clrlwi r5, r3, 2
/* 800295D4 00025554  90 A4 00 C0 */	stw r5, 0xc0(r4)
/* 800295D8 00025558  80 A4 00 D8 */	lwz r5, 0xd8(r4)
/* 800295DC 0002555C  7C 05 18 00 */	cmpw r5, r3
/* 800295E0 00025560  40 82 00 20 */	bne .L_80029600
/* 800295E4 00025564  80 C3 01 9C */	lwz r6, 0x19c(r3)
/* 800295E8 00025568  60 C6 20 00 */	ori r6, r6, 0x2000
/* 800295EC 0002556C  90 C3 01 9C */	stw r6, 0x19c(r3)
/* 800295F0 00025570  7C C0 00 A6 */	mfmsr r6
/* 800295F4 00025574  60 C6 00 02 */	ori r6, r6, 0x2
/* 800295F8 00025578  7C C0 01 24 */	mtmsr r6
/* 800295FC 0002557C  4E 80 00 20 */	blr
.L_80029600:
/* 80029600 00025580  80 C3 01 9C */	lwz r6, 0x19c(r3)
/* 80029604 00025584  54 C6 04 E2 */	rlwinm r6, r6, 0, 19, 17
/* 80029608 00025588  90 C3 01 9C */	stw r6, 0x19c(r3)
/* 8002960C 0002558C  7C C0 00 A6 */	mfmsr r6
/* 80029610 00025590  54 C6 04 E2 */	rlwinm r6, r6, 0, 19, 17
/* 80029614 00025594  60 C6 00 02 */	ori r6, r6, 0x2
/* 80029618 00025598  7C C0 01 24 */	mtmsr r6
/* 8002961C 0002559C  4C 00 01 2C */	isync
/* 80029620 000255A0  4E 80 00 20 */	blr

.global OSGetCurrentContext
OSGetCurrentContext:
/* 80029624 000255A4  3C 60 80 00 */	lis r3, 0x800000D4@ha
/* 80029628 000255A8  80 63 00 D4 */	lwz r3, 0x800000D4@l(r3)
/* 8002962C 000255AC  4E 80 00 20 */	blr

.global OSSaveContext
OSSaveContext:
/* 80029630 000255B0  BD A3 00 34 */	stmw r13, 0x34(r3)
/* 80029634 000255B4  7C 11 E2 A6 */	mfspr r0, GQR1
/* 80029638 000255B8  90 03 01 A8 */	stw r0, 0x1a8(r3)
/* 8002963C 000255BC  7C 12 E2 A6 */	mfspr r0, GQR2
/* 80029640 000255C0  90 03 01 AC */	stw r0, 0x1ac(r3)
/* 80029644 000255C4  7C 13 E2 A6 */	mfspr r0, GQR3
/* 80029648 000255C8  90 03 01 B0 */	stw r0, 0x1b0(r3)
/* 8002964C 000255CC  7C 14 E2 A6 */	mfspr r0, GQR4
/* 80029650 000255D0  90 03 01 B4 */	stw r0, 0x1b4(r3)
/* 80029654 000255D4  7C 15 E2 A6 */	mfspr r0, GQR5
/* 80029658 000255D8  90 03 01 B8 */	stw r0, 0x1b8(r3)
/* 8002965C 000255DC  7C 16 E2 A6 */	mfspr r0, GQR6
/* 80029660 000255E0  90 03 01 BC */	stw r0, 0x1bc(r3)
/* 80029664 000255E4  7C 17 E2 A6 */	mfspr r0, GQR7
/* 80029668 000255E8  90 03 01 C0 */	stw r0, 0x1c0(r3)
/* 8002966C 000255EC  7C 00 00 26 */	mfcr r0
/* 80029670 000255F0  90 03 00 80 */	stw r0, 0x80(r3)
/* 80029674 000255F4  7C 08 02 A6 */	mflr r0
/* 80029678 000255F8  90 03 00 84 */	stw r0, 0x84(r3)
/* 8002967C 000255FC  90 03 01 98 */	stw r0, 0x198(r3)
/* 80029680 00025600  7C 00 00 A6 */	mfmsr r0
/* 80029684 00025604  90 03 01 9C */	stw r0, 0x19c(r3)
/* 80029688 00025608  7C 09 02 A6 */	mfctr r0
/* 8002968C 0002560C  90 03 00 88 */	stw r0, 0x88(r3)
/* 80029690 00025610  7C 01 02 A6 */	mfxer r0
/* 80029694 00025614  90 03 00 8C */	stw r0, 0x8c(r3)
/* 80029698 00025618  90 23 00 04 */	stw r1, 0x4(r3)
/* 8002969C 0002561C  90 43 00 08 */	stw r2, 0x8(r3)
/* 800296A0 00025620  38 00 00 01 */	li r0, 0x1
/* 800296A4 00025624  90 03 00 0C */	stw r0, 0xc(r3)
/* 800296A8 00025628  38 60 00 00 */	li r3, 0x0
/* 800296AC 0002562C  4E 80 00 20 */	blr

.global OSLoadContext
OSLoadContext:
/* 800296B0 00025630  3C 80 80 03 */	lis r4, OSDisableInterrupts@ha
/* 800296B4 00025634  80 C3 01 98 */	lwz r6, 0x198(r3)
/* 800296B8 00025638  38 A4 AF E4 */	addi r5, r4, OSDisableInterrupts@l
/* 800296BC 0002563C  7C 06 28 40 */	cmplw r6, r5
/* 800296C0 00025640  41 80 00 18 */	blt .L_800296D8
/* 800296C4 00025644  3C 80 80 03 */	lis r4, __RAS_OSDisableInterrupts_end@ha
/* 800296C8 00025648  38 04 AF F4 */	addi r0, r4, __RAS_OSDisableInterrupts_end@l
/* 800296CC 0002564C  7C 06 00 40 */	cmplw r6, r0
/* 800296D0 00025650  41 81 00 08 */	bgt .L_800296D8
/* 800296D4 00025654  90 A3 01 98 */	stw r5, 0x198(r3)
.L_800296D8:
/* 800296D8 00025658  80 03 00 00 */	lwz r0, 0x0(r3)
/* 800296DC 0002565C  80 23 00 04 */	lwz r1, 0x4(r3)
/* 800296E0 00025660  80 43 00 08 */	lwz r2, 0x8(r3)
/* 800296E4 00025664  A0 83 01 A2 */	lhz r4, 0x1a2(r3)
/* 800296E8 00025668  54 85 07 BD */	rlwinm. r5, r4, 0, 30, 30
/* 800296EC 0002566C  41 82 00 14 */	beq .L_80029700
/* 800296F0 00025670  54 84 07 FA */	rlwinm r4, r4, 0, 31, 29
/* 800296F4 00025674  B0 83 01 A2 */	sth r4, 0x1a2(r3)
/* 800296F8 00025678  B8 A3 00 14 */	lmw r5, 0x14(r3)
/* 800296FC 0002567C  48 00 00 08 */	b .L_80029704
.L_80029700:
/* 80029700 00025680  B9 A3 00 34 */	lmw r13, 0x34(r3)
.L_80029704:
/* 80029704 00025684  80 83 01 A8 */	lwz r4, 0x1a8(r3)
/* 80029708 00025688  7C 91 E3 A6 */	mtspr GQR1, r4
/* 8002970C 0002568C  80 83 01 AC */	lwz r4, 0x1ac(r3)
/* 80029710 00025690  7C 92 E3 A6 */	mtspr GQR2, r4
/* 80029714 00025694  80 83 01 B0 */	lwz r4, 0x1b0(r3)
/* 80029718 00025698  7C 93 E3 A6 */	mtspr GQR3, r4
/* 8002971C 0002569C  80 83 01 B4 */	lwz r4, 0x1b4(r3)
/* 80029720 000256A0  7C 94 E3 A6 */	mtspr GQR4, r4
/* 80029724 000256A4  80 83 01 B8 */	lwz r4, 0x1b8(r3)
/* 80029728 000256A8  7C 95 E3 A6 */	mtspr GQR5, r4
/* 8002972C 000256AC  80 83 01 BC */	lwz r4, 0x1bc(r3)
/* 80029730 000256B0  7C 96 E3 A6 */	mtspr GQR6, r4
/* 80029734 000256B4  80 83 01 C0 */	lwz r4, 0x1c0(r3)
/* 80029738 000256B8  7C 97 E3 A6 */	mtspr GQR7, r4
/* 8002973C 000256BC  80 83 00 80 */	lwz r4, 0x80(r3)
/* 80029740 000256C0  7C 8F F1 20 */	mtcrf 255, r4
/* 80029744 000256C4  80 83 00 84 */	lwz r4, 0x84(r3)
/* 80029748 000256C8  7C 88 03 A6 */	mtlr r4
/* 8002974C 000256CC  80 83 00 88 */	lwz r4, 0x88(r3)
/* 80029750 000256D0  7C 89 03 A6 */	mtctr r4
/* 80029754 000256D4  80 83 00 8C */	lwz r4, 0x8c(r3)
/* 80029758 000256D8  7C 81 03 A6 */	mtxer r4
/* 8002975C 000256DC  7C 80 00 A6 */	mfmsr r4
/* 80029760 000256E0  54 84 04 5E */	rlwinm r4, r4, 0, 17, 15
/* 80029764 000256E4  54 84 07 FA */	rlwinm r4, r4, 0, 31, 29
/* 80029768 000256E8  7C 80 01 24 */	mtmsr r4
/* 8002976C 000256EC  80 83 01 98 */	lwz r4, 0x198(r3)
/* 80029770 000256F0  7C 9A 03 A6 */	mtsrr0 r4
/* 80029774 000256F4  80 83 01 9C */	lwz r4, 0x19c(r3)
/* 80029778 000256F8  7C 9B 03 A6 */	mtsrr1 r4
/* 8002977C 000256FC  80 83 00 10 */	lwz r4, 0x10(r3)
/* 80029780 00025700  80 63 00 0C */	lwz r3, 0xc(r3)
/* 80029784 00025704  4C 00 00 64 */	rfi

.global OSGetStackPointer
OSGetStackPointer:
/* 80029788 00025708  7C 23 0B 78 */	mr r3, r1
/* 8002978C 0002570C  4E 80 00 20 */	blr

.global OSClearContext
OSClearContext:
/* 80029790 00025710  38 A0 00 00 */	li r5, 0x0
/* 80029794 00025714  B0 A3 01 A0 */	sth r5, 0x1a0(r3)
/* 80029798 00025718  3C 80 80 00 */	lis r4, 0x800000D8@ha
/* 8002979C 0002571C  B0 A3 01 A2 */	sth r5, 0x1a2(r3)
/* 800297A0 00025720  80 04 00 D8 */	lwz r0, 0x800000D8@l(r4)
/* 800297A4 00025724  7C 03 00 40 */	cmplw r3, r0
/* 800297A8 00025728  40 82 00 08 */	bne .L_800297B0
/* 800297AC 0002572C  90 A4 00 D8 */	stw r5, 0xd8(r4)
.L_800297B0:
/* 800297B0 00025730  4E 80 00 20 */	blr

.global OSInitContext
OSInitContext:
/* 800297B4 00025734  90 83 01 98 */	stw r4, 0x198(r3)
/* 800297B8 00025738  90 A3 00 04 */	stw r5, 0x4(r3)
/* 800297BC 0002573C  39 60 00 00 */	li r11, 0x0
/* 800297C0 00025740  61 6B 90 32 */	ori r11, r11, 0x9032
/* 800297C4 00025744  91 63 01 9C */	stw r11, 0x19c(r3)
/* 800297C8 00025748  38 00 00 00 */	li r0, 0x0
/* 800297CC 0002574C  90 03 00 80 */	stw r0, 0x80(r3)
/* 800297D0 00025750  90 03 00 8C */	stw r0, 0x8c(r3)
/* 800297D4 00025754  90 43 00 08 */	stw r2, 0x8(r3)
/* 800297D8 00025758  91 A3 00 34 */	stw r13, 0x34(r3)
/* 800297DC 0002575C  90 03 00 0C */	stw r0, 0xc(r3)
/* 800297E0 00025760  90 03 00 10 */	stw r0, 0x10(r3)
/* 800297E4 00025764  90 03 00 14 */	stw r0, 0x14(r3)
/* 800297E8 00025768  90 03 00 18 */	stw r0, 0x18(r3)
/* 800297EC 0002576C  90 03 00 1C */	stw r0, 0x1c(r3)
/* 800297F0 00025770  90 03 00 20 */	stw r0, 0x20(r3)
/* 800297F4 00025774  90 03 00 24 */	stw r0, 0x24(r3)
/* 800297F8 00025778  90 03 00 28 */	stw r0, 0x28(r3)
/* 800297FC 0002577C  90 03 00 2C */	stw r0, 0x2c(r3)
/* 80029800 00025780  90 03 00 30 */	stw r0, 0x30(r3)
/* 80029804 00025784  90 03 00 38 */	stw r0, 0x38(r3)
/* 80029808 00025788  90 03 00 3C */	stw r0, 0x3c(r3)
/* 8002980C 0002578C  90 03 00 40 */	stw r0, 0x40(r3)
/* 80029810 00025790  90 03 00 44 */	stw r0, 0x44(r3)
/* 80029814 00025794  90 03 00 48 */	stw r0, 0x48(r3)
/* 80029818 00025798  90 03 00 4C */	stw r0, 0x4c(r3)
/* 8002981C 0002579C  90 03 00 50 */	stw r0, 0x50(r3)
/* 80029820 000257A0  90 03 00 54 */	stw r0, 0x54(r3)
/* 80029824 000257A4  90 03 00 58 */	stw r0, 0x58(r3)
/* 80029828 000257A8  90 03 00 5C */	stw r0, 0x5c(r3)
/* 8002982C 000257AC  90 03 00 60 */	stw r0, 0x60(r3)
/* 80029830 000257B0  90 03 00 64 */	stw r0, 0x64(r3)
/* 80029834 000257B4  90 03 00 68 */	stw r0, 0x68(r3)
/* 80029838 000257B8  90 03 00 6C */	stw r0, 0x6c(r3)
/* 8002983C 000257BC  90 03 00 70 */	stw r0, 0x70(r3)
/* 80029840 000257C0  90 03 00 74 */	stw r0, 0x74(r3)
/* 80029844 000257C4  90 03 00 78 */	stw r0, 0x78(r3)
/* 80029848 000257C8  90 03 00 7C */	stw r0, 0x7c(r3)
/* 8002984C 000257CC  90 03 01 A4 */	stw r0, 0x1a4(r3)
/* 80029850 000257D0  90 03 01 A8 */	stw r0, 0x1a8(r3)
/* 80029854 000257D4  90 03 01 AC */	stw r0, 0x1ac(r3)
/* 80029858 000257D8  90 03 01 B0 */	stw r0, 0x1b0(r3)
/* 8002985C 000257DC  90 03 01 B4 */	stw r0, 0x1b4(r3)
/* 80029860 000257E0  90 03 01 B8 */	stw r0, 0x1b8(r3)
/* 80029864 000257E4  90 03 01 BC */	stw r0, 0x1bc(r3)
/* 80029868 000257E8  90 03 01 C0 */	stw r0, 0x1c0(r3)
/* 8002986C 000257EC  4B FF FF 24 */	b OSClearContext

.global OSDumpContext
OSDumpContext:
/* 80029870 000257F0  7C 08 02 A6 */	mflr r0
/* 80029874 000257F4  90 01 00 04 */	stw r0, 0x4(r1)
/* 80029878 000257F8  94 21 FD 08 */	stwu r1, -0x2f8(r1)
/* 8002987C 000257FC  BF 21 02 DC */	stmw r25, 0x2dc(r1)
/* 80029880 00025800  7C 7C 1B 78 */	mr r28, r3
/* 80029884 00025804  3C 60 80 06 */	lis r3, lbl_80067CF8@ha
/* 80029888 00025808  4C C6 31 82 */	crclr 4*cr1+eq
/* 8002988C 0002580C  3B E3 7C F8 */	addi r31, r3, lbl_80067CF8@l
/* 80029890 00025810  7F E3 FB 78 */	mr r3, r31
/* 80029894 00025814  7F 84 E3 78 */	mr r4, r28
/* 80029898 00025818  48 00 03 4D */	bl OSReport
/* 8002989C 0002581C  3B 20 00 00 */	li r25, 0x0
/* 800298A0 00025820  57 20 10 3A */	slwi r0, r25, 2
/* 800298A4 00025824  7F 7C 02 14 */	add r27, r28, r0
/* 800298A8 00025828  48 00 00 04 */	b .L_800298AC
.L_800298AC:
/* 800298AC 0002582C  48 00 00 04 */	b .L_800298B0
.L_800298B0:
/* 800298B0 00025830  48 00 00 04 */	b .L_800298B4
.L_800298B4:
/* 800298B4 00025834  81 1B 00 40 */	lwz r8, 0x40(r27)
/* 800298B8 00025838  7F 24 CB 78 */	mr r4, r25
/* 800298BC 0002583C  80 BB 00 00 */	lwz r5, 0x0(r27)
/* 800298C0 00025840  38 7F 00 44 */	addi r3, r31, 0x44
/* 800298C4 00025844  4C C6 31 82 */	crclr 4*cr1+eq
/* 800298C8 00025848  7C A6 2B 78 */	mr r6, r5
/* 800298CC 0002584C  7D 09 43 78 */	mr r9, r8
/* 800298D0 00025850  38 F9 00 10 */	addi r7, r25, 0x10
/* 800298D4 00025854  48 00 03 11 */	bl OSReport
/* 800298D8 00025858  3B 7B 00 04 */	addi r27, r27, 0x4
/* 800298DC 0002585C  3B 39 00 01 */	addi r25, r25, 0x1
/* 800298E0 00025860  28 19 00 10 */	cmplwi r25, 0x10
/* 800298E4 00025864  41 80 FF D0 */	blt .L_800298B4
/* 800298E8 00025868  80 9C 00 84 */	lwz r4, 0x84(r28)
/* 800298EC 0002586C  38 7F 00 74 */	addi r3, r31, 0x74
/* 800298F0 00025870  80 BC 00 80 */	lwz r5, 0x80(r28)
/* 800298F4 00025874  4C C6 31 82 */	crclr 4*cr1+eq
/* 800298F8 00025878  48 00 02 ED */	bl OSReport
/* 800298FC 0002587C  80 9C 01 98 */	lwz r4, 0x198(r28)
/* 80029900 00025880  38 7F 00 A4 */	addi r3, r31, 0xa4
/* 80029904 00025884  80 BC 01 9C */	lwz r5, 0x19c(r28)
/* 80029908 00025888  4C C6 31 82 */	crclr 4*cr1+eq
/* 8002990C 0002588C  48 00 02 D9 */	bl OSReport
/* 80029910 00025890  38 7F 00 D4 */	addi r3, r31, 0xd4
/* 80029914 00025894  4C C6 31 82 */	crclr 4*cr1+eq
/* 80029918 00025898  48 00 02 CD */	bl OSReport
/* 8002991C 0002589C  3B 20 00 00 */	li r25, 0x0
/* 80029920 000258A0  57 20 10 3A */	slwi r0, r25, 2
/* 80029924 000258A4  7F 7C 02 14 */	add r27, r28, r0
/* 80029928 000258A8  48 00 00 04 */	b .L_8002992C
.L_8002992C:
/* 8002992C 000258AC  48 00 00 04 */	b .L_80029930
.L_80029930:
/* 80029930 000258B0  48 00 00 04 */	b .L_80029934
.L_80029934:
/* 80029934 000258B4  80 BB 01 A4 */	lwz r5, 0x1a4(r27)
/* 80029938 000258B8  7F 24 CB 78 */	mr r4, r25
/* 8002993C 000258BC  80 FB 01 B4 */	lwz r7, 0x1b4(r27)
/* 80029940 000258C0  38 7F 00 E8 */	addi r3, r31, 0xe8
/* 80029944 000258C4  38 D9 00 04 */	addi r6, r25, 0x4
/* 80029948 000258C8  4C C6 31 82 */	crclr 4*cr1+eq
/* 8002994C 000258CC  48 00 02 99 */	bl OSReport
/* 80029950 000258D0  3B 7B 00 04 */	addi r27, r27, 0x4
/* 80029954 000258D4  3B 39 00 01 */	addi r25, r25, 0x1
/* 80029958 000258D8  28 19 00 04 */	cmplwi r25, 0x4
/* 8002995C 000258DC  41 80 FF D8 */	blt .L_80029934
/* 80029960 000258E0  A0 1C 01 A2 */	lhz r0, 0x1a2(r28)
/* 80029964 000258E4  54 00 07 FE */	clrlwi r0, r0, 31
/* 80029968 000258E8  28 00 00 00 */	cmplwi r0, 0x0
/* 8002996C 000258EC  41 82 01 3C */	beq .L_80029AA8
/* 80029970 000258F0  48 00 16 75 */	bl OSDisableInterrupts
/* 80029974 000258F4  3C C0 80 00 */	lis r6, 0x800000D4@ha
/* 80029978 000258F8  80 06 00 D4 */	lwz r0, 0x800000D4@l(r6)
/* 8002997C 000258FC  38 A0 00 00 */	li r5, 0x0
/* 80029980 00025900  38 81 00 10 */	addi r4, r1, 0x10
/* 80029984 00025904  B0 A1 01 B0 */	sth r5, 0x1b0(r1)
/* 80029988 00025908  7C 1E 03 78 */	mr r30, r0
/* 8002998C 0002590C  7C 7D 1B 78 */	mr r29, r3
/* 80029990 00025910  B0 A1 01 B2 */	sth r5, 0x1b2(r1)
/* 80029994 00025914  80 06 00 D8 */	lwz r0, 0xd8(r6)
/* 80029998 00025918  7C 04 00 40 */	cmplw r4, r0
/* 8002999C 0002591C  40 82 00 08 */	bne .L_800299A4
/* 800299A0 00025920  90 A6 00 D8 */	stw r5, 0xd8(r6)
.L_800299A4:
/* 800299A4 00025924  38 61 00 10 */	addi r3, r1, 0x10
/* 800299A8 00025928  4B FF FC 21 */	bl OSSetCurrentContext
/* 800299AC 0002592C  38 7F 01 0C */	addi r3, r31, 0x10c
/* 800299B0 00025930  4C C6 31 82 */	crclr 4*cr1+eq
/* 800299B4 00025934  48 00 02 31 */	bl OSReport
/* 800299B8 00025938  3B 20 00 00 */	li r25, 0x0
/* 800299BC 0002593C  57 20 18 38 */	slwi r0, r25, 3
/* 800299C0 00025940  7F 5C 02 14 */	add r26, r28, r0
/* 800299C4 00025944  48 00 00 04 */	b .L_800299C8
.L_800299C8:
/* 800299C8 00025948  48 00 00 04 */	b .L_800299CC
.L_800299CC:
/* 800299CC 0002594C  48 00 00 04 */	b .L_800299D0
.L_800299D0:
/* 800299D0 00025950  C8 3A 00 98 */	lfd f1, 0x98(r26)
/* 800299D4 00025954  48 03 5A 29 */	bl __cvt_fp2unsigned
/* 800299D8 00025958  7C 7B 1B 78 */	mr r27, r3
/* 800299DC 0002595C  C8 3A 00 90 */	lfd f1, 0x90(r26)
/* 800299E0 00025960  48 03 5A 1D */	bl __cvt_fp2unsigned
/* 800299E4 00025964  7C 65 1B 78 */	mr r5, r3
/* 800299E8 00025968  4C C6 31 82 */	crclr 4*cr1+eq
/* 800299EC 0002596C  7F 24 CB 78 */	mr r4, r25
/* 800299F0 00025970  7F 67 DB 78 */	mr r7, r27
/* 800299F4 00025974  38 7F 01 20 */	addi r3, r31, 0x120
/* 800299F8 00025978  38 D9 00 01 */	addi r6, r25, 0x1
/* 800299FC 0002597C  48 00 01 E9 */	bl OSReport
/* 80029A00 00025980  3B 5A 00 10 */	addi r26, r26, 0x10
/* 80029A04 00025984  3B 39 00 02 */	addi r25, r25, 0x2
/* 80029A08 00025988  28 19 00 20 */	cmplwi r25, 0x20
/* 80029A0C 0002598C  41 80 FF C4 */	blt .L_800299D0
/* 80029A10 00025990  38 7F 01 3C */	addi r3, r31, 0x13c
/* 80029A14 00025994  4C C6 31 82 */	crclr 4*cr1+eq
/* 80029A18 00025998  48 00 01 CD */	bl OSReport
/* 80029A1C 0002599C  3B 20 00 00 */	li r25, 0x0
/* 80029A20 000259A0  57 20 18 38 */	slwi r0, r25, 3
/* 80029A24 000259A4  7F 5C 02 14 */	add r26, r28, r0
/* 80029A28 000259A8  48 00 00 04 */	b .L_80029A2C
.L_80029A2C:
/* 80029A2C 000259AC  48 00 00 04 */	b .L_80029A30
.L_80029A30:
/* 80029A30 000259B0  48 00 00 04 */	b .L_80029A34
.L_80029A34:
/* 80029A34 000259B4  C8 3A 01 D0 */	lfd f1, 0x1d0(r26)
/* 80029A38 000259B8  48 03 59 C5 */	bl __cvt_fp2unsigned
/* 80029A3C 000259BC  7C 7B 1B 78 */	mr r27, r3
/* 80029A40 000259C0  C8 3A 01 C8 */	lfd f1, 0x1c8(r26)
/* 80029A44 000259C4  48 03 59 B9 */	bl __cvt_fp2unsigned
/* 80029A48 000259C8  7C 65 1B 78 */	mr r5, r3
/* 80029A4C 000259CC  4C C6 31 82 */	crclr 4*cr1+eq
/* 80029A50 000259D0  7F 24 CB 78 */	mr r4, r25
/* 80029A54 000259D4  7F 67 DB 78 */	mr r7, r27
/* 80029A58 000259D8  38 7F 01 50 */	addi r3, r31, 0x150
/* 80029A5C 000259DC  38 D9 00 01 */	addi r6, r25, 0x1
/* 80029A60 000259E0  48 00 01 85 */	bl OSReport
/* 80029A64 000259E4  3B 5A 00 10 */	addi r26, r26, 0x10
/* 80029A68 000259E8  3B 39 00 02 */	addi r25, r25, 0x2
/* 80029A6C 000259EC  28 19 00 20 */	cmplwi r25, 0x20
/* 80029A70 000259F0  41 80 FF C4 */	blt .L_80029A34
/* 80029A74 000259F4  38 A0 00 00 */	li r5, 0x0
/* 80029A78 000259F8  B0 A1 01 B0 */	sth r5, 0x1b0(r1)
/* 80029A7C 000259FC  3C 60 80 00 */	lis r3, 0x800000D8@ha
/* 80029A80 00025A00  38 81 00 10 */	addi r4, r1, 0x10
/* 80029A84 00025A04  B0 A1 01 B2 */	sth r5, 0x1b2(r1)
/* 80029A88 00025A08  80 03 00 D8 */	lwz r0, 0x800000D8@l(r3)
/* 80029A8C 00025A0C  7C 04 00 40 */	cmplw r4, r0
/* 80029A90 00025A10  40 82 00 08 */	bne .L_80029A98
/* 80029A94 00025A14  90 A3 00 D8 */	stw r5, 0xd8(r3)
.L_80029A98:
/* 80029A98 00025A18  7F C3 F3 78 */	mr r3, r30
/* 80029A9C 00025A1C  4B FF FB 2D */	bl OSSetCurrentContext
/* 80029AA0 00025A20  7F A3 EB 78 */	mr r3, r29
/* 80029AA4 00025A24  48 00 15 69 */	bl OSRestoreInterrupts
.L_80029AA8:
/* 80029AA8 00025A28  38 7F 01 70 */	addi r3, r31, 0x170
/* 80029AAC 00025A2C  4C C6 31 82 */	crclr 4*cr1+eq
/* 80029AB0 00025A30  48 00 01 35 */	bl OSReport
/* 80029AB4 00025A34  83 3C 00 04 */	lwz r25, 0x4(r28)
/* 80029AB8 00025A38  3B 40 00 00 */	li r26, 0x0
/* 80029ABC 00025A3C  48 00 00 04 */	b .L_80029AC0
.L_80029AC0:
/* 80029AC0 00025A40  48 00 00 04 */	b .L_80029AC4
.L_80029AC4:
/* 80029AC4 00025A44  48 00 00 20 */	b .L_80029AE4
.L_80029AC8:
/* 80029AC8 00025A48  80 B9 00 00 */	lwz r5, 0x0(r25)
/* 80029ACC 00025A4C  7F 24 CB 78 */	mr r4, r25
/* 80029AD0 00025A50  80 D9 00 04 */	lwz r6, 0x4(r25)
/* 80029AD4 00025A54  38 7F 01 98 */	addi r3, r31, 0x198
/* 80029AD8 00025A58  4C C6 31 82 */	crclr 4*cr1+eq
/* 80029ADC 00025A5C  48 00 01 09 */	bl OSReport
/* 80029AE0 00025A60  83 39 00 00 */	lwz r25, 0x0(r25)
.L_80029AE4:
/* 80029AE4 00025A64  28 19 00 00 */	cmplwi r25, 0x0
/* 80029AE8 00025A68  41 82 00 1C */	beq .L_80029B04
/* 80029AEC 00025A6C  3C 19 00 01 */	addis r0, r25, 0x1
/* 80029AF0 00025A70  28 00 FF FF */	cmplwi r0, 0xffff
/* 80029AF4 00025A74  41 82 00 10 */	beq .L_80029B04
/* 80029AF8 00025A78  28 1A 00 10 */	cmplwi r26, 0x10
/* 80029AFC 00025A7C  3B 5A 00 01 */	addi r26, r26, 0x1
/* 80029B00 00025A80  41 80 FF C8 */	blt .L_80029AC8
.L_80029B04:
/* 80029B04 00025A84  BB 21 02 DC */	lmw r25, 0x2dc(r1)
/* 80029B08 00025A88  80 01 02 FC */	lwz r0, 0x2fc(r1)
/* 80029B0C 00025A8C  38 21 02 F8 */	addi r1, r1, 0x2f8
/* 80029B10 00025A90  7C 08 03 A6 */	mtlr r0
/* 80029B14 00025A94  4E 80 00 20 */	blr

OSSwitchFPUContext:
/* 80029B18 00025A98  7C A0 00 A6 */	mfmsr r5
/* 80029B1C 00025A9C  60 A5 20 00 */	ori r5, r5, 0x2000
/* 80029B20 00025AA0  7C A0 01 24 */	mtmsr r5
/* 80029B24 00025AA4  4C 00 01 2C */	isync
/* 80029B28 00025AA8  80 A4 01 9C */	lwz r5, 0x19c(r4)
/* 80029B2C 00025AAC  60 A5 20 00 */	ori r5, r5, 0x2000
/* 80029B30 00025AB0  7C BB 03 A6 */	mtsrr1 r5
/* 80029B34 00025AB4  3C 60 80 00 */	lis r3, 0x800000D8@ha
/* 80029B38 00025AB8  80 A3 00 D8 */	lwz r5, 0x800000D8@l(r3)
/* 80029B3C 00025ABC  90 83 00 D8 */	stw r4, 0xd8(r3)
/* 80029B40 00025AC0  7C 05 20 00 */	cmpw r5, r4
/* 80029B44 00025AC4  41 82 00 14 */	beq .L_80029B58
/* 80029B48 00025AC8  2C 05 00 00 */	cmpwi r5, 0x0
/* 80029B4C 00025ACC  41 82 00 08 */	beq .L_80029B54
/* 80029B50 00025AD0  4B FF F9 51 */	bl __OSSaveFPUContext
.L_80029B54:
/* 80029B54 00025AD4  4B FF F8 29 */	bl __OSLoadFPUContext
.L_80029B58:
/* 80029B58 00025AD8  80 64 00 80 */	lwz r3, 0x80(r4)
/* 80029B5C 00025ADC  7C 6F F1 20 */	mtcrf 255, r3
/* 80029B60 00025AE0  80 64 00 84 */	lwz r3, 0x84(r4)
/* 80029B64 00025AE4  7C 68 03 A6 */	mtlr r3
/* 80029B68 00025AE8  80 64 01 98 */	lwz r3, 0x198(r4)
/* 80029B6C 00025AEC  7C 7A 03 A6 */	mtsrr0 r3
/* 80029B70 00025AF0  80 64 00 88 */	lwz r3, 0x88(r4)
/* 80029B74 00025AF4  7C 69 03 A6 */	mtctr r3
/* 80029B78 00025AF8  80 64 00 8C */	lwz r3, 0x8c(r4)
/* 80029B7C 00025AFC  7C 61 03 A6 */	mtxer r3
/* 80029B80 00025B00  A0 64 01 A2 */	lhz r3, 0x1a2(r4)
/* 80029B84 00025B04  54 63 07 FA */	rlwinm r3, r3, 0, 31, 29
/* 80029B88 00025B08  B0 64 01 A2 */	sth r3, 0x1a2(r4)
/* 80029B8C 00025B0C  80 A4 00 14 */	lwz r5, 0x14(r4)
/* 80029B90 00025B10  80 64 00 0C */	lwz r3, 0xc(r4)
/* 80029B94 00025B14  80 84 00 10 */	lwz r4, 0x10(r4)
/* 80029B98 00025B18  4C 00 00 64 */	rfi

.global __OSContextInit
__OSContextInit:
/* 80029B9C 00025B1C  7C 08 02 A6 */	mflr r0
/* 80029BA0 00025B20  90 01 00 04 */	stw r0, 0x4(r1)
/* 80029BA4 00025B24  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80029BA8 00025B28  3C 60 80 03 */	lis r3, OSSwitchFPUContext@ha
/* 80029BAC 00025B2C  38 83 9B 18 */	addi r4, r3, OSSwitchFPUContext@l
/* 80029BB0 00025B30  38 60 00 07 */	li r3, 0x7
/* 80029BB4 00025B34  4B FF E2 15 */	bl __OSDBJUMPEND
/* 80029BB8 00025B38  38 00 00 00 */	li r0, 0x0
/* 80029BBC 00025B3C  4C C6 31 82 */	crclr 4*cr1+eq
/* 80029BC0 00025B40  3C 80 80 00 */	lis r4, 0x800000D8@ha
/* 80029BC4 00025B44  3C 60 80 06 */	lis r3, lbl_80067EAC@ha
/* 80029BC8 00025B48  90 04 00 D8 */	stw r0, 0x800000D8@l(r4)
/* 80029BCC 00025B4C  38 63 7E AC */	addi r3, r3, lbl_80067EAC@l
/* 80029BD0 00025B50  48 00 5D 51 */	bl DBPrintf
/* 80029BD4 00025B54  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80029BD8 00025B58  38 21 00 08 */	addi r1, r1, 0x8
/* 80029BDC 00025B5C  7C 08 03 A6 */	mtlr r0
/* 80029BE0 00025B60  4E 80 00 20 */	blr

.section .data, "wa"  # 0x80065000 - 0x8006D1C0


lbl_80067CF8:
	.asciz "------------------------- Context 0x%08x -------------------------\n"
	.asciz "r%-2d  = 0x%08x (%14d)  r%-2d  = 0x%08x (%14d)\n"
	.asciz "LR   = 0x%08x                   CR   = 0x%08x\n"
	.balign 4
	.asciz "SRR0 = 0x%08x                   SRR1 = 0x%08x\n"
	.balign 4
	.asciz "\nGQRs----------\n"
	.balign 4
	.asciz "gqr%d = 0x%08x \t gqr%d = 0x%08x\n"
	.balign 4
	.asciz "\n\nFPRs----------\n"
	.balign 4
	.asciz "fr%d \t= %d \t fr%d \t= %d\n"
	.balign 4
	.asciz "\n\nPSFs----------\n"
	.balign 4
	.asciz "ps%d \t= 0x%x \t ps%d \t= 0x%x\n"
	.balign 4
	.asciz "\nAddress:      Back Chain    LR Save\n"
	.balign 4
	.asciz "0x%08x:   0x%08x    0x%08x\n"

lbl_80067EAC:
	.asciz "FPU-unavailable handler installed\n"
	.balign 4