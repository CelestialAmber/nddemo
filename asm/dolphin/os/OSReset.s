.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn OSRegisterResetFunction, global
/* 8002BC18 00027B98  80 AD 84 98 */	lwz r5, ResetFunctionQueue@sda21(r13)
/* 8002BC1C 00027B9C  48 00 00 08 */	b .L_8002BC24
.L_8002BC20:
/* 8002BC20 00027BA0  80 A5 00 08 */	lwz r5, 0x8(r5)
.L_8002BC24:
/* 8002BC24 00027BA4  28 05 00 00 */	cmplwi r5, 0x0
/* 8002BC28 00027BA8  41 82 00 14 */	beq .L_8002BC3C
/* 8002BC2C 00027BAC  80 85 00 04 */	lwz r4, 0x4(r5)
/* 8002BC30 00027BB0  80 03 00 04 */	lwz r0, 0x81300004@l(r3)
/* 8002BC34 00027BB4  7C 04 00 40 */	cmplw r4, r0
/* 8002BC38 00027BB8  40 81 FF E8 */	ble .L_8002BC20
.L_8002BC3C:
/* 8002BC3C 00027BBC  28 05 00 00 */	cmplwi r5, 0x0
/* 8002BC40 00027BC0  40 82 00 34 */	bne .L_8002BC74
/* 8002BC44 00027BC4  38 AD 84 98 */	addi r5, r13, ResetFunctionQueue@sda21
/* 8002BC48 00027BC8  84 85 00 04 */	lwzu r4, 0x4(r5)
/* 8002BC4C 00027BCC  28 04 00 00 */	cmplwi r4, 0x0
/* 8002BC50 00027BD0  40 82 00 0C */	bne .L_8002BC5C
/* 8002BC54 00027BD4  90 6D 84 98 */	stw r3, ResetFunctionQueue@sda21(r13)
/* 8002BC58 00027BD8  48 00 00 08 */	b .L_8002BC60
.L_8002BC5C:
/* 8002BC5C 00027BDC  90 64 00 08 */	stw r3, 0x8(r4)
.L_8002BC60:
/* 8002BC60 00027BE0  90 83 00 0C */	stw r4, 0xc(r3)
/* 8002BC64 00027BE4  38 00 00 00 */	li r0, 0x0
/* 8002BC68 00027BE8  90 03 00 08 */	stw r0, 0x8(r3)
/* 8002BC6C 00027BEC  90 65 00 00 */	stw r3, 0x0(r5)
/* 8002BC70 00027BF0  4E 80 00 20 */	blr
.L_8002BC74:
/* 8002BC74 00027BF4  90 A3 00 08 */	stw r5, 0x8(r3)
/* 8002BC78 00027BF8  80 85 00 0C */	lwz r4, 0xc(r5)
/* 8002BC7C 00027BFC  90 65 00 0C */	stw r3, 0xc(r5)
/* 8002BC80 00027C00  28 04 00 00 */	cmplwi r4, 0x0
/* 8002BC84 00027C04  90 83 00 0C */	stw r4, 0xc(r3)
/* 8002BC88 00027C08  40 82 00 0C */	bne .L_8002BC94
/* 8002BC8C 00027C0C  90 6D 84 98 */	stw r3, ResetFunctionQueue@sda21(r13)
/* 8002BC90 00027C10  4E 80 00 20 */	blr
.L_8002BC94:
/* 8002BC94 00027C14  90 64 00 08 */	stw r3, 0x8(r4)
/* 8002BC98 00027C18  4E 80 00 20 */	blr
.endfn OSRegisterResetFunction

