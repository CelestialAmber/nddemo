.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740



.fn dataInitStack, global
/* 80050094 0004C014  38 00 00 00 */	li r0, 0x0
/* 80050098 0004C018  B0 0D 87 F8 */	sth r0, sp@sda21(r13)
/* 8005009C 0004C01C  4E 80 00 20 */	blr
.endfn dataInitStack

.fn InsertData, local
/* 800500A0 0004C020  7C 08 02 A6 */	mflr r0
/* 800500A4 0004C024  90 01 00 04 */	stw r0, 0x4(r1)
/* 800500A8 0004C028  54 A0 06 3E */	clrlwi r0, r5, 24
/* 800500AC 0004C02C  2C 00 00 02 */	cmpwi r0, 0x2
/* 800500B0 0004C030  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 800500B4 0004C034  41 82 00 88 */	beq .L_8005013C
/* 800500B8 0004C038  40 80 00 14 */	bge .L_800500CC
/* 800500BC 0004C03C  2C 00 00 00 */	cmpwi r0, 0x0
/* 800500C0 0004C040  41 82 00 1C */	beq .L_800500DC
/* 800500C4 0004C044  40 80 01 A8 */	bge .L_8005026C
/* 800500C8 0004C048  48 00 01 B8 */	b .L_80050280
.L_800500CC:
/* 800500CC 0004C04C  2C 00 00 04 */	cmpwi r0, 0x4
/* 800500D0 0004C050  41 82 01 3C */	beq .L_8005020C
/* 800500D4 0004C054  40 80 01 AC */	bge .L_80050280
/* 800500D8 0004C058  48 00 00 C8 */	b .L_800501A0
.L_800500DC:
/* 800500DC 0004C05C  28 06 00 00 */	cmplwi r6, 0x0
/* 800500E0 0004C060  40 82 00 54 */	bne .L_80050134
/* 800500E4 0004C064  80 04 00 00 */	lwz r0, 0x0(r4)
/* 800500E8 0004C068  54 65 04 3E */	clrlwi r5, r3, 16
/* 800500EC 0004C06C  7C C4 02 14 */	add r6, r4, r0
/* 800500F0 0004C070  48 00 00 1C */	b .L_8005010C
.L_800500F4:
/* 800500F4 0004C074  A0 06 00 04 */	lhz r0, 0x4(r6)
/* 800500F8 0004C078  7C 00 28 40 */	cmplw r0, r5
/* 800500FC 0004C07C  40 82 00 08 */	bne .L_80050104
/* 80050100 0004C080  48 00 00 20 */	b .L_80050120
.L_80050104:
/* 80050104 0004C084  80 06 00 00 */	lwz r0, 0x0(r6)
/* 80050108 0004C088  7C C6 02 14 */	add r6, r6, r0
.L_8005010C:
/* 8005010C 0004C08C  80 86 00 00 */	lwz r4, 0x0(r6)
/* 80050110 0004C090  3C 04 00 01 */	addis r0, r4, 0x1
/* 80050114 0004C094  28 00 FF FF */	cmplwi r0, 0xffff
/* 80050118 0004C098  40 82 FF DC */	bne .L_800500F4
/* 8005011C 0004C09C  38 C0 00 00 */	li r6, 0x0
.L_80050120:
/* 80050120 0004C0A0  28 06 00 00 */	cmplwi r6, 0x0
/* 80050124 0004C0A4  41 82 01 5C */	beq .L_80050280
/* 80050128 0004C0A8  38 86 00 08 */	addi r4, r6, 0x8
/* 8005012C 0004C0AC  4B FF 9C 05 */	bl dataInsertMacro
/* 80050130 0004C0B0  48 00 01 50 */	b .L_80050280
.L_80050134:
/* 80050134 0004C0B4  4B FF 9F 0D */	bl dataRemoveMacro
/* 80050138 0004C0B8  48 00 01 48 */	b .L_80050280
.L_8005013C:
/* 8005013C 0004C0BC  28 06 00 00 */	cmplwi r6, 0x0
/* 80050140 0004C0C0  60 63 40 00 */	ori r3, r3, 0x4000
/* 80050144 0004C0C4  40 82 00 54 */	bne .L_80050198
/* 80050148 0004C0C8  80 04 00 08 */	lwz r0, 0x8(r4)
/* 8005014C 0004C0CC  54 65 04 3E */	clrlwi r5, r3, 16
/* 80050150 0004C0D0  7C C4 02 14 */	add r6, r4, r0
/* 80050154 0004C0D4  48 00 00 1C */	b .L_80050170
.L_80050158:
/* 80050158 0004C0D8  A0 06 00 04 */	lhz r0, 0x4(r6)
/* 8005015C 0004C0DC  7C 00 28 40 */	cmplw r0, r5
/* 80050160 0004C0E0  40 82 00 08 */	bne .L_80050168
/* 80050164 0004C0E4  48 00 00 20 */	b .L_80050184
.L_80050168:
/* 80050168 0004C0E8  80 06 00 00 */	lwz r0, 0x0(r6)
/* 8005016C 0004C0EC  7C C6 02 14 */	add r6, r6, r0
.L_80050170:
/* 80050170 0004C0F0  80 86 00 00 */	lwz r4, 0x0(r6)
/* 80050174 0004C0F4  3C 04 00 01 */	addis r0, r4, 0x1
/* 80050178 0004C0F8  28 00 FF FF */	cmplwi r0, 0xffff
/* 8005017C 0004C0FC  40 82 FF DC */	bne .L_80050158
/* 80050180 0004C100  38 C0 00 00 */	li r6, 0x0
.L_80050184:
/* 80050184 0004C104  28 06 00 00 */	cmplwi r6, 0x0
/* 80050188 0004C108  41 82 00 F8 */	beq .L_80050280
/* 8005018C 0004C10C  38 86 00 08 */	addi r4, r6, 0x8
/* 80050190 0004C110  4B FF 89 C1 */	bl dataInsertKeymap
/* 80050194 0004C114  48 00 00 EC */	b .L_80050280
.L_80050198:
/* 80050198 0004C118  4B FF 8B A9 */	bl dataRemoveKeymap
/* 8005019C 0004C11C  48 00 00 E4 */	b .L_80050280
.L_800501A0:
/* 800501A0 0004C120  28 06 00 00 */	cmplwi r6, 0x0
/* 800501A4 0004C124  60 63 80 00 */	ori r3, r3, 0x8000
/* 800501A8 0004C128  40 82 00 5C */	bne .L_80050204
/* 800501AC 0004C12C  80 04 00 0C */	lwz r0, 0xc(r4)
/* 800501B0 0004C130  54 65 04 3E */	clrlwi r5, r3, 16
/* 800501B4 0004C134  7C C4 02 14 */	add r6, r4, r0
/* 800501B8 0004C138  48 00 00 1C */	b .L_800501D4
.L_800501BC:
/* 800501BC 0004C13C  A0 06 00 04 */	lhz r0, 0x4(r6)
/* 800501C0 0004C140  7C 00 28 40 */	cmplw r0, r5
/* 800501C4 0004C144  40 82 00 08 */	bne .L_800501CC
/* 800501C8 0004C148  48 00 00 20 */	b .L_800501E8
.L_800501CC:
/* 800501CC 0004C14C  80 06 00 00 */	lwz r0, 0x0(r6)
/* 800501D0 0004C150  7C C6 02 14 */	add r6, r6, r0
.L_800501D4:
/* 800501D4 0004C154  80 86 00 00 */	lwz r4, 0x0(r6)
/* 800501D8 0004C158  3C 04 00 01 */	addis r0, r4, 0x1
/* 800501DC 0004C15C  28 00 FF FF */	cmplwi r0, 0xffff
/* 800501E0 0004C160  40 82 FF DC */	bne .L_800501BC
/* 800501E4 0004C164  38 C0 00 00 */	li r6, 0x0
.L_800501E8:
/* 800501E8 0004C168  28 06 00 00 */	cmplwi r6, 0x0
/* 800501EC 0004C16C  41 82 00 94 */	beq .L_80050280
/* 800501F0 0004C170  80 06 00 08 */	lwz r0, 0x8(r6)
/* 800501F4 0004C174  38 86 00 0C */	addi r4, r6, 0xc
/* 800501F8 0004C178  54 05 04 3E */	clrlwi r5, r0, 16
/* 800501FC 0004C17C  4B FF 8C C9 */	bl dataInsertLayer
/* 80050200 0004C180  48 00 00 80 */	b .L_80050280
.L_80050204:
/* 80050204 0004C184  4B FF 8F 09 */	bl dataRemoveLayer
/* 80050208 0004C188  48 00 00 78 */	b .L_80050280
.L_8005020C:
/* 8005020C 0004C18C  28 06 00 00 */	cmplwi r6, 0x0
/* 80050210 0004C190  40 82 00 54 */	bne .L_80050264
/* 80050214 0004C194  80 04 00 04 */	lwz r0, 0x4(r4)
/* 80050218 0004C198  54 65 04 3E */	clrlwi r5, r3, 16
/* 8005021C 0004C19C  7C C4 02 14 */	add r6, r4, r0
/* 80050220 0004C1A0  48 00 00 1C */	b .L_8005023C
.L_80050224:
/* 80050224 0004C1A4  A0 06 00 04 */	lhz r0, 0x4(r6)
/* 80050228 0004C1A8  7C 00 28 40 */	cmplw r0, r5
/* 8005022C 0004C1AC  40 82 00 08 */	bne .L_80050234
/* 80050230 0004C1B0  48 00 00 20 */	b .L_80050250
.L_80050234:
/* 80050234 0004C1B4  80 06 00 00 */	lwz r0, 0x0(r6)
/* 80050238 0004C1B8  7C C6 02 14 */	add r6, r6, r0
.L_8005023C:
/* 8005023C 0004C1BC  80 86 00 00 */	lwz r4, 0x0(r6)
/* 80050240 0004C1C0  3C 04 00 01 */	addis r0, r4, 0x1
/* 80050244 0004C1C4  28 00 FF FF */	cmplwi r0, 0xffff
/* 80050248 0004C1C8  40 82 FF DC */	bne .L_80050224
/* 8005024C 0004C1CC  38 C0 00 00 */	li r6, 0x0
.L_80050250:
/* 80050250 0004C1D0  28 06 00 00 */	cmplwi r6, 0x0
/* 80050254 0004C1D4  41 82 00 2C */	beq .L_80050280
/* 80050258 0004C1D8  38 86 00 08 */	addi r4, r6, 0x8
/* 8005025C 0004C1DC  4B FF 90 7D */	bl dataInsertCurve
/* 80050260 0004C1E0  48 00 00 20 */	b .L_80050280
.L_80050264:
/* 80050264 0004C1E4  4B FF 92 6D */	bl dataRemoveCurve
/* 80050268 0004C1E8  48 00 00 18 */	b .L_80050280
.L_8005026C:
/* 8005026C 0004C1EC  28 06 00 00 */	cmplwi r6, 0x0
/* 80050270 0004C1F0  40 82 00 0C */	bne .L_8005027C
/* 80050274 0004C1F4  4B FF 97 D5 */	bl dataAddSampleReference
/* 80050278 0004C1F8  48 00 00 08 */	b .L_80050280
.L_8005027C:
/* 8005027C 0004C1FC  4B FF 98 A5 */	bl dataRemoveSampleReference
.L_80050280:
/* 80050280 0004C200  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80050284 0004C204  38 21 00 08 */	addi r1, r1, 0x8
/* 80050288 0004C208  7C 08 03 A6 */	mtlr r0
/* 8005028C 0004C20C  4E 80 00 20 */	blr
.endfn InsertData

