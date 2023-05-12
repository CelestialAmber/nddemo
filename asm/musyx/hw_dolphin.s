.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740




.fn salCallback, local
/* 80058BCC 00054B4C  7C 08 02 A6 */	mflr r0
/* 80058BD0 00054B50  38 80 02 80 */	li r4, 0x280
/* 80058BD4 00054B54  90 01 00 04 */	stw r0, 0x4(r1)
/* 80058BD8 00054B58  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80058BDC 00054B5C  88 AD 88 B4 */	lbz r5, salAIBufferIndex@sda21(r13)
/* 80058BE0 00054B60  80 6D 88 94 */	lwz r3, salAIBufferBase@sda21(r13)
/* 80058BE4 00054B64  38 A5 00 01 */	addi r5, r5, 0x1
/* 80058BE8 00054B68  7C A0 16 70 */	srawi r0, r5, 2
/* 80058BEC 00054B6C  7C 00 01 94 */	addze r0, r0
/* 80058BF0 00054B70  54 00 10 3A */	slwi r0, r0, 2
/* 80058BF4 00054B74  7C 00 28 10 */	subfc r0, r0, r5
/* 80058BF8 00054B78  98 0D 88 B4 */	stb r0, salAIBufferIndex@sda21(r13)
/* 80058BFC 00054B7C  3C 63 80 00 */	addis r3, r3, 0x8000
/* 80058C00 00054B80  88 0D 88 B4 */	lbz r0, salAIBufferIndex@sda21(r13)
/* 80058C04 00054B84  1C 00 02 80 */	mulli r0, r0, 0x280
/* 80058C08 00054B88  7C 63 02 14 */	add r3, r3, r0
/* 80058C0C 00054B8C  4B FD E8 D1 */	bl AIInitDMA
/* 80058C10 00054B90  4B FD 69 25 */	bl OSGetTick
/* 80058C14 00054B94  90 6D 88 A4 */	stw r3, salLastTick@sda21(r13)
/* 80058C18 00054B98  80 0D 88 98 */	lwz r0, salDspIsDone@sda21(r13)
/* 80058C1C 00054B9C  28 00 00 00 */	cmplwi r0, 0x0
/* 80058C20 00054BA0  41 82 00 38 */	beq .L_80058C58
/* 80058C24 00054BA4  80 0D 88 A0 */	lwz r0, salLogicActive@sda21(r13)
/* 80058C28 00054BA8  28 00 00 00 */	cmplwi r0, 0x0
/* 80058C2C 00054BAC  40 82 00 34 */	bne .L_80058C60
/* 80058C30 00054BB0  38 00 00 01 */	li r0, 0x1
/* 80058C34 00054BB4  90 0D 88 A0 */	stw r0, salLogicActive@sda21(r13)
/* 80058C38 00054BB8  4B FD 23 C1 */	bl OSEnableInterrupts
/* 80058C3C 00054BBC  81 8D 88 90 */	lwz r12, userCallback@sda21(r13)
/* 80058C40 00054BC0  7D 88 03 A6 */	mtlr r12
/* 80058C44 00054BC4  4E 80 00 21 */	blrl
/* 80058C48 00054BC8  4B FD 23 9D */	bl OSDisableInterrupts
/* 80058C4C 00054BCC  38 00 00 00 */	li r0, 0x0
/* 80058C50 00054BD0  90 0D 88 A0 */	stw r0, salLogicActive@sda21(r13)
/* 80058C54 00054BD4  48 00 00 0C */	b .L_80058C60
.L_80058C58:
/* 80058C58 00054BD8  38 00 00 01 */	li r0, 0x1
/* 80058C5C 00054BDC  90 0D 88 9C */	stw r0, salLogicIsWaiting@sda21(r13)
.L_80058C60:
/* 80058C60 00054BE0  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80058C64 00054BE4  38 21 00 08 */	addi r1, r1, 0x8
/* 80058C68 00054BE8  7C 08 03 A6 */	mtlr r0
/* 80058C6C 00054BEC  4E 80 00 20 */	blr
.endfn salCallback

.fn dspInitCallback, local
/* 80058C70 00054BF0  38 00 00 01 */	li r0, 0x1
/* 80058C74 00054BF4  90 0D 88 98 */	stw r0, salDspIsDone@sda21(r13)
/* 80058C78 00054BF8  90 0D 88 A8 */	stw r0, salDspInitIsDone@sda21(r13)
/* 80058C7C 00054BFC  4E 80 00 20 */	blr
.endfn dspInitCallback

