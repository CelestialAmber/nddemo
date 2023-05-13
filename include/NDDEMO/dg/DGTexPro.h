#pragma once

#include "types.h"
#include "dolphin/GX.h"
#include "NDDEMO/dg/DGCamera.h"
#include "NDDEMO/dg/DGTexMan.h"


class DGTexPro{
private:
    DGTexMan* m_TexMan; //0x0
    u16 m_HTex; //0x4
    u8 unk5[2]; //padding
    GXTexWrapMode m_WrapS; //0x8
    GXTexWrapMode m_WrapT; //0xC
    DGCamera* m_Camera; //0x10
    void* m_DirectTexImage; //0x14
    u16 m_DirectTexWidth; //0x18
    u16 m_DirectTexHeight; //0x1A
    GXTexFmt m_DirectTexFormat; //0x1C
    u8 m_DirectTexMipLevel; //0x20
    u8 unk21[3]; //padding

public:
    SetDirectTex__8DGTexProFPvUsUs9_GXTexFmtUc
    GetLightMtx__8DGTexProFRA3_A4_f
    InitTexObj__8DGTexProFP9_GXTexObj
    SetCamera__8DGTexProFP8DGCamera

    __dt__8DGTexProFv
    __ct__8DGTexProFP8DGTexManPCc
    __ct__8DGTexProFP8DGTexMan
    __ct__8DGTexProFRC8DGTexPro
};
