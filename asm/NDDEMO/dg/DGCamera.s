.include "macros.s"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740



__ct__8DGCameraFv:
/* 800186C4 00014644  7C 08 02 A6 */	mflr r0
/* 800186C8 00014648  90 01 00 04 */	stw r0, 0x4(r1)
/* 800186CC 0001464C  94 21 FF A8 */	stwu r1, -0x58(r1)
/* 800186D0 00014650  93 E1 00 54 */	stw r31, 0x54(r1)
/* 800186D4 00014654  90 61 00 08 */	stw r3, 0x8(r1)
/* 800186D8 00014658  3C 60 80 06 */	lis r3, lbl_80064280@ha
/* 800186DC 0001465C  3B E3 42 80 */	addi r31, r3, lbl_80064280@l
/* 800186E0 00014660  80 61 00 08 */	lwz r3, 0x8(r1)
/* 800186E4 00014664  48 00 08 35 */	bl __ct__10DGPositionFv
/* 800186E8 00014668  80 61 00 08 */	lwz r3, 0x8(r1)
/* 800186EC 0001466C  C0 22 81 84 */	lfs f1, lbl_800A9504@sda21(r2)
/* 800186F0 00014670  C0 42 81 88 */	lfs f2, lbl_800A9508@sda21(r2)
/* 800186F4 00014674  C0 62 81 8C */	lfs f3, lbl_800A950C@sda21(r2)
/* 800186F8 00014678  C0 82 81 90 */	lfs f4, lbl_800A9510@sda21(r2)
/* 800186FC 0001467C  48 00 01 41 */	bl SetCameraFrustum__8DGCameraFffff
/* 80018700 00014680  80 61 00 08 */	lwz r3, 0x8(r1)
/* 80018704 00014684  C0 22 81 84 */	lfs f1, lbl_800A9504@sda21(r2)
/* 80018708 00014688  C0 42 81 88 */	lfs f2, lbl_800A9508@sda21(r2)
/* 8001870C 0001468C  C0 62 81 8C */	lfs f3, lbl_800A950C@sda21(r2)
/* 80018710 00014690  48 00 02 79 */	bl SetLightFrustum__8DGCameraFfff
/* 80018714 00014694  80 BF 00 00 */	lwz r5, 0x0(r31)
/* 80018718 00014698  38 81 00 40 */	addi r4, r1, 0x40
/* 8001871C 0001469C  80 1F 00 04 */	lwz r0, 0x4(r31)
/* 80018720 000146A0  80 61 00 08 */	lwz r3, 0x8(r1)
/* 80018724 000146A4  90 A1 00 40 */	stw r5, 0x40(r1)
/* 80018728 000146A8  90 01 00 44 */	stw r0, 0x44(r1)
/* 8001872C 000146AC  80 1F 00 08 */	lwz r0, 0x8(r31)
/* 80018730 000146B0  90 01 00 48 */	stw r0, 0x48(r1)
/* 80018734 000146B4  48 00 09 91 */	bl SetPosition__10DGPositionFRC3Vec
/* 80018738 000146B8  80 BF 00 0C */	lwz r5, 0xc(r31)
/* 8001873C 000146BC  38 81 00 18 */	addi r4, r1, 0x18
/* 80018740 000146C0  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 80018744 000146C4  80 61 00 08 */	lwz r3, 0x8(r1)
/* 80018748 000146C8  90 A1 00 18 */	stw r5, 0x18(r1)
/* 8001874C 000146CC  90 01 00 1C */	stw r0, 0x1c(r1)
/* 80018750 000146D0  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 80018754 000146D4  90 01 00 20 */	stw r0, 0x20(r1)
/* 80018758 000146D8  48 00 02 F5 */	bl SetCamUp__8DGCameraF3Vec
/* 8001875C 000146DC  80 BF 00 18 */	lwz r5, 0x18(r31)
/* 80018760 000146E0  38 81 00 0C */	addi r4, r1, 0xc
/* 80018764 000146E4  80 1F 00 1C */	lwz r0, 0x1c(r31)
/* 80018768 000146E8  80 61 00 08 */	lwz r3, 0x8(r1)
/* 8001876C 000146EC  90 A1 00 0C */	stw r5, 0xc(r1)
/* 80018770 000146F0  90 01 00 10 */	stw r0, 0x10(r1)
/* 80018774 000146F4  80 1F 00 20 */	lwz r0, 0x20(r31)
/* 80018778 000146F8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8001877C 000146FC  48 00 02 ED */	bl SetTargetPos__8DGCameraF3Vec
/* 80018780 00014700  80 61 00 08 */	lwz r3, 0x8(r1)
/* 80018784 00014704  38 80 00 00 */	li r4, 0x0
/* 80018788 00014708  48 00 03 19 */	bl SetTargetMode__8DGCameraF26enumDG_RENDMAN_TARGET_MODE
/* 8001878C 0001470C  80 02 81 80 */	lwz r0, lbl_800A9500@sda21(r2)
/* 80018790 00014710  38 81 00 24 */	addi r4, r1, 0x24
/* 80018794 00014714  80 61 00 08 */	lwz r3, 0x8(r1)
/* 80018798 00014718  90 01 00 24 */	stw r0, 0x24(r1)
/* 8001879C 0001471C  48 00 07 71 */	bl SetFogColor__8DGCameraFRC8_GXColor
/* 800187A0 00014720  83 E1 00 08 */	lwz r31, 0x8(r1)
/* 800187A4 00014724  38 00 00 00 */	li r0, 0x0
/* 800187A8 00014728  98 1F 01 1C */	stb r0, 0x11c(r31)
/* 800187AC 0001472C  7F E3 FB 78 */	mr r3, r31
/* 800187B0 00014730  98 1F 01 1D */	stb r0, 0x11d(r31)
/* 800187B4 00014734  98 1F 01 1E */	stb r0, 0x11e(r31)
/* 800187B8 00014738  98 1F 01 1F */	stb r0, 0x11f(r31)
/* 800187BC 0001473C  90 1F 01 20 */	stw r0, 0x120(r31)
/* 800187C0 00014740  C0 22 81 94 */	lfs f1, lbl_800A9514@sda21(r2)
/* 800187C4 00014744  C0 42 81 98 */	lfs f2, lbl_800A9518@sda21(r2)
/* 800187C8 00014748  48 00 07 11 */	bl SetFogRangeRatio__8DGCameraFff
/* 800187CC 0001474C  80 01 00 5C */	lwz r0, 0x5c(r1)
/* 800187D0 00014750  7F E3 FB 78 */	mr r3, r31
/* 800187D4 00014754  83 E1 00 54 */	lwz r31, 0x54(r1)
/* 800187D8 00014758  38 21 00 58 */	addi r1, r1, 0x58
/* 800187DC 0001475C  7C 08 03 A6 */	mtlr r0
/* 800187E0 00014760  4E 80 00 20 */	blr