.fn dspResumeCallback, local
/* 80058C80 00054C00  7C 08 02 A6 */	mflr r0
/* 80058C84 00054C04  38 60 00 01 */	li r3, 0x1
/* 80058C88 00054C08  90 01 00 04 */	stw r0, 0x4(r1)
/* 80058C8C 00054C0C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80058C90 00054C10  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80058C94 00054C14  90 6D 88 98 */	stw r3, salDspIsDone@sda21(r13)
/* 80058C98 00054C18  80 0D 88 9C */	lwz r0, salLogicIsWaiting@sda21(r13)
/* 80058C9C 00054C1C  28 00 00 00 */	cmplwi r0, 0x0
/* 80058CA0 00054C20  41 82 00 34 */	beq .L_80058CD4
/* 80058CA4 00054C24  3B E0 00 00 */	li r31, 0x0
/* 80058CA8 00054C28  93 ED 88 9C */	stw r31, salLogicIsWaiting@sda21(r13)
/* 80058CAC 00054C2C  80 0D 88 A0 */	lwz r0, salLogicActive@sda21(r13)
/* 80058CB0 00054C30  28 00 00 00 */	cmplwi r0, 0x0
/* 80058CB4 00054C34  40 82 00 20 */	bne .L_80058CD4
/* 80058CB8 00054C38  90 6D 88 A0 */	stw r3, salLogicActive@sda21(r13)
/* 80058CBC 00054C3C  4B FD 23 3D */	bl OSEnableInterrupts
/* 80058CC0 00054C40  81 8D 88 90 */	lwz r12, userCallback@sda21(r13)
/* 80058CC4 00054C44  7D 88 03 A6 */	mtlr r12
/* 80058CC8 00054C48  4E 80 00 21 */	blrl
/* 80058CCC 00054C4C  4B FD 23 19 */	bl OSDisableInterrupts
/* 80058CD0 00054C50  93 ED 88 A0 */	stw r31, salLogicActive@sda21(r13)
.L_80058CD4:
/* 80058CD4 00054C54  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80058CD8 00054C58  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80058CDC 00054C5C  38 21 00 18 */	addi r1, r1, 0x18
/* 80058CE0 00054C60  7C 08 03 A6 */	mtlr r0
/* 80058CE4 00054C64  4E 80 00 20 */	blr
.endfn dspResumeCallback