.fn ScanIDList, local
/* 80050290 0004C210  7C 08 02 A6 */	mflr r0
/* 80050294 0004C214  90 01 00 04 */	stw r0, 0x4(r1)
/* 80050298 0004C218  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8005029C 0004C21C  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 800502A0 0004C220  3B 63 00 00 */	addi r27, r3, 0x0
/* 800502A4 0004C224  3B 84 00 00 */	addi r28, r4, 0x0
/* 800502A8 0004C228  3B A5 00 00 */	addi r29, r5, 0x0
/* 800502AC 0004C22C  3B C6 00 00 */	addi r30, r6, 0x0
/* 800502B0 0004C230  48 00 00 5C */	b .L_8005030C
.L_800502B4:
/* 800502B4 0004C234  54 60 04 21 */	rlwinm. r0, r3, 0, 16, 16
/* 800502B8 0004C238  41 82 00 3C */	beq .L_800502F4
/* 800502BC 0004C23C  54 7F 04 BE */	clrlwi r31, r3, 18
/* 800502C0 0004C240  48 00 00 1C */	b .L_800502DC
.L_800502C4:
/* 800502C4 0004C244  38 7F 00 00 */	addi r3, r31, 0x0
/* 800502C8 0004C248  38 9C 00 00 */	addi r4, r28, 0x0
/* 800502CC 0004C24C  38 BD 00 00 */	addi r5, r29, 0x0
/* 800502D0 0004C250  38 DE 00 00 */	addi r6, r30, 0x0
/* 800502D4 0004C254  4B FF FD CD */	bl InsertData
/* 800502D8 0004C258  3B FF 00 01 */	addi r31, r31, 0x1
.L_800502DC:
/* 800502DC 0004C25C  A0 1B 00 02 */	lhz r0, 0x2(r27)
/* 800502E0 0004C260  57 E3 04 3E */	clrlwi r3, r31, 16
/* 800502E4 0004C264  7C 03 00 40 */	cmplw r3, r0
/* 800502E8 0004C268  40 81 FF DC */	ble .L_800502C4
/* 800502EC 0004C26C  3B 7B 00 04 */	addi r27, r27, 0x4
/* 800502F0 0004C270  48 00 00 1C */	b .L_8005030C
.L_800502F4:
/* 800502F4 0004C274  A0 7B 00 00 */	lhz r3, 0x0(r27)
/* 800502F8 0004C278  38 9C 00 00 */	addi r4, r28, 0x0
/* 800502FC 0004C27C  38 BD 00 00 */	addi r5, r29, 0x0
/* 80050300 0004C280  38 DE 00 00 */	addi r6, r30, 0x0
/* 80050304 0004C284  3B 7B 00 02 */	addi r27, r27, 0x2
/* 80050308 0004C288  4B FF FD 99 */	bl InsertData
.L_8005030C:
/* 8005030C 0004C28C  A0 7B 00 00 */	lhz r3, 0x0(r27)
/* 80050310 0004C290  28 03 FF FF */	cmplwi r3, 0xffff
/* 80050314 0004C294  40 82 FF A0 */	bne .L_800502B4
/* 80050318 0004C298  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 8005031C 0004C29C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80050320 0004C2A0  38 21 00 30 */	addi r1, r1, 0x30
/* 80050324 0004C2A4  7C 08 03 A6 */	mtlr r0
/* 80050328 0004C2A8  4E 80 00 20 */	blr
.endfn ScanIDList

