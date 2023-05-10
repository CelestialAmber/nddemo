.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740


.global __ct__8DGTexManFUs
__ct__8DGTexManFUs:
/* 80017EE4 00013E64  7C 08 02 A6 */	mflr r0
/* 80017EE8 00013E68  90 01 00 04 */	stw r0, 0x4(r1)
/* 80017EEC 00013E6C  38 00 00 00 */	li r0, 0x0
/* 80017EF0 00013E70  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80017EF4 00013E74  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80017EF8 00013E78  7C 7F 1B 78 */	mr r31, r3
/* 80017EFC 00013E7C  B0 83 00 00 */	sth r4, 0x0(r3)
/* 80017F00 00013E80  B0 03 00 02 */	sth r0, 0x2(r3)
/* 80017F04 00013E84  B0 03 00 04 */	sth r0, 0x4(r3)
/* 80017F08 00013E88  A0 03 00 00 */	lhz r0, 0x0(r3)
/* 80017F0C 00013E8C  54 03 20 36 */	slwi r3, r0, 4
/* 80017F10 00013E90  4B FF AA E9 */	bl mAlloc__FUl
/* 80017F14 00013E94  90 7F 00 08 */	stw r3, 0x8(r31)
/* 80017F18 00013E98  38 80 00 00 */	li r4, 0x0
/* 80017F1C 00013E9C  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 80017F20 00013EA0  80 7F 00 08 */	lwz r3, 0x8(r31)
/* 80017F24 00013EA4  54 05 24 36 */	clrlslwi r5, r0, 20, 4
/* 80017F28 00013EA8  4B FE D4 05 */	bl memset
/* 80017F2C 00013EAC  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 80017F30 00013EB0  54 03 10 3A */	slwi r3, r0, 2
/* 80017F34 00013EB4  4B FF AA C5 */	bl mAlloc__FUl
/* 80017F38 00013EB8  90 7F 00 0C */	stw r3, 0xc(r31)
/* 80017F3C 00013EBC  38 80 00 00 */	li r4, 0x0
/* 80017F40 00013EC0  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 80017F44 00013EC4  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 80017F48 00013EC8  54 05 10 3A */	slwi r5, r0, 2
/* 80017F4C 00013ECC  4B FE D3 E1 */	bl memset
/* 80017F50 00013ED0  38 7F 00 00 */	addi r3, r31, 0x0
/* 80017F54 00013ED4  38 80 00 01 */	li r4, 0x1
/* 80017F58 00013ED8  48 00 07 5D */	bl EnableMipMap__8DGTexManFUc
/* 80017F5C 00013EDC  38 7F 00 00 */	addi r3, r31, 0x0
/* 80017F60 00013EE0  38 80 00 01 */	li r4, 0x1
/* 80017F64 00013EE4  48 00 07 59 */	bl EnableExpensiveMipMap__8DGTexManFUc
/* 80017F68 00013EE8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80017F6C 00013EEC  7F E3 FB 78 */	mr r3, r31
/* 80017F70 00013EF0  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80017F74 00013EF4  38 21 00 18 */	addi r1, r1, 0x18
/* 80017F78 00013EF8  7C 08 03 A6 */	mtlr r0
/* 80017F7C 00013EFC  4E 80 00 20 */	blr

.global __dt__8DGTexManFv
__dt__8DGTexManFv:
/* 80017F80 00013F00  7C 08 02 A6 */	mflr r0
/* 80017F84 00013F04  90 01 00 04 */	stw r0, 0x4(r1)
/* 80017F88 00013F08  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80017F8C 00013F0C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80017F90 00013F10  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80017F94 00013F14  3B C4 00 00 */	addi r30, r4, 0x0
/* 80017F98 00013F18  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80017F9C 00013F1C  7C 7D 1B 79 */	mr. r29, r3
/* 80017FA0 00013F20  41 82 00 6C */	beq .L_8001800C
/* 80017FA4 00013F24  3B E0 00 00 */	li r31, 0x0
/* 80017FA8 00013F28  48 00 00 14 */	b .L_80017FBC
.L_80017FAC:
/* 80017FAC 00013F2C  38 7D 00 00 */	addi r3, r29, 0x0
/* 80017FB0 00013F30  38 9F 00 00 */	addi r4, r31, 0x0
/* 80017FB4 00013F34  48 00 00 79 */	bl DeleteTexture__8DGTexManFUs
/* 80017FB8 00013F38  3B FF 00 01 */	addi r31, r31, 0x1
.L_80017FBC:
/* 80017FBC 00013F3C  A0 1D 00 00 */	lhz r0, 0x0(r29)
/* 80017FC0 00013F40  57 E3 04 3E */	clrlwi r3, r31, 16
/* 80017FC4 00013F44  7C 03 00 40 */	cmplw r3, r0
/* 80017FC8 00013F48  41 80 FF E4 */	blt .L_80017FAC
/* 80017FCC 00013F4C  80 7D 00 0C */	lwz r3, 0xc(r29)
/* 80017FD0 00013F50  28 03 00 00 */	cmplwi r3, 0x0
/* 80017FD4 00013F54  41 82 00 10 */	beq .L_80017FE4
/* 80017FD8 00013F58  4B FF AA C1 */	bl mFree__FPv
/* 80017FDC 00013F5C  38 00 00 00 */	li r0, 0x0
/* 80017FE0 00013F60  90 1D 00 0C */	stw r0, 0xc(r29)
.L_80017FE4:
/* 80017FE4 00013F64  80 7D 00 08 */	lwz r3, 0x8(r29)
/* 80017FE8 00013F68  28 03 00 00 */	cmplwi r3, 0x0
/* 80017FEC 00013F6C  41 82 00 10 */	beq .L_80017FFC
/* 80017FF0 00013F70  4B FF AA A9 */	bl mFree__FPv
/* 80017FF4 00013F74  38 00 00 00 */	li r0, 0x0
/* 80017FF8 00013F78  90 1D 00 08 */	stw r0, 0x8(r29)
.L_80017FFC:
/* 80017FFC 00013F7C  7F C0 07 35 */	extsh. r0, r30
/* 80018000 00013F80  40 81 00 0C */	ble .L_8001800C
/* 80018004 00013F84  7F A3 EB 78 */	mr r3, r29
/* 80018008 00013F88  4B FF AA 91 */	bl mFree__FPv
.L_8001800C:
/* 8001800C 00013F8C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80018010 00013F90  7F A3 EB 78 */	mr r3, r29
/* 80018014 00013F94  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80018018 00013F98  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8001801C 00013F9C  7C 08 03 A6 */	mtlr r0
/* 80018020 00013FA0  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80018024 00013FA4  38 21 00 20 */	addi r1, r1, 0x20
/* 80018028 00013FA8  4E 80 00 20 */	blr