.fn salInitAi, global
/* 80058CE8 00054C68  7C 08 02 A6 */	mflr r0
/* 80058CEC 00054C6C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80058CF0 00054C70  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80058CF4 00054C74  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80058CF8 00054C78  3B E5 00 00 */	addi r31, r5, 0x0
/* 80058CFC 00054C7C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80058D00 00054C80  3B C3 00 00 */	addi r30, r3, 0x0
/* 80058D04 00054C84  38 60 0A 00 */	li r3, 0xa00
/* 80058D08 00054C88  48 00 03 C1 */	bl salMalloc
/* 80058D0C 00054C8C  28 03 00 00 */	cmplwi r3, 0x0
/* 80058D10 00054C90  90 6D 88 94 */	stw r3, salAIBufferBase@sda21(r13)
/* 80058D14 00054C94  41 82 00 84 */	beq .L_80058D98
/* 80058D18 00054C98  80 6D 88 94 */	lwz r3, salAIBufferBase@sda21(r13)
/* 80058D1C 00054C9C  38 80 00 00 */	li r4, 0x0
/* 80058D20 00054CA0  38 A0 0A 00 */	li r5, 0xa00
/* 80058D24 00054CA4  4B FA C6 09 */	bl memset
/* 80058D28 00054CA8  80 6D 88 94 */	lwz r3, salAIBufferBase@sda21(r13)
/* 80058D2C 00054CAC  38 80 0A 00 */	li r4, 0xa00
/* 80058D30 00054CB0  4B FD 02 15 */	bl DCFlushRange
/* 80058D34 00054CB4  38 00 00 00 */	li r0, 0x0
/* 80058D38 00054CB8  93 CD 88 90 */	stw r30, userCallback@sda21(r13)
/* 80058D3C 00054CBC  38 80 00 01 */	li r4, 0x1
/* 80058D40 00054CC0  90 0D 88 9C */	stw r0, salLogicIsWaiting@sda21(r13)
/* 80058D44 00054CC4  3C 60 80 06 */	lis r3, salCallback@ha
/* 80058D48 00054CC8  38 63 8B CC */	addi r3, r3, salCallback@l
/* 80058D4C 00054CCC  90 8D 88 98 */	stw r4, salDspIsDone@sda21(r13)
/* 80058D50 00054CD0  98 8D 88 B4 */	stb r4, salAIBufferIndex@sda21(r13)
/* 80058D54 00054CD4  90 0D 88 A0 */	stw r0, salLogicActive@sda21(r13)
/* 80058D58 00054CD8  4B FD E7 41 */	bl AIRegisterDMACallback
/* 80058D5C 00054CDC  88 0D 88 B4 */	lbz r0, salAIBufferIndex@sda21(r13)
/* 80058D60 00054CE0  38 80 02 80 */	li r4, 0x280
/* 80058D64 00054CE4  80 6D 88 94 */	lwz r3, salAIBufferBase@sda21(r13)
/* 80058D68 00054CE8  1C 00 02 80 */	mulli r0, r0, 0x280
/* 80058D6C 00054CEC  3C 63 80 00 */	addis r3, r3, 0x8000
/* 80058D70 00054CF0  7C 63 02 14 */	add r3, r3, r0
/* 80058D74 00054CF4  4B FD E7 69 */	bl AIInitDMA
/* 80058D78 00054CF8  3C 60 80 09 */	lis r3, synthInfo@ha
/* 80058D7C 00054CFC  38 63 EC 38 */	addi r3, r3, synthInfo@l
/* 80058D80 00054D00  38 00 00 20 */	li r0, 0x20
/* 80058D84 00054D04  90 03 00 04 */	stw r0, 0x4(r3)
/* 80058D88 00054D08  38 00 7D 00 */	li r0, 0x7d00
/* 80058D8C 00054D0C  38 60 00 01 */	li r3, 0x1
/* 80058D90 00054D10  90 1F 00 00 */	stw r0, 0x0(r31)
/* 80058D94 00054D14  48 00 00 08 */	b .L_80058D9C
.L_80058D98:
/* 80058D98 00054D18  38 60 00 00 */	li r3, 0x0
.L_80058D9C:
/* 80058D9C 00054D1C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80058DA0 00054D20  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80058DA4 00054D24  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80058DA8 00054D28  7C 08 03 A6 */	mtlr r0
/* 80058DAC 00054D2C  38 21 00 20 */	addi r1, r1, 0x20
/* 80058DB0 00054D30  4E 80 00 20 */	blr
.endfn salInitAi

.fn salStartAi, global
/* 80058DB4 00054D34  7C 08 02 A6 */	mflr r0
/* 80058DB8 00054D38  90 01 00 04 */	stw r0, 0x4(r1)
/* 80058DBC 00054D3C  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80058DC0 00054D40  4B FD E7 A5 */	bl AIStartDMA
/* 80058DC4 00054D44  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80058DC8 00054D48  38 21 00 08 */	addi r1, r1, 0x8
/* 80058DCC 00054D4C  7C 08 03 A6 */	mtlr r0
/* 80058DD0 00054D50  4E 80 00 20 */	blr
.endfn salStartAi

.fn salExitAi, global
/* 80058DD4 00054D54  7C 08 02 A6 */	mflr r0
/* 80058DD8 00054D58  38 60 00 00 */	li r3, 0x0
/* 80058DDC 00054D5C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80058DE0 00054D60  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80058DE4 00054D64  4B FD E6 B5 */	bl AIRegisterDMACallback
/* 80058DE8 00054D68  4B FD E7 95 */	bl AIStopDMA
/* 80058DEC 00054D6C  80 6D 88 94 */	lwz r3, salAIBufferBase@sda21(r13)
/* 80058DF0 00054D70  48 00 03 01 */	bl salFree
/* 80058DF4 00054D74  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80058DF8 00054D78  38 60 00 01 */	li r3, 0x1
/* 80058DFC 00054D7C  38 21 00 08 */	addi r1, r1, 0x8
/* 80058E00 00054D80  7C 08 03 A6 */	mtlr r0
/* 80058E04 00054D84  4E 80 00 20 */	blr
.endfn salExitAi

