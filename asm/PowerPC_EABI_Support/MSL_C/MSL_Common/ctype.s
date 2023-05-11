.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn tolower, global
/* 8005FF90 0005BF10  2C 03 FF FF */	cmpwi r3, -0x1
/* 8005FF94 0005BF14  40 82 00 0C */	bne .L_8005FFA0
/* 8005FF98 0005BF18  38 60 FF FF */	li r3, -0x1
/* 8005FF9C 0005BF1C  4E 80 00 20 */	blr
.L_8005FFA0:
/* 8005FFA0 0005BF20  3C 80 80 06 */	lis r4, __lower_map@ha
/* 8005FFA4 0005BF24  54 63 06 3E */	clrlwi r3, r3, 24
/* 8005FFA8 0005BF28  38 04 49 90 */	addi r0, r4, __lower_map@l
/* 8005FFAC 0005BF2C  7C 60 1A 14 */	add r3, r0, r3
/* 8005FFB0 0005BF30  88 63 00 00 */	lbz r3, 0x0(r3)
/* 8005FFB4 0005BF34  4E 80 00 20 */	blr
.endfn tolower

.section .rodata, "wa"  # 0x80063D20 - 0x80065000


.obj __ctype_map, global
	.4byte 0x01010101
	.4byte 0x01010101
	.4byte 0x01020202
	.4byte 0x02020101
	.4byte 0x01010101
	.4byte 0x01010101
	.4byte 0x01010101
	.4byte 0x01010101
	.4byte 0x04080808
	.4byte 0x08080808
	.4byte 0x08080808
	.4byte 0x08080808
	.4byte 0x30303030
	.4byte 0x30303030
	.4byte 0x30300808
	.4byte 0x08080808
	.4byte 0x08A0A0A0
	.4byte 0xA0A0A080
	.4byte 0x80808080
	.4byte 0x80808080
	.4byte 0x80808080
	.4byte 0x80808080
	.4byte 0x80808008
	.4byte 0x08080808
	.4byte 0x08606060
	.4byte 0x60606040
	.4byte 0x40404040
	.4byte 0x40404040
	.4byte 0x40404040
	.4byte 0x40404040
	.4byte 0x40404008
	.4byte 0x08080801
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
.endobj __ctype_map

.obj __lower_map, global
	.4byte 0x00010203
	.4byte 0x04050607
	.4byte 0x08090A0B
	.4byte 0x0C0D0E0F
	.4byte 0x10111213
	.4byte 0x14151617
	.4byte 0x18191A1B
	.4byte 0x1C1D1E1F
	.4byte 0x20212223
	.4byte 0x24252627
	.4byte 0x28292A2B
	.4byte 0x2C2D2E2F
	.4byte 0x30313233
	.4byte 0x34353637
	.4byte 0x38393A3B
	.4byte 0x3C3D3E3F
	.4byte 0x40616263
	.4byte 0x64656667
	.4byte 0x68696A6B
	.4byte 0x6C6D6E6F
	.4byte 0x70717273
	.4byte 0x74757677
	.4byte 0x78797A5B
	.4byte 0x5C5D5E5F
	.4byte 0x60616263
	.4byte 0x64656667
	.4byte 0x68696A6B
	.4byte 0x6C6D6E6F
	.4byte 0x70717273
	.4byte 0x74757677
	.4byte 0x78797A7B
	.4byte 0x7C7D7E7F
	.4byte 0x80818283
	.4byte 0x84858687
	.4byte 0x88898A8B
	.4byte 0x8C8D8E8F
	.4byte 0x90919293
	.4byte 0x94959697
	.4byte 0x98999A9B
	.4byte 0x9C9D9E9F
	.4byte 0xA0A1A2A3
	.4byte 0xA4A5A6A7
	.4byte 0xA8A9AAAB
	.4byte 0xACADAEAF
	.4byte 0xB0B1B2B3
	.4byte 0xB4B5B6B7
	.4byte 0xB8B9BABB
	.4byte 0xBCBDBEBF
	.4byte 0xC0C1C2C3
	.4byte 0xC4C5C6C7
	.4byte 0xC8C9CACB
	.4byte 0xCCCDCECF
	.4byte 0xD0D1D2D3
	.4byte 0xD4D5D6D7
	.4byte 0xD8D9DADB
	.4byte 0xDCDDDEDF
	.4byte 0xE0E1E2E3
	.4byte 0xE4E5E6E7
	.4byte 0xE8E9EAEB
	.4byte 0xECEDEEEF
	.4byte 0xF0F1F2F3
	.4byte 0xF4F5F6F7
	.4byte 0xF8F9FAFB
	.4byte 0xFCFDFEFF
.endobj __lower_map
