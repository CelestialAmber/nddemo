.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740

.fn __ct__6DGFontFP8DGTexManPCcUcUcUccc, global
/* 80019394 00015314  7C 08 02 A6 */	mflr r0
/* 80019398 00015318  90 01 00 04 */	stw r0, 0x4(r1)
/* 8001939C 0001531C  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 800193A0 00015320  BF 41 00 20 */	stmw r26, 0x20(r1)
/* 800193A4 00015324  7C 7A 1B 78 */	mr r26, r3
/* 800193A8 00015328  7C DB 33 78 */	mr r27, r6
/* 800193AC 0001532C  3B 87 00 00 */	addi r28, r7, 0x0
/* 800193B0 00015330  3B A8 00 00 */	addi r29, r8, 0x0
/* 800193B4 00015334  3B C9 00 00 */	addi r30, r9, 0x0
/* 800193B8 00015338  3B EA 00 00 */	addi r31, r10, 0x0
/* 800193BC 0001533C  90 83 00 00 */	stw r4, 0x0(r3)
/* 800193C0 00015340  38 85 00 00 */	addi r4, r5, 0x0
/* 800193C4 00015344  80 63 00 00 */	lwz r3, 0x0(r3)
/* 800193C8 00015348  4B FF ED 25 */	bl LoadTexture__8DGTexManFPCc
/* 800193CC 0001534C  B0 7A 00 04 */	sth r3, 0x4(r26)
/* 800193D0 00015350  A0 1A 00 04 */	lhz r0, 0x4(r26)
/* 800193D4 00015354  28 00 FF FF */	cmplwi r0, 0xffff
/* 800193D8 00015358  40 82 00 14 */	bne .L_800193EC
/* 800193DC 0001535C  3C 60 80 06 */	lis r3, lbl_80066CA8@ha
/* 800193E0 00015360  4C C6 31 82 */	crclr 4*cr1+eq
/* 800193E4 00015364  38 63 6C A8 */	addi r3, r3, lbl_80066CA8@l
/* 800193E8 00015368  48 01 07 FD */	bl OSReport
.L_800193EC:
/* 800193EC 0001536C  80 7A 00 00 */	lwz r3, 0x0(r26)
/* 800193F0 00015370  A0 9A 00 04 */	lhz r4, 0x4(r26)
/* 800193F4 00015374  4B FF EE DD */	bl AttachTexture__8DGTexManFUs
/* 800193F8 00015378  A0 9A 00 04 */	lhz r4, 0x4(r26)
/* 800193FC 0001537C  28 04 FF FF */	cmplwi r4, 0xffff
/* 80019400 00015380  41 82 00 24 */	beq .L_80019424
/* 80019404 00015384  80 7A 00 00 */	lwz r3, 0x0(r26)
/* 80019408 00015388  4B FF F0 79 */	bl GetWidth__8DGTexManFUs
/* 8001940C 0001538C  B0 7A 00 06 */	sth r3, 0x6(r26)
/* 80019410 00015390  80 7A 00 00 */	lwz r3, 0x0(r26)
/* 80019414 00015394  A0 9A 00 04 */	lhz r4, 0x4(r26)
/* 80019418 00015398  4B FF F0 C1 */	bl GetHeight__8DGTexManFUs
/* 8001941C 0001539C  B0 7A 00 08 */	sth r3, 0x8(r26)
/* 80019420 000153A0  48 00 00 10 */	b .L_80019430
.L_80019424:
/* 80019424 000153A4  38 00 00 01 */	li r0, 0x1
/* 80019428 000153A8  B0 1A 00 06 */	sth r0, 0x6(r26)
/* 8001942C 000153AC  B0 1A 00 08 */	sth r0, 0x8(r26)
.L_80019430:
/* 80019430 000153B0  9B 7A 00 0A */	stb r27, 0xa(r26)
/* 80019434 000153B4  38 7A 00 00 */	addi r3, r26, 0x0
/* 80019438 000153B8  38 80 00 00 */	li r4, 0x0
/* 8001943C 000153BC  9B 9A 00 0B */	stb r28, 0xb(r26)
/* 80019440 000153C0  38 A0 00 00 */	li r5, 0x0
/* 80019444 000153C4  9B BA 00 0C */	stb r29, 0xc(r26)
/* 80019448 000153C8  9B DA 00 0D */	stb r30, 0xd(r26)
/* 8001944C 000153CC  9B FA 00 0E */	stb r31, 0xe(r26)
/* 80019450 000153D0  48 00 03 0D */	bl SetPosition__6DGFontFss
/* 80019454 000153D4  38 7A 00 00 */	addi r3, r26, 0x0
/* 80019458 000153D8  38 80 00 01 */	li r4, 0x1
/* 8001945C 000153DC  48 00 03 11 */	bl SetSize__6DGFontFs
/* 80019460 000153E0  38 7A 00 00 */	addi r3, r26, 0x0
/* 80019464 000153E4  38 80 00 FF */	li r4, 0xff
/* 80019468 000153E8  38 A0 00 FF */	li r5, 0xff
/* 8001946C 000153EC  38 C0 00 FF */	li r6, 0xff
/* 80019470 000153F0  38 E0 00 FF */	li r7, 0xff
/* 80019474 000153F4  48 00 03 01 */	bl SetColor__6DGFontFUcUcUcUc
/* 80019478 000153F8  38 00 00 00 */	li r0, 0x0
/* 8001947C 000153FC  98 1A 00 1C */	stb r0, 0x1c(r26)
/* 80019480 00015400  7F 43 D3 78 */	mr r3, r26
/* 80019484 00015404  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 80019488 00015408  BB 41 00 20 */	lmw r26, 0x20(r1)
/* 8001948C 0001540C  38 21 00 38 */	addi r1, r1, 0x38
/* 80019490 00015410  7C 08 03 A6 */	mtlr r0
/* 80019494 00015414  4E 80 00 20 */	blr
.endfn __ct__6DGFontFP8DGTexManPCcUcUcUccc

