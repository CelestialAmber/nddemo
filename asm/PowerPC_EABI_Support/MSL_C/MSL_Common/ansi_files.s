.include "macros.inc"

.section .data, "wa"  # 0x80065000 - 0x8006D1C0 ; 0x000081C0

.balign 8


.obj __files, global
	.4byte 0
	.4byte 0x08800000
	.4byte 0
.endobj __files

.obj lbl_8006CEBC, local
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte lbl_8006CEBC
	.4byte 0x00000001
	.4byte lbl_8006CEBC
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte __read_console
	.4byte __write_console
	.4byte __close_console
	.4byte 0
	.4byte 0
	.4byte 0x10800000
	.4byte 0
.endobj lbl_8006CEBC

.obj lbl_8006CF04, local
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte lbl_8006CF04
	.4byte 0x00000001
	.4byte lbl_8006CF04
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte __read_console
	.4byte __write_console
	.4byte __close_console
	.4byte 0
	.4byte 0
	.4byte 0x10800000
	.4byte 0
.endobj lbl_8006CF04

.obj lbl_8006CF4C, local
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte lbl_8006CF4C
	.4byte 0x00000001
	.4byte lbl_8006CF4C
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte __read_console
	.4byte __write_console
	.4byte __close_console
	.4byte 0
.endobj lbl_8006CF4C
