.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740


.fn sndPitchUpOne, global
/* 8004F8C4 0004B844  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8004F8C8 0004B848  54 60 04 3E */	clrlwi r0, r3, 16
/* 8004F8CC 0004B84C  90 01 00 1C */	stw r0, 0x1c(r1)
/* 8004F8D0 0004B850  3C 00 43 30 */	lis r0, 0x4330
/* 8004F8D4 0004B854  C8 22 86 58 */	lfd f1, lbl_800A99D8@sda21(r2)
/* 8004F8D8 0004B858  90 01 00 18 */	stw r0, 0x18(r1)
/* 8004F8DC 0004B85C  C0 42 86 50 */	lfs f2, float_800A99D0@sda21(r2)
/* 8004F8E0 0004B860  C8 01 00 18 */	lfd f0, 0x18(r1)
/* 8004F8E4 0004B864  EC 00 08 28 */	fsubs f0, f0, f1
/* 8004F8E8 0004B868  EC 02 00 32 */	fmuls f0, f2, f0
/* 8004F8EC 0004B86C  FC 00 00 1E */	fctiwz f0, f0
/* 8004F8F0 0004B870  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 8004F8F4 0004B874  80 61 00 14 */	lwz r3, 0x14(r1)
/* 8004F8F8 0004B878  38 21 00 20 */	addi r1, r1, 0x20
/* 8004F8FC 0004B87C  4E 80 00 20 */	blr
.endfn sndPitchUpOne

.fn sndGetPitch, global
/* 8004F900 0004B880  7C 08 02 A6 */	mflr r0
/* 8004F904 0004B884  90 01 00 04 */	stw r0, 0x4(r1)
/* 8004F908 0004B888  3C 04 00 01 */	addis r0, r4, 0x1
/* 8004F90C 0004B88C  28 00 FF FF */	cmplwi r0, 0xffff
/* 8004F910 0004B890  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 8004F914 0004B894  40 82 00 0C */	bne .L_8004F920
/* 8004F918 0004B898  3C 80 40 00 */	lis r4, 0x4000
/* 8004F91C 0004B89C  38 84 56 22 */	addi r4, r4, 0x5622
.L_8004F920:
/* 8004F920 0004B8A0  54 85 46 3E */	srwi r5, r4, 24
/* 8004F924 0004B8A4  54 60 06 3E */	clrlwi r0, r3, 24
/* 8004F928 0004B8A8  7C 00 28 40 */	cmplw r0, r5
/* 8004F92C 0004B8AC  41 82 00 64 */	beq .L_8004F990
/* 8004F930 0004B8B0  7C 05 00 40 */	cmplw r5, r0
/* 8004F934 0004B8B4  40 80 00 20 */	bge .L_8004F954
/* 8004F938 0004B8B8  7C 05 00 50 */	subf r0, r5, r0
/* 8004F93C 0004B8BC  3C 60 80 07 */	lis r3, toneup_tab@ha
/* 8004F940 0004B8C0  54 05 10 3A */	slwi r5, r0, 2
/* 8004F944 0004B8C4  38 03 95 30 */	addi r0, r3, toneup_tab@l
/* 8004F948 0004B8C8  7C 60 2A 14 */	add r3, r0, r5
/* 8004F94C 0004B8CC  C0 43 00 00 */	lfs f2, 0x0(r3)
/* 8004F950 0004B8D0  48 00 00 1C */	b .L_8004F96C
.L_8004F954:
/* 8004F954 0004B8D4  7C 00 28 50 */	subf r0, r0, r5
/* 8004F958 0004B8D8  3C 60 80 07 */	lis r3, tonedown_tab@ha
/* 8004F95C 0004B8DC  54 05 10 3A */	slwi r5, r0, 2
/* 8004F960 0004B8E0  38 03 97 30 */	addi r0, r3, tonedown_tab@l
/* 8004F964 0004B8E4  7C 60 2A 14 */	add r3, r0, r5
/* 8004F968 0004B8E8  C0 43 00 00 */	lfs f2, 0x0(r3)
.L_8004F96C:
/* 8004F96C 0004B8EC  54 80 02 3E */	clrlwi r0, r4, 8
/* 8004F970 0004B8F0  C8 22 86 58 */	lfd f1, lbl_800A99D8@sda21(r2)
/* 8004F974 0004B8F4  90 01 00 14 */	stw r0, 0x14(r1)
/* 8004F978 0004B8F8  3C 00 43 30 */	lis r0, 0x4330
/* 8004F97C 0004B8FC  90 01 00 10 */	stw r0, 0x10(r1)
/* 8004F980 0004B900  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 8004F984 0004B904  EC 00 08 28 */	fsubs f0, f0, f1
/* 8004F988 0004B908  EC 40 00 B2 */	fmuls f2, f0, f2
/* 8004F98C 0004B90C  48 00 00 20 */	b .L_8004F9AC
.L_8004F990:
/* 8004F990 0004B910  54 80 02 3E */	clrlwi r0, r4, 8
/* 8004F994 0004B914  C8 22 86 58 */	lfd f1, lbl_800A99D8@sda21(r2)
/* 8004F998 0004B918  90 01 00 14 */	stw r0, 0x14(r1)
/* 8004F99C 0004B91C  3C 00 43 30 */	lis r0, 0x4330
/* 8004F9A0 0004B920  90 01 00 10 */	stw r0, 0x10(r1)
/* 8004F9A4 0004B924  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 8004F9A8 0004B928  EC 40 08 28 */	fsubs f2, f0, f1
.L_8004F9AC:
/* 8004F9AC 0004B92C  3C 60 80 09 */	lis r3, synthInfo@ha
/* 8004F9B0 0004B930  C0 02 86 60 */	lfs f0, float_800A99E0@sda21(r2)
/* 8004F9B4 0004B934  38 63 EC 38 */	addi r3, r3, synthInfo@l
/* 8004F9B8 0004B938  C8 22 86 58 */	lfd f1, lbl_800A99D8@sda21(r2)
/* 8004F9BC 0004B93C  80 63 00 00 */	lwz r3, 0x0(r3)
/* 8004F9C0 0004B940  3C 00 43 30 */	lis r0, 0x4330
/* 8004F9C4 0004B944  EC 40 00 B2 */	fmuls f2, f0, f2
/* 8004F9C8 0004B948  90 61 00 14 */	stw r3, 0x14(r1)
/* 8004F9CC 0004B94C  90 01 00 10 */	stw r0, 0x10(r1)
/* 8004F9D0 0004B950  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 8004F9D4 0004B954  EC 00 08 28 */	fsubs f0, f0, f1
/* 8004F9D8 0004B958  EC 22 00 24 */	fdivs f1, f2, f0
/* 8004F9DC 0004B95C  48 00 FA 21 */	bl __cvt_fp2unsigned
/* 8004F9E0 0004B960  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8004F9E4 0004B964  38 21 00 18 */	addi r1, r1, 0x18
/* 8004F9E8 0004B968  7C 08 03 A6 */	mtlr r0
/* 8004F9EC 0004B96C  4E 80 00 20 */	blr
.endfn sndGetPitch