__dt__8DGCameraFv:
/* 800187E4 00014764  7C 08 02 A6 */	mflr r0
/* 800187E8 00014768  90 01 00 04 */	stw r0, 0x4(r1)
/* 800187EC 0001476C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800187F0 00014770  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800187F4 00014774  3B E4 00 00 */	addi r31, r4, 0x0
/* 800187F8 00014778  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800187FC 0001477C  7C 7E 1B 79 */	mr. r30, r3
/* 80018800 00014780  41 82 00 20 */	beq lbl_80018820
/* 80018804 00014784  38 7E 00 00 */	addi r3, r30, 0x0
/* 80018808 00014788  38 80 00 00 */	li r4, 0x0
/* 8001880C 0001478C  48 00 07 75 */	bl __dt__10DGPositionFv
/* 80018810 00014790  7F E0 07 35 */	extsh. r0, r31
/* 80018814 00014794  40 81 00 0C */	ble lbl_80018820
/* 80018818 00014798  7F C3 F3 78 */	mr r3, r30
/* 8001881C 0001479C  4B FF A2 7D */	bl mFree__FPv
lbl_80018820:
/* 80018820 000147A0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80018824 000147A4  7F C3 F3 78 */	mr r3, r30
/* 80018828 000147A8  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8001882C 000147AC  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 80018830 000147B0  7C 08 03 A6 */	mtlr r0
/* 80018834 000147B4  38 21 00 18 */	addi r1, r1, 0x18
/* 80018838 000147B8  4E 80 00 20 */	blr

SetCameraFrustum__8DGCameraFffff:
/* 8001883C 000147BC  7C 08 02 A6 */	mflr r0
/* 80018840 000147C0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80018844 000147C4  94 21 FF B8 */	stwu r1, -0x48(r1)
/* 80018848 000147C8  DB E1 00 40 */	stfd f31, 0x40(r1)
/* 8001884C 000147CC  FF E0 20 90 */	fmr f31, f4
/* 80018850 000147D0  DB C1 00 38 */	stfd f30, 0x38(r1)
/* 80018854 000147D4  FF C0 18 90 */	fmr f30, f3
/* 80018858 000147D8  DB A1 00 30 */	stfd f29, 0x30(r1)
/* 8001885C 000147DC  FF A0 10 90 */	fmr f29, f2
/* 80018860 000147E0  DB 81 00 28 */	stfd f28, 0x28(r1)
/* 80018864 000147E4  FF 80 08 90 */	fmr f28, f1
/* 80018868 000147E8  93 E1 00 24 */	stw r31, 0x24(r1)
/* 8001886C 000147EC  7C 7F 1B 78 */	mr r31, r3
/* 80018870 000147F0  38 60 00 03 */	li r3, 0x3
/* 80018874 000147F4  D3 DF 00 F8 */	stfs f30, 0xf8(r31)
/* 80018878 000147F8  D3 FF 00 FC */	stfs f31, 0xfc(r31)
/* 8001887C 000147FC  48 02 4C A1 */	bl GXSetCopyClamp
/* 80018880 00014800  FC 40 E0 50 */	fneg f2, f28
/* 80018884 00014804  C0 82 81 9C */	lfs f4, lbl_800A951C@sda21(r2)
/* 80018888 00014808  FC 00 E8 50 */	fneg f0, f29
/* 8001888C 0001480C  38 7F 00 58 */	addi r3, r31, 0x58
/* 80018890 00014810  FC A0 F0 90 */	fmr f5, f30
/* 80018894 00014814  FC C0 F8 90 */	fmr f6, f31
/* 80018898 00014818  EC 3C 01 32 */	fmuls f1, f28, f4
/* 8001889C 0001481C  EC 42 01 32 */	fmuls f2, f2, f4
/* 800188A0 00014820  EC 60 01 32 */	fmuls f3, f0, f4
/* 800188A4 00014824  EC 9D 01 32 */	fmuls f4, f29, f4
/* 800188A8 00014828  48 01 77 79 */	bl C_MTXFrustum
/* 800188AC 0001482C  80 01 00 4C */	lwz r0, 0x4c(r1)
/* 800188B0 00014830  CB E1 00 40 */	lfd f31, 0x40(r1)
/* 800188B4 00014834  CB C1 00 38 */	lfd f30, 0x38(r1)
/* 800188B8 00014838  7C 08 03 A6 */	mtlr r0
/* 800188BC 0001483C  CB A1 00 30 */	lfd f29, 0x30(r1)
/* 800188C0 00014840  CB 81 00 28 */	lfd f28, 0x28(r1)
/* 800188C4 00014844  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800188C8 00014848  38 21 00 48 */	addi r1, r1, 0x48
/* 800188CC 0001484C  4E 80 00 20 */	blr

SetCameraFrustumUpper__8DGCameraFffff:
/* 800188D0 00014850  7C 08 02 A6 */	mflr r0
/* 800188D4 00014854  FD 00 10 90 */	fmr f8, f2
/* 800188D8 00014858  90 01 00 04 */	stw r0, 0x4(r1)
/* 800188DC 0001485C  38 83 00 00 */	addi r4, r3, 0x0
/* 800188E0 00014860  FC 40 08 50 */	fneg f2, f1
/* 800188E4 00014864  38 64 00 58 */	addi r3, r4, 0x58
/* 800188E8 00014868  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 800188EC 0001486C  FC 00 40 50 */	fneg f0, f8
/* 800188F0 00014870  FC A0 18 90 */	fmr f5, f3
/* 800188F4 00014874  D0 64 00 F8 */	stfs f3, 0xf8(r4)
/* 800188F8 00014878  FC C0 20 90 */	fmr f6, f4
/* 800188FC 0001487C  D0 84 00 FC */	stfs f4, 0xfc(r4)
/* 80018900 00014880  C0 E2 81 9C */	lfs f7, lbl_800A951C@sda21(r2)
/* 80018904 00014884  EC 21 01 F2 */	fmuls f1, f1, f7
/* 80018908 00014888  EC 42 01 F2 */	fmuls f2, f2, f7
/* 8001890C 0001488C  EC 60 01 F2 */	fmuls f3, f0, f7
/* 80018910 00014890  EC 88 01 F2 */	fmuls f4, f8, f7
/* 80018914 00014894  48 01 77 0D */	bl C_MTXFrustum
/* 80018918 00014898  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8001891C 0001489C  38 21 00 08 */	addi r1, r1, 0x8
/* 80018920 000148A0  7C 08 03 A6 */	mtlr r0
/* 80018924 000148A4  4E 80 00 20 */	blr

