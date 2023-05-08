.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global __ct__8DGTexProFP8DGTexManPCc
__ct__8DGTexProFP8DGTexManPCc:
/* 8001A2E4 00016264  7C 08 02 A6 */	mflr r0
/* 8001A2E8 00016268  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001A2EC 0001626C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8001A2F0 00016270  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8001A2F4 00016274  7C 7F 1B 78 */	mr r31, r3
/* 8001A2F8 00016278  90 83 00 00 */	stw r4, 0x0(r3)
/* 8001A2FC 0001627C  7C A4 2B 78 */	mr r4, r5
/* 8001A300 00016280  80 63 00 00 */	lwz r3, 0x0(r3)
/* 8001A304 00016284  4B FF DD E9 */	bl LoadTexture__8DGTexManFPCc
/* 8001A308 00016288  B0 7F 00 04 */	sth r3, 0x4(r31)
/* 8001A30C 0001628C  A0 1F 00 04 */	lhz r0, 0x4(r31)
/* 8001A310 00016290  28 00 FF FF */	cmplwi r0, 0xffff
/* 8001A314 00016294  40 82 00 14 */	bne .L_8001A328
/* 8001A318 00016298  3C 60 80 06 */	lis r3, lbl_80066CC0@ha
/* 8001A31C 0001629C  4C C6 31 82 */	crclr 4*cr1+eq
/* 8001A320 000162A0  38 63 6C C0 */	addi r3, r3, lbl_80066CC0@l
/* 8001A324 000162A4  48 00 F8 C1 */	bl OSReport
.L_8001A328:
/* 8001A328 000162A8  80 7F 00 00 */	lwz r3, 0x0(r31)
/* 8001A32C 000162AC  A0 9F 00 04 */	lhz r4, 0x4(r31)
/* 8001A330 000162B0  4B FF DF A1 */	bl AttachTexture__8DGTexManFUs
/* 8001A334 000162B4  38 80 00 00 */	li r4, 0x0
/* 8001A338 000162B8  90 9F 00 08 */	stw r4, 0x8(r31)
/* 8001A33C 000162BC  38 00 00 06 */	li r0, 0x6
/* 8001A340 000162C0  38 7F 00 00 */	addi r3, r31, 0x0
/* 8001A344 000162C4  90 9F 00 0C */	stw r4, 0xc(r31)
/* 8001A348 000162C8  90 9F 00 10 */	stw r4, 0x10(r31)
/* 8001A34C 000162CC  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8001A350 000162D0  B0 9F 00 18 */	sth r4, 0x18(r31)
/* 8001A354 000162D4  B0 9F 00 1A */	sth r4, 0x1a(r31)
/* 8001A358 000162D8  90 1F 00 1C */	stw r0, 0x1c(r31)
/* 8001A35C 000162DC  98 9F 00 20 */	stb r4, 0x20(r31)
/* 8001A360 000162E0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8001A364 000162E4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8001A368 000162E8  38 21 00 20 */	addi r1, r1, 0x20
/* 8001A36C 000162EC  7C 08 03 A6 */	mtlr r0
/* 8001A370 000162F0  4E 80 00 20 */	blr

.global __ct__8DGTexProFP8DGTexMan
__ct__8DGTexProFP8DGTexMan:
/* 8001A374 000162F4  3C A0 00 01 */	lis r5, 0x1
/* 8001A378 000162F8  90 83 00 00 */	stw r4, 0x0(r3)
/* 8001A37C 000162FC  38 05 FF FF */	addi r0, r5, -0x1
/* 8001A380 00016300  B0 03 00 04 */	sth r0, 0x4(r3)
/* 8001A384 00016304  38 80 00 00 */	li r4, 0x0
/* 8001A388 00016308  38 00 00 06 */	li r0, 0x6
/* 8001A38C 0001630C  90 83 00 08 */	stw r4, 0x8(r3)
/* 8001A390 00016310  90 83 00 0C */	stw r4, 0xc(r3)
/* 8001A394 00016314  90 83 00 10 */	stw r4, 0x10(r3)
/* 8001A398 00016318  90 83 00 14 */	stw r4, 0x14(r3)
/* 8001A39C 0001631C  B0 83 00 18 */	sth r4, 0x18(r3)
/* 8001A3A0 00016320  B0 83 00 1A */	sth r4, 0x1a(r3)
/* 8001A3A4 00016324  90 03 00 1C */	stw r0, 0x1c(r3)
/* 8001A3A8 00016328  98 83 00 20 */	stb r4, 0x20(r3)
/* 8001A3AC 0001632C  4E 80 00 20 */	blr

