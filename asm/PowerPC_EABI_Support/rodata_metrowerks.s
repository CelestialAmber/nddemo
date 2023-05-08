.include "macros.s"

.section .rodata, "wa"  # 0x80063D20 - 0x80065000 ; 0x000012E0


.global lbl_80064780
lbl_80064780:

	# ROM: 0x61780
	.asciz "MetroTRK for Dolphin v0.8"
	.balign 4
	.4byte 0

.global gTRKMemMap
gTRKMemMap:

	# ROM: 0x617A0
	.4byte 0
	.4byte 0xFFFFFFFF
	.4byte 0x00000001
	.4byte 0x00000001

.global lbl_800647B0
lbl_800647B0:

	# ROM: 0x617B0
	.4byte 0x60000000
	.4byte 0x60000000
	.4byte 0x60000000
	.4byte 0x60000000
	.4byte 0x60000000

.global lbl_800647C4
lbl_800647C4:

	# ROM: 0x617C4
	.4byte 0x60000000
	.4byte 0x60000000
	.4byte 0x60000000
	.4byte 0x60000000
	.4byte 0x60000000

.global lbl_800647D8
lbl_800647D8:

	# ROM: 0x617D8
	.4byte 0x60000000
	.4byte 0x60000000
	.4byte 0x60000000
	.4byte 0x60000000
	.4byte 0x60000000
	.4byte 0

.global __constants
__constants:

	# ROM: 0x617F0
	.4byte 0
	.4byte 0
	.4byte 0x41F00000
	.4byte 0
	.4byte 0x41E00000
	.4byte 0

.global bit_values
bit_values:

	# ROM: 0x61808
	.4byte 0x40240000
	.4byte 0
	.4byte 0x40590000
	.4byte 0
	.4byte 0x40C38800
	.4byte 0
	.4byte 0x4197D784
	.4byte 0
	.4byte 0x4341C379
	.4byte 0x37E08000
	.4byte 0x4693B8B5
	.4byte 0xB5056E17
	.4byte 0x4D384F03
	.4byte 0xE93FF9F5
	.4byte 0x5A827748
	.4byte 0xF9301D32
	.4byte 0x75154FDD
	.4byte 0x7F73BF3C

.global digit_values
digit_values:

	# ROM: 0x61850
	.4byte 0x40240000
	.4byte 0
	.4byte 0x40590000
	.4byte 0
	.4byte 0x408F4000
	.4byte 0
	.4byte 0x40C38800
	.4byte 0
	.4byte 0x40F86A00
	.4byte 0
	.4byte 0x412E8480
	.4byte 0
	.4byte 0x416312D0
	.4byte 0
	.4byte 0x4197D784
	.4byte 0

.global __ctype_map
__ctype_map:

	# ROM: 0x61890
	.4byte 0x01010101
	.4byte 0x01010101
	.4byte 0x01020202
	.4byte 0x02020101
	.4byte 0x01010101
	.4byte 0x01010101
	.4byte 0x01010101
	.4byte 0x01010101
	.4byte 0x04080808
	.4byte 0x08080808
	.4byte 0x08080808
	.4byte 0x08080808
	.4byte 0x30303030
	.4byte 0x30303030
	.4byte 0x30300808
	.4byte 0x08080808
	.4byte 0x08A0A0A0
	.4byte 0xA0A0A080
	.4byte 0x80808080
	.4byte 0x80808080
	.4byte 0x80808080
	.4byte 0x80808080
	.4byte 0x80808008
	.4byte 0x08080808
	.4byte 0x08606060
	.4byte 0x60606040
	.4byte 0x40404040
	.4byte 0x40404040
	.4byte 0x40404040
	.4byte 0x40404040
	.4byte 0x40404008
	.4byte 0x08080801
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0

