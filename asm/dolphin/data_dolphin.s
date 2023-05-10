.include "macros.s"

.section .data, "wa"  # 0x80065000 - 0x8006D1C0 ; 0x000081C0


lbl_800674F0:
	.asciz "\nDolphin OS $Revision: 45 $.\n"
	.balign 4
	.asciz "Kernel built : %s %s\n"
	.balign 4
	.asciz "Sep  8 2001"
	.asciz "01:49:37"
	.balign 4
	.asciz "Console Type : "
	.asciz "Retail %d\n"
	.balign 4
	.asciz "Mac Emulator\n"
	.balign 4
	.asciz "PC Emulator\n"
	.balign 4
	.asciz "EPPC Arthur\n"
	.balign 4
	.asciz "EPPC Minnow\n"
	.balign 4
	.asciz "Development HW%d\n"
	.balign 4
	.asciz "Memory %d MB\n"
	.balign 4
	.asciz "Arena : 0x%x - 0x%x\n"
	.balign 4
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
	.asciz "Installing OSDBIntegrator\n"
	.balign 4
	.asciz ">>> OSINIT: exception %d commandeered by TRK\n"
	.balign 4
	.asciz ">>> OSINIT: exception %d vectored to debugger\n"
	.balign 4
	.asciz "Exceptions initialized...\n"
	.balign 4
	.4byte 0

lbl_800676B0:
	.asciz "OSCheckHeap: Failed HeapArray in %d"
	.asciz "OSCheckHeap: Failed 0 <= heap && heap < NumHeaps in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed 0 <= hd->size in %d"
	.asciz "OSCheckHeap: Failed hd->allocated == NULL || hd->allocated->prev == NULL in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed InRange(cell, ArenaStart, ArenaEnd) in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed OFFSET(cell, ALIGNMENT) == 0 in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed cell->next == NULL || cell->next->prev == cell in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed MINOBJSIZE <= cell->size in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed OFFSET(cell->size, ALIGNMENT) == 0 in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed 0 < total && total <= hd->size in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed hd->free == NULL || hd->free->prev == NULL in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed cell->next == NULL || (char*) cell + cell->size < (char*) cell->next in %d"
	.balign 4
	.asciz "OSCheckHeap: Failed total == hd->size in %d"
	.asciz "\nOSDumpHeap(%d):\n"
	.balign 4
	.asciz "--------Inactive\n"
	.balign 4
	.asciz "addr\tsize\t\tend\tprev\tnext\n"
	.balign 4
	.asciz "--------Allocated\n"
	.balign 4
	.asciz "%x\t%d\t%x\t%x\t%x\n"
	.asciz "--------Free\n"
	.balign 4
	.4byte 0

DSPInitCode:
	.4byte 0x029F0010
	.4byte 0x029F0035
	.4byte 0x029F0036
	.4byte 0x029F0037
	.4byte 0x029F0038
	.4byte 0x029F0039
	.4byte 0x029F003A
	.4byte 0x029F003B
	.4byte 0x12061203
	.4byte 0x12041205
	.4byte 0x8E000092
	.4byte 0x00FF0080
	.4byte 0x80000088
	.4byte 0xFFFF0084
	.4byte 0x10000064
	.4byte 0x00200218
	.4byte 0x00000080
	.4byte 0x10000088
	.4byte 0xFFFF0084
	.4byte 0x08000064
	.4byte 0x002A191E
	.4byte 0x000026FC
	.4byte 0x02A08000
	.4byte 0x029C002B
	.4byte 0x16FC0054
	.4byte 0x16FD4348
	.4byte 0x002102FF
	.4byte 0x02FF02FF
	.4byte 0x02FF02FF
	.4byte 0x02FF02FF
	.4byte 0
	.4byte 0

