#pragma once

#include "types.h"
#include "dolphin/PAD.h"

class DTPad{
public:
    u32 ResetReq; //0x0
    u32 count; //0x4
    PADStatus prepad[3]; //0x8
    PADStatus pad[3]; //0x38
}
