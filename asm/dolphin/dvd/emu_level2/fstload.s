.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn cb, local
/* 80033EFC 0002FE7C  7C 08 02 A6 */	mflr r0
/* 80033F00 0002FE80  2C 03 00 00 */	cmpwi r3, 0x0
/* 80033F04 0002FE84  90 01 00 04 */	stw r0, 0x4(r1)
/* 80033F08 0002FE88  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80033F0C 0002FE8C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80033F10 0002FE90  3B E4 00 00 */	addi r31, r4, 0x0
/* 80033F14 0002FE94  40 81 00 7C */	ble .L_80033F90
/* 80033F18 0002FE98  80 0D 85 A8 */	lwz r0, status@sda21(r13)
/* 80033F1C 0002FE9C  2C 00 00 01 */	cmpwi r0, 0x1
/* 80033F20 0002FEA0  41 82 00 3C */	beq .L_80033F5C
/* 80033F24 0002FEA4  40 80 00 9C */	bge .L_80033FC0
/* 80033F28 0002FEA8  2C 00 00 00 */	cmpwi r0, 0x0
/* 80033F2C 0002FEAC  40 80 00 08 */	bge .L_80033F34
/* 80033F30 0002FEB0  48 00 00 90 */	b .L_80033FC0
.L_80033F34:
/* 80033F34 0002FEB4  38 00 00 01 */	li r0, 0x1
/* 80033F38 0002FEB8  80 8D 85 AC */	lwz r4, bb2@sda21(r13)
/* 80033F3C 0002FEBC  3C 60 80 03 */	lis r3, cb@ha
/* 80033F40 0002FEC0  90 0D 85 A8 */	stw r0, status@sda21(r13)
/* 80033F44 0002FEC4  38 E3 3E FC */	addi r7, r3, cb@l
/* 80033F48 0002FEC8  38 7F 00 00 */	addi r3, r31, 0x0
/* 80033F4C 0002FECC  38 A0 00 20 */	li r5, 0x20
/* 80033F50 0002FED0  38 C0 04 20 */	li r6, 0x420
/* 80033F54 0002FED4  4B FF F4 6D */	bl DVDReadAbsAsyncForBS
/* 80033F58 0002FED8  48 00 00 68 */	b .L_80033FC0
.L_80033F5C:
/* 80033F5C 0002FEDC  38 00 00 02 */	li r0, 0x2
/* 80033F60 0002FEE0  80 CD 85 AC */	lwz r6, bb2@sda21(r13)
/* 80033F64 0002FEE4  90 0D 85 A8 */	stw r0, status@sda21(r13)
/* 80033F68 0002FEE8  3C 60 80 03 */	lis r3, cb@ha
/* 80033F6C 0002FEEC  38 E3 3E FC */	addi r7, r3, cb@l
/* 80033F70 0002FEF0  80 A6 00 08 */	lwz r5, 0x8(r6)
/* 80033F74 0002FEF4  7F E3 FB 78 */	mr r3, r31
/* 80033F78 0002FEF8  80 86 00 10 */	lwz r4, 0x10(r6)
/* 80033F7C 0002FEFC  38 05 00 1F */	addi r0, r5, 0x1f
/* 80033F80 0002FF00  80 C6 00 04 */	lwz r6, 0x4(r6)
/* 80033F84 0002FF04  54 05 00 34 */	clrrwi r5, r0, 5
/* 80033F88 0002FF08  4B FF F4 39 */	bl DVDReadAbsAsyncForBS
/* 80033F8C 0002FF0C  48 00 00 34 */	b .L_80033FC0
.L_80033F90:
/* 80033F90 0002FF10  2C 03 FF FF */	cmpwi r3, -0x1
/* 80033F94 0002FF14  41 82 00 2C */	beq .L_80033FC0
/* 80033F98 0002FF18  2C 03 FF FC */	cmpwi r3, -0x4
/* 80033F9C 0002FF1C  40 82 00 24 */	bne .L_80033FC0
/* 80033FA0 0002FF20  38 00 00 00 */	li r0, 0x0
/* 80033FA4 0002FF24  90 0D 85 A8 */	stw r0, status@sda21(r13)
/* 80033FA8 0002FF28  4B FF F5 BD */	bl DVDReset
/* 80033FAC 0002FF2C  3C 60 80 03 */	lis r3, cb@ha
/* 80033FB0 0002FF30  80 8D 85 B0 */	lwz r4, idTmp@sda21(r13)
/* 80033FB4 0002FF34  38 A3 3E FC */	addi r5, r3, cb@l
/* 80033FB8 0002FF38  38 7F 00 00 */	addi r3, r31, 0x0
/* 80033FBC 0002FF3C  4B FF F4 D5 */	bl DVDReadDiskID
.L_80033FC0:
/* 80033FC0 0002FF40  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80033FC4 0002FF44  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80033FC8 0002FF48  38 21 00 18 */	addi r1, r1, 0x18
/* 80033FCC 0002FF4C  7C 08 03 A6 */	mtlr r0
/* 80033FD0 0002FF50  4E 80 00 20 */	blr
.endfn cb

