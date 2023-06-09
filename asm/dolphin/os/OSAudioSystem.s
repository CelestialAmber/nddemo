.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn __OSInitAudioSystem, global
/* 80028C6C 00024BEC  7C 08 02 A6 */	mflr r0
/* 80028C70 00024BF0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80028C74 00024BF4  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80028C78 00024BF8  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 80028C7C 00024BFC  4B FF FF D1 */	bl OSGetArenaHi
/* 80028C80 00024C00  3C 80 81 00 */	lis r4, 0x8100
/* 80028C84 00024C04  38 A0 00 80 */	li r5, 0x80
/* 80028C88 00024C08  38 63 FF 80 */	addi r3, r3, -0x80
/* 80028C8C 00024C0C  4B FD C7 95 */	bl memcpy
/* 80028C90 00024C10  3C 60 80 06 */	lis r3, DSPInitCode@ha
/* 80028C94 00024C14  38 83 7A 48 */	addi r4, r3, DSPInitCode@l
/* 80028C98 00024C18  3C 60 81 00 */	lis r3, 0x8100
/* 80028C9C 00024C1C  38 A0 00 80 */	li r5, 0x80
/* 80028CA0 00024C20  4B FD C7 81 */	bl memcpy
/* 80028CA4 00024C24  3C 60 81 00 */	lis r3, 0x8100
/* 80028CA8 00024C28  38 80 00 80 */	li r4, 0x80
/* 80028CAC 00024C2C  48 00 02 99 */	bl DCFlushRange
/* 80028CB0 00024C30  3C 60 CC 00 */	lis r3, 0xCC005000@ha
/* 80028CB4 00024C34  38 63 50 00 */	addi r3, r3, 0xCC005000@l
/* 80028CB8 00024C38  38 00 00 43 */	li r0, 0x43
/* 80028CBC 00024C3C  B0 03 00 12 */	sth r0, 0x12(r3)
/* 80028CC0 00024C40  3B E3 00 0A */	addi r31, r3, 0xa
/* 80028CC4 00024C44  38 00 08 AC */	li r0, 0x8ac
/* 80028CC8 00024C48  B0 03 00 0A */	sth r0, 0xa(r3)
/* 80028CCC 00024C4C  A0 03 00 0A */	lhz r0, 0xa(r3)
/* 80028CD0 00024C50  60 00 00 01 */	ori r0, r0, 0x1
/* 80028CD4 00024C54  B0 03 00 0A */	sth r0, 0xa(r3)
.L_80028CD8:
/* 80028CD8 00024C58  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 80028CDC 00024C5C  54 00 07 FF */	clrlwi. r0, r0, 31
/* 80028CE0 00024C60  40 82 FF F8 */	bne .L_80028CD8
/* 80028CE4 00024C64  38 00 00 00 */	li r0, 0x0
/* 80028CE8 00024C68  3C 80 CC 00 */	lis r4, 0xCC005000@ha
/* 80028CEC 00024C6C  B0 04 50 00 */	sth r0, 0xCC005000@l(r4)
.L_80028CF0:
/* 80028CF0 00024C70  3B C4 50 00 */	addi r30, r4, 0x5000
/* 80028CF4 00024C74  A4 7E 00 04 */	lhzu r3, 0x4(r30)
/* 80028CF8 00024C78  3B A4 50 00 */	addi r29, r4, 0x5000
/* 80028CFC 00024C7C  A4 1D 00 06 */	lhzu r0, 0x6(r29)
/* 80028D00 00024C80  50 60 80 1E */	rlwimi r0, r3, 16, 0, 15
/* 80028D04 00024C84  54 00 00 01 */	clrrwi. r0, r0, 31
/* 80028D08 00024C88  40 82 FF E8 */	bne .L_80028CF0
/* 80028D0C 00024C8C  3C 60 CC 00 */	lis r3, 0xCC005000@ha
/* 80028D10 00024C90  3C 00 01 00 */	lis r0, 0x100
/* 80028D14 00024C94  3B 63 50 00 */	addi r27, r3, 0xCC005000@l
/* 80028D18 00024C98  94 1B 00 20 */	stwu r0, 0x20(r27)
/* 80028D1C 00024C9C  38 00 00 00 */	li r0, 0x0
/* 80028D20 00024CA0  3B 43 50 00 */	addi r26, r3, 0x5000
/* 80028D24 00024CA4  94 1A 00 24 */	stwu r0, 0x24(r26)
/* 80028D28 00024CA8  38 00 00 20 */	li r0, 0x20
/* 80028D2C 00024CAC  3B 23 50 00 */	addi r25, r3, 0x5000
/* 80028D30 00024CB0  94 19 00 28 */	stwu r0, 0x28(r25)
/* 80028D34 00024CB4  A0 7F 00 00 */	lhz r3, 0x0(r31)
/* 80028D38 00024CB8  48 00 00 08 */	b .L_80028D40
.L_80028D3C:
/* 80028D3C 00024CBC  A0 7F 00 00 */	lhz r3, 0x0(r31)
.L_80028D40:
/* 80028D40 00024CC0  54 60 06 B5 */	rlwinm. r0, r3, 0, 26, 26
/* 80028D44 00024CC4  41 82 FF F8 */	beq .L_80028D3C
/* 80028D48 00024CC8  B0 7F 00 00 */	sth r3, 0x0(r31)
/* 80028D4C 00024CCC  48 00 67 E9 */	bl OSGetTick
/* 80028D50 00024CD0  7C 7C 1B 78 */	mr r28, r3
.L_80028D54:
/* 80028D54 00024CD4  48 00 67 E1 */	bl OSGetTick
/* 80028D58 00024CD8  7C 1C 18 50 */	subf r0, r28, r3
/* 80028D5C 00024CDC  2C 00 08 92 */	cmpwi r0, 0x892
/* 80028D60 00024CE0  41 80 FF F4 */	blt .L_80028D54
/* 80028D64 00024CE4  3C 00 01 00 */	lis r0, 0x100
/* 80028D68 00024CE8  90 1B 00 00 */	stw r0, 0x0(r27)
/* 80028D6C 00024CEC  38 60 00 00 */	li r3, 0x0
/* 80028D70 00024CF0  38 00 00 20 */	li r0, 0x20
/* 80028D74 00024CF4  90 7A 00 00 */	stw r3, 0x0(r26)
/* 80028D78 00024CF8  90 19 00 00 */	stw r0, 0x0(r25)
/* 80028D7C 00024CFC  A0 7F 00 00 */	lhz r3, 0x0(r31)
/* 80028D80 00024D00  48 00 00 08 */	b .L_80028D88
.L_80028D84:
/* 80028D84 00024D04  A0 7F 00 00 */	lhz r3, 0x0(r31)
.L_80028D88:
/* 80028D88 00024D08  54 60 06 B5 */	rlwinm. r0, r3, 0, 26, 26
/* 80028D8C 00024D0C  41 82 FF F8 */	beq .L_80028D84
/* 80028D90 00024D10  B0 7F 00 00 */	sth r3, 0x0(r31)
/* 80028D94 00024D14  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 80028D98 00024D18  54 00 05 66 */	rlwinm r0, r0, 0, 21, 19
/* 80028D9C 00024D1C  B0 1F 00 00 */	sth r0, 0x0(r31)
.L_80028DA0:
/* 80028DA0 00024D20  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 80028DA4 00024D24  54 00 05 6B */	rlwinm. r0, r0, 0, 21, 21
/* 80028DA8 00024D28  40 82 FF F8 */	bne .L_80028DA0
/* 80028DAC 00024D2C  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 80028DB0 00024D30  54 00 07 B8 */	rlwinm r0, r0, 0, 30, 28
/* 80028DB4 00024D34  B0 1F 00 00 */	sth r0, 0x0(r31)
/* 80028DB8 00024D38  A0 1E 00 00 */	lhz r0, 0x0(r30)
/* 80028DBC 00024D3C  48 00 00 08 */	b .L_80028DC4
.L_80028DC0:
/* 80028DC0 00024D40  A0 1E 00 00 */	lhz r0, 0x0(r30)
.L_80028DC4:
/* 80028DC4 00024D44  54 05 04 3E */	clrlwi r5, r0, 16
/* 80028DC8 00024D48  54 00 04 21 */	rlwinm. r0, r0, 0, 16, 16
/* 80028DCC 00024D4C  41 82 FF F4 */	beq .L_80028DC0
/* 80028DD0 00024D50  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 80028DD4 00024D54  A0 9D 00 00 */	lhz r4, 0x0(r29)
/* 80028DD8 00024D58  60 00 00 04 */	ori r0, r0, 0x4
/* 80028DDC 00024D5C  B0 1F 00 00 */	sth r0, 0x0(r31)
/* 80028DE0 00024D60  38 00 08 AC */	li r0, 0x8ac
/* 80028DE4 00024D64  B0 1F 00 00 */	sth r0, 0x0(r31)
/* 80028DE8 00024D68  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 80028DEC 00024D6C  60 00 00 01 */	ori r0, r0, 0x1
/* 80028DF0 00024D70  B0 1F 00 00 */	sth r0, 0x0(r31)
.L_80028DF4:
/* 80028DF4 00024D74  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 80028DF8 00024D78  54 00 07 FF */	clrlwi. r0, r0, 31
/* 80028DFC 00024D7C  40 82 FF F8 */	bne .L_80028DF4
/* 80028E00 00024D80  4B FF FE 4D */	bl OSGetArenaHi
/* 80028E04 00024D84  38 83 FF 80 */	addi r4, r3, -0x80
/* 80028E08 00024D88  3C 60 81 00 */	lis r3, 0x8100
/* 80028E0C 00024D8C  38 A0 00 80 */	li r5, 0x80
/* 80028E10 00024D90  4B FD C6 11 */	bl memcpy
/* 80028E14 00024D94  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 80028E18 00024D98  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80028E1C 00024D9C  38 21 00 30 */	addi r1, r1, 0x30
/* 80028E20 00024DA0  7C 08 03 A6 */	mtlr r0
/* 80028E24 00024DA4  4E 80 00 20 */	blr
.endfn __OSInitAudioSystem

