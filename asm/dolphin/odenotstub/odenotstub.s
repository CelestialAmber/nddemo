.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

#weak
.global Hu_IsStub
Hu_IsStub:
/* 80063CD8 0005FC58  38 60 00 00 */	li r3, 0x0
/* 80063CDC 0005FC5C  4E 80 00 20 */	blr