SetCameraFrustumLower__8DGCameraFfffff:
/* 80018928 000148A8  7C 08 02 A6 */	mflr r0
/* 8001892C 000148AC  38 83 00 00 */	addi r4, r3, 0x0
/* 80018930 000148B0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80018934 000148B4  FD 00 10 90 */	fmr f8, f2
/* 80018938 000148B8  FC C0 20 90 */	fmr f6, f4
/* 8001893C 000148BC  38 64 00 58 */	addi r3, r4, 0x58
/* 80018940 000148C0  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80018944 000148C4  FC E0 08 50 */	fneg f7, f1
/* 80018948 000148C8  D0 64 00 F8 */	stfs f3, 0xf8(r4)
/* 8001894C 000148CC  FC 40 40 50 */	fneg f2, f8
/* 80018950 000148D0  D0 84 00 FC */	stfs f4, 0xfc(r4)
/* 80018954 000148D4  C0 82 81 A0 */	lfs f4, lbl_800A9520@sda21(r2)
/* 80018958 000148D8  C0 02 81 9C */	lfs f0, lbl_800A951C@sda21(r2)
/* 8001895C 000148DC  EC 84 28 24 */	fdivs f4, f4, f5
/* 80018960 000148E0  EC 24 00 72 */	fmuls f1, f4, f1
/* 80018964 000148E4  FC A0 18 90 */	fmr f5, f3
/* 80018968 000148E8  EC 62 00 32 */	fmuls f3, f2, f0
/* 8001896C 000148EC  EC 47 08 2A */	fadds f2, f7, f1
/* 80018970 000148F0  EC 88 00 32 */	fmuls f4, f8, f0
/* 80018974 000148F4  48 01 76 AD */	bl C_MTXFrustum
/* 80018978 000148F8  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8001897C 000148FC  38 21 00 08 */	addi r1, r1, 0x8
/* 80018980 00014900  7C 08 03 A6 */	mtlr r0
/* 80018984 00014904  4E 80 00 20 */	blr

SetLightFrustum__8DGCameraFfff:
/* 80018988 00014908  7C 08 02 A6 */	mflr r0
/* 8001898C 0001490C  FC 00 10 50 */	fneg f0, f2
/* 80018990 00014910  90 01 00 04 */	stw r0, 0x4(r1)
/* 80018994 00014914  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 80018998 00014918  DB E1 00 48 */	stfd f31, 0x48(r1)
/* 8001899C 0001491C  DB C1 00 40 */	stfd f30, 0x40(r1)
/* 800189A0 00014920  DB A1 00 38 */	stfd f29, 0x38(r1)
/* 800189A4 00014924  DB 81 00 30 */	stfd f28, 0x30(r1)
/* 800189A8 00014928  DB 61 00 28 */	stfd f27, 0x28(r1)
/* 800189AC 0001492C  FF 60 18 90 */	fmr f27, f3
/* 800189B0 00014930  FC 60 08 50 */	fneg f3, f1
/* 800189B4 00014934  93 E1 00 24 */	stw r31, 0x24(r1)
/* 800189B8 00014938  7C 7F 1B 78 */	mr r31, r3
/* 800189BC 0001493C  FC A0 D8 90 */	fmr f5, f27
/* 800189C0 00014940  C0 C2 81 9C */	lfs f6, lbl_800A951C@sda21(r2)
/* 800189C4 00014944  38 7F 00 98 */	addi r3, r31, 0x98
/* 800189C8 00014948  EF 81 01 B2 */	fmuls f28, f1, f6
/* 800189CC 0001494C  D0 C1 00 08 */	stfs f6, 0x8(r1)
/* 800189D0 00014950  EF E2 01 B2 */	fmuls f31, f2, f6
/* 800189D4 00014954  EF A3 01 B2 */	fmuls f29, f3, f6
/* 800189D8 00014958  EF C0 01 B2 */	fmuls f30, f0, f6
/* 800189DC 0001495C  FC 20 E0 90 */	fmr f1, f28
/* 800189E0 00014960  FC 40 E8 90 */	fmr f2, f29
/* 800189E4 00014964  FC 60 F0 90 */	fmr f3, f30
/* 800189E8 00014968  FC 80 F8 90 */	fmr f4, f31
/* 800189EC 0001496C  FC E0 30 90 */	fmr f7, f6
/* 800189F0 00014970  FD 00 30 90 */	fmr f8, f6
/* 800189F4 00014974  48 01 74 F1 */	bl C_MTXLightFrustum
/* 800189F8 00014978  C0 C2 81 9C */	lfs f6, lbl_800A951C@sda21(r2)
/* 800189FC 0001497C  FC 20 E0 90 */	fmr f1, f28
/* 80018A00 00014980  FC 40 E8 90 */	fmr f2, f29
/* 80018A04 00014984  38 7F 00 C8 */	addi r3, r31, 0xc8
/* 80018A08 00014988  D0 C1 00 08 */	stfs f6, 0x8(r1)
/* 80018A0C 0001498C  FC 60 F0 90 */	fmr f3, f30
/* 80018A10 00014990  FC 80 F8 90 */	fmr f4, f31
/* 80018A14 00014994  FC A0 D8 90 */	fmr f5, f27
/* 80018A18 00014998  C0 E2 81 A4 */	lfs f7, lbl_800A9524@sda21(r2)
/* 80018A1C 0001499C  FD 00 30 90 */	fmr f8, f6
/* 80018A20 000149A0  48 01 74 C5 */	bl C_MTXLightFrustum
/* 80018A24 000149A4  80 01 00 54 */	lwz r0, 0x54(r1)
/* 80018A28 000149A8  CB E1 00 48 */	lfd f31, 0x48(r1)
/* 80018A2C 000149AC  CB C1 00 40 */	lfd f30, 0x40(r1)
/* 80018A30 000149B0  7C 08 03 A6 */	mtlr r0
/* 80018A34 000149B4  CB A1 00 38 */	lfd f29, 0x38(r1)
/* 80018A38 000149B8  CB 81 00 30 */	lfd f28, 0x30(r1)
/* 80018A3C 000149BC  CB 61 00 28 */	lfd f27, 0x28(r1)
/* 80018A40 000149C0  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 80018A44 000149C4  38 21 00 50 */	addi r1, r1, 0x50
/* 80018A48 000149C8  4E 80 00 20 */	blr

