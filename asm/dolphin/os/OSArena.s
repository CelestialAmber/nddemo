.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn OSGetArenaHi, global
/* 80028C4C 00024BCC  80 6D 84 78 */	lwz r3, __OSArenaHi@sda21(r13)
/* 80028C50 00024BD0  4E 80 00 20 */	blr
.endfn OSGetArenaHi

.fn OSGetArenaLo, global
/* 80028C54 00024BD4  80 6D 82 20 */	lwz r3, __OSArenaLo@sda21(r13)
/* 80028C58 00024BD8  4E 80 00 20 */	blr
.endfn OSGetArenaLo

.fn OSSetArenaHi, global
/* 80028C5C 00024BDC  90 6D 84 78 */	stw r3, __OSArenaHi@sda21(r13)
/* 80028C60 00024BE0  4E 80 00 20 */	blr
.endfn OSSetArenaHi

.fn OSSetArenaLo, global
/* 80028C64 00024BE4  90 6D 82 20 */	stw r3, __OSArenaLo@sda21(r13)
/* 80028C68 00024BE8  4E 80 00 20 */	blr
.endfn OSSetArenaLo

.section .sdata, "wa"  # 0x800A8A80 - 0x800A8DC0

.balign 8

.obj __OSArenaLo, local
	.4byte 0xFFFFFFFF
.endobj __OSArenaLo

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380

.balign 8

.obj __OSArenaHi, local
	.skip 0x4
.endobj __OSArenaHi

.skip 4
