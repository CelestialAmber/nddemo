.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

GXCPInterruptHandler:
/* 8003ADF0 00036D70  7C 08 02 A6 */	mflr r0
/* 8003ADF4 00036D74  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003ADF8 00036D78  94 21 FD 20 */	stwu r1, -0x2e0(r1)
/* 8003ADFC 00036D7C  93 E1 02 DC */	stw r31, 0x2dc(r1)
/* 8003AE00 00036D80  7C 9F 23 78 */	mr r31, r4
/* 8003AE04 00036D84  80 AD 86 CC */	lwz r5, __cpReg@sda21(r13)
/* 8003AE08 00036D88  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003AE0C 00036D8C  A0 05 00 00 */	lhz r0, 0x0(r5)
/* 8003AE10 00036D90  90 03 00 0C */	stw r0, 0xc(r3)
/* 8003AE14 00036D94  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003AE18 00036D98  80 03 00 08 */	lwz r0, 0x8(r3)
/* 8003AE1C 00036D9C  54 00 EF FF */	extrwi. r0, r0, 1, 28
/* 8003AE20 00036DA0  41 82 00 38 */	beq .L_8003AE58
/* 8003AE24 00036DA4  80 03 00 0C */	lwz r0, 0xc(r3)
/* 8003AE28 00036DA8  54 00 FF FF */	extrwi. r0, r0, 1, 30
/* 8003AE2C 00036DAC  41 82 00 2C */	beq .L_8003AE58
/* 8003AE30 00036DB0  80 6D 86 E0 */	lwz r3, __GXCurrentThread@sda21(r13)
/* 8003AE34 00036DB4  4B FF 40 39 */	bl OSResumeThread
/* 8003AE38 00036DB8  38 00 00 00 */	li r0, 0x0
/* 8003AE3C 00036DBC  90 0D 86 E8 */	stw r0, GXOverflowSuspendInProgress@sda21(r13)
/* 8003AE40 00036DC0  38 60 00 01 */	li r3, 0x1
/* 8003AE44 00036DC4  38 80 00 01 */	li r4, 0x1
/* 8003AE48 00036DC8  48 00 05 7D */	bl __GXWriteFifoIntReset
/* 8003AE4C 00036DCC  38 60 00 01 */	li r3, 0x1
/* 8003AE50 00036DD0  38 80 00 00 */	li r4, 0x0
/* 8003AE54 00036DD4  48 00 05 25 */	bl __GXWriteFifoIntEnable
.L_8003AE58:
/* 8003AE58 00036DD8  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003AE5C 00036DDC  80 03 00 08 */	lwz r0, 0x8(r3)
/* 8003AE60 00036DE0  54 00 F7 FF */	extrwi. r0, r0, 1, 29
/* 8003AE64 00036DE4  41 82 00 44 */	beq .L_8003AEA8
/* 8003AE68 00036DE8  80 03 00 0C */	lwz r0, 0xc(r3)
/* 8003AE6C 00036DEC  54 00 07 FF */	clrlwi. r0, r0, 31
/* 8003AE70 00036DF0  41 82 00 38 */	beq .L_8003AEA8
/* 8003AE74 00036DF4  80 AD 86 F0 */	lwz r5, __GXOverflowCount@sda21(r13)
/* 8003AE78 00036DF8  38 60 00 00 */	li r3, 0x0
/* 8003AE7C 00036DFC  38 80 00 01 */	li r4, 0x1
/* 8003AE80 00036E00  38 05 00 01 */	addi r0, r5, 0x1
/* 8003AE84 00036E04  90 0D 86 F0 */	stw r0, __GXOverflowCount@sda21(r13)
/* 8003AE88 00036E08  48 00 04 F1 */	bl __GXWriteFifoIntEnable
/* 8003AE8C 00036E0C  38 60 00 01 */	li r3, 0x1
/* 8003AE90 00036E10  38 80 00 00 */	li r4, 0x0
/* 8003AE94 00036E14  48 00 05 31 */	bl __GXWriteFifoIntReset
/* 8003AE98 00036E18  38 00 00 01 */	li r0, 0x1
/* 8003AE9C 00036E1C  80 6D 86 E0 */	lwz r3, __GXCurrentThread@sda21(r13)
/* 8003AEA0 00036E20  90 0D 86 E8 */	stw r0, GXOverflowSuspendInProgress@sda21(r13)
/* 8003AEA4 00036E24  4B FF 42 51 */	bl OSSuspendThread
.L_8003AEA8:
/* 8003AEA8 00036E28  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003AEAC 00036E2C  80 83 00 08 */	lwz r4, 0x8(r3)
/* 8003AEB0 00036E30  38 A3 00 08 */	addi r5, r3, 0x8
/* 8003AEB4 00036E34  54 80 DF FF */	extrwi. r0, r4, 1, 26
/* 8003AEB8 00036E38  41 82 00 60 */	beq .L_8003AF18
/* 8003AEBC 00036E3C  80 03 00 0C */	lwz r0, 0xc(r3)
/* 8003AEC0 00036E40  54 00 E7 FF */	extrwi. r0, r0, 1, 27
/* 8003AEC4 00036E44  41 82 00 54 */	beq .L_8003AF18
/* 8003AEC8 00036E48  54 80 06 F2 */	rlwinm r0, r4, 0, 27, 25
/* 8003AECC 00036E4C  90 05 00 00 */	stw r0, 0x0(r5)
/* 8003AED0 00036E50  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003AED4 00036E54  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003AED8 00036E58  80 04 00 08 */	lwz r0, 0x8(r4)
/* 8003AEDC 00036E5C  B0 03 00 02 */	sth r0, 0x2(r3)
/* 8003AEE0 00036E60  80 0D 86 EC */	lwz r0, BreakPointCB@sda21(r13)
/* 8003AEE4 00036E64  28 00 00 00 */	cmplwi r0, 0x0
/* 8003AEE8 00036E68  41 82 00 30 */	beq .L_8003AF18
/* 8003AEEC 00036E6C  38 61 00 10 */	addi r3, r1, 0x10
/* 8003AEF0 00036E70  4B FE E8 A1 */	bl OSClearContext
/* 8003AEF4 00036E74  38 61 00 10 */	addi r3, r1, 0x10
/* 8003AEF8 00036E78  4B FE E6 D1 */	bl OSSetCurrentContext
/* 8003AEFC 00036E7C  81 8D 86 EC */	lwz r12, BreakPointCB@sda21(r13)
/* 8003AF00 00036E80  7D 88 03 A6 */	mtlr r12
/* 8003AF04 00036E84  4E 80 00 21 */	blrl
/* 8003AF08 00036E88  38 61 00 10 */	addi r3, r1, 0x10
/* 8003AF0C 00036E8C  4B FE E8 85 */	bl OSClearContext
/* 8003AF10 00036E90  7F E3 FB 78 */	mr r3, r31
/* 8003AF14 00036E94  4B FE E6 B5 */	bl OSSetCurrentContext
.L_8003AF18:
/* 8003AF18 00036E98  80 01 02 E4 */	lwz r0, 0x2e4(r1)
/* 8003AF1C 00036E9C  83 E1 02 DC */	lwz r31, 0x2dc(r1)
/* 8003AF20 00036EA0  38 21 02 E0 */	addi r1, r1, 0x2e0
/* 8003AF24 00036EA4  7C 08 03 A6 */	mtlr r0
/* 8003AF28 00036EA8  4E 80 00 20 */	blr

