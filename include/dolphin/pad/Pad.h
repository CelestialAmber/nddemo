#ifndef DOLPHIN_PAD_H
#define DOLPHIN_PAD_H

struct PADStatus{
    u16 button; //0x0
    s8 stickX; //0x2
    s8 stickY; //0x3
    s8 substickX; //0x4
    s8 substickY; //0x5
    u8 triggerLeft; //0x6
    u8 triggerRight; //0x7
    u8 analogA; //0x8
    u8 analogB; //0x9
    s8 err; //0xA
    u8 unkB[5]; //padding?
};

#endif