lbl_80067AC8:
	.asciz ">>> L2 INVALIDATE : SHOULD NEVER HAPPEN\n"
	.balign 4
	.asciz "Machine check received\n"
	.asciz "HID2 = 0x%x   SRR1 = 0x%x\n"
	.balign 4
	.asciz "Machine check was not DMA/locked cache related\n"
	.asciz "DMAErrorHandler(): An error occurred while processing DMA.\n"
	.asciz "The following errors have been detected and cleared :\n"
	.balign 4
	.asciz "\t- Requested a locked cache tag that was already in the cache\n"
	.balign 4
	.asciz "\t- DMA attempted to access normal cache\n"
	.balign 4
	.asciz "\t- DMA missed in data cache\n"
	.balign 4
	.asciz "\t- DMA queue overflowed\n"
	.balign 4
	.asciz "L1 i-caches initialized\n"
	.balign 4
	.asciz "L1 d-caches initialized\n"
	.balign 4
	.asciz "L2 cache initialized\n"
	.balign 4
	.asciz "Locked cache machine check handler installed\n"
	.balign 4
	.4byte 0

lbl_80067CF8:
	.asciz "------------------------- Context 0x%08x -------------------------\n"
	.asciz "r%-2d  = 0x%08x (%14d)  r%-2d  = 0x%08x (%14d)\n"
	.asciz "LR   = 0x%08x                   CR   = 0x%08x\n"
	.balign 4
	.asciz "SRR0 = 0x%08x                   SRR1 = 0x%08x\n"
	.balign 4
	.asciz "\nGQRs----------\n"
	.balign 4
	.asciz "gqr%d = 0x%08x \t gqr%d = 0x%08x\n"
	.balign 4
	.asciz "\n\nFPRs----------\n"
	.balign 4
	.asciz "fr%d \t= %d \t fr%d \t= %d\n"
	.balign 4
	.asciz "\n\nPSFs----------\n"
	.balign 4
	.asciz "ps%d \t= 0x%x \t ps%d \t= 0x%x\n"
	.balign 4
	.asciz "\nAddress:      Back Chain    LR Save\n"
	.balign 4
	.asciz "0x%08x:   0x%08x    0x%08x\n"

lbl_80067EAC:
	.asciz "FPU-unavailable handler installed\n"
	.balign 4

lbl_80067ED0:
	.asciz " in "%s" on line %d.\n"
	.balign 4
	.asciz "\nAddress:      Back Chain    LR Save\n"
	.balign 4
	.asciz "0x%08x:   0x%08x    0x%08x\n"
	.asciz "Non-recoverable Exception %d"
	.balign 4
	.asciz "Unhandled Exception %d"
	.balign 4
	.asciz "\nDSISR= 0x%08x                   DAR  = 0x%08x\n"
	.asciz "\nInstruction at 0x%x (read from SRR0) attempted to access invalid address 0x%x (read from DAR)\n"
	.asciz "\nAttempted to fetch instruction from invalid address 0x%x (read from SRR0)\n"
	.asciz "\nInstruction at 0x%x (read from SRR0) attempted to access unaligned address 0x%x (read from DAR)\n"
	.balign 4
	.asciz "\nProgram exception : Possible illegal instruction/operation at or around 0x%x (read from SRR0)\n"
	.4byte 0

InterruptPrioTable:
	.4byte 0x00000100
	.4byte 0x00000040
	.4byte 0xF8000000
	.4byte 0x00000200
	.4byte 0x00000080
	.4byte 0x00003000
	.4byte 0x00000020
	.4byte 0x03FF8C00
	.4byte 0x04000000
	.4byte 0x00004000
	.4byte 0xFFFFFFFF
	.4byte 0

ResetFunctionInfo:
	.4byte OnReset
	.4byte 0x0000007F
	.4byte 0
	.4byte 0

Si:
	.4byte 0xFFFFFFFF
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0

