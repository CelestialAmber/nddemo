#include "dolphin/base/PPCArch.h"


asm u32 PPCMfmsr(void){
    nofralloc
    mfmsr r3
    blr
}

asm void PPCMtmsr(u32){
    nofralloc
    mtmsr r3
    blr
}

asm u32 PPCMfhid0(void){
    nofralloc
    mfspr r3, 0x3f0
    blr
}

asm u32 PPCMfl2cr(void){
    nofralloc
    mfspr r3, 0x3f9
    blr
}

asm void PPCMtl2cr(u32){
    nofralloc
    mtspr 0x3f9, r3
    blr
}

asm void PPCMtdec(u32){
    nofralloc
    mtspr 0x16, r3
    blr
}

asm void PPCSync(void){
    nofralloc
    sc
    blr
}

asm void PPCHalt(void){
    nofralloc
    sync
halt_loop:
    nop
    li r3, 0
    nop
    b halt_loop
}

asm u32 PPCMfhid2(void){
    nofralloc
    mfspr r3, 0x398
    blr
}

asm void PPCMthid2(u32){
    nofralloc
    mtspr 0x398, r3
    blr
}

asm void PPCMtwpar(u32){
    nofralloc
    mtspr 0x399, r3
    blr
}
