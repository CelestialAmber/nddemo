.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn GXFlush, global
/* 8003C81C 0003879C  7C 08 02 A6 */	mflr r0
/* 8003C820 000387A0  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003C824 000387A4  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8003C828 000387A8  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003C82C 000387AC  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 8003C830 000387B0  28 00 00 00 */	cmplwi r0, 0x0
/* 8003C834 000387B4  41 82 00 08 */	beq .L_8003C83C
/* 8003C838 000387B8  48 00 04 AD */	bl __GXSetDirtyState
.L_8003C83C:
/* 8003C83C 000387BC  38 00 00 00 */	li r0, 0x0
/* 8003C840 000387C0  3C 60 CC 01 */	lis r3, 0xCC008000@ha
/* 8003C844 000387C4  90 03 80 00 */	stw r0, 0xCC008000@l(r3)
/* 8003C848 000387C8  90 03 80 00 */	stw r0, -0x8000(r3)
/* 8003C84C 000387CC  90 03 80 00 */	stw r0, -0x8000(r3)
/* 8003C850 000387D0  90 03 80 00 */	stw r0, -0x8000(r3)
/* 8003C854 000387D4  90 03 80 00 */	stw r0, -0x8000(r3)
/* 8003C858 000387D8  90 03 80 00 */	stw r0, -0x8000(r3)
/* 8003C85C 000387DC  90 03 80 00 */	stw r0, -0x8000(r3)
/* 8003C860 000387E0  90 03 80 00 */	stw r0, -0x8000(r3)
/* 8003C864 000387E4  4B FE AE 55 */	bl PPCSync
/* 8003C868 000387E8  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8003C86C 000387EC  38 21 00 08 */	addi r1, r1, 0x8
/* 8003C870 000387F0  7C 08 03 A6 */	mtlr r0
/* 8003C874 000387F4  4E 80 00 20 */	blr
.endfn GXFlush

.fn GXSetDrawSync, global
/* 8003C878 000387F8  7C 08 02 A6 */	mflr r0
/* 8003C87C 000387FC  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003C880 00038800  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8003C884 00038804  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8003C888 00038808  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8003C88C 0003880C  7C 7E 1B 78 */	mr r30, r3
/* 8003C890 00038810  4B FE E7 55 */	bl OSDisableInterrupts
/* 8003C894 00038814  38 C0 00 61 */	li r6, 0x61
/* 8003C898 00038818  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003C89C 0003881C  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 8003C8A0 00038820  57 C0 04 3E */	clrlwi r0, r30, 16
/* 8003C8A4 00038824  98 C5 80 00 */	stb r6, 0xCC008000@l(r5)
/* 8003C8A8 00038828  64 00 48 00 */	oris r0, r0, 0x4800
/* 8003C8AC 0003882C  90 05 80 00 */	stw r0, -0x8000(r5)
/* 8003C8B0 00038830  54 00 00 1E */	clrrwi r0, r0, 16
/* 8003C8B4 00038834  53 C0 04 3E */	rlwimi r0, r30, 0, 16, 31
/* 8003C8B8 00038838  54 00 02 3E */	clrlwi r0, r0, 8
/* 8003C8BC 0003883C  98 C5 80 00 */	stb r6, -0x8000(r5)
/* 8003C8C0 00038840  64 00 47 00 */	oris r0, r0, 0x4700
/* 8003C8C4 00038844  90 05 80 00 */	stw r0, -0x8000(r5)
/* 8003C8C8 00038848  7C 7E 1B 78 */	mr r30, r3
/* 8003C8CC 0003884C  80 04 04 F0 */	lwz r0, 0x4f0(r4)
/* 8003C8D0 00038850  28 00 00 00 */	cmplwi r0, 0x0
/* 8003C8D4 00038854  41 82 00 08 */	beq .L_8003C8DC
/* 8003C8D8 00038858  48 00 04 0D */	bl __GXSetDirtyState
.L_8003C8DC:
/* 8003C8DC 0003885C  3B E0 00 00 */	li r31, 0x0
/* 8003C8E0 00038860  3C 60 CC 01 */	lis r3, 0xCC008000@ha
/* 8003C8E4 00038864  93 E3 80 00 */	stw r31, 0xCC008000@l(r3)
/* 8003C8E8 00038868  93 E3 80 00 */	stw r31, -0x8000(r3)
/* 8003C8EC 0003886C  93 E3 80 00 */	stw r31, -0x8000(r3)
/* 8003C8F0 00038870  93 E3 80 00 */	stw r31, -0x8000(r3)
/* 8003C8F4 00038874  93 E3 80 00 */	stw r31, -0x8000(r3)
/* 8003C8F8 00038878  93 E3 80 00 */	stw r31, -0x8000(r3)
/* 8003C8FC 0003887C  93 E3 80 00 */	stw r31, -0x8000(r3)
/* 8003C900 00038880  93 E3 80 00 */	stw r31, -0x8000(r3)
/* 8003C904 00038884  4B FE AD B5 */	bl PPCSync
/* 8003C908 00038888  7F C3 F3 78 */	mr r3, r30
/* 8003C90C 0003888C  4B FE E7 01 */	bl OSRestoreInterrupts
/* 8003C910 00038890  80 6D 82 90 */	lwz r3, gx@sda21(r13)
/* 8003C914 00038894  B3 E3 00 02 */	sth r31, 0x2(r3)
/* 8003C918 00038898  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8003C91C 0003889C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8003C920 000388A0  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8003C924 000388A4  7C 08 03 A6 */	mtlr r0
/* 8003C928 000388A8  38 21 00 18 */	addi r1, r1, 0x18
/* 8003C92C 000388AC  4E 80 00 20 */	blr
.endfn GXSetDrawSync

