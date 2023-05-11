.include "macros.inc"

.section extabindex_, "wa"  # 0x80005BC0 - 0x800065A0 ; 0x000009E0

#_eti_init_info
.global _eti_init_info_
_eti_init_info_:
	.4byte lbl_80005BC0
	.4byte _eti_init_info_
	.4byte seqStartPlay
	.4byte 0x0001D72C
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
