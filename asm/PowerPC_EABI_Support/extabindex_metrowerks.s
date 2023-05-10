.include "macros.s"

.section extabindex_, "wa"  # 0x80005BC0 - 0x800065A0 ; 0x000009E0


lbl_8000655C:
    .4byte __destroy_arr
    .4byte 0x00000078
    .4byte lbl_80005B88

lbl_80006568:
    .4byte __construct_array
    .4byte 0x00000100
    .4byte lbl_80005B90

lbl_80006574:
    .4byte __dt__26__partial_array_destructorFv
    .4byte 0x000000B8
    .4byte lbl_80005BA8