.fn GXDrawDone, global
/* 8003C930 000388B0  7C 08 02 A6 */	mflr r0
/* 8003C934 000388B4  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003C938 000388B8  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8003C93C 000388BC  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8003C940 000388C0  4B FE E6 A5 */	bl OSDisableInterrupts
/* 8003C944 000388C4  38 00 00 61 */	li r0, 0x61
/* 8003C948 000388C8  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 8003C94C 000388CC  3C 80 45 00 */	lis r4, 0x4500
/* 8003C950 000388D0  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 8003C954 000388D4  38 04 00 02 */	addi r0, r4, 0x2
/* 8003C958 000388D8  90 05 80 00 */	stw r0, -0x8000(r5)
/* 8003C95C 000388DC  7C 7F 1B 78 */	mr r31, r3
/* 8003C960 000388E0  4B FF FE BD */	bl GXFlush
/* 8003C964 000388E4  38 00 00 00 */	li r0, 0x0
/* 8003C968 000388E8  98 0D 87 00 */	stb r0, DrawDone@sda21(r13)
/* 8003C96C 000388EC  7F E3 FB 78 */	mr r3, r31
/* 8003C970 000388F0  4B FE E6 9D */	bl OSRestoreInterrupts
/* 8003C974 000388F4  4B FE E6 71 */	bl OSDisableInterrupts
/* 8003C978 000388F8  7C 7F 1B 78 */	mr r31, r3
/* 8003C97C 000388FC  48 00 00 0C */	b .L_8003C988
.L_8003C980:
/* 8003C980 00038900  38 6D 87 04 */	addi r3, r13, FinishQueue@sda21
/* 8003C984 00038904  4B FF 28 E1 */	bl OSSleepThread
.L_8003C988:
/* 8003C988 00038908  88 0D 87 00 */	lbz r0, DrawDone@sda21(r13)
/* 8003C98C 0003890C  28 00 00 00 */	cmplwi r0, 0x0
/* 8003C990 00038910  41 82 FF F0 */	beq .L_8003C980
/* 8003C994 00038914  7F E3 FB 78 */	mr r3, r31
/* 8003C998 00038918  4B FE E6 75 */	bl OSRestoreInterrupts
/* 8003C99C 0003891C  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8003C9A0 00038920  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8003C9A4 00038924  38 21 00 18 */	addi r1, r1, 0x18
/* 8003C9A8 00038928  7C 08 03 A6 */	mtlr r0
/* 8003C9AC 0003892C  4E 80 00 20 */	blr
.endfn GXDrawDone

