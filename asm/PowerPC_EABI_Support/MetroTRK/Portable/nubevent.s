.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.global TRKInitializeEventQueue
TRKInitializeEventQueue:
/* 8005A8D0 00056850  7C 08 02 A6 */	mflr r0
/* 8005A8D4 00056854  3C 60 80 0A */	lis r3, gTRKEventQueue@ha
/* 8005A8D8 00056858  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005A8DC 0005685C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8005A8E0 00056860  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8005A8E4 00056864  3B E3 68 E0 */	addi r31, r3, gTRKEventQueue@l
/* 8005A8E8 00056868  38 7F 00 00 */	addi r3, r31, 0x0
/* 8005A8EC 0005686C  48 00 25 C9 */	bl TRKInitializeMutex
/* 8005A8F0 00056870  7F E3 FB 78 */	mr r3, r31
/* 8005A8F4 00056874  48 00 25 C9 */	bl TRKAcquireMutex
/* 8005A8F8 00056878  38 60 00 00 */	li r3, 0x0
/* 8005A8FC 0005687C  90 7F 00 04 */	stw r3, 0x4(r31)
/* 8005A900 00056880  38 00 01 00 */	li r0, 0x100
/* 8005A904 00056884  90 7F 00 08 */	stw r3, 0x8(r31)
/* 8005A908 00056888  7F E3 FB 78 */	mr r3, r31
/* 8005A90C 0005688C  90 1F 00 24 */	stw r0, 0x24(r31)
/* 8005A910 00056890  48 00 25 B5 */	bl TRKReleaseMutex
/* 8005A914 00056894  38 60 00 00 */	li r3, 0x0
/* 8005A918 00056898  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8005A91C 0005689C  38 21 00 10 */	addi r1, r1, 0x10
/* 8005A920 000568A0  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005A924 000568A4  7C 08 03 A6 */	mtlr r0
/* 8005A928 000568A8  4E 80 00 20 */	blr

.global TRKCopyEvent
TRKCopyEvent:
/* 8005A92C 000568AC  7C 08 02 A6 */	mflr r0
/* 8005A930 000568B0  38 A0 00 0C */	li r5, 0xc
/* 8005A934 000568B4  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005A938 000568B8  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8005A93C 000568BC  4B FA 8A 49 */	bl TRK_memcpy
/* 8005A940 000568C0  38 21 00 08 */	addi r1, r1, 0x8
/* 8005A944 000568C4  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005A948 000568C8  7C 08 03 A6 */	mtlr r0
/* 8005A94C 000568CC  4E 80 00 20 */	blr