.global __lower_map
__lower_map:

	# ROM: 0x61990
	.4byte 0x00010203
	.4byte 0x04050607
	.4byte 0x08090A0B
	.4byte 0x0C0D0E0F
	.4byte 0x10111213
	.4byte 0x14151617
	.4byte 0x18191A1B
	.4byte 0x1C1D1E1F
	.4byte 0x20212223
	.4byte 0x24252627
	.4byte 0x28292A2B
	.4byte 0x2C2D2E2F
	.4byte 0x30313233
	.4byte 0x34353637
	.4byte 0x38393A3B
	.4byte 0x3C3D3E3F
	.4byte 0x40616263
	.4byte 0x64656667
	.4byte 0x68696A6B
	.4byte 0x6C6D6E6F
	.4byte 0x70717273
	.4byte 0x74757677
	.4byte 0x78797A5B
	.4byte 0x5C5D5E5F
	.4byte 0x60616263
	.4byte 0x64656667
	.4byte 0x68696A6B
	.4byte 0x6C6D6E6F
	.4byte 0x70717273
	.4byte 0x74757677
	.4byte 0x78797A7B
	.4byte 0x7C7D7E7F
	.4byte 0x80818283
	.4byte 0x84858687
	.4byte 0x88898A8B
	.4byte 0x8C8D8E8F
	.4byte 0x90919293
	.4byte 0x94959697
	.4byte 0x98999A9B
	.4byte 0x9C9D9E9F
	.4byte 0xA0A1A2A3
	.4byte 0xA4A5A6A7
	.4byte 0xA8A9AAAB
	.4byte 0xACADAEAF
	.4byte 0xB0B1B2B3
	.4byte 0xB4B5B6B7
	.4byte 0xB8B9BABB
	.4byte 0xBCBDBEBF
	.4byte 0xC0C1C2C3
	.4byte 0xC4C5C6C7
	.4byte 0xC8C9CACB
	.4byte 0xCCCDCECF
	.4byte 0xD0D1D2D3
	.4byte 0xD4D5D6D7
	.4byte 0xD8D9DADB
	.4byte 0xDCDDDEDF
	.4byte 0xE0E1E2E3
	.4byte 0xE4E5E6E7
	.4byte 0xE8E9EAEB
	.4byte 0xECEDEEEF
	.4byte 0xF0F1F2F3
	.4byte 0xF4F5F6F7
	.4byte 0xF8F9FAFB
	.4byte 0xFCFDFEFF

.global lbl_80064A90
lbl_80064A90:

	# ROM: 0x61A90
	.4byte 0x002D496E
	.4byte 0x6600496E
	.4byte 0x66004E61
	.4byte 0x4E000000

.global "atan_coeff$96"
"atan_coeff$96":

	# ROM: 0x61AA0
	.4byte 0x3F800000
	.4byte 0xBEAAAAAA
	.4byte 0x3E4CCC81
	.4byte 0xBE123E7D
	.4byte 0x3DE21F95
	.4byte 0xBDAD417C
	.4byte 0x3D41186D
	.4byte 0x40DA826B
	.asciz "@OYX@"
	.balign 4
	.4byte 0x3FB925AB
	.4byte 0x3F95F61A
	.4byte 0x3F851081
	.4byte 0x36EF692F
	.4byte 0x355C1DF9
	.4byte 0
	.4byte 0x35291D45
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x3EC90EAA
	.4byte 0x3F16CBE4
	.4byte 0x3F490FDA
	.4byte 0x3F7B53C5
	.4byte 0x3F96CBE2
	.4byte 0x3FAFEDD9
	.4byte 0
	.4byte 0x37185D99
	.4byte 0x32C59189
	.4byte 0x33874A9E
	.4byte 0x353CFA83
	.4byte 0x348637BD
	.4byte 0x35541063
	.4byte 0x401A8277
	.4byte 0x3FBF90C7
	.4byte 0x3F800000
	.4byte 0x3F2B0DC1
	.4byte 0x3ED413CD
	.4byte 0x3E4BAFAF
	.4byte 0x3516DC59
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0