.fn Reset, local
/* 8002BC9C 00027C1C  48 00 00 20 */	b .L_8002BCBC
.L_8002BCA0:
/* 8002BCA0 00027C20  7D 10 FA A6 */	mfspr r8, HID0
/* 8002BCA4 00027C24  61 08 00 08 */	ori r8, r8, 0x8
/* 8002BCA8 00027C28  7D 10 FB A6 */	mtspr HID0, r8
/* 8002BCAC 00027C2C  4C 00 01 2C */	isync
/* 8002BCB0 00027C30  7C 00 04 AC */	sync
/* 8002BCB4 00027C34  60 00 00 00 */	nop
/* 8002BCB8 00027C38  48 00 00 08 */	b .L_8002BCC0
.L_8002BCBC:
/* 8002BCBC 00027C3C  48 00 00 20 */	b .L_8002BCDC
.L_8002BCC0:
/* 8002BCC0 00027C40  7C AC 42 E6 */	mftb r5, 268
.L_8002BCC4:
/* 8002BCC4 00027C44  7C CC 42 E6 */	mftb r6, 268
/* 8002BCC8 00027C48  7C E5 30 50 */	subf r7, r5, r6
/* 8002BCCC 00027C4C  28 07 11 24 */	cmplwi r7, 0x1124
/* 8002BCD0 00027C50  41 80 FF F4 */	blt .L_8002BCC4
/* 8002BCD4 00027C54  60 00 00 00 */	nop
/* 8002BCD8 00027C58  48 00 00 08 */	b .L_8002BCE0
.L_8002BCDC:
/* 8002BCDC 00027C5C  48 00 00 20 */	b .L_8002BCFC
.L_8002BCE0:
/* 8002BCE0 00027C60  3D 00 CC 00 */	lis r8, 0xCC003000@h
/* 8002BCE4 00027C64  61 08 30 00 */	ori r8, r8, 0xCC003000@l
/* 8002BCE8 00027C68  38 80 00 03 */	li r4, 0x3
/* 8002BCEC 00027C6C  90 88 00 24 */	stw r4, 0x24(r8)
/* 8002BCF0 00027C70  90 68 00 24 */	stw r3, 0x24(r8)
/* 8002BCF4 00027C74  60 00 00 00 */	nop
/* 8002BCF8 00027C78  48 00 00 08 */	b .L_8002BD00
.L_8002BCFC:
/* 8002BCFC 00027C7C  48 00 00 0C */	b .L_8002BD08
.L_8002BD00:
/* 8002BD00 00027C80  60 00 00 00 */	nop
/* 8002BD04 00027C84  4B FF FF FC */	b .L_8002BD00
.L_8002BD08:
/* 8002BD08 00027C88  4B FF FF 98 */	b .L_8002BCA0
.endfn Reset

.fn __OSDoHotReset, global
/* 8002BD0C 00027C8C  7C 08 02 A6 */	mflr r0
/* 8002BD10 00027C90  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002BD14 00027C94  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8002BD18 00027C98  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8002BD1C 00027C9C  7C 7F 1B 78 */	mr r31, r3
/* 8002BD20 00027CA0  4B FF F2 C5 */	bl OSDisableInterrupts
/* 8002BD24 00027CA4  3C 60 CC 00 */	lis r3, 0xCC002000@ha
/* 8002BD28 00027CA8  38 63 20 00 */	addi r3, r3, 0xCC002000@l
/* 8002BD2C 00027CAC  38 00 00 00 */	li r0, 0x0
/* 8002BD30 00027CB0  B0 03 00 02 */	sth r0, 0x2(r3)
/* 8002BD34 00027CB4  4B FF D3 11 */	bl ICFlashInvalidate
/* 8002BD38 00027CB8  57 E3 18 38 */	slwi r3, r31, 3
/* 8002BD3C 00027CBC  4B FF FF 61 */	bl Reset
/* 8002BD40 00027CC0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8002BD44 00027CC4  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8002BD48 00027CC8  38 21 00 18 */	addi r1, r1, 0x18
/* 8002BD4C 00027CCC  7C 08 03 A6 */	mtlr r0
/* 8002BD50 00027CD0  4E 80 00 20 */	blr
.endfn __OSDoHotReset