Type:
	.4byte 0x00000008
	.4byte 0x00000008
	.4byte 0x00000008
	.4byte 0x00000008
	.asciz "No response"
	.asciz "N64 controller"
	.balign 4
	.asciz "N64 microphone"
	.balign 4
	.asciz "N64 keyboard"
	.balign 4
	.asciz "N64 mouse"
	.balign 4
	.asciz "GameBoy Advance"
	.asciz "Standard controller"
	.asciz "Wireless receiver"
	.balign 4
	.asciz "WaveBird controller"

lbl_80068200:
	.asciz "DBExceptionDestination\n"

lbl_80068218:
	.asciz "DVDConvertEntrynumToPath(possibly DVDOpen or DVDChangeDir or DVDOpenDir): specified directory or file (%s) doesn't match standard 8.3 format. This is a temporary restriction and will be removed soon\n"

lbl_800682E0:
	.asciz "Warning: DVDOpen(): file '%s' was not found under %s.\n"
	.balign 4

lbl_80068318:
	.asciz "DVDRead(): specified area is out of the file  "
	.balign 4

lbl_80068348:
	.asciz "app booted via JTAG\n"
	.balign 4
	.asciz "load fst\n"
	.balign 4
	.asciz "app booted from bootrom\n"
	.balign 4
	.asciz "bootrom\n"
	.balign 4

lbl_80068394:
	.4byte .L_80032A20
	.4byte .L_800328E0
	.4byte .L_800328F8
	.4byte .L_80032910
	.4byte .L_80032940
	.4byte .L_80032A04
	.4byte .L_80032958
	.4byte .L_80032928

lbl_800683B4:
	.4byte .L_80032D00
	.4byte .L_80032ABC
	.4byte .L_80032B18
	.4byte .L_80032B3C
	.4byte .L_80032ABC
	.4byte .L_80032A90
	.4byte .L_80032B5C
	.4byte .L_80032BC0
	.4byte .L_80032BEC
	.4byte .L_80032C20
	.4byte .L_80032C44
	.4byte .L_80032C68
	.4byte .L_80032C8C
	.4byte .L_80032CB0
	.4byte .L_80032CD8
	.4byte .L_80032B4C

lbl_800683F4:
	.4byte .L_800336B4
	.4byte .L_800336B4
	.4byte .L_800336D4
	.4byte .L_80033718
	.4byte .L_80033764
	.4byte .L_800337E0
	.4byte .L_800337E0
	.4byte .L_800337E0
	.4byte .L_800337E0
	.4byte .L_800338AC
	.4byte .L_800338AC
	.4byte .L_800336B4
	.4byte .L_800337E0

lbl_80068428:
	.4byte .L_80033A44
	.4byte .L_80033A4C
	.4byte .L_80033A3C
	.4byte .L_80033A3C
	.4byte .L_80033A44
	.4byte .L_80033A44
	.4byte .L_80033A44
	.4byte .L_80033A44
	.4byte .L_80033A44
	.4byte .L_80033A4C
	.4byte .L_80033A3C
	.4byte .L_80033A3C
	.4byte .L_80033A44
	.4byte 0

ErrorTable:
	.4byte 0
	.4byte 0x00023A00
	.4byte 0x00062800
	.4byte 0x00030200
	.4byte 0x00031100
	.4byte 0x00052000
	.4byte 0x00052001
	.4byte 0x00052100
	.4byte 0x00052400
	.4byte 0x00052401
	.4byte 0x00052402
	.4byte 0x000B5A01
	.4byte 0x00056300
	.4byte 0x00020401
	.4byte 0x00020400
	.4byte 0x00040800

lbl_800684A0:
	.asciz "  Game Name ... %c%c%c%c\n"
	.balign 4
	.asciz "  Company ..... %c%c\n"
	.balign 4
	.asciz "  Disk # ...... %d\n"
	.asciz "  Game ver .... %d\n"
	.asciz "  Streaming ... %s\n"