.global tmp_float
tmp_float:

	# ROM: 0x61B58
	.4byte 0x3E800000
	.4byte 0x3CBE6080
	.4byte 0x34372200
	.4byte 0x2DA44152

.global __one_over_F
__one_over_F:

	# ROM: 0x61B68
	.4byte 0x3F800000
	.4byte 0x3F7E03F8
	.4byte 0x3F7C0FC1
	.4byte 0x3F7A232D
	.4byte 0x3F783E10
	.4byte 0x3F76603E
	.4byte 0x3F74898D
	.4byte 0x3F72B9D6
	.4byte 0x3F70F0F1
	.4byte 0x3F6F2EB7
	.4byte 0x3F6D7304
	.4byte 0x3F6BBDB3
	.4byte 0x3F6A0EA1
	.4byte 0x3F6865AC
	.4byte 0x3F66C2B4
	.4byte 0x3F652598
	.4byte 0x3F638E39
	.4byte 0x3F61FC78
	.4byte 0x3F607038
	.4byte 0x3F5EE95C
	.4byte 0x3F5D67C9
	.4byte 0x3F5BEB62
	.4byte 0x3F5A740E
	.4byte 0x3F5901B2
	.4byte 0x3F579436
	.4byte 0x3F562B81
	.4byte 0x3F54C77B
	.4byte 0x3F53680D
	.4byte 0x3F520D21
	.4byte 0x3F50B6A0
	.4byte 0x3F4F6475
	.4byte 0x3F4E168A
	.4byte 0x3F4CCCCD
	.4byte 0x3F4B8728
	.4byte 0x3F4A4588
	.4byte 0x3F4907DA
	.4byte 0x3F47CE0C
	.4byte 0x3F46980C
	.4byte 0x3F4565C8
	.4byte 0x3F443730
	.4byte 0x3F430C31
	.4byte 0x3F41E4BC
	.4byte 0x3F40C0C1
	.4byte 0x3F3FA030
	.4byte 0x3F3E82FA
	.4byte 0x3F3D6910
	.4byte 0x3F3C5264
	.4byte 0x3F3B3EE7
	.4byte 0x3F3A2E8C
	.4byte 0x3F392144
	.4byte 0x3F381703
	.4byte 0x3F370FBB
	.4byte 0x3F360B61
	.4byte 0x3F3509E7
	.4byte 0x3F340B41
	.4byte 0x3F330F63
	.4byte 0x3F321643
	.4byte 0x3F311FD4
	.4byte 0x3F302C0B
	.4byte 0x3F2F3ADE
	.4byte 0x3F2E4C41
	.4byte 0x3F2D602B
	.4byte 0x3F2C7692
	.4byte 0x3F2B8F6A
	.4byte 0x3F2AAAAB
	.4byte 0x3F29C84A
	.4byte 0x3F28E83F
	.4byte 0x3F280A81
	.4byte 0x3F272F05
	.4byte 0x3F2655C4
	.4byte 0x3F257EB5
	.4byte 0x3F24A9CF
	.4byte 0x3F23D70A
	.4byte 0x3F23065E
	.4byte 0x3F2237C3
	.4byte 0x3F216B31
	.4byte 0x3F20A0A1
	.4byte 0x3F1FD80A
	.4byte 0x3F1F1166
	.4byte 0x3F1E4CAD
	.4byte 0x3F1D89D9
	.4byte 0x3F1CC8E1
	.4byte 0x3F1C09C1
	.4byte 0x3F1B4C70
	.4byte 0x3F1A90E8
	.4byte 0x3F19D723
	.4byte 0x3F191F1A
	.4byte 0x3F1868C8
	.4byte 0x3F17B426
	.4byte 0x3F17012E
	.4byte 0x3F164FDA
	.4byte 0x3F15A025
	.4byte 0x3F14F209
	.4byte 0x3F144581
	.4byte 0x3F139A86
	.4byte 0x3F12F114
	.4byte 0x3F124925
	.4byte 0x3F11A2B4
	.4byte 0x3F10FDBC
	.4byte 0x3F105A38
	.4byte 0x3F0FB824
	.4byte 0x3F0F177A
	.4byte 0x3F0E7835
	.4byte 0x3F0DDA52
	.4byte 0x3F0D3DCB
	.4byte 0x3F0CA29C
	.4byte 0x3F0C08C1
	.4byte 0x3F0B7034
	.4byte 0x3F0AD8F3
	.4byte 0x3F0A42F8
	.4byte 0x3F09AE41
	.4byte 0x3F091AC7
	.4byte 0x3F088889
	.4byte 0x3F07F781
	.4byte 0x3F0767AB
	.4byte 0x3F06D905
	.4byte 0x3F064B8A
	.4byte 0x3F05BF37
	.4byte 0x3F053408
	.4byte 0x3F04A9FA
	.4byte 0x3F042108
	.4byte 0x3F039930
	.4byte 0x3F03126F
	.4byte 0x3F028CC0
	.4byte 0x3F020821
	.4byte 0x3F01848E
	.4byte 0x3F010204
	.4byte 0x3F008080
	.4byte 0x3F000000

