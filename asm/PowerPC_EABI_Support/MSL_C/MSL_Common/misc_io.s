.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global __stdio_atexit
__stdio_atexit:
/* 800606F8 0005C678  4E 80 00 20 */	blr