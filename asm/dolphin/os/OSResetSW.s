.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn __OSResetSWInterruptHandler, global
/* 8002BF40 00027EC0  7C 08 02 A6 */	mflr r0
/* 8002BF44 00027EC4  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002BF48 00027EC8  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 8002BF4C 00027ECC  93 E1 00 24 */	stw r31, 0x24(r1)
/* 8002BF50 00027ED0  93 C1 00 20 */	stw r30, 0x20(r1)
/* 8002BF54 00027ED4  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 8002BF58 00027ED8  48 00 35 E5 */	bl __OSGetSystemTime
/* 8002BF5C 00027EDC  3C A0 80 00 */	lis r5, 0x800000F8@ha
/* 8002BF60 00027EE0  90 8D 84 BC */	stw r4, HoldDown+4@sda21(r13)
/* 8002BF64 00027EE4  80 05 00 F8 */	lwz r0, 0x800000F8@l(r5)
/* 8002BF68 00027EE8  3C 80 43 1C */	lis r4, 0x431c
/* 8002BF6C 00027EEC  38 84 DE 83 */	addi r4, r4, -0x217d
/* 8002BF70 00027EF0  90 6D 84 B8 */	stw r3, HoldDown@sda21(r13)
/* 8002BF74 00027EF4  54 00 F0 BE */	srwi r0, r0, 2
/* 8002BF78 00027EF8  7C 04 00 16 */	mulhwu r0, r4, r0
/* 8002BF7C 00027EFC  54 00 8B FE */	srwi r0, r0, 15
/* 8002BF80 00027F00  1C 00 00 64 */	mulli r0, r0, 0x64
/* 8002BF84 00027F04  54 1D E8 FE */	srwi r29, r0, 3
/* 8002BF88 00027F08  3B C0 00 00 */	li r30, 0x0
/* 8002BF8C 00027F0C  3F E0 CC 00 */	lis r31, 0xCC003000@ha
.L_8002BF90:
/* 8002BF90 00027F10  48 00 35 AD */	bl __OSGetSystemTime
/* 8002BF94 00027F14  80 CD 84 BC */	lwz r6, HoldDown+4@sda21(r13)
/* 8002BF98 00027F18  6F C5 80 00 */	xoris r5, r30, 0x8000
/* 8002BF9C 00027F1C  80 0D 84 B8 */	lwz r0, HoldDown@sda21(r13)
/* 8002BFA0 00027F20  7C 86 20 10 */	subfc r4, r6, r4
/* 8002BFA4 00027F24  7C 00 19 10 */	subfe r0, r0, r3
/* 8002BFA8 00027F28  6C 03 80 00 */	xoris r3, r0, 0x8000
/* 8002BFAC 00027F2C  7C 1D 20 10 */	subfc r0, r29, r4
/* 8002BFB0 00027F30  7C A5 19 10 */	subfe r5, r5, r3
/* 8002BFB4 00027F34  7C A3 19 10 */	subfe r5, r3, r3
/* 8002BFB8 00027F38  7C A5 00 D1 */	neg. r5, r5
/* 8002BFBC 00027F3C  41 82 00 10 */	beq .L_8002BFCC
/* 8002BFC0 00027F40  80 1F 30 00 */	lwz r0, 0xCC003000@l(r31)
/* 8002BFC4 00027F44  54 00 03 DF */	rlwinm. r0, r0, 0, 15, 15
/* 8002BFC8 00027F48  41 82 FF C8 */	beq .L_8002BF90
.L_8002BFCC:
/* 8002BFCC 00027F4C  3C 60 CC 00 */	lis r3, 0xCC003000@ha
/* 8002BFD0 00027F50  80 03 30 00 */	lwz r0, 0xCC003000@l(r3)
/* 8002BFD4 00027F54  54 00 03 DF */	rlwinm. r0, r0, 0, 15, 15
/* 8002BFD8 00027F58  40 82 00 34 */	bne .L_8002C00C
/* 8002BFDC 00027F5C  38 00 00 01 */	li r0, 0x1
/* 8002BFE0 00027F60  90 0D 84 A4 */	stw r0, Down@sda21(r13)
/* 8002BFE4 00027F64  38 60 02 00 */	li r3, 0x200
/* 8002BFE8 00027F68  90 0D 84 A8 */	stw r0, LastState@sda21(r13)
/* 8002BFEC 00027F6C  4B FF F3 C1 */	bl __OSMaskInterrupts
/* 8002BFF0 00027F70  81 8D 84 A0 */	lwz r12, ResetCallback@sda21(r13)
/* 8002BFF4 00027F74  28 0C 00 00 */	cmplwi r12, 0x0
/* 8002BFF8 00027F78  41 82 00 14 */	beq .L_8002C00C
/* 8002BFFC 00027F7C  38 00 00 00 */	li r0, 0x0
/* 8002C000 00027F80  7D 88 03 A6 */	mtlr r12
/* 8002C004 00027F84  90 0D 84 A0 */	stw r0, ResetCallback@sda21(r13)
/* 8002C008 00027F88  4E 80 00 21 */	blrl
.L_8002C00C:
/* 8002C00C 00027F8C  38 00 00 02 */	li r0, 0x2
/* 8002C010 00027F90  3C 60 CC 00 */	lis r3, 0xCC003000@ha
/* 8002C014 00027F94  90 03 30 00 */	stw r0, 0xCC003000@l(r3)
/* 8002C018 00027F98  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 8002C01C 00027F9C  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 8002C020 00027FA0  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 8002C024 00027FA4  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 8002C028 00027FA8  38 21 00 28 */	addi r1, r1, 0x28
/* 8002C02C 00027FAC  7C 08 03 A6 */	mtlr r0
/* 8002C030 00027FB0  4E 80 00 20 */	blr
.endfn __OSResetSWInterruptHandler