.fn GXPixModeSync, global
/* 8003C9B0 00038930  38 00 00 61 */	li r0, 0x61
/* 8003C9B4 00038934  80 8D 82 90 */	lwz r4, gx@sda21(r13)
/* 8003C9B8 00038938  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 8003C9BC 0003893C  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 8003C9C0 00038940  38 00 00 00 */	li r0, 0x0
/* 8003C9C4 00038944  80 64 01 DC */	lwz r3, 0x1dc(r4)
/* 8003C9C8 00038948  90 65 80 00 */	stw r3, -0x8000(r5)
/* 8003C9CC 0003894C  B0 04 00 02 */	sth r0, 0x2(r4)
/* 8003C9D0 00038950  4E 80 00 20 */	blr
.endfn GXPixModeSync

.fn GXPokeAlphaMode, global
/* 8003C9D4 00038954  80 AD 86 D0 */	lwz r5, __peReg@sda21(r13)
/* 8003C9D8 00038958  54 80 06 3E */	clrlwi r0, r4, 24
/* 8003C9DC 0003895C  50 60 40 2E */	rlwimi r0, r3, 8, 0, 23
/* 8003C9E0 00038960  B0 05 00 06 */	sth r0, 0x6(r5)
/* 8003C9E4 00038964  4E 80 00 20 */	blr
.endfn GXPokeAlphaMode

.fn GXPokeAlphaRead, global
/* 8003C9E8 00038968  54 60 07 B8 */	rlwinm r0, r3, 0, 30, 28
/* 8003C9EC 0003896C  80 6D 86 D0 */	lwz r3, __peReg@sda21(r13)
/* 8003C9F0 00038970  60 00 00 04 */	ori r0, r0, 0x4
/* 8003C9F4 00038974  B0 03 00 08 */	sth r0, 0x8(r3)
/* 8003C9F8 00038978  4E 80 00 20 */	blr
.endfn GXPokeAlphaRead

.fn GXPokeAlphaUpdate, global
/* 8003C9FC 0003897C  80 8D 86 D0 */	lwz r4, __peReg@sda21(r13)
/* 8003CA00 00038980  54 60 25 36 */	clrlslwi r0, r3, 24, 4
/* 8003CA04 00038984  A4 64 00 02 */	lhzu r3, 0x2(r4)
/* 8003CA08 00038988  54 63 07 34 */	rlwinm r3, r3, 0, 28, 26
/* 8003CA0C 0003898C  7C 60 03 78 */	or r0, r3, r0
/* 8003CA10 00038990  B0 04 00 00 */	sth r0, 0x0(r4)
/* 8003CA14 00038994  4E 80 00 20 */	blr
.endfn GXPokeAlphaUpdate

