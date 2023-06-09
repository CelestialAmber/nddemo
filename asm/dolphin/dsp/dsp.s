.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn DSPCheckMailToDSP, global
/* 80039268 000351E8  3C 60 CC 00 */	lis r3, 0xCC005000@ha
/* 8003926C 000351EC  A0 03 50 00 */	lhz r0, 0xCC005000@l(r3)
/* 80039270 000351F0  54 03 8F FE */	extrwi r3, r0, 1, 16
/* 80039274 000351F4  4E 80 00 20 */	blr
.endfn DSPCheckMailToDSP

.fn DSPCheckMailFromDSP, global
/* 80039278 000351F8  3C 60 CC 00 */	lis r3, 0xCC005004@ha
/* 8003927C 000351FC  A0 03 50 04 */	lhz r0, 0xCC005004@l(r3)
/* 80039280 00035200  54 03 8F FE */	extrwi r3, r0, 1, 16
/* 80039284 00035204  4E 80 00 20 */	blr
.endfn DSPCheckMailFromDSP

.fn DSPReadMailFromDSP, global
/* 80039288 00035208  3C 60 CC 00 */	lis r3, 0xCC005000@ha
/* 8003928C 0003520C  38 63 50 00 */	addi r3, r3, 0xCC005000@l
/* 80039290 00035210  A0 03 00 04 */	lhz r0, 0x4(r3)
/* 80039294 00035214  A0 63 00 06 */	lhz r3, 0x6(r3)
/* 80039298 00035218  50 03 80 1E */	rlwimi r3, r0, 16, 0, 15
/* 8003929C 0003521C  4E 80 00 20 */	blr
.endfn DSPReadMailFromDSP

.fn DSPSendMailToDSP, global
/* 800392A0 00035220  3C 80 CC 00 */	lis r4, 0xCC005000@ha
/* 800392A4 00035224  54 60 84 3E */	srwi r0, r3, 16
/* 800392A8 00035228  B0 04 50 00 */	sth r0, 0xCC005000@l(r4)
/* 800392AC 0003522C  B0 64 50 02 */	sth r3, 0x5002(r4)
/* 800392B0 00035230  4E 80 00 20 */	blr
.endfn DSPSendMailToDSP

