.include "macros.s"

.section .sdata, "wa"  # 0x800A8A80 - 0x800A8DC0 ; 0x00000340


.global __OSCurrHeap
__OSCurrHeap:
	.4byte 0xFFFFFFFF
	.4byte 0

__OSArenaLo:
	.4byte 0xFFFFFFFF
	.4byte 0

lbl_800A8CA8:
	.4byte 0x0A000000
	.4byte 0

Unit01:
	.4byte 0
	.4byte 0x3F800000

FirstRead:
	.4byte 0x00000001
	.4byte 0

lbl_800A8CC0:
	.asciz "dvdfs.c"

autoInvalidation:
	.4byte 0x00000001
	.4byte 0

lbl_800A8CD0:
	.4byte 0x0A000000

lbl_800A8CD4:
	.4byte 0x4F464600

lbl_800A8CD8:
	.4byte 0x4F4E0000
	.4byte 0

ClampRegion:
	.4byte 0x1EB40F48
	.4byte 0x280F3B1F

ResettingChan:
	.4byte 0x00000020

XPatchBits:
	.4byte 0xF0000000

AnalogMode:
	.4byte 0x00000300

Spec:
	.4byte 0x00000005

MakeStatus:
	.4byte SPEC2_MakeStatus

CmdReadOrigin:
	.4byte 0x41000000

CmdCalibrate:
	.4byte 0x42000000

lbl_800A8D04:
	.asciz "Pad.c"
	.balign 4
	.4byte 0

.global gx
gx:
	.4byte gxData
	.4byte 0

"tbl1$214":
	.4byte 0x00040102

"tbl2$215":
	.4byte 0x00080102

"tbl3$216":
	.4byte 0x000C0102
	.4byte 0

.global GXTexMode0Ids
GXTexMode0Ids:
	.4byte 0x80818283
	.4byte 0xA0A1A2A3

.global GXTexMode1Ids
GXTexMode1Ids:
	.4byte 0x84858687
	.4byte 0xA4A5A6A7

.global GXTexImage0Ids
GXTexImage0Ids:
	.4byte 0x88898A8B
	.4byte 0xA8A9AAAB

.global GXTexImage1Ids
GXTexImage1Ids:
	.4byte 0x8C8D8E8F
	.4byte 0xACADAEAF

.global GXTexImage2Ids
GXTexImage2Ids:
	.4byte 0x90919293
	.4byte 0xB0B1B2B3

.global GXTexImage3Ids
GXTexImage3Ids:
	.4byte 0x94959697
	.4byte 0xB4B5B6B7

.global GXTexTlutIds
GXTexTlutIds:
	.4byte 0x98999A9B
	.4byte 0xB8B9BABB

.global GX2HWFiltConv
GX2HWFiltConv:
	.4byte 0x00040105
	.4byte 0x02060000