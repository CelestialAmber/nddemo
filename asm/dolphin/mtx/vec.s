.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn PSVECAdd, global
/* 80030154 0002C0D4  E0 43 00 00 */	psq_l f2, 0x0(r3), 0, qr0
/* 80030158 0002C0D8  E0 84 00 00 */	psq_l f4, 0x0(r4), 0, qr0
/* 8003015C 0002C0DC  10 C2 20 2A */	ps_add f6, f2, f4
/* 80030160 0002C0E0  F0 C5 00 00 */	psq_st f6, 0x0(r5), 0, qr0
/* 80030164 0002C0E4  E0 63 80 08 */	psq_l f3, 0x8(r3), 1, qr0
/* 80030168 0002C0E8  E0 A4 80 08 */	psq_l f5, 0x8(r4), 1, qr0
/* 8003016C 0002C0EC  10 E3 28 2A */	ps_add f7, f3, f5
/* 80030170 0002C0F0  F0 E5 80 08 */	psq_st f7, 0x8(r5), 1, qr0
/* 80030174 0002C0F4  4E 80 00 20 */	blr
.endfn PSVECAdd

.fn PSVECSubtract, global
/* 80030178 0002C0F8  E0 43 00 00 */	psq_l f2, 0x0(r3), 0, qr0
/* 8003017C 0002C0FC  E0 84 00 00 */	psq_l f4, 0x0(r4), 0, qr0
/* 80030180 0002C100  10 C2 20 28 */	ps_sub f6, f2, f4
/* 80030184 0002C104  F0 C5 00 00 */	psq_st f6, 0x0(r5), 0, qr0
/* 80030188 0002C108  E0 63 80 08 */	psq_l f3, 0x8(r3), 1, qr0
/* 8003018C 0002C10C  E0 A4 80 08 */	psq_l f5, 0x8(r4), 1, qr0
/* 80030190 0002C110  10 E3 28 28 */	ps_sub f7, f3, f5
/* 80030194 0002C114  F0 E5 80 08 */	psq_st f7, 0x8(r5), 1, qr0
/* 80030198 0002C118  4E 80 00 20 */	blr
.endfn PSVECSubtract

.fn PSVECNormalize, global
/* 8003019C 0002C11C  C0 02 84 F8 */	lfs f0, lbl_800A9878@sda21(r2)
/* 800301A0 0002C120  C0 22 84 FC */	lfs f1, lbl_800A987C@sda21(r2)
/* 800301A4 0002C124  E0 43 00 00 */	psq_l f2, 0x0(r3), 0, qr0
/* 800301A8 0002C128  10 A2 00 B2 */	ps_mul f5, f2, f2
/* 800301AC 0002C12C  E0 63 80 08 */	psq_l f3, 0x8(r3), 1, qr0
/* 800301B0 0002C130  10 83 28 FA */	ps_madd f4, f3, f3, f5
/* 800301B4 0002C134  10 84 28 D4 */	ps_sum0 f4, f4, f3, f5
/* 800301B8 0002C138  10 A0 20 34 */	ps_rsqrte f5, f4
/* 800301BC 0002C13C  EC C5 01 72 */	fmuls f6, f5, f5
/* 800301C0 0002C140  EC 05 00 32 */	fmuls f0, f5, f0
/* 800301C4 0002C144  EC C6 09 3C */	fnmsubs f6, f6, f4, f1
/* 800301C8 0002C148  EC A6 00 32 */	fmuls f5, f6, f0
/* 800301CC 0002C14C  10 42 01 58 */	ps_muls0 f2, f2, f5
/* 800301D0 0002C150  F0 44 00 00 */	psq_st f2, 0x0(r4), 0, qr0
/* 800301D4 0002C154  10 63 01 58 */	ps_muls0 f3, f3, f5
/* 800301D8 0002C158  F0 64 80 08 */	psq_st f3, 0x8(r4), 1, qr0
/* 800301DC 0002C15C  4E 80 00 20 */	blr
.endfn PSVECNormalize