timing:
	.4byte 0x060000F0
	.4byte 0x00180019
	.4byte 0x00030002
	.4byte 0x0C0D0C0D
	.4byte 0x02080207
	.4byte 0x02080207
	.4byte 0x020D01AD
	.4byte 0x404769A2
	.4byte 0x01757A00
	.4byte 0x019C0600
	.4byte 0x00F00018
	.4byte 0x00180004
	.4byte 0x00040C0C
	.4byte 0x0C0C0208
	.4byte 0x02080208
	.4byte 0x0208020E
	.4byte 0x01AD4047
	.4byte 0x69A20175
	.4byte 0x7A00019C
	.4byte 0x0500011F
	.4byte 0x00230024
	.4byte 0x00010000
	.4byte 0x0D0C0B0A
	.4byte 0x026B026A
	.4byte 0x0269026C
	.4byte 0x027101B0
	.4byte 0x404B6AAC
	.4byte 0x017C8500
	.4byte 0x01A40500
	.4byte 0x011F0023
	.4byte 0x00230002
	.4byte 0x00020D0B
	.4byte 0x0D0B026B
	.4byte 0x026D026B
	.4byte 0x026D0272
	.4byte 0x01B0404B
	.4byte 0x6AAC017C
	.4byte 0x850001A4
	.4byte 0x060000F0
	.4byte 0x00180019
	.4byte 0x00030002
	.4byte 0x100F0E0D
	.4byte 0x02060205
	.4byte 0x02040207
	.4byte 0x020D01AD
	.4byte 0x404E70A2
	.4byte 0x01757A00
	.4byte 0x019C0600
	.4byte 0x00F00018
	.4byte 0x00180004
	.4byte 0x0004100E
	.4byte 0x100E0206
	.4byte 0x02080206
	.4byte 0x0208020E
	.4byte 0x01AD404E
	.4byte 0x70A20175
	.4byte 0x7A00019C
	.4byte 0x0C0001E0
	.4byte 0x00300030
	.4byte 0x00060006
	.4byte 0x18181818
	.4byte 0x040E040E
	.4byte 0x040E040E
	.4byte 0x041A01AD
	.4byte 0x404769A2
	.4byte 0x01757A00
	.4byte 0x019C0000
	.4byte 0x01F001DC
	.4byte 0x01AE0174
	.4byte 0x012900DB
	.4byte 0x008E0046
	.4byte 0x000C00E2
	.4byte 0x00CB00C0
	.4byte 0x00C400CF
	.4byte 0x00DE00EC
	.4byte 0x00FC0008
	.4byte 0x000F0013
	.4byte 0x0013000F
	.4byte 0x000C0008
	.4byte 0x00010000

lbl_80068650:
	.4byte .L_80034374
	.4byte .L_8003437C
	.4byte .L_800343A4
	.4byte .L_800343AC
	.4byte .L_80034384
	.4byte .L_8003438C
	.4byte .L_800343AC
	.4byte .L_800343AC
	.4byte .L_80034394
	.4byte .L_8003439C

ResetFunctionInfo:
	.4byte OnReset
	.4byte 0x0000007F
	.4byte 0
	.4byte 0
	.4byte 0xF7020E13
	.4byte 0x1D092507
	.4byte 0x34054104
	.4byte 0x57035703
	.4byte 0x57038302
	.4byte 0x83028302
	.4byte 0x94030D18
	.4byte 0x1A0C2708
	.4byte 0x34063E05
	.4byte 0x4E046803
	.4byte 0x68036803
	.4byte 0x68039C02
	.asciz "PADSetSamplingRate: unknown TV format"
	.balign 4

lbl_800686E0:
	.asciz "DSPInit(): Build Date: %s %s\n"
	.balign 4
	.asciz "Sep  8 2001"
	.asciz "01:51:48"
	.balign 4

