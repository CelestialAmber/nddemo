.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740


.global EXI2_Init
EXI2_Init:
/* 80063228 0005F1A8  4E 80 00 20 */	blr

.global EXI2_EnableInterrupts
EXI2_EnableInterrupts:
/* 8006322C 0005F1AC  4E 80 00 20 */	blr

.global EXI2_Poll
EXI2_Poll:
/* 80063230 0005F1B0  38 60 00 00 */	li r3, 0x0
/* 80063234 0005F1B4  4E 80 00 20 */	blr

.global EXI2_ReadN
EXI2_ReadN:
/* 80063238 0005F1B8  38 60 00 00 */	li r3, 0x0
/* 8006323C 0005F1BC  4E 80 00 20 */	blr

.global EXI2_WriteN
EXI2_WriteN:
/* 80063240 0005F1C0  38 60 00 00 */	li r3, 0x0
/* 80063244 0005F1C4  4E 80 00 20 */	blr

.global EXI2_Reserve
EXI2_Reserve:
/* 80063248 0005F1C8  4E 80 00 20 */	blr

.global EXI2_Unreserve
EXI2_Unreserve:
/* 8006324C 0005F1CC  4E 80 00 20 */	blr

.global AMC_IsStub
AMC_IsStub:
/* 80063250 0005F1D0  38 60 00 01 */	li r3, 0x1
/* 80063254 0005F1D4  4E 80 00 20 */	blr