.global __sincos_on_quadrant
__sincos_on_quadrant:

	# ROM: 0x61D6C
	.4byte 0
	.4byte 0x3F800000
	.4byte 0x3F800000
	.4byte 0
	.4byte 0
	.4byte 0xBF800000
	.4byte 0xBF800000
	.4byte 0

.global __sincos_poly
__sincos_poly:

	# ROM: 0x61D8C
	.4byte 0x366CCFAA
	.4byte 0x34A5E129
	.4byte 0xB9AAE275
	.4byte 0xB8196543
	.4byte 0x3C81E0ED
	.4byte 0x3B2335DD
	.4byte 0xBE9DE9E6
	.4byte 0xBDA55DE7
	.4byte 0x3F800000
	.4byte 0x3F490FDB
	.4byte 0

.global __log2_F
__log2_F:

	# ROM: 0x61DB8
	.4byte 0xBEC00000
	.4byte 0xBEBA406C
	.4byte 0xBEB48C35
	.4byte 0xBEAEE32E
	.4byte 0xBEA9452D
	.4byte 0xBEA3B205
	.4byte 0xBE9E298F
	.4byte 0xBE98ABA0
	.4byte 0xBE933812
	.4byte 0xBE8DCEBD
	.4byte 0xBE886F7B
	.4byte 0xBE831A28
	.4byte 0xBE7B9D3C
	.4byte 0xBE711973
	.4byte 0xBE66A8B1
	.4byte 0xBE5C4AB0
	.4byte 0xBE51FF2E
	.4byte 0xBE47C5E9
	.4byte 0xBE3D9EA1
	.4byte 0xBE338918
	.4byte 0xBE29850F
	.4byte 0xBE1F924A
	.4byte 0xBE15B08E
	.4byte 0xBE0BDFA1
	.4byte 0xBE021F4A
	.4byte 0xBDF0DEA4
	.4byte 0xBDDD9F05
	.4byte 0xBDCA7F4A
	.4byte 0xBDB77F0B
	.4byte 0xBDA49DE0
	.4byte 0xBD91DB66
	.4byte 0xBD7E6E71
	.4byte 0xBD5961ED
	.4byte 0xBD349081
	.4byte 0xBD0FF971
	.4byte 0xBCD7380E
	.4byte 0xBC8EEF19
	.4byte 0xBC0E2D45
	.4byte 0x38256316
	.4byte 0x3C0E9C73
	.4byte 0x3C8DDD45
	.4byte 0x3CD4011D
	.4byte 0x3D0CDD83
	.4byte 0x3D2F861E
	.4byte 0x3D51FAFE
	.4byte 0x3D743CBA
	.4byte 0x3D8B25F6
	.4byte 0x3D9C1492
	.4byte 0x3DACEA7C
	.4byte 0x3DBDA7FB
	.4byte 0x3DCE4D54
	.4byte 0x3DDEDACE
	.4byte 0x3DEF50AD
	.4byte 0x3DFFAF33
	.4byte 0x3E07FB51
	.4byte 0x3E10139E
	.4byte 0x3E1820A0
	.4byte 0x3E202276
	.4byte 0x3E28193F
	.4byte 0x3E30051A
	.4byte 0x3E37E624
	.4byte 0x3E3FBC7A
	.4byte 0x3E47883A
	.4byte 0x3E4F4981
	.4byte 0x3E570069
	.4byte 0x3E5EAD0F
	.4byte 0x3E664F8D
	.4byte 0x3E6DE7FF
	.4byte 0x3E75767F
	.4byte 0x3E7CFB27
	.4byte 0x3E823B08
	.4byte 0x3E85F3AA
	.4byte 0x3E89A785
	.4byte 0x3E8D56A6
	.4byte 0x3E910118
	.4byte 0x3E94A6E9
	.4byte 0x3E984822
	.4byte 0x3E9BE4D1
	.4byte 0x3E9F7CFF
	.4byte 0x3EA310B9
	.4byte 0x3EA6A009
	.4byte 0x3EAA2AFA
	.4byte 0x3EADB197
	.4byte 0x3EB133EA
	.4byte 0x3EB4B1FD
	.4byte 0x3EB82BDC
	.4byte 0x3EBBA190
	.4byte 0x3EBF1322
	.4byte 0x3EC2809D
	.4byte 0x3EC5EA0B
	.4byte 0x3EC94F75
	.4byte 0x3ECCB0E4
	.4byte 0x3ED00E61
	.4byte 0x3ED367F7
	.4byte 0x3ED6BDAD
	.4byte 0x3EDA0F8D
	.4byte 0x3EDD5DA0
	.4byte 0x3EE0A7EE
	.4byte 0x3EE3EE7F
	.4byte 0x3EE7315D
	.4byte 0x3EEA708F
	.4byte 0x3EEDAC1E
	.4byte 0x3EF0E412
	.4byte 0x3EF41873
	.4byte 0x3EF74949
	.4byte 0x3EFA769B
	.4byte 0x3EFDA072
	.4byte 0x3F00636A
	.4byte 0x3F01F4E5
	.4byte 0x3F0384AD
	.4byte 0x3F0512C7
	.4byte 0x3F069F35
	.4byte 0x3F0829FB
	.4byte 0x3F09B31E
	.4byte 0x3F0B3A9F
	.4byte 0x3F0CC083
	.4byte 0x3F0E44CD
	.4byte 0x3F0FC781
	.4byte 0x3F1148A1
	.4byte 0x3F12C832
	.4byte 0x3F144636
	.4byte 0x3F15C2B0
	.4byte 0x3F173DA4
	.4byte 0x3F18B714
	.4byte 0x3F1A2F04
	.4byte 0x3F1BA578
	.4byte 0x3F1D1A71
	.4byte 0x3F1E8DF2
	.4byte 0x3F200000
	.4byte 0x3F317218
	.4byte 0x3E75FDF0
	.4byte 0x3D635854
	.4byte 0x3C1D9561
	.4byte 0x3AAEBE2F
	.4byte 0x3921805E
	.4byte 0x3781E214
	.4byte 0x35B3C15F
	.4byte 0x33DD30D7
	.4byte 0x3F7FFFFE
	.4byte 0x3EFFFFFF
	.4byte 0x3E2AAB03
	.4byte 0x3D2AAAE6
	.4byte 0x3C0874AA
	.4byte 0x3AB5F6D0
	.4byte 0x3956A4B8
	.4byte 0x37D5E715
