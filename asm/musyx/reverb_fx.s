.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740



.global sndAuxCallbackReverbHI
sndAuxCallbackReverbHI:
/* 8005911C 0005509C  7C 08 02 A6 */	mflr r0
/* 80059120 000550A0  38 E4 00 00 */	addi r7, r4, 0x0
/* 80059124 000550A4  90 01 00 04 */	stw r0, 0x4(r1)
/* 80059128 000550A8  54 60 06 3E */	clrlwi r0, r3, 24
/* 8005912C 000550AC  2C 00 00 01 */	cmpwi r0, 0x1
/* 80059130 000550B0  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80059134 000550B4  41 82 00 34 */	beq .L_80059168
/* 80059138 000550B8  40 80 00 30 */	bge .L_80059168
/* 8005913C 000550BC  2C 00 00 00 */	cmpwi r0, 0x0
/* 80059140 000550C0  40 80 00 08 */	bge .L_80059148
/* 80059144 000550C4  48 00 00 24 */	b .L_80059168
.L_80059148:
/* 80059148 000550C8  88 05 01 C4 */	lbz r0, 0x1c4(r5)
/* 8005914C 000550CC  28 00 00 00 */	cmplwi r0, 0x0
/* 80059150 000550D0  40 82 00 18 */	bne .L_80059168
/* 80059154 000550D4  80 67 00 00 */	lwz r3, 0x0(r7)
/* 80059158 000550D8  7C A6 2B 78 */	mr r6, r5
/* 8005915C 000550DC  80 87 00 04 */	lwz r4, 0x4(r7)
/* 80059160 000550E0  80 A7 00 08 */	lwz r5, 0x8(r7)
/* 80059164 000550E4  48 00 0B BD */	bl ReverbHICallback
.L_80059168:
/* 80059168 000550E8  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8005916C 000550EC  38 21 00 08 */	addi r1, r1, 0x8
/* 80059170 000550F0  7C 08 03 A6 */	mtlr r0
/* 80059174 000550F4  4E 80 00 20 */	blr

.global sndAuxCallbackPrepareReverbHI
sndAuxCallbackPrepareReverbHI:
/* 80059178 000550F8  7C 08 02 A6 */	mflr r0
/* 8005917C 000550FC  90 01 00 04 */	stw r0, 0x4(r1)
/* 80059180 00055100  38 00 00 00 */	li r0, 0x0
/* 80059184 00055104  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80059188 00055108  98 03 01 C4 */	stb r0, 0x1c4(r3)
/* 8005918C 0005510C  C0 23 01 C8 */	lfs f1, 0x1c8(r3)
/* 80059190 00055110  C0 43 01 D0 */	lfs f2, 0x1d0(r3)
/* 80059194 00055114  C0 63 01 CC */	lfs f3, 0x1cc(r3)
/* 80059198 00055118  C0 83 01 D4 */	lfs f4, 0x1d4(r3)
/* 8005919C 0005511C  C0 A3 01 D8 */	lfs f5, 0x1d8(r3)
/* 800591A0 00055120  C0 C3 01 DC */	lfs f6, 0x1dc(r3)
/* 800591A4 00055124  48 00 00 15 */	bl ReverbHICreate
/* 800591A8 00055128  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800591AC 0005512C  38 21 00 08 */	addi r1, r1, 0x8
/* 800591B0 00055130  7C 08 03 A6 */	mtlr r0
/* 800591B4 00055134  4E 80 00 20 */	blr

.section extab_, "wa"  # 0x80005520 - 0x80005BC0

lbl_80005B58:
	.4byte 0x00080000
	.4byte 0

lbl_80005B60:
	.4byte 0x00080000
	.4byte 0

.section extabindex_, "wa"  # 0x80005BC0 - 0x800065A0


lbl_80006514:
    .4byte sndAuxCallbackReverbHI
    .4byte 0x0000005C
    .4byte lbl_80005B58

lbl_80006520:
    .4byte sndAuxCallbackPrepareReverbHI
    .4byte 0x00000040
    .4byte lbl_80005B60