.global DeleteTexture__8DGTexManFUs
DeleteTexture__8DGTexManFUs:
/* 8001802C 00013FAC  7C 08 02 A6 */	mflr r0
/* 80018030 00013FB0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80018034 00013FB4  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80018038 00013FB8  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8001803C 00013FBC  54 9F 04 3E */	clrlwi r31, r4, 16
/* 80018040 00013FC0  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80018044 00013FC4  7C 7E 1B 78 */	mr r30, r3
/* 80018048 00013FC8  A0 03 00 00 */	lhz r0, 0x0(r3)
/* 8001804C 00013FCC  7C 1F 00 40 */	cmplw r31, r0
/* 80018050 00013FD0  40 80 00 74 */	bge .L_800180C4
/* 80018054 00013FD4  80 7E 00 08 */	lwz r3, 0x8(r30)
/* 80018058 00013FD8  57 E0 20 36 */	slwi r0, r31, 4
/* 8001805C 00013FDC  7C 63 02 14 */	add r3, r3, r0
/* 80018060 00013FE0  88 03 00 00 */	lbz r0, 0x0(r3)
/* 80018064 00013FE4  7C 00 07 75 */	extsb. r0, r0
/* 80018068 00013FE8  41 82 00 48 */	beq .L_800180B0
/* 8001806C 00013FEC  38 80 00 00 */	li r4, 0x0
/* 80018070 00013FF0  38 A0 00 10 */	li r5, 0x10
/* 80018074 00013FF4  4B FE D2 B9 */	bl memset
/* 80018078 00013FF8  80 7E 00 0C */	lwz r3, 0xc(r30)
/* 8001807C 00013FFC  57 FF 10 3A */	slwi r31, r31, 2
/* 80018080 00014000  7C 63 F8 2E */	lwzx r3, r3, r31
/* 80018084 00014004  28 03 00 00 */	cmplwi r3, 0x0
/* 80018088 00014008  41 82 00 18 */	beq .L_800180A0
/* 8001808C 0001400C  38 80 00 01 */	li r4, 0x1
/* 80018090 00014010  48 00 2A 19 */	bl __dt__9DGTextureFv
/* 80018094 00014014  80 7E 00 0C */	lwz r3, 0xc(r30)
/* 80018098 00014018  38 00 00 00 */	li r0, 0x0
/* 8001809C 0001401C  7C 03 F9 2E */	stwx r0, r3, r31
.L_800180A0:
/* 800180A0 00014020  A0 7E 00 02 */	lhz r3, 0x2(r30)
/* 800180A4 00014024  38 03 FF FF */	addi r0, r3, -0x1
/* 800180A8 00014028  B0 1E 00 02 */	sth r0, 0x2(r30)
/* 800180AC 0001402C  48 00 00 28 */	b .L_800180D4
.L_800180B0:
/* 800180B0 00014030  3C 60 80 06 */	lis r3, lbl_80066BAC@ha
/* 800180B4 00014034  4C C6 31 82 */	crclr 4*cr1+eq
/* 800180B8 00014038  38 63 6B AC */	addi r3, r3, lbl_80066BAC@l
/* 800180BC 0001403C  48 01 1B 29 */	bl OSReport
/* 800180C0 00014040  48 00 00 14 */	b .L_800180D4
.L_800180C4:
/* 800180C4 00014044  3C 60 80 06 */	lis r3, lbl_80066BAC@ha
/* 800180C8 00014048  4C C6 31 82 */	crclr 4*cr1+eq
/* 800180CC 0001404C  38 63 6B AC */	addi r3, r3, lbl_80066BAC@l
/* 800180D0 00014050  48 01 1B 15 */	bl OSReport
.L_800180D4:
/* 800180D4 00014054  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800180D8 00014058  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800180DC 0001405C  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800180E0 00014060  7C 08 03 A6 */	mtlr r0
/* 800180E4 00014064  38 21 00 18 */	addi r1, r1, 0x18
/* 800180E8 00014068  4E 80 00 20 */	blr