.fn GXPokeBlendMode, global
/* 8003CA18 00038998  80 ED 86 D0 */	lwz r7, __peReg@sda21(r13)
/* 8003CA1C 0003899C  2C 03 00 01 */	cmpwi r3, 0x1
/* 8003CA20 000389A0  39 20 00 01 */	li r9, 0x1
/* 8003CA24 000389A4  39 47 00 02 */	addi r10, r7, 0x2
/* 8003CA28 000389A8  A0 E7 00 02 */	lhz r7, 0x2(r7)
/* 8003CA2C 000389AC  41 82 00 10 */	beq .L_8003CA3C
/* 8003CA30 000389B0  2C 03 00 03 */	cmpwi r3, 0x3
/* 8003CA34 000389B4  41 82 00 08 */	beq .L_8003CA3C
/* 8003CA38 000389B8  39 20 00 00 */	li r9, 0x0
.L_8003CA3C:
/* 8003CA3C 000389BC  54 E8 00 3C */	clrrwi r8, r7, 1
/* 8003CA40 000389C0  20 03 00 03 */	subfic r0, r3, 0x3
/* 8003CA44 000389C4  7C 07 00 34 */	cntlzw r7, r0
/* 8003CA48 000389C8  20 03 00 02 */	subfic r0, r3, 0x2
/* 8003CA4C 000389CC  7D 08 4B 78 */	or r8, r8, r9
/* 8003CA50 000389D0  7C 00 00 34 */	cntlzw r0, r0
/* 8003CA54 000389D4  55 08 05 66 */	rlwinm r8, r8, 0, 21, 19
/* 8003CA58 000389D8  54 E3 30 28 */	extlwi r3, r7, 21, 6
/* 8003CA5C 000389DC  7D 03 1B 78 */	or r3, r8, r3
/* 8003CA60 000389E0  54 63 07 FA */	rlwinm r3, r3, 0, 31, 29
/* 8003CA64 000389E4  54 00 E1 3C */	rlwinm r0, r0, 28, 4, 30
/* 8003CA68 000389E8  7C 60 03 78 */	or r0, r3, r0
/* 8003CA6C 000389EC  54 03 05 1E */	rlwinm r3, r0, 0, 20, 15
/* 8003CA70 000389F0  54 C0 60 26 */	slwi r0, r6, 12
/* 8003CA74 000389F4  7C 60 03 78 */	or r0, r3, r0
/* 8003CA78 000389F8  54 03 06 28 */	rlwinm r3, r0, 0, 24, 20
/* 8003CA7C 000389FC  54 80 40 2E */	slwi r0, r4, 8
/* 8003CA80 00038A00  7C 60 03 78 */	or r0, r3, r0
/* 8003CA84 00038A04  54 03 06 EE */	rlwinm r3, r0, 0, 27, 23
/* 8003CA88 00038A08  54 A0 28 34 */	slwi r0, r5, 5
/* 8003CA8C 00038A0C  7C 60 03 78 */	or r0, r3, r0
/* 8003CA90 00038A10  54 00 02 3E */	clrlwi r0, r0, 8
/* 8003CA94 00038A14  64 00 41 00 */	oris r0, r0, 0x4100
/* 8003CA98 00038A18  B0 0A 00 00 */	sth r0, 0x0(r10)
/* 8003CA9C 00038A1C  4E 80 00 20 */	blr
.endfn GXPokeBlendMode

.fn GXPokeColorUpdate, global
/* 8003CAA0 00038A20  80 8D 86 D0 */	lwz r4, __peReg@sda21(r13)
/* 8003CAA4 00038A24  54 60 1D 78 */	clrlslwi r0, r3, 24, 3
/* 8003CAA8 00038A28  A4 64 00 02 */	lhzu r3, 0x2(r4)
/* 8003CAAC 00038A2C  54 63 07 76 */	rlwinm r3, r3, 0, 29, 27
/* 8003CAB0 00038A30  7C 60 03 78 */	or r0, r3, r0
/* 8003CAB4 00038A34  B0 04 00 00 */	sth r0, 0x0(r4)
/* 8003CAB8 00038A38  4E 80 00 20 */	blr
.endfn GXPokeColorUpdate

.fn GXPokeDstAlpha, global
/* 8003CABC 00038A3C  80 AD 86 D0 */	lwz r5, __peReg@sda21(r13)
/* 8003CAC0 00038A40  54 60 44 2E */	clrlslwi r0, r3, 24, 8
/* 8003CAC4 00038A44  50 80 06 3E */	rlwimi r0, r4, 0, 24, 31
/* 8003CAC8 00038A48  B0 05 00 04 */	sth r0, 0x4(r5)
/* 8003CACC 00038A4C  4E 80 00 20 */	blr
.endfn GXPokeDstAlpha

.fn GXPokeDither, global
/* 8003CAD0 00038A50  80 8D 86 D0 */	lwz r4, __peReg@sda21(r13)
/* 8003CAD4 00038A54  54 60 15 BA */	clrlslwi r0, r3, 24, 2
/* 8003CAD8 00038A58  A4 64 00 02 */	lhzu r3, 0x2(r4)
/* 8003CADC 00038A5C  54 63 07 B8 */	rlwinm r3, r3, 0, 30, 28
/* 8003CAE0 00038A60  7C 60 03 78 */	or r0, r3, r0
/* 8003CAE4 00038A64  B0 04 00 00 */	sth r0, 0x0(r4)
/* 8003CAE8 00038A68  4E 80 00 20 */	blr
.endfn GXPokeDither