.fn salAiGetDest, global
/* 80058E08 00054D88  88 6D 88 B4 */	lbz r3, salAIBufferIndex@sda21(r13)
/* 80058E0C 00054D8C  80 8D 88 94 */	lwz r4, salAIBufferBase@sda21(r13)
/* 80058E10 00054D90  38 63 00 02 */	addi r3, r3, 0x2
/* 80058E14 00054D94  7C 60 16 70 */	srawi r0, r3, 2
/* 80058E18 00054D98  7C 00 01 94 */	addze r0, r0
/* 80058E1C 00054D9C  54 00 10 3A */	slwi r0, r0, 2
/* 80058E20 00054DA0  7C 00 18 10 */	subfc r0, r0, r3
/* 80058E24 00054DA4  54 00 06 3E */	clrlwi r0, r0, 24
/* 80058E28 00054DA8  1C 00 02 80 */	mulli r0, r0, 0x280
/* 80058E2C 00054DAC  7C 64 02 14 */	add r3, r4, r0
/* 80058E30 00054DB0  4E 80 00 20 */	blr
.endfn salAiGetDest

.fn salInitDsp, global
/* 80058E34 00054DB4  7C 08 02 A6 */	mflr r0
/* 80058E38 00054DB8  3C 80 80 06 */	lis r4, dspInitCallback@ha
/* 80058E3C 00054DBC  90 01 00 04 */	stw r0, 0x4(r1)
/* 80058E40 00054DC0  3C 60 80 0A */	lis r3, dsp_task@ha
/* 80058E44 00054DC4  38 E0 20 00 */	li r7, 0x2000
/* 80058E48 00054DC8  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80058E4C 00054DCC  38 C0 00 10 */	li r6, 0x10
/* 80058E50 00054DD0  38 84 8C 70 */	addi r4, r4, dspInitCallback@l
/* 80058E54 00054DD4  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80058E58 00054DD8  3B E0 00 00 */	li r31, 0x0
/* 80058E5C 00054DDC  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80058E60 00054DE0  3B C3 48 80 */	addi r30, r3, dsp_task@l
/* 80058E64 00054DE4  3C 60 80 07 */	lis r3, dspSlave@ha
/* 80058E68 00054DE8  38 03 AB 60 */	addi r0, r3, dspSlave@l
/* 80058E6C 00054DEC  90 1E 00 0C */	stw r0, 0xc(r30)
/* 80058E70 00054DF0  38 1E 00 60 */	addi r0, r30, 0x60
/* 80058E74 00054DF4  3C 60 80 06 */	lis r3, dspResumeCallback@ha
/* 80058E78 00054DF8  A0 AD 83 00 */	lhz r5, dspSlaveLength@sda21(r13)
/* 80058E7C 00054DFC  90 BE 00 10 */	stw r5, 0x10(r30)
/* 80058E80 00054E00  38 A0 00 30 */	li r5, 0x30
/* 80058E84 00054E04  93 FE 00 14 */	stw r31, 0x14(r30)
/* 80058E88 00054E08  90 1E 00 18 */	stw r0, 0x18(r30)
/* 80058E8C 00054E0C  38 03 8C 80 */	addi r0, r3, dspResumeCallback@l
/* 80058E90 00054E10  90 FE 00 1C */	stw r7, 0x1c(r30)
/* 80058E94 00054E14  93 FE 00 20 */	stw r31, 0x20(r30)
/* 80058E98 00054E18  B0 DE 00 24 */	sth r6, 0x24(r30)
/* 80058E9C 00054E1C  B0 BE 00 26 */	sth r5, 0x26(r30)
/* 80058EA0 00054E20  90 9E 00 28 */	stw r4, 0x28(r30)
/* 80058EA4 00054E24  90 1E 00 2C */	stw r0, 0x2c(r30)
/* 80058EA8 00054E28  93 FE 00 30 */	stw r31, 0x30(r30)
/* 80058EAC 00054E2C  93 FE 00 34 */	stw r31, 0x34(r30)
/* 80058EB0 00054E30  93 FE 00 04 */	stw r31, 0x4(r30)
/* 80058EB4 00054E34  4B FE 04 01 */	bl DSPInit
/* 80058EB8 00054E38  7F C3 F3 78 */	mr r3, r30
/* 80058EBC 00054E3C  4B FE 05 49 */	bl DSPAddTask
/* 80058EC0 00054E40  93 ED 88 A8 */	stw r31, salDspInitIsDone@sda21(r13)
/* 80058EC4 00054E44  48 00 01 55 */	bl hwEnableIrq
.L_80058EC8:
/* 80058EC8 00054E48  80 0D 88 A8 */	lwz r0, salDspInitIsDone@sda21(r13)
/* 80058ECC 00054E4C  28 00 00 00 */	cmplwi r0, 0x0
/* 80058ED0 00054E50  41 82 FF F8 */	beq .L_80058EC8
/* 80058ED4 00054E54  48 00 01 7D */	bl hwDisableIrq
/* 80058ED8 00054E58  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80058EDC 00054E5C  38 60 00 01 */	li r3, 0x1
/* 80058EE0 00054E60  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80058EE4 00054E64  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 80058EE8 00054E68  7C 08 03 A6 */	mtlr r0
/* 80058EEC 00054E6C  38 21 00 18 */	addi r1, r1, 0x18
/* 80058EF0 00054E70  4E 80 00 20 */	blr
.endfn salInitDsp