.global GXInitFifoBase
GXInitFifoBase:
/* 8003AF2C 00036EAC  7C 08 02 A6 */	mflr r0
/* 8003AF30 00036EB0  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003AF34 00036EB4  38 05 FF FC */	addi r0, r5, -0x4
/* 8003AF38 00036EB8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8003AF3C 00036EBC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8003AF40 00036EC0  3B E4 00 00 */	addi r31, r4, 0x0
/* 8003AF44 00036EC4  7C 1F 02 14 */	add r0, r31, r0
/* 8003AF48 00036EC8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8003AF4C 00036ECC  3B C3 00 00 */	addi r30, r3, 0x0
/* 8003AF50 00036ED0  38 85 C0 00 */	addi r4, r5, -0x4000
/* 8003AF54 00036ED4  93 E3 00 00 */	stw r31, 0x0(r3)
/* 8003AF58 00036ED8  90 03 00 04 */	stw r0, 0x4(r3)
/* 8003AF5C 00036EDC  38 00 00 00 */	li r0, 0x0
/* 8003AF60 00036EE0  90 A3 00 08 */	stw r5, 0x8(r3)
/* 8003AF64 00036EE4  54 A5 F8 74 */	rlwinm r5, r5, 31, 1, 26
/* 8003AF68 00036EE8  90 1E 00 1C */	stw r0, 0x1c(r30)
/* 8003AF6C 00036EEC  48 00 00 9D */	bl GXInitFifoLimits
/* 8003AF70 00036EF0  38 7E 00 00 */	addi r3, r30, 0x0
/* 8003AF74 00036EF4  38 9F 00 00 */	addi r4, r31, 0x0
/* 8003AF78 00036EF8  38 BF 00 00 */	addi r5, r31, 0x0
/* 8003AF7C 00036EFC  48 00 00 1D */	bl GXInitFifoPtrs
/* 8003AF80 00036F00  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8003AF84 00036F04  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8003AF88 00036F08  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8003AF8C 00036F0C  7C 08 03 A6 */	mtlr r0
/* 8003AF90 00036F10  38 21 00 20 */	addi r1, r1, 0x20
/* 8003AF94 00036F14  4E 80 00 20 */	blr

