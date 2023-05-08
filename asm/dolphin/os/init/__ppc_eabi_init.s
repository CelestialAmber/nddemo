.include "macros.s"

.section .init, "ax"  # 0x80003100 - 0x80005520 ; 0x00002420

.global _rom_copy_info
_rom_copy_info:
    .db 0x80003100
    .db 0x80003100
    .db 0x0000240C
    .db 0x80005520
    .db 0x80005520
    .db 0x00000690
    .db 0x80005BC0
    .db 0x80005BC0
    .db 0x000009E0
    .db 0x800065A0
    .db 0x800065A0
    .db 0x0005D740
    .db 0x80063CE0
    .db 0x80063CE0
    .db 0x00000010
    .db 0x80063D00
    .db 0x80063D00
    .db 0x00000010
    .db 0x80063D20
    .db 0x80063D20
    .db 0x000012E0
    .db 0x80065000
    .db 0x80065000
    .db 0x000081B8
    .db 0x800A8A80
    .db 0x800A8A80
    .db 0x00000321
    .db 0x800A9380
    .db 0x800A9380
    .db 0x00000818
    .db 0x00000000
    .db 0x00000000
    .db 0x00000000

.global _bss_init_info
_bss_init_info:
    .4byte 0x8006D1C0
    .4byte 0x0003B8C0
    .4byte 0x800A8DC0
    .4byte 0x000005B5
    .4byte 0x00000000
    .4byte 0x00000000
