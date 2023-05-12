.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

#__destroy_global_chain
.fn __destroy_global_chain_, global
/* 8005F0FC 0005B07C  7C 08 02 A6 */	mflr r0
/* 8005F100 0005B080  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005F104 0005B084  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8005F108 0005B088  48 00 00 20 */	b .L_8005F128
.L_8005F10C:
/* 8005F10C 0005B08C  80 03 00 00 */	lwz r0, 0x0(r3)
/* 8005F110 0005B090  38 80 FF FF */	li r4, -0x1
/* 8005F114 0005B094  90 0D 88 B8 */	stw r0, __global_destructor_chain@sda21(r13)
/* 8005F118 0005B098  81 83 00 04 */	lwz r12, 0x4(r3)
/* 8005F11C 0005B09C  80 63 00 08 */	lwz r3, 0x8(r3)
/* 8005F120 0005B0A0  7D 88 03 A6 */	mtlr r12
/* 8005F124 0005B0A4  4E 80 00 21 */	blrl
.L_8005F128:
/* 8005F128 0005B0A8  80 6D 88 B8 */	lwz r3, __global_destructor_chain@sda21(r13)
/* 8005F12C 0005B0AC  28 03 00 00 */	cmplwi r3, 0x0
/* 8005F130 0005B0B0  40 82 FF DC */	bne .L_8005F10C
/* 8005F134 0005B0B4  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8005F138 0005B0B8  38 21 00 08 */	addi r1, r1, 0x8
/* 8005F13C 0005B0BC  7C 08 03 A6 */	mtlr r0
/* 8005F140 0005B0C0  4E 80 00 20 */	blr
.endfn __destroy_global_chain_

#__register_global_object
.fn __register_global_object_, global
/* 8005F144 0005B0C4  80 0D 88 B8 */	lwz r0, __global_destructor_chain@sda21(r13)
/* 8005F148 0005B0C8  90 05 00 00 */	stw r0, 0x0(r5)
/* 8005F14C 0005B0CC  90 85 00 04 */	stw r4, 0x4(r5)
/* 8005F150 0005B0D0  90 65 00 08 */	stw r3, 0x8(r5)
/* 8005F154 0005B0D4  90 AD 88 B8 */	stw r5, __global_destructor_chain@sda21(r13)
/* 8005F158 0005B0D8  4E 80 00 20 */	blr
.endfn __register_global_object_

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380

.balign 8

.obj __global_destructor_chain, global
	.skip 0x4
.endobj __global_destructor_chain

.skip 4
