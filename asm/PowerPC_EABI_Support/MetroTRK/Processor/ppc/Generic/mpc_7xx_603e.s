.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn TRKSaveExtended1Block, global
/* 8005E8BC 0005A83C  3C 40 80 0A */	lis r2, gTRKCPUState@h
/* 8005E8C0 0005A840  60 42 84 30 */	ori r2, r2, gTRKCPUState@l
/* 8005E8C4 0005A844  7E 00 04 A6 */	mfsr r16, 0
/* 8005E8C8 0005A848  7E 21 04 A6 */	mfsr r17, 1
/* 8005E8CC 0005A84C  7E 42 04 A6 */	mfsr r18, 2
/* 8005E8D0 0005A850  7E 63 04 A6 */	mfsr r19, 3
/* 8005E8D4 0005A854  7E 84 04 A6 */	mfsr r20, 4
/* 8005E8D8 0005A858  7E A5 04 A6 */	mfsr r21, 5
/* 8005E8DC 0005A85C  7E C6 04 A6 */	mfsr r22, 6
/* 8005E8E0 0005A860  7E E7 04 A6 */	mfsr r23, 7
/* 8005E8E4 0005A864  7F 08 04 A6 */	mfsr r24, 8
/* 8005E8E8 0005A868  7F 29 04 A6 */	mfsr r25, 9
/* 8005E8EC 0005A86C  7F 4A 04 A6 */	mfsr r26, 10
/* 8005E8F0 0005A870  7F 6B 04 A6 */	mfsr r27, 11
/* 8005E8F4 0005A874  7F 8C 04 A6 */	mfsr r28, 12
/* 8005E8F8 0005A878  7F AD 04 A6 */	mfsr r29, 13
/* 8005E8FC 0005A87C  7F CE 04 A6 */	mfsr r30, 14
/* 8005E900 0005A880  7F EF 04 A6 */	mfsr r31, 15
/* 8005E904 0005A884  BE 02 01 A8 */	stmw r16, 0x1a8(r2)
/* 8005E908 0005A888  7D 4C 42 E6 */	mftb r10, 268
/* 8005E90C 0005A88C  7D 6D 42 E6 */	mftb r11, 269
/* 8005E910 0005A890  7D 90 FA A6 */	mfspr r12, HID0
/* 8005E914 0005A894  7D B1 FA A6 */	mfspr r13, HID1
/* 8005E918 0005A898  7D DB 02 A6 */	mfsrr1 r14
/* 8005E91C 0005A89C  7D FF 42 A6 */	mfspr r15, PVR
/* 8005E920 0005A8A0  7E 10 82 A6 */	mfibatu r16, 0
/* 8005E924 0005A8A4  7E 31 82 A6 */	mfibatl r17, 0
/* 8005E928 0005A8A8  7E 52 82 A6 */	mfibatu r18, 1
/* 8005E92C 0005A8AC  7E 73 82 A6 */	mfibatl r19, 1
/* 8005E930 0005A8B0  7E 94 82 A6 */	mfibatu r20, 2
/* 8005E934 0005A8B4  7E B5 82 A6 */	mfibatl r21, 2
/* 8005E938 0005A8B8  7E D6 82 A6 */	mfibatu r22, 3
/* 8005E93C 0005A8BC  7E F7 82 A6 */	mfibatl r23, 3
/* 8005E940 0005A8C0  7F 18 82 A6 */	mfdbatu r24, 0
/* 8005E944 0005A8C4  7F 39 82 A6 */	mfdbatl r25, 0
/* 8005E948 0005A8C8  7F 5A 82 A6 */	mfdbatu r26, 1
/* 8005E94C 0005A8CC  7F 7B 82 A6 */	mfdbatl r27, 1
/* 8005E950 0005A8D0  7F 9C 82 A6 */	mfdbatu r28, 2
/* 8005E954 0005A8D4  7F BD 82 A6 */	mfdbatl r29, 2
/* 8005E958 0005A8D8  7F DE 82 A6 */	mfdbatu r30, 3
/* 8005E95C 0005A8DC  7F FF 82 A6 */	mfdbatl r31, 3
/* 8005E960 0005A8E0  BD 42 01 E8 */	stmw r10, 0x1e8(r2)
/* 8005E964 0005A8E4  7E D9 02 A6 */	mfsdr1 r22
/* 8005E968 0005A8E8  7E F3 02 A6 */	mfdar r23
/* 8005E96C 0005A8EC  7F 12 02 A6 */	mfdsisr r24
/* 8005E970 0005A8F0  7F 30 42 A6 */	mfsprg r25, 0
/* 8005E974 0005A8F4  7F 51 42 A6 */	mfsprg r26, 1
/* 8005E978 0005A8F8  7F 72 42 A6 */	mfsprg r27, 2
/* 8005E97C 0005A8FC  7F 93 42 A6 */	mfsprg r28, 3
/* 8005E980 0005A900  3B A0 00 00 */	li r29, 0x0
/* 8005E984 0005A904  7F D2 FA A6 */	mfspr r30, IABR
/* 8005E988 0005A908  7F FA 42 A6 */	mfear r31
/* 8005E98C 0005A90C  BE C2 02 5C */	stmw r22, 0x25c(r2)
/* 8005E990 0005A910  7E 90 E2 A6 */	mfspr r20, GQR0
/* 8005E994 0005A914  7E B1 E2 A6 */	mfspr r21, GQR1
/* 8005E998 0005A918  7E D2 E2 A6 */	mfspr r22, GQR2
/* 8005E99C 0005A91C  7E F3 E2 A6 */	mfspr r23, GQR3
/* 8005E9A0 0005A920  7F 14 E2 A6 */	mfspr r24, GQR4
/* 8005E9A4 0005A924  7F 35 E2 A6 */	mfspr r25, GQR5
/* 8005E9A8 0005A928  7F 56 E2 A6 */	mfspr r26, GQR6
/* 8005E9AC 0005A92C  7F 77 E2 A6 */	mfspr r27, GQR7
/* 8005E9B0 0005A930  7F 98 E2 A6 */	mfspr r28, HID2
/* 8005E9B4 0005A934  7F B9 E2 A6 */	mfspr r29, WPAR
/* 8005E9B8 0005A938  7F DA E2 A6 */	mfspr r30, DMA_U
/* 8005E9BC 0005A93C  7F FB E2 A6 */	mfspr r31, DMA_L
/* 8005E9C0 0005A940  BE 82 02 FC */	stmw r20, 0x2fc(r2)
/* 8005E9C4 0005A944  48 00 00 48 */	b .L_8005EA0C
/* 8005E9C8 0005A948  7E 00 EA A6 */	mfspr r16, 928
/* 8005E9CC 0005A94C  7E 27 EA A6 */	mfspr r17, 935
/* 8005E9D0 0005A950  7E 48 EA A6 */	mfspr r18, UMMCR0
/* 8005E9D4 0005A954  7E 69 EA A6 */	mfspr r19, UPMC1
/* 8005E9D8 0005A958  7E 8A EA A6 */	mfspr r20, UPMC2
/* 8005E9DC 0005A95C  7E AB EA A6 */	mfspr r21, USIA
/* 8005E9E0 0005A960  7E CC EA A6 */	mfspr r22, UMMCR1
/* 8005E9E4 0005A964  7E ED EA A6 */	mfspr r23, UPMC3
/* 8005E9E8 0005A968  7F 0E EA A6 */	mfspr r24, UPMC4
/* 8005E9EC 0005A96C  7F 2F EA A6 */	mfspr r25, USDA
/* 8005E9F0 0005A970  7F 50 EA A6 */	mfspr r26, 944
/* 8005E9F4 0005A974  7F 77 EA A6 */	mfspr r27, 951
/* 8005E9F8 0005A978  7F 9F EA A6 */	mfspr r28, SDA
/* 8005E9FC 0005A97C  7F B6 FA A6 */	mfspr r29, 1014
/* 8005EA00 0005A980  7F D7 FA A6 */	mfspr r30, 1015
/* 8005EA04 0005A984  7F FF FA A6 */	mfspr r31, 1023
/* 8005EA08 0005A988  BE 02 02 B8 */	stmw r16, 0x2b8(r2)
.L_8005EA0C:
/* 8005EA0C 0005A98C  7E 75 FA A6 */	mfspr r19, DABR
/* 8005EA10 0005A990  7E 99 EA A6 */	mfspr r20, PMC1
/* 8005EA14 0005A994  7E BA EA A6 */	mfspr r21, PMC2
/* 8005EA18 0005A998  7E DD EA A6 */	mfspr r22, PMC3
/* 8005EA1C 0005A99C  7E FE EA A6 */	mfspr r23, PMC4
/* 8005EA20 0005A9A0  7F 1B EA A6 */	mfspr r24, SIA
/* 8005EA24 0005A9A4  7F 38 EA A6 */	mfspr r25, MMCR0
/* 8005EA28 0005A9A8  7F 5C EA A6 */	mfspr r26, MMCR1
/* 8005EA2C 0005A9AC  7F 7C FA A6 */	mfspr r27, THRM1
/* 8005EA30 0005A9B0  7F 9D FA A6 */	mfspr r28, THRM2
/* 8005EA34 0005A9B4  7F BE FA A6 */	mfspr r29, THRM3
/* 8005EA38 0005A9B8  7F DB FA A6 */	mfspr r30, ICTC
/* 8005EA3C 0005A9BC  7F F9 FA A6 */	mfspr r31, L2CR
/* 8005EA40 0005A9C0  BE 62 02 84 */	stmw r19, 0x284(r2)
/* 8005EA44 0005A9C4  48 00 00 2C */	b .L_8005EA70
/* 8005EA48 0005A9C8  7F 30 F2 A6 */	mfspr r25, 976
/* 8005EA4C 0005A9CC  7F 51 F2 A6 */	mfspr r26, 977
/* 8005EA50 0005A9D0  7F 72 F2 A6 */	mfspr r27, 978
/* 8005EA54 0005A9D4  7F 93 F2 A6 */	mfspr r28, 979
/* 8005EA58 0005A9D8  7F B4 F2 A6 */	mfspr r29, 980
/* 8005EA5C 0005A9DC  7F D5 F2 A6 */	mfspr r30, 981
/* 8005EA60 0005A9E0  7F F6 F2 A6 */	mfspr r31, 982
/* 8005EA64 0005A9E4  BF 22 02 40 */	stmw r25, 0x240(r2)
/* 8005EA68 0005A9E8  7F F6 02 A6 */	mfdec r31
/* 8005EA6C 0005A9EC  93 E2 02 78 */	stw r31, 0x278(r2)
.L_8005EA70:
/* 8005EA70 0005A9F0  4E 80 00 20 */	blr
.endfn TRKSaveExtended1Block

