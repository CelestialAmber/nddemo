.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740



.fn sndInit, global
/* 80055588 00051508  7C 08 02 A6 */	mflr r0
/* 8005558C 0005150C  39 00 00 00 */	li r8, 0x0
/* 80055590 00051510  90 01 00 04 */	stw r0, 0x4(r1)
/* 80055594 00051514  54 60 06 3E */	clrlwi r0, r3, 24
/* 80055598 00051518  28 00 00 40 */	cmplwi r0, 0x40
/* 8005559C 0005151C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800555A0 00051520  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 800555A4 00051524  93 C1 00 28 */	stw r30, 0x28(r1)
/* 800555A8 00051528  7C FE 3B 78 */	mr r30, r7
/* 800555AC 0005152C  99 0D 87 30 */	stb r8, sndActive@sda21(r13)
/* 800555B0 00051530  41 81 00 14 */	bgt .L_800555C4
/* 800555B4 00051534  3C E0 80 09 */	lis r7, synthInfo@ha
/* 800555B8 00051538  38 E7 EC 38 */	addi r7, r7, synthInfo@l
/* 800555BC 0005153C  98 67 02 10 */	stb r3, 0x210(r7)
/* 800555C0 00051540  48 00 00 14 */	b .L_800555D4
.L_800555C4:
/* 800555C4 00051544  3C 60 80 09 */	lis r3, synthInfo@ha
/* 800555C8 00051548  38 63 EC 38 */	addi r3, r3, synthInfo@l
/* 800555CC 0005154C  38 00 00 40 */	li r0, 0x40
/* 800555D0 00051550  98 03 02 10 */	stb r0, 0x210(r3)
.L_800555D4:
/* 800555D4 00051554  3C 60 80 09 */	lis r3, synthInfo@ha
/* 800555D8 00051558  38 63 EC 38 */	addi r3, r3, synthInfo@l
/* 800555DC 0005155C  98 83 02 11 */	stb r4, 0x211(r3)
/* 800555E0 00051560  38 00 7D 00 */	li r0, 0x7d00
/* 800555E4 00051564  3B E3 02 10 */	addi r31, r3, 0x210
/* 800555E8 00051568  98 A3 02 12 */	stb r5, 0x212(r3)
/* 800555EC 0005156C  38 A6 00 00 */	addi r5, r6, 0x0
/* 800555F0 00051570  38 61 00 20 */	addi r3, r1, 0x20
/* 800555F4 00051574  90 01 00 20 */	stw r0, 0x20(r1)
/* 800555F8 00051578  88 9F 00 00 */	lbz r4, 0x0(r31)
/* 800555FC 0005157C  48 00 20 81 */	bl hwInit
/* 80055600 00051580  2C 03 00 00 */	cmpwi r3, 0x0
/* 80055604 00051584  40 82 00 44 */	bne .L_80055648
/* 80055608 00051588  8B FF 00 00 */	lbz r31, 0x0(r31)
/* 8005560C 0005158C  4B FF AA 89 */	bl dataInitStack
/* 80055610 00051590  38 60 00 00 */	li r3, 0x0
/* 80055614 00051594  38 9E 00 00 */	addi r4, r30, 0x0
/* 80055618 00051598  4B FF 50 B9 */	bl dataInit
/* 8005561C 0005159C  4B FE F3 8D */	bl seqInit
/* 80055620 000515A0  38 00 00 00 */	li r0, 0x0
/* 80055624 000515A4  98 0D 87 60 */	stb r0, synthIdleWaitActive@sda21(r13)
/* 80055628 000515A8  38 9F 00 00 */	addi r4, r31, 0x0
/* 8005562C 000515AC  38 60 7D 00 */	li r3, 0x7d00
/* 80055630 000515B0  4B FF 20 A9 */	bl synthInit
/* 80055634 000515B4  4B FF 2C 9D */	bl streamInit
/* 80055638 000515B8  4B FF FF 1D */	bl s3dInit
/* 8005563C 000515BC  38 00 00 01 */	li r0, 0x1
/* 80055640 000515C0  98 0D 87 30 */	stb r0, sndActive@sda21(r13)
/* 80055644 000515C4  38 60 00 00 */	li r3, 0x0
.L_80055648:
/* 80055648 000515C8  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8005564C 000515CC  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 80055650 000515D0  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 80055654 000515D4  7C 08 03 A6 */	mtlr r0
/* 80055658 000515D8  38 21 00 30 */	addi r1, r1, 0x30
/* 8005565C 000515DC  4E 80 00 20 */	blr
.endfn sndInit

.fn sndQuit, global
/* 80055660 000515E0  7C 08 02 A6 */	mflr r0
/* 80055664 000515E4  90 01 00 04 */	stw r0, 0x4(r1)
/* 80055668 000515E8  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8005566C 000515EC  48 00 20 C5 */	bl hwExit
/* 80055670 000515F0  4B FF 51 45 */	bl dataExit
/* 80055674 000515F4  4B FF FF 11 */	bl s3dExit
/* 80055678 000515F8  4B FF 25 4D */	bl synthExit
/* 8005567C 000515FC  38 00 00 00 */	li r0, 0x0
/* 80055680 00051600  98 0D 87 30 */	stb r0, sndActive@sda21(r13)
/* 80055684 00051604  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80055688 00051608  38 21 00 08 */	addi r1, r1, 0x8
/* 8005568C 0005160C  7C 08 03 A6 */	mtlr r0
/* 80055690 00051610  4E 80 00 20 */	blr
.endfn sndQuit

.section extab, "a"  # 0x80005520 - 0x80005BC0

.obj "@etb_80005948", local
.hidden "@etb_80005948"
	.4byte 0x10080000
	.4byte 0
.endobj "@etb_80005948"

.obj "@etb_80005950", local
.hidden "@etb_80005950"
	.4byte 0x00080000
	.4byte 0
.endobj "@etb_80005950"

.section extabindex, "a"  # 0x80005BC0 - 0x800065A0

.obj "@eti_800061FC", local
.hidden "@eti_800061FC"
	.4byte sndInit
	.4byte 0x000000D8
	.4byte "@etb_80005948"
.endobj "@eti_800061FC"

.obj "@eti_80006208", local
.hidden "@eti_80006208"
	.4byte sndQuit
	.4byte 0x00000034
	.4byte "@etb_80005950"
.endobj "@eti_80006208"