.fn salExitDsp, global
/* 80058EF4 00054E74  7C 08 02 A6 */	mflr r0
/* 80058EF8 00054E78  90 01 00 04 */	stw r0, 0x4(r1)
/* 80058EFC 00054E7C  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80058F00 00054E80  4B FE 04 B5 */	bl DSPHalt
.L_80058F04:
/* 80058F04 00054E84  4B FE 04 F1 */	bl DSPGetDMAStatus
/* 80058F08 00054E88  28 03 00 00 */	cmplwi r3, 0x0
/* 80058F0C 00054E8C  40 82 FF F8 */	bne .L_80058F04
/* 80058F10 00054E90  4B FE 04 5D */	bl DSPReset
/* 80058F14 00054E94  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80058F18 00054E98  38 60 00 01 */	li r3, 0x1
/* 80058F1C 00054E9C  38 21 00 08 */	addi r1, r1, 0x8
/* 80058F20 00054EA0  7C 08 03 A6 */	mtlr r0
/* 80058F24 00054EA4  4E 80 00 20 */	blr
.endfn salExitDsp

.fn salCtrlDsp, global
/* 80058F28 00054EA8  7C 08 02 A6 */	mflr r0
/* 80058F2C 00054EAC  90 01 00 04 */	stw r0, 0x4(r1)
/* 80058F30 00054EB0  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80058F34 00054EB4  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80058F38 00054EB8  7C 7F 1B 78 */	mr r31, r3
/* 80058F3C 00054EBC  48 00 00 61 */	bl salGetStartDelay
/* 80058F40 00054EC0  38 83 00 00 */	addi r4, r3, 0x0
/* 80058F44 00054EC4  38 7F 00 00 */	addi r3, r31, 0x0
/* 80058F48 00054EC8  4B FF 80 C1 */	bl salBuildCommandList
/* 80058F4C 00054ECC  38 00 00 00 */	li r0, 0x0
/* 80058F50 00054ED0  83 ED 88 20 */	lwz r31, dspCmdList@sda21(r13)
/* 80058F54 00054ED4  90 0D 88 98 */	stw r0, salDspIsDone@sda21(r13)
/* 80058F58 00054ED8  4B FC E7 61 */	bl PPCSync
/* 80058F5C 00054EDC  A0 0D 88 1C */	lhz r0, dspCmdFirstSize@sda21(r13)
/* 80058F60 00054EE0  64 03 BA BE */	oris r3, r0, 0xbabe
/* 80058F64 00054EE4  4B FE 03 3D */	bl DSPSendMailToDSP
.L_80058F68:
/* 80058F68 00054EE8  4B FE 03 01 */	bl DSPCheckMailToDSP
/* 80058F6C 00054EEC  28 03 00 00 */	cmplwi r3, 0x0
/* 80058F70 00054EF0  40 82 FF F8 */	bne .L_80058F68
/* 80058F74 00054EF4  7F E3 FB 78 */	mr r3, r31
/* 80058F78 00054EF8  4B FE 03 29 */	bl DSPSendMailToDSP
.L_80058F7C:
/* 80058F7C 00054EFC  4B FE 02 ED */	bl DSPCheckMailToDSP
/* 80058F80 00054F00  28 03 00 00 */	cmplwi r3, 0x0
/* 80058F84 00054F04  40 82 FF F8 */	bne .L_80058F7C
/* 80058F88 00054F08  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80058F8C 00054F0C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80058F90 00054F10  38 21 00 18 */	addi r1, r1, 0x18
/* 80058F94 00054F14  7C 08 03 A6 */	mtlr r0
/* 80058F98 00054F18  4E 80 00 20 */	blr
.endfn salCtrlDsp

