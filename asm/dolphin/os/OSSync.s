.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global __OSSystemCallVectorStart
__OSSystemCallVectorStart:

.fn SystemCallVector, local
/* 8002E3B4 0002A334  7D 30 FA A6 */	mfspr r9, HID0
/* 8002E3B8 0002A338  61 2A 00 08 */	ori r10, r9, 0x8
/* 8002E3BC 0002A33C  7D 50 FB A6 */	mtspr HID0, r10
/* 8002E3C0 0002A340  4C 00 01 2C */	isync
/* 8002E3C4 0002A344  7C 00 04 AC */	sync
/* 8002E3C8 0002A348  7D 30 FB A6 */	mtspr HID0, r9
/* 8002E3CC 0002A34C  4C 00 00 64 */	rfi
.endfn SystemCallVector

.fn __OSSystemCallVectorEnd, global
/* 8002E3D0 0002A350  60 00 00 00 */	nop
.endfn __OSSystemCallVectorEnd

.fn __OSInitSystemCall, global
/* 8002E3D4 0002A354  7C 08 02 A6 */	mflr r0
/* 8002E3D8 0002A358  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002E3DC 0002A35C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8002E3E0 0002A360  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8002E3E4 0002A364  3C A0 80 00 */	lis r5, 0x80000C00@ha
/* 8002E3E8 0002A368  3C 80 80 03 */	lis r4, SystemCallVector@ha
/* 8002E3EC 0002A36C  3C 60 80 03 */	lis r3, __OSSystemCallVectorEnd@ha
/* 8002E3F0 0002A370  3B E5 0C 00 */	addi r31, r5, 0x80000C00@l
/* 8002E3F4 0002A374  38 03 E3 D0 */	addi r0, r3, __OSSystemCallVectorEnd@l
/* 8002E3F8 0002A378  38 84 E3 B4 */	addi r4, r4, SystemCallVector@l
/* 8002E3FC 0002A37C  7F E3 FB 78 */	mr r3, r31
/* 8002E400 0002A380  7C A4 00 50 */	subf r5, r4, r0
/* 8002E404 0002A384  4B FD 70 1D */	bl memcpy
/* 8002E408 0002A388  7F E3 FB 78 */	mr r3, r31
/* 8002E40C 0002A38C  38 80 01 00 */	li r4, 0x100
/* 8002E410 0002A390  4B FF AB 9D */	bl DCFlushRangeNoSync
/* 8002E414 0002A394  7C 00 04 AC */	sync
/* 8002E418 0002A398  7F E3 FB 78 */	mr r3, r31
/* 8002E41C 0002A39C  38 80 01 00 */	li r4, 0x100
/* 8002E420 0002A3A0  4B FF AB ED */	bl ICInvalidateRange
/* 8002E424 0002A3A4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8002E428 0002A3A8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8002E42C 0002A3AC  38 21 00 10 */	addi r1, r1, 0x10
/* 8002E430 0002A3B0  7C 08 03 A6 */	mtlr r0
/* 8002E434 0002A3B4  4E 80 00 20 */	blr
.endfn __OSInitSystemCall