.global LoadTexture__8DGTexManFPCc
LoadTexture__8DGTexManFPCc:
/* 800180EC 0001406C  7C 08 02 A6 */	mflr r0
/* 800180F0 00014070  3C A0 80 06 */	lis r5, lbl_80066B88@ha
/* 800180F4 00014074  90 01 00 04 */	stw r0, 0x4(r1)
/* 800180F8 00014078  94 21 FF B8 */	stwu r1, -0x48(r1)
/* 800180FC 0001407C  BF 41 00 30 */	stmw r26, 0x30(r1)
/* 80018100 00014080  3B 60 00 00 */	li r27, 0x0
/* 80018104 00014084  3B E5 6B 88 */	addi r31, r5, lbl_80066B88@l
/* 80018108 00014088  3B A3 00 00 */	addi r29, r3, 0x0
/* 8001810C 0001408C  3B C4 00 00 */	addi r30, r4, 0x0
/* 80018110 00014090  3B 9B 00 00 */	addi r28, r27, 0x0
/* 80018114 00014094  3B 5B 00 00 */	addi r26, r27, 0x0
/* 80018118 00014098  48 00 00 3C */	b .L_80018154
.L_8001811C:
/* 8001811C 0001409C  80 1D 00 08 */	lwz r0, 0x8(r29)
/* 80018120 000140A0  7C 60 D2 14 */	add r3, r0, r26
/* 80018124 000140A4  88 03 00 00 */	lbz r0, 0x0(r3)
/* 80018128 000140A8  7C 00 07 75 */	extsb. r0, r0
/* 8001812C 000140AC  41 82 00 20 */	beq .L_8001814C
/* 80018130 000140B0  38 9E 00 00 */	addi r4, r30, 0x0
/* 80018134 000140B4  38 A0 00 10 */	li r5, 0x10
/* 80018138 000140B8  3B 7B 00 01 */	addi r27, r27, 0x1
/* 8001813C 000140BC  48 04 9F 7D */	bl strncmp
/* 80018140 000140C0  2C 03 00 00 */	cmpwi r3, 0x0
/* 80018144 000140C4  40 82 00 08 */	bne .L_8001814C
/* 80018148 000140C8  48 00 00 34 */	b .L_8001817C
.L_8001814C:
/* 8001814C 000140CC  3B 5A 00 10 */	addi r26, r26, 0x10
/* 80018150 000140D0  3B 9C 00 01 */	addi r28, r28, 0x1
.L_80018154:
/* 80018154 000140D4  A0 1D 00 00 */	lhz r0, 0x0(r29)
/* 80018158 000140D8  57 83 04 3E */	clrlwi r3, r28, 16
/* 8001815C 000140DC  7C 03 00 40 */	cmplw r3, r0
/* 80018160 000140E0  40 80 00 14 */	bge .L_80018174
/* 80018164 000140E4  A0 1D 00 02 */	lhz r0, 0x2(r29)
/* 80018168 000140E8  57 63 04 3E */	clrlwi r3, r27, 16
/* 8001816C 000140EC  7C 03 00 40 */	cmplw r3, r0
/* 80018170 000140F0  41 80 FF AC */	blt .L_8001811C
.L_80018174:
/* 80018174 000140F4  3C 60 00 01 */	lis r3, 0x1
/* 80018178 000140F8  3B 83 FF FF */	addi r28, r3, -0x1
.L_8001817C:
/* 8001817C 000140FC  57 80 04 3E */	clrlwi r0, r28, 16
/* 80018180 00014100  28 00 FF FF */	cmplwi r0, 0xffff
/* 80018184 00014104  41 82 00 1C */	beq .L_800181A0
/* 80018188 00014108  38 9E 00 00 */	addi r4, r30, 0x0
/* 8001818C 0001410C  4C C6 31 82 */	crclr 4*cr1+eq
/* 80018190 00014110  38 7F 00 54 */	addi r3, r31, 0x54
/* 80018194 00014114  48 01 1A 51 */	bl OSReport
/* 80018198 00014118  7F 83 E3 78 */	mr r3, r28
/* 8001819C 0001411C  48 00 01 20 */	b .L_800182BC
.L_800181A0:
/* 800181A0 00014120  38 61 00 10 */	addi r3, r1, 0x10
/* 800181A4 00014124  38 8D 81 38 */	addi r4, r13, lbl_800A8BB8@sda21
/* 800181A8 00014128  48 04 9F 95 */	bl strcpy
/* 800181AC 0001412C  38 9E 00 00 */	addi r4, r30, 0x0
/* 800181B0 00014130  38 61 00 14 */	addi r3, r1, 0x14
/* 800181B4 00014134  38 A0 00 10 */	li r5, 0x10
/* 800181B8 00014138  4B FE D2 69 */	bl memcpy
/* 800181BC 0001413C  38 00 00 00 */	li r0, 0x0
/* 800181C0 00014140  98 01 00 24 */	stb r0, 0x24(r1)
/* 800181C4 00014144  38 61 00 10 */	addi r3, r1, 0x10
/* 800181C8 00014148  48 04 A0 29 */	bl strlen
/* 800181CC 0001414C  38 01 00 10 */	addi r0, r1, 0x10
/* 800181D0 00014150  7C 60 1A 14 */	add r3, r0, r3
/* 800181D4 00014154  38 8D 81 40 */	addi r4, r13, lbl_800A8BC0@sda21
/* 800181D8 00014158  48 04 9F 65 */	bl strcpy
/* 800181DC 0001415C  38 60 00 14 */	li r3, 0x14
/* 800181E0 00014160  4B FF A8 19 */	bl mAlloc__FUl
/* 800181E4 00014164  3B 83 00 00 */	addi r28, r3, 0x0
/* 800181E8 00014168  7F 83 E3 79 */	mr. r3, r28
/* 800181EC 0001416C  41 82 00 08 */	beq .L_800181F4
/* 800181F0 00014170  48 00 28 95 */	bl __ct__9DGTextureFv
.L_800181F4:
/* 800181F4 00014174  3B 5C 00 00 */	addi r26, r28, 0x0
/* 800181F8 00014178  38 7A 00 00 */	addi r3, r26, 0x0
/* 800181FC 0001417C  38 81 00 10 */	addi r4, r1, 0x10
/* 80018200 00014180  48 00 29 89 */	bl LoadDTX__9DGTextureFPc
/* 80018204 00014184  54 60 06 3E */	clrlwi r0, r3, 24
/* 80018208 00014188  28 00 00 01 */	cmplwi r0, 0x1
/* 8001820C 0001418C  40 82 00 88 */	bne .L_80018294
/* 80018210 00014190  3B 60 00 00 */	li r27, 0x0
/* 80018214 00014194  A0 9D 00 00 */	lhz r4, 0x0(r29)
/* 80018218 00014198  7F 63 DB 78 */	mr r3, r27
/* 8001821C 0001419C  48 00 00 50 */	b .L_8001826C
.L_80018220:
/* 80018220 000141A0  80 BD 00 08 */	lwz r5, 0x8(r29)
/* 80018224 000141A4  7C 05 18 AE */	lbzx r0, r5, r3
/* 80018228 000141A8  7C 00 07 75 */	extsb. r0, r0
/* 8001822C 000141AC  40 82 00 38 */	bne .L_80018264
/* 80018230 000141B0  57 7F 04 3E */	clrlwi r31, r27, 16
/* 80018234 000141B4  57 60 23 36 */	clrlslwi r0, r27, 16, 4
/* 80018238 000141B8  38 9E 00 00 */	addi r4, r30, 0x0
/* 8001823C 000141BC  7C 65 02 14 */	add r3, r5, r0
/* 80018240 000141C0  38 A0 00 10 */	li r5, 0x10
/* 80018244 000141C4  4B FE D1 DD */	bl memcpy
/* 80018248 000141C8  80 7D 00 0C */	lwz r3, 0xc(r29)
/* 8001824C 000141CC  57 E0 10 3A */	slwi r0, r31, 2
/* 80018250 000141D0  7F 83 01 2E */	stwx r28, r3, r0
/* 80018254 000141D4  A0 7D 00 02 */	lhz r3, 0x2(r29)
/* 80018258 000141D8  38 03 00 01 */	addi r0, r3, 0x1
/* 8001825C 000141DC  B0 1D 00 02 */	sth r0, 0x2(r29)
/* 80018260 000141E0  48 00 00 2C */	b .L_8001828C
.L_80018264:
/* 80018264 000141E4  38 63 00 10 */	addi r3, r3, 0x10
/* 80018268 000141E8  3B 7B 00 01 */	addi r27, r27, 0x1
.L_8001826C:
/* 8001826C 000141EC  57 60 04 3E */	clrlwi r0, r27, 16
/* 80018270 000141F0  7C 00 20 40 */	cmplw r0, r4
/* 80018274 000141F4  41 80 FF AC */	blt .L_80018220
/* 80018278 000141F8  38 7F 00 00 */	addi r3, r31, 0x0
/* 8001827C 000141FC  4C C6 31 82 */	crclr 4*cr1+eq
/* 80018280 00014200  48 01 19 65 */	bl OSReport
/* 80018284 00014204  3C 60 00 01 */	lis r3, 0x1
/* 80018288 00014208  3B 63 FF FF */	addi r27, r3, -0x1
.L_8001828C:
/* 8001828C 0001420C  7F 63 DB 78 */	mr r3, r27
/* 80018290 00014210  48 00 00 2C */	b .L_800182BC
.L_80018294:
/* 80018294 00014214  38 7F 00 70 */	addi r3, r31, 0x70
/* 80018298 00014218  4C C6 31 82 */	crclr 4*cr1+eq
/* 8001829C 0001421C  48 01 19 49 */	bl OSReport
/* 800182A0 00014220  28 1C 00 00 */	cmplwi r28, 0x0
/* 800182A4 00014224  41 82 00 10 */	beq .L_800182B4
/* 800182A8 00014228  38 7A 00 00 */	addi r3, r26, 0x0
/* 800182AC 0001422C  38 80 00 01 */	li r4, 0x1
/* 800182B0 00014230  48 00 27 F9 */	bl __dt__9DGTextureFv
.L_800182B4:
/* 800182B4 00014234  3C 60 00 01 */	lis r3, 0x1
/* 800182B8 00014238  38 63 FF FF */	addi r3, r3, -0x1
.L_800182BC:
/* 800182BC 0001423C  BB 41 00 30 */	lmw r26, 0x30(r1)
/* 800182C0 00014240  80 01 00 4C */	lwz r0, 0x4c(r1)
/* 800182C4 00014244  38 21 00 48 */	addi r1, r1, 0x48
/* 800182C8 00014248  7C 08 03 A6 */	mtlr r0
/* 800182CC 0001424C  4E 80 00 20 */	blr