.fn salGetStartDelay, global
/* 80058F9C 00054F1C  7C 08 02 A6 */	mflr r0
/* 80058FA0 00054F20  90 01 00 04 */	stw r0, 0x4(r1)
/* 80058FA4 00054F24  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80058FA8 00054F28  4B FD 65 8D */	bl OSGetTick
/* 80058FAC 00054F2C  3C 80 80 00 */	lis r4, 0x800000F8@ha
/* 80058FB0 00054F30  80 AD 88 A4 */	lwz r5, salLastTick@sda21(r13)
/* 80058FB4 00054F34  80 04 00 F8 */	lwz r0, 0x800000F8@l(r4)
/* 80058FB8 00054F38  3C 80 43 1C */	lis r4, 0x431c
/* 80058FBC 00054F3C  7C A5 18 50 */	subf r5, r5, r3
/* 80058FC0 00054F40  54 00 F0 BE */	srwi r0, r0, 2
/* 80058FC4 00054F44  38 64 DE 83 */	addi r3, r4, -0x217d
/* 80058FC8 00054F48  7C 03 00 16 */	mulhwu r0, r3, r0
/* 80058FCC 00054F4C  54 A3 18 38 */	slwi r3, r5, 3
/* 80058FD0 00054F50  54 00 8B FE */	srwi r0, r0, 15
/* 80058FD4 00054F54  7C 63 03 96 */	divwu r3, r3, r0
/* 80058FD8 00054F58  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80058FDC 00054F5C  38 21 00 08 */	addi r1, r1, 0x8
/* 80058FE0 00054F60  7C 08 03 A6 */	mtlr r0
/* 80058FE4 00054F64  4E 80 00 20 */	blr
.endfn salGetStartDelay

.fn hwInitIrq, global
/* 80058FE8 00054F68  7C 08 02 A6 */	mflr r0
/* 80058FEC 00054F6C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80058FF0 00054F70  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80058FF4 00054F74  4B FD 1F F1 */	bl OSDisableInterrupts
/* 80058FF8 00054F78  90 6D 88 B0 */	stw r3, oldState@sda21(r13)
/* 80058FFC 00054F7C  38 00 00 01 */	li r0, 0x1
/* 80059000 00054F80  B0 0D 88 AC */	sth r0, hwIrqLevel@sda21(r13)
/* 80059004 00054F84  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80059008 00054F88  38 21 00 08 */	addi r1, r1, 0x8
/* 8005900C 00054F8C  7C 08 03 A6 */	mtlr r0
/* 80059010 00054F90  4E 80 00 20 */	blr
.endfn hwInitIrq

.fn hwExitIrq, global
/* 80059014 00054F94  4E 80 00 20 */	blr
.endfn hwExitIrq

.fn hwEnableIrq, global
/* 80059018 00054F98  7C 08 02 A6 */	mflr r0
/* 8005901C 00054F9C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80059020 00054FA0  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80059024 00054FA4  A0 6D 88 AC */	lhz r3, hwIrqLevel@sda21(r13)
/* 80059028 00054FA8  38 63 FF FF */	addi r3, r3, -0x1
/* 8005902C 00054FAC  54 60 04 3F */	clrlwi. r0, r3, 16
/* 80059030 00054FB0  B0 6D 88 AC */	sth r3, hwIrqLevel@sda21(r13)
/* 80059034 00054FB4  40 82 00 0C */	bne .L_80059040
/* 80059038 00054FB8  80 6D 88 B0 */	lwz r3, oldState@sda21(r13)
/* 8005903C 00054FBC  4B FD 1F D1 */	bl OSRestoreInterrupts
.L_80059040:
/* 80059040 00054FC0  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80059044 00054FC4  38 21 00 08 */	addi r1, r1, 0x8
/* 80059048 00054FC8  7C 08 03 A6 */	mtlr r0
/* 8005904C 00054FCC  4E 80 00 20 */	blr
.endfn hwEnableIrq