.global GXInitFifoPtrs
GXInitFifoPtrs:
/* 8003AF98 00036F18  7C 08 02 A6 */	mflr r0
/* 8003AF9C 00036F1C  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003AFA0 00036F20  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 8003AFA4 00036F24  93 E1 00 24 */	stw r31, 0x24(r1)
/* 8003AFA8 00036F28  3B E5 00 00 */	addi r31, r5, 0x0
/* 8003AFAC 00036F2C  93 C1 00 20 */	stw r30, 0x20(r1)
/* 8003AFB0 00036F30  3B C4 00 00 */	addi r30, r4, 0x0
/* 8003AFB4 00036F34  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 8003AFB8 00036F38  3B A3 00 00 */	addi r29, r3, 0x0
/* 8003AFBC 00036F3C  4B FF 00 29 */	bl OSDisableInterrupts
/* 8003AFC0 00036F40  93 DD 00 14 */	stw r30, 0x14(r29)
/* 8003AFC4 00036F44  7C 1E F8 50 */	subf r0, r30, r31
/* 8003AFC8 00036F48  93 FD 00 18 */	stw r31, 0x18(r29)
/* 8003AFCC 00036F4C  90 1D 00 1C */	stw r0, 0x1c(r29)
/* 8003AFD0 00036F50  80 9D 00 1C */	lwz r4, 0x1c(r29)
/* 8003AFD4 00036F54  2C 04 00 00 */	cmpwi r4, 0x0
/* 8003AFD8 00036F58  40 80 00 10 */	bge .L_8003AFE8
/* 8003AFDC 00036F5C  80 1D 00 08 */	lwz r0, 0x8(r29)
/* 8003AFE0 00036F60  7C 04 02 14 */	add r0, r4, r0
/* 8003AFE4 00036F64  90 1D 00 1C */	stw r0, 0x1c(r29)
.L_8003AFE8:
/* 8003AFE8 00036F68  4B FF 00 25 */	bl OSRestoreInterrupts
/* 8003AFEC 00036F6C  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 8003AFF0 00036F70  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 8003AFF4 00036F74  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 8003AFF8 00036F78  7C 08 03 A6 */	mtlr r0
/* 8003AFFC 00036F7C  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 8003B000 00036F80  38 21 00 28 */	addi r1, r1, 0x28
/* 8003B004 00036F84  4E 80 00 20 */	blr

.global GXInitFifoLimits
GXInitFifoLimits:
/* 8003B008 00036F88  90 83 00 0C */	stw r4, 0xc(r3)
/* 8003B00C 00036F8C  90 A3 00 10 */	stw r5, 0x10(r3)
/* 8003B010 00036F90  4E 80 00 20 */	blr

