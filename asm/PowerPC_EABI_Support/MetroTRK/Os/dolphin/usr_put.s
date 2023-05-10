.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global usr_put_initialize
usr_put_initialize:
/* 8005B6F8 00057678  4E 80 00 20 */	blr