.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x80063CE0 ; 0x0005D740


.fn sndRand, global
/* 800573A0 00053320  3C 60 A8 35 */	lis r3, 0xA8351D63@ha
/* 800573A4 00053324  80 8D 82 E8 */	lwz r4, last_rnd@sda21(r13)
/* 800573A8 00053328  38 03 1D 63 */	addi r0, r3, 0xA8351D63@l
/* 800573AC 0005332C  7C 04 01 D6 */	mullw r0, r4, r0
/* 800573B0 00053330  90 0D 82 E8 */	stw r0, last_rnd@sda21(r13)
/* 800573B4 00053334  80 0D 82 E8 */	lwz r0, last_rnd@sda21(r13)
/* 800573B8 00053338  54 03 D4 3E */	extrwi r3, r0, 16, 10
/* 800573BC 0005333C  4E 80 00 20 */	blr
.endfn sndRand

.fn sndSin, global
/* 800573C0 00053340  54 60 05 3E */	clrlwi r0, r3, 20
/* 800573C4 00053344  28 00 04 00 */	cmplwi r0, 0x400
/* 800573C8 00053348  3C 60 80 07 */	lis r3, sndSintab@ha
/* 800573CC 0005334C  38 63 A3 60 */	addi r3, r3, sndSintab@l
/* 800573D0 00053350  40 80 00 10 */	bge .L_800573E0
/* 800573D4 00053354  54 00 08 3C */	slwi r0, r0, 1
/* 800573D8 00053358  7C 63 02 AE */	lhax r3, r3, r0
/* 800573DC 0005335C  4E 80 00 20 */	blr
.L_800573E0:
/* 800573E0 00053360  28 00 08 00 */	cmplwi r0, 0x800
/* 800573E4 00053364  40 80 00 18 */	bge .L_800573FC
/* 800573E8 00053368  54 00 05 BE */	clrlwi r0, r0, 22
/* 800573EC 0005336C  20 00 03 FF */	subfic r0, r0, 0x3ff
/* 800573F0 00053370  54 00 08 3C */	slwi r0, r0, 1
/* 800573F4 00053374  7C 63 02 AE */	lhax r3, r3, r0
/* 800573F8 00053378  4E 80 00 20 */	blr
.L_800573FC:
/* 800573FC 0005337C  28 00 0C 00 */	cmplwi r0, 0xc00
/* 80057400 00053380  40 80 00 14 */	bge .L_80057414
/* 80057404 00053384  54 00 0D 7C */	clrlslwi r0, r0, 22, 1
/* 80057408 00053388  7C 03 02 AE */	lhax r0, r3, r0
/* 8005740C 0005338C  7C 60 00 D0 */	neg r3, r0
/* 80057410 00053390  4E 80 00 20 */	blr
.L_80057414:
/* 80057414 00053394  54 00 05 BE */	clrlwi r0, r0, 22
/* 80057418 00053398  20 00 03 FF */	subfic r0, r0, 0x3ff
/* 8005741C 0005339C  54 00 08 3C */	slwi r0, r0, 1
/* 80057420 000533A0  7C 03 02 AE */	lhax r0, r3, r0
/* 80057424 000533A4  7C 60 00 D0 */	neg r3, r0
/* 80057428 000533A8  4E 80 00 20 */	blr
.endfn sndSin