.global AttachTexture__8DGTexManFUs
AttachTexture__8DGTexManFUs:
/* 800182D0 00014250  7C 08 02 A6 */	mflr r0
/* 800182D4 00014254  90 01 00 04 */	stw r0, 0x4(r1)
/* 800182D8 00014258  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800182DC 0001425C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800182E0 00014260  7C 9F 23 78 */	mr r31, r4
/* 800182E4 00014264  54 84 04 3E */	clrlwi r4, r4, 16
/* 800182E8 00014268  A0 03 00 00 */	lhz r0, 0x0(r3)
/* 800182EC 0001426C  7C 04 00 40 */	cmplw r4, r0
/* 800182F0 00014270  40 80 00 14 */	bge .L_80018304
/* 800182F4 00014274  80 63 00 0C */	lwz r3, 0xc(r3)
/* 800182F8 00014278  54 80 10 3A */	slwi r0, r4, 2
/* 800182FC 0001427C  7C 03 00 2E */	lwzx r0, r3, r0
/* 80018300 00014280  48 00 00 18 */	b .L_80018318
.L_80018304:
/* 80018304 00014284  3C 60 80 06 */	lis r3, lbl_80066C24@ha
/* 80018308 00014288  4C C6 31 82 */	crclr 4*cr1+eq
/* 8001830C 0001428C  38 63 6C 24 */	addi r3, r3, lbl_80066C24@l
/* 80018310 00014290  48 01 18 D5 */	bl OSReport
/* 80018314 00014294  38 00 00 00 */	li r0, 0x0
.L_80018318:
/* 80018318 00014298  28 00 00 00 */	cmplwi r0, 0x0
/* 8001831C 0001429C  7C 03 03 78 */	mr r3, r0
/* 80018320 000142A0  41 82 00 10 */	beq .L_80018330
/* 80018324 000142A4  48 00 28 05 */	bl IncRefer__9DGTextureFv
/* 80018328 000142A8  7F E3 FB 78 */	mr r3, r31
/* 8001832C 000142AC  48 00 00 1C */	b .L_80018348
.L_80018330:
/* 80018330 000142B0  3C 60 80 06 */	lis r3, lbl_80066C50@ha
/* 80018334 000142B4  4C C6 31 82 */	crclr 4*cr1+eq
/* 80018338 000142B8  38 63 6C 50 */	addi r3, r3, lbl_80066C50@l
/* 8001833C 000142BC  48 01 18 A9 */	bl OSReport
/* 80018340 000142C0  3C 60 00 01 */	lis r3, 0x1
/* 80018344 000142C4  38 63 FF FF */	addi r3, r3, -0x1
.L_80018348:
/* 80018348 000142C8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8001834C 000142CC  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80018350 000142D0  38 21 00 18 */	addi r1, r1, 0x18
/* 80018354 000142D4  7C 08 03 A6 */	mtlr r0
/* 80018358 000142D8  4E 80 00 20 */	blr

