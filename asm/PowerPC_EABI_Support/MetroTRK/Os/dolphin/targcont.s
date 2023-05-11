.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global TRKTargetContinue
TRKTargetContinue:
/* 8005EFD4 0005AF54  7C 08 02 A6 */	mflr r0
/* 8005EFD8 0005AF58  38 60 00 00 */	li r3, 0x0
/* 8005EFDC 0005AF5C  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005EFE0 0005AF60  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8005EFE4 0005AF64  4B FF F3 41 */	bl TRKTargetSetStopped
/* 8005EFE8 0005AF68  4B FF FF 99 */	bl UnreserveEXI2Port
/* 8005EFEC 0005AF6C  4B FF ED 35 */	bl TRKSwapAndGo
/* 8005EFF0 0005AF70  4B FF FF 61 */	bl ReserveEXI2Port
/* 8005EFF4 0005AF74  38 60 00 00 */	li r3, 0x0
/* 8005EFF8 0005AF78  38 21 00 08 */	addi r1, r1, 0x8
/* 8005EFFC 0005AF7C  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005F000 0005AF80  7C 08 03 A6 */	mtlr r0
/* 8005F004 0005AF84  4E 80 00 20 */	blr