.fn sndPushGroup, global
/* 8005032C 0004C2AC  7C 08 02 A6 */	mflr r0
/* 80050330 0004C2B0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80050334 0004C2B4  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 80050338 0004C2B8  BF 41 00 20 */	stmw r26, 0x20(r1)
/* 8005033C 0004C2BC  3B 63 00 00 */	addi r27, r3, 0x0
/* 80050340 0004C2C0  3B 84 00 00 */	addi r28, r4, 0x0
/* 80050344 0004C2C4  3B A6 00 00 */	addi r29, r6, 0x0
/* 80050348 0004C2C8  3B C7 00 00 */	addi r30, r7, 0x0
/* 8005034C 0004C2CC  88 0D 87 30 */	lbz r0, sndActive@sda21(r13)
/* 80050350 0004C2D0  28 00 00 00 */	cmplwi r0, 0x0
/* 80050354 0004C2D4  41 82 01 2C */	beq .L_80050480
/* 80050358 0004C2D8  A8 CD 87 F8 */	lha r6, sp@sda21(r13)
/* 8005035C 0004C2DC  2C 06 00 80 */	cmpwi r6, 0x80
/* 80050360 0004C2E0  40 80 01 20 */	bge .L_80050480
/* 80050364 0004C2E4  3B FB 00 00 */	addi r31, r27, 0x0
/* 80050368 0004C2E8  57 84 04 3E */	clrlwi r4, r28, 16
/* 8005036C 0004C2EC  48 00 01 04 */	b .L_80050470
.L_80050370:
/* 80050370 0004C2F0  A0 1F 00 04 */	lhz r0, 0x4(r31)
/* 80050374 0004C2F4  7C 00 20 40 */	cmplw r0, r4
/* 80050378 0004C2F8  40 82 00 F0 */	bne .L_80050468
/* 8005037C 0004C2FC  3C 60 80 0A */	lis r3, gs@ha
/* 80050380 0004C300  38 03 C7 A8 */	addi r0, r3, gs@l
/* 80050384 0004C304  54 C4 18 38 */	slwi r4, r6, 3
/* 80050388 0004C308  7C 80 22 14 */	add r4, r0, r4
/* 8005038C 0004C30C  93 E4 00 00 */	stw r31, 0x0(r4)
/* 80050390 0004C310  7C A3 2B 78 */	mr r3, r5
/* 80050394 0004C314  93 64 00 04 */	stw r27, 0x4(r4)
/* 80050398 0004C318  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 8005039C 0004C31C  7F 5B 02 14 */	add r26, r27, r0
/* 800503A0 0004C320  48 00 7E D9 */	bl hwTransAddr
/* 800503A4 0004C324  38 83 00 00 */	addi r4, r3, 0x0
/* 800503A8 0004C328  38 7D 00 00 */	addi r3, r29, 0x0
/* 800503AC 0004C32C  4B FF 92 A9 */	bl dataInsertSDir
/* 800503B0 0004C330  28 03 00 00 */	cmplwi r3, 0x0
/* 800503B4 0004C334  41 82 00 18 */	beq .L_800503CC
/* 800503B8 0004C338  38 7A 00 00 */	addi r3, r26, 0x0
/* 800503BC 0004C33C  38 9D 00 00 */	addi r4, r29, 0x0
/* 800503C0 0004C340  38 A0 00 01 */	li r5, 0x1
/* 800503C4 0004C344  38 C0 00 00 */	li r6, 0x0
/* 800503C8 0004C348  4B FF FE C9 */	bl ScanIDList
.L_800503CC:
/* 800503CC 0004C34C  80 1F 00 08 */	lwz r0, 0x8(r31)
/* 800503D0 0004C350  38 9E 00 00 */	addi r4, r30, 0x0
/* 800503D4 0004C354  38 A0 00 00 */	li r5, 0x0
/* 800503D8 0004C358  7C 7B 02 14 */	add r3, r27, r0
/* 800503DC 0004C35C  38 C0 00 00 */	li r6, 0x0
/* 800503E0 0004C360  4B FF FE B1 */	bl ScanIDList
/* 800503E4 0004C364  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 800503E8 0004C368  38 9E 00 00 */	addi r4, r30, 0x0
/* 800503EC 0004C36C  38 A0 00 04 */	li r5, 0x4
/* 800503F0 0004C370  7C 7B 02 14 */	add r3, r27, r0
/* 800503F4 0004C374  38 C0 00 00 */	li r6, 0x0
/* 800503F8 0004C378  4B FF FE 99 */	bl ScanIDList
/* 800503FC 0004C37C  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 80050400 0004C380  38 9E 00 00 */	addi r4, r30, 0x0
/* 80050404 0004C384  38 A0 00 02 */	li r5, 0x2
/* 80050408 0004C388  7C 7B 02 14 */	add r3, r27, r0
/* 8005040C 0004C38C  38 C0 00 00 */	li r6, 0x0
/* 80050410 0004C390  4B FF FE 81 */	bl ScanIDList
/* 80050414 0004C394  80 1F 00 18 */	lwz r0, 0x18(r31)
/* 80050418 0004C398  38 9E 00 00 */	addi r4, r30, 0x0
/* 8005041C 0004C39C  38 A0 00 03 */	li r5, 0x3
/* 80050420 0004C3A0  7C 7B 02 14 */	add r3, r27, r0
/* 80050424 0004C3A4  38 C0 00 00 */	li r6, 0x0
/* 80050428 0004C3A8  4B FF FE 69 */	bl ScanIDList
/* 8005042C 0004C3AC  A0 1F 00 06 */	lhz r0, 0x6(r31)
/* 80050430 0004C3B0  28 00 00 01 */	cmplwi r0, 0x1
/* 80050434 0004C3B4  40 82 00 1C */	bne .L_80050450
/* 80050438 0004C3B8  80 1F 00 1C */	lwz r0, 0x1c(r31)
/* 8005043C 0004C3BC  38 7C 00 00 */	addi r3, r28, 0x0
/* 80050440 0004C3C0  7C 9B 02 14 */	add r4, r27, r0
/* 80050444 0004C3C4  A0 A4 00 00 */	lhz r5, 0x0(r4)
/* 80050448 0004C3C8  38 84 00 04 */	addi r4, r4, 0x4
/* 8005044C 0004C3CC  4B FF 97 BD */	bl dataInsertFX
.L_80050450:
/* 80050450 0004C3D0  48 00 7F E5 */	bl hwSyncSampleMem
/* 80050454 0004C3D4  A8 8D 87 F8 */	lha r4, sp@sda21(r13)
/* 80050458 0004C3D8  38 60 00 01 */	li r3, 0x1
/* 8005045C 0004C3DC  38 04 00 01 */	addi r0, r4, 0x1
/* 80050460 0004C3E0  B0 0D 87 F8 */	sth r0, sp@sda21(r13)
/* 80050464 0004C3E4  48 00 00 20 */	b .L_80050484
.L_80050468:
/* 80050468 0004C3E8  80 1F 00 00 */	lwz r0, 0x0(r31)
/* 8005046C 0004C3EC  7F FB 02 14 */	add r31, r27, r0
.L_80050470:
/* 80050470 0004C3F0  80 7F 00 00 */	lwz r3, 0x0(r31)
/* 80050474 0004C3F4  3C 03 00 01 */	addis r0, r3, 0x1
/* 80050478 0004C3F8  28 00 FF FF */	cmplwi r0, 0xffff
/* 8005047C 0004C3FC  40 82 FE F4 */	bne .L_80050370
.L_80050480:
/* 80050480 0004C400  38 60 00 00 */	li r3, 0x0
.L_80050484:
/* 80050484 0004C404  BB 41 00 20 */	lmw r26, 0x20(r1)
/* 80050488 0004C408  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 8005048C 0004C40C  38 21 00 38 */	addi r1, r1, 0x38
/* 80050490 0004C410  7C 08 03 A6 */	mtlr r0
/* 80050494 0004C414  4E 80 00 20 */	blr
.endfn sndPushGroup

