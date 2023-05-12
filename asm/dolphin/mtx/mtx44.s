.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn C_MTXFrustum, global
/* 80030020 0002BFA0  ED 24 18 28 */	fsubs f9, f4, f3
/* 80030024 0002BFA4  C1 42 84 E8 */	lfs f10, lbl_800A9868@sda21(r2)
/* 80030028 0002BFA8  EC 01 10 28 */	fsubs f0, f1, f2
/* 8003002C 0002BFAC  C1 02 84 EC */	lfs f8, lbl_800A986C@sda21(r2)
/* 80030030 0002BFB0  EC E6 28 28 */	fsubs f7, f6, f5
/* 80030034 0002BFB4  ED 6A 48 24 */	fdivs f11, f10, f9
/* 80030038 0002BFB8  ED 08 01 72 */	fmuls f8, f8, f5
/* 8003003C 0002BFBC  ED 2A 00 24 */	fdivs f9, f10, f0
/* 80030040 0002BFC0  EC 08 02 F2 */	fmuls f0, f8, f11
/* 80030044 0002BFC4  EC 64 18 2A */	fadds f3, f4, f3
/* 80030048 0002BFC8  EC 41 10 2A */	fadds f2, f1, f2
/* 8003004C 0002BFCC  D0 03 00 00 */	stfs f0, 0x0(r3)
/* 80030050 0002BFD0  EC 06 01 72 */	fmuls f0, f6, f5
/* 80030054 0002BFD4  EC CA 38 24 */	fdivs f6, f10, f7
/* 80030058 0002BFD8  C0 82 84 F0 */	lfs f4, lbl_800A9870@sda21(r2)
/* 8003005C 0002BFDC  D0 83 00 04 */	stfs f4, 0x4(r3)
/* 80030060 0002BFE0  EC 6B 00 F2 */	fmuls f3, f11, f3
/* 80030064 0002BFE4  FC 20 28 50 */	fneg f1, f5
/* 80030068 0002BFE8  FC 00 00 50 */	fneg f0, f0
/* 8003006C 0002BFEC  D0 63 00 08 */	stfs f3, 0x8(r3)
/* 80030070 0002BFF0  EC 68 02 72 */	fmuls f3, f8, f9
/* 80030074 0002BFF4  EC 49 00 B2 */	fmuls f2, f9, f2
/* 80030078 0002BFF8  D0 83 00 0C */	stfs f4, 0xc(r3)
/* 8003007C 0002BFFC  EC 21 01 B2 */	fmuls f1, f1, f6
/* 80030080 0002C000  D0 83 00 10 */	stfs f4, 0x10(r3)
/* 80030084 0002C004  EC 06 00 32 */	fmuls f0, f6, f0
/* 80030088 0002C008  D0 63 00 14 */	stfs f3, 0x14(r3)
/* 8003008C 0002C00C  D0 43 00 18 */	stfs f2, 0x18(r3)
/* 80030090 0002C010  D0 83 00 1C */	stfs f4, 0x1c(r3)
/* 80030094 0002C014  D0 83 00 20 */	stfs f4, 0x20(r3)
/* 80030098 0002C018  D0 83 00 24 */	stfs f4, 0x24(r3)
/* 8003009C 0002C01C  D0 23 00 28 */	stfs f1, 0x28(r3)
/* 800300A0 0002C020  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 800300A4 0002C024  D0 83 00 30 */	stfs f4, 0x30(r3)
/* 800300A8 0002C028  D0 83 00 34 */	stfs f4, 0x34(r3)
/* 800300AC 0002C02C  C0 02 84 F4 */	lfs f0, lbl_800A9874@sda21(r2)
/* 800300B0 0002C030  D0 03 00 38 */	stfs f0, 0x38(r3)
/* 800300B4 0002C034  D0 83 00 3C */	stfs f4, 0x3c(r3)
/* 800300B8 0002C038  4E 80 00 20 */	blr
.endfn C_MTXFrustum

