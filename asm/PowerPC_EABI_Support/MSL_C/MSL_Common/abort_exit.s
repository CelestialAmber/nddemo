.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global exit
exit:
/* 8005F9CC 0005B94C  7C 08 02 A6 */	mflr r0
/* 8005F9D0 0005B950  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005F9D4 0005B954  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8005F9D8 0005B958  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8005F9DC 0005B95C  80 0D 88 C0 */	lwz r0, __aborting@sda21(r13)
/* 8005F9E0 0005B960  2C 00 00 00 */	cmpwi r0, 0x0
/* 8005F9E4 0005B964  40 82 00 84 */	bne .L_8005FA68
/* 8005F9E8 0005B968  3C 60 80 0B */	lis r3, atexit_funcs@ha
/* 8005F9EC 0005B96C  3B E3 88 80 */	addi r31, r3, atexit_funcs@l
/* 8005F9F0 0005B970  48 00 00 24 */	b .L_8005FA14
.L_8005F9F4:
/* 8005F9F4 0005B974  80 6D 88 C4 */	lwz r3, atexit_curr_func@sda21(r13)
/* 8005F9F8 0005B978  38 63 FF FF */	addi r3, r3, -0x1
/* 8005F9FC 0005B97C  54 60 10 3A */	slwi r0, r3, 2
/* 8005FA00 0005B980  90 6D 88 C4 */	stw r3, atexit_curr_func@sda21(r13)
/* 8005FA04 0005B984  7C 7F 02 14 */	add r3, r31, r0
/* 8005FA08 0005B988  81 83 00 00 */	lwz r12, 0x0(r3)
/* 8005FA0C 0005B98C  7D 88 03 A6 */	mtlr r12
/* 8005FA10 0005B990  4E 80 00 21 */	blrl
.L_8005FA14:
/* 8005FA14 0005B994  80 0D 88 C4 */	lwz r0, atexit_curr_func@sda21(r13)
/* 8005FA18 0005B998  2C 00 00 00 */	cmpwi r0, 0x0
/* 8005FA1C 0005B99C  41 81 FF D8 */	bgt .L_8005F9F4
/* 8005FA20 0005B9A0  4B FF F6 DD */	bl __destroy_global_chain
/* 8005FA24 0005B9A4  3C 60 80 06 */	lis r3, __destroy_global_chain_reference@ha
/* 8005FA28 0005B9A8  38 03 3D 00 */	addi r0, r3, __destroy_global_chain_reference@l
/* 8005FA2C 0005B9AC  7C 1F 03 78 */	mr r31, r0
/* 8005FA30 0005B9B0  48 00 00 10 */	b .L_8005FA40
.L_8005FA34:
/* 8005FA34 0005B9B4  7D 88 03 A6 */	mtlr r12
/* 8005FA38 0005B9B8  4E 80 00 21 */	blrl
/* 8005FA3C 0005B9BC  3B FF 00 04 */	addi r31, r31, 0x4
.L_8005FA40:
/* 8005FA40 0005B9C0  81 9F 00 00 */	lwz r12, 0x0(r31)
/* 8005FA44 0005B9C4  28 0C 00 00 */	cmplwi r12, 0x0
/* 8005FA48 0005B9C8  40 82 FF EC */	bne .L_8005FA34
/* 8005FA4C 0005B9CC  81 8D 88 CC */	lwz r12, __stdio_exit@sda21(r13)
/* 8005FA50 0005B9D0  28 0C 00 00 */	cmplwi r12, 0x0
/* 8005FA54 0005B9D4  41 82 00 14 */	beq .L_8005FA68
/* 8005FA58 0005B9D8  7D 88 03 A6 */	mtlr r12
/* 8005FA5C 0005B9DC  4E 80 00 21 */	blrl
/* 8005FA60 0005B9E0  38 00 00 00 */	li r0, 0x0
/* 8005FA64 0005B9E4  90 0D 88 CC */	stw r0, __stdio_exit@sda21(r13)
.L_8005FA68:
/* 8005FA68 0005B9E8  3C 60 80 0B */	lis r3, __atexit_funcs@ha
/* 8005FA6C 0005B9EC  3B E3 89 80 */	addi r31, r3, __atexit_funcs@l
/* 8005FA70 0005B9F0  48 00 00 24 */	b .L_8005FA94
.L_8005FA74:
/* 8005FA74 0005B9F4  80 6D 88 C8 */	lwz r3, __atexit_curr_func@sda21(r13)
/* 8005FA78 0005B9F8  38 63 FF FF */	addi r3, r3, -0x1
/* 8005FA7C 0005B9FC  54 60 10 3A */	slwi r0, r3, 2
/* 8005FA80 0005BA00  90 6D 88 C8 */	stw r3, __atexit_curr_func@sda21(r13)
/* 8005FA84 0005BA04  7C 7F 02 14 */	add r3, r31, r0
/* 8005FA88 0005BA08  81 83 00 00 */	lwz r12, 0x0(r3)
/* 8005FA8C 0005BA0C  7D 88 03 A6 */	mtlr r12
/* 8005FA90 0005BA10  4E 80 00 21 */	blrl
.L_8005FA94:
/* 8005FA94 0005BA14  80 0D 88 C8 */	lwz r0, __atexit_curr_func@sda21(r13)
/* 8005FA98 0005BA18  2C 00 00 00 */	cmpwi r0, 0x0
/* 8005FA9C 0005BA1C  41 81 FF D8 */	bgt .L_8005FA74
/* 8005FAA0 0005BA20  48 00 04 ED */	bl __kill_critical_regions
/* 8005FAA4 0005BA24  81 8D 88 D0 */	lwz r12, __console_exit@sda21(r13)
/* 8005FAA8 0005BA28  28 0C 00 00 */	cmplwi r12, 0x0
/* 8005FAAC 0005BA2C  41 82 00 14 */	beq .L_8005FAC0
/* 8005FAB0 0005BA30  7D 88 03 A6 */	mtlr r12
/* 8005FAB4 0005BA34  4E 80 00 21 */	blrl
/* 8005FAB8 0005BA38  38 00 00 00 */	li r0, 0x0
/* 8005FABC 0005BA3C  90 0D 88 D0 */	stw r0, __console_exit@sda21(r13)
.L_8005FAC0:
/* 8005FAC0 0005BA40  4B FC FD A5 */	bl _ExitProcess
/* 8005FAC4 0005BA44  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8005FAC8 0005BA48  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8005FACC 0005BA4C  38 21 00 18 */	addi r1, r1, 0x18
/* 8005FAD0 0005BA50  7C 08 03 A6 */	mtlr r0
/* 8005FAD4 0005BA54  4E 80 00 20 */	blr

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80 ; 0x0003B8C0

atexit_funcs:
	.skip 0x100

__atexit_funcs:
	.skip 0x100

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380

.global __aborting
__aborting:
	.skip 0x4

atexit_curr_func:
	.skip 0x4

__atexit_curr_func:
	.skip 0x4

.global __stdio_exit
__stdio_exit:
	.skip 0x4

.global __console_exit
__console_exit:
	.skip 0x4

.skip 4