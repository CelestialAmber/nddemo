.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn __OSModuleInit, global
/* 8002B82C 000277AC  3C 80 80 00 */	lis r4, 0x800030CC@ha
/* 8002B830 000277B0  38 00 00 00 */	li r0, 0x0
/* 8002B834 000277B4  90 04 30 CC */	stw r0, 0x800030CC@l(r4)
/* 8002B838 000277B8  90 04 30 C8 */	stw r0, 0x30c8(r4)
/* 8002B83C 000277BC  90 04 30 D0 */	stw r0, 0x30d0(r4)
/* 8002B840 000277C0  4E 80 00 20 */	blr
.endfn __OSModuleInit
