.include "macros.s"

.section .sdata, "wa"  # 0x800A8A80 - 0x800A8DC0 ; 0x00000340


fragmentID:
	.4byte 0xFFFFFFFE
	.4byte 0

lbl_800A8D90:
	.4byte 0
	.4byte 0

K1:	.4byte 0x80808080

K2:	.4byte 0xFEFEFEFF