.fn C_MTXOrtho, global
/* 800300BC 0002C03C  ED 04 18 28 */	fsubs f8, f4, f3
/* 800300C0 0002C040  C1 22 84 E8 */	lfs f9, lbl_800A9868@sda21(r2)
/* 800300C4 0002C044  EC 01 10 28 */	fsubs f0, f1, f2
/* 800300C8 0002C048  C0 E2 84 EC */	lfs f7, lbl_800A986C@sda21(r2)
/* 800300CC 0002C04C  EC 64 18 2A */	fadds f3, f4, f3
/* 800300D0 0002C050  ED 49 40 24 */	fdivs f10, f9, f8
/* 800300D4 0002C054  ED 09 00 24 */	fdivs f8, f9, f0
/* 800300D8 0002C058  EC 87 02 B2 */	fmuls f4, f7, f10
/* 800300DC 0002C05C  FC 60 18 50 */	fneg f3, f3
/* 800300E0 0002C060  EC 06 28 28 */	fsubs f0, f6, f5
/* 800300E4 0002C064  D0 83 00 00 */	stfs f4, 0x0(r3)
/* 800300E8 0002C068  EC 21 10 2A */	fadds f1, f1, f2
/* 800300EC 0002C06C  EC 4A 00 F2 */	fmuls f2, f10, f3
/* 800300F0 0002C070  C0 62 84 F0 */	lfs f3, lbl_800A9870@sda21(r2)
/* 800300F4 0002C074  FC 20 08 50 */	fneg f1, f1
/* 800300F8 0002C078  D0 63 00 04 */	stfs f3, 0x4(r3)
/* 800300FC 0002C07C  EC 89 00 24 */	fdivs f4, f9, f0
/* 80030100 0002C080  D0 63 00 08 */	stfs f3, 0x8(r3)
/* 80030104 0002C084  D0 43 00 0C */	stfs f2, 0xc(r3)
/* 80030108 0002C088  D0 63 00 10 */	stfs f3, 0x10(r3)
/* 8003010C 0002C08C  EC 47 02 32 */	fmuls f2, f7, f8
/* 80030110 0002C090  FC 00 30 50 */	fneg f0, f6
/* 80030114 0002C094  EC 28 00 72 */	fmuls f1, f8, f1
/* 80030118 0002C098  D0 43 00 14 */	stfs f2, 0x14(r3)
/* 8003011C 0002C09C  EC 00 01 32 */	fmuls f0, f0, f4
/* 80030120 0002C0A0  D0 63 00 18 */	stfs f3, 0x18(r3)
/* 80030124 0002C0A4  D0 23 00 1C */	stfs f1, 0x1c(r3)
/* 80030128 0002C0A8  D0 63 00 20 */	stfs f3, 0x20(r3)
/* 8003012C 0002C0AC  D0 63 00 24 */	stfs f3, 0x24(r3)
/* 80030130 0002C0B0  C0 22 84 F4 */	lfs f1, lbl_800A9874@sda21(r2)
/* 80030134 0002C0B4  EC 21 01 32 */	fmuls f1, f1, f4
/* 80030138 0002C0B8  D0 23 00 28 */	stfs f1, 0x28(r3)
/* 8003013C 0002C0BC  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 80030140 0002C0C0  D0 63 00 30 */	stfs f3, 0x30(r3)
/* 80030144 0002C0C4  D0 63 00 34 */	stfs f3, 0x34(r3)
/* 80030148 0002C0C8  D0 63 00 38 */	stfs f3, 0x38(r3)
/* 8003014C 0002C0CC  D1 23 00 3C */	stfs f9, 0x3c(r3)
/* 80030150 0002C0D0  4E 80 00 20 */	blr
.endfn C_MTXOrtho

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0

.balign 8

.obj lbl_800A9868, local
	.4byte 0x3F800000
.endobj lbl_800A9868

.obj lbl_800A986C, local
	.4byte 0x40000000
.endobj lbl_800A986C

.obj lbl_800A9870, local
	.4byte 0
.endobj lbl_800A9870

.obj lbl_800A9874, local
	.4byte 0xBF800000
.endobj lbl_800A9874