.fn OSResetSystem, global
/* 8002BD54 00027CD4  7C 08 02 A6 */	mflr r0
/* 8002BD58 00027CD8  90 01 00 04 */	stw r0, 0x4(r1)
/* 8002BD5C 00027CDC  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 8002BD60 00027CE0  BF 41 00 20 */	stmw r26, 0x20(r1)
/* 8002BD64 00027CE4  7C 7A 1B 78 */	mr r26, r3
/* 8002BD68 00027CE8  7C 9E 23 78 */	mr r30, r4
/* 8002BD6C 00027CEC  7C BF 2B 78 */	mr r31, r5
/* 8002BD70 00027CF0  48 00 28 29 */	bl OSDisableScheduler
/* 8002BD74 00027CF4  4B FF D0 B5 */	bl __OSStopAudioSystem
/* 8002BD78 00027CF8  48 00 00 04 */	b .L_8002BD7C
.L_8002BD7C:
/* 8002BD7C 00027CFC  48 00 00 04 */	b .L_8002BD80
.L_8002BD80:
/* 8002BD80 00027D00  83 8D 84 98 */	lwz r28, ResetFunctionQueue@sda21(r13)
/* 8002BD84 00027D04  3B A0 00 00 */	li r29, 0x0
/* 8002BD88 00027D08  48 00 00 04 */	b .L_8002BD8C
.L_8002BD8C:
/* 8002BD8C 00027D0C  48 00 00 04 */	b .L_8002BD90
.L_8002BD90:
/* 8002BD90 00027D10  48 00 00 24 */	b .L_8002BDB4
.L_8002BD94:
/* 8002BD94 00027D14  38 60 00 00 */	li r3, 0x0
/* 8002BD98 00027D18  81 9C 00 00 */	lwz r12, 0x0(r28)
/* 8002BD9C 00027D1C  7D 88 03 A6 */	mtlr r12
/* 8002BDA0 00027D20  4E 80 00 21 */	blrl
/* 8002BDA4 00027D24  7C 60 00 34 */	cntlzw r0, r3
/* 8002BDA8 00027D28  83 9C 00 08 */	lwz r28, 0x8(r28)
/* 8002BDAC 00027D2C  54 00 D9 7E */	srwi r0, r0, 5
/* 8002BDB0 00027D30  7F BD 03 78 */	or r29, r29, r0
.L_8002BDB4:
/* 8002BDB4 00027D34  28 1C 00 00 */	cmplwi r28, 0x0
/* 8002BDB8 00027D38  40 82 FF DC */	bne .L_8002BD94
/* 8002BDBC 00027D3C  48 00 0B F1 */	bl __OSSyncSram
/* 8002BDC0 00027D40  7C 60 00 34 */	cntlzw r0, r3
/* 8002BDC4 00027D44  54 00 D9 7E */	srwi r0, r0, 5
/* 8002BDC8 00027D48  7F BD 03 78 */	or r29, r29, r0
/* 8002BDCC 00027D4C  2C 1D 00 00 */	cmpwi r29, 0x0
/* 8002BDD0 00027D50  41 82 00 0C */	beq .L_8002BDDC
/* 8002BDD4 00027D54  38 00 00 00 */	li r0, 0x0
/* 8002BDD8 00027D58  48 00 00 08 */	b .L_8002BDE0
.L_8002BDDC:
/* 8002BDDC 00027D5C  38 00 00 01 */	li r0, 0x1
.L_8002BDE0:
/* 8002BDE0 00027D60  2C 00 00 00 */	cmpwi r0, 0x0
/* 8002BDE4 00027D64  41 82 FF 9C */	beq .L_8002BD80
/* 8002BDE8 00027D68  2C 1A 00 00 */	cmpwi r26, 0x0
/* 8002BDEC 00027D6C  41 82 00 38 */	beq .L_8002BE24
/* 8002BDF0 00027D70  2C 1F 00 00 */	cmpwi r31, 0x0
/* 8002BDF4 00027D74  41 82 00 30 */	beq .L_8002BE24
/* 8002BDF8 00027D78  48 00 07 AD */	bl __OSLockSram
/* 8002BDFC 00027D7C  88 03 00 13 */	lbz r0, 0x13(r3)
/* 8002BE00 00027D80  60 00 00 40 */	ori r0, r0, 0x40
/* 8002BE04 00027D84  98 03 00 13 */	stb r0, 0x13(r3)
/* 8002BE08 00027D88  38 60 00 01 */	li r3, 0x1
/* 8002BE0C 00027D8C  48 00 0B 59 */	bl __OSUnlockSram
/* 8002BE10 00027D90  48 00 00 04 */	b .L_8002BE14
.L_8002BE14:
/* 8002BE14 00027D94  48 00 00 04 */	b .L_8002BE18
.L_8002BE18:
/* 8002BE18 00027D98  48 00 0B 95 */	bl __OSSyncSram
/* 8002BE1C 00027D9C  2C 03 00 00 */	cmpwi r3, 0x0
/* 8002BE20 00027DA0  41 82 FF F8 */	beq .L_8002BE18
.L_8002BE24:
/* 8002BE24 00027DA4  4B FF F1 C1 */	bl OSDisableInterrupts
/* 8002BE28 00027DA8  83 AD 84 98 */	lwz r29, ResetFunctionQueue@sda21(r13)
/* 8002BE2C 00027DAC  7C 7B 1B 78 */	mr r27, r3
/* 8002BE30 00027DB0  3B 80 00 00 */	li r28, 0x0
/* 8002BE34 00027DB4  48 00 00 04 */	b .L_8002BE38
.L_8002BE38:
/* 8002BE38 00027DB8  48 00 00 04 */	b .L_8002BE3C
.L_8002BE3C:
/* 8002BE3C 00027DBC  48 00 00 24 */	b .L_8002BE60
.L_8002BE40:
/* 8002BE40 00027DC0  38 60 00 01 */	li r3, 0x1
/* 8002BE44 00027DC4  81 9D 00 00 */	lwz r12, 0x0(r29)
/* 8002BE48 00027DC8  7D 88 03 A6 */	mtlr r12
/* 8002BE4C 00027DCC  4E 80 00 21 */	blrl
/* 8002BE50 00027DD0  7C 60 00 34 */	cntlzw r0, r3
/* 8002BE54 00027DD4  83 BD 00 08 */	lwz r29, 0x8(r29)
/* 8002BE58 00027DD8  54 00 D9 7E */	srwi r0, r0, 5
/* 8002BE5C 00027DDC  7F 9C 03 78 */	or r28, r28, r0
.L_8002BE60:
/* 8002BE60 00027DE0  28 1D 00 00 */	cmplwi r29, 0x0
/* 8002BE64 00027DE4  40 82 FF DC */	bne .L_8002BE40
/* 8002BE68 00027DE8  48 00 0B 45 */	bl __OSSyncSram
/* 8002BE6C 00027DEC  4B FF D1 FD */	bl LCDisable
/* 8002BE70 00027DF0  2C 1A 00 01 */	cmpwi r26, 0x1
/* 8002BE74 00027DF4  40 82 00 28 */	bne .L_8002BE9C
/* 8002BE78 00027DF8  4B FF F1 6D */	bl OSDisableInterrupts
/* 8002BE7C 00027DFC  3C 60 CC 00 */	lis r3, 0xCC002000@ha
/* 8002BE80 00027E00  38 63 20 00 */	addi r3, r3, 0xCC002000@l
/* 8002BE84 00027E04  38 00 00 00 */	li r0, 0x0
/* 8002BE88 00027E08  B0 03 00 02 */	sth r0, 0x2(r3)
/* 8002BE8C 00027E0C  4B FF D1 B9 */	bl ICFlashInvalidate
/* 8002BE90 00027E10  57 C3 18 38 */	slwi r3, r30, 3
/* 8002BE94 00027E14  4B FF FE 09 */	bl Reset
/* 8002BE98 00027E18  48 00 00 58 */	b .L_8002BEF0
.L_8002BE9C:
/* 8002BE9C 00027E1C  3C 60 80 00 */	lis r3, 0x800000DC@ha
/* 8002BEA0 00027E20  80 63 00 DC */	lwz r3, 0x800000DC@l(r3)
/* 8002BEA4 00027E24  48 00 00 04 */	b .L_8002BEA8
.L_8002BEA8:
/* 8002BEA8 00027E28  48 00 00 04 */	b .L_8002BEAC
.L_8002BEAC:
/* 8002BEAC 00027E2C  48 00 00 2C */	b .L_8002BED8
.L_8002BEB0:
/* 8002BEB0 00027E30  A0 03 02 C8 */	lhz r0, 0x2c8(r3)
/* 8002BEB4 00027E34  83 83 02 FC */	lwz r28, 0x2fc(r3)
/* 8002BEB8 00027E38  2C 00 00 04 */	cmpwi r0, 0x4
/* 8002BEBC 00027E3C  41 82 00 14 */	beq .L_8002BED0
/* 8002BEC0 00027E40  40 80 00 14 */	bge .L_8002BED4
/* 8002BEC4 00027E44  2C 00 00 01 */	cmpwi r0, 0x1
/* 8002BEC8 00027E48  41 82 00 08 */	beq .L_8002BED0
/* 8002BECC 00027E4C  48 00 00 08 */	b .L_8002BED4
.L_8002BED0:
/* 8002BED0 00027E50  48 00 2D E1 */	bl OSCancelThread
.L_8002BED4:
/* 8002BED4 00027E54  7F 83 E3 78 */	mr r3, r28
.L_8002BED8:
/* 8002BED8 00027E58  28 03 00 00 */	cmplwi r3, 0x0
/* 8002BEDC 00027E5C  40 82 FF D4 */	bne .L_8002BEB0
/* 8002BEE0 00027E60  48 00 26 F9 */	bl OSEnableScheduler
/* 8002BEE4 00027E64  7F C3 F3 78 */	mr r3, r30
/* 8002BEE8 00027E68  7F E4 FB 78 */	mr r4, r31
/* 8002BEEC 00027E6C  4B FF FB 61 */	bl __OSReboot
.L_8002BEF0:
/* 8002BEF0 00027E70  7F 63 DB 78 */	mr r3, r27
/* 8002BEF4 00027E74  4B FF F1 19 */	bl OSRestoreInterrupts
/* 8002BEF8 00027E78  48 00 26 E1 */	bl OSEnableScheduler
/* 8002BEFC 00027E7C  BB 41 00 20 */	lmw r26, 0x20(r1)
/* 8002BF00 00027E80  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 8002BF04 00027E84  38 21 00 38 */	addi r1, r1, 0x38
/* 8002BF08 00027E88  7C 08 03 A6 */	mtlr r0
/* 8002BF0C 00027E8C  4E 80 00 20 */	blr
.endfn OSResetSystem