.global DetachTexture__8DGTexManFUs
DetachTexture__8DGTexManFUs:
/* 8001835C 000142DC  7C 08 02 A6 */	mflr r0
/* 80018360 000142E0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80018364 000142E4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80018368 000142E8  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8001836C 000142EC  3B E3 00 00 */	addi r31, r3, 0x0
/* 80018370 000142F0  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80018374 000142F4  3B C4 00 00 */	addi r30, r4, 0x0
/* 80018378 000142F8  54 84 04 3E */	clrlwi r4, r4, 16
/* 8001837C 000142FC  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80018380 00014300  A0 03 00 00 */	lhz r0, 0x0(r3)
/* 80018384 00014304  3C 60 80 06 */	lis r3, lbl_80066B88@ha
/* 80018388 00014308  3B A3 6B 88 */	addi r29, r3, lbl_80066B88@l
/* 8001838C 0001430C  7C 04 00 40 */	cmplw r4, r0
/* 80018390 00014310  40 80 00 14 */	bge .L_800183A4
/* 80018394 00014314  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 80018398 00014318  54 80 10 3A */	slwi r0, r4, 2
/* 8001839C 0001431C  7C 03 00 2E */	lwzx r0, r3, r0
/* 800183A0 00014320  48 00 00 14 */	b .L_800183B4
.L_800183A4:
/* 800183A4 00014324  38 7D 00 9C */	addi r3, r29, 0x9c
/* 800183A8 00014328  4C C6 31 82 */	crclr 4*cr1+eq
/* 800183AC 0001432C  48 01 18 39 */	bl OSReport
/* 800183B0 00014330  38 00 00 00 */	li r0, 0x0
.L_800183B4:
/* 800183B4 00014334  28 00 00 00 */	cmplwi r0, 0x0
/* 800183B8 00014338  7C 03 03 78 */	mr r3, r0
/* 800183BC 0001433C  41 82 00 9C */	beq .L_80018458
/* 800183C0 00014340  48 00 27 7D */	bl DecRefer__9DGTextureFv
/* 800183C4 00014344  54 60 04 3F */	clrlwi. r0, r3, 16
/* 800183C8 00014348  40 82 00 9C */	bne .L_80018464
/* 800183CC 0001434C  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 800183D0 00014350  57 DE 04 3E */	clrlwi r30, r30, 16
/* 800183D4 00014354  7C 1E 00 40 */	cmplw r30, r0
/* 800183D8 00014358  40 80 00 70 */	bge .L_80018448
/* 800183DC 0001435C  80 7F 00 08 */	lwz r3, 0x8(r31)
/* 800183E0 00014360  57 C0 20 36 */	slwi r0, r30, 4
/* 800183E4 00014364  7C 63 02 14 */	add r3, r3, r0
/* 800183E8 00014368  88 03 00 00 */	lbz r0, 0x0(r3)
/* 800183EC 0001436C  7C 00 07 75 */	extsb. r0, r0
/* 800183F0 00014370  41 82 00 48 */	beq .L_80018438
/* 800183F4 00014374  38 80 00 00 */	li r4, 0x0
/* 800183F8 00014378  38 A0 00 10 */	li r5, 0x10
/* 800183FC 0001437C  4B FE CF 31 */	bl memset
/* 80018400 00014380  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 80018404 00014384  57 DD 10 3A */	slwi r29, r30, 2
/* 80018408 00014388  7C 63 E8 2E */	lwzx r3, r3, r29
/* 8001840C 0001438C  28 03 00 00 */	cmplwi r3, 0x0
/* 80018410 00014390  41 82 00 18 */	beq .L_80018428
/* 80018414 00014394  38 80 00 01 */	li r4, 0x1
/* 80018418 00014398  48 00 26 91 */	bl __dt__9DGTextureFv
/* 8001841C 0001439C  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 80018420 000143A0  38 00 00 00 */	li r0, 0x0
/* 80018424 000143A4  7C 03 E9 2E */	stwx r0, r3, r29
.L_80018428:
/* 80018428 000143A8  A0 7F 00 02 */	lhz r3, 0x2(r31)
/* 8001842C 000143AC  38 03 FF FF */	addi r0, r3, -0x1
/* 80018430 000143B0  B0 1F 00 02 */	sth r0, 0x2(r31)
/* 80018434 000143B4  48 00 00 30 */	b .L_80018464
.L_80018438:
/* 80018438 000143B8  38 7D 00 24 */	addi r3, r29, 0x24
/* 8001843C 000143BC  4C C6 31 82 */	crclr 4*cr1+eq
/* 80018440 000143C0  48 01 17 A5 */	bl OSReport
/* 80018444 000143C4  48 00 00 20 */	b .L_80018464
.L_80018448:
/* 80018448 000143C8  38 7D 00 24 */	addi r3, r29, 0x24
/* 8001844C 000143CC  4C C6 31 82 */	crclr 4*cr1+eq
/* 80018450 000143D0  48 01 17 95 */	bl OSReport
/* 80018454 000143D4  48 00 00 10 */	b .L_80018464
.L_80018458:
/* 80018458 000143D8  38 7D 00 F0 */	addi r3, r29, 0xf0
/* 8001845C 000143DC  4C C6 31 82 */	crclr 4*cr1+eq
/* 80018460 000143E0  48 01 17 85 */	bl OSReport
.L_80018464:
/* 80018464 000143E4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80018468 000143E8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8001846C 000143EC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80018470 000143F0  7C 08 03 A6 */	mtlr r0
/* 80018474 000143F4  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80018478 000143F8  38 21 00 20 */	addi r1, r1, 0x20
/* 8001847C 000143FC  4E 80 00 20 */	blr

