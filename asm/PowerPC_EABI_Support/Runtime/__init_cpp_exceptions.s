.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn GetR2__Fv, local
/* 8005F950 0005B8D0  7C 43 13 78 */	mr r3, r2
/* 8005F954 0005B8D4  4E 80 00 20 */	blr
.endfn GetR2__Fv

#__fini_cpp_exceptions
.fn __fini_cpp_exceptions_, global
/* 8005F958 0005B8D8  7C 08 02 A6 */	mflr r0
/* 8005F95C 0005B8DC  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005F960 0005B8E0  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8005F964 0005B8E4  80 6D 83 08 */	lwz r3, fragmentID@sda21(r13)
/* 8005F968 0005B8E8  2C 03 FF FE */	cmpwi r3, -0x2
/* 8005F96C 0005B8EC  41 82 00 10 */	beq .L_8005F97C
/* 8005F970 0005B8F0  4B FF FA 1D */	bl __unregister_fragment
/* 8005F974 0005B8F4  38 00 FF FE */	li r0, -0x2
/* 8005F978 0005B8F8  90 0D 83 08 */	stw r0, fragmentID@sda21(r13)
.L_8005F97C:
/* 8005F97C 0005B8FC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8005F980 0005B900  38 21 00 08 */	addi r1, r1, 0x8
/* 8005F984 0005B904  7C 08 03 A6 */	mtlr r0
/* 8005F988 0005B908  4E 80 00 20 */	blr
.endfn __fini_cpp_exceptions_

#__init_cpp_exceptions
.fn __init_cpp_exceptions_, global
/* 8005F98C 0005B90C  7C 08 02 A6 */	mflr r0
/* 8005F990 0005B910  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005F994 0005B914  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8005F998 0005B918  80 0D 83 08 */	lwz r0, fragmentID@sda21(r13)
/* 8005F99C 0005B91C  2C 00 FF FE */	cmpwi r0, -0x2
/* 8005F9A0 0005B920  40 82 00 1C */	bne .L_8005F9BC
/* 8005F9A4 0005B924  4B FF FF AD */	bl GetR2__Fv
/* 8005F9A8 0005B928  3C A0 80 00 */	lis r5, _eti_init_info_@ha
/* 8005F9AC 0005B92C  7C 64 1B 78 */	mr r4, r3
/* 8005F9B0 0005B930  38 65 65 80 */	addi r3, r5, _eti_init_info_@l
/* 8005F9B4 0005B934  4B FF FA 0D */	bl __register_fragment
/* 8005F9B8 0005B938  90 6D 83 08 */	stw r3, fragmentID@sda21(r13)
.L_8005F9BC:
/* 8005F9BC 0005B93C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8005F9C0 0005B940  38 21 00 08 */	addi r1, r1, 0x8
/* 8005F9C4 0005B944  7C 08 03 A6 */	mtlr r0
/* 8005F9C8 0005B948  4E 80 00 20 */	blr
.endfn __init_cpp_exceptions_

.section .sdata, "wa"  # 0x800A8A80 - 0x800A8DC0 ; 0x00000340


.obj fragmentID, local
	.4byte 0xFFFFFFFE
	.4byte 0
.endobj fragmentID
