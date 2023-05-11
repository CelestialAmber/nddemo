.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740


.fn EXI2_Init, global
/* 80063228 0005F1A8  4E 80 00 20 */	blr
.endfn EXI2_Init

.fn EXI2_EnableInterrupts, global
/* 8006322C 0005F1AC  4E 80 00 20 */	blr
.endfn EXI2_EnableInterrupts

.fn EXI2_Poll, global
/* 80063230 0005F1B0  38 60 00 00 */	li r3, 0x0
/* 80063234 0005F1B4  4E 80 00 20 */	blr
.endfn EXI2_Poll

.fn EXI2_ReadN, global
/* 80063238 0005F1B8  38 60 00 00 */	li r3, 0x0
/* 8006323C 0005F1BC  4E 80 00 20 */	blr
.endfn EXI2_ReadN

.fn EXI2_WriteN, global
/* 80063240 0005F1C0  38 60 00 00 */	li r3, 0x0
/* 80063244 0005F1C4  4E 80 00 20 */	blr
.endfn EXI2_WriteN

.fn EXI2_Reserve, global
/* 80063248 0005F1C8  4E 80 00 20 */	blr
.endfn EXI2_Reserve

.fn EXI2_Unreserve, global
/* 8006324C 0005F1CC  4E 80 00 20 */	blr
.endfn EXI2_Unreserve

.fn AMC_IsStub, global
/* 80063250 0005F1D0  38 60 00 01 */	li r3, 0x1
/* 80063254 0005F1D4  4E 80 00 20 */	blr
.endfn AMC_IsStub