.fn GXPokeZMode, global
/* 8003CAEC 00038A6C  54 60 06 3E */	clrlwi r0, r3, 24
/* 8003CAF0 00038A70  80 6D 86 D0 */	lwz r3, __peReg@sda21(r13)
/* 8003CAF4 00038A74  54 06 07 F6 */	rlwinm r6, r0, 0, 31, 27
/* 8003CAF8 00038A78  54 80 08 3C */	slwi r0, r4, 1
/* 8003CAFC 00038A7C  7C C0 03 78 */	or r0, r6, r0
/* 8003CB00 00038A80  54 04 07 34 */	rlwinm r4, r0, 0, 28, 26
/* 8003CB04 00038A84  54 A0 25 36 */	clrlslwi r0, r5, 24, 4
/* 8003CB08 00038A88  7C 80 03 78 */	or r0, r4, r0
/* 8003CB0C 00038A8C  B0 03 00 00 */	sth r0, 0x0(r3)
/* 8003CB10 00038A90  4E 80 00 20 */	blr
.endfn GXPokeZMode

.fn GXTokenInterruptHandler, local
/* 8003CB14 00038A94  7C 08 02 A6 */	mflr r0
/* 8003CB18 00038A98  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003CB1C 00038A9C  94 21 FD 20 */	stwu r1, -0x2e0(r1)
/* 8003CB20 00038AA0  93 E1 02 DC */	stw r31, 0x2dc(r1)
/* 8003CB24 00038AA4  93 C1 02 D8 */	stw r30, 0x2d8(r1)
/* 8003CB28 00038AA8  7C 9E 23 78 */	mr r30, r4
/* 8003CB2C 00038AAC  80 0D 86 F8 */	lwz r0, TokenCB@sda21(r13)
/* 8003CB30 00038AB0  80 6D 86 D0 */	lwz r3, __peReg@sda21(r13)
/* 8003CB34 00038AB4  28 00 00 00 */	cmplwi r0, 0x0
/* 8003CB38 00038AB8  A3 E3 00 0E */	lhz r31, 0xe(r3)
/* 8003CB3C 00038ABC  41 82 00 34 */	beq .L_8003CB70
/* 8003CB40 00038AC0  38 61 00 10 */	addi r3, r1, 0x10
/* 8003CB44 00038AC4  4B FE CC 4D */	bl OSClearContext
/* 8003CB48 00038AC8  38 61 00 10 */	addi r3, r1, 0x10
/* 8003CB4C 00038ACC  4B FE CA 7D */	bl OSSetCurrentContext
/* 8003CB50 00038AD0  81 8D 86 F8 */	lwz r12, TokenCB@sda21(r13)
/* 8003CB54 00038AD4  38 7F 00 00 */	addi r3, r31, 0x0
/* 8003CB58 00038AD8  7D 88 03 A6 */	mtlr r12
/* 8003CB5C 00038ADC  4E 80 00 21 */	blrl
/* 8003CB60 00038AE0  38 61 00 10 */	addi r3, r1, 0x10
/* 8003CB64 00038AE4  4B FE CC 2D */	bl OSClearContext
/* 8003CB68 00038AE8  7F C3 F3 78 */	mr r3, r30
/* 8003CB6C 00038AEC  4B FE CA 5D */	bl OSSetCurrentContext
.L_8003CB70:
/* 8003CB70 00038AF0  80 6D 86 D0 */	lwz r3, __peReg@sda21(r13)
/* 8003CB74 00038AF4  A4 03 00 0A */	lhzu r0, 0xa(r3)
/* 8003CB78 00038AF8  54 00 07 B8 */	rlwinm r0, r0, 0, 30, 28
/* 8003CB7C 00038AFC  60 00 00 04 */	ori r0, r0, 0x4
/* 8003CB80 00038B00  B0 03 00 00 */	sth r0, 0x0(r3)
/* 8003CB84 00038B04  80 01 02 E4 */	lwz r0, 0x2e4(r1)
/* 8003CB88 00038B08  83 E1 02 DC */	lwz r31, 0x2dc(r1)
/* 8003CB8C 00038B0C  83 C1 02 D8 */	lwz r30, 0x2d8(r1)
/* 8003CB90 00038B10  7C 08 03 A6 */	mtlr r0
/* 8003CB94 00038B14  38 21 02 E0 */	addi r1, r1, 0x2e0
/* 8003CB98 00038B18  4E 80 00 20 */	blr
.endfn GXTokenInterruptHandler