.global TRKGetNextEvent
TRKGetNextEvent:
/* 8005A950 000568D0  7C 08 02 A6 */	mflr r0
/* 8005A954 000568D4  3C 80 80 0A */	lis r4, gTRKEventQueue@ha
/* 8005A958 000568D8  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005A95C 000568DC  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8005A960 000568E0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8005A964 000568E4  3B E4 68 E0 */	addi r31, r4, gTRKEventQueue@l
/* 8005A968 000568E8  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8005A96C 000568EC  93 A1 00 0C */	stw r29, 0xc(r1)
/* 8005A970 000568F0  3B A0 00 00 */	li r29, 0x0
/* 8005A974 000568F4  93 81 00 08 */	stw r28, 0x8(r1)
/* 8005A978 000568F8  3B 83 00 00 */	addi r28, r3, 0x0
/* 8005A97C 000568FC  38 7F 00 00 */	addi r3, r31, 0x0
/* 8005A980 00056900  48 00 25 3D */	bl TRKAcquireMutex
/* 8005A984 00056904  3B DF 00 04 */	addi r30, r31, 0x4
/* 8005A988 00056908  80 1F 00 04 */	lwz r0, 0x4(r31)
/* 8005A98C 0005690C  2C 00 00 00 */	cmpwi r0, 0x0
/* 8005A990 00056910  40 81 00 50 */	ble .L_8005A9E0
/* 8005A994 00056914  3B BF 00 08 */	addi r29, r31, 0x8
/* 8005A998 00056918  80 1F 00 08 */	lwz r0, 0x8(r31)
/* 8005A99C 0005691C  38 7C 00 00 */	addi r3, r28, 0x0
/* 8005A9A0 00056920  1C 00 00 0C */	mulli r0, r0, 0xc
/* 8005A9A4 00056924  7C 9F 02 14 */	add r4, r31, r0
/* 8005A9A8 00056928  38 84 00 0C */	addi r4, r4, 0xc
/* 8005A9AC 0005692C  4B FF FF 81 */	bl TRKCopyEvent
/* 8005A9B0 00056930  80 7E 00 00 */	lwz r3, 0x0(r30)
/* 8005A9B4 00056934  38 03 FF FF */	addi r0, r3, -0x1
/* 8005A9B8 00056938  90 1E 00 00 */	stw r0, 0x0(r30)
/* 8005A9BC 0005693C  80 7D 00 00 */	lwz r3, 0x0(r29)
/* 8005A9C0 00056940  38 03 00 01 */	addi r0, r3, 0x1
/* 8005A9C4 00056944  90 1D 00 00 */	stw r0, 0x0(r29)
/* 8005A9C8 00056948  80 1D 00 00 */	lwz r0, 0x0(r29)
/* 8005A9CC 0005694C  2C 00 00 02 */	cmpwi r0, 0x2
/* 8005A9D0 00056950  40 82 00 0C */	bne .L_8005A9DC
/* 8005A9D4 00056954  38 00 00 00 */	li r0, 0x0
/* 8005A9D8 00056958  90 1D 00 00 */	stw r0, 0x0(r29)
.L_8005A9DC:
/* 8005A9DC 0005695C  3B A0 00 01 */	li r29, 0x1
.L_8005A9E0:
/* 8005A9E0 00056960  3C 60 80 0A */	lis r3, gTRKEventQueue@ha
/* 8005A9E4 00056964  38 63 68 E0 */	addi r3, r3, gTRKEventQueue@l
/* 8005A9E8 00056968  48 00 24 DD */	bl TRKReleaseMutex
/* 8005A9EC 0005696C  7F A3 EB 78 */	mr r3, r29
/* 8005A9F0 00056970  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8005A9F4 00056974  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8005A9F8 00056978  83 A1 00 0C */	lwz r29, 0xc(r1)
/* 8005A9FC 0005697C  83 81 00 08 */	lwz r28, 0x8(r1)
/* 8005AA00 00056980  38 21 00 18 */	addi r1, r1, 0x18
/* 8005AA04 00056984  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005AA08 00056988  7C 08 03 A6 */	mtlr r0
/* 8005AA0C 0005698C  4E 80 00 20 */	blr