SetCamUp__8DGCameraF3Vec:
/* 80018A4C 000149CC  80 A4 00 00 */	lwz r5, 0x0(r4)
/* 80018A50 000149D0  80 04 00 04 */	lwz r0, 0x4(r4)
/* 80018A54 000149D4  90 A3 01 00 */	stw r5, 0x100(r3)
/* 80018A58 000149D8  90 03 01 04 */	stw r0, 0x104(r3)
/* 80018A5C 000149DC  80 04 00 08 */	lwz r0, 0x8(r4)
/* 80018A60 000149E0  90 03 01 08 */	stw r0, 0x108(r3)
/* 80018A64 000149E4  4E 80 00 20 */	blr

SetTargetPos__8DGCameraF3Vec:
/* 80018A68 000149E8  80 A4 00 00 */	lwz r5, 0x0(r4)
/* 80018A6C 000149EC  80 04 00 04 */	lwz r0, 0x4(r4)
/* 80018A70 000149F0  90 A3 01 0C */	stw r5, 0x10c(r3)
/* 80018A74 000149F4  90 03 01 10 */	stw r0, 0x110(r3)
/* 80018A78 000149F8  80 04 00 08 */	lwz r0, 0x8(r4)
/* 80018A7C 000149FC  90 03 01 14 */	stw r0, 0x114(r3)
/* 80018A80 00014A00  4E 80 00 20 */	blr

GetTargetPos__8DGCameraFv:
/* 80018A84 00014A04  80 A4 01 0C */	lwz r5, 0x10c(r4)
/* 80018A88 00014A08  80 04 01 10 */	lwz r0, 0x110(r4)
/* 80018A8C 00014A0C  90 A3 00 00 */	stw r5, 0x0(r3)
/* 80018A90 00014A10  90 03 00 04 */	stw r0, 0x4(r3)
/* 80018A94 00014A14  80 04 01 14 */	lwz r0, 0x114(r4)
/* 80018A98 00014A18  90 03 00 08 */	stw r0, 0x8(r3)
/* 80018A9C 00014A1C  4E 80 00 20 */	blr

SetTargetMode__8DGCameraF26enumDG_RENDMAN_TARGET_MODE:
/* 80018AA0 00014A20  90 83 01 18 */	stw r4, 0x118(r3)
/* 80018AA4 00014A24  4E 80 00 20 */	blr

SetCamera__8DGCameraFRA3_A4_f:
/* 80018AA8 00014A28  7C 08 02 A6 */	mflr r0
/* 80018AAC 00014A2C  90 01 00 04 */	stw r0, 0x4(r1)
/* 80018AB0 00014A30  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80018AB4 00014A34  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80018AB8 00014A38  3B E4 00 00 */	addi r31, r4, 0x0
/* 80018ABC 00014A3C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80018AC0 00014A40  3B C3 00 00 */	addi r30, r3, 0x0
/* 80018AC4 00014A44  48 00 00 4D */	bl SetProjectionMtx__8DGCameraFv
/* 80018AC8 00014A48  38 7E 00 00 */	addi r3, r30, 0x0
/* 80018ACC 00014A4C  38 9F 00 00 */	addi r4, r31, 0x0
/* 80018AD0 00014A50  48 00 00 69 */	bl GetViewMtx__8DGCameraFRA3_A4_f
/* 80018AD4 00014A54  80 1E 01 1C */	lwz r0, 0x11c(r30)
/* 80018AD8 00014A58  38 81 00 10 */	addi r4, r1, 0x10
/* 80018ADC 00014A5C  90 01 00 10 */	stw r0, 0x10(r1)
/* 80018AE0 00014A60  80 7E 01 20 */	lwz r3, 0x120(r30)
/* 80018AE4 00014A64  C0 3E 01 24 */	lfs f1, 0x124(r30)
/* 80018AE8 00014A68  C0 5E 01 28 */	lfs f2, 0x128(r30)
/* 80018AEC 00014A6C  C0 7E 00 F8 */	lfs f3, 0xf8(r30)
/* 80018AF0 00014A70  C0 9E 00 FC */	lfs f4, 0xfc(r30)
/* 80018AF4 00014A74  48 02 77 15 */	bl GXSetFog
/* 80018AF8 00014A78  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80018AFC 00014A7C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80018B00 00014A80  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80018B04 00014A84  7C 08 03 A6 */	mtlr r0
/* 80018B08 00014A88  38 21 00 20 */	addi r1, r1, 0x20
/* 80018B0C 00014A8C  4E 80 00 20 */	blr

SetProjectionMtx__8DGCameraFv:
/* 80018B10 00014A90  7C 08 02 A6 */	mflr r0
/* 80018B14 00014A94  38 63 00 58 */	addi r3, r3, 0x58
/* 80018B18 00014A98  90 01 00 04 */	stw r0, 0x4(r1)
/* 80018B1C 00014A9C  38 80 00 00 */	li r4, 0x0
/* 80018B20 00014AA0  94 21 FF F8 */	stwu r1, -0x8(r1)
/* 80018B24 00014AA4  48 02 7E A1 */	bl GXSetProjection
/* 80018B28 00014AA8  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80018B2C 00014AAC  38 21 00 08 */	addi r1, r1, 0x8
/* 80018B30 00014AB0  7C 08 03 A6 */	mtlr r0
/* 80018B34 00014AB4  4E 80 00 20 */	blr