.section .data, "wa"  # 0x80065000 - 0x8006D1C0 ; 0x000081C0

.balign 8


.obj toneup_tab, local
	.float 1
	.float 1.0594635
	.float 1.12246227
	.float 1.18920708
	.float 1.25992107
	.float 1.33483982
	.float 1.41421413
	.float 1.49830723
	.float 1.58740139
	.float 1.68179321
	.float 1.78179836
	.float 1.88774872
	.float 2.00000095
	.float 2.118927
	.float 2.24492455
	.float 2.37841511
	.float 2.5198431
	.float 2.6696806
	.float 2.82842827
	.float 2.99661541
	.float 3.17480373
	.float 3.36358738
	.float 3.56359673
	.float 3.77549839
	.float 4.00000191
	.float 4.237854
	.float 4.48985004
	.float 4.75683022
	.float 5.0396862
	.float 5.33936214
	.float 5.65685654
	.float 5.99323082
	.float 6.34960747
	.float 6.72717476
	.float 7.12719345
	.float 7.55099773
	.float 8.00000381
	.float 8.47570896
	.float 8.97970104
	.float 9.51366138
	.float 10.0793734
	.float 10.6787243
	.float 11.313714
	.float 11.9864626
	.float 12.6992149
	.float 13.4543495
	.float 14.2543869
	.float 15.1019964
	.float 16.0000076
	.float 16.9514179
	.float 17.9594021
	.float 19.0273228
	.float 20.1587467
	.float 21.3574486
	.float 22.6274281
	.float 23.9729252
	.float 25.3984299
	.float 26.908699
	.float 28.5087738
	.float 30.2039928
	.float 32.0000153
	.float 33.9028358
	.float 35.9188042
	.float 38.0546455
	.float 40.3174934
	.float 42.7148972
	.float 45.2548561
	.float 47.9458504
	.float 50.7968597
	.float 53.8173981
	.float 57.0175476
	.float 60.4079857
	.float 64.0000305
	.float 67.8056717
	.float 71.8376083
	.float 76.1092911
	.float 80.6349869
	.float 85.4297943
	.float 90.5097122
	.float 95.8917007
	.float 101.593719
	.float 107.634796
	.float 114.035095
	.float 120.815971
	.float 128.000061
	.float 135.611343
	.float 143.675217
	.float 152.218582
	.float 161.269974
	.float 170.859589
	.float 181.019424
	.float 191.783401
	.float 203.187439
	.float 215.269592
	.float 228.07019
	.float 241.631943
	.float 256.000122
	.float 271.222687
	.float 287.350433
	.float 304.437164
	.float 322.539948
	.float 341.719177
	.float 362.038849
	.float 383.566803
	.float 406.374878
	.float 430.539185
	.float 456.140381
	.float 483.263885
	.float 512.000244
	.float 542.445374
	.float 574.700867
	.float 608.874329
	.float 645.079895
	.float 683.438354
	.float 724.077698
	.float 767.133606
	.float 812.749756
	.float 861.078369
	.float 912.280762
	.float 966.527771
	.float 1024.00049
	.float 1084.89075
	.float 1149.40173
	.float 1217.74866
	.float 1290.15979
	.float 1366.87671
	.float 1448.1554
	.float 1534.26721
