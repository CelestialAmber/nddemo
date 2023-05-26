.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740



.fn salApplyMatrix, global
/* 80055694 00051614  C0 63 00 00 */	lfs f3, 0x0(r3)
/* 80055698 00051618  C0 44 00 00 */	lfs f2, 0x0(r4)
/* 8005569C 0005161C  C0 23 00 04 */	lfs f1, 0x4(r3)
/* 800556A0 00051620  C0 04 00 04 */	lfs f0, 0x4(r4)
/* 800556A4 00051624  EC 43 00 B2 */	fmuls f2, f3, f2
/* 800556A8 00051628  C0 63 00 08 */	lfs f3, 0x8(r3)
/* 800556AC 0005162C  EC 01 00 32 */	fmuls f0, f1, f0
/* 800556B0 00051630  C0 24 00 08 */	lfs f1, 0x8(r4)
/* 800556B4 00051634  C0 83 00 24 */	lfs f4, 0x24(r3)
/* 800556B8 00051638  EC 23 00 72 */	fmuls f1, f3, f1
/* 800556BC 0005163C  EC 02 00 2A */	fadds f0, f2, f0
/* 800556C0 00051640  EC 01 00 2A */	fadds f0, f1, f0
/* 800556C4 00051644  EC 04 00 2A */	fadds f0, f4, f0
/* 800556C8 00051648  D0 05 00 00 */	stfs f0, 0x0(r5)
/* 800556CC 0005164C  C0 63 00 0C */	lfs f3, 0xc(r3)
/* 800556D0 00051650  C0 44 00 00 */	lfs f2, 0x0(r4)
/* 800556D4 00051654  C0 23 00 10 */	lfs f1, 0x10(r3)
/* 800556D8 00051658  C0 04 00 04 */	lfs f0, 0x4(r4)
/* 800556DC 0005165C  EC 43 00 B2 */	fmuls f2, f3, f2
/* 800556E0 00051660  C0 63 00 14 */	lfs f3, 0x14(r3)
/* 800556E4 00051664  EC 01 00 32 */	fmuls f0, f1, f0
/* 800556E8 00051668  C0 24 00 08 */	lfs f1, 0x8(r4)
/* 800556EC 0005166C  C0 83 00 28 */	lfs f4, 0x28(r3)
/* 800556F0 00051670  EC 23 00 72 */	fmuls f1, f3, f1
/* 800556F4 00051674  EC 02 00 2A */	fadds f0, f2, f0
/* 800556F8 00051678  EC 01 00 2A */	fadds f0, f1, f0
/* 800556FC 0005167C  EC 04 00 2A */	fadds f0, f4, f0
/* 80055700 00051680  D0 05 00 04 */	stfs f0, 0x4(r5)
/* 80055704 00051684  C0 63 00 18 */	lfs f3, 0x18(r3)
/* 80055708 00051688  C0 44 00 00 */	lfs f2, 0x0(r4)
/* 8005570C 0005168C  C0 23 00 1C */	lfs f1, 0x1c(r3)
/* 80055710 00051690  C0 04 00 04 */	lfs f0, 0x4(r4)
/* 80055714 00051694  EC 43 00 B2 */	fmuls f2, f3, f2
/* 80055718 00051698  C0 63 00 20 */	lfs f3, 0x20(r3)
/* 8005571C 0005169C  EC 01 00 32 */	fmuls f0, f1, f0
/* 80055720 000516A0  C0 24 00 08 */	lfs f1, 0x8(r4)
/* 80055724 000516A4  C0 83 00 2C */	lfs f4, 0x2c(r3)
/* 80055728 000516A8  EC 23 00 72 */	fmuls f1, f3, f1
/* 8005572C 000516AC  EC 02 00 2A */	fadds f0, f2, f0
/* 80055730 000516B0  EC 01 00 2A */	fadds f0, f1, f0
/* 80055734 000516B4  EC 04 00 2A */	fadds f0, f4, f0
/* 80055738 000516B8  D0 05 00 08 */	stfs f0, 0x8(r5)
/* 8005573C 000516BC  4E 80 00 20 */	blr
.endfn salApplyMatrix

