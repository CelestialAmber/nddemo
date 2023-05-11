.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn TRKMessageSend, global
/* 8005ACC0 00056C40  7C 08 02 A6 */	mflr r0
/* 8005ACC4 00056C44  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005ACC8 00056C48  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8005ACCC 00056C4C  80 83 00 08 */	lwz r4, 0x8(r3)
/* 8005ACD0 00056C50  38 63 00 10 */	addi r3, r3, 0x10
/* 8005ACD4 00056C54  48 00 42 39 */	bl TRKWriteUARTN
/* 8005ACD8 00056C58  38 21 00 08 */	addi r1, r1, 0x8
/* 8005ACDC 00056C5C  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005ACE0 00056C60  7C 08 03 A6 */	mtlr r0
/* 8005ACE4 00056C64  4E 80 00 20 */	blr
.endfn TRKMessageSend
