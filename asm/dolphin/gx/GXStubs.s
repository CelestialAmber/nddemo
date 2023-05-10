.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global __GXSetRange
__GXSetRange:
/* 80040950 0003C8D0  4E 80 00 20 */	blr