.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn TRKInitializeMutex, global
/* 8005CEB4 00058E34  38 60 00 00 */	li r3, 0x0
/* 8005CEB8 00058E38  4E 80 00 20 */	blr
.endfn TRKInitializeMutex

.fn TRKAcquireMutex, global
/* 8005CEBC 00058E3C  38 60 00 00 */	li r3, 0x0
/* 8005CEC0 00058E40  4E 80 00 20 */	blr
.endfn TRKAcquireMutex

.fn TRKReleaseMutex, global
/* 8005CEC4 00058E44  38 60 00 00 */	li r3, 0x0
/* 8005CEC8 00058E48  4E 80 00 20 */	blr
.endfn TRKReleaseMutex