.fn Begin__6DGFontFP9DGRendMan, global
/* 80019498 00015418  7C 08 02 A6 */	mflr r0
/* 8001949C 0001541C  38 A0 00 00 */	li r5, 0x0
/* 800194A0 00015420  90 01 00 04 */	stw r0, 0x4(r1)
/* 800194A4 00015424  94 21 FF 70 */	stwu r1, -0x90(r1)
/* 800194A8 00015428  DB E1 00 88 */	stfd f31, 0x88(r1)
/* 800194AC 0001542C  93 E1 00 84 */	stw r31, 0x84(r1)
/* 800194B0 00015430  93 C1 00 80 */	stw r30, 0x80(r1)
/* 800194B4 00015434  3B C4 00 00 */	addi r30, r4, 0x0
/* 800194B8 00015438  38 80 00 00 */	li r4, 0x0
/* 800194BC 0001543C  93 A1 00 7C */	stw r29, 0x7c(r1)
/* 800194C0 00015440  3B A3 00 00 */	addi r29, r3, 0x0
/* 800194C4 00015444  48 00 02 99 */	bl SetPosition__6DGFontFss
/* 800194C8 00015448  38 00 00 01 */	li r0, 0x1
/* 800194CC 0001544C  98 1D 00 1C */	stb r0, 0x1c(r29)
/* 800194D0 00015450  48 02 2B 55 */	bl GXClearVtxDesc
/* 800194D4 00015454  38 60 00 09 */	li r3, 0x9
/* 800194D8 00015458  38 80 00 01 */	li r4, 0x1
/* 800194DC 0001545C  48 02 20 D9 */	bl GXSetVtxDesc
/* 800194E0 00015460  38 60 00 00 */	li r3, 0x0
/* 800194E4 00015464  38 80 00 09 */	li r4, 0x9
/* 800194E8 00015468  38 A0 00 00 */	li r5, 0x0
/* 800194EC 0001546C  38 C0 00 03 */	li r6, 0x3
/* 800194F0 00015470  38 E0 00 00 */	li r7, 0x0
/* 800194F4 00015474  48 02 2B 7D */	bl GXSetVtxAttrFmt
/* 800194F8 00015478  38 60 00 0D */	li r3, 0xd
/* 800194FC 0001547C  38 80 00 01 */	li r4, 0x1
/* 80019500 00015480  48 02 20 B5 */	bl GXSetVtxDesc
/* 80019504 00015484  38 60 00 00 */	li r3, 0x0
/* 80019508 00015488  38 80 00 0D */	li r4, 0xd
/* 8001950C 0001548C  38 A0 00 01 */	li r5, 0x1
/* 80019510 00015490  38 C0 00 04 */	li r6, 0x4
/* 80019514 00015494  38 E0 00 00 */	li r7, 0x0
/* 80019518 00015498  48 02 2B 59 */	bl GXSetVtxAttrFmt
/* 8001951C 0001549C  3B E0 00 00 */	li r31, 0x0
/* 80019520 000154A0  48 00 00 10 */	b .L_80019530
.L_80019524:
/* 80019524 000154A4  38 60 00 00 */	li r3, 0x0
/* 80019528 000154A8  48 02 33 51 */	bl GXSetDrawSync
/* 8001952C 000154AC  3B FF 00 01 */	addi r31, r31, 0x1
.L_80019530:
/* 80019530 000154B0  7F E0 07 75 */	extsb. r0, r31
/* 80019534 000154B4  41 80 FF F0 */	blt .L_80019524
/* 80019538 000154B8  38 60 00 00 */	li r3, 0x0
/* 8001953C 000154BC  48 02 4C 59 */	bl GXSetNumChans
/* 80019540 000154C0  3B E0 00 00 */	li r31, 0x0
/* 80019544 000154C4  48 00 00 10 */	b .L_80019554
.L_80019548:
/* 80019548 000154C8  38 60 00 01 */	li r3, 0x1
/* 8001954C 000154CC  48 02 33 2D */	bl GXSetDrawSync
/* 80019550 000154D0  3B FF 00 01 */	addi r31, r31, 0x1
.L_80019554:
/* 80019554 000154D4  7F E0 07 75 */	extsb. r0, r31
/* 80019558 000154D8  41 80 FF F0 */	blt .L_80019548
/* 8001955C 000154DC  38 60 00 00 */	li r3, 0x0
/* 80019560 000154E0  48 02 3A 85 */	bl GXSetCullMode
/* 80019564 000154E4  A0 BD 00 04 */	lhz r5, 0x4(r29)
/* 80019568 000154E8  28 05 FF FF */	cmplwi r5, 0xffff
/* 8001956C 000154EC  41 82 00 50 */	beq .L_800195BC
/* 80019570 000154F0  80 7D 00 00 */	lwz r3, 0x0(r29)
/* 80019574 000154F4  38 81 00 54 */	addi r4, r1, 0x54
/* 80019578 000154F8  38 C0 00 00 */	li r6, 0x0
/* 8001957C 000154FC  38 E0 00 00 */	li r7, 0x0
/* 80019580 00015500  4B FF EF B1 */	bl InitTexObj__8DGTexManFP9_GXTexObjUs14_GXTexWrapMode14_GXTexWrapMode
/* 80019584 00015504  C0 22 81 C8 */	lfs f1, lbl_800A9548@sda21(r2)
/* 80019588 00015508  38 61 00 54 */	addi r3, r1, 0x54
/* 8001958C 0001550C  38 80 00 00 */	li r4, 0x0
/* 80019590 00015510  FC 40 08 90 */	fmr f2, f1
/* 80019594 00015514  38 A0 00 00 */	li r5, 0x0
/* 80019598 00015518  FC 60 08 90 */	fmr f3, f1
/* 8001959C 0001551C  38 C0 00 00 */	li r6, 0x0
/* 800195A0 00015520  38 E0 00 00 */	li r7, 0x0
/* 800195A4 00015524  39 00 00 00 */	li r8, 0x0
/* 800195A8 00015528  48 02 52 B5 */	bl GXInitTexObjLOD
/* 800195AC 0001552C  38 61 00 54 */	addi r3, r1, 0x54
/* 800195B0 00015530  38 80 00 00 */	li r4, 0x0
/* 800195B4 00015534  48 02 55 ED */	bl GXLoadTexObj
/* 800195B8 00015538  48 00 00 0C */	b .L_800195C4
.L_800195BC:
/* 800195BC 0001553C  38 00 00 00 */	li r0, 0x0
/* 800195C0 00015540  98 1D 00 1C */	stb r0, 0x1c(r29)
.L_800195C4:
/* 800195C4 00015544  38 60 00 01 */	li r3, 0x1
/* 800195C8 00015548  48 02 6C 0D */	bl GXSetNumTevStages
/* 800195CC 0001554C  38 60 00 00 */	li r3, 0x0
/* 800195D0 00015550  38 80 00 00 */	li r4, 0x0
/* 800195D4 00015554  38 A0 00 00 */	li r5, 0x0
/* 800195D8 00015558  38 C0 00 FF */	li r6, 0xff
/* 800195DC 0001555C  48 02 6A 59 */	bl GXSetTevOrder
/* 800195E0 00015560  38 60 00 00 */	li r3, 0x0
/* 800195E4 00015564  38 80 00 0F */	li r4, 0xf
/* 800195E8 00015568  38 A0 00 08 */	li r5, 0x8
/* 800195EC 0001556C  38 C0 00 02 */	li r6, 0x2
/* 800195F0 00015570  38 E0 00 0F */	li r7, 0xf
/* 800195F4 00015574  48 02 64 A5 */	bl GXSetTevColorIn
/* 800195F8 00015578  38 60 00 00 */	li r3, 0x0
/* 800195FC 0001557C  38 80 00 00 */	li r4, 0x0
/* 80019600 00015580  38 A0 00 00 */	li r5, 0x0
/* 80019604 00015584  38 C0 00 00 */	li r6, 0x0
/* 80019608 00015588  38 E0 00 01 */	li r7, 0x1
/* 8001960C 0001558C  39 00 00 00 */	li r8, 0x0
/* 80019610 00015590  48 02 65 8D */	bl GXSetTevColorOp
/* 80019614 00015594  38 60 00 00 */	li r3, 0x0
/* 80019618 00015598  38 80 00 07 */	li r4, 0x7
/* 8001961C 0001559C  38 A0 00 04 */	li r5, 0x4
/* 80019620 000155A0  38 C0 00 01 */	li r6, 0x1
/* 80019624 000155A4  38 E0 00 07 */	li r7, 0x7
/* 80019628 000155A8  48 02 64 F1 */	bl GXSetTevAlphaIn
/* 8001962C 000155AC  38 60 00 00 */	li r3, 0x0
/* 80019630 000155B0  38 80 00 00 */	li r4, 0x0
/* 80019634 000155B4  38 A0 00 00 */	li r5, 0x0
/* 80019638 000155B8  38 C0 00 00 */	li r6, 0x0
/* 8001963C 000155BC  38 E0 00 01 */	li r7, 0x1
/* 80019640 000155C0  39 00 00 00 */	li r8, 0x0
/* 80019644 000155C4  48 02 66 19 */	bl GXSetTevAlphaOp
/* 80019648 000155C8  38 60 00 00 */	li r3, 0x0
/* 8001964C 000155CC  38 80 00 01 */	li r4, 0x1
/* 80019650 000155D0  38 A0 00 04 */	li r5, 0x4
/* 80019654 000155D4  38 C0 00 3C */	li r6, 0x3c
/* 80019658 000155D8  38 E0 00 00 */	li r7, 0x0
/* 8001965C 000155DC  39 00 00 7D */	li r8, 0x7d
/* 80019660 000155E0  48 02 2E A5 */	bl GXSetTexCoordGen2
/* 80019664 000155E4  38 60 00 01 */	li r3, 0x1
/* 80019668 000155E8  48 02 31 6D */	bl GXSetNumTexGens
/* 8001966C 000155EC  38 60 00 01 */	li r3, 0x1
/* 80019670 000155F0  38 80 00 04 */	li r4, 0x4
/* 80019674 000155F4  38 A0 00 05 */	li r5, 0x5
/* 80019678 000155F8  38 C0 00 00 */	li r6, 0x0
/* 8001967C 000155FC  48 02 6E 3D */	bl GXSetBlendMode
/* 80019680 00015600  38 60 00 00 */	li r3, 0x0
/* 80019684 00015604  38 80 00 07 */	li r4, 0x7
/* 80019688 00015608  38 A0 00 00 */	li r5, 0x0
/* 8001968C 0001560C  48 02 6F B1 */	bl GXSetZMode
/* 80019690 00015610  28 1E 00 00 */	cmplwi r30, 0x0
/* 80019694 00015614  C3 E2 81 CC */	lfs f31, lbl_800A954C@sda21(r2)
/* 80019698 00015618  41 82 00 0C */	beq .L_800196A4
/* 8001969C 0001561C  7F C3 F3 78 */	mr r3, r30
/* 800196A0 00015620  4B FF E4 11 */	bl GetBaseRenderMode__9DGRendManFv
.L_800196A4:
/* 800196A4 00015624  C0 22 81 C8 */	lfs f1, lbl_800A9548@sda21(r2)
/* 800196A8 00015628  FC 40 F8 90 */	fmr f2, f31
/* 800196AC 0001562C  C0 82 81 D0 */	lfs f4, lbl_800A9550@sda21(r2)
/* 800196B0 00015630  38 61 00 10 */	addi r3, r1, 0x10
/* 800196B4 00015634  FC 60 08 90 */	fmr f3, f1
/* 800196B8 00015638  FC A0 08 90 */	fmr f5, f1
/* 800196BC 0001563C  C0 C2 81 D4 */	lfs f6, lbl_800A9554@sda21(r2)
/* 800196C0 00015640  48 01 69 FD */	bl C_MTXOrtho
/* 800196C4 00015644  38 61 00 10 */	addi r3, r1, 0x10
/* 800196C8 00015648  38 80 00 01 */	li r4, 0x1
/* 800196CC 0001564C  48 02 72 F9 */	bl GXSetProjection
/* 800196D0 00015650  38 61 00 10 */	addi r3, r1, 0x10
/* 800196D4 00015654  48 01 62 9D */	bl PSMTXIdentity
/* 800196D8 00015658  38 61 00 10 */	addi r3, r1, 0x10
/* 800196DC 0001565C  38 80 00 00 */	li r4, 0x0
/* 800196E0 00015660  48 02 74 BD */	bl GXLoadPosMtxImm
/* 800196E4 00015664  38 61 00 10 */	addi r3, r1, 0x10
/* 800196E8 00015668  38 80 00 3C */	li r4, 0x3c
/* 800196EC 0001566C  38 A0 00 00 */	li r5, 0x0
/* 800196F0 00015670  48 02 75 65 */	bl GXLoadTexMtxImm
/* 800196F4 00015674  80 01 00 94 */	lwz r0, 0x94(r1)
/* 800196F8 00015678  CB E1 00 88 */	lfd f31, 0x88(r1)
/* 800196FC 0001567C  83 E1 00 84 */	lwz r31, 0x84(r1)
/* 80019700 00015680  7C 08 03 A6 */	mtlr r0
/* 80019704 00015684  83 C1 00 80 */	lwz r30, 0x80(r1)
/* 80019708 00015688  83 A1 00 7C */	lwz r29, 0x7c(r1)
/* 8001970C 0001568C  38 21 00 90 */	addi r1, r1, 0x90
/* 80019710 00015690  4E 80 00 20 */	blr
.endfn Begin__6DGFontFP9DGRendMan