.fn __OSStopAudioSystem, global
/* 80028E28 00024DA8  7C 08 02 A6 */	mflr r0
/* 80028E2C 00024DAC  3C 60 CC 00 */	lis r3, 0xCC005000@ha
/* 80028E30 00024DB0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80028E34 00024DB4  38 00 08 04 */	li r0, 0x804
/* 80028E38 00024DB8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80028E3C 00024DBC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80028E40 00024DC0  3B E3 50 00 */	addi r31, r3, 0xCC005000@l
/* 80028E44 00024DC4  38 63 50 00 */	addi r3, r3, 0x5000
/* 80028E48 00024DC8  93 C1 00 08 */	stw r30, 0x8(r1)
/* 80028E4C 00024DCC  B0 1F 00 0A */	sth r0, 0xa(r31)
/* 80028E50 00024DD0  A0 03 00 36 */	lhz r0, 0x36(r3)
/* 80028E54 00024DD4  54 00 04 5E */	rlwinm r0, r0, 0, 17, 15
/* 80028E58 00024DD8  B0 03 00 36 */	sth r0, 0x36(r3)
/* 80028E5C 00024DDC  A4 1F 00 0A */	lhzu r0, 0xa(r31)
/* 80028E60 00024DE0  48 00 00 08 */	b .L_80028E68
.L_80028E64:
/* 80028E64 00024DE4  A0 1F 00 00 */	lhz r0, 0x0(r31)
.L_80028E68:
/* 80028E68 00024DE8  54 00 05 6B */	rlwinm. r0, r0, 0, 21, 21
/* 80028E6C 00024DEC  40 82 FF F8 */	bne .L_80028E64
/* 80028E70 00024DF0  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 80028E74 00024DF4  48 00 00 08 */	b .L_80028E7C
.L_80028E78:
/* 80028E78 00024DF8  A0 1F 00 00 */	lhz r0, 0x0(r31)
.L_80028E7C:
/* 80028E7C 00024DFC  54 00 05 AD */	rlwinm. r0, r0, 0, 22, 22
/* 80028E80 00024E00  40 82 FF F8 */	bne .L_80028E78
/* 80028E84 00024E04  38 00 08 AC */	li r0, 0x8ac
/* 80028E88 00024E08  3C 60 CC 00 */	lis r3, 0xCC005000@ha
/* 80028E8C 00024E0C  B0 1F 00 00 */	sth r0, 0x0(r31)
/* 80028E90 00024E10  38 00 00 00 */	li r0, 0x0
/* 80028E94 00024E14  B0 03 50 00 */	sth r0, 0xCC005000@l(r3)
/* 80028E98 00024E18  38 83 50 00 */	addi r4, r3, 0x5000
.L_80028E9C:
/* 80028E9C 00024E1C  A0 64 00 04 */	lhz r3, 0x4(r4)
/* 80028EA0 00024E20  A0 04 00 06 */	lhz r0, 0x6(r4)
/* 80028EA4 00024E24  50 60 80 1E */	rlwimi r0, r3, 16, 0, 15
/* 80028EA8 00024E28  54 00 00 01 */	clrrwi. r0, r0, 31
/* 80028EAC 00024E2C  40 82 FF F0 */	bne .L_80028E9C
/* 80028EB0 00024E30  48 00 66 85 */	bl OSGetTick
/* 80028EB4 00024E34  7C 7E 1B 78 */	mr r30, r3
.L_80028EB8:
/* 80028EB8 00024E38  48 00 66 7D */	bl OSGetTick
/* 80028EBC 00024E3C  7C 1E 18 50 */	subf r0, r30, r3
/* 80028EC0 00024E40  2C 00 00 2C */	cmpwi r0, 0x2c
/* 80028EC4 00024E44  41 80 FF F4 */	blt .L_80028EB8
/* 80028EC8 00024E48  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 80028ECC 00024E4C  60 00 00 01 */	ori r0, r0, 0x1
/* 80028ED0 00024E50  B0 1F 00 00 */	sth r0, 0x0(r31)
/* 80028ED4 00024E54  A0 1F 00 00 */	lhz r0, 0x0(r31)
/* 80028ED8 00024E58  48 00 00 08 */	b .L_80028EE0
.L_80028EDC:
/* 80028EDC 00024E5C  A0 1F 00 00 */	lhz r0, 0x0(r31)
.L_80028EE0:
/* 80028EE0 00024E60  54 00 07 FF */	clrlwi. r0, r0, 31
/* 80028EE4 00024E64  40 82 FF F8 */	bne .L_80028EDC
/* 80028EE8 00024E68  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80028EEC 00024E6C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80028EF0 00024E70  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 80028EF4 00024E74  7C 08 03 A6 */	mtlr r0
/* 80028EF8 00024E78  38 21 00 10 */	addi r1, r1, 0x10
/* 80028EFC 00024E7C  4E 80 00 20 */	blr
.endfn __OSStopAudioSystem

.section .data, "wa"  # 0x80065000 - 0x8006D1C0

.balign 8


.obj DSPInitCode, local
	.4byte 0x029F0010
	.4byte 0x029F0035
	.4byte 0x029F0036
	.4byte 0x029F0037
	.4byte 0x029F0038
	.4byte 0x029F0039
	.4byte 0x029F003A
	.4byte 0x029F003B
	.4byte 0x12061203
	.4byte 0x12041205
	.4byte 0x8E000092
	.4byte 0x00FF0080
	.4byte 0x80000088
	.4byte 0xFFFF0084
	.4byte 0x10000064
	.4byte 0x00200218
	.4byte 0x00000080
	.4byte 0x10000088
	.4byte 0xFFFF0084
	.4byte 0x08000064
	.4byte 0x002A191E
	.4byte 0x000026FC
	.4byte 0x02A08000
	.4byte 0x029C002B
	.4byte 0x16FC0054
	.4byte 0x16FD4348
	.4byte 0x002102FF
	.4byte 0x02FF02FF
	.4byte 0x02FF02FF
	.4byte 0x02FF02FF
	.4byte 0
	.4byte 0
.endobj DSPInitCode