.fn hwDisableIrq, global
/* 80059050 00054FD0  7C 08 02 A6 */	mflr r0
/* 80059054 00054FD4  90 01 00 04 */	stw r0, 0x4(r1)
/* 80059058 00054FD8  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8005905C 00054FDC  A0 6D 88 AC */	lhz r3, hwIrqLevel@sda21(r13)
/* 80059060 00054FE0  38 03 00 01 */	addi r0, r3, 0x1
/* 80059064 00054FE4  28 03 00 00 */	cmplwi r3, 0x0
/* 80059068 00054FE8  B0 0D 88 AC */	sth r0, hwIrqLevel@sda21(r13)
/* 8005906C 00054FEC  40 82 00 0C */	bne .L_80059078
/* 80059070 00054FF0  4B FD 1F 75 */	bl OSDisableInterrupts
/* 80059074 00054FF4  90 6D 88 B0 */	stw r3, oldState@sda21(r13)
.L_80059078:
/* 80059078 00054FF8  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8005907C 00054FFC  38 21 00 08 */	addi r1, r1, 0x8
/* 80059080 00055000  7C 08 03 A6 */	mtlr r0
/* 80059084 00055004  4E 80 00 20 */	blr
.endfn hwDisableIrq

.fn hwIRQEnterCritical, global
/* 80059088 00055008  7C 08 02 A6 */	mflr r0
/* 8005908C 0005500C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80059090 00055010  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80059094 00055014  4B FD 1F 51 */	bl OSDisableInterrupts
/* 80059098 00055018  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8005909C 0005501C  38 21 00 08 */	addi r1, r1, 0x8
/* 800590A0 00055020  7C 08 03 A6 */	mtlr r0
/* 800590A4 00055024  4E 80 00 20 */	blr
.endfn hwIRQEnterCritical

.fn hwIRQLeaveCritical, global
/* 800590A8 00055028  7C 08 02 A6 */	mflr r0
/* 800590AC 0005502C  90 01 00 04 */	stw r0, 0x4(r1)
/* 800590B0 00055030  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 800590B4 00055034  4B FD 1F 45 */	bl OSEnableInterrupts
/* 800590B8 00055038  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800590BC 0005503C  38 21 00 08 */	addi r1, r1, 0x8
/* 800590C0 00055040  7C 08 03 A6 */	mtlr r0
/* 800590C4 00055044  4E 80 00 20 */	blr
.endfn hwIRQLeaveCritical

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80

.balign 8

.obj dsp_task, local
	.skip 0x50
.endobj dsp_task

.skip 0x10

.obj dram_image, local
	.skip 0x2000
.endobj dram_image



.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380 ; 0x000005C0

.balign 8


.obj userCallback, local
	.skip 0x4
.endobj userCallback

.obj salAIBufferBase, local
	.skip 0x4
.endobj salAIBufferBase

.obj salDspIsDone, local
	.skip 0x4
.endobj salDspIsDone

.obj salLogicIsWaiting, local
	.skip 0x4
.endobj salLogicIsWaiting

.obj salLogicActive, local
	.skip 0x4
.endobj salLogicActive

.obj salLastTick, local
	.skip 0x4
.endobj salLastTick

.obj salDspInitIsDone, local
	.skip 0x4
.endobj salDspInitIsDone

.obj hwIrqLevel, local
	.skip 0x2
.endobj hwIrqLevel

.skip 2

.obj oldState, local
	.skip 0x4
.endobj oldState

.obj salAIBufferIndex, global
	.skip 0x1
.endobj salAIBufferIndex

.skip 3

.section extab, "a"  # 0x80005520 - 0x80005BC0


.obj "@etb_80005AD8", local
.hidden "@etb_80005AD8"
	.4byte 0x00080000
	.4byte 0
.endobj "@etb_80005AD8"

.obj "@etb_80005AE0", local
.hidden "@etb_80005AE0"
	.4byte 0x08080000
	.4byte 0
.endobj "@etb_80005AE0"

.obj "@etb_80005AE8", local
.hidden "@etb_80005AE8"
	.4byte 0x10080000
	.4byte 0
.endobj "@etb_80005AE8"

.obj "@etb_80005AF0", local
.hidden "@etb_80005AF0"
	.4byte 0x00080000
	.4byte 0
.endobj "@etb_80005AF0"

.obj "@etb_80005AF8", local
.hidden "@etb_80005AF8"
	.4byte 0x00080000
	.4byte 0
.endobj "@etb_80005AF8"

.obj "@etb_80005B00", local
.hidden "@etb_80005B00"
	.4byte 0x10080000
	.4byte 0
.endobj "@etb_80005B00"