.global GetWidth__8DGTexManFUs
GetWidth__8DGTexManFUs:
/* 80018480 00014400  7C 08 02 A6 */	mflr r0
/* 80018484 00014404  54 84 04 3E */	clrlwi r4, r4, 16
/* 80018488 00014408  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001848C 0001440C  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80018490 00014410  A0 03 00 00 */	lhz r0, 0x0(r3)
/* 80018494 00014414  7C 04 00 40 */	cmplw r4, r0
/* 80018498 00014418  40 80 00 14 */	bge .L_800184AC
/* 8001849C 0001441C  80 63 00 0C */	lwz r3, 0xc(r3)
/* 800184A0 00014420  54 80 10 3A */	slwi r0, r4, 2
/* 800184A4 00014424  7C 03 00 2E */	lwzx r0, r3, r0
/* 800184A8 00014428  48 00 00 18 */	b .L_800184C0
.L_800184AC:
/* 800184AC 0001442C  3C 60 80 06 */	lis r3, lbl_80066C24@ha
/* 800184B0 00014430  4C C6 31 82 */	crclr 4*cr1+eq
/* 800184B4 00014434  38 63 6C 24 */	addi r3, r3, lbl_80066C24@l
/* 800184B8 00014438  48 01 17 2D */	bl OSReport
/* 800184BC 0001443C  38 00 00 00 */	li r0, 0x0
.L_800184C0:
/* 800184C0 00014440  7C 03 03 78 */	mr r3, r0
/* 800184C4 00014444  48 00 28 51 */	bl GetWidth__9DGTextureFv
/* 800184C8 00014448  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800184CC 0001444C  38 21 00 08 */	addi r1, r1, 0x8
/* 800184D0 00014450  7C 08 03 A6 */	mtlr r0
/* 800184D4 00014454  4E 80 00 20 */	blr

.global GetHeight__8DGTexManFUs
GetHeight__8DGTexManFUs:
/* 800184D8 00014458  7C 08 02 A6 */	mflr r0
/* 800184DC 0001445C  54 84 04 3E */	clrlwi r4, r4, 16
/* 800184E0 00014460  90 01 00 04 */	stw r0, 0x4(r1)
/* 800184E4 00014464  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 800184E8 00014468  A0 03 00 00 */	lhz r0, 0x0(r3)
/* 800184EC 0001446C  7C 04 00 40 */	cmplw r4, r0
/* 800184F0 00014470  40 80 00 14 */	bge .L_80018504
/* 800184F4 00014474  80 63 00 0C */	lwz r3, 0xc(r3)
/* 800184F8 00014478  54 80 10 3A */	slwi r0, r4, 2
/* 800184FC 0001447C  7C 03 00 2E */	lwzx r0, r3, r0
/* 80018500 00014480  48 00 00 18 */	b .L_80018518
.L_80018504:
/* 80018504 00014484  3C 60 80 06 */	lis r3, lbl_80066C24@ha
/* 80018508 00014488  4C C6 31 82 */	crclr 4*cr1+eq
/* 8001850C 0001448C  38 63 6C 24 */	addi r3, r3, lbl_80066C24@l
/* 80018510 00014490  48 01 16 D5 */	bl OSReport
/* 80018514 00014494  38 00 00 00 */	li r0, 0x0
.L_80018518:
/* 80018518 00014498  7C 03 03 78 */	mr r3, r0
/* 8001851C 0001449C  48 00 28 01 */	bl GetHeight__9DGTextureFv
/* 80018520 000144A0  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80018524 000144A4  38 21 00 08 */	addi r1, r1, 0x8
/* 80018528 000144A8  7C 08 03 A6 */	mtlr r0
/* 8001852C 000144AC  4E 80 00 20 */	blr