lbl_80068718:
	.asciz "DSP is booting task: 0x%08X\n"
	.balign 4
	.asciz "__DSP_boot_task()  : IRAM MMEM ADDR: 0x%08X\n"
	.balign 4
	.asciz "__DSP_boot_task()  : IRAM DSP ADDR : 0x%08X\n"
	.balign 4
	.asciz "__DSP_boot_task()  : IRAM LENGTH   : 0x%08X\n"
	.balign 4
	.asciz "__DSP_boot_task()  : DRAM MMEM ADDR: 0x%08X\n"
	.balign 4
	.asciz "__DSP_boot_task()  : Start Vector  : 0x%08X\n"
	.balign 4
	.asciz "__DSP_add_task() : Added task    : 0x%08X\n"
	.balign 4
	.4byte 0

lbl_80068858:
	.4byte .L_8003B5D4
	.4byte .L_8003B5EC
	.4byte .L_8003B60C
	.4byte .L_8003B62C
	.4byte .L_8003B64C
	.4byte .L_8003B66C
	.4byte .L_8003B68C
	.4byte .L_8003B6AC
	.4byte .L_8003B6CC
	.4byte .L_8003B6EC
	.4byte .L_8003B70C
	.4byte .L_8003B784
	.4byte .L_8003B7A4
	.4byte .L_8003B7C4
	.4byte .L_8003B7DC
	.4byte .L_8003B7FC
	.4byte .L_8003B81C
	.4byte .L_8003B83C
	.4byte .L_8003B85C
	.4byte .L_8003B87C
	.4byte .L_8003B89C
	.4byte .L_8003B8B8
	.4byte .L_8003B8B8
	.4byte .L_8003B8B8
	.4byte .L_8003B8B8
	.4byte .L_8003B748

lbl_800688C0:
	.4byte .L_8003B940
	.4byte .L_8003B95C
	.4byte .L_8003B97C
	.4byte .L_8003B99C
	.4byte .L_8003B9BC
	.4byte .L_8003B9DC
	.4byte .L_8003B9FC
	.4byte .L_8003BA1C
	.4byte .L_8003BA3C
	.4byte .L_8003BA5C
	.4byte .L_8003BA7C
	.4byte .L_8003BAF4
	.4byte .L_8003BB14
	.4byte .L_8003BB34
	.4byte .L_8003BB50
	.4byte .L_8003BB70
	.4byte .L_8003BB90
	.4byte .L_8003BBB0
	.4byte .L_8003BBD0
	.4byte .L_8003BBF0
	.4byte .L_8003BC10
	.4byte .L_8003BC2C
	.4byte .L_8003BC2C
	.4byte .L_8003BC2C
	.4byte .L_8003BC2C
	.4byte .L_8003BAB8

lbl_80068928:
	.4byte .L_8003BE20
	.4byte .L_8003BE30
	.4byte .L_8003BE40
	.4byte .L_8003BE50
	.4byte .L_8003BE60
	.4byte .L_8003BE70
	.4byte .L_8003BE80
	.4byte .L_8003BE90
	.4byte .L_8003BEA0
	.4byte .L_8003BEB0
	.4byte .L_8003BEC0
	.4byte .L_8003BF08
	.4byte .L_8003BF18
	.4byte .L_8003BF28
	.4byte .L_8003BF38
	.4byte .L_8003BF48
	.4byte .L_8003BF58
	.4byte .L_8003BF68
	.4byte .L_8003BF78
	.4byte .L_8003BF88
	.4byte .L_8003BF98
	.4byte .L_8003BFA8
	.4byte .L_8003BFA8
	.4byte .L_8003BFA8
	.4byte .L_8003BFA8
	.4byte .L_8003BEE4