.global GXSetCPUFifo
GXSetCPUFifo:
/* 8003B014 00036F94  7C 08 02 A6 */	mflr r0
/* 8003B018 00036F98  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003B01C 00036F9C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8003B020 00036FA0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8003B024 00036FA4  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8003B028 00036FA8  7C 7E 1B 78 */	mr r30, r3
/* 8003B02C 00036FAC  4B FE FF B9 */	bl OSDisableInterrupts
/* 8003B030 00036FB0  80 0D 86 DC */	lwz r0, GPFifo@sda21(r13)
/* 8003B034 00036FB4  3B E3 00 00 */	addi r31, r3, 0x0
/* 8003B038 00036FB8  93 CD 86 D8 */	stw r30, CPUFifo@sda21(r13)
/* 8003B03C 00036FBC  7C 1E 00 40 */	cmplw r30, r0
/* 8003B040 00036FC0  40 82 00 64 */	bne .L_8003B0A4
/* 8003B044 00036FC4  80 BE 00 00 */	lwz r5, 0x0(r30)
/* 8003B048 00036FC8  38 00 00 01 */	li r0, 0x1
/* 8003B04C 00036FCC  80 8D 86 C8 */	lwz r4, __piReg@sda21(r13)
/* 8003B050 00036FD0  38 60 00 01 */	li r3, 0x1
/* 8003B054 00036FD4  54 A5 00 BE */	clrlwi r5, r5, 2
/* 8003B058 00036FD8  90 A4 00 0C */	stw r5, 0xc(r4)
/* 8003B05C 00036FDC  38 80 00 01 */	li r4, 0x1
/* 8003B060 00036FE0  80 DE 00 04 */	lwz r6, 0x4(r30)
/* 8003B064 00036FE4  80 AD 86 C8 */	lwz r5, __piReg@sda21(r13)
/* 8003B068 00036FE8  54 C6 00 BE */	clrlwi r6, r6, 2
/* 8003B06C 00036FEC  90 C5 00 10 */	stw r6, 0x10(r5)
/* 8003B070 00036FF0  80 DE 00 18 */	lwz r6, 0x18(r30)
/* 8003B074 00036FF4  80 AD 86 C8 */	lwz r5, __piReg@sda21(r13)
/* 8003B078 00036FF8  54 C6 00 B4 */	rlwinm r6, r6, 0, 2, 26
/* 8003B07C 00036FFC  54 C6 01 88 */	rlwinm r6, r6, 0, 6, 4
/* 8003B080 00037000  90 C5 00 14 */	stw r6, 0x14(r5)
/* 8003B084 00037004  98 0D 86 E4 */	stb r0, CPGPLinked@sda21(r13)
/* 8003B088 00037008  48 00 03 3D */	bl __GXWriteFifoIntReset
/* 8003B08C 0003700C  38 60 00 01 */	li r3, 0x1
/* 8003B090 00037010  38 80 00 00 */	li r4, 0x0
/* 8003B094 00037014  48 00 02 E5 */	bl __GXWriteFifoIntEnable
/* 8003B098 00037018  38 60 00 01 */	li r3, 0x1
/* 8003B09C 0003701C  48 00 02 99 */	bl __GXFifoLink
/* 8003B0A0 00037020  48 00 00 60 */	b .L_8003B100
.L_8003B0A4:
/* 8003B0A4 00037024  88 0D 86 E4 */	lbz r0, CPGPLinked@sda21(r13)
/* 8003B0A8 00037028  28 00 00 00 */	cmplwi r0, 0x0
/* 8003B0AC 0003702C  41 82 00 14 */	beq .L_8003B0C0
/* 8003B0B0 00037030  38 60 00 00 */	li r3, 0x0
/* 8003B0B4 00037034  48 00 02 81 */	bl __GXFifoLink
/* 8003B0B8 00037038  38 00 00 00 */	li r0, 0x0
/* 8003B0BC 0003703C  98 0D 86 E4 */	stb r0, CPGPLinked@sda21(r13)
.L_8003B0C0:
/* 8003B0C0 00037040  38 60 00 00 */	li r3, 0x0
/* 8003B0C4 00037044  38 80 00 00 */	li r4, 0x0
/* 8003B0C8 00037048  48 00 02 B1 */	bl __GXWriteFifoIntEnable
/* 8003B0CC 0003704C  80 1E 00 00 */	lwz r0, 0x0(r30)
/* 8003B0D0 00037050  80 6D 86 C8 */	lwz r3, __piReg@sda21(r13)
/* 8003B0D4 00037054  54 00 00 BE */	clrlwi r0, r0, 2
/* 8003B0D8 00037058  90 03 00 0C */	stw r0, 0xc(r3)
/* 8003B0DC 0003705C  80 1E 00 04 */	lwz r0, 0x4(r30)
/* 8003B0E0 00037060  80 6D 86 C8 */	lwz r3, __piReg@sda21(r13)
/* 8003B0E4 00037064  54 00 00 BE */	clrlwi r0, r0, 2
/* 8003B0E8 00037068  90 03 00 10 */	stw r0, 0x10(r3)
/* 8003B0EC 0003706C  80 1E 00 18 */	lwz r0, 0x18(r30)
/* 8003B0F0 00037070  80 6D 86 C8 */	lwz r3, __piReg@sda21(r13)
/* 8003B0F4 00037074  54 00 00 B4 */	rlwinm r0, r0, 0, 2, 26
/* 8003B0F8 00037078  54 00 01 88 */	rlwinm r0, r0, 0, 6, 4
/* 8003B0FC 0003707C  90 03 00 14 */	stw r0, 0x14(r3)
.L_8003B100:
/* 8003B100 00037080  7C 00 04 AC */	sync
/* 8003B104 00037084  7F E3 FB 78 */	mr r3, r31
/* 8003B108 00037088  4B FE FF 05 */	bl OSRestoreInterrupts
/* 8003B10C 0003708C  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8003B110 00037090  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8003B114 00037094  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8003B118 00037098  7C 08 03 A6 */	mtlr r0
/* 8003B11C 0003709C  38 21 00 18 */	addi r1, r1, 0x18
/* 8003B120 000370A0  4E 80 00 20 */	blr