.global __dt__8DGTexProFv
__dt__8DGTexProFv:
/* 8001A3B0 00016330  7C 08 02 A6 */	mflr r0
/* 8001A3B4 00016334  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001A3B8 00016338  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8001A3BC 0001633C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8001A3C0 00016340  3B E4 00 00 */	addi r31, r4, 0x0
/* 8001A3C4 00016344  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8001A3C8 00016348  7C 7E 1B 79 */	mr. r30, r3
/* 8001A3CC 0001634C  41 82 00 20 */	beq .L_8001A3EC
/* 8001A3D0 00016350  80 7E 00 00 */	lwz r3, 0x0(r30)
/* 8001A3D4 00016354  A0 9E 00 04 */	lhz r4, 0x4(r30)
/* 8001A3D8 00016358  4B FF DF 85 */	bl DetachTexture__8DGTexManFUs
/* 8001A3DC 0001635C  7F E0 07 35 */	extsh. r0, r31
/* 8001A3E0 00016360  40 81 00 0C */	ble .L_8001A3EC
/* 8001A3E4 00016364  7F C3 F3 78 */	mr r3, r30
/* 8001A3E8 00016368  4B FF 86 B1 */	bl mFree__FPv
.L_8001A3EC:
/* 8001A3EC 0001636C  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8001A3F0 00016370  7F C3 F3 78 */	mr r3, r30
/* 8001A3F4 00016374  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8001A3F8 00016378  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8001A3FC 0001637C  7C 08 03 A6 */	mtlr r0
/* 8001A400 00016380  38 21 00 18 */	addi r1, r1, 0x18
/* 8001A404 00016384  4E 80 00 20 */	blr

.global SetCamera__8DGTexProFP8DGCamera
SetCamera__8DGTexProFP8DGCamera:
/* 8001A408 00016388  90 83 00 10 */	stw r4, 0x10(r3)
/* 8001A40C 0001638C  4E 80 00 20 */	blr

.global InitTexObj__8DGTexProFP9_GXTexObj
InitTexObj__8DGTexProFP9_GXTexObj:
/* 8001A410 00016390  7C 08 02 A6 */	mflr r0
/* 8001A414 00016394  7C 69 1B 78 */	mr r9, r3
/* 8001A418 00016398  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001A41C 0001639C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8001A420 000163A0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8001A424 000163A4  80 E3 00 14 */	lwz r7, 0x14(r3)
/* 8001A428 000163A8  28 07 00 00 */	cmplwi r7, 0x0
/* 8001A42C 000163AC  41 82 00 44 */	beq .L_8001A470
/* 8001A430 000163B0  88 09 00 20 */	lbz r0, 0x20(r9)
/* 8001A434 000163B4  3B E0 00 00 */	li r31, 0x0
/* 8001A438 000163B8  28 00 00 00 */	cmplwi r0, 0x0
/* 8001A43C 000163BC  41 82 00 08 */	beq .L_8001A444
/* 8001A440 000163C0  3B E0 00 01 */	li r31, 0x1
.L_8001A444:
/* 8001A444 000163C4  A0 A9 00 18 */	lhz r5, 0x18(r9)
/* 8001A448 000163C8  7C 83 23 78 */	mr r3, r4
/* 8001A44C 000163CC  A0 C9 00 1A */	lhz r6, 0x1a(r9)
/* 8001A450 000163D0  7C E4 3B 78 */	mr r4, r7
/* 8001A454 000163D4  80 E9 00 1C */	lwz r7, 0x1c(r9)
/* 8001A458 000163D8  81 09 00 08 */	lwz r8, 0x8(r9)
/* 8001A45C 000163DC  7F EA FB 78 */	mr r10, r31
/* 8001A460 000163E0  81 29 00 0C */	lwz r9, 0xc(r9)
/* 8001A464 000163E4  48 02 41 85 */	bl GXInitTexObj
/* 8001A468 000163E8  38 7F 00 00 */	addi r3, r31, 0x0
/* 8001A46C 000163EC  48 00 00 18 */	b .L_8001A484
.L_8001A470:
/* 8001A470 000163F0  80 69 00 00 */	lwz r3, 0x0(r9)
/* 8001A474 000163F4  A0 A9 00 04 */	lhz r5, 0x4(r9)
/* 8001A478 000163F8  80 C9 00 08 */	lwz r6, 0x8(r9)
/* 8001A47C 000163FC  80 E9 00 0C */	lwz r7, 0xc(r9)
/* 8001A480 00016400  4B FF E0 B1 */	bl InitTexObj__8DGTexManFP9_GXTexObjUs14_GXTexWrapMode14_GXTexWrapMode
.L_8001A484:
/* 8001A484 00016404  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8001A488 00016408  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8001A48C 0001640C  38 21 00 18 */	addi r1, r1, 0x18
/* 8001A490 00016410  7C 08 03 A6 */	mtlr r0
/* 8001A494 00016414  4E 80 00 20 */	blr