.global InitTexObj__8DGTexManFP9_GXTexObjUs14_GXTexWrapMode14_GXTexWrapMode
InitTexObj__8DGTexManFP9_GXTexObjUs14_GXTexWrapMode14_GXTexWrapMode:
/* 80018530 000144B0  7C 08 02 A6 */	mflr r0
/* 80018534 000144B4  54 A5 04 3E */	clrlwi r5, r5, 16
/* 80018538 000144B8  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001853C 000144BC  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 80018540 000144C0  BE E1 00 2C */	stmw r23, 0x2c(r1)
/* 80018544 000144C4  7C 7E 1B 78 */	mr r30, r3
/* 80018548 000144C8  3B E4 00 00 */	addi r31, r4, 0x0
/* 8001854C 000144CC  3A E6 00 00 */	addi r23, r6, 0x0
/* 80018550 000144D0  3B 07 00 00 */	addi r24, r7, 0x0
/* 80018554 000144D4  A0 03 00 00 */	lhz r0, 0x0(r3)
/* 80018558 000144D8  7C 05 00 40 */	cmplw r5, r0
/* 8001855C 000144DC  40 80 00 14 */	bge .L_80018570
/* 80018560 000144E0  80 7E 00 0C */	lwz r3, 0xc(r30)
/* 80018564 000144E4  54 A0 10 3A */	slwi r0, r5, 2
/* 80018568 000144E8  7C 03 00 2E */	lwzx r0, r3, r0
/* 8001856C 000144EC  48 00 00 18 */	b .L_80018584
.L_80018570:
/* 80018570 000144F0  3C 60 80 06 */	lis r3, lbl_80066C24@ha
/* 80018574 000144F4  4C C6 31 82 */	crclr 4*cr1+eq
/* 80018578 000144F8  38 63 6C 24 */	addi r3, r3, lbl_80066C24@l
/* 8001857C 000144FC  48 01 16 69 */	bl OSReport
/* 80018580 00014500  38 00 00 00 */	li r0, 0x0
.L_80018584:
/* 80018584 00014504  7C 1A 03 78 */	mr r26, r0
/* 80018588 00014508  38 7A 00 00 */	addi r3, r26, 0x0
/* 8001858C 0001450C  3B 20 00 00 */	li r25, 0x0
/* 80018590 00014510  48 00 27 9D */	bl GetMipLevel__9DGTextureFv
/* 80018594 00014514  54 60 06 3F */	clrlwi. r0, r3, 24
/* 80018598 00014518  41 82 00 08 */	beq .L_800185A0
/* 8001859C 0001451C  8B 3E 00 10 */	lbz r25, 0x10(r30)
.L_800185A0:
/* 800185A0 00014520  7F 43 D3 78 */	mr r3, r26
/* 800185A4 00014524  48 00 27 81 */	bl GetFormat__9DGTextureFv
/* 800185A8 00014528  3B 63 00 00 */	addi r27, r3, 0x0
/* 800185AC 0001452C  38 7A 00 00 */	addi r3, r26, 0x0
/* 800185B0 00014530  48 00 27 6D */	bl GetHeight__9DGTextureFv
/* 800185B4 00014534  3B 83 00 00 */	addi r28, r3, 0x0
/* 800185B8 00014538  38 7A 00 00 */	addi r3, r26, 0x0
/* 800185BC 0001453C  48 00 27 59 */	bl GetWidth__9DGTextureFv
/* 800185C0 00014540  3B A3 00 00 */	addi r29, r3, 0x0
/* 800185C4 00014544  38 7A 00 00 */	addi r3, r26, 0x0
/* 800185C8 00014548  48 00 27 45 */	bl GetImagePtr__9DGTextureFv
/* 800185CC 0001454C  38 83 00 00 */	addi r4, r3, 0x0
/* 800185D0 00014550  38 7F 00 00 */	addi r3, r31, 0x0
/* 800185D4 00014554  38 BD 00 00 */	addi r5, r29, 0x0
/* 800185D8 00014558  38 DC 00 00 */	addi r6, r28, 0x0
/* 800185DC 0001455C  38 FB 00 00 */	addi r7, r27, 0x0
/* 800185E0 00014560  39 17 00 00 */	addi r8, r23, 0x0
/* 800185E4 00014564  39 38 00 00 */	addi r9, r24, 0x0
/* 800185E8 00014568  39 59 00 00 */	addi r10, r25, 0x0
/* 800185EC 0001456C  48 02 5F FD */	bl GXInitTexObj
/* 800185F0 00014570  57 20 06 3E */	clrlwi r0, r25, 24
/* 800185F4 00014574  28 00 00 01 */	cmplwi r0, 0x1
/* 800185F8 00014578  40 82 00 A4 */	bne .L_8001869C
/* 800185FC 0001457C  88 1E 00 11 */	lbz r0, 0x11(r30)
/* 80018600 00014580  28 00 00 00 */	cmplwi r0, 0x0
/* 80018604 00014584  40 82 00 50 */	bne .L_80018654
/* 80018608 00014588  7F 43 D3 78 */	mr r3, r26
/* 8001860C 0001458C  48 00 27 21 */	bl GetMipLevel__9DGTextureFv
/* 80018610 00014590  54 60 06 3E */	clrlwi r0, r3, 24
/* 80018614 00014594  C0 22 81 70 */	lfs f1, lbl_800A94F0@sda21(r2)
/* 80018618 00014598  90 01 00 24 */	stw r0, 0x24(r1)
/* 8001861C 0001459C  3C 00 43 30 */	lis r0, 0x4330
/* 80018620 000145A0  C8 42 81 78 */	lfd f2, lbl_800A94F8@sda21(r2)
/* 80018624 000145A4  FC 60 08 90 */	fmr f3, f1
/* 80018628 000145A8  90 01 00 20 */	stw r0, 0x20(r1)
/* 8001862C 000145AC  7F E3 FB 78 */	mr r3, r31
/* 80018630 000145B0  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 80018634 000145B4  38 80 00 05 */	li r4, 0x5
/* 80018638 000145B8  38 A0 00 01 */	li r5, 0x1
/* 8001863C 000145BC  EC 40 10 28 */	fsubs f2, f0, f2
/* 80018640 000145C0  38 C0 00 00 */	li r6, 0x0
/* 80018644 000145C4  38 E0 00 00 */	li r7, 0x0
/* 80018648 000145C8  39 00 00 00 */	li r8, 0x0
/* 8001864C 000145CC  48 02 62 11 */	bl GXInitTexObjLOD
/* 80018650 000145D0  48 00 00 4C */	b .L_8001869C
.L_80018654:
/* 80018654 000145D4  7F 43 D3 78 */	mr r3, r26
/* 80018658 000145D8  48 00 26 D5 */	bl GetMipLevel__9DGTextureFv
/* 8001865C 000145DC  54 60 06 3E */	clrlwi r0, r3, 24
/* 80018660 000145E0  C8 42 81 78 */	lfd f2, lbl_800A94F8@sda21(r2)
/* 80018664 000145E4  90 01 00 24 */	stw r0, 0x24(r1)
/* 80018668 000145E8  3C 00 43 30 */	lis r0, 0x4330
/* 8001866C 000145EC  C0 22 81 70 */	lfs f1, lbl_800A94F0@sda21(r2)
/* 80018670 000145F0  7F E3 FB 78 */	mr r3, r31
/* 80018674 000145F4  90 01 00 20 */	stw r0, 0x20(r1)
/* 80018678 000145F8  C0 62 81 74 */	lfs f3, lbl_800A94F4@sda21(r2)
/* 8001867C 000145FC  38 80 00 05 */	li r4, 0x5
/* 80018680 00014600  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 80018684 00014604  38 A0 00 01 */	li r5, 0x1
/* 80018688 00014608  38 C0 00 01 */	li r6, 0x1
/* 8001868C 0001460C  EC 40 10 28 */	fsubs f2, f0, f2
/* 80018690 00014610  38 E0 00 01 */	li r7, 0x1
/* 80018694 00014614  39 00 00 02 */	li r8, 0x2
/* 80018698 00014618  48 02 61 C5 */	bl GXInitTexObjLOD
.L_8001869C:
/* 8001869C 0001461C  7F 23 CB 78 */	mr r3, r25
/* 800186A0 00014620  BA E1 00 2C */	lmw r23, 0x2c(r1)
/* 800186A4 00014624  80 01 00 54 */	lwz r0, 0x54(r1)
/* 800186A8 00014628  38 21 00 50 */	addi r1, r1, 0x50
/* 800186AC 0001462C  7C 08 03 A6 */	mtlr r0
/* 800186B0 00014630  4E 80 00 20 */	blr