.global GXSetGPFifo
GXSetGPFifo:
/* 8003B124 000370A4  7C 08 02 A6 */	mflr r0
/* 8003B128 000370A8  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003B12C 000370AC  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8003B130 000370B0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8003B134 000370B4  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8003B138 000370B8  7C 7E 1B 78 */	mr r30, r3
/* 8003B13C 000370BC  4B FE FE A9 */	bl OSDisableInterrupts
/* 8003B140 000370C0  7C 7F 1B 78 */	mr r31, r3
/* 8003B144 000370C4  48 00 01 CD */	bl __GXFifoReadDisable
/* 8003B148 000370C8  38 60 00 00 */	li r3, 0x0
/* 8003B14C 000370CC  38 80 00 00 */	li r4, 0x0
/* 8003B150 000370D0  48 00 02 29 */	bl __GXWriteFifoIntEnable
/* 8003B154 000370D4  93 CD 86 DC */	stw r30, GPFifo@sda21(r13)
/* 8003B158 000370D8  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B15C 000370DC  80 1E 00 00 */	lwz r0, 0x0(r30)
/* 8003B160 000370E0  B0 03 00 20 */	sth r0, 0x20(r3)
/* 8003B164 000370E4  80 1E 00 04 */	lwz r0, 0x4(r30)
/* 8003B168 000370E8  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B16C 000370EC  B0 03 00 24 */	sth r0, 0x24(r3)
/* 8003B170 000370F0  80 1E 00 1C */	lwz r0, 0x1c(r30)
/* 8003B174 000370F4  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B178 000370F8  B0 03 00 30 */	sth r0, 0x30(r3)
/* 8003B17C 000370FC  80 1E 00 18 */	lwz r0, 0x18(r30)
/* 8003B180 00037100  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B184 00037104  B0 03 00 34 */	sth r0, 0x34(r3)
/* 8003B188 00037108  80 1E 00 14 */	lwz r0, 0x14(r30)
/* 8003B18C 0003710C  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B190 00037110  B0 03 00 38 */	sth r0, 0x38(r3)
/* 8003B194 00037114  80 1E 00 0C */	lwz r0, 0xc(r30)
/* 8003B198 00037118  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B19C 0003711C  B0 03 00 28 */	sth r0, 0x28(r3)
/* 8003B1A0 00037120  80 1E 00 10 */	lwz r0, 0x10(r30)
/* 8003B1A4 00037124  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B1A8 00037128  B0 03 00 2C */	sth r0, 0x2c(r3)
/* 8003B1AC 0003712C  80 1E 00 00 */	lwz r0, 0x0(r30)
/* 8003B1B0 00037130  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B1B4 00037134  54 00 84 BE */	extrwi r0, r0, 14, 2
/* 8003B1B8 00037138  B0 03 00 22 */	sth r0, 0x22(r3)
/* 8003B1BC 0003713C  80 1E 00 04 */	lwz r0, 0x4(r30)
/* 8003B1C0 00037140  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B1C4 00037144  54 00 84 BE */	extrwi r0, r0, 14, 2
/* 8003B1C8 00037148  B0 03 00 26 */	sth r0, 0x26(r3)
/* 8003B1CC 0003714C  80 1E 00 1C */	lwz r0, 0x1c(r30)
/* 8003B1D0 00037150  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B1D4 00037154  7C 00 86 70 */	srawi r0, r0, 16
/* 8003B1D8 00037158  B0 03 00 32 */	sth r0, 0x32(r3)
/* 8003B1DC 0003715C  80 1E 00 18 */	lwz r0, 0x18(r30)
/* 8003B1E0 00037160  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B1E4 00037164  54 00 84 BE */	extrwi r0, r0, 14, 2
/* 8003B1E8 00037168  B0 03 00 36 */	sth r0, 0x36(r3)
/* 8003B1EC 0003716C  80 1E 00 14 */	lwz r0, 0x14(r30)
/* 8003B1F0 00037170  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B1F4 00037174  54 00 84 BE */	extrwi r0, r0, 14, 2
/* 8003B1F8 00037178  B0 03 00 3A */	sth r0, 0x3a(r3)
/* 8003B1FC 0003717C  80 1E 00 0C */	lwz r0, 0xc(r30)
/* 8003B200 00037180  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B204 00037184  54 00 84 3E */	srwi r0, r0, 16
/* 8003B208 00037188  B0 03 00 2A */	sth r0, 0x2a(r3)
/* 8003B20C 0003718C  80 1E 00 10 */	lwz r0, 0x10(r30)
/* 8003B210 00037190  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B214 00037194  54 00 84 3E */	srwi r0, r0, 16
/* 8003B218 00037198  B0 03 00 2E */	sth r0, 0x2e(r3)
/* 8003B21C 0003719C  7C 00 04 AC */	sync
/* 8003B220 000371A0  80 6D 86 D8 */	lwz r3, CPUFifo@sda21(r13)
/* 8003B224 000371A4  80 0D 86 DC */	lwz r0, GPFifo@sda21(r13)
/* 8003B228 000371A8  7C 03 00 40 */	cmplw r3, r0
/* 8003B22C 000371AC  40 82 00 24 */	bne .L_8003B250
/* 8003B230 000371B0  38 00 00 01 */	li r0, 0x1
/* 8003B234 000371B4  98 0D 86 E4 */	stb r0, CPGPLinked@sda21(r13)
/* 8003B238 000371B8  38 60 00 01 */	li r3, 0x1
/* 8003B23C 000371BC  38 80 00 00 */	li r4, 0x0
/* 8003B240 000371C0  48 00 01 39 */	bl __GXWriteFifoIntEnable
/* 8003B244 000371C4  38 60 00 01 */	li r3, 0x1
/* 8003B248 000371C8  48 00 00 ED */	bl __GXFifoLink
/* 8003B24C 000371CC  48 00 00 20 */	b .L_8003B26C
.L_8003B250:
/* 8003B250 000371D0  38 00 00 00 */	li r0, 0x0
/* 8003B254 000371D4  98 0D 86 E4 */	stb r0, CPGPLinked@sda21(r13)
/* 8003B258 000371D8  38 60 00 00 */	li r3, 0x0
/* 8003B25C 000371DC  38 80 00 00 */	li r4, 0x0
/* 8003B260 000371E0  48 00 01 19 */	bl __GXWriteFifoIntEnable
/* 8003B264 000371E4  38 60 00 00 */	li r3, 0x0
/* 8003B268 000371E8  48 00 00 CD */	bl __GXFifoLink
.L_8003B26C:
/* 8003B26C 000371EC  38 60 00 01 */	li r3, 0x1
/* 8003B270 000371F0  38 80 00 01 */	li r4, 0x1
/* 8003B274 000371F4  48 00 01 51 */	bl __GXWriteFifoIntReset
/* 8003B278 000371F8  48 00 00 71 */	bl __GXFifoReadEnable
/* 8003B27C 000371FC  7F E3 FB 78 */	mr r3, r31
/* 8003B280 00037200  4B FE FD 8D */	bl OSRestoreInterrupts
/* 8003B284 00037204  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8003B288 00037208  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8003B28C 0003720C  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8003B290 00037210  7C 08 03 A6 */	mtlr r0
/* 8003B294 00037214  38 21 00 18 */	addi r1, r1, 0x18
/* 8003B298 00037218  4E 80 00 20 */	blr