.fn DSPInit, global
/* 800392B4 00035234  7C 08 02 A6 */	mflr r0
/* 800392B8 00035238  3C 60 80 07 */	lis r3, lbl_800686E0@ha
/* 800392BC 0003523C  90 01 00 04 */	stw r0, 0x4(r1)
/* 800392C0 00035240  38 63 86 E0 */	addi r3, r3, lbl_800686E0@l
/* 800392C4 00035244  4C C6 31 82 */	crclr 4*cr1+eq
/* 800392C8 00035248  38 83 00 20 */	addi r4, r3, 0x20
/* 800392CC 0003524C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800392D0 00035250  38 A3 00 2C */	addi r5, r3, 0x2c
/* 800392D4 00035254  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800392D8 00035258  48 00 01 9D */	bl __DSP_debug_printf
/* 800392DC 0003525C  80 0D 86 A8 */	lwz r0, __DSP_init_flag@sda21(r13)
/* 800392E0 00035260  2C 00 00 01 */	cmpwi r0, 0x1
/* 800392E4 00035264  41 82 00 74 */	beq .L_80039358
/* 800392E8 00035268  4B FF 1C FD */	bl OSDisableInterrupts
/* 800392EC 0003526C  3C 80 80 04 */	lis r4, __DSPHandler@ha
/* 800392F0 00035270  3B E3 00 00 */	addi r31, r3, 0x0
/* 800392F4 00035274  38 84 94 C4 */	addi r4, r4, __DSPHandler@l
/* 800392F8 00035278  38 60 00 07 */	li r3, 0x7
/* 800392FC 0003527C  4B FF 1D 35 */	bl __OSSetInterruptHandler
/* 80039300 00035280  3C 60 01 00 */	lis r3, 0x100
/* 80039304 00035284  4B FF 21 31 */	bl __OSUnmaskInterrupts
/* 80039308 00035288  3C 60 CC 00 */	lis r3, 0xCC005000@ha
/* 8003930C 0003528C  38 C3 50 00 */	addi r6, r3, 0xCC005000@l
/* 80039310 00035290  A0 63 50 0A */	lhz r3, 0x500a(r3)
/* 80039314 00035294  38 00 FF 57 */	li r0, -0xa9
/* 80039318 00035298  7C 60 00 38 */	and r0, r3, r0
/* 8003931C 0003529C  60 00 08 00 */	ori r0, r0, 0x800
/* 80039320 000352A0  B0 06 00 0A */	sth r0, 0xa(r6)
/* 80039324 000352A4  38 A0 FF 53 */	li r5, -0xad
/* 80039328 000352A8  38 80 00 00 */	li r4, 0x0
/* 8003932C 000352AC  A0 E6 00 0A */	lhz r7, 0xa(r6)
/* 80039330 000352B0  38 00 00 01 */	li r0, 0x1
/* 80039334 000352B4  38 7F 00 00 */	addi r3, r31, 0x0
/* 80039338 000352B8  7C E5 28 38 */	and r5, r7, r5
/* 8003933C 000352BC  B0 A6 00 0A */	sth r5, 0xa(r6)
/* 80039340 000352C0  90 8D 86 B8 */	stw r4, __DSP_tmp_task@sda21(r13)
/* 80039344 000352C4  90 8D 86 C4 */	stw r4, __DSP_curr_task@sda21(r13)
/* 80039348 000352C8  90 8D 86 BC */	stw r4, __DSP_last_task@sda21(r13)
/* 8003934C 000352CC  90 8D 86 C0 */	stw r4, __DSP_first_task@sda21(r13)
/* 80039350 000352D0  90 0D 86 A8 */	stw r0, __DSP_init_flag@sda21(r13)
/* 80039354 000352D4  4B FF 1C B9 */	bl OSRestoreInterrupts
.L_80039358:
/* 80039358 000352D8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8003935C 000352DC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80039360 000352E0  38 21 00 10 */	addi r1, r1, 0x10
/* 80039364 000352E4  7C 08 03 A6 */	mtlr r0
/* 80039368 000352E8  4E 80 00 20 */	blr
.endfn DSPInit

.fn DSPReset, global
/* 8003936C 000352EC  7C 08 02 A6 */	mflr r0
/* 80039370 000352F0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80039374 000352F4  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80039378 000352F8  4B FF 1C 6D */	bl OSDisableInterrupts
/* 8003937C 000352FC  3C 80 CC 00 */	lis r4, 0xCC005000@ha
/* 80039380 00035300  38 84 50 00 */	addi r4, r4, 0xCC005000@l
/* 80039384 00035304  A0 A4 00 0A */	lhz r5, 0xa(r4)
/* 80039388 00035308  38 00 FF 57 */	li r0, -0xa9
/* 8003938C 0003530C  7C A0 00 38 */	and r0, r5, r0
/* 80039390 00035310  60 00 08 01 */	ori r0, r0, 0x801
/* 80039394 00035314  B0 04 00 0A */	sth r0, 0xa(r4)
/* 80039398 00035318  38 00 00 00 */	li r0, 0x0
/* 8003939C 0003531C  90 0D 86 A8 */	stw r0, __DSP_init_flag@sda21(r13)
/* 800393A0 00035320  4B FF 1C 6D */	bl OSRestoreInterrupts
/* 800393A4 00035324  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800393A8 00035328  38 21 00 08 */	addi r1, r1, 0x8
/* 800393AC 0003532C  7C 08 03 A6 */	mtlr r0
/* 800393B0 00035330  4E 80 00 20 */	blr
.endfn DSPReset

