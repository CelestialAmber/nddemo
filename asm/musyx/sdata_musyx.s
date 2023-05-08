.include "macros.s"

.section .sdata, "wa"  # 0x800A8A80 - 0x800A8DC0 ; 0x00000340


last_rnd:

	# ROM: 0x6A4A8
	.4byte 0x00000001
	.4byte 0

"dspSRCType$202":

	# ROM: 0x6A4B0
	.4byte 0x00000001
	.4byte 0x00020000

"dspCoefSel$204":

	# ROM: 0x6A4B8
	.4byte 0x00000001
	.4byte 0x00020000

.global dspSlaveLength
dspSlaveLength:

	# ROM: 0x6A4C0
	.4byte 0x19E00000
	.4byte 0