lbl_80068990:
	.4byte .L_8003C0AC
	.4byte .L_8003C0E8
	.4byte .L_8003C14C
	.4byte .L_8003C178
	.4byte .L_8003C1A4
	.4byte .L_8003C1E4
	.4byte .L_8003C220
	.4byte .L_8003C260
	.4byte .L_8003C2A0
	.4byte .L_8003C2E0
	.4byte .L_8003C320
	.4byte .L_8003C360
	.4byte .L_8003C398
	.4byte .L_8003C398
	.4byte .L_8003C398
	.4byte .L_8003C398
	.4byte .L_8003C0E8

lbl_800689D4:
	.4byte .L_8003C6C8
	.4byte .L_8003C6E8
	.4byte .L_8003C708
	.4byte .L_8003C728
	.4byte .L_8003C748
	.4byte .L_8003C760
	.4byte .L_8003C780

lbl_800689F0:
	.4byte .L_8003C53C
	.4byte .L_8003C548
	.4byte .L_8003C554
	.4byte .L_8003C560
	.4byte .L_8003C57C
	.4byte .L_8003C584
	.4byte .L_8003C58C
	.4byte .L_8003C594
	.4byte .L_8003C59C
	.4byte .L_8003C5A4
	.4byte .L_8003C5AC
	.4byte .L_8003C5B4
	.4byte .L_8003C5B8
	.4byte .L_8003C5B8
	.4byte .L_8003C5B8
	.4byte .L_8003C5B8
	.4byte .L_8003C5B8
	.4byte .L_8003C5B8
	.4byte .L_8003C5B8
	.4byte .L_8003C56C
	.4byte .L_8003C574
	.4byte 0

.global GXNtsc240Ds
GXNtsc240Ds:
	.4byte 0x00000001
	.4byte 0x028000F0
	.4byte 0x00F00028
	.4byte 0x00000280
	.4byte 0x01E00000
	.4byte 0
	.4byte 0x00000606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060000
	.4byte 0x15161500
	.4byte 0

.global GXNtsc240DsAa
GXNtsc240DsAa:
	.4byte 0x00000001
	.4byte 0x028000F0
	.4byte 0x00F00028
	.4byte 0x00000280
	.4byte 0x01E00000
	.4byte 0
	.4byte 0x00010302
	.4byte 0x0906030A
	.4byte 0x03020906
	.4byte 0x030A0902
	.4byte 0x0306090A
	.4byte 0x09020306
	.4byte 0x090A0000
	.4byte 0x15161500
	.4byte 0

.global GXNtsc240Int
GXNtsc240Int:
	.4byte 0
	.4byte 0x028000F0
	.4byte 0x00F00028
	.4byte 0x00000280
	.4byte 0x01E00000
	.4byte 0
	.4byte 0x01000606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060000
	.4byte 0x15161500
	.4byte 0

.global GXNtsc240IntAa
GXNtsc240IntAa:
	.4byte 0
	.4byte 0x028000F0
	.4byte 0x00F00028
	.4byte 0x00000280
	.4byte 0x01E00000
	.4byte 0
	.4byte 0x01010302
	.4byte 0x0906030A
	.4byte 0x03020906
	.4byte 0x030A0902
	.4byte 0x0306090A
	.4byte 0x09020306
	.4byte 0x090A0000
	.4byte 0x15161500
	.4byte 0

.global GXNtsc480IntDf
GXNtsc480IntDf:
	.4byte 0
	.4byte 0x028001E0
	.4byte 0x01E00028
	.4byte 0x00000280
	.4byte 0x01E00000
	.4byte 0x00000001
	.4byte 0x00000606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060808
	.4byte 0x0A0C0A08
	.4byte 0x08000000

.global GXNtsc480Int
GXNtsc480Int:
	.4byte 0
	.4byte 0x028001E0
	.4byte 0x01E00028
	.4byte 0x00000280
	.4byte 0x01E00000
	.4byte 0x00000001
	.4byte 0x00000606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060000
	.4byte 0x15161500
	.4byte 0