.fn OSGetResetCode, global
/* 8002BF10 00027E90  3C 60 80 00 */	lis r3, 0x800030E2@ha
/* 8002BF14 00027E94  88 03 30 E2 */	lbz r0, 0x800030E2@l(r3)
/* 8002BF18 00027E98  28 00 00 00 */	cmplwi r0, 0x0
/* 8002BF1C 00027E9C  41 82 00 0C */	beq .L_8002BF28
/* 8002BF20 00027EA0  3C 60 80 00 */	lis r3, 0x8000
/* 8002BF24 00027EA4  48 00 00 18 */	b .L_8002BF3C
.L_8002BF28:
/* 8002BF28 00027EA8  3C 60 CC 00 */	lis r3, 0xCC003000@ha
/* 8002BF2C 00027EAC  38 63 30 00 */	addi r3, r3, 0xCC003000@l
/* 8002BF30 00027EB0  80 03 00 24 */	lwz r0, 0x24(r3)
/* 8002BF34 00027EB4  54 00 00 38 */	clrrwi r0, r0, 3
/* 8002BF38 00027EB8  54 03 E8 FE */	srwi r3, r0, 3
.L_8002BF3C:
/* 8002BF3C 00027EBC  4E 80 00 20 */	blr
.endfn OSGetResetCode

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380


.obj ResetFunctionQueue, local
	.skip 0x8
.endobj ResetFunctionQueue