.fn End__6DGFontFv, global
/* 80019714 00015694  7C 08 02 A6 */	mflr r0
/* 80019718 00015698  38 80 00 01 */	li r4, 0x1
/* 8001971C 0001569C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80019720 000156A0  38 00 00 00 */	li r0, 0x0
/* 80019724 000156A4  38 A0 00 00 */	li r5, 0x0
/* 80019728 000156A8  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 8001972C 000156AC  38 C0 00 00 */	li r6, 0x0
/* 80019730 000156B0  98 03 00 1C */	stb r0, 0x1c(r3)
/* 80019734 000156B4  38 60 00 00 */	li r3, 0x0
/* 80019738 000156B8  48 02 6D 81 */	bl GXSetBlendMode
/* 8001973C 000156BC  38 60 00 01 */	li r3, 0x1
/* 80019740 000156C0  38 80 00 03 */	li r4, 0x3
/* 80019744 000156C4  38 A0 00 01 */	li r5, 0x1
/* 80019748 000156C8  48 02 6E F5 */	bl GXSetZMode
/* 8001974C 000156CC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80019750 000156D0  38 21 00 08 */	addi r1, r1, 0x8
/* 80019754 000156D4  7C 08 03 A6 */	mtlr r0
/* 80019758 000156D8  4E 80 00 20 */	blr
.endfn End__6DGFontFv