.fn PSVECMag, global
/* 800301E0 0002C160  E0 03 00 00 */	psq_l f0, 0x0(r3), 0, qr0
/* 800301E4 0002C164  10 00 00 32 */	ps_mul f0, f0, f0
/* 800301E8 0002C168  C0 23 00 08 */	lfs f1, 0x8(r3)
/* 800301EC 0002C16C  10 21 00 7A */	ps_madd f1, f1, f1, f0
/* 800301F0 0002C170  C0 82 84 F8 */	lfs f4, lbl_800A9878@sda21(r2)
/* 800301F4 0002C174  10 21 00 14 */	ps_sum0 f1, f1, f0, f0
/* 800301F8 0002C178  10 00 08 34 */	ps_rsqrte f0, f1
/* 800301FC 0002C17C  C0 62 84 FC */	lfs f3, lbl_800A987C@sda21(r2)
/* 80030200 0002C180  EC 40 00 32 */	fmuls f2, f0, f0
/* 80030204 0002C184  EC 00 01 32 */	fmuls f0, f0, f4
/* 80030208 0002C188  EC 42 18 7C */	fnmsubs f2, f2, f1, f3
/* 8003020C 0002C18C  EC 02 00 32 */	fmuls f0, f2, f0
/* 80030210 0002C190  FC 00 08 2E */	fsel f0, f0, f0, f1
/* 80030214 0002C194  EC 21 00 32 */	fmuls f1, f1, f0
/* 80030218 0002C198  4E 80 00 20 */	blr
.endfn PSVECMag

.fn PSVECDotProduct, global
/* 8003021C 0002C19C  E0 43 00 04 */	psq_l f2, 0x4(r3), 0, qr0
/* 80030220 0002C1A0  E0 64 00 04 */	psq_l f3, 0x4(r4), 0, qr0
/* 80030224 0002C1A4  10 42 00 F2 */	ps_mul f2, f2, f3
/* 80030228 0002C1A8  E0 A3 00 00 */	psq_l f5, 0x0(r3), 0, qr0
/* 8003022C 0002C1AC  E0 84 00 00 */	psq_l f4, 0x0(r4), 0, qr0
/* 80030230 0002C1B0  10 65 11 3A */	ps_madd f3, f5, f4, f2
/* 80030234 0002C1B4  10 23 10 94 */	ps_sum0 f1, f3, f2, f2
/* 80030238 0002C1B8  4E 80 00 20 */	blr
.endfn PSVECDotProduct

.fn PSVECCrossProduct, global
/* 8003023C 0002C1BC  E0 24 00 00 */	psq_l f1, 0x0(r4), 0, qr0
/* 80030240 0002C1C0  C0 43 00 08 */	lfs f2, 0x8(r3)
/* 80030244 0002C1C4  E0 03 00 00 */	psq_l f0, 0x0(r3), 0, qr0
/* 80030248 0002C1C8  10 C1 0C A0 */	ps_merge10 f6, f1, f1
/* 8003024C 0002C1CC  C0 64 00 08 */	lfs f3, 0x8(r4)
/* 80030250 0002C1D0  10 81 00 B2 */	ps_mul f4, f1, f2
/* 80030254 0002C1D4  10 E1 00 18 */	ps_muls0 f7, f1, f0
/* 80030258 0002C1D8  10 A0 20 F8 */	ps_msub f5, f0, f3, f4
/* 8003025C 0002C1DC  11 00 39 B8 */	ps_msub f8, f0, f6, f7
/* 80030260 0002C1E0  11 25 2C E0 */	ps_merge11 f9, f5, f5
/* 80030264 0002C1E4  11 45 44 60 */	ps_merge01 f10, f5, f8
/* 80030268 0002C1E8  F1 25 80 00 */	psq_st f9, 0x0(r5), 1, qr0
/* 8003026C 0002C1EC  11 40 50 50 */	ps_neg f10, f10
/* 80030270 0002C1F0  F1 45 00 04 */	psq_st f10, 0x4(r5), 0, qr0
/* 80030274 0002C1F4  4E 80 00 20 */	blr
.endfn PSVECCrossProduct

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0

.obj lbl_800A9878, local
	.4byte 0x3F000000
.endobj lbl_800A9878

.obj lbl_800A987C, local
	.4byte 0x40400000
.endobj lbl_800A987C
