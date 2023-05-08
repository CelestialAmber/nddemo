.include "macros.s"

.section .sdata, "wa"  # 0x800A8A80 - 0x800A8DC0 ; 0x00000340


.global fragmentID
fragmentID:

	# ROM: 0x6A4C8
	.4byte 0xFFFFFFFE
	.4byte 0

.global lbl_800A8D90
lbl_800A8D90:

	# ROM: 0x6A4D0
	.4byte 0
	.4byte 0

.global K1
K1:
	# ROM: 0x6A4D8
	.4byte 0x80808080

.global K2
K2:
	# ROM: 0x6A4DC
	.4byte 0xFEFEFEFF