.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn __flush_buffer, global
/* 8005FE8C 0005BE0C  7C 08 02 A6 */	mflr r0
/* 8005FE90 0005BE10  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005FE94 0005BE14  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8005FE98 0005BE18  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8005FE9C 0005BE1C  7C 7F 1B 78 */	mr r31, r3
/* 8005FEA0 0005BE20  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8005FEA4 0005BE24  7C 9E 23 78 */	mr r30, r4
/* 8005FEA8 0005BE28  80 63 00 18 */	lwz r3, 0x18(r3)
/* 8005FEAC 0005BE2C  80 1F 00 20 */	lwz r0, 0x20(r31)
/* 8005FEB0 0005BE30  7C 03 00 51 */	subf. r0, r3, r0
/* 8005FEB4 0005BE34  41 82 00 58 */	beq .L_8005FF0C
/* 8005FEB8 0005BE38  90 1F 00 24 */	stw r0, 0x24(r31)
/* 8005FEBC 0005BE3C  88 1F 00 05 */	lbz r0, 0x5(r31)
/* 8005FEC0 0005BE40  54 00 EF FF */	extrwi. r0, r0, 1, 28
/* 8005FEC4 0005BE44  81 9F 00 3C */	lwz r12, 0x3c(r31)
/* 8005FEC8 0005BE48  38 BF 00 24 */	addi r5, r31, 0x24
/* 8005FECC 0005BE4C  80 7F 00 00 */	lwz r3, 0x0(r31)
/* 8005FED0 0005BE50  7D 88 03 A6 */	mtlr r12
/* 8005FED4 0005BE54  80 9F 00 18 */	lwz r4, 0x18(r31)
/* 8005FED8 0005BE58  80 DF 00 44 */	lwz r6, 0x44(r31)
/* 8005FEDC 0005BE5C  4E 80 00 21 */	blrl
/* 8005FEE0 0005BE60  28 1E 00 00 */	cmplwi r30, 0x0
/* 8005FEE4 0005BE64  41 82 00 0C */	beq .L_8005FEF0
/* 8005FEE8 0005BE68  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 8005FEEC 0005BE6C  90 1E 00 00 */	stw r0, 0x0(r30)
.L_8005FEF0:
/* 8005FEF0 0005BE70  2C 03 00 00 */	cmpwi r3, 0x0
/* 8005FEF4 0005BE74  41 82 00 08 */	beq .L_8005FEFC
/* 8005FEF8 0005BE78  48 00 00 48 */	b .L_8005FF40
.L_8005FEFC:
/* 8005FEFC 0005BE7C  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 8005FF00 0005BE80  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 8005FF04 0005BE84  7C 03 02 14 */	add r0, r3, r0
/* 8005FF08 0005BE88  90 1F 00 14 */	stw r0, 0x14(r31)
.L_8005FF0C:
/* 8005FF0C 0005BE8C  80 1F 00 18 */	lwz r0, 0x18(r31)
/* 8005FF10 0005BE90  38 60 00 00 */	li r3, 0x0
/* 8005FF14 0005BE94  90 1F 00 20 */	stw r0, 0x20(r31)
/* 8005FF18 0005BE98  80 1F 00 1C */	lwz r0, 0x1c(r31)
/* 8005FF1C 0005BE9C  90 1F 00 24 */	stw r0, 0x24(r31)
/* 8005FF20 0005BEA0  80 BF 00 14 */	lwz r5, 0x14(r31)
/* 8005FF24 0005BEA4  80 9F 00 28 */	lwz r4, 0x28(r31)
/* 8005FF28 0005BEA8  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 8005FF2C 0005BEAC  7C A4 20 38 */	and r4, r5, r4
/* 8005FF30 0005BEB0  7C 04 00 50 */	subf r0, r4, r0
/* 8005FF34 0005BEB4  90 1F 00 24 */	stw r0, 0x24(r31)
/* 8005FF38 0005BEB8  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 8005FF3C 0005BEBC  90 1F 00 30 */	stw r0, 0x30(r31)
.L_8005FF40:
/* 8005FF40 0005BEC0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8005FF44 0005BEC4  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8005FF48 0005BEC8  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8005FF4C 0005BECC  7C 08 03 A6 */	mtlr r0
/* 8005FF50 0005BED0  38 21 00 18 */	addi r1, r1, 0x18
/* 8005FF54 0005BED4  4E 80 00 20 */	blr
.endfn __flush_buffer

.fn __prep_buffer, global
/* 8005FF58 0005BED8  80 03 00 18 */	lwz r0, 0x18(r3)
/* 8005FF5C 0005BEDC  90 03 00 20 */	stw r0, 0x20(r3)
/* 8005FF60 0005BEE0  80 03 00 1C */	lwz r0, 0x1c(r3)
/* 8005FF64 0005BEE4  90 03 00 24 */	stw r0, 0x24(r3)
/* 8005FF68 0005BEE8  80 A3 00 14 */	lwz r5, 0x14(r3)
/* 8005FF6C 0005BEEC  80 83 00 28 */	lwz r4, 0x28(r3)
/* 8005FF70 0005BEF0  80 03 00 24 */	lwz r0, 0x24(r3)
/* 8005FF74 0005BEF4  7C A4 20 38 */	and r4, r5, r4
/* 8005FF78 0005BEF8  7C 04 00 50 */	subf r0, r4, r0
/* 8005FF7C 0005BEFC  90 03 00 24 */	stw r0, 0x24(r3)
/* 8005FF80 0005BF00  80 03 00 14 */	lwz r0, 0x14(r3)
/* 8005FF84 0005BF04  90 03 00 30 */	stw r0, 0x30(r3)
/* 8005FF88 0005BF08  4E 80 00 20 */	blr
.endfn __prep_buffer