.fn seqPlaySong, global
/* 80050498 0004C418  7C 08 02 A6 */	mflr r0
/* 8005049C 0004C41C  3D 20 80 0A */	lis r9, gs@ha
/* 800504A0 0004C420  90 01 00 04 */	stw r0, 0x4(r1)
/* 800504A4 0004C424  39 29 C7 A8 */	addi r9, r9, gs@l
/* 800504A8 0004C428  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 800504AC 0004C42C  BF 21 00 24 */	stmw r25, 0x24(r1)
/* 800504B0 0004C430  3B A5 00 00 */	addi r29, r5, 0x0
/* 800504B4 0004C434  3B C6 00 00 */	addi r30, r6, 0x0
/* 800504B8 0004C438  3B E8 00 00 */	addi r31, r8, 0x0
/* 800504BC 0004C43C  3B 83 00 00 */	addi r28, r3, 0x0
/* 800504C0 0004C440  38 C9 00 00 */	addi r6, r9, 0x0
/* 800504C4 0004C444  54 65 04 3E */	clrlwi r5, r3, 16
/* 800504C8 0004C448  39 00 00 00 */	li r8, 0x0
/* 800504CC 0004C44C  A8 0D 87 F8 */	lha r0, sp@sda21(r13)
/* 800504D0 0004C450  2C 00 00 00 */	cmpwi r0, 0x0
/* 800504D4 0004C454  7C 09 03 A6 */	mtctr r0
/* 800504D8 0004C458  40 81 00 E8 */	ble .L_800505C0
.L_800504DC:
/* 800504DC 0004C45C  80 66 00 00 */	lwz r3, 0x0(r6)
/* 800504E0 0004C460  A0 03 00 04 */	lhz r0, 0x4(r3)
/* 800504E4 0004C464  7C 05 00 40 */	cmplw r5, r0
/* 800504E8 0004C468  40 82 00 CC */	bne .L_800505B4
/* 800504EC 0004C46C  55 03 18 38 */	slwi r3, r8, 3
/* 800504F0 0004C470  7C C9 18 2E */	lwzx r6, r9, r3
/* 800504F4 0004C474  A0 06 00 06 */	lhz r0, 0x6(r6)
/* 800504F8 0004C478  28 00 00 00 */	cmplwi r0, 0x0
/* 800504FC 0004C47C  40 82 00 B0 */	bne .L_800505AC
/* 80050500 0004C480  7C 69 1A 14 */	add r3, r9, r3
/* 80050504 0004C484  80 A6 00 1C */	lwz r5, 0x1c(r6)
/* 80050508 0004C488  81 03 00 04 */	lwz r8, 0x4(r3)
/* 8005050C 0004C48C  54 80 04 3E */	clrlwi r0, r4, 16
/* 80050510 0004C490  80 86 00 20 */	lwz r4, 0x20(r6)
/* 80050514 0004C494  80 66 00 24 */	lwz r3, 0x24(r6)
/* 80050518 0004C498  7F 68 2A 14 */	add r27, r8, r5
/* 8005051C 0004C49C  7F 48 22 14 */	add r26, r8, r4
/* 80050520 0004C4A0  7F 28 1A 14 */	add r25, r8, r3
/* 80050524 0004C4A4  48 00 00 74 */	b .L_80050598
.L_80050528:
/* 80050528 0004C4A8  7C 03 00 40 */	cmplw r3, r0
/* 8005052C 0004C4AC  40 82 00 68 */	bne .L_80050594
/* 80050530 0004C4B0  54 E0 06 3F */	clrlwi. r0, r7, 24
/* 80050534 0004C4B4  41 82 00 2C */	beq .L_80050560
/* 80050538 0004C4B8  38 7B 00 00 */	addi r3, r27, 0x0
/* 8005053C 0004C4BC  38 9A 00 00 */	addi r4, r26, 0x0
/* 80050540 0004C4C0  38 B9 00 00 */	addi r5, r25, 0x0
/* 80050544 0004C4C4  38 DD 00 00 */	addi r6, r29, 0x0
/* 80050548 0004C4C8  38 FE 00 00 */	addi r7, r30, 0x0
/* 8005054C 0004C4CC  39 1F 00 00 */	addi r8, r31, 0x0
/* 80050550 0004C4D0  39 3C 00 00 */	addi r9, r28, 0x0
/* 80050554 0004C4D4  4B FF 17 0D */	bl seqStartPlay
/* 80050558 0004C4D8  7C 79 1B 78 */	mr r25, r3
/* 8005055C 0004C4DC  48 00 00 30 */	b .L_8005058C
.L_80050560:
/* 80050560 0004C4E0  48 00 8A F1 */	bl hwDisableIrq
/* 80050564 0004C4E4  38 7B 00 00 */	addi r3, r27, 0x0
/* 80050568 0004C4E8  38 9A 00 00 */	addi r4, r26, 0x0
/* 8005056C 0004C4EC  38 B9 00 00 */	addi r5, r25, 0x0
/* 80050570 0004C4F0  38 DD 00 00 */	addi r6, r29, 0x0
/* 80050574 0004C4F4  38 FE 00 00 */	addi r7, r30, 0x0
/* 80050578 0004C4F8  39 1F 00 00 */	addi r8, r31, 0x0
/* 8005057C 0004C4FC  39 3C 00 00 */	addi r9, r28, 0x0
/* 80050580 0004C500  4B FF 16 E1 */	bl seqStartPlay
/* 80050584 0004C504  7C 79 1B 78 */	mr r25, r3
/* 80050588 0004C508  48 00 8A 91 */	bl hwEnableIrq
.L_8005058C:
/* 8005058C 0004C50C  7F 23 CB 78 */	mr r3, r25
/* 80050590 0004C510  48 00 00 34 */	b .L_800505C4
.L_80050594:
/* 80050594 0004C514  3B 39 00 54 */	addi r25, r25, 0x54
.L_80050598:
/* 80050598 0004C518  A0 79 00 00 */	lhz r3, 0x0(r25)
/* 8005059C 0004C51C  28 03 FF FF */	cmplwi r3, 0xffff
/* 800505A0 0004C520  40 82 FF 88 */	bne .L_80050528
/* 800505A4 0004C524  38 60 FF FF */	li r3, -0x1
/* 800505A8 0004C528  48 00 00 1C */	b .L_800505C4
.L_800505AC:
/* 800505AC 0004C52C  38 60 FF FF */	li r3, -0x1
/* 800505B0 0004C530  48 00 00 14 */	b .L_800505C4
.L_800505B4:
/* 800505B4 0004C534  38 C6 00 08 */	addi r6, r6, 0x8
/* 800505B8 0004C538  39 08 00 01 */	addi r8, r8, 0x1
/* 800505BC 0004C53C  42 00 FF 20 */	bdnz .L_800504DC
.L_800505C0:
/* 800505C0 0004C540  38 60 FF FF */	li r3, -0x1
.L_800505C4:
/* 800505C4 0004C544  BB 21 00 24 */	lmw r25, 0x24(r1)
/* 800505C8 0004C548  80 01 00 44 */	lwz r0, 0x44(r1)
/* 800505CC 0004C54C  38 21 00 40 */	addi r1, r1, 0x40
/* 800505D0 0004C550  7C 08 03 A6 */	mtlr r0
/* 800505D4 0004C554  4E 80 00 20 */	blr
.endfn seqPlaySong

.fn sndSeqPlayEx, global
/* 800505D8 0004C558  7C 08 02 A6 */	mflr r0
/* 800505DC 0004C55C  39 07 00 00 */	addi r8, r7, 0x0
/* 800505E0 0004C560  90 01 00 04 */	stw r0, 0x4(r1)
/* 800505E4 0004C564  38 E0 00 00 */	li r7, 0x0
/* 800505E8 0004C568  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 800505EC 0004C56C  4B FF FE AD */	bl seqPlaySong
/* 800505F0 0004C570  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800505F4 0004C574  38 21 00 08 */	addi r1, r1, 0x8
/* 800505F8 0004C578  7C 08 03 A6 */	mtlr r0
/* 800505FC 0004C57C  4E 80 00 20 */	blr
.endfn sndSeqPlayEx

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80

.balign 8


.obj gs, local
	.skip 0x400
.endobj gs

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380

.balign 8


.obj sp, local
	.skip 0x2
.endobj sp

.skip 6

.section extab, "a"  # 0x80005520 - 0x80005BC0


.obj "@etb_800058A0", local
.hidden "@etb_800058A0"
	.4byte 0x00080000
	.4byte 0
.endobj "@etb_800058A0"

.obj "@etb_800058A8", local
.hidden "@etb_800058A8"
	.4byte 0x28080000
	.4byte 0
.endobj "@etb_800058A8"

.obj "@etb_800058B0", local
.hidden "@etb_800058B0"
	.4byte 0x30080000
	.4byte 0
.endobj "@etb_800058B0"

.obj "@etb_800058B8", local
.hidden "@etb_800058B8"
	.4byte 0x38080000
	.4byte 0
.endobj "@etb_800058B8"

.obj "@etb_800058C0", local
.hidden "@etb_800058C0"
	.4byte 0x00080000
	.4byte 0
.endobj "@etb_800058C0"

.section extabindex, "a"  # 0x80005BC0 - 0x800065A0


.obj "@eti_80006100", local
.hidden "@eti_80006100"
    .4byte InsertData
    .4byte 0x000001F0
    .4byte "@etb_800058A0"
.endobj "@eti_80006100"

.obj "@eti_8000610C", local
.hidden "@eti_8000610C"
    .4byte ScanIDList
    .4byte 0x0000009C
    .4byte "@etb_800058A8"
.endobj "@eti_8000610C"

.obj "@eti_80006118", local
.hidden "@eti_80006118"
    .4byte sndPushGroup
    .4byte 0x0000016C
    .4byte "@etb_800058B0"
.endobj "@eti_80006118"

.obj "@eti_80006124", local
.hidden "@eti_80006124"
    .4byte seqPlaySong
    .4byte 0x00000140
    .4byte "@etb_800058B8"
.endobj "@eti_80006124"

.obj "@eti_80006130", local
.hidden "@eti_80006130"
    .4byte sndSeqPlayEx
    .4byte 0x00000028
    .4byte "@etb_800058C0"
.endobj "@eti_80006130"