.global GetLightMtx__8DGTexProFRA3_A4_f
GetLightMtx__8DGTexProFRA3_A4_f:
/* 8001A498 00016418  7C 08 02 A6 */	mflr r0
/* 8001A49C 0001641C  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001A4A0 00016420  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8001A4A4 00016424  80 A3 00 10 */	lwz r5, 0x10(r3)
/* 8001A4A8 00016428  28 05 00 00 */	cmplwi r5, 0x0
/* 8001A4AC 0001642C  41 82 00 28 */	beq .L_8001A4D4
/* 8001A4B0 00016430  80 03 00 14 */	lwz r0, 0x14(r3)
/* 8001A4B4 00016434  28 00 00 00 */	cmplwi r0, 0x0
/* 8001A4B8 00016438  40 82 00 10 */	bne .L_8001A4C8
/* 8001A4BC 0001643C  7C A3 2B 78 */	mr r3, r5
/* 8001A4C0 00016440  4B FF E7 9D */	bl GetLightMtx__8DGCameraFRA3_A4_f
/* 8001A4C4 00016444  48 00 00 18 */	b .L_8001A4DC
.L_8001A4C8:
/* 8001A4C8 00016448  7C A3 2B 78 */	mr r3, r5
/* 8001A4CC 0001644C  4B FF E8 C5 */	bl GetLightMtxYInverse__8DGCameraFRA3_A4_f
/* 8001A4D0 00016450  48 00 00 0C */	b .L_8001A4DC
.L_8001A4D4:
/* 8001A4D4 00016454  7C 83 23 78 */	mr r3, r4
/* 8001A4D8 00016458  48 01 54 99 */	bl PSMTXIdentity
.L_8001A4DC:
/* 8001A4DC 0001645C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8001A4E0 00016460  38 21 00 08 */	addi r1, r1, 0x8
/* 8001A4E4 00016464  7C 08 03 A6 */	mtlr r0
/* 8001A4E8 00016468  4E 80 00 20 */	blr

.global SetDirectTex__8DGTexProFPvUsUs9_GXTexFmtUc
SetDirectTex__8DGTexProFPvUsUs9_GXTexFmtUc:
/* 8001A4EC 0001646C  90 83 00 14 */	stw r4, 0x14(r3)
/* 8001A4F0 00016470  B0 A3 00 18 */	sth r5, 0x18(r3)
/* 8001A4F4 00016474  B0 C3 00 1A */	sth r6, 0x1a(r3)
/* 8001A4F8 00016478  90 E3 00 1C */	stw r7, 0x1c(r3)
/* 8001A4FC 0001647C  99 03 00 20 */	stb r8, 0x20(r3)
/* 8001A500 00016480  4E 80 00 20 */	blr

.section .data, "wa"  # 0x80065000 - 0x8006D1C0 ; 0x000081C0

lbl_80066CC0:

	# ROM: 0x63CC0
	.asciz "DGTexPro::DGTexPro>\n"
	.balign 4