.global __GXFifoInit
__GXFifoInit:
/* 8003B29C 0003721C  7C 08 02 A6 */	mflr r0
/* 8003B2A0 00037220  3C 60 80 04 */	lis r3, GXCPInterruptHandler@ha
/* 8003B2A4 00037224  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003B2A8 00037228  38 83 AD F0 */	addi r4, r3, GXCPInterruptHandler@l
/* 8003B2AC 0003722C  38 60 00 11 */	li r3, 0x11
/* 8003B2B0 00037230  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8003B2B4 00037234  4B FE FD 7D */	bl __OSSetInterruptHandler
/* 8003B2B8 00037238  38 60 40 00 */	li r3, 0x4000
/* 8003B2BC 0003723C  4B FF 01 79 */	bl __OSUnmaskInterrupts
/* 8003B2C0 00037240  4B FF 32 B1 */	bl OSGetCurrentThread
/* 8003B2C4 00037244  38 00 00 00 */	li r0, 0x0
/* 8003B2C8 00037248  90 6D 86 E0 */	stw r3, __GXCurrentThread@sda21(r13)
/* 8003B2CC 0003724C  90 0D 86 E8 */	stw r0, GXOverflowSuspendInProgress@sda21(r13)
/* 8003B2D0 00037250  90 0D 86 D8 */	stw r0, CPUFifo@sda21(r13)
/* 8003B2D4 00037254  90 0D 86 DC */	stw r0, GPFifo@sda21(r13)
/* 8003B2D8 00037258  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8003B2DC 0003725C  38 21 00 08 */	addi r1, r1, 0x8
/* 8003B2E0 00037260  7C 08 03 A6 */	mtlr r0
/* 8003B2E4 00037264  4E 80 00 20 */	blr