.fn GXSetDrawDoneCallback, global
/* 8003CB9C 00038B1C  7C 08 02 A6 */	mflr r0
/* 8003CBA0 00038B20  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003CBA4 00038B24  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8003CBA8 00038B28  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8003CBAC 00038B2C  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8003CBB0 00038B30  7C 7E 1B 78 */	mr r30, r3
/* 8003CBB4 00038B34  83 ED 86 FC */	lwz r31, DrawDoneCB@sda21(r13)
/* 8003CBB8 00038B38  4B FE E4 2D */	bl OSDisableInterrupts
/* 8003CBBC 00038B3C  93 CD 86 FC */	stw r30, DrawDoneCB@sda21(r13)
/* 8003CBC0 00038B40  4B FE E4 4D */	bl OSRestoreInterrupts
/* 8003CBC4 00038B44  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8003CBC8 00038B48  7F E3 FB 78 */	mr r3, r31
/* 8003CBCC 00038B4C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8003CBD0 00038B50  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8003CBD4 00038B54  7C 08 03 A6 */	mtlr r0
/* 8003CBD8 00038B58  38 21 00 18 */	addi r1, r1, 0x18
/* 8003CBDC 00038B5C  4E 80 00 20 */	blr
.endfn GXSetDrawDoneCallback

.fn GXFinishInterruptHandler, local
/* 8003CBE0 00038B60  7C 08 02 A6 */	mflr r0
/* 8003CBE4 00038B64  38 60 00 01 */	li r3, 0x1
/* 8003CBE8 00038B68  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003CBEC 00038B6C  94 21 FD 20 */	stwu r1, -0x2e0(r1)
/* 8003CBF0 00038B70  93 E1 02 DC */	stw r31, 0x2dc(r1)
/* 8003CBF4 00038B74  3B E4 00 00 */	addi r31, r4, 0x0
/* 8003CBF8 00038B78  80 AD 86 D0 */	lwz r5, __peReg@sda21(r13)
/* 8003CBFC 00038B7C  A0 05 00 0A */	lhz r0, 0xa(r5)
/* 8003CC00 00038B80  54 00 07 76 */	rlwinm r0, r0, 0, 29, 27
/* 8003CC04 00038B84  60 00 00 08 */	ori r0, r0, 0x8
/* 8003CC08 00038B88  B0 05 00 0A */	sth r0, 0xa(r5)
/* 8003CC0C 00038B8C  80 0D 86 FC */	lwz r0, DrawDoneCB@sda21(r13)
/* 8003CC10 00038B90  98 6D 87 00 */	stb r3, DrawDone@sda21(r13)
/* 8003CC14 00038B94  28 00 00 00 */	cmplwi r0, 0x0
/* 8003CC18 00038B98  41 82 00 30 */	beq .L_8003CC48
/* 8003CC1C 00038B9C  38 61 00 10 */	addi r3, r1, 0x10
/* 8003CC20 00038BA0  4B FE CB 71 */	bl OSClearContext
/* 8003CC24 00038BA4  38 61 00 10 */	addi r3, r1, 0x10
/* 8003CC28 00038BA8  4B FE C9 A1 */	bl OSSetCurrentContext
/* 8003CC2C 00038BAC  81 8D 86 FC */	lwz r12, DrawDoneCB@sda21(r13)
/* 8003CC30 00038BB0  7D 88 03 A6 */	mtlr r12
/* 8003CC34 00038BB4  4E 80 00 21 */	blrl
/* 8003CC38 00038BB8  38 61 00 10 */	addi r3, r1, 0x10
/* 8003CC3C 00038BBC  4B FE CB 55 */	bl OSClearContext
/* 8003CC40 00038BC0  7F E3 FB 78 */	mr r3, r31
/* 8003CC44 00038BC4  4B FE C9 85 */	bl OSSetCurrentContext
.L_8003CC48:
/* 8003CC48 00038BC8  38 6D 87 04 */	addi r3, r13, FinishQueue@sda21
/* 8003CC4C 00038BCC  4B FF 27 05 */	bl OSWakeupThread
/* 8003CC50 00038BD0  80 01 02 E4 */	lwz r0, 0x2e4(r1)
/* 8003CC54 00038BD4  83 E1 02 DC */	lwz r31, 0x2dc(r1)
/* 8003CC58 00038BD8  38 21 02 E0 */	addi r1, r1, 0x2e0
/* 8003CC5C 00038BDC  7C 08 03 A6 */	mtlr r0
/* 8003CC60 00038BE0  4E 80 00 20 */	blr
.endfn GXFinishInterruptHandler