.fn TRKRestoreExtended1Block, global
/* 8005EA74 0005A9F4  3C 40 80 0A */	lis r2, gTRKCPUState@h
/* 8005EA78 0005A9F8  60 42 84 30 */	ori r2, r2, gTRKCPUState@l
/* 8005EA7C 0005A9FC  3C A0 80 06 */	lis r5, gTRKRestoreFlags@h
/* 8005EA80 0005AA00  60 A5 CE 20 */	ori r5, r5, gTRKRestoreFlags@l
/* 8005EA84 0005AA04  88 65 00 00 */	lbz r3, 0x0(r5)
/* 8005EA88 0005AA08  88 C5 00 01 */	lbz r6, 0x1(r5)
/* 8005EA8C 0005AA0C  38 00 00 00 */	li r0, 0x0
/* 8005EA90 0005AA10  98 05 00 00 */	stb r0, 0x0(r5)
/* 8005EA94 0005AA14  98 05 00 01 */	stb r0, 0x1(r5)
/* 8005EA98 0005AA18  2C 03 00 00 */	cmpwi r3, 0x0
/* 8005EA9C 0005AA1C  41 82 00 14 */	beq .L_8005EAB0
/* 8005EAA0 0005AA20  83 02 01 E8 */	lwz r24, 0x1e8(r2)
/* 8005EAA4 0005AA24  83 22 01 EC */	lwz r25, 0x1ec(r2)
/* 8005EAA8 0005AA28  7F 1C 43 A6 */	mttbl r24
/* 8005EAAC 0005AA2C  7F 3D 43 A6 */	mttbu r25
.L_8005EAB0:
/* 8005EAB0 0005AA30  BA 82 02 FC */	lmw r20, 0x2fc(r2)
/* 8005EAB4 0005AA34  7E 90 E3 A6 */	mtspr GQR0, r20
/* 8005EAB8 0005AA38  7E B1 E3 A6 */	mtspr GQR1, r21
/* 8005EABC 0005AA3C  7E D2 E3 A6 */	mtspr GQR2, r22
/* 8005EAC0 0005AA40  7E F3 E3 A6 */	mtspr GQR3, r23
/* 8005EAC4 0005AA44  7F 14 E3 A6 */	mtspr GQR4, r24
/* 8005EAC8 0005AA48  7F 35 E3 A6 */	mtspr GQR5, r25
/* 8005EACC 0005AA4C  7F 56 E3 A6 */	mtspr GQR6, r26
/* 8005EAD0 0005AA50  7F 77 E3 A6 */	mtspr GQR7, r27
/* 8005EAD4 0005AA54  7F 98 E3 A6 */	mtspr HID2, r28
/* 8005EAD8 0005AA58  7F DA E3 A6 */	mtspr DMA_U, r30
/* 8005EADC 0005AA5C  7F FB E3 A6 */	mtspr DMA_L, r31
/* 8005EAE0 0005AA60  48 00 00 1C */	b .L_8005EAFC
/* 8005EAE4 0005AA64  BB 42 02 E0 */	lmw r26, 0x2e0(r2)
/* 8005EAE8 0005AA68  7F 50 EB A6 */	mtspr 944, r26
/* 8005EAEC 0005AA6C  7F 77 EB A6 */	mtspr 951, r27
/* 8005EAF0 0005AA70  7F B6 FB A6 */	mtspr 1014, r29
/* 8005EAF4 0005AA74  7F D7 FB A6 */	mtspr 1015, r30
/* 8005EAF8 0005AA78  7F FF FB A6 */	mtspr 1023, r31
.L_8005EAFC:
/* 8005EAFC 0005AA7C  BA 62 02 84 */	lmw r19, 0x284(r2)
/* 8005EB00 0005AA80  7E 75 FB A6 */	mtspr DABR, r19
/* 8005EB04 0005AA84  7E 99 EB A6 */	mtspr PMC1, r20
/* 8005EB08 0005AA88  7E BA EB A6 */	mtspr PMC2, r21
/* 8005EB0C 0005AA8C  7E DD EB A6 */	mtspr PMC3, r22
/* 8005EB10 0005AA90  7E FE EB A6 */	mtspr PMC4, r23
/* 8005EB14 0005AA94  7F 1B EB A6 */	mtspr SIA, r24
/* 8005EB18 0005AA98  7F 38 EB A6 */	mtspr MMCR0, r25
/* 8005EB1C 0005AA9C  7F 5C EB A6 */	mtspr MMCR1, r26
/* 8005EB20 0005AAA0  7F 7C FB A6 */	mtspr THRM1, r27
/* 8005EB24 0005AAA4  7F 9D FB A6 */	mtspr THRM2, r28
/* 8005EB28 0005AAA8  7F BE FB A6 */	mtspr THRM3, r29
/* 8005EB2C 0005AAAC  7F DB FB A6 */	mtspr ICTC, r30
/* 8005EB30 0005AAB0  7F F9 FB A6 */	mtspr L2CR, r31
/* 8005EB34 0005AAB4  48 00 00 34 */	b .L_8005EB68
/* 8005EB38 0005AAB8  2C 06 00 00 */	cmpwi r6, 0x0
/* 8005EB3C 0005AABC  41 82 00 0C */	beq .L_8005EB48
/* 8005EB40 0005AAC0  83 42 02 78 */	lwz r26, 0x278(r2)
/* 8005EB44 0005AAC4  7F 56 03 A6 */	mtdec r26
.L_8005EB48:
/* 8005EB48 0005AAC8  BB 22 02 40 */	lmw r25, 0x240(r2)
/* 8005EB4C 0005AACC  7F 30 F3 A6 */	mtspr 976, r25
/* 8005EB50 0005AAD0  7F 51 F3 A6 */	mtspr 977, r26
/* 8005EB54 0005AAD4  7F 72 F3 A6 */	mtspr 978, r27
/* 8005EB58 0005AAD8  7F 93 F3 A6 */	mtspr 979, r28
/* 8005EB5C 0005AADC  7F B4 F3 A6 */	mtspr 980, r29
/* 8005EB60 0005AAE0  7F D5 F3 A6 */	mtspr 981, r30
/* 8005EB64 0005AAE4  7F F6 F3 A6 */	mtspr 982, r31
.L_8005EB68:
/* 8005EB68 0005AAE8  BA 02 01 A8 */	lmw r16, 0x1a8(r2)
/* 8005EB6C 0005AAEC  7E 00 01 A4 */	mtsr 0, r16
/* 8005EB70 0005AAF0  7E 21 01 A4 */	mtsr 1, r17
/* 8005EB74 0005AAF4  7E 42 01 A4 */	mtsr 2, r18
/* 8005EB78 0005AAF8  7E 63 01 A4 */	mtsr 3, r19
/* 8005EB7C 0005AAFC  7E 84 01 A4 */	mtsr 4, r20
/* 8005EB80 0005AB00  7E A5 01 A4 */	mtsr 5, r21
/* 8005EB84 0005AB04  7E C6 01 A4 */	mtsr 6, r22
/* 8005EB88 0005AB08  7E E7 01 A4 */	mtsr 7, r23
/* 8005EB8C 0005AB0C  7F 08 01 A4 */	mtsr 8, r24
/* 8005EB90 0005AB10  7F 29 01 A4 */	mtsr 9, r25
/* 8005EB94 0005AB14  7F 4A 01 A4 */	mtsr 10, r26
/* 8005EB98 0005AB18  7F 6B 01 A4 */	mtsr 11, r27
/* 8005EB9C 0005AB1C  7F 8C 01 A4 */	mtsr 12, r28
/* 8005EBA0 0005AB20  7F AD 01 A4 */	mtsr 13, r29
/* 8005EBA4 0005AB24  7F CE 01 A4 */	mtsr 14, r30
/* 8005EBA8 0005AB28  7F EF 01 A4 */	mtsr 15, r31
/* 8005EBAC 0005AB2C  B9 82 01 F0 */	lmw r12, 0x1f0(r2)
/* 8005EBB0 0005AB30  7D 90 FB A6 */	mtspr HID0, r12
/* 8005EBB4 0005AB34  7D B1 FB A6 */	mtspr HID1, r13
/* 8005EBB8 0005AB38  7D DB 03 A6 */	mtsrr1 r14
/* 8005EBBC 0005AB3C  7D FF 43 A6 */	mtspr PVR, r15
/* 8005EBC0 0005AB40  7E 10 83 A6 */	mtibatu 0, r16
/* 8005EBC4 0005AB44  7E 31 83 A6 */	mtibatl 0, r17
/* 8005EBC8 0005AB48  7E 52 83 A6 */	mtibatu 1, r18
/* 8005EBCC 0005AB4C  7E 73 83 A6 */	mtibatl 1, r19
/* 8005EBD0 0005AB50  7E 94 83 A6 */	mtibatu 2, r20
/* 8005EBD4 0005AB54  7E B5 83 A6 */	mtibatl 2, r21
/* 8005EBD8 0005AB58  7E D6 83 A6 */	mtibatu 3, r22
/* 8005EBDC 0005AB5C  7E F7 83 A6 */	mtibatl 3, r23
/* 8005EBE0 0005AB60  7F 18 83 A6 */	mtdbatu 0, r24
/* 8005EBE4 0005AB64  7F 39 83 A6 */	mtdbatl 0, r25
/* 8005EBE8 0005AB68  7F 5A 83 A6 */	mtdbatu 1, r26
/* 8005EBEC 0005AB6C  7F 7B 83 A6 */	mtdbatl 1, r27
/* 8005EBF0 0005AB70  7F 9C 83 A6 */	mtdbatu 2, r28
/* 8005EBF4 0005AB74  7F BD 83 A6 */	mtdbatl 2, r29
/* 8005EBF8 0005AB78  7F DE 83 A6 */	mtdbatu 3, r30
/* 8005EBFC 0005AB7C  7F FF 83 A6 */	mtdbatl 3, r31
/* 8005EC00 0005AB80  BA C2 02 5C */	lmw r22, 0x25c(r2)
/* 8005EC04 0005AB84  7E D9 03 A6 */	mtsdr1 r22
/* 8005EC08 0005AB88  7E F3 03 A6 */	mtdar r23
/* 8005EC0C 0005AB8C  7F 12 03 A6 */	mtdsisr r24
/* 8005EC10 0005AB90  7F 30 43 A6 */	mtsprg 0, r25
/* 8005EC14 0005AB94  7F 51 43 A6 */	mtsprg 1, r26
/* 8005EC18 0005AB98  7F 72 43 A6 */	mtsprg 2, r27
/* 8005EC1C 0005AB9C  7F 93 43 A6 */	mtsprg 3, r28
/* 8005EC20 0005ABA0  7F D2 FB A6 */	mtspr IABR, r30
/* 8005EC24 0005ABA4  7F FA 43 A6 */	mtear r31
/* 8005EC28 0005ABA8  4E 80 00 20 */	blr
.endfn TRKRestoreExtended1Block

.fn TRKTargetCPUMinorType, global
/* 8005EC2C 0005ABAC  38 60 00 54 */	li r3, 0x54
/* 8005EC30 0005ABB0  4E 80 00 20 */	blr
.endfn TRKTargetCPUMinorType
