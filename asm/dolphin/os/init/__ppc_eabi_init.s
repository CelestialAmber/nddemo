.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global __init_user
__init_user:
/* 8002F7F0 0002B770  7C 08 02 A6 */	mflr r0
/* 8002F7F4 0002B774  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002F7F8 0002B778  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8002F7FC 0002B77C  48 00 00 15 */	bl __init_cpp
/* 8002F800 0002B780  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8002F804 0002B784  38 21 00 08 */	addi r1, r1, 0x8
/* 8002F808 0002B788  7C 08 03 A6 */	mtlr r0
/* 8002F80C 0002B78C  4E 80 00 20 */	blr

__init_cpp:
/* 8002F810 0002B790  7C 08 02 A6 */	mflr r0
/* 8002F814 0002B794  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002F818 0002B798  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8002F81C 0002B79C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8002F820 0002B7A0  3C 60 80 06 */	lis r3, __init_cpp_exceptions_reference@ha
/* 8002F824 0002B7A4  38 03 3C E0 */	addi r0, r3, __init_cpp_exceptions_reference@l
/* 8002F828 0002B7A8  7C 1F 03 78 */	mr r31, r0
/* 8002F82C 0002B7AC  48 00 00 04 */	b .L_8002F830
.L_8002F830:
/* 8002F830 0002B7B0  48 00 00 04 */	b .L_8002F834
.L_8002F834:
/* 8002F834 0002B7B4  48 00 00 10 */	b .L_8002F844
.L_8002F838:
/* 8002F838 0002B7B8  7D 88 03 A6 */	mtlr r12
/* 8002F83C 0002B7BC  4E 80 00 21 */	blrl
/* 8002F840 0002B7C0  3B FF 00 04 */	addi r31, r31, 0x4
.L_8002F844:
/* 8002F844 0002B7C4  81 9F 00 00 */	lwz r12, 0x0(r31)
/* 8002F848 0002B7C8  28 0C 00 00 */	cmplwi r12, 0x0
/* 8002F84C 0002B7CC  40 82 FF EC */	bne .L_8002F838
/* 8002F850 0002B7D0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8002F854 0002B7D4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8002F858 0002B7D8  38 21 00 10 */	addi r1, r1, 0x10
/* 8002F85C 0002B7DC  7C 08 03 A6 */	mtlr r0
/* 8002F860 0002B7E0  4E 80 00 20 */	blr

.global _ExitProcess
_ExitProcess:
/* 8002F864 0002B7E4  7C 08 02 A6 */	mflr r0
/* 8002F868 0002B7E8  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002F86C 0002B7EC  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8002F870 0002B7F0  4B FF 7E 51 */	bl PPCHalt
/* 8002F874 0002B7F4  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8002F878 0002B7F8  38 21 00 08 */	addi r1, r1, 0x8
/* 8002F87C 0002B7FC  7C 08 03 A6 */	mtlr r0
/* 8002F880 0002B800  4E 80 00 20 */	blr


.section .init, "ax"  # 0x80003100 - 0x80005520 ; 0x00002420

.global _rom_copy_info
_rom_copy_info:
    .db 0x80003100
    .db 0x80003100
    .db 0x0000240C
    .db 0x80005520
    .db 0x80005520
    .db 0x00000690
    .db 0x80005BC0
    .db 0x80005BC0
    .db 0x000009E0
    .db 0x800065A0
    .db 0x800065A0
    .db 0x0005D740
    .db 0x80063CE0
    .db 0x80063CE0
    .db 0x00000010
    .db 0x80063D00
    .db 0x80063D00
    .db 0x00000010
    .db 0x80063D20
    .db 0x80063D20
    .db 0x000012E0
    .db 0x80065000
    .db 0x80065000
    .db 0x000081B8
    .db 0x800A8A80
    .db 0x800A8A80
    .db 0x00000321
    .db 0x800A9380
    .db 0x800A9380
    .db 0x00000818
    .db 0x00000000
    .db 0x00000000
    .db 0x00000000

.global _bss_init_info
_bss_init_info:
    .4byte 0x8006D1C0
    .4byte 0x0003B8C0
    .4byte 0x800A8DC0
    .4byte 0x000005B5
    .4byte 0x00000000
    .4byte 0x00000000
