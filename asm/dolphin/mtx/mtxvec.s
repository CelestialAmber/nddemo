.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn PSMTXMultVec, global
/* 8002FF78 0002BEF8  E0 04 00 00 */	psq_l f0, 0x0(r4), 0, qr0
/* 8002FF7C 0002BEFC  E0 43 00 00 */	psq_l f2, 0x0(r3), 0, qr0
/* 8002FF80 0002BF00  E0 24 80 08 */	psq_l f1, 0x8(r4), 1, qr0
/* 8002FF84 0002BF04  10 82 00 32 */	ps_mul f4, f2, f0
/* 8002FF88 0002BF08  E0 63 00 08 */	psq_l f3, 0x8(r3), 0, qr0
/* 8002FF8C 0002BF0C  10 A3 20 7A */	ps_madd f5, f3, f1, f4
/* 8002FF90 0002BF10  E1 03 00 10 */	psq_l f8, 0x10(r3), 0, qr0
/* 8002FF94 0002BF14  10 C5 29 94 */	ps_sum0 f6, f5, f6, f5
/* 8002FF98 0002BF18  E1 23 00 18 */	psq_l f9, 0x18(r3), 0, qr0
/* 8002FF9C 0002BF1C  11 48 00 32 */	ps_mul f10, f8, f0
/* 8002FFA0 0002BF20  F0 C5 80 00 */	psq_st f6, 0x0(r5), 1, qr0
/* 8002FFA4 0002BF24  11 69 50 7A */	ps_madd f11, f9, f1, f10
/* 8002FFA8 0002BF28  E0 43 00 20 */	psq_l f2, 0x20(r3), 0, qr0
/* 8002FFAC 0002BF2C  11 8B 5B 14 */	ps_sum0 f12, f11, f12, f11
/* 8002FFB0 0002BF30  E0 63 00 28 */	psq_l f3, 0x28(r3), 0, qr0
/* 8002FFB4 0002BF34  10 82 00 32 */	ps_mul f4, f2, f0
/* 8002FFB8 0002BF38  F1 85 80 04 */	psq_st f12, 0x4(r5), 1, qr0
/* 8002FFBC 0002BF3C  10 A3 20 7A */	ps_madd f5, f3, f1, f4
/* 8002FFC0 0002BF40  10 C5 29 94 */	ps_sum0 f6, f5, f6, f5
/* 8002FFC4 0002BF44  F0 C5 80 08 */	psq_st f6, 0x8(r5), 1, qr0
/* 8002FFC8 0002BF48  4E 80 00 20 */	blr
.endfn PSMTXMultVec

.fn PSMTXMultVecSR, global
/* 8002FFCC 0002BF4C  E0 03 00 00 */	psq_l f0, 0x0(r3), 0, qr0
/* 8002FFD0 0002BF50  E0 C4 00 00 */	psq_l f6, 0x0(r4), 0, qr0
/* 8002FFD4 0002BF54  E0 43 00 10 */	psq_l f2, 0x10(r3), 0, qr0
/* 8002FFD8 0002BF58  11 00 01 B2 */	ps_mul f8, f0, f6
/* 8002FFDC 0002BF5C  E0 83 00 20 */	psq_l f4, 0x20(r3), 0, qr0
/* 8002FFE0 0002BF60  11 42 01 B2 */	ps_mul f10, f2, f6
/* 8002FFE4 0002BF64  E0 E4 80 08 */	psq_l f7, 0x8(r4), 1, qr0
/* 8002FFE8 0002BF68  11 84 01 B2 */	ps_mul f12, f4, f6
/* 8002FFEC 0002BF6C  E0 63 00 18 */	psq_l f3, 0x18(r3), 0, qr0
/* 8002FFF0 0002BF70  11 08 42 14 */	ps_sum0 f8, f8, f8, f8
/* 8002FFF4 0002BF74  E0 A3 00 28 */	psq_l f5, 0x28(r3), 0, qr0
/* 8002FFF8 0002BF78  11 4A 52 94 */	ps_sum0 f10, f10, f10, f10
/* 8002FFFC 0002BF7C  E0 23 00 08 */	psq_l f1, 0x8(r3), 0, qr0
.L_80030000:
/* 80030000 0002BF80  11 8C 63 14 */	ps_sum0 f12, f12, f12, f12
.L_80030004:
/* 80030004 0002BF84  11 21 41 FA */	ps_madd f9, f1, f7, f8
.L_80030008:
/* 80030008 0002BF88  F1 25 80 00 */	psq_st f9, 0x0(r5), 1, qr0
/* 8003000C 0002BF8C  11 63 51 FA */	ps_madd f11, f3, f7, f10
/* 80030010 0002BF90  F1 65 80 04 */	psq_st f11, 0x4(r5), 1, qr0
/* 80030014 0002BF94  11 A5 61 FA */	ps_madd f13, f5, f7, f12
/* 80030018 0002BF98  F1 A5 80 08 */	psq_st f13, 0x8(r5), 1, qr0
/* 8003001C 0002BF9C  4E 80 00 20 */	blr
.endfn PSMTXMultVecSR