.global EnableMipMap__8DGTexManFUc
EnableMipMap__8DGTexManFUc:
/* 800186B4 00014634  98 83 00 10 */	stb r4, 0x10(r3)
/* 800186B8 00014638  4E 80 00 20 */	blr

.global EnableExpensiveMipMap__8DGTexManFUc
EnableExpensiveMipMap__8DGTexManFUc:
/* 800186BC 0001463C  98 83 00 11 */	stb r4, 0x11(r3)
/* 800186C0 00014640  4E 80 00 20 */	blr

.section .data, "wa"  # 0x80065000 - 0x8006D1C0 ; 0x000081C0

lbl_80066B88:
	.asciz "Error DGTexMan::AddTexture> Full\n"
	.balign 4

lbl_80066BAC:
	.4byte 0x4572726F
	.4byte 0x72204447
	.4byte 0x5465784D
	.4byte 0x616E3A3A
	.4byte 0x44656C65
	.4byte 0x74655465
	.4byte 0x78747572
	.4byte 0x653E8140
	.asciz "Invalid Handle\n"
	.asciz "Already Exist Texture [%s]\n"
	.asciz "Error DGTexMan::LoadTexture> Load Failed\n"
	.balign 4

lbl_80066C24:
	.asciz "Error DGTexMan::GetTexture> Invalid Handle\n"

lbl_80066C50:
	.asciz "Error DGTexMan::AttachTexture> Failed\n"
	.balign 4
	.asciz "Error DGTexMan::DetachTexture> Invalid Handle\n"
	.balign 4

.section .sdata, "wa"  # 0x800A8A80 - 0x800A8DC0 ; 0x00000340

lbl_800A8BB8:
	.asciz "tex/"
	.balign 4

lbl_800A8BC0:
	.asciz ".dtx"
	.balign 4

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0 ; 0x00000820

lbl_800A94F0:
	.4byte 0

lbl_800A94F4:
	.4byte 0xC0600000

lbl_800A94F8:
	.4byte 0x43300000
	.4byte 0