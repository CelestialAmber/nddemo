.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global OSGetArenaHi
OSGetArenaHi:
/* 80028C4C 00024BCC  80 6D 84 78 */	lwz r3, __OSArenaHi@sda21(r13)
/* 80028C50 00024BD0  4E 80 00 20 */	blr

.global OSGetArenaLo
OSGetArenaLo:
/* 80028C54 00024BD4  80 6D 82 20 */	lwz r3, __OSArenaLo@sda21(r13)
/* 80028C58 00024BD8  4E 80 00 20 */	blr

.global OSSetArenaHi
OSSetArenaHi:
/* 80028C5C 00024BDC  90 6D 84 78 */	stw r3, __OSArenaHi@sda21(r13)
/* 80028C60 00024BE0  4E 80 00 20 */	blr

.global OSSetArenaLo
OSSetArenaLo:
/* 80028C64 00024BE4  90 6D 82 20 */	stw r3, __OSArenaLo@sda21(r13)
/* 80028C68 00024BE8  4E 80 00 20 */	blr

.section .sdata, "wa"  # 0x800A8A80 - 0x800A8DC0

__OSArenaLo:
	.4byte 0xFFFFFFFF
	.4byte 0

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380

__OSArenaHi:
	.skip 0x4

.skip 4