.fn salNormalizeVector, global
/* 80055740 000516C0  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80055744 000516C4  C0 23 00 00 */	lfs f1, 0x0(r3)
/* 80055748 000516C8  C0 03 00 04 */	lfs f0, 0x4(r3)
/* 8005574C 000516CC  EC 41 00 72 */	fmuls f2, f1, f1
/* 80055750 000516D0  C0 63 00 08 */	lfs f3, 0x8(r3)
/* 80055754 000516D4  EC 20 00 32 */	fmuls f1, f0, f0
/* 80055758 000516D8  C0 02 87 00 */	lfs f0, float_800A9A80@sda21(r2)
/* 8005575C 000516DC  EC 63 00 F2 */	fmuls f3, f3, f3
/* 80055760 000516E0  EC 22 08 2A */	fadds f1, f2, f1
/* 80055764 000516E4  EC 23 08 2A */	fadds f1, f3, f1
/* 80055768 000516E8  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8005576C 000516EC  40 81 00 5C */	ble .L_800557C8
/* 80055770 000516F0  FC 40 08 34 */	frsqrte f2, f1
/* 80055774 000516F4  C8 82 87 08 */	lfd f4, double_800A9A88@sda21(r2)
/* 80055778 000516F8  C8 62 87 10 */	lfd f3, double_800A9A90@sda21(r2)
/* 8005577C 000516FC  FC 02 00 B2 */	fmul f0, f2, f2
/* 80055780 00051700  FC 44 00 B2 */	fmul f2, f4, f2
/* 80055784 00051704  FC 01 00 32 */	fmul f0, f1, f0
/* 80055788 00051708  FC 03 00 28 */	fsub f0, f3, f0
/* 8005578C 0005170C  FC 42 00 32 */	fmul f2, f2, f0
/* 80055790 00051710  FC 02 00 B2 */	fmul f0, f2, f2
/* 80055794 00051714  FC 44 00 B2 */	fmul f2, f4, f2
/* 80055798 00051718  FC 01 00 32 */	fmul f0, f1, f0
/* 8005579C 0005171C  FC 03 00 28 */	fsub f0, f3, f0
/* 800557A0 00051720  FC 42 00 32 */	fmul f2, f2, f0
/* 800557A4 00051724  FC 02 00 B2 */	fmul f0, f2, f2
/* 800557A8 00051728  FC 44 00 B2 */	fmul f2, f4, f2
/* 800557AC 0005172C  FC 01 00 32 */	fmul f0, f1, f0
/* 800557B0 00051730  FC 03 00 28 */	fsub f0, f3, f0
/* 800557B4 00051734  FC 02 00 32 */	fmul f0, f2, f0
/* 800557B8 00051738  FC 01 00 32 */	fmul f0, f1, f0
/* 800557BC 0005173C  FC 00 00 18 */	frsp f0, f0
/* 800557C0 00051740  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 800557C4 00051744  C0 21 00 0C */	lfs f1, 0xc(r1)
.L_800557C8:
/* 800557C8 00051748  C0 03 00 00 */	lfs f0, 0x0(r3)
/* 800557CC 0005174C  38 21 00 18 */	addi r1, r1, 0x18
/* 800557D0 00051750  EC 00 08 24 */	fdivs f0, f0, f1
/* 800557D4 00051754  D0 03 00 00 */	stfs f0, 0x0(r3)
/* 800557D8 00051758  C0 03 00 04 */	lfs f0, 0x4(r3)
/* 800557DC 0005175C  EC 00 08 24 */	fdivs f0, f0, f1
/* 800557E0 00051760  D0 03 00 04 */	stfs f0, 0x4(r3)
/* 800557E4 00051764  C0 03 00 08 */	lfs f0, 0x8(r3)
/* 800557E8 00051768  EC 00 08 24 */	fdivs f0, f0, f1
/* 800557EC 0005176C  D0 03 00 08 */	stfs f0, 0x8(r3)
/* 800557F0 00051770  4E 80 00 20 */	blr
.endfn salNormalizeVector

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0

.balign 8

.obj float_800A9A80, local
	.float 0
.endobj float_800A9A80

.4byte 0

.obj double_800A9A88, local
	.double 0.5
.endobj double_800A9A88

.obj double_800A9A90, local
	.double 3
.endobj double_800A9A90