GetViewMtx__8DGCameraFRA3_A4_f:
/* 80018B38 00014AB8  7C 08 02 A6 */	mflr r0
/* 80018B3C 00014ABC  90 01 00 04 */	stw r0, 0x4(r1)
/* 80018B40 00014AC0  94 21 FF 60 */	stwu r1, -0xa0(r1)
/* 80018B44 00014AC4  93 E1 00 9C */	stw r31, 0x9c(r1)
/* 80018B48 00014AC8  3B E4 00 00 */	addi r31, r4, 0x0
/* 80018B4C 00014ACC  93 C1 00 98 */	stw r30, 0x98(r1)
/* 80018B50 00014AD0  7C 7E 1B 78 */	mr r30, r3
/* 80018B54 00014AD4  80 03 01 18 */	lwz r0, 0x118(r3)
/* 80018B58 00014AD8  2C 00 00 01 */	cmpwi r0, 0x1
/* 80018B5C 00014ADC  40 82 00 D4 */	bne lbl_80018C30
/* 80018B60 00014AE0  C0 22 81 A8 */	lfs f1, lbl_800A9528@sda21(r2)
/* 80018B64 00014AE4  38 61 00 34 */	addi r3, r1, 0x34
/* 80018B68 00014AE8  C0 1E 00 0C */	lfs f0, 0xc(r30)
/* 80018B6C 00014AEC  38 80 00 58 */	li r4, 0x58
/* 80018B70 00014AF0  EC 21 00 32 */	fmuls f1, f1, f0
/* 80018B74 00014AF4  48 01 70 71 */	bl PSMTXRotRad
/* 80018B78 00014AF8  C0 22 81 A8 */	lfs f1, lbl_800A9528@sda21(r2)
/* 80018B7C 00014AFC  38 61 00 64 */	addi r3, r1, 0x64
/* 80018B80 00014B00  C0 1E 00 10 */	lfs f0, 0x10(r30)
/* 80018B84 00014B04  38 80 00 59 */	li r4, 0x59
/* 80018B88 00014B08  EC 21 00 32 */	fmuls f1, f1, f0
/* 80018B8C 00014B0C  48 01 70 59 */	bl PSMTXRotRad
/* 80018B90 00014B10  38 81 00 34 */	addi r4, r1, 0x34
/* 80018B94 00014B14  38 A4 00 00 */	addi r5, r4, 0x0
/* 80018B98 00014B18  38 61 00 64 */	addi r3, r1, 0x64
/* 80018B9C 00014B1C  48 01 6E 35 */	bl PSMTXConcat
/* 80018BA0 00014B20  C0 22 81 A8 */	lfs f1, lbl_800A9528@sda21(r2)
/* 80018BA4 00014B24  38 61 00 64 */	addi r3, r1, 0x64
/* 80018BA8 00014B28  C0 1E 00 14 */	lfs f0, 0x14(r30)
/* 80018BAC 00014B2C  38 80 00 5A */	li r4, 0x5a
/* 80018BB0 00014B30  EC 21 00 32 */	fmuls f1, f1, f0
/* 80018BB4 00014B34  48 01 70 31 */	bl PSMTXRotRad
/* 80018BB8 00014B38  38 81 00 34 */	addi r4, r1, 0x34
/* 80018BBC 00014B3C  38 A4 00 00 */	addi r5, r4, 0x0
/* 80018BC0 00014B40  38 61 00 64 */	addi r3, r1, 0x64
/* 80018BC4 00014B44  48 01 6E 0D */	bl PSMTXConcat
/* 80018BC8 00014B48  3C 60 80 06 */	lis r3, lbl_800642A4@ha
/* 80018BCC 00014B4C  38 E3 42 A4 */	addi r7, r3, lbl_800642A4@l
/* 80018BD0 00014B50  80 C7 00 00 */	lwz r6, 0x0(r7)
/* 80018BD4 00014B54  38 81 00 28 */	addi r4, r1, 0x28
/* 80018BD8 00014B58  80 07 00 04 */	lwz r0, 0x4(r7)
/* 80018BDC 00014B5C  38 A4 00 00 */	addi r5, r4, 0x0
/* 80018BE0 00014B60  38 61 00 34 */	addi r3, r1, 0x34
/* 80018BE4 00014B64  90 C1 00 28 */	stw r6, 0x28(r1)
/* 80018BE8 00014B68  90 01 00 2C */	stw r0, 0x2c(r1)
/* 80018BEC 00014B6C  80 07 00 08 */	lwz r0, 0x8(r7)
/* 80018BF0 00014B70  90 01 00 30 */	stw r0, 0x30(r1)
/* 80018BF4 00014B74  48 01 73 D9 */	bl PSMTXMultVecSR
/* 80018BF8 00014B78  38 9E 00 00 */	addi r4, r30, 0x0
/* 80018BFC 00014B7C  38 61 00 28 */	addi r3, r1, 0x28
/* 80018C00 00014B80  38 A1 00 1C */	addi r5, r1, 0x1c
/* 80018C04 00014B84  48 01 75 51 */	bl PSVECAdd
/* 80018C08 00014B88  38 61 00 34 */	addi r3, r1, 0x34
/* 80018C0C 00014B8C  38 9E 01 00 */	addi r4, r30, 0x100
/* 80018C10 00014B90  38 A1 00 10 */	addi r5, r1, 0x10
/* 80018C14 00014B94  48 01 73 B9 */	bl PSMTXMultVecSR
/* 80018C18 00014B98  38 7F 00 00 */	addi r3, r31, 0x0
/* 80018C1C 00014B9C  38 9E 00 00 */	addi r4, r30, 0x0
/* 80018C20 00014BA0  38 A1 00 10 */	addi r5, r1, 0x10
/* 80018C24 00014BA4  38 C1 00 1C */	addi r6, r1, 0x1c
/* 80018C28 00014BA8  48 01 71 31 */	bl C_MTXLookAt
/* 80018C2C 00014BAC  48 00 00 18 */	b lbl_80018C44
lbl_80018C30:
/* 80018C30 00014BB0  38 7F 00 00 */	addi r3, r31, 0x0
/* 80018C34 00014BB4  38 9E 00 00 */	addi r4, r30, 0x0
/* 80018C38 00014BB8  38 BE 01 00 */	addi r5, r30, 0x100
/* 80018C3C 00014BBC  38 DE 01 0C */	addi r6, r30, 0x10c
/* 80018C40 00014BC0  48 01 71 19 */	bl C_MTXLookAt
lbl_80018C44:
/* 80018C44 00014BC4  80 01 00 A4 */	lwz r0, 0xa4(r1)
/* 80018C48 00014BC8  83 E1 00 9C */	lwz r31, 0x9c(r1)
/* 80018C4C 00014BCC  83 C1 00 98 */	lwz r30, 0x98(r1)
/* 80018C50 00014BD0  7C 08 03 A6 */	mtlr r0
/* 80018C54 00014BD4  38 21 00 A0 */	addi r1, r1, 0xa0
/* 80018C58 00014BD8  4E 80 00 20 */	blr

