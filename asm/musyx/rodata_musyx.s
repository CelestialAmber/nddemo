.include "macros.s"

.section .rodata, "wa"  # 0x80063D20 - 0x80065000 ; 0x000012E0


inpColdMIDIDefaults:

	# ROM: 0x61570
	.4byte 0
	.4byte 0x0000007F
	.4byte 0x0000407F
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
	.4byte 0x00007F7F
	.4byte 0x7F7F0000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x40000000
	.4byte 0x40000000

inpWarmMIDIDefaults:

	# ROM: 0x615F8
	.4byte 0xFF00FFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFF7F
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFF00FFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFF7F
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0
	.4byte 0xFF00FFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0xFFFFFFFF
	.4byte 0x40FFFFFF
	.4byte 0xFFFF0000

itdOffTab:

	# ROM: 0x61680
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x00000001
	.4byte 0x00010001
	.4byte 0x00010001
	.4byte 0x00010001
	.4byte 0x00020002
	.4byte 0x00020002
	.4byte 0x00020003
	.4byte 0x00030003
	.4byte 0x00030003
	.4byte 0x00040004
	.4byte 0x00040004
	.4byte 0x00050005
	.4byte 0x00050006
	.4byte 0x00060006
	.4byte 0x00070007
	.4byte 0x00070008
	.4byte 0x00080008
	.4byte 0x00090009
	.4byte 0x0009000A
	.4byte 0x000A000A
	.4byte 0x000B000B
	.4byte 0x000C000C
	.4byte 0x000C000D
	.4byte 0x000D000D
	.4byte 0x000E000E
	.4byte 0x000F000F
	.4byte 0x000F0010
	.4byte 0x00100011
	.4byte 0x00110011
	.4byte 0x00120012
	.4byte 0x00130013
	.4byte 0x00130014
	.4byte 0x00140014
	.4byte 0x00150015
	.4byte 0x00160016
	.4byte 0x00160017
	.4byte 0x00170017
	.4byte 0x00180018
	.4byte 0x00180019
	.4byte 0x00190019
	.4byte 0x001A001A
	.4byte 0x001A001B
	.4byte 0x001B001B
	.4byte 0x001C001C
	.4byte 0x001C001C
	.4byte 0x001D001D
	.4byte 0x001D001D
	.4byte 0x001D001E
	.4byte 0x001E001E
	.4byte 0x001E001E
	.4byte 0x001F001F
	.4byte 0x001F001F
	.4byte 0x001F001F
	.4byte 0x001F0020
	.4byte 0x00200020
	.4byte 0x00200020
	.4byte 0x00200020
	.4byte 0x00200020
	.4byte 0x00200020