.fn __fstLoad, global
/* 80033FD4 0002FF54  7C 08 02 A6 */	mflr r0
/* 80033FD8 0002FF58  3C 60 80 07 */	lis r3, lbl_800684A0@ha
/* 80033FDC 0002FF5C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80033FE0 0002FF60  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 80033FE4 0002FF64  93 E1 00 5C */	stw r31, 0x5c(r1)
/* 80033FE8 0002FF68  3B E3 84 A0 */	addi r31, r3, lbl_800684A0@l
/* 80033FEC 0002FF6C  93 C1 00 58 */	stw r30, 0x58(r1)
/* 80033FF0 0002FF70  93 A1 00 54 */	stw r29, 0x54(r1)
/* 80033FF4 0002FF74  4B FF 4C 59 */	bl OSGetArenaHi
/* 80033FF8 0002FF78  3C 60 80 08 */	lis r3, bb2Buf@ha
/* 80033FFC 0002FF7C  38 63 0E D8 */	addi r3, r3, bb2Buf@l
/* 80034000 0002FF80  38 81 00 2B */	addi r4, r1, 0x2b
/* 80034004 0002FF84  38 03 00 1F */	addi r0, r3, 0x1f
/* 80034008 0002FF88  54 83 00 34 */	clrrwi r3, r4, 5
/* 8003400C 0002FF8C  54 00 00 34 */	clrrwi r0, r0, 5
/* 80034010 0002FF90  90 6D 85 B0 */	stw r3, idTmp@sda21(r13)
/* 80034014 0002FF94  90 0D 85 AC */	stw r0, bb2@sda21(r13)
/* 80034018 0002FF98  4B FF F5 4D */	bl DVDReset
/* 8003401C 0002FF9C  3C 60 80 08 */	lis r3, "block$16"@ha
/* 80034020 0002FFA0  80 8D 85 B0 */	lwz r4, idTmp@sda21(r13)
/* 80034024 0002FFA4  3C A0 80 03 */	lis r5, cb@ha
/* 80034028 0002FFA8  38 63 0F 18 */	addi r3, r3, "block$16"@l
/* 8003402C 0002FFAC  38 A5 3E FC */	addi r5, r5, cb@l
/* 80034030 0002FFB0  4B FF F4 61 */	bl DVDReadDiskID
.L_80034034:
/* 80034034 0002FFB4  4B FF F5 75 */	bl DVDGetDriveStatus
/* 80034038 0002FFB8  2C 03 00 00 */	cmpwi r3, 0x0
/* 8003403C 0002FFBC  40 82 FF F8 */	bne .L_80034034
/* 80034040 0002FFC0  80 6D 85 AC */	lwz r3, bb2@sda21(r13)
/* 80034044 0002FFC4  3F A0 80 00 */	lis r29, 0x80000000@ha
/* 80034048 0002FFC8  3F C0 80 00 */	lis r30, 0x80000038@ha
/* 8003404C 0002FFCC  80 03 00 10 */	lwz r0, 0x10(r3)
/* 80034050 0002FFD0  38 7D 00 00 */	addi r3, r29, 0x80000000@l
/* 80034054 0002FFD4  38 A0 00 20 */	li r5, 0x20
/* 80034058 0002FFD8  90 1E 00 38 */	stw r0, 0x80000038@l(r30)
/* 8003405C 0002FFDC  80 8D 85 AC */	lwz r4, bb2@sda21(r13)
/* 80034060 0002FFE0  80 04 00 0C */	lwz r0, 0xc(r4)
/* 80034064 0002FFE4  90 1E 00 3C */	stw r0, 0x3c(r30)
/* 80034068 0002FFE8  80 8D 85 B0 */	lwz r4, idTmp@sda21(r13)
/* 8003406C 0002FFEC  4B FD 13 B5 */	bl memcpy
/* 80034070 0002FFF0  38 6D 82 50 */	addi r3, r13, lbl_800A8CD0@sda21
/* 80034074 0002FFF4  4C C6 31 82 */	crclr 4*cr1+eq
/* 80034078 0002FFF8  4B FF 5B 6D */	bl OSReport
/* 8003407C 0002FFFC  88 9D 00 00 */	lbz r4, 0x0(r29)
/* 80034080 00030000  7F E3 FB 78 */	mr r3, r31
/* 80034084 00030004  88 BD 00 01 */	lbz r5, 0x1(r29)
/* 80034088 00030008  4C C6 31 82 */	crclr 4*cr1+eq
/* 8003408C 0003000C  88 DD 00 02 */	lbz r6, 0x2(r29)
/* 80034090 00030010  88 FD 00 03 */	lbz r7, 0x3(r29)
/* 80034094 00030014  7C 84 07 74 */	extsb r4, r4
/* 80034098 00030018  7C A5 07 74 */	extsb r5, r5
/* 8003409C 0003001C  7C C6 07 74 */	extsb r6, r6
/* 800340A0 00030020  7C E7 07 74 */	extsb r7, r7
/* 800340A4 00030024  4B FF 5B 41 */	bl OSReport
/* 800340A8 00030028  88 9D 00 04 */	lbz r4, 0x4(r29)
/* 800340AC 0003002C  38 7F 00 1C */	addi r3, r31, 0x1c
/* 800340B0 00030030  88 BD 00 05 */	lbz r5, 0x5(r29)
/* 800340B4 00030034  4C C6 31 82 */	crclr 4*cr1+eq
/* 800340B8 00030038  7C 84 07 74 */	extsb r4, r4
/* 800340BC 0003003C  7C A5 07 74 */	extsb r5, r5
/* 800340C0 00030040  4B FF 5B 25 */	bl OSReport
/* 800340C4 00030044  88 9D 00 06 */	lbz r4, 0x6(r29)
/* 800340C8 00030048  38 7F 00 34 */	addi r3, r31, 0x34
/* 800340CC 0003004C  4C C6 31 82 */	crclr 4*cr1+eq
/* 800340D0 00030050  4B FF 5B 15 */	bl OSReport
/* 800340D4 00030054  88 9D 00 07 */	lbz r4, 0x7(r29)
/* 800340D8 00030058  38 7F 00 48 */	addi r3, r31, 0x48
/* 800340DC 0003005C  4C C6 31 82 */	crclr 4*cr1+eq
/* 800340E0 00030060  4B FF 5B 05 */	bl OSReport
/* 800340E4 00030064  88 1E 00 08 */	lbz r0, 0x8(r30)
/* 800340E8 00030068  28 00 00 00 */	cmplwi r0, 0x0
/* 800340EC 0003006C  40 82 00 0C */	bne .L_800340F8
/* 800340F0 00030070  38 8D 82 54 */	addi r4, r13, lbl_800A8CD4@sda21
/* 800340F4 00030074  48 00 00 08 */	b .L_800340FC
.L_800340F8:
/* 800340F8 00030078  38 8D 82 58 */	addi r4, r13, lbl_800A8CD8@sda21
.L_800340FC:
/* 800340FC 0003007C  4C C6 31 82 */	crclr 4*cr1+eq
/* 80034100 00030080  38 7F 00 5C */	addi r3, r31, 0x5c
/* 80034104 00030084  4B FF 5A E1 */	bl OSReport
/* 80034108 00030088  38 6D 82 50 */	addi r3, r13, lbl_800A8CD0@sda21
/* 8003410C 0003008C  4C C6 31 82 */	crclr 4*cr1+eq
/* 80034110 00030090  4B FF 5A D5 */	bl OSReport
/* 80034114 00030094  80 6D 85 AC */	lwz r3, bb2@sda21(r13)
/* 80034118 00030098  80 63 00 10 */	lwz r3, 0x10(r3)
/* 8003411C 0003009C  4B FF 4B 41 */	bl OSSetArenaHi
/* 80034120 000300A0  80 01 00 64 */	lwz r0, 0x64(r1)
/* 80034124 000300A4  83 E1 00 5C */	lwz r31, 0x5c(r1)
/* 80034128 000300A8  83 C1 00 58 */	lwz r30, 0x58(r1)
/* 8003412C 000300AC  7C 08 03 A6 */	mtlr r0
/* 80034130 000300B0  83 A1 00 54 */	lwz r29, 0x54(r1)
/* 80034134 000300B4  38 21 00 60 */	addi r1, r1, 0x60
/* 80034138 000300B8  4E 80 00 20 */	blr
.endfn __fstLoad