.endobj toneup_tab

.obj tonedown_tab, local
	.float 1
	.float 0.943874359
	.float 0.890898705
	.float 0.840896606
	.float 0.793700218
	.float 0.749153137
	.float 0.70710659
	.float 0.667419434
	.float 0.62996006
	.float 0.594603539
	.float 0.561230659
	.float 0.52973175
	.float 0.5
	.float 0.47193718
	.float 0.445448875
	.float 0.420448303
	.float 0.396850586
	.float 0.374576569
	.float 0.353552818
	.float 0.333709717
	.float 0.314980507
	.float 0.297301292
	.float 0.280615807
	.float 0.264865875
	.float 0.25
	.float 0.23596859
	.float 0.222724915
	.float 0.210224152
	.float 0.198425293
	.float 0.187288284
	.float 0.176776886
	.float 0.166854858
	.float 0.157489777
	.float 0.148651123
	.float 0.140307426
	.float 0.132432938
	.float 0.125
	.float 0.117983818
	.float 0.111362457
	.float 0.105112076
	.float 0.0992126465
	.float 0.0936441422
	.float 0.088388443
	.float 0.0834274292
	.float 0.0787448883
	.float 0.0743255615
	.float 0.0701541901
	.float 0.0662164688
	.float 0.0625
	.float 0.0589923859
	.float 0.0556812286
	.float 0.0525560379
	.float 0.0496063232
	.float 0.0468225479
	.float 0.0441942215
	.float 0.0417137146
	.float 0.0393724442
	.float 0.0371627808
	.float 0.035077095
	.float 0.0331077576
	.float 0.03125
	.float 0.0294961929
	.float 0.0278406143
	.float 0.0262775421
	.float 0.0248031616
	.float 0.0234107971
	.float 0.0220966339
	.float 0.0208568573
	.float 0.0196866989
	.float 0.0185813904
	.float 0.0175380707
	.float 0.0165538788
	.float 0.015625
	.float 0.0147476196
	.float 0.0139198303
	.float 0.0131387711
	.float 0.0124015808
	.float 0.0117053986
	.float 0.011048317
	.float 0.0104284286
	.float 0.00984287262
	.float 0.00929069519
	.float 0.00876903534
	.float 0.00827693939
	.float 0.0078125
	.float 0.00737380981
	.float 0.00695991516
	.float 0.00656986237
	.float 0.00620079041
	.float 0.00585269928
	.float 0.00552463531
	.float 0.00521469116
	.float 0.00492191315
	.float 0.0046453476
	.float 0.00438499451
	.float 0.00413894653
	.float 0.00390625
	.float 0.00368690491
	.float 0.00347995758
	.float 0.00328445435
	.float 0.0031003952
	.float 0.00292682648
	.float 0.00276184082
	.float 0.00260734558
	.float 0.00246047974
	.float 0.00232219696
	.float 0.00219249725
	.float 0.00206947327
	.float 0.001953125
	.float 0.00184345245
	.float 0.00174045563
	.float 0.00164222717
	.float 0.00154972076
	.float 0.0014629364
	.float 0.00138092041
	.float 0.00130367279
	.float 0.00123023987
	.float 0.00116157532
	.float 0.00109577179
	.float 0.00103473663
	.float 0.0009765625
	.float 0.000922203064
	.float 0.000869750977
	.float 0.000821113586
	.float 0.000775337219
	.float 0.000731468201
	.float 0.000690460205
	.float 0.000651359558
.endobj tonedown_tab

.section .sdata2, "wa"  # 0x800A9380 - 0x800A9BA0

.balign 8

.obj float_800A99D0, local
	.4byte 0x3F879C7D
.endobj float_800A99D0

.4byte 0

.obj lbl_800A99D8, local
	.8byte 0x4330000000000000
.endobj lbl_800A99D8

.obj float_800A99E0, local
	.4byte 0x45800000
.endobj float_800A99E0

.section extab, "a"  # 0x80005520 - 0x80005BC0


.obj "@etb_80005868", local
.hidden "@etb_80005868"
	.4byte 0x00080000
	.4byte 0
.endobj "@etb_80005868"

.section extabindex, "a"  # 0x80005BC0 - 0x800065A0

.obj "@eti_800060AC", local
.hidden "@eti_800060AC"
	.4byte sndGetPitch
	.4byte 0x000000F0
	.4byte "@etb_80005868"
.endobj "@eti_800060AC"
