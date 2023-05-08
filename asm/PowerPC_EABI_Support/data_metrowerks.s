.include "macros.s"

.section .data, "wa"  # 0x80065000 - 0x8006D1C0 ; 0x000081C0


.global gTRKDispatchTable
gTRKDispatchTable:

	# ROM: 0x69D60
	.4byte TRKDoUnsupported
	.4byte TRKDoConnect
	.4byte TRKDoDisconnect
	.4byte TRKDoReset
	.4byte TRKDoVersions
	.4byte TRKDoSupportMask
	.4byte TRKDoCPUType
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoReadMemory
	.4byte TRKDoWriteMemory
	.4byte TRKDoReadRegisters
	.4byte TRKDoWriteRegisters
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoFlushCache
	.4byte TRKDoUnsupported
	.4byte TRKDoContinue
	.4byte TRKDoStep
	.4byte TRKDoStop
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte TRKDoUnsupported
	.4byte 0
	.4byte 0

.global lbl_8006CDE8
lbl_8006CDE8:

	# ROM: 0x69DE8
	.4byte lbl_8005BFB8
	.4byte lbl_8005BFD8
	.4byte lbl_8005BFB0
	.4byte lbl_8005BFD8
	.4byte lbl_8005BFC0
	.4byte lbl_8005BFC8
	.4byte lbl_8005BFD0

.global lbl_8006CE04
lbl_8006CE04:

	# ROM: 0x69E04
	.4byte lbl_8005C1B4
	.4byte lbl_8005C1D4
	.4byte lbl_8005C1AC
	.4byte lbl_8005C1D4
	.4byte lbl_8005C1BC
	.4byte lbl_8005C1C4
	.4byte lbl_8005C1CC

.global gTRKRestoreFlags
gTRKRestoreFlags:

	# ROM: 0x69E20
	.4byte 0
	.4byte 0
	.4byte 0

.global gTRKExceptionStatus
gTRKExceptionStatus:

	# ROM: 0x69E2C
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0x01000000

.global gTRKStepStatus
gTRKStepStatus:

	# ROM: 0x69E3C
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0

.global TRK_ISR_OFFSETS
TRK_ISR_OFFSETS:

	# ROM: 0x69E50
	.4byte 0x00000100
	.4byte 0x00000200
	.4byte 0x00000300
	.4byte 0x00000400
	.4byte 0x00000500
	.4byte 0x00000600
	.4byte 0x00000700
	.4byte 0x00000800
	.4byte 0x00000900
	.4byte 0x00000C00
	.4byte 0x00000D00
	.4byte 0x00000F00
	.4byte 0x00001300
	.4byte 0x00001400
	.4byte 0x00001700
	.4byte 0

.global gDBCommTable
gDBCommTable:

	# ROM: 0x69E90
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0

.global __files
__files:

	# ROM: 0x69EB0
	.4byte 0
	.4byte 0x08800000
	.4byte 0

.global lbl_8006CEBC
lbl_8006CEBC:

	# ROM: 0x69EBC
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

.global lbl_8006CF04
lbl_8006CF04:

	# ROM: 0x69F04
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

.global lbl_8006CF4C
lbl_8006CF4C:

	# ROM: 0x69F4C
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

.global lbl_8006CF88
lbl_8006CF88:

	# ROM: 0x69F88
	.4byte lbl_800617A4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_80061744
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_80061744
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_8006177C
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_80061790
	.4byte lbl_800617B4
	.4byte lbl_800617B4
	.4byte lbl_800617A4

.global lbl_8006D00C
lbl_8006D00C:

	# ROM: 0x6A00C
	.4byte lbl_80061A34
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_800619FC
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_800619FC
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A14
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A24
	.4byte lbl_80061A40
	.4byte lbl_80061A40
	.4byte lbl_80061A34

.global lbl_8006D090
lbl_8006D090:

	# ROM: 0x6A090
	.4byte lbl_80061F60
	.4byte lbl_80062040
	.4byte lbl_80061F4C
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80061ECC
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80061FC4
	.4byte lbl_80061ECC
	.4byte lbl_80061F60
	.4byte lbl_80061F14
	.4byte lbl_80061F4C
	.4byte lbl_80062040
	.4byte lbl_80061ECC
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80062028
	.4byte lbl_80061ECC
	.4byte lbl_80061FA0
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80061FFC
	.4byte lbl_80062040
	.4byte lbl_80061ECC
	.4byte lbl_80062040
	.4byte lbl_80062040
	.4byte lbl_80061ECC

.global lbl_8006D160
lbl_8006D160:

	# ROM: 0x6A160
	.4byte lbl_80061C74
	.4byte lbl_80061CB0
	.4byte lbl_80061CB0
	.4byte lbl_80061C8C
	.4byte lbl_80061CB0
	.4byte lbl_80061CB0
	.4byte lbl_80061CB0
	.4byte lbl_80061CB0
	.4byte lbl_80061CB0
	.4byte lbl_80061CB0
	.4byte lbl_80061CB0
	.4byte lbl_80061C68
	.4byte lbl_80061CB0
	.4byte lbl_80061C5C
	.4byte lbl_80061CB0
	.4byte lbl_80061CB0
	.4byte lbl_80061C98
	.4byte 0

.global __four_over_pi_m1
__four_over_pi_m1:

	# ROM: 0x6A1A8
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