__GXFifoReadEnable:
/* 8003B2E8 00037268  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003B2EC 0003726C  84 03 00 08 */	lwzu r0, 0x8(r3)
/* 8003B2F0 00037270  54 00 00 3C */	clrrwi r0, r0, 1
/* 8003B2F4 00037274  60 00 00 01 */	ori r0, r0, 0x1
/* 8003B2F8 00037278  90 03 00 00 */	stw r0, 0x0(r3)
/* 8003B2FC 0003727C  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003B300 00037280  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B304 00037284  80 04 00 08 */	lwz r0, 0x8(r4)
/* 8003B308 00037288  B0 03 00 02 */	sth r0, 0x2(r3)
/* 8003B30C 0003728C  4E 80 00 20 */	blr

__GXFifoReadDisable:
/* 8003B310 00037290  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003B314 00037294  84 03 00 08 */	lwzu r0, 0x8(r3)
/* 8003B318 00037298  54 00 00 3C */	clrrwi r0, r0, 1
/* 8003B31C 0003729C  90 03 00 00 */	stw r0, 0x0(r3)
/* 8003B320 000372A0  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003B324 000372A4  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B328 000372A8  80 04 00 08 */	lwz r0, 0x8(r4)
/* 8003B32C 000372AC  B0 03 00 02 */	sth r0, 0x2(r3)
/* 8003B330 000372B0  4E 80 00 20 */	blr

__GXFifoLink:
/* 8003B334 000372B4  54 60 06 3F */	clrlwi. r0, r3, 24
/* 8003B338 000372B8  41 82 00 0C */	beq .L_8003B344
/* 8003B33C 000372BC  38 00 00 01 */	li r0, 0x1
/* 8003B340 000372C0  48 00 00 08 */	b .L_8003B348
.L_8003B344:
/* 8003B344 000372C4  38 00 00 00 */	li r0, 0x0
.L_8003B348:
/* 8003B348 000372C8  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003B34C 000372CC  54 00 20 36 */	slwi r0, r0, 4
/* 8003B350 000372D0  38 83 00 08 */	addi r4, r3, 0x8
/* 8003B354 000372D4  80 63 00 08 */	lwz r3, 0x8(r3)
/* 8003B358 000372D8  54 63 07 34 */	rlwinm r3, r3, 0, 28, 26
/* 8003B35C 000372DC  7C 60 03 78 */	or r0, r3, r0
/* 8003B360 000372E0  90 04 00 00 */	stw r0, 0x0(r4)
/* 8003B364 000372E4  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003B368 000372E8  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B36C 000372EC  80 04 00 08 */	lwz r0, 0x8(r4)
/* 8003B370 000372F0  B0 03 00 02 */	sth r0, 0x2(r3)
/* 8003B374 000372F4  4E 80 00 20 */	blr