.fn SetPosition__6DGFontFss, global
/* 8001975C 000156DC  B0 83 00 10 */	sth r4, 0x10(r3)
/* 80019760 000156E0  B0 83 00 12 */	sth r4, 0x12(r3)
/* 80019764 000156E4  B0 A3 00 14 */	sth r5, 0x14(r3)
/* 80019768 000156E8  4E 80 00 20 */	blr
.endfn SetPosition__6DGFontFss

.fn SetSize__6DGFontFs, global
/* 8001976C 000156EC  B0 83 00 16 */	sth r4, 0x16(r3)
/* 80019770 000156F0  4E 80 00 20 */	blr
.endfn SetSize__6DGFontFs

.fn SetColor__6DGFontFUcUcUcUc, global
/* 80019774 000156F4  98 83 00 18 */	stb r4, 0x18(r3)
/* 80019778 000156F8  98 A3 00 19 */	stb r5, 0x19(r3)
/* 8001977C 000156FC  98 C3 00 1A */	stb r6, 0x1a(r3)
/* 80019780 00015700  98 E3 00 1B */	stb r7, 0x1b(r3)
/* 80019784 00015704  4E 80 00 20 */	blr
.endfn SetColor__6DGFontFUcUcUcUc

.fn CharOut__6DGFontFc, global
/* 80019788 00015708  7C 08 02 A6 */	mflr r0
/* 8001978C 0001570C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80019790 00015710  94 21 FF 20 */	stwu r1, -0xe0(r1)
/* 80019794 00015714  93 E1 00 DC */	stw r31, 0xdc(r1)
/* 80019798 00015718  7C 7F 1B 78 */	mr r31, r3
/* 8001979C 0001571C  93 C1 00 D8 */	stw r30, 0xd8(r1)
/* 800197A0 00015720  93 A1 00 D4 */	stw r29, 0xd4(r1)
/* 800197A4 00015724  93 81 00 D0 */	stw r28, 0xd0(r1)
/* 800197A8 00015728  88 03 00 1C */	lbz r0, 0x1c(r3)
/* 800197AC 0001572C  28 00 00 01 */	cmplwi r0, 0x1
/* 800197B0 00015730  40 82 02 64 */	bne .L_80019A14
/* 800197B4 00015734  88 BF 00 0D */	lbz r5, 0xd(r31)
/* 800197B8 00015738  7C 83 07 74 */	extsb r3, r4
/* 800197BC 0001573C  7C A0 07 74 */	extsb r0, r5
/* 800197C0 00015740  7C 03 00 00 */	cmpw r3, r0
/* 800197C4 00015744  41 80 02 50 */	blt .L_80019A14
/* 800197C8 00015748  88 1F 00 0E */	lbz r0, 0xe(r31)
/* 800197CC 0001574C  7C 00 07 74 */	extsb r0, r0
/* 800197D0 00015750  7C 03 00 00 */	cmpw r3, r0
/* 800197D4 00015754  41 81 02 40 */	bgt .L_80019A14
/* 800197D8 00015758  7C 05 20 50 */	subf r0, r5, r4
/* 800197DC 0001575C  88 DF 00 0C */	lbz r6, 0xc(r31)
/* 800197E0 00015760  54 07 06 3E */	clrlwi r7, r0, 24
/* 800197E4 00015764  88 BF 00 0B */	lbz r5, 0xb(r31)
/* 800197E8 00015768  7C 87 33 D6 */	divw r4, r7, r6
/* 800197EC 0001576C  88 7F 00 0A */	lbz r3, 0xa(r31)
/* 800197F0 00015770  7C 04 31 D6 */	mullw r0, r4, r6
/* 800197F4 00015774  7C 00 38 50 */	subf r0, r0, r7
/* 800197F8 00015778  7F C5 21 D6 */	mullw r30, r5, r4
/* 800197FC 0001577C  7F 83 01 D6 */	mullw r28, r3, r0
/* 80019800 00015780  38 60 00 80 */	li r3, 0x80
/* 80019804 00015784  38 80 00 00 */	li r4, 0x0
/* 80019808 00015788  38 A0 00 04 */	li r5, 0x4
/* 8001980C 0001578C  48 02 35 65 */	bl GXBegin
/* 80019810 00015790  AB BF 00 14 */	lha r29, 0x14(r31)
/* 80019814 00015794  57 CB 04 3E */	clrlwi r11, r30, 16
/* 80019818 00015798  AB DF 00 12 */	lha r30, 0x12(r31)
/* 8001981C 0001579C  3D 80 CC 01 */	lis r12, 0xCC008000@ha
/* 80019820 000157A0  57 88 04 3E */	clrlwi r8, r28, 16
/* 80019824 000157A4  B3 CC 80 00 */	sth r30, 0xCC008000@l(r12)
/* 80019828 000157A8  3D 40 43 30 */	lis r10, 0x4330
/* 8001982C 000157AC  C8 02 81 D8 */	lfd f0, lbl_800A9558@sda21(r2)
/* 80019830 000157B0  B3 AC 80 00 */	sth r29, -0x8000(r12)
/* 80019834 000157B4  C0 22 81 D4 */	lfs f1, lbl_800A9554@sda21(r2)
/* 80019838 000157B8  A1 3F 00 08 */	lhz r9, 0x8(r31)
/* 8001983C 000157BC  A0 FF 00 06 */	lhz r7, 0x6(r31)
/* 80019840 000157C0  91 61 00 CC */	stw r11, 0xcc(r1)
/* 80019844 000157C4  91 21 00 C4 */	stw r9, 0xc4(r1)
/* 80019848 000157C8  91 01 00 BC */	stw r8, 0xbc(r1)
/* 8001984C 000157CC  90 E1 00 B4 */	stw r7, 0xb4(r1)
/* 80019850 000157D0  91 41 00 C8 */	stw r10, 0xc8(r1)
/* 80019854 000157D4  91 41 00 C0 */	stw r10, 0xc0(r1)
/* 80019858 000157D8  C8 61 00 C8 */	lfd f3, 0xc8(r1)
/* 8001985C 000157DC  91 41 00 B8 */	stw r10, 0xb8(r1)
/* 80019860 000157E0  C8 41 00 C0 */	lfd f2, 0xc0(r1)
/* 80019864 000157E4  EC A3 00 28 */	fsubs f5, f3, f0
/* 80019868 000157E8  91 41 00 B0 */	stw r10, 0xb0(r1)
/* 8001986C 000157EC  C8 61 00 B8 */	lfd f3, 0xb8(r1)
/* 80019870 000157F0  EC 82 00 28 */	fsubs f4, f2, f0
/* 80019874 000157F4  C8 41 00 B0 */	lfd f2, 0xb0(r1)
/* 80019878 000157F8  EC 63 00 28 */	fsubs f3, f3, f0
/* 8001987C 000157FC  91 01 00 9C */	stw r8, 0x9c(r1)
/* 80019880 00015800  EC 42 00 28 */	fsubs f2, f2, f0
/* 80019884 00015804  EC 85 20 24 */	fdivs f4, f5, f4
/* 80019888 00015808  91 61 00 AC */	stw r11, 0xac(r1)
/* 8001988C 0001580C  91 21 00 A4 */	stw r9, 0xa4(r1)
/* 80019890 00015810  91 41 00 98 */	stw r10, 0x98(r1)
/* 80019894 00015814  90 E1 00 8C */	stw r7, 0x8c(r1)
/* 80019898 00015818  EC C3 10 24 */	fdivs f6, f3, f2
/* 8001989C 0001581C  91 41 00 A8 */	stw r10, 0xa8(r1)
/* 800198A0 00015820  C8 41 00 98 */	lfd f2, 0x98(r1)
/* 800198A4 00015824  91 41 00 A0 */	stw r10, 0xa0(r1)
/* 800198A8 00015828  C8 A1 00 A8 */	lfd f5, 0xa8(r1)
/* 800198AC 0001582C  91 41 00 88 */	stw r10, 0x88(r1)
/* 800198B0 00015830  EC E1 20 28 */	fsubs f7, f1, f4
/* 800198B4 00015834  C8 61 00 A0 */	lfd f3, 0xa0(r1)
/* 800198B8 00015838  EC 82 00 28 */	fsubs f4, f2, f0
/* 800198BC 0001583C  D0 CC 80 00 */	stfs f6, -0x8000(r12)
/* 800198C0 00015840  C8 41 00 88 */	lfd f2, 0x88(r1)
/* 800198C4 00015844  D0 EC 80 00 */	stfs f7, -0x8000(r12)
/* 800198C8 00015848  EC A5 00 28 */	fsubs f5, f5, f0
/* 800198CC 0001584C  EC 63 00 28 */	fsubs f3, f3, f0
/* 800198D0 00015850  88 DF 00 0A */	lbz r6, 0xa(r31)
/* 800198D4 00015854  EC 42 00 28 */	fsubs f2, f2, f0
/* 800198D8 00015858  A8 BF 00 16 */	lha r5, 0x16(r31)
/* 800198DC 0001585C  90 C1 00 94 */	stw r6, 0x94(r1)
/* 800198E0 00015860  EC A5 18 24 */	fdivs f5, f5, f3
/* 800198E4 00015864  7C 06 29 D6 */	mullw r0, r6, r5
/* 800198E8 00015868  91 41 00 90 */	stw r10, 0x90(r1)
/* 800198EC 0001586C  C8 61 00 90 */	lfd f3, 0x90(r1)
/* 800198F0 00015870  7C 9E 02 14 */	add r4, r30, r0
/* 800198F4 00015874  EC 63 00 28 */	fsubs f3, f3, f0
/* 800198F8 00015878  B0 8C 80 00 */	sth r4, -0x8000(r12)
/* 800198FC 0001587C  EC A1 28 28 */	fsubs f5, f1, f5
/* 80019900 00015880  B3 AC 80 00 */	sth r29, -0x8000(r12)
/* 80019904 00015884  EC 64 18 2A */	fadds f3, f4, f3
/* 80019908 00015888  EC 43 10 24 */	fdivs f2, f3, f2
/* 8001990C 0001588C  D0 4C 80 00 */	stfs f2, -0x8000(r12)
/* 80019910 00015890  D0 AC 80 00 */	stfs f5, -0x8000(r12)
/* 80019914 00015894  88 7F 00 0B */	lbz r3, 0xb(r31)
/* 80019918 00015898  7C 03 29 D6 */	mullw r0, r3, r5
/* 8001991C 0001589C  7C 1D 02 14 */	add r0, r29, r0
/* 80019920 000158A0  91 61 00 84 */	stw r11, 0x84(r1)
/* 80019924 000158A4  90 61 00 7C */	stw r3, 0x7c(r1)
/* 80019928 000158A8  91 01 00 6C */	stw r8, 0x6c(r1)
/* 8001992C 000158AC  90 C1 00 64 */	stw r6, 0x64(r1)
/* 80019930 000158B0  91 41 00 80 */	stw r10, 0x80(r1)
/* 80019934 000158B4  91 41 00 78 */	stw r10, 0x78(r1)
/* 80019938 000158B8  C8 61 00 80 */	lfd f3, 0x80(r1)
/* 8001993C 000158BC  91 21 00 74 */	stw r9, 0x74(r1)
/* 80019940 000158C0  C8 41 00 78 */	lfd f2, 0x78(r1)
/* 80019944 000158C4  EC 83 00 28 */	fsubs f4, f3, f0
/* 80019948 000158C8  91 41 00 68 */	stw r10, 0x68(r1)
/* 8001994C 000158CC  EC 42 00 28 */	fsubs f2, f2, f0
/* 80019950 000158D0  91 41 00 60 */	stw r10, 0x60(r1)
/* 80019954 000158D4  C8 61 00 68 */	lfd f3, 0x68(r1)
/* 80019958 000158D8  90 E1 00 5C */	stw r7, 0x5c(r1)
/* 8001995C 000158DC  EC C4 10 2A */	fadds f6, f4, f2
/* 80019960 000158E0  C8 41 00 60 */	lfd f2, 0x60(r1)
/* 80019964 000158E4  EC 63 00 28 */	fsubs f3, f3, f0
/* 80019968 000158E8  91 41 00 70 */	stw r10, 0x70(r1)
/* 8001996C 000158EC  EC 42 00 28 */	fsubs f2, f2, f0
/* 80019970 000158F0  91 41 00 58 */	stw r10, 0x58(r1)
/* 80019974 000158F4  C8 81 00 70 */	lfd f4, 0x70(r1)
/* 80019978 000158F8  91 61 00 54 */	stw r11, 0x54(r1)
/* 8001997C 000158FC  EC A3 10 2A */	fadds f5, f3, f2
/* 80019980 00015900  C8 41 00 58 */	lfd f2, 0x58(r1)
/* 80019984 00015904  EC 64 00 28 */	fsubs f3, f4, f0
/* 80019988 00015908  90 61 00 4C */	stw r3, 0x4c(r1)
/* 8001998C 0001590C  EC 82 00 28 */	fsubs f4, f2, f0
/* 80019990 00015910  91 41 00 50 */	stw r10, 0x50(r1)
/* 80019994 00015914  ED 06 18 24 */	fdivs f8, f6, f3
/* 80019998 00015918  91 41 00 48 */	stw r10, 0x48(r1)
/* 8001999C 0001591C  C8 61 00 50 */	lfd f3, 0x50(r1)
/* 800199A0 00015920  91 21 00 44 */	stw r9, 0x44(r1)
/* 800199A4 00015924  C8 41 00 48 */	lfd f2, 0x48(r1)
/* 800199A8 00015928  91 01 00 3C */	stw r8, 0x3c(r1)
/* 800199AC 0001592C  EC E5 20 24 */	fdivs f7, f5, f4
/* 800199B0 00015930  90 E1 00 34 */	stw r7, 0x34(r1)
/* 800199B4 00015934  91 41 00 40 */	stw r10, 0x40(r1)
/* 800199B8 00015938  91 41 00 38 */	stw r10, 0x38(r1)
/* 800199BC 0001593C  C8 81 00 40 */	lfd f4, 0x40(r1)
/* 800199C0 00015940  91 41 00 30 */	stw r10, 0x30(r1)
/* 800199C4 00015944  EC C3 00 28 */	fsubs f6, f3, f0
/* 800199C8 00015948  EC A2 00 28 */	fsubs f5, f2, f0
/* 800199CC 0001594C  C8 61 00 38 */	lfd f3, 0x38(r1)
/* 800199D0 00015950  C8 41 00 30 */	lfd f2, 0x30(r1)
/* 800199D4 00015954  B0 8C 80 00 */	sth r4, -0x8000(r12)
/* 800199D8 00015958  EC A6 28 2A */	fadds f5, f6, f5
/* 800199DC 0001595C  EC 84 00 28 */	fsubs f4, f4, f0
/* 800199E0 00015960  B0 0C 80 00 */	sth r0, -0x8000(r12)
/* 800199E4 00015964  EC 63 00 28 */	fsubs f3, f3, f0
/* 800199E8 00015968  EC 02 00 28 */	fsubs f0, f2, f0
/* 800199EC 0001596C  EC 45 20 24 */	fdivs f2, f5, f4
/* 800199F0 00015970  D0 EC 80 00 */	stfs f7, -0x8000(r12)
/* 800199F4 00015974  EC 81 40 28 */	fsubs f4, f1, f8
/* 800199F8 00015978  EC 03 00 24 */	fdivs f0, f3, f0
/* 800199FC 0001597C  D0 8C 80 00 */	stfs f4, -0x8000(r12)
/* 80019A00 00015980  B3 CC 80 00 */	sth r30, -0x8000(r12)
/* 80019A04 00015984  B0 0C 80 00 */	sth r0, -0x8000(r12)
/* 80019A08 00015988  EC 21 10 28 */	fsubs f1, f1, f2
/* 80019A0C 0001598C  D0 0C 80 00 */	stfs f0, -0x8000(r12)
/* 80019A10 00015990  D0 2C 80 00 */	stfs f1, -0x8000(r12)
.L_80019A14:
/* 80019A14 00015994  80 01 00 E4 */	lwz r0, 0xe4(r1)
/* 80019A18 00015998  83 E1 00 DC */	lwz r31, 0xdc(r1)
/* 80019A1C 0001599C  83 C1 00 D8 */	lwz r30, 0xd8(r1)
/* 80019A20 000159A0  7C 08 03 A6 */	mtlr r0
/* 80019A24 000159A4  83 A1 00 D4 */	lwz r29, 0xd4(r1)
/* 80019A28 000159A8  83 81 00 D0 */	lwz r28, 0xd0(r1)
/* 80019A2C 000159AC  38 21 00 E0 */	addi r1, r1, 0xe0
/* 80019A30 000159B0  4E 80 00 20 */	blr
.endfn CharOut__6DGFontFc