.fn OSGetResetButtonState, global
/* 8002C034 00027FB4  7C 08 02 A6 */	mflr r0
/* 8002C038 00027FB8  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002C03C 00027FBC  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8002C040 00027FC0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8002C044 00027FC4  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8002C048 00027FC8  93 A1 00 0C */	stw r29, 0xc(r1)
/* 8002C04C 00027FCC  4B FF EF 99 */	bl OSDisableInterrupts
/* 8002C050 00027FD0  7C 7E 1B 78 */	mr r30, r3
/* 8002C054 00027FD4  48 00 34 E9 */	bl __OSGetSystemTime
/* 8002C058 00027FD8  3C A0 CC 00 */	lis r5, 0xCC003000@ha
/* 8002C05C 00027FDC  80 05 30 00 */	lwz r0, 0xCC003000@l(r5)
/* 8002C060 00027FE0  54 00 03 DF */	rlwinm. r0, r0, 0, 15, 15
/* 8002C064 00027FE4  40 82 00 DC */	bne .L_8002C140
/* 8002C068 00027FE8  80 0D 84 A4 */	lwz r0, Down@sda21(r13)
/* 8002C06C 00027FEC  2C 00 00 00 */	cmpwi r0, 0x0
/* 8002C070 00027FF0  40 82 00 40 */	bne .L_8002C0B0
/* 8002C074 00027FF4  80 0D 84 B0 */	lwz r0, HoldUp@sda21(r13)
/* 8002C078 00027FF8  38 C0 00 00 */	li r6, 0x0
/* 8002C07C 00027FFC  80 AD 84 B4 */	lwz r5, HoldUp+4@sda21(r13)
/* 8002C080 00028000  38 E0 00 01 */	li r7, 0x1
/* 8002C084 00028004  7C 00 32 78 */	xor r0, r0, r6
/* 8002C088 00028008  7C A5 32 78 */	xor r5, r5, r6
/* 8002C08C 0002800C  90 ED 84 A4 */	stw r7, Down@sda21(r13)
/* 8002C090 00028010  7C A0 03 79 */	or. r0, r5, r0
/* 8002C094 00028014  41 82 00 08 */	beq .L_8002C09C
/* 8002C098 00028018  48 00 00 08 */	b .L_8002C0A0
.L_8002C09C:
/* 8002C09C 0002801C  7C C7 33 78 */	mr r7, r6
.L_8002C0A0:
/* 8002C0A0 00028020  90 8D 84 BC */	stw r4, HoldDown+4@sda21(r13)
/* 8002C0A4 00028024  7C FD 3B 78 */	mr r29, r7
/* 8002C0A8 00028028  90 6D 84 B8 */	stw r3, HoldDown@sda21(r13)
/* 8002C0AC 0002802C  48 00 01 48 */	b .L_8002C1F4
.L_8002C0B0:
/* 8002C0B0 00028030  80 0D 84 B0 */	lwz r0, HoldUp@sda21(r13)
/* 8002C0B4 00028034  39 20 00 00 */	li r9, 0x0
/* 8002C0B8 00028038  80 AD 84 B4 */	lwz r5, HoldUp+4@sda21(r13)
/* 8002C0BC 0002803C  39 40 00 01 */	li r10, 0x1
/* 8002C0C0 00028040  7C 00 4A 78 */	xor r0, r0, r9
/* 8002C0C4 00028044  7C A5 4A 78 */	xor r5, r5, r9
/* 8002C0C8 00028048  7C A0 03 79 */	or. r0, r5, r0
/* 8002C0CC 0002804C  40 82 00 58 */	bne .L_8002C124
/* 8002C0D0 00028050  3C C0 80 00 */	lis r6, 0x800000F8@ha
/* 8002C0D4 00028054  80 AD 84 BC */	lwz r5, HoldDown+4@sda21(r13)
/* 8002C0D8 00028058  80 E6 00 F8 */	lwz r7, 0x800000F8@l(r6)
/* 8002C0DC 0002805C  3C C0 43 1C */	lis r6, 0x431c
/* 8002C0E0 00028060  39 06 DE 83 */	addi r8, r6, -0x217d
/* 8002C0E4 00028064  80 0D 84 B8 */	lwz r0, HoldDown@sda21(r13)
/* 8002C0E8 00028068  54 E6 F0 BE */	srwi r6, r7, 2
/* 8002C0EC 0002806C  7C C8 30 16 */	mulhwu r6, r8, r6
/* 8002C0F0 00028070  54 C6 8B FE */	srwi r6, r6, 15
/* 8002C0F4 00028074  1C C6 00 64 */	mulli r6, r6, 0x64
/* 8002C0F8 00028078  7C E5 20 10 */	subfc r7, r5, r4
/* 8002C0FC 0002807C  7C 00 19 10 */	subfe r0, r0, r3
/* 8002C100 00028080  54 C8 E8 FE */	srwi r8, r6, 3
/* 8002C104 00028084  6C 05 80 00 */	xoris r5, r0, 0x8000
/* 8002C108 00028088  6D 26 80 00 */	xoris r6, r9, 0x8000
/* 8002C10C 0002808C  7C 07 40 10 */	subfc r0, r7, r8
/* 8002C110 00028090  7C A5 31 10 */	subfe r5, r5, r6
/* 8002C114 00028094  7C A6 31 10 */	subfe r5, r6, r6
/* 8002C118 00028098  7C A5 00 D1 */	neg. r5, r5
/* 8002C11C 0002809C  40 82 00 08 */	bne .L_8002C124
/* 8002C120 000280A0  7D 2A 4B 78 */	mr r10, r9
.L_8002C124:
/* 8002C124 000280A4  2C 0A 00 00 */	cmpwi r10, 0x0
/* 8002C128 000280A8  41 82 00 0C */	beq .L_8002C134
/* 8002C12C 000280AC  38 00 00 01 */	li r0, 0x1
/* 8002C130 000280B0  48 00 00 08 */	b .L_8002C138
.L_8002C134:
/* 8002C134 000280B4  38 00 00 00 */	li r0, 0x0
.L_8002C138:
/* 8002C138 000280B8  7C 1D 03 78 */	mr r29, r0
/* 8002C13C 000280BC  48 00 00 B8 */	b .L_8002C1F4
.L_8002C140:
/* 8002C140 000280C0  80 0D 84 A4 */	lwz r0, Down@sda21(r13)
/* 8002C144 000280C4  2C 00 00 00 */	cmpwi r0, 0x0
/* 8002C148 000280C8  41 82 00 34 */	beq .L_8002C17C
/* 8002C14C 000280CC  80 AD 84 A8 */	lwz r5, LastState@sda21(r13)
/* 8002C150 000280D0  38 00 00 00 */	li r0, 0x0
/* 8002C154 000280D4  90 0D 84 A4 */	stw r0, Down@sda21(r13)
/* 8002C158 000280D8  2C 05 00 00 */	cmpwi r5, 0x0
/* 8002C15C 000280DC  3B A5 00 00 */	addi r29, r5, 0x0
/* 8002C160 000280E0  41 82 00 10 */	beq .L_8002C170
/* 8002C164 000280E4  90 8D 84 B4 */	stw r4, HoldUp+4@sda21(r13)
/* 8002C168 000280E8  90 6D 84 B0 */	stw r3, HoldUp@sda21(r13)
/* 8002C16C 000280EC  48 00 00 88 */	b .L_8002C1F4
.L_8002C170:
/* 8002C170 000280F0  90 0D 84 B4 */	stw r0, HoldUp+4@sda21(r13)
/* 8002C174 000280F4  90 0D 84 B0 */	stw r0, HoldUp@sda21(r13)
/* 8002C178 000280F8  48 00 00 7C */	b .L_8002C1F4
.L_8002C17C:
/* 8002C17C 000280FC  80 CD 84 B0 */	lwz r6, HoldUp@sda21(r13)
/* 8002C180 00028100  39 00 00 00 */	li r8, 0x0
/* 8002C184 00028104  80 ED 84 B4 */	lwz r7, HoldUp+4@sda21(r13)
/* 8002C188 00028108  7C C0 42 78 */	xor r0, r6, r8
/* 8002C18C 0002810C  7C E5 42 78 */	xor r5, r7, r8
/* 8002C190 00028110  7C A0 03 79 */	or. r0, r5, r0
/* 8002C194 00028114  41 82 00 50 */	beq .L_8002C1E4
/* 8002C198 00028118  3C A0 80 00 */	lis r5, 0x800000F8@ha
/* 8002C19C 0002811C  80 05 00 F8 */	lwz r0, 0x800000F8@l(r5)
/* 8002C1A0 00028120  3C A0 10 62 */	lis r5, 0x1062
/* 8002C1A4 00028124  38 A5 4D D3 */	addi r5, r5, 0x4dd3
/* 8002C1A8 00028128  54 00 F0 BE */	srwi r0, r0, 2
/* 8002C1AC 0002812C  7C 05 00 16 */	mulhwu r0, r5, r0
/* 8002C1B0 00028130  54 00 D1 BE */	srwi r0, r0, 6
/* 8002C1B4 00028134  1C 00 00 28 */	mulli r0, r0, 0x28
/* 8002C1B8 00028138  7C E7 20 10 */	subfc r7, r7, r4
/* 8002C1BC 0002813C  7C A6 19 10 */	subfe r5, r6, r3
/* 8002C1C0 00028140  6C A6 80 00 */	xoris r6, r5, 0x8000
/* 8002C1C4 00028144  6D 05 80 00 */	xoris r5, r8, 0x8000
/* 8002C1C8 00028148  7C 00 38 10 */	subfc r0, r0, r7
/* 8002C1CC 0002814C  7C A5 31 10 */	subfe r5, r5, r6
/* 8002C1D0 00028150  7C A6 31 10 */	subfe r5, r6, r6
/* 8002C1D4 00028154  7C A5 00 D1 */	neg. r5, r5
/* 8002C1D8 00028158  41 82 00 0C */	beq .L_8002C1E4
/* 8002C1DC 0002815C  3B A0 00 01 */	li r29, 0x1
/* 8002C1E0 00028160  48 00 00 14 */	b .L_8002C1F4
.L_8002C1E4:
/* 8002C1E4 00028164  38 00 00 00 */	li r0, 0x0
/* 8002C1E8 00028168  90 0D 84 B4 */	stw r0, HoldUp+4@sda21(r13)
/* 8002C1EC 0002816C  3B A0 00 00 */	li r29, 0x0
/* 8002C1F0 00028170  90 0D 84 B0 */	stw r0, HoldUp@sda21(r13)
.L_8002C1F4:
/* 8002C1F4 00028174  2C 1D 00 00 */	cmpwi r29, 0x0
/* 8002C1F8 00028178  93 AD 84 A8 */	stw r29, LastState@sda21(r13)
/* 8002C1FC 0002817C  40 82 00 B4 */	bne .L_8002C2B0
/* 8002C200 00028180  3C A0 80 00 */	lis r5, 0x800030E3@ha
/* 8002C204 00028184  88 05 30 E3 */	lbz r0, 0x800030E3@l(r5)
/* 8002C208 00028188  54 00 06 BF */	clrlwi. r0, r0, 26
/* 8002C20C 0002818C  41 82 00 A4 */	beq .L_8002C2B0
/* 8002C210 00028190  1D 40 00 3C */	mulli r10, r0, 0x3c
/* 8002C214 00028194  80 05 00 F8 */	lwz r0, 0xf8(r5)
/* 8002C218 00028198  81 2D 84 5C */	lwz r9, __OSStartTime+4@sda21(r13)
/* 8002C21C 0002819C  81 0D 84 58 */	lwz r8, __OSStartTime@sda21(r13)
/* 8002C220 000281A0  54 06 F0 BE */	srwi r6, r0, 2
/* 8002C224 000281A4  7D 40 FE 70 */	srawi r0, r10, 31
/* 8002C228 000281A8  7C E0 31 D6 */	mullw r7, r0, r6
/* 8002C22C 000281AC  7C 0A 30 16 */	mulhwu r0, r10, r6
/* 8002C230 000281B0  7C AA 31 D6 */	mullw r5, r10, r6
/* 8002C234 000281B4  7D 29 28 14 */	addc r9, r9, r5
/* 8002C238 000281B8  3B E0 00 00 */	li r31, 0x0
/* 8002C23C 000281BC  7C E7 02 14 */	add r7, r7, r0
/* 8002C240 000281C0  7C 0A F9 D6 */	mullw r0, r10, r31
/* 8002C244 000281C4  7C 07 02 14 */	add r0, r7, r0
/* 8002C248 000281C8  7D 08 01 14 */	adde r8, r8, r0
/* 8002C24C 000281CC  6D 07 80 00 */	xoris r7, r8, 0x8000
/* 8002C250 000281D0  6C 65 80 00 */	xoris r5, r3, 0x8000
/* 8002C254 000281D4  7C 04 48 10 */	subfc r0, r4, r9
/* 8002C258 000281D8  7C A5 39 10 */	subfe r5, r5, r7
/* 8002C25C 000281DC  7C A7 39 10 */	subfe r5, r7, r7
/* 8002C260 000281E0  7C A5 00 D1 */	neg. r5, r5
/* 8002C264 000281E4  41 82 00 4C */	beq .L_8002C2B0
/* 8002C268 000281E8  7C 89 20 10 */	subfc r4, r9, r4
/* 8002C26C 000281EC  7C 68 19 10 */	subfe r3, r8, r3
/* 8002C270 000281F0  38 A0 00 00 */	li r5, 0x0
/* 8002C274 000281F4  48 03 32 D1 */	bl __div2i
/* 8002C278 000281F8  38 A0 00 00 */	li r5, 0x0
/* 8002C27C 000281FC  38 C0 00 02 */	li r6, 0x2
/* 8002C280 00028200  48 03 32 C5 */	bl __div2i
/* 8002C284 00028204  38 00 00 01 */	li r0, 0x1
/* 8002C288 00028208  7C 84 00 38 */	and r4, r4, r0
/* 8002C28C 0002820C  7C 60 F8 38 */	and r0, r3, r31
/* 8002C290 00028210  7C 83 FA 78 */	xor r3, r4, r31
/* 8002C294 00028214  7C 00 FA 78 */	xor r0, r0, r31
/* 8002C298 00028218  7C 60 03 79 */	or. r0, r3, r0
/* 8002C29C 0002821C  41 82 00 10 */	beq .L_8002C2AC
/* 8002C2A0 00028220  80 0D 84 A4 */	lwz r0, Down@sda21(r13)
/* 8002C2A4 00028224  2C 00 00 00 */	cmpwi r0, 0x0
/* 8002C2A8 00028228  41 82 00 08 */	beq .L_8002C2B0
.L_8002C2AC:
/* 8002C2AC 0002822C  3B A0 00 01 */	li r29, 0x1
.L_8002C2B0:
/* 8002C2B0 00028230  7F C3 F3 78 */	mr r3, r30
/* 8002C2B4 00028234  4B FF ED 59 */	bl OSRestoreInterrupts
/* 8002C2B8 00028238  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8002C2BC 0002823C  7F A3 EB 78 */	mr r3, r29
/* 8002C2C0 00028240  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8002C2C4 00028244  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8002C2C8 00028248  7C 08 03 A6 */	mtlr r0
/* 8002C2CC 0002824C  83 A1 00 0C */	lwz r29, 0xc(r1)
/* 8002C2D0 00028250  38 21 00 18 */	addi r1, r1, 0x18
/* 8002C2D4 00028254  4E 80 00 20 */	blr
.endfn OSGetResetButtonState

.fn OSGetResetSwitchState, global
/* 8002C2D8 00028258  7C 08 02 A6 */	mflr r0
/* 8002C2DC 0002825C  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002C2E0 00028260  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8002C2E4 00028264  4B FF FD 51 */	bl OSGetResetButtonState
/* 8002C2E8 00028268  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8002C2EC 0002826C  38 21 00 08 */	addi r1, r1, 0x8
/* 8002C2F0 00028270  7C 08 03 A6 */	mtlr r0
/* 8002C2F4 00028274  4E 80 00 20 */	blr
.endfn OSGetResetSwitchState

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380

.balign 8

.obj ResetCallback, local
	.skip 0x4
.endobj ResetCallback

.obj Down, local
	.skip 0x4
.endobj Down

.obj LastState, local
	.skip 0x4
.endobj LastState

.skip 4

.obj HoldUp, local
	.skip 0x8
.endobj HoldUp

.obj HoldDown, local
	.skip 0x8
.endobj HoldDown