GetLightMtx__8DGCameraFRA3_A4_f:
/* 80018C5C 00014BDC  7C 08 02 A6 */	mflr r0
/* 80018C60 00014BE0  90 01 00 04 */	stw r0, 0x4(r1)
/* 80018C64 00014BE4  94 21 FF 60 */	stwu r1, -0xa0(r1)
/* 80018C68 00014BE8  93 E1 00 9C */	stw r31, 0x9c(r1)
/* 80018C6C 00014BEC  3B E4 00 00 */	addi r31, r4, 0x0
/* 80018C70 00014BF0  93 C1 00 98 */	stw r30, 0x98(r1)
/* 80018C74 00014BF4  7C 7E 1B 78 */	mr r30, r3
/* 80018C78 00014BF8  80 03 01 18 */	lwz r0, 0x118(r3)
/* 80018C7C 00014BFC  2C 00 00 01 */	cmpwi r0, 0x1
/* 80018C80 00014C00  40 82 00 D4 */	bne lbl_80018D54
/* 80018C84 00014C04  C0 22 81 A8 */	lfs f1, lbl_800A9528@sda21(r2)
/* 80018C88 00014C08  38 61 00 40 */	addi r3, r1, 0x40
/* 80018C8C 00014C0C  C0 1E 00 0C */	lfs f0, 0xc(r30)
/* 80018C90 00014C10  38 80 00 58 */	li r4, 0x58
/* 80018C94 00014C14  EC 21 00 32 */	fmuls f1, f1, f0
/* 80018C98 00014C18  48 01 6F 4D */	bl PSMTXRotRad
/* 80018C9C 00014C1C  C0 22 81 A8 */	lfs f1, lbl_800A9528@sda21(r2)
/* 80018CA0 00014C20  38 61 00 10 */	addi r3, r1, 0x10
/* 80018CA4 00014C24  C0 1E 00 10 */	lfs f0, 0x10(r30)
/* 80018CA8 00014C28  38 80 00 59 */	li r4, 0x59
/* 80018CAC 00014C2C  EC 21 00 32 */	fmuls f1, f1, f0
/* 80018CB0 00014C30  48 01 6F 35 */	bl PSMTXRotRad
/* 80018CB4 00014C34  38 81 00 40 */	addi r4, r1, 0x40
/* 80018CB8 00014C38  38 A4 00 00 */	addi r5, r4, 0x0
/* 80018CBC 00014C3C  38 61 00 10 */	addi r3, r1, 0x10
/* 80018CC0 00014C40  48 01 6D 11 */	bl PSMTXConcat
/* 80018CC4 00014C44  C0 22 81 A8 */	lfs f1, lbl_800A9528@sda21(r2)
/* 80018CC8 00014C48  38 61 00 10 */	addi r3, r1, 0x10
/* 80018CCC 00014C4C  C0 1E 00 14 */	lfs f0, 0x14(r30)
/* 80018CD0 00014C50  38 80 00 5A */	li r4, 0x5a
/* 80018CD4 00014C54  EC 21 00 32 */	fmuls f1, f1, f0
/* 80018CD8 00014C58  48 01 6F 0D */	bl PSMTXRotRad
/* 80018CDC 00014C5C  38 81 00 40 */	addi r4, r1, 0x40
/* 80018CE0 00014C60  38 A4 00 00 */	addi r5, r4, 0x0
/* 80018CE4 00014C64  38 61 00 10 */	addi r3, r1, 0x10
/* 80018CE8 00014C68  48 01 6C E9 */	bl PSMTXConcat
/* 80018CEC 00014C6C  3C 60 80 06 */	lis r3, lbl_800642A4@ha
/* 80018CF0 00014C70  38 E3 42 A4 */	addi r7, r3, lbl_800642A4@l
/* 80018CF4 00014C74  80 C7 00 00 */	lwz r6, 0x0(r7)
/* 80018CF8 00014C78  38 81 00 70 */	addi r4, r1, 0x70
/* 80018CFC 00014C7C  80 07 00 04 */	lwz r0, 0x4(r7)
/* 80018D00 00014C80  38 A4 00 00 */	addi r5, r4, 0x0
/* 80018D04 00014C84  38 61 00 40 */	addi r3, r1, 0x40
/* 80018D08 00014C88  90 C1 00 70 */	stw r6, 0x70(r1)
/* 80018D0C 00014C8C  90 01 00 74 */	stw r0, 0x74(r1)
/* 80018D10 00014C90  80 07 00 08 */	lwz r0, 0x8(r7)
/* 80018D14 00014C94  90 01 00 78 */	stw r0, 0x78(r1)
/* 80018D18 00014C98  48 01 72 B5 */	bl PSMTXMultVecSR
/* 80018D1C 00014C9C  38 9E 00 00 */	addi r4, r30, 0x0
/* 80018D20 00014CA0  38 61 00 70 */	addi r3, r1, 0x70
/* 80018D24 00014CA4  38 A1 00 7C */	addi r5, r1, 0x7c
/* 80018D28 00014CA8  48 01 74 2D */	bl PSVECAdd
/* 80018D2C 00014CAC  38 61 00 40 */	addi r3, r1, 0x40
/* 80018D30 00014CB0  38 9E 01 00 */	addi r4, r30, 0x100
/* 80018D34 00014CB4  38 A1 00 88 */	addi r5, r1, 0x88
/* 80018D38 00014CB8  48 01 72 95 */	bl PSMTXMultVecSR
/* 80018D3C 00014CBC  38 7F 00 00 */	addi r3, r31, 0x0
/* 80018D40 00014CC0  38 9E 00 00 */	addi r4, r30, 0x0
/* 80018D44 00014CC4  38 A1 00 88 */	addi r5, r1, 0x88
/* 80018D48 00014CC8  38 C1 00 7C */	addi r6, r1, 0x7c
/* 80018D4C 00014CCC  48 01 70 0D */	bl C_MTXLookAt
/* 80018D50 00014CD0  48 00 00 18 */	b lbl_80018D68
lbl_80018D54:
/* 80018D54 00014CD4  38 7F 00 00 */	addi r3, r31, 0x0
/* 80018D58 00014CD8  38 9E 00 00 */	addi r4, r30, 0x0
/* 80018D5C 00014CDC  38 BE 01 00 */	addi r5, r30, 0x100
/* 80018D60 00014CE0  38 DE 01 0C */	addi r6, r30, 0x10c
/* 80018D64 00014CE4  48 01 6F F5 */	bl C_MTXLookAt
lbl_80018D68:
/* 80018D68 00014CE8  38 9F 00 00 */	addi r4, r31, 0x0
/* 80018D6C 00014CEC  38 BF 00 00 */	addi r5, r31, 0x0
/* 80018D70 00014CF0  38 7E 00 98 */	addi r3, r30, 0x98
/* 80018D74 00014CF4  48 01 6C 5D */	bl PSMTXConcat
/* 80018D78 00014CF8  80 01 00 A4 */	lwz r0, 0xa4(r1)
/* 80018D7C 00014CFC  83 E1 00 9C */	lwz r31, 0x9c(r1)
/* 80018D80 00014D00  83 C1 00 98 */	lwz r30, 0x98(r1)
/* 80018D84 00014D04  7C 08 03 A6 */	mtlr r0
/* 80018D88 00014D08  38 21 00 A0 */	addi r1, r1, 0xa0
/* 80018D8C 00014D0C  4E 80 00 20 */	blr