.fn StrOut__6DGFontFPCc, global
/* 80019A34 000159B4  7C 08 02 A6 */	mflr r0
/* 80019A38 000159B8  90 01 00 04 */	stw r0, 0x4(r1)
/* 80019A3C 000159BC  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80019A40 000159C0  93 E1 00 24 */	stw r31, 0x24(r1)
/* 80019A44 000159C4  93 C1 00 20 */	stw r30, 0x20(r1)
/* 80019A48 000159C8  3B C4 00 00 */	addi r30, r4, 0x0
/* 80019A4C 000159CC  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 80019A50 000159D0  7C 7D 1B 78 */	mr r29, r3
/* 80019A54 000159D4  93 81 00 18 */	stw r28, 0x18(r1)
/* 80019A58 000159D8  80 03 00 18 */	lwz r0, 0x18(r3)
/* 80019A5C 000159DC  38 61 00 10 */	addi r3, r1, 0x10
/* 80019A60 000159E0  38 83 00 00 */	addi r4, r3, 0x0
/* 80019A64 000159E4  90 01 00 10 */	stw r0, 0x10(r1)
/* 80019A68 000159E8  38 60 00 01 */	li r3, 0x1
/* 80019A6C 000159EC  48 02 62 B1 */	bl GXSetTevColor
/* 80019A70 000159F0  3B E0 00 00 */	li r31, 0x0
/* 80019A74 000159F4  48 00 00 54 */	b .L_80019AC8
.L_80019A78:
/* 80019A78 000159F8  7F A3 EB 78 */	mr r3, r29
/* 80019A7C 000159FC  4B FF FD 0D */	bl CharOut__6DGFontFc
/* 80019A80 00015A00  88 7D 00 0A */	lbz r3, 0xa(r29)
/* 80019A84 00015A04  A8 1D 00 16 */	lha r0, 0x16(r29)
/* 80019A88 00015A08  A8 9D 00 12 */	lha r4, 0x12(r29)
/* 80019A8C 00015A0C  7C 03 01 D6 */	mullw r0, r3, r0
/* 80019A90 00015A10  7C 04 02 14 */	add r0, r4, r0
/* 80019A94 00015A14  B0 1D 00 12 */	sth r0, 0x12(r29)
/* 80019A98 00015A18  88 1C 00 00 */	lbz r0, 0x0(r28)
/* 80019A9C 00015A1C  2C 00 00 0A */	cmpwi r0, 0xa
/* 80019AA0 00015A20  40 82 00 24 */	bne .L_80019AC4
/* 80019AA4 00015A24  A8 1D 00 10 */	lha r0, 0x10(r29)
/* 80019AA8 00015A28  B0 1D 00 12 */	sth r0, 0x12(r29)
/* 80019AAC 00015A2C  88 7D 00 0B */	lbz r3, 0xb(r29)
/* 80019AB0 00015A30  A8 1D 00 16 */	lha r0, 0x16(r29)
/* 80019AB4 00015A34  A8 9D 00 14 */	lha r4, 0x14(r29)
/* 80019AB8 00015A38  7C 03 01 D6 */	mullw r0, r3, r0
/* 80019ABC 00015A3C  7C 04 02 14 */	add r0, r4, r0
/* 80019AC0 00015A40  B0 1D 00 14 */	sth r0, 0x14(r29)
.L_80019AC4:
/* 80019AC4 00015A44  3B FF 00 01 */	addi r31, r31, 0x1
.L_80019AC8:
/* 80019AC8 00015A48  57 E0 06 3E */	clrlwi r0, r31, 24
/* 80019ACC 00015A4C  2C 00 04 00 */	cmpwi r0, 0x400
/* 80019AD0 00015A50  40 80 00 14 */	bge .L_80019AE4
/* 80019AD4 00015A54  7F 9E 02 14 */	add r28, r30, r0
/* 80019AD8 00015A58  88 9C 00 00 */	lbz r4, 0x0(r28)
/* 80019ADC 00015A5C  7C 80 07 75 */	extsb. r0, r4
/* 80019AE0 00015A60  40 82 FF 98 */	bne .L_80019A78
.L_80019AE4:
/* 80019AE4 00015A64  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80019AE8 00015A68  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 80019AEC 00015A6C  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 80019AF0 00015A70  7C 08 03 A6 */	mtlr r0
/* 80019AF4 00015A74  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 80019AF8 00015A78  83 81 00 18 */	lwz r28, 0x18(r1)
/* 80019AFC 00015A7C  38 21 00 28 */	addi r1, r1, 0x28
/* 80019B00 00015A80  4E 80 00 20 */	blr
.endfn StrOut__6DGFontFPCc

.section .data, "wa"  # 0x80065000 - 0x8006D1C0 ; 0x000081C0

lbl_80066CA8:
	.asciz "DGFont::DGFont>\n"
	.balign 4
	.4byte 0

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0 ; 0x00000820

lbl_800A9548:
	.4byte 0

lbl_800A954C:
	.4byte 0x43F00000

lbl_800A9550:
	.4byte 0x44200000

lbl_800A9554:
	.4byte 0x3F800000

lbl_800A9558:
	.4byte 0x43300000
	.4byte 0
