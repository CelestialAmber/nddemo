.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global __kill_critical_regions
__kill_critical_regions:
/* 8005FF8C 0005BF0C  4E 80 00 20 */	blr