.global GXNtsc480IntAa
GXNtsc480IntAa:
	.4byte 0
	.4byte 0x028000F2
	.4byte 0x01E00028
	.4byte 0x00000280
	.4byte 0x01E00000
	.4byte 0x00000001
	.4byte 0x00010302
	.4byte 0x0906030A
	.4byte 0x03020906
	.4byte 0x030A0902
	.4byte 0x0306090A
	.4byte 0x09020306
	.4byte 0x090A0408
	.4byte 0x0C100C08
	.4byte 0x04000000

.global GXNtsc480Prog
GXNtsc480Prog:
	.4byte 0x00000002
	.4byte 0x028001E0
	.4byte 0x01E00028
	.4byte 0x00000280
	.4byte 0x01E00000
	.4byte 0
	.4byte 0x00000606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060000
	.4byte 0x15161500
	.4byte 0

.global GXNtsc480ProgAa
GXNtsc480ProgAa:
	.4byte 0x00000002
	.4byte 0x028000F2
	.4byte 0x01E00028
	.4byte 0x00000280
	.4byte 0x01E00000
	.4byte 0
	.4byte 0x00010302
	.4byte 0x0906030A
	.4byte 0x03020906
	.4byte 0x030A0902
	.4byte 0x0306090A
	.4byte 0x09020306
	.4byte 0x090A0408
	.4byte 0x0C100C08
	.4byte 0x04000000

.global GXMpal480IntDf
GXMpal480IntDf:
	.4byte 0x00000008
	.4byte 0x028001E0
	.4byte 0x01E00028
	.4byte 0x00000280
	.4byte 0x01E00000
	.4byte 0x00000001
	.4byte 0x00000606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060808
	.4byte 0x0A0C0A08
	.4byte 0x08000000

.global GXPal528IntDf
GXPal528IntDf:
	.4byte 0x00000004
	.4byte 0x02800210
	.4byte 0x02100028
	.4byte 0x00170280
	.4byte 0x02100000
	.4byte 0x00000001
	.4byte 0x00000606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060606
	.4byte 0x06060808
	.4byte 0x0A0C0A08
	.4byte 0x08000000
	.4byte 0

lbl_80068CE0:
	.4byte .L_8003E3EC
	.4byte .L_8003E3F8
	.4byte .L_8003E3F8
	.4byte .L_8003E404
	.4byte .L_8003E404
	.4byte .L_8003E404
	.4byte .L_8003E404
	.4byte .L_8003E410
	.4byte .L_8003E3EC
	.4byte .L_8003E3F8
	.4byte .L_8003E404
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E3EC
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E3F8
	.4byte .L_8003E410
	.4byte .L_8003E404
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E404
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E3EC
	.4byte .L_8003E410
	.4byte .L_8003E3F8
	.4byte .L_8003E404
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E3F8
	.4byte .L_8003E3F8
	.4byte .L_8003E3F8
	.4byte .L_8003E3F8
	.4byte .L_8003E404
	.4byte .L_8003E404
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E3EC
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E410
	.4byte .L_8003E3F8
	.4byte .L_8003E3F8
	.4byte .L_8003E410
	.4byte .L_8003E404

lbl_80068DD4:
	.4byte .L_8003E540
	.4byte .L_8003E54C
	.4byte .L_8003E54C
	.4byte .L_8003E558
	.4byte .L_8003E558
	.4byte .L_8003E558
	.4byte .L_8003E558
	.4byte .L_8003E564
	.4byte .L_8003E540
	.4byte .L_8003E54C
	.4byte .L_8003E558
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E540
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E54C
	.4byte .L_8003E564
	.4byte .L_8003E558
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E558
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E540
	.4byte .L_8003E564
	.4byte .L_8003E54C
	.4byte .L_8003E558
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E54C
	.4byte .L_8003E54C
	.4byte .L_8003E54C
	.4byte .L_8003E54C
	.4byte .L_8003E558
	.4byte .L_8003E558
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E540
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E564
	.4byte .L_8003E54C
	.4byte .L_8003E54C
	.4byte .L_8003E564
	.4byte .L_8003E558