GetLightMtxYInverse__8DGCameraFRA3_A4_f:
/* 80018D90 00014D10  7C 08 02 A6 */	mflr r0
/* 80018D94 00014D14  90 01 00 04 */	stw r0, 0x4(r1)
/* 80018D98 00014D18  94 21 FF 60 */	stwu r1, -0xa0(r1)
/* 80018D9C 00014D1C  93 E1 00 9C */	stw r31, 0x9c(r1)
/* 80018DA0 00014D20  3B E4 00 00 */	addi r31, r4, 0x0
/* 80018DA4 00014D24  93 C1 00 98 */	stw r30, 0x98(r1)
/* 80018DA8 00014D28  7C 7E 1B 78 */	mr r30, r3
/* 80018DAC 00014D2C  80 03 01 18 */	lwz r0, 0x118(r3)
/* 80018DB0 00014D30  2C 00 00 01 */	cmpwi r0, 0x1
/* 80018DB4 00014D34  40 82 00 D4 */	bne lbl_80018E88
/* 80018DB8 00014D38  C0 22 81 A8 */	lfs f1, lbl_800A9528@sda21(r2)
/* 80018DBC 00014D3C  38 61 00 40 */	addi r3, r1, 0x40
/* 80018DC0 00014D40  C0 1E 00 0C */	lfs f0, 0xc(r30)
/* 80018DC4 00014D44  38 80 00 58 */	li r4, 0x58
/* 80018DC8 00014D48  EC 21 00 32 */	fmuls f1, f1, f0
/* 80018DCC 00014D4C  48 01 6E 19 */	bl PSMTXRotRad
/* 80018DD0 00014D50  C0 22 81 A8 */	lfs f1, lbl_800A9528@sda21(r2)
/* 80018DD4 00014D54  38 61 00 10 */	addi r3, r1, 0x10
/* 80018DD8 00014D58  C0 1E 00 10 */	lfs f0, 0x10(r30)
/* 80018DDC 00014D5C  38 80 00 59 */	li r4, 0x59
/* 80018DE0 00014D60  EC 21 00 32 */	fmuls f1, f1, f0
/* 80018DE4 00014D64  48 01 6E 01 */	bl PSMTXRotRad
/* 80018DE8 00014D68  38 81 00 40 */	addi r4, r1, 0x40
/* 80018DEC 00014D6C  38 A4 00 00 */	addi r5, r4, 0x0
/* 80018DF0 00014D70  38 61 00 10 */	addi r3, r1, 0x10
/* 80018DF4 00014D74  48 01 6B DD */	bl PSMTXConcat
/* 80018DF8 00014D78  C0 22 81 A8 */	lfs f1, lbl_800A9528@sda21(r2)
/* 80018DFC 00014D7C  38 61 00 10 */	addi r3, r1, 0x10
/* 80018E00 00014D80  C0 1E 00 14 */	lfs f0, 0x14(r30)
/* 80018E04 00014D84  38 80 00 5A */	li r4, 0x5a
/* 80018E08 00014D88  EC 21 00 32 */	fmuls f1, f1, f0
/* 80018E0C 00014D8C  48 01 6D D9 */	bl PSMTXRotRad
/* 80018E10 00014D90  38 81 00 40 */	addi r4, r1, 0x40
/* 80018E14 00014D94  38 A4 00 00 */	addi r5, r4, 0x0
/* 80018E18 00014D98  38 61 00 10 */	addi r3, r1, 0x10
/* 80018E1C 00014D9C  48 01 6B B5 */	bl PSMTXConcat
/* 80018E20 00014DA0  3C 60 80 06 */	lis r3, lbl_800642A4@ha
/* 80018E24 00014DA4  38 E3 42 A4 */	addi r7, r3, lbl_800642A4@l
/* 80018E28 00014DA8  80 C7 00 00 */	lwz r6, 0x0(r7)
/* 80018E2C 00014DAC  38 81 00 70 */	addi r4, r1, 0x70
/* 80018E30 00014DB0  80 07 00 04 */	lwz r0, 0x4(r7)
/* 80018E34 00014DB4  38 A4 00 00 */	addi r5, r4, 0x0
/* 80018E38 00014DB8  38 61 00 40 */	addi r3, r1, 0x40
/* 80018E3C 00014DBC  90 C1 00 70 */	stw r6, 0x70(r1)
/* 80018E40 00014DC0  90 01 00 74 */	stw r0, 0x74(r1)
/* 80018E44 00014DC4  80 07 00 08 */	lwz r0, 0x8(r7)
/* 80018E48 00014DC8  90 01 00 78 */	stw r0, 0x78(r1)
/* 80018E4C 00014DCC  48 01 71 81 */	bl PSMTXMultVecSR
/* 80018E50 00014DD0  38 9E 00 00 */	addi r4, r30, 0x0
/* 80018E54 00014DD4  38 61 00 70 */	addi r3, r1, 0x70
/* 80018E58 00014DD8  38 A1 00 7C */	addi r5, r1, 0x7c
/* 80018E5C 00014DDC  48 01 72 F9 */	bl PSVECAdd
/* 80018E60 00014DE0  38 61 00 40 */	addi r3, r1, 0x40
/* 80018E64 00014DE4  38 9E 01 00 */	addi r4, r30, 0x100
/* 80018E68 00014DE8  38 A1 00 88 */	addi r5, r1, 0x88
/* 80018E6C 00014DEC  48 01 71 61 */	bl PSMTXMultVecSR
/* 80018E70 00014DF0  38 7F 00 00 */	addi r3, r31, 0x0
/* 80018E74 00014DF4  38 9E 00 00 */	addi r4, r30, 0x0
/* 80018E78 00014DF8  38 A1 00 88 */	addi r5, r1, 0x88
/* 80018E7C 00014DFC  38 C1 00 7C */	addi r6, r1, 0x7c
/* 80018E80 00014E00  48 01 6E D9 */	bl C_MTXLookAt
/* 80018E84 00014E04  48 00 00 18 */	b lbl_80018E9C
lbl_80018E88:
/* 80018E88 00014E08  38 7F 00 00 */	addi r3, r31, 0x0
/* 80018E8C 00014E0C  38 9E 00 00 */	addi r4, r30, 0x0
/* 80018E90 00014E10  38 BE 01 00 */	addi r5, r30, 0x100
/* 80018E94 00014E14  38 DE 01 0C */	addi r6, r30, 0x10c
/* 80018E98 00014E18  48 01 6E C1 */	bl C_MTXLookAt
lbl_80018E9C:
/* 80018E9C 00014E1C  38 9F 00 00 */	addi r4, r31, 0x0
/* 80018EA0 00014E20  38 BF 00 00 */	addi r5, r31, 0x0
/* 80018EA4 00014E24  38 7E 00 C8 */	addi r3, r30, 0xc8
/* 80018EA8 00014E28  48 01 6B 29 */	bl PSMTXConcat
/* 80018EAC 00014E2C  80 01 00 A4 */	lwz r0, 0xa4(r1)
/* 80018EB0 00014E30  83 E1 00 9C */	lwz r31, 0x9c(r1)
/* 80018EB4 00014E34  83 C1 00 98 */	lwz r30, 0x98(r1)
/* 80018EB8 00014E38  7C 08 03 A6 */	mtlr r0
/* 80018EBC 00014E3C  38 21 00 A0 */	addi r1, r1, 0xa0
/* 80018EC0 00014E40  4E 80 00 20 */	blr

