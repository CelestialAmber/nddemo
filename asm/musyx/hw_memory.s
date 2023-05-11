.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global salMalloc
salMalloc:
/* 800590C8 00055048  7C 08 02 A6 */	mflr r0
/* 800590CC 0005504C  90 01 00 04 */	stw r0, 0x4(r1)
/* 800590D0 00055050  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 800590D4 00055054  81 8D 88 64 */	lwz r12, salHooks@sda21(r13)
/* 800590D8 00055058  7D 88 03 A6 */	mtlr r12
/* 800590DC 0005505C  4E 80 00 21 */	blrl
/* 800590E0 00055060  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800590E4 00055064  38 21 00 08 */	addi r1, r1, 0x8
/* 800590E8 00055068  7C 08 03 A6 */	mtlr r0
/* 800590EC 0005506C  4E 80 00 20 */	blr

.global salFree
salFree:
/* 800590F0 00055070  7C 08 02 A6 */	mflr r0
/* 800590F4 00055074  38 8D 88 64 */	addi r4, r13, salHooks@sda21
/* 800590F8 00055078  90 01 00 04 */	stw r0, 0x4(r1)
/* 800590FC 0005507C  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80059100 00055080  81 84 00 04 */	lwz r12, 0x4(r4)
/* 80059104 00055084  7D 88 03 A6 */	mtlr r12
/* 80059108 00055088  4E 80 00 21 */	blrl
/* 8005910C 0005508C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80059110 00055090  38 21 00 08 */	addi r1, r1, 0x8
/* 80059114 00055094  7C 08 03 A6 */	mtlr r0
/* 80059118 00055098  4E 80 00 20 */	blr

.section extab_, "wa"  # 0x80005520 - 0x80005BC0

lbl_80005B48:
	.4byte 0x00080000
	.4byte 0

lbl_80005B50:
	.4byte 0x00080000
	.4byte 0


.section extabindex_, "wa"  # 0x80005BC0 - 0x800065A0


lbl_800064FC:
    .4byte salMalloc
    .4byte 0x00000028
    .4byte lbl_80005B48

lbl_80006508:
    .4byte salFree
    .4byte 0x0000002C
    .4byte lbl_80005B50