.section .data, "wa"  # 0x80065000 - 0x8006D1C0

.balign 8

.obj lbl_800684A0, local
	.asciz "  Game Name ... %c%c%c%c\n"
	.balign 4
	.asciz "  Company ..... %c%c\n"
	.balign 4
	.asciz "  Disk # ...... %d\n"
	.asciz "  Game ver .... %d\n"
	.asciz "  Streaming ... %s\n"
.endobj lbl_800684A0

.section .sdata, "wa"  # 0x800A8A80 - 0x800A8DC0

.balign 8

.obj lbl_800A8CD0, local
	.4byte 0x0A000000
.endobj lbl_800A8CD0

.obj lbl_800A8CD4, local
	.4byte 0x4F464600
.endobj lbl_800A8CD4

.obj lbl_800A8CD8, local
	.4byte 0x4F4E0000
	.4byte 0
.endobj lbl_800A8CD8

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80

.balign 8

.obj bb2Buf, local
	.skip 0x40
.endobj bb2Buf

.obj "block$16", local
	.skip 0x30
.endobj "block$16"

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380

.balign 8

.obj status, local
	.skip 0x4
.endobj status

.obj bb2, local
	.skip 0x4
.endobj bb2

.obj idTmp, local
	.skip 0x8
.endobj idTmp