SetFogType__8DGCameraF10_GXFogType:
/* 80018EC4 00014E44  90 83 01 20 */	stw r4, 0x120(r3)
/* 80018EC8 00014E48  4E 80 00 20 */	blr

SetFogRange__8DGCameraFff:
/* 80018ECC 00014E4C  D0 23 01 24 */	stfs f1, 0x124(r3)
/* 80018ED0 00014E50  D0 43 01 28 */	stfs f2, 0x128(r3)
/* 80018ED4 00014E54  4E 80 00 20 */	blr

SetFogRangeRatio__8DGCameraFff:
/* 80018ED8 00014E58  C0 63 00 F8 */	lfs f3, 0xf8(r3)
/* 80018EDC 00014E5C  C0 03 00 FC */	lfs f0, 0xfc(r3)
/* 80018EE0 00014E60  EC 00 18 28 */	fsubs f0, f0, f3
/* 80018EE4 00014E64  EC 01 00 32 */	fmuls f0, f1, f0
/* 80018EE8 00014E68  EC 03 00 2A */	fadds f0, f3, f0
/* 80018EEC 00014E6C  D0 03 01 24 */	stfs f0, 0x124(r3)
/* 80018EF0 00014E70  C0 23 00 F8 */	lfs f1, 0xf8(r3)
/* 80018EF4 00014E74  C0 03 00 FC */	lfs f0, 0xfc(r3)
/* 80018EF8 00014E78  EC 00 08 28 */	fsubs f0, f0, f1
/* 80018EFC 00014E7C  EC 02 00 32 */	fmuls f0, f2, f0
/* 80018F00 00014E80  EC 01 00 2A */	fadds f0, f1, f0
/* 80018F04 00014E84  D0 03 01 28 */	stfs f0, 0x128(r3)
/* 80018F08 00014E88  4E 80 00 20 */	blr

SetFogColor__8DGCameraFRC8_GXColor:
/* 80018F0C 00014E8C  80 04 00 00 */	lwz r0, 0x0(r4)
/* 80018F10 00014E90  90 03 01 1C */	stw r0, 0x11c(r3)
/* 80018F14 00014E94  4E 80 00 20 */	blr

#rodata


.global lbl_80064280
lbl_80064280:

	# ROM: 0x61280
	.4byte 0
	.4byte 0
	.4byte 0x44000000
	.4byte 0
	.4byte 0x3F800000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0

.global lbl_800642A4
lbl_800642A4:

	# ROM: 0x612A4
	.4byte 0
	.4byte 0
	.4byte 0xBF800000

#sdata2

.global lbl_800A9500
lbl_800A9500:

	# ROM: 0x6A680
	.4byte 0

.global lbl_800A9504
lbl_800A9504:

	# ROM: 0x6A684
	.4byte 0x41C00000

.global lbl_800A9508
lbl_800A9508:

	# ROM: 0x6A688
	.4byte 0x42000000

.global lbl_800A950C
lbl_800A950C:

	# ROM: 0x6A68C
	.4byte 0x41800000

.global lbl_800A9510
lbl_800A9510:

	# ROM: 0x6A690
	.4byte 0x44800000

.global lbl_800A9514
lbl_800A9514:

	# ROM: 0x6A694
	.4byte 0

.global lbl_800A9518
lbl_800A9518:

	# ROM: 0x6A698
	.4byte 0x3DCCCCCD

.global lbl_800A951C
lbl_800A951C:

	# ROM: 0x6A69C
	.4byte 0x3F000000

.global lbl_800A9520
lbl_800A9520:

	# ROM: 0x6A6A0
	.4byte 0x40000000

.global lbl_800A9524
lbl_800A9524:

	# ROM: 0x6A6A4
	.4byte 0xBF000000

.global lbl_800A9528
lbl_800A9528:

	# ROM: 0x6A6A8
	.4byte 0x3C8EFA35
	.4byte 0