lbl_80068EC8:
	.4byte .L_8003E790
	.4byte .L_8003E7A4
	.4byte .L_8003E7A4
	.4byte .L_8003E7B8
	.4byte .L_8003E7B8
	.4byte .L_8003E7B8
	.4byte .L_8003E7CC
	.4byte .L_8003E7F4
	.4byte .L_8003E790
	.4byte .L_8003E7A4
	.4byte .L_8003E7B8
	.4byte .L_8003E7F4
	.4byte .L_8003E7F4
	.4byte .L_8003E7F4
	.4byte .L_8003E7E0
	.4byte 0

"c2r$71":
	.4byte 0
	.4byte 0x00000001
	.4byte 0
	.4byte 0x00000001
	.4byte 0
	.4byte 0x00000001
	.4byte 0x00000007
	.4byte 0x00000005
	.4byte 0x00000006
	.4byte 0

"p2f$194":
	.4byte 0
	.4byte 0x00000001
	.4byte 0x00000002
	.4byte 0x00000003
	.4byte 0x00000004
	.4byte 0x00000004
	.4byte 0x00000004
	.4byte 0x00000005

lbl_80068F50:
	.4byte .L_8004152C
	.4byte .L_80041548
	.4byte .L_80041564
	.4byte .L_80041580
	.4byte .L_8004159C
	.4byte .L_800415B8
	.4byte .L_800415D4
	.4byte .L_800415F0
	.4byte .L_8004160C
	.4byte .L_80041628
	.4byte .L_80041660
	.4byte .L_80041698
	.4byte .L_800416D0
	.4byte .L_80041708
	.4byte .L_80041740
	.4byte .L_80041778
	.4byte .L_800417B0
	.4byte .L_800417E8
	.4byte .L_800417F8
	.4byte .L_80041808
	.4byte .L_80041818
	.4byte .L_80041828
	.4byte .L_80041840

lbl_80068FAC:
	.4byte .L_800410FC
	.4byte .L_8004111C
	.4byte .L_8004113C
	.4byte .L_8004115C
	.4byte .L_8004117C
	.4byte .L_8004119C
	.4byte .L_800411BC
	.4byte .L_800411DC
	.4byte .L_800411FC
	.4byte .L_8004121C
	.4byte .L_80041258
	.4byte .L_8004123C
	.4byte .L_80041278
	.4byte .L_80041294
	.4byte .L_800412B0
	.4byte .L_800412CC
	.4byte .L_800412E8
	.4byte .L_80041304
	.4byte .L_80041320
	.4byte .L_8004133C
	.4byte .L_80041358
	.4byte .L_80041374
	.4byte .L_80041390
	.4byte .L_800413AC
	.4byte .L_800413C8
	.4byte .L_800413E4
	.4byte .L_80041400
	.4byte .L_8004141C
	.4byte .L_80041438
	.4byte .L_80041454
	.4byte .L_80041470
	.4byte .L_8004148C
	.4byte .L_800414A8
	.4byte .L_800414C4
	.4byte .L_800414E0
	.4byte .L_800414FC

lbl_8006903C:
	.4byte .L_80041914
	.4byte .L_8004196C
	.4byte .L_8004196C
	.4byte .L_8004196C
	.4byte .L_80041920
	.4byte .L_80041930
	.4byte .L_80041944
	.4byte .L_80041958
	.4byte .L_8004196C
	.4byte .L_8004196C
	.4byte .L_8004196C
	.4byte .L_8004196C
	.4byte .L_8004196C
	.4byte .L_8004196C
	.4byte .L_8004196C
	.4byte .L_8004196C
	.4byte .L_8004196C
	.4byte .L_80041974
	.4byte .L_80041974
	.4byte .L_80041974
	.4byte .L_80041974
	.4byte .L_8004196C
	.4byte .L_8004197C
	