.global TRKPostEvent
TRKPostEvent:
/* 8005AA10 00056990  7C 08 02 A6 */	mflr r0
/* 8005AA14 00056994  3C 80 80 0A */	lis r4, gTRKEventQueue@ha
/* 8005AA18 00056998  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005AA1C 0005699C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8005AA20 000569A0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8005AA24 000569A4  3B E3 00 00 */	addi r31, r3, 0x0
/* 8005AA28 000569A8  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8005AA2C 000569AC  3B C4 68 E0 */	addi r30, r4, gTRKEventQueue@l
/* 8005AA30 000569B0  38 7E 00 00 */	addi r3, r30, 0x0
/* 8005AA34 000569B4  93 A1 00 0C */	stw r29, 0xc(r1)
/* 8005AA38 000569B8  93 81 00 08 */	stw r28, 0x8(r1)
/* 8005AA3C 000569BC  3B 80 00 00 */	li r28, 0x0
/* 8005AA40 000569C0  48 00 24 7D */	bl TRKAcquireMutex
/* 8005AA44 000569C4  3B BE 00 04 */	addi r29, r30, 0x4
/* 8005AA48 000569C8  80 7E 00 04 */	lwz r3, 0x4(r30)
/* 8005AA4C 000569CC  2C 03 00 02 */	cmpwi r3, 0x2
/* 8005AA50 000569D0  40 82 00 0C */	bne .L_8005AA5C
/* 8005AA54 000569D4  3B 80 01 00 */	li r28, 0x100
/* 8005AA58 000569D8  48 00 00 68 */	b .L_8005AAC0
.L_8005AA5C:
/* 8005AA5C 000569DC  80 1E 00 08 */	lwz r0, 0x8(r30)
/* 8005AA60 000569E0  38 9F 00 00 */	addi r4, r31, 0x0
/* 8005AA64 000569E4  7C 00 1A 14 */	add r0, r0, r3
/* 8005AA68 000569E8  7C 03 0E 70 */	srawi r3, r0, 1
/* 8005AA6C 000569EC  7C 63 01 94 */	addze r3, r3
/* 8005AA70 000569F0  54 63 08 3C */	slwi r3, r3, 1
/* 8005AA74 000569F4  7C 63 00 10 */	subfc r3, r3, r0
/* 8005AA78 000569F8  1C 03 00 0C */	mulli r0, r3, 0xc
/* 8005AA7C 000569FC  7F FE 02 14 */	add r31, r30, r0
/* 8005AA80 00056A00  38 7F 00 0C */	addi r3, r31, 0xc
/* 8005AA84 00056A04  4B FF FE A9 */	bl TRKCopyEvent
/* 8005AA88 00056A08  38 9E 00 24 */	addi r4, r30, 0x24
/* 8005AA8C 00056A0C  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 8005AA90 00056A10  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8005AA94 00056A14  80 7E 00 24 */	lwz r3, 0x24(r30)
/* 8005AA98 00056A18  38 03 00 01 */	addi r0, r3, 0x1
/* 8005AA9C 00056A1C  90 1E 00 24 */	stw r0, 0x24(r30)
/* 8005AAA0 00056A20  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 8005AAA4 00056A24  28 00 01 00 */	cmplwi r0, 0x100
/* 8005AAA8 00056A28  40 80 00 0C */	bge .L_8005AAB4
/* 8005AAAC 00056A2C  38 00 01 00 */	li r0, 0x100
/* 8005AAB0 00056A30  90 04 00 00 */	stw r0, 0x0(r4)
.L_8005AAB4:
/* 8005AAB4 00056A34  80 7D 00 00 */	lwz r3, 0x0(r29)
/* 8005AAB8 00056A38  38 03 00 01 */	addi r0, r3, 0x1
/* 8005AABC 00056A3C  90 1D 00 00 */	stw r0, 0x0(r29)
.L_8005AAC0:
/* 8005AAC0 00056A40  3C 60 80 0A */	lis r3, gTRKEventQueue@ha
/* 8005AAC4 00056A44  38 63 68 E0 */	addi r3, r3, gTRKEventQueue@l
/* 8005AAC8 00056A48  48 00 23 FD */	bl TRKReleaseMutex
/* 8005AACC 00056A4C  7F 83 E3 78 */	mr r3, r28
/* 8005AAD0 00056A50  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8005AAD4 00056A54  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8005AAD8 00056A58  83 A1 00 0C */	lwz r29, 0xc(r1)
/* 8005AADC 00056A5C  83 81 00 08 */	lwz r28, 0x8(r1)
/* 8005AAE0 00056A60  38 21 00 18 */	addi r1, r1, 0x18
/* 8005AAE4 00056A64  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005AAE8 00056A68  7C 08 03 A6 */	mtlr r0
/* 8005AAEC 00056A6C  4E 80 00 20 */	blr

.global TRKConstructEvent
TRKConstructEvent:
/* 8005AAF0 00056A70  98 83 00 00 */	stb r4, 0x0(r3)
/* 8005AAF4 00056A74  38 80 00 00 */	li r4, 0x0
/* 8005AAF8 00056A78  38 00 FF FF */	li r0, -0x1
/* 8005AAFC 00056A7C  90 83 00 04 */	stw r4, 0x4(r3)
/* 8005AB00 00056A80  90 03 00 08 */	stw r0, 0x8(r3)
/* 8005AB04 00056A84  4E 80 00 20 */	blr

.global TRKDestructEvent
TRKDestructEvent:
/* 8005AB08 00056A88  7C 08 02 A6 */	mflr r0
/* 8005AB0C 00056A8C  90 01 00 04 */	stw r0, 0x4(r1)
/* 8005AB10 00056A90  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8005AB14 00056A94  80 63 00 08 */	lwz r3, 0x8(r3)
/* 8005AB18 00056A98  48 00 03 19 */	bl TRKReleaseBuffer
/* 8005AB1C 00056A9C  38 21 00 08 */	addi r1, r1, 0x8
/* 8005AB20 00056AA0  80 01 00 04 */	lwz r0, 0x4(r1)
/* 8005AB24 00056AA4  7C 08 03 A6 */	mtlr r0
/* 8005AB28 00056AA8  4E 80 00 20 */	blr

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80

.global gTRKEventQueue
gTRKEventQueue:
	.skip 0x28