.obj "@etb_80005B08", local
.hidden "@etb_80005B08"
	.4byte 0x00080000
	.4byte 0
.endobj "@etb_80005B08"

.obj "@etb_80005B10", local
.hidden "@etb_80005B10"
	.4byte 0x08080000
	.4byte 0
.endobj "@etb_80005B10"

.obj "@etb_80005B18", local
.hidden "@etb_80005B18"
	.4byte 0x00080000
	.4byte 0
.endobj "@etb_80005B18"

.obj "@etb_80005B20", local
.hidden "@etb_80005B20"
	.4byte 0x00080000
	.4byte 0
.endobj "@etb_80005B20"

.obj "@etb_80005B28", local
.hidden "@etb_80005B28"
	.4byte 0x00080000
	.4byte 0
.endobj "@etb_80005B28"

.obj "@etb_80005B30", local
.hidden "@etb_80005B30"
	.4byte 0x00080000
	.4byte 0
.endobj "@etb_80005B30"

.obj "@etb_80005B38", local
.hidden "@etb_80005B38"
	.4byte 0x00080000
	.4byte 0
.endobj "@etb_80005B38"

.obj "@etb_80005B40", local
.hidden "@etb_80005B40"
	.4byte 0x00080000
	.4byte 0
.endobj "@etb_80005B40"

.section extabindex, "a"  # 0x80005BC0 - 0x800065A0


.obj "@eti_80006454", local
.hidden "@eti_80006454"
	.4byte salCallback
	.4byte 0x000000A4
	.4byte "@etb_80005AD8"
.endobj "@eti_80006454"

.obj "@eti_80006460", local
.hidden "@eti_80006460"
	.4byte dspResumeCallback
	.4byte 0x00000068
	.4byte "@etb_80005AE0"
.endobj "@eti_80006460"

.obj "@eti_8000646C", local
.hidden "@eti_8000646C"
	.4byte salInitAi
	.4byte 0x000000CC
	.4byte "@etb_80005AE8"
.endobj "@eti_8000646C"

.obj "@eti_80006478", local
.hidden "@eti_80006478"
	.4byte salStartAi
	.4byte 0x00000020
	.4byte "@etb_80005AF0"
.endobj "@eti_80006478"

.obj "@eti_80006484", local
.hidden "@eti_80006484"
	.4byte salExitAi
	.4byte 0x00000034
	.4byte "@etb_80005AF8"
.endobj "@eti_80006484"

.obj "@eti_80006490", local
.hidden "@eti_80006490"
	.4byte salInitDsp
	.4byte 0x000000C0
	.4byte "@etb_80005B00"
.endobj "@eti_80006490"

.obj "@eti_8000649C", local
.hidden "@eti_8000649C"
	.4byte salExitDsp
	.4byte 0x00000034
	.4byte "@etb_80005B08"
.endobj "@eti_8000649C"

.obj "@eti_800064A8", local
.hidden "@eti_800064A8"
	.4byte salCtrlDsp
	.4byte 0x00000074
	.4byte "@etb_80005B10"
.endobj "@eti_800064A8"

.obj "@eti_800064B4", local
.hidden "@eti_800064B4"
	.4byte salGetStartDelay
	.4byte 0x0000004C
	.4byte "@etb_80005B18"
.endobj "@eti_800064B4"

.obj "@eti_800064C0", local
.hidden "@eti_800064C0"
	.4byte hwInitIrq
	.4byte 0x0000002C
	.4byte "@etb_80005B20"
.endobj "@eti_800064C0"

.obj "@eti_800064CC", local
.hidden "@eti_800064CC"
	.4byte hwEnableIrq
	.4byte 0x00000038
	.4byte "@etb_80005B28"
.endobj "@eti_800064CC"

.obj "@eti_800064D8", local
.hidden "@eti_800064D8"
	.4byte hwDisableIrq
	.4byte 0x00000038
	.4byte "@etb_80005B30"
.endobj "@eti_800064D8"

.obj "@eti_800064E4", local
.hidden "@eti_800064E4"
	.4byte hwIRQEnterCritical
	.4byte 0x00000020
	.4byte "@etb_80005B38"
.endobj "@eti_800064E4"

.obj "@eti_800064F0", local
.hidden "@eti_800064F0"
	.4byte hwIRQLeaveCritical
	.4byte 0x00000020
	.4byte "@etb_80005B40"
.endobj "@eti_800064F0"