.fn sndBSearch, global
/* 8005742C 000533AC  7C 08 02 A6 */	mflr r0
/* 80057430 000533B0  2C 05 00 00 */	cmpwi r5, 0x0
/* 80057434 000533B4  90 01 00 04 */	stw r0, 0x4(r1)
/* 80057438 000533B8  94 21 FF B8 */	stwu r1, -0x48(r1)
/* 8005743C 000533BC  BE E1 00 24 */	stmw r23, 0x24(r1)
/* 80057440 000533C0  3A E3 00 00 */	addi r23, r3, 0x0
/* 80057444 000533C4  3B 04 00 00 */	addi r24, r4, 0x0
/* 80057448 000533C8  3B 26 00 00 */	addi r25, r6, 0x0
/* 8005744C 000533CC  3B 47 00 00 */	addi r26, r7, 0x0
/* 80057450 000533D0  41 82 00 5C */	beq .L_800574AC
/* 80057454 000533D4  3B C0 00 01 */	li r30, 0x1
/* 80057458 000533D8  3B A5 00 00 */	addi r29, r5, 0x0
.L_8005745C:
/* 8005745C 000533DC  7C 1E EA 14 */	add r0, r30, r29
/* 80057460 000533E0  7C 1C 0E 70 */	srawi r28, r0, 1
/* 80057464 000533E4  3B FC FF FF */	addi r31, r28, -0x1
/* 80057468 000533E8  7C 19 F9 D6 */	mullw r0, r25, r31
/* 8005746C 000533EC  39 9A 00 00 */	addi r12, r26, 0x0
/* 80057470 000533F0  7F 78 02 14 */	add r27, r24, r0
/* 80057474 000533F4  7D 88 03 A6 */	mtlr r12
/* 80057478 000533F8  38 77 00 00 */	addi r3, r23, 0x0
/* 8005747C 000533FC  38 9B 00 00 */	addi r4, r27, 0x0
/* 80057480 00053400  4E 80 00 21 */	blrl
/* 80057484 00053404  2C 03 00 00 */	cmpwi r3, 0x0
/* 80057488 00053408  40 82 00 0C */	bne .L_80057494
/* 8005748C 0005340C  7F 63 DB 78 */	mr r3, r27
/* 80057490 00053410  48 00 00 20 */	b .L_800574B0
.L_80057494:
/* 80057494 00053414  40 80 00 0C */	bge .L_800574A0
/* 80057498 00053418  7F FD FB 78 */	mr r29, r31
/* 8005749C 0005341C  48 00 00 08 */	b .L_800574A4
.L_800574A0:
/* 800574A0 00053420  3B DC 00 01 */	addi r30, r28, 0x1
.L_800574A4:
/* 800574A4 00053424  7C 1E E8 00 */	cmpw r30, r29
/* 800574A8 00053428  40 81 FF B4 */	ble .L_8005745C
.L_800574AC:
/* 800574AC 0005342C  38 60 00 00 */	li r3, 0x0
.L_800574B0:
/* 800574B0 00053430  BA E1 00 24 */	lmw r23, 0x24(r1)
/* 800574B4 00053434  80 01 00 4C */	lwz r0, 0x4c(r1)
/* 800574B8 00053438  38 21 00 48 */	addi r1, r1, 0x48
/* 800574BC 0005343C  7C 08 03 A6 */	mtlr r0
/* 800574C0 00053440  4E 80 00 20 */	blr
.endfn sndBSearch

.fn sndConvertMs, global
/* 800574C4 00053444  80 03 00 00 */	lwz r0, 0x0(r3)
/* 800574C8 00053448  54 00 40 2E */	slwi r0, r0, 8
/* 800574CC 0005344C  90 03 00 00 */	stw r0, 0x0(r3)
/* 800574D0 00053450  4E 80 00 20 */	blr
.endfn sndConvertMs

.fn sndConvertTicks, global
/* 800574D4 00053454  7C 08 02 A6 */	mflr r0
/* 800574D8 00053458  90 01 00 04 */	stw r0, 0x4(r1)
/* 800574DC 0005345C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800574E0 00053460  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800574E4 00053464  3B E3 00 00 */	addi r31, r3, 0x0
/* 800574E8 00053468  38 64 00 00 */	addi r3, r4, 0x0
/* 800574EC 0005346C  4B FE D7 35 */	bl synthGetTicksPerSecond
/* 800574F0 00053470  80 1F 00 00 */	lwz r0, 0x0(r31)
/* 800574F4 00053474  54 00 80 1E */	slwi r0, r0, 16
/* 800574F8 00053478  7C 00 1B 96 */	divwu r0, r0, r3
/* 800574FC 0005347C  1C 00 03 E8 */	mulli r0, r0, 0x3e8
/* 80057500 00053480  54 00 D9 7E */	srwi r0, r0, 5
/* 80057504 00053484  90 1F 00 00 */	stw r0, 0x0(r31)
/* 80057508 00053488  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8005750C 0005348C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80057510 00053490  38 21 00 18 */	addi r1, r1, 0x18
/* 80057514 00053494  7C 08 03 A6 */	mtlr r0
/* 80057518 00053498  4E 80 00 20 */	blr
.endfn sndConvertTicks

