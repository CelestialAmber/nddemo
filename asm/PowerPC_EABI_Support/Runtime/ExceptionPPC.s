.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn __unregister_fragment, global
/* 8005F38C 0005B30C  2C 03 00 00 */	cmpwi r3, 0x0
/* 8005F390 0005B310  41 80 00 2C */	blt .L_8005F3BC
/* 8005F394 0005B314  2C 03 00 01 */	cmpwi r3, 0x1
/* 8005F398 0005B318  40 80 00 24 */	bge .L_8005F3BC
/* 8005F39C 0005B31C  1C 83 00 0C */	mulli r4, r3, 0xc
/* 8005F3A0 0005B320  3C 60 80 0B */	lis r3, fragmentinfo@ha
/* 8005F3A4 0005B324  38 03 88 70 */	addi r0, r3, fragmentinfo@l
/* 8005F3A8 0005B328  7C 60 22 14 */	add r3, r0, r4
/* 8005F3AC 0005B32C  38 00 00 00 */	li r0, 0x0
/* 8005F3B0 0005B330  90 03 00 00 */	stw r0, 0x0(r3)
/* 8005F3B4 0005B334  90 03 00 04 */	stw r0, 0x4(r3)
/* 8005F3B8 0005B338  90 03 00 08 */	stw r0, 0x8(r3)
.L_8005F3BC:
/* 8005F3BC 0005B33C  4E 80 00 20 */	blr
.endfn __unregister_fragment

.fn __register_fragment, global
/* 8005F3C0 0005B340  3C A0 80 0B */	lis r5, fragmentinfo@ha
/* 8005F3C4 0005B344  38 A5 88 70 */	addi r5, r5, fragmentinfo@l
/* 8005F3C8 0005B348  48 00 00 04 */	b .L_8005F3CC
.L_8005F3CC:
/* 8005F3CC 0005B34C  48 00 00 04 */	b .L_8005F3D0
.L_8005F3D0:
/* 8005F3D0 0005B350  80 05 00 08 */	lwz r0, 0x8(r5)
/* 8005F3D4 0005B354  2C 00 00 00 */	cmpwi r0, 0x0
/* 8005F3D8 0005B358  40 82 00 1C */	bne .L_8005F3F4
/* 8005F3DC 0005B35C  90 65 00 00 */	stw r3, 0x0(r5)
/* 8005F3E0 0005B360  38 00 00 01 */	li r0, 0x1
/* 8005F3E4 0005B364  38 60 00 00 */	li r3, 0x0
/* 8005F3E8 0005B368  90 85 00 04 */	stw r4, 0x4(r5)
/* 8005F3EC 0005B36C  90 05 00 08 */	stw r0, 0x8(r5)
/* 8005F3F0 0005B370  48 00 00 08 */	b .L_8005F3F8
.L_8005F3F4:
/* 8005F3F4 0005B374  38 60 FF FF */	li r3, -0x1
.L_8005F3F8:
/* 8005F3F8 0005B378  4E 80 00 20 */	blr
.endfn __register_fragment

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80

.balign 8

.obj fragmentinfo, local
	.skip 0xC
.endobj fragmentinfo

.skip 4
