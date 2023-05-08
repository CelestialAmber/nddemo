.include "macros.s"

.section .sdata, "wa"  # 0x800A8A80 - 0x800A8DC0 ; 0x00000340


.global __OSCurrHeap
__OSCurrHeap:

	# ROM: 0x6A3D8
	.4byte 0xFFFFFFFF
	.4byte 0

__OSArenaLo:

	# ROM: 0x6A3E0
	.4byte 0xFFFFFFFF
	.4byte 0

lbl_800A8CA8:

	# ROM: 0x6A3E8
	.4byte 0x0A000000
	.4byte 0

Unit01:

	# ROM: 0x6A3F0
	.4byte 0
	.4byte 0x3F800000

FirstRead:

	# ROM: 0x6A3F8
	.4byte 0x00000001
	.4byte 0

lbl_800A8CC0:

	# ROM: 0x6A400
	.asciz "dvdfs.c"

autoInvalidation:

	# ROM: 0x6A408
	.4byte 0x00000001
	.4byte 0

lbl_800A8CD0:

	# ROM: 0x6A410
	.4byte 0x0A000000

lbl_800A8CD4:

	# ROM: 0x6A414
	.4byte 0x4F464600

lbl_800A8CD8:

	# ROM: 0x6A418
	.4byte 0x4F4E0000
	.4byte 0

ClampRegion:

	# ROM: 0x6A420
	.4byte 0x1EB40F48
	.4byte 0x280F3B1F

ResettingChan:

	# ROM: 0x6A428
	.4byte 0x00000020

XPatchBits:

	# ROM: 0x6A42C
	.4byte 0xF0000000

AnalogMode:

	# ROM: 0x6A430
	.4byte 0x00000300

Spec:

	# ROM: 0x6A434
	.4byte 0x00000005

MakeStatus:

	# ROM: 0x6A438
	.4byte SPEC2_MakeStatus

CmdReadOrigin:

	# ROM: 0x6A43C
	.4byte 0x41000000

CmdCalibrate:

	# ROM: 0x6A440
	.4byte 0x42000000

lbl_800A8D04:

	# ROM: 0x6A444
	.asciz "Pad.c"
	.balign 4
	.4byte 0

.global gx
gx:

	# ROM: 0x6A450
	.4byte gxData
	.4byte 0

"tbl1$214":

	# ROM: 0x6A458
	.4byte 0x00040102

"tbl2$215":

	# ROM: 0x6A45C
	.4byte 0x00080102

"tbl3$216":

	# ROM: 0x6A460
	.4byte 0x000C0102
	.4byte 0

.global GXTexMode0Ids
GXTexMode0Ids:

	# ROM: 0x6A468
	.4byte 0x80818283
	.4byte 0xA0A1A2A3

.global GXTexMode1Ids
GXTexMode1Ids:

	# ROM: 0x6A470
	.4byte 0x84858687
	.4byte 0xA4A5A6A7

.global GXTexImage0Ids
GXTexImage0Ids:

	# ROM: 0x6A478
	.4byte 0x88898A8B
	.4byte 0xA8A9AAAB

.global GXTexImage1Ids
GXTexImage1Ids:

	# ROM: 0x6A480
	.4byte 0x8C8D8E8F
	.4byte 0xACADAEAF

.global GXTexImage2Ids
GXTexImage2Ids:

	# ROM: 0x6A488
	.4byte 0x90919293
	.4byte 0xB0B1B2B3

.global GXTexImage3Ids
GXTexImage3Ids:

	# ROM: 0x6A490
	.4byte 0x94959697
	.4byte 0xB4B5B6B7

.global GXTexTlutIds
GXTexTlutIds:

	# ROM: 0x6A498
	.4byte 0x98999A9B
	.4byte 0xB8B9BABB

.global GX2HWFiltConv
GX2HWFiltConv:

	# ROM: 0x6A4A0
	.4byte 0x00040105
	.4byte 0x02060000