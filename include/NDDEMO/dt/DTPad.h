#pragma once

#include "types.h"
#include "dolphin/PAD.h"

class DTPad{
private:
    u32 ResetReq; //0x0
    u32 count; //0x4

protected:
    PADStatus prepad[3]; //0x8
    PADStatus pad[3]; //0x38

public:
    PADStatus* GetPADStatus(u8);
    int IsStickTrg(u16, u16);
    int IsPush(u16, u16);
    int IsTrp(u16, u16);
    int IsCnd(u16, u16);
    int IsTrg(u16, u16);
    s8 SubStickY(u16);
    s8 SubStickX(u16);
    s8 StickY(u16);
    s8 StickX(u16);
    void Read();

    ~DTPad();
    DTPad();
    DTPad(const DTPad&);
}
