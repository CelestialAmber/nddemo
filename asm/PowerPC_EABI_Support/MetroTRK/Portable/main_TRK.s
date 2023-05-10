.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global TRK_main
TRK_main:
/* 8005EC34 0005ABB4  7C 08 02 A6 */	mflr r0
/* 8005EC38 0005ABB8  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005EC3C 0005ABBC  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8005EC40 0005ABC0  4B FF BE ED */	bl TRKInitializeNub
/* 8005EC44 0005ABC4  3C 80 80 0B */	lis r4, TRK_mainError@ha
/* 8005EC48 0005ABC8  94 64 88 68 */	stwu r3, TRK_mainError@l(r4)
/* 8005EC4C 0005ABCC  80 04 00 00 */	lwz r0, 0x0(r4)
/* 8005EC50 0005ABD0  2C 00 00 00 */	cmpwi r0, 0x0
/* 8005EC54 0005ABD4  40 82 00 0C */	bne .L_8005EC60
/* 8005EC58 0005ABD8  4B FF BF CD */	bl TRKNubWelcome
/* 8005EC5C 0005ABDC  4B FF BB 81 */	bl TRKNubMainLoop
.L_8005EC60:
/* 8005EC60 0005ABE0  4B FF BF A1 */	bl TRKTerminateNub
/* 8005EC64 0005ABE4  3C 80 80 0B */	lis r4, TRK_mainError@ha
/* 8005EC68 0005ABE8  90 64 88 68 */	stw r3, TRK_mainError@l(r4)
/* 8005EC6C 0005ABEC  38 21 00 08 */	addi r1, r1, 0x8
/* 8005EC70 0005ABF0  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005EC74 0005ABF4  7C 08 03 A6 */	mtlr r0
/* 8005EC78 0005ABF8  4E 80 00 20 */	blr

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80

TRK_mainError:
	.skip 0x4

.skip 4
