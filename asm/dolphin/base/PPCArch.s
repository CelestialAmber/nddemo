.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn PPCMfmsr, global
/* 80027688 00023608  7C 60 00 A6 */	mfmsr r3
/* 8002768C 0002360C  4E 80 00 20 */	blr
.endfn PPCMfmsr

.fn PPCMtmsr, global
/* 80027690 00023610  7C 60 01 24 */	mtmsr r3
/* 80027694 00023614  4E 80 00 20 */	blr
.endfn PPCMtmsr

.fn PPCMfhid0, global
/* 80027698 00023618  7C 70 FA A6 */	mfspr r3, HID0
/* 8002769C 0002361C  4E 80 00 20 */	blr
.endfn PPCMfhid0

.fn PPCMfl2cr, global
/* 800276A0 00023620  7C 79 FA A6 */	mfspr r3, L2CR
/* 800276A4 00023624  4E 80 00 20 */	blr
.endfn PPCMfl2cr

.fn PPCMtl2cr, global
/* 800276A8 00023628  7C 79 FB A6 */	mtspr L2CR, r3
/* 800276AC 0002362C  4E 80 00 20 */	blr
.endfn PPCMtl2cr

.fn PPCMtdec, global
/* 800276B0 00023630  7C 76 03 A6 */	mtdec r3
/* 800276B4 00023634  4E 80 00 20 */	blr
.endfn PPCMtdec

.fn PPCSync, global
/* 800276B8 00023638  44 00 00 02 */	sc
/* 800276BC 0002363C  4E 80 00 20 */	blr
.endfn PPCSync

.fn PPCHalt, global
/* 800276C0 00023640  7C 00 04 AC */	sync
.L_800276C4:
/* 800276C4 00023644  60 00 00 00 */	nop
/* 800276C8 00023648  38 60 00 00 */	li r3, 0x0
/* 800276CC 0002364C  60 00 00 00 */	nop
/* 800276D0 00023650  4B FF FF F4 */	b .L_800276C4
.endfn PPCHalt

.fn PPCMfhid2, global
/* 800276D4 00023654  7C 78 E2 A6 */	mfspr r3, HID2
/* 800276D8 00023658  4E 80 00 20 */	blr
.endfn PPCMfhid2

.fn PPCMthid2, global
/* 800276DC 0002365C  7C 78 E3 A6 */	mtspr HID2, r3
/* 800276E0 00023660  4E 80 00 20 */	blr
.endfn PPCMthid2

.fn PPCMtwpar, global
/* 800276E4 00023664  7C 79 E3 A6 */	mtspr WPAR, r3
/* 800276E8 00023668  4E 80 00 20 */	blr
.endfn PPCMtwpar