.fn DSPHalt, global
/* 800393B4 00035334  7C 08 02 A6 */	mflr r0
/* 800393B8 00035338  90 01 00 04 */	stw r0, 0x4(r1)
/* 800393BC 0003533C  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 800393C0 00035340  4B FF 1C 25 */	bl OSDisableInterrupts
/* 800393C4 00035344  3C 80 CC 00 */	lis r4, 0xCC005000@ha
/* 800393C8 00035348  38 84 50 00 */	addi r4, r4, 0xCC005000@l
/* 800393CC 0003534C  A0 A4 00 0A */	lhz r5, 0xa(r4)
/* 800393D0 00035350  38 00 FF 57 */	li r0, -0xa9
/* 800393D4 00035354  7C A0 00 38 */	and r0, r5, r0
/* 800393D8 00035358  60 00 00 04 */	ori r0, r0, 0x4
/* 800393DC 0003535C  B0 04 00 0A */	sth r0, 0xa(r4)
/* 800393E0 00035360  4B FF 1C 2D */	bl OSRestoreInterrupts
/* 800393E4 00035364  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800393E8 00035368  38 21 00 08 */	addi r1, r1, 0x8
/* 800393EC 0003536C  7C 08 03 A6 */	mtlr r0
/* 800393F0 00035370  4E 80 00 20 */	blr
.endfn DSPHalt

.fn DSPGetDMAStatus, global
/* 800393F4 00035374  3C 60 CC 00 */	lis r3, 0xCC00500A@ha
/* 800393F8 00035378  A0 03 50 0A */	lhz r0, 0xCC00500A@l(r3)
/* 800393FC 0003537C  54 03 05 AC */	rlwinm r3, r0, 0, 22, 22
/* 80039400 00035380  4E 80 00 20 */	blr
.endfn DSPGetDMAStatus

.fn DSPAddTask, global
/* 80039404 00035384  7C 08 02 A6 */	mflr r0
/* 80039408 00035388  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003940C 0003538C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80039410 00035390  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80039414 00035394  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80039418 00035398  7C 7E 1B 78 */	mr r30, r3
/* 8003941C 0003539C  4B FF 1B C9 */	bl OSDisableInterrupts
/* 80039420 000353A0  3B E3 00 00 */	addi r31, r3, 0x0
/* 80039424 000353A4  38 7E 00 00 */	addi r3, r30, 0x0
/* 80039428 000353A8  48 00 07 ED */	bl __DSP_insert_task
/* 8003942C 000353AC  38 00 00 00 */	li r0, 0x0
/* 80039430 000353B0  90 1E 00 00 */	stw r0, 0x0(r30)
/* 80039434 000353B4  38 00 00 01 */	li r0, 0x1
/* 80039438 000353B8  38 7F 00 00 */	addi r3, r31, 0x0
/* 8003943C 000353BC  90 1E 00 08 */	stw r0, 0x8(r30)
/* 80039440 000353C0  4B FF 1B CD */	bl OSRestoreInterrupts
/* 80039444 000353C4  80 0D 86 C0 */	lwz r0, __DSP_first_task@sda21(r13)
/* 80039448 000353C8  7C 1E 00 40 */	cmplw r30, r0
/* 8003944C 000353CC  40 82 00 0C */	bne .L_80039458
/* 80039450 000353D0  7F C3 F3 78 */	mr r3, r30
/* 80039454 000353D4  48 00 06 35 */	bl __DSP_boot_task
.L_80039458:
/* 80039458 000353D8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8003945C 000353DC  7F C3 F3 78 */	mr r3, r30
/* 80039460 000353E0  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80039464 000353E4  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 80039468 000353E8  7C 08 03 A6 */	mtlr r0
/* 8003946C 000353EC  38 21 00 18 */	addi r1, r1, 0x18
/* 80039470 000353F0  4E 80 00 20 */	blr
.endfn DSPAddTask

.section .data, "wa"  # 0x80065000 - 0x8006D1C0

.balign 8

.obj lbl_800686E0, local
	.asciz "DSPInit(): Build Date: %s %s\n"
	.balign 4
	.asciz "Sep  8 2001"
	.asciz "01:51:48"
	.balign 4
.endobj lbl_800686E0

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380

.balign 8

.obj __DSP_init_flag, local
	.skip 0x4
.endobj __DSP_init_flag
