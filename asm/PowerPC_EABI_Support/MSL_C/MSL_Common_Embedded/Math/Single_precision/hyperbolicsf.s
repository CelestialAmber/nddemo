.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

#weak
.global fabsf__Ff
fabsf__Ff:
/* 800624AC 0005E42C  FC 20 0A 10 */	fabs f1, f1
/* 800624B0 0005E430  4E 80 00 20 */	blr