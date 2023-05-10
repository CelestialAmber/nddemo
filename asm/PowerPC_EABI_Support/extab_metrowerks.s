.include "macros.s"

.section extab_, "wa"  # 0x80005520 - 0x80005BC0 ; 0x000006A0

lbl_80005B88:
	.4byte 0x20080000
	.4byte 0

lbl_80005B90:
	.4byte 0x20080000
	.4byte 0x00000064
	.4byte 0x00000010
	.4byte 0
	.4byte 0x8200001C
	.4byte __dt__26__partial_array_destructorFv

lbl_80005BA8:
	.4byte 0x18080000
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
