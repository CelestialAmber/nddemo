.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn TRK_flush_cache, global
/* 8005CFA4 00058F24  3C A0 FF FF */	lis r5, 0xFFFFFFF1@h
/* 8005CFA8 00058F28  60 A5 FF F1 */	ori r5, r5, 0xFFFFFFF1@l
/* 8005CFAC 00058F2C  7C A5 18 38 */	and r5, r5, r3
/* 8005CFB0 00058F30  7C 65 18 50 */	subf r3, r5, r3
/* 8005CFB4 00058F34  7C 84 1A 14 */	add r4, r4, r3
.L_8005CFB8:
/* 8005CFB8 00058F38  7C 00 28 6C */	dcbst r0, r5
/* 8005CFBC 00058F3C  7C 00 28 AC */	dcbf r0, r5
/* 8005CFC0 00058F40  7C 00 04 AC */	sync
/* 8005CFC4 00058F44  7C 00 2F AC */	icbi r0, r5
/* 8005CFC8 00058F48  30 A5 00 08 */	addic r5, r5, 0x8
/* 8005CFCC 00058F4C  34 84 FF F8 */	addic. r4, r4, -0x8
/* 8005CFD0 00058F50  40 80 FF E8 */	bge .L_8005CFB8
/* 8005CFD4 00058F54  4C 00 01 2C */	isync
/* 8005CFD8 00058F58  4E 80 00 20 */	blr
.endfn TRK_flush_cache