.fn sndConvert2Ms, global
/* 8005751C 0005349C  54 63 C2 3E */	srwi r3, r3, 8
/* 80057520 000534A0  4E 80 00 20 */	blr
.endfn sndConvert2Ms


.section .data, "wa"  # 0x80065000 - 0x8006D1C0 ; 0x000081C0

.balign 8


.obj sndSintab, local
	.4byte 0x00000006
	.4byte 0x000C0012
	.4byte 0x0019001F
	.4byte 0x0025002B
	.4byte 0x00320038
	.4byte 0x003E0045
	.4byte 0x004B0051
	.4byte 0x0057005E
	.4byte 0x0064006A
	.4byte 0x00710077
	.4byte 0x007D0083
	.4byte 0x008A0090
	.4byte 0x0096009D
	.4byte 0x00A300A9
	.4byte 0x00AF00B6
	.4byte 0x00BC00C2
	.4byte 0x00C800CF
	.4byte 0x00D500DB
	.4byte 0x00E200E8
	.4byte 0x00EE00F4
	.4byte 0x00FB0101
	.4byte 0x0107010D
	.4byte 0x0114011A
	.4byte 0x01200127
	.4byte 0x012D0133
	.4byte 0x01390140
	.4byte 0x0146014C
	.4byte 0x01520159
	.4byte 0x015F0165
	.4byte 0x016B0172
	.4byte 0x0178017E
	.4byte 0x0184018B
	.4byte 0x01910197
	.4byte 0x019D01A4
	.4byte 0x01AA01B0
	.4byte 0x01B601BD
	.4byte 0x01C301C9
	.4byte 0x01CF01D6
	.4byte 0x01DC01E2
	.4byte 0x01E801EF
	.4byte 0x01F501FB
	.4byte 0x02010208
	.4byte 0x020E0214
	.4byte 0x021A0221
	.4byte 0x0227022D
	.4byte 0x02330239
	.4byte 0x02400246
	.4byte 0x024C0252
	.4byte 0x0259025F
	.4byte 0x0265026B
	.4byte 0x02710278
	.4byte 0x027E0284
	.4byte 0x028A0290
	.4byte 0x0297029D
	.4byte 0x02A302A9
	.4byte 0x02AF02B6
	.4byte 0x02BC02C2
	.4byte 0x02C802CE
	.4byte 0x02D502DB
	.4byte 0x02E102E7
	.4byte 0x02ED02F3
	.4byte 0x02FA0300
	.4byte 0x0306030C
	.4byte 0x03120318
	.4byte 0x031F0325
	.4byte 0x032B0331
	.4byte 0x0337033D
	.4byte 0x0344034A
	.4byte 0x03500356
	.4byte 0x035C0362
	.4byte 0x0368036F
	.4byte 0x0375037B
	.4byte 0x03810387
	.4byte 0x038D0393
	.4byte 0x039903A0
	.4byte 0x03A603AC
	.4byte 0x03B203B8
	.4byte 0x03BE03C4
	.4byte 0x03CA03D0
	.4byte 0x03D703DD
	.4byte 0x03E303E9
	.4byte 0x03EF03F5
	.4byte 0x03FB0401
	.4byte 0x0407040D
	.4byte 0x0413041A
	.4byte 0x04200426
	.4byte 0x042C0432
	.4byte 0x0438043E
	.4byte 0x0444044A
	.4byte 0x04500456
	.4byte 0x045C0462
	.4byte 0x0468046E
	.4byte 0x0474047A
	.4byte 0x04800486
	.4byte 0x048C0492
	.4byte 0x0498049E
	.4byte 0x04A504AB
	.4byte 0x04B104B7
	.4byte 0x04BD04C3
	.4byte 0x04C904CF
	.4byte 0x04D504DB
	.4byte 0x04E004E6
	.4byte 0x04EC04F2
	.4byte 0x04F804FE
	.4byte 0x0504050A
	.4byte 0x05100516
	.4byte 0x051C0522
	.4byte 0x0528052E
	.4byte 0x0534053A
	.4byte 0x05400546
	.4byte 0x054C0552
	.4byte 0x0558055D
	.4byte 0x05630569
	.4byte 0x056F0575
	.4byte 0x057B0581
	.4byte 0x0587058D
	.4byte 0x05930599
	.4byte 0x059E05A4
	.4byte 0x05AA05B0
	.4byte 0x05B605BC
	.4byte 0x05C205C7
	.4byte 0x05CD05D3
	.4byte 0x05D905DF
	.4byte 0x05E505EB
	.4byte 0x05F005F6
	.4byte 0x05FC0602
	.4byte 0x0608060E
	.4byte 0x06130619
	.4byte 0x061F0625
	.4byte 0x062B0630
	.4byte 0x0636063C
	.4byte 0x06420648
	.4byte 0x064D0653
	.4byte 0x0659065F
	.4byte 0x0664066A
	.4byte 0x06700676
	.4byte 0x067B0681
	.4byte 0x0687068D
	.4byte 0x06920698
	.4byte 0x069E06A3
	.4byte 0x06A906AF
	.4byte 0x06B506BA
	.4byte 0x06C006C6
	.4byte 0x06CB06D1
	.4byte 0x06D706DC
	.4byte 0x06E206E8
	.4byte 0x06ED06F3
	.4byte 0x06F906FE
	.4byte 0x0704070A
	.4byte 0x070F0715
	.4byte 0x071B0720
	.4byte 0x0726072B
	.4byte 0x07310737
	.4byte 0x073C0742
	.4byte 0x0748074D
	.4byte 0x07530758
	.4byte 0x075E0763
	.4byte 0x0769076F
	.4byte 0x0774077A
	.4byte 0x077F0785
	.4byte 0x078A0790
	.4byte 0x0795079B
	.4byte 0x07A007A6
	.4byte 0x07AC07B1
	.4byte 0x07B707BC
	.4byte 0x07C207C7
	.4byte 0x07CD07D2
	.4byte 0x07D707DD
	.4byte 0x07E207E8
	.4byte 0x07ED07F3
	.4byte 0x07F807FE
	.4byte 0x08030809
	.4byte 0x080E0813
	.4byte 0x0819081E
	.4byte 0x08240829
	.4byte 0x082E0834
	.4byte 0x0839083F
	.4byte 0x08440849
	.4byte 0x084F0854
	.4byte 0x085A085F
	.4byte 0x0864086A
	.4byte 0x086F0874
	.4byte 0x087A087F
	.4byte 0x0884088A
	.4byte 0x088F0894
	.4byte 0x0899089F
	.4byte 0x08A408A9
	.4byte 0x08AF08B4
	.4byte 0x08B908BE
	.4byte 0x08C408C9
	.4byte 0x08CE08D3
	.4byte 0x08D908DE
	.4byte 0x08E308E8
	.4byte 0x08EE08F3
	.4byte 0x08F808FD
	.4byte 0x09020908
	.4byte 0x090D0912
	.4byte 0x0917091C
	.4byte 0x09210927
	.4byte 0x092C0931
	.4byte 0x0936093B
	.4byte 0x09400945
	.4byte 0x094B0950
	.4byte 0x0955095A
	.4byte 0x095F0964
	.4byte 0x0969096E
	.4byte 0x09730978
	.4byte 0x097D0982
	.4byte 0x0987098D
	.4byte 0x09920997
	.4byte 0x099C09A1
	.4byte 0x09A609AB
	.4byte 0x09B009B5
	.4byte 0x09BA09BF
	.4byte 0x09C409C9
	.4byte 0x09CE09D3
	.4byte 0x09D709DC
	.4byte 0x09E109E6
	.4byte 0x09EB09F0
	.4byte 0x09F509FA
	.4byte 0x09FF0A04
	.4byte 0x0A090A0E
	.4byte 0x0A120A17
	.4byte 0x0A1C0A21
	.4byte 0x0A260A2B
	.4byte 0x0A300A35
	.4byte 0x0A390A3E
	.4byte 0x0A430A48
	.4byte 0x0A4D0A51
	.4byte 0x0A560A5B
	.4byte 0x0A600A65
	.4byte 0x0A690A6E
	.4byte 0x0A730A78
	.4byte 0x0A7C0A81
	.4byte 0x0A860A8B
	.4byte 0x0A8F0A94
	.4byte 0x0A990A9D
	.4byte 0x0AA20AA7
	.4byte 0x0AAC0AB0
	.4byte 0x0AB50ABA
	.4byte 0x0ABE0AC3
	.4byte 0x0AC80ACC
	.4byte 0x0AD10AD5
	.4byte 0x0ADA0ADF
	.4byte 0x0AE30AE8
	.4byte 0x0AEC0AF1
	.4byte 0x0AF60AFA
	.4byte 0x0AFF0B03
	.4byte 0x0B080B0C
	.4byte 0x0B110B15
	.4byte 0x0B1A0B1F
	.4byte 0x0B230B28
	.4byte 0x0B2C0B31
	.4byte 0x0B350B3A
	.4byte 0x0B3E0B42
	.4byte 0x0B470B4B
	.4byte 0x0B500B54
	.4byte 0x0B590B5D
	.4byte 0x0B620B66
	.4byte 0x0B6A0B6F
	.4byte 0x0B730B78
	.4byte 0x0B7C0B80
	.4byte 0x0B850B89
	.4byte 0x0B8D0B92
	.4byte 0x0B960B9A
	.4byte 0x0B9F0BA3
	.4byte 0x0BA70BAC
	.4byte 0x0BB00BB4
	.4byte 0x0BB80BBD
	.4byte 0x0BC10BC5
	.4byte 0x0BCA0BCE
	.4byte 0x0BD20BD6
	.4byte 0x0BDA0BDF
	.4byte 0x0BE30BE7
	.4byte 0x0BEB0BEF
	.4byte 0x0BF40BF8
	.4byte 0x0BFC0C00
	.4byte 0x0C040C08
	.4byte 0x0C0D0C11
	.4byte 0x0C150C19
	.4byte 0x0C1D0C21
	.4byte 0x0C250C29
	.4byte 0x0C2D0C31
	.4byte 0x0C360C3A
	.4byte 0x0C3E0C42
	.4byte 0x0C460C4A
	.4byte 0x0C4E0C52
	.4byte 0x0C560C5A
	.4byte 0x0C5E0C62
	.4byte 0x0C660C6A
	.4byte 0x0C6E0C72
	.4byte 0x0C760C79
	.4byte 0x0C7D0C81
	.4byte 0x0C850C89
	.4byte 0x0C8D0C91
	.4byte 0x0C950C99
	.4byte 0x0C9D0CA0
	.4byte 0x0CA40CA8
	.4byte 0x0CAC0CB0
	.4byte 0x0CB40CB7
	.4byte 0x0CBB0CBF
	.4byte 0x0CC30CC7
	.4byte 0x0CCA0CCE
	.4byte 0x0CD20CD6
	.4byte 0x0CD90CDD
	.4byte 0x0CE10CE5
	.4byte 0x0CE80CEC
	.4byte 0x0CF00CF3
	.4byte 0x0CF70CFB
	.4byte 0x0CFE0D02
	.4byte 0x0D060D09
	.4byte 0x0D0D0D11
	.4byte 0x0D140D18
	.4byte 0x0D1C0D1F
	.4byte 0x0D230D26
	.4byte 0x0D2A0D2D
	.4byte 0x0D310D35
	.4byte 0x0D380D3C
	.4byte 0x0D3F0D43
	.4byte 0x0D460D4A
	.4byte 0x0D4D0D51
	.4byte 0x0D540D58
	.4byte 0x0D5B0D5F
	.4byte 0x0D620D65
	.4byte 0x0D690D6C
	.4byte 0x0D700D73
	.4byte 0x0D770D7A
	.4byte 0x0D7D0D81
	.4byte 0x0D840D87
	.4byte 0x0D8B0D8E
	.4byte 0x0D910D95
	.4byte 0x0D980D9B
	.4byte 0x0D9F0DA2
	.4byte 0x0DA50DA9
	.4byte 0x0DAC0DAF
	.4byte 0x0DB20DB6
	.4byte 0x0DB90DBC
	.4byte 0x0DBF0DC2
	.4byte 0x0DC60DC9
	.4byte 0x0DCC0DCF
	.4byte 0x0DD20DD5
	.4byte 0x0DD90DDC
	.4byte 0x0DDF0DE2
	.4byte 0x0DE50DE8
	.4byte 0x0DEB0DEE
	.4byte 0x0DF20DF5
	.4byte 0x0DF80DFB
	.4byte 0x0DFE0E01
	.4byte 0x0E040E07
	.4byte 0x0E0A0E0D
	.4byte 0x0E100E13
	.4byte 0x0E160E19
	.4byte 0x0E1C0E1F
	.4byte 0x0E220E25
	.4byte 0x0E280E2B
	.4byte 0x0E2D0E30
	.4byte 0x0E330E36
	.4byte 0x0E390E3C
	.4byte 0x0E3F0E42
	.4byte 0x0E440E47
	.4byte 0x0E4A0E4D
	.4byte 0x0E500E53
	.4byte 0x0E550E58
	.4byte 0x0E5B0E5E
	.4byte 0x0E600E63
	.4byte 0x0E660E69
	.4byte 0x0E6B0E6E
	.4byte 0x0E710E74
	.4byte 0x0E760E79
	.4byte 0x0E7C0E7E
	.4byte 0x0E810E84
	.4byte 0x0E860E89
	.4byte 0x0E8B0E8E
	.4byte 0x0E910E93
	.4byte 0x0E960E98
	.4byte 0x0E9B0E9E
	.4byte 0x0EA00EA3
	.4byte 0x0EA50EA8
	.4byte 0x0EAA0EAD
	.4byte 0x0EAF0EB2
	.4byte 0x0EB40EB7
	.4byte 0x0EB90EBC
	.4byte 0x0EBE0EC0
	.4byte 0x0EC30EC5
	.4byte 0x0EC80ECA
	.4byte 0x0ECD0ECF
	.4byte 0x0ED10ED4
	.4byte 0x0ED60ED8
	.4byte 0x0EDB0EDD
	.4byte 0x0EDF0EE2
	.4byte 0x0EE40EE6
	.4byte 0x0EE80EEB
	.4byte 0x0EED0EEF
	.4byte 0x0EF20EF4
	.4byte 0x0EF60EF8
	.4byte 0x0EFA0EFD
	.4byte 0x0EFF0F01
	.4byte 0x0F030F05
	.4byte 0x0F080F0A
	.4byte 0x0F0C0F0E
	.4byte 0x0F100F12
	.4byte 0x0F140F16
	.4byte 0x0F180F1B
	.4byte 0x0F1D0F1F
	.4byte 0x0F210F23
	.4byte 0x0F250F27
	.4byte 0x0F290F2B
	.4byte 0x0F2D0F2F
	.4byte 0x0F310F33
	.4byte 0x0F350F37
	.4byte 0x0F390F3B
	.4byte 0x0F3C0F3E
	.4byte 0x0F400F42
	.4byte 0x0F440F46
	.4byte 0x0F480F4A
	.4byte 0x0F4B0F4D
	.4byte 0x0F4F0F51
	.4byte 0x0F530F55
	.4byte 0x0F560F58
	.4byte 0x0F5A0F5C
	.4byte 0x0F5D0F5F
	.4byte 0x0F610F63
	.4byte 0x0F640F66
	.4byte 0x0F680F69
	.4byte 0x0F6B0F6D
	.4byte 0x0F6E0F70
	.4byte 0x0F720F73
	.4byte 0x0F750F77
	.4byte 0x0F780F7A
	.4byte 0x0F7B0F7D
	.4byte 0x0F7F0F80
	.4byte 0x0F820F83
	.4byte 0x0F850F86
	.4byte 0x0F880F89
	.4byte 0x0F8B0F8C
	.4byte 0x0F8E0F8F
	.4byte 0x0F910F92
	.4byte 0x0F940F95
	.4byte 0x0F960F98
	.4byte 0x0F990F9B
	.4byte 0x0F9C0F9D
	.4byte 0x0F9F0FA0
	.4byte 0x0FA10FA3
	.4byte 0x0FA40FA5
	.4byte 0x0FA70FA8
	.4byte 0x0FA90FAB
	.4byte 0x0FAC0FAD
	.4byte 0x0FAE0FB0
	.4byte 0x0FB10FB2
	.4byte 0x0FB30FB4
	.4byte 0x0FB60FB7
	.4byte 0x0FB80FB9
	.4byte 0x0FBA0FBB
	.4byte 0x0FBD0FBE
	.4byte 0x0FBF0FC0
	.4byte 0x0FC10FC2
	.4byte 0x0FC30FC4
	.4byte 0x0FC50FC6
	.4byte 0x0FC70FC8
	.4byte 0x0FC90FCA
	.4byte 0x0FCB0FCC
	.4byte 0x0FCD0FCE
	.4byte 0x0FCF0FD0
	.4byte 0x0FD10FD2
	.4byte 0x0FD30FD4
	.4byte 0x0FD50FD6
	.4byte 0x0FD70FD8
	.4byte 0x0FD90FD9
	.4byte 0x0FDA0FDB
	.4byte 0x0FDC0FDD
	.4byte 0x0FDE0FDE
	.4byte 0x0FDF0FE0
	.4byte 0x0FE10FE1
	.4byte 0x0FE20FE3
	.4byte 0x0FE40FE4
	.4byte 0x0FE50FE6
	.4byte 0x0FE70FE7
	.4byte 0x0FE80FE9
	.4byte 0x0FE90FEA
	.4byte 0x0FEB0FEB
	.4byte 0x0FEC0FEC
	.4byte 0x0FED0FEE
	.4byte 0x0FEE0FEF
	.4byte 0x0FEF0FF0
	.4byte 0x0FF00FF1
	.4byte 0x0FF10FF2
	.4byte 0x0FF20FF3
	.4byte 0x0FF30FF4
	.4byte 0x0FF40FF5
	.4byte 0x0FF50FF6
	.4byte 0x0FF60FF7
	.4byte 0x0FF70FF7
	.4byte 0x0FF80FF8
	.4byte 0x0FF90FF9
	.4byte 0x0FF90FFA
	.4byte 0x0FFA0FFA
	.4byte 0x0FFB0FFB
	.4byte 0x0FFB0FFB
	.4byte 0x0FFC0FFC
	.4byte 0x0FFC0FFC
	.4byte 0x0FFD0FFD
	.4byte 0x0FFD0FFD
	.4byte 0x0FFE0FFE
	.4byte 0x0FFE0FFE
	.4byte 0x0FFE0FFE
	.4byte 0x0FFF0FFF
	.4byte 0x0FFF0FFF
	.4byte 0x0FFF0FFF
	.4byte 0x0FFF0FFF
	.4byte 0x0FFF0FFF
	.4byte 0x0FFF0FFF
	.4byte 0x0FFF0FFF
.endobj sndSintab

.section .sdata, "wa"  # 0x800A8A80 - 0x800A8DC0

.balign 8

.obj last_rnd, local
	.4byte 0x00000001
.endobj last_rnd

.section extab, "a"  # 0x80005520 - 0x80005BC0

.obj "@etb_80005A08", local
.hidden "@etb_80005A08"
	.4byte 0x48080000
	.4byte 0
.endobj "@etb_80005A08"

.obj "@etb_80005A10", local
.hidden "@etb_80005A10"
	.4byte 0x08080000
	.4byte 0
.endobj "@etb_80005A10"

.section extabindex, "a"  # 0x80005BC0 - 0x800065A0


.obj "@eti_8000631C", local
.hidden "@eti_8000631C"
	.4byte sndBSearch
	.4byte 0x00000098
	.4byte "@etb_80005A08"
.endobj "@eti_8000631C"

.obj "@eti_80006328", local
.hidden "@eti_80006328"
	.4byte sndConvertTicks
	.4byte 0x00000048
	.4byte "@etb_80005A10"
.endobj "@eti_80006328"