__GXWriteFifoIntEnable:
/* 8003B378 000372F8  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 8003B37C 000372FC  54 63 15 BA */	clrlslwi r3, r3, 24, 2
/* 8003B380 00037300  54 80 1D 78 */	clrlslwi r0, r4, 24, 3
/* 8003B384 00037304  38 C5 00 08 */	addi r6, r5, 0x8
/* 8003B388 00037308  80 A5 00 08 */	lwz r5, 0x8(r5)
/* 8003B38C 0003730C  54 A4 07 B8 */	rlwinm r4, r5, 0, 30, 28
/* 8003B390 00037310  7C 83 1B 78 */	or r3, r4, r3
/* 8003B394 00037314  90 66 00 00 */	stw r3, 0x0(r6)
/* 8003B398 00037318  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003B39C 0003731C  38 83 00 08 */	addi r4, r3, 0x8
/* 8003B3A0 00037320  80 63 00 08 */	lwz r3, 0x8(r3)
/* 8003B3A4 00037324  54 63 07 76 */	rlwinm r3, r3, 0, 29, 27
/* 8003B3A8 00037328  7C 60 03 78 */	or r0, r3, r0
/* 8003B3AC 0003732C  90 04 00 00 */	stw r0, 0x0(r4)
/* 8003B3B0 00037330  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003B3B4 00037334  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B3B8 00037338  80 04 00 08 */	lwz r0, 0x8(r4)
/* 8003B3BC 0003733C  B0 03 00 02 */	sth r0, 0x2(r3)
/* 8003B3C0 00037340  4E 80 00 20 */	blr

__GXWriteFifoIntReset:
/* 8003B3C4 00037344  80 AD 82 90 */	lwz r5, gx@sda21(r13)
/* 8003B3C8 00037348  54 63 06 3E */	clrlwi r3, r3, 24
/* 8003B3CC 0003734C  54 80 0D FC */	clrlslwi r0, r4, 24, 1
/* 8003B3D0 00037350  38 C5 00 10 */	addi r6, r5, 0x10
/* 8003B3D4 00037354  80 A5 00 10 */	lwz r5, 0x10(r5)
/* 8003B3D8 00037358  54 A4 00 3C */	clrrwi r4, r5, 1
/* 8003B3DC 0003735C  7C 83 1B 78 */	or r3, r4, r3
/* 8003B3E0 00037360  90 66 00 00 */	stw r3, 0x0(r6)
/* 8003B3E4 00037364  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003B3E8 00037368  38 83 00 10 */	addi r4, r3, 0x10
/* 8003B3EC 0003736C  80 63 00 10 */	lwz r3, 0x10(r3)
/* 8003B3F0 00037370  54 63 07 FA */	rlwinm r3, r3, 0, 31, 29
/* 8003B3F4 00037374  7C 60 03 78 */	or r0, r3, r0
/* 8003B3F8 00037378  90 04 00 00 */	stw r0, 0x0(r4)
/* 8003B3FC 0003737C  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003B400 00037380  80 6D 86 CC */	lwz r3, __cpReg@sda21(r13)
/* 8003B404 00037384  80 04 00 10 */	lwz r0, 0x10(r4)
/* 8003B408 00037388  B0 03 00 04 */	sth r0, 0x4(r3)
/* 8003B40C 0003738C  4E 80 00 20 */	blr

.global GXSetCurrentGXThread
GXSetCurrentGXThread:
/* 8003B410 00037390  7C 08 02 A6 */	mflr r0
/* 8003B414 00037394  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003B418 00037398  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8003B41C 0003739C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8003B420 000373A0  93 C1 00 08 */	stw r30, 0x8(r1)
/* 8003B424 000373A4  4B FE FB C1 */	bl OSDisableInterrupts
/* 8003B428 000373A8  83 CD 86 E0 */	lwz r30, __GXCurrentThread@sda21(r13)
/* 8003B42C 000373AC  7C 7F 1B 78 */	mr r31, r3
/* 8003B430 000373B0  4B FF 31 41 */	bl OSGetCurrentThread
/* 8003B434 000373B4  90 6D 86 E0 */	stw r3, __GXCurrentThread@sda21(r13)
/* 8003B438 000373B8  7F E3 FB 78 */	mr r3, r31
/* 8003B43C 000373BC  4B FE FB D1 */	bl OSRestoreInterrupts
/* 8003B440 000373C0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8003B444 000373C4  7F C3 F3 78 */	mr r3, r30
/* 8003B448 000373C8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8003B44C 000373CC  83 C1 00 08 */	lwz r30, 0x8(r1)
/* 8003B450 000373D0  7C 08 03 A6 */	mtlr r0
/* 8003B454 000373D4  38 21 00 10 */	addi r1, r1, 0x10
/* 8003B458 000373D8  4E 80 00 20 */	blr

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80

.global FifoObj
FifoObj:
	.skip 0x80

.skip 4

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380


CPUFifo:
	.skip 0x4

GPFifo:
	.skip 0x4

__GXCurrentThread:
	.skip 0x4

CPGPLinked:
	.skip 0x1

.skip 3

GXOverflowSuspendInProgress:
	.skip 0x4

BreakPointCB:
	.skip 0x4

__GXOverflowCount:
	.skip 0x4

.skip 4