.fn __GXPEInit, global
/* 8003CC64 00038BE4  7C 08 02 A6 */	mflr r0
/* 8003CC68 00038BE8  3C 60 80 04 */	lis r3, GXTokenInterruptHandler@ha
/* 8003CC6C 00038BEC  90 01 00 04 */	stw r0, 0x4(r1)
/* 8003CC70 00038BF0  38 83 CB 14 */	addi r4, r3, GXTokenInterruptHandler@l
/* 8003CC74 00038BF4  38 60 00 12 */	li r3, 0x12
/* 8003CC78 00038BF8  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8003CC7C 00038BFC  4B FE E3 B5 */	bl __OSSetInterruptHandler
/* 8003CC80 00038C00  3C 60 80 04 */	lis r3, GXFinishInterruptHandler@ha
/* 8003CC84 00038C04  38 83 CB E0 */	addi r4, r3, GXFinishInterruptHandler@l
/* 8003CC88 00038C08  38 60 00 13 */	li r3, 0x13
/* 8003CC8C 00038C0C  4B FE E3 A5 */	bl __OSSetInterruptHandler
/* 8003CC90 00038C10  38 6D 87 04 */	addi r3, r13, FinishQueue@sda21
/* 8003CC94 00038C14  4B FF 18 CD */	bl OSInitThreadQueue
/* 8003CC98 00038C18  38 60 20 00 */	li r3, 0x2000
/* 8003CC9C 00038C1C  4B FE E7 99 */	bl __OSUnmaskInterrupts
/* 8003CCA0 00038C20  38 60 10 00 */	li r3, 0x1000
/* 8003CCA4 00038C24  4B FE E7 91 */	bl __OSUnmaskInterrupts
/* 8003CCA8 00038C28  80 6D 86 D0 */	lwz r3, __peReg@sda21(r13)
/* 8003CCAC 00038C2C  A4 03 00 0A */	lhzu r0, 0xa(r3)
/* 8003CCB0 00038C30  54 00 07 B8 */	rlwinm r0, r0, 0, 30, 28
/* 8003CCB4 00038C34  60 00 00 04 */	ori r0, r0, 0x4
/* 8003CCB8 00038C38  54 00 07 76 */	rlwinm r0, r0, 0, 29, 27
/* 8003CCBC 00038C3C  60 00 00 08 */	ori r0, r0, 0x8
/* 8003CCC0 00038C40  54 00 00 3C */	clrrwi r0, r0, 1
/* 8003CCC4 00038C44  60 00 00 01 */	ori r0, r0, 0x1
/* 8003CCC8 00038C48  54 00 07 FA */	rlwinm r0, r0, 0, 31, 29
/* 8003CCCC 00038C4C  60 00 00 02 */	ori r0, r0, 0x2
/* 8003CCD0 00038C50  B0 03 00 00 */	sth r0, 0x0(r3)
/* 8003CCD4 00038C54  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8003CCD8 00038C58  38 21 00 08 */	addi r1, r1, 0x8
/* 8003CCDC 00038C5C  7C 08 03 A6 */	mtlr r0
/* 8003CCE0 00038C60  4E 80 00 20 */	blr
.endfn __GXPEInit

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380

TokenCB:
	.skip 0x4

DrawDoneCB:
	.skip 0x4

DrawDone:
	.skip 0x1

.skip 3

FinishQueue:
	.skip 0x8

.skip 4