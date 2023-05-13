#pragma once

#include "types.h"
#include "dolphin/GX.h"
#include "NDDEMO/dg/DGTexture.h"

class DGTexMan{
private:
    u16 m_MaxTextureNum; //0x0
    u16 m_TextureNum; //0x2
    u16 m_TexturePointer; //0x4
    u8 unk5[2]; //padding
    char* m_TexNameTable; //0x8
    DGTexture** m_TextureTable; //0xC
    u8 m_EnableMipMap; //0x10
    u8 m_EnableExpensiveMipMap; //0x11

public:
    EnableExpensiveMipMap__8DGTexManFUc
    EnableMipMap__8DGTexManFUc
    GetHeight__8DGTexManFUs
    GetWidth__8DGTexManFUs
    InitTexObj__8DGTexManFP9_GXTexObjUs14_GXTexWrapMode14_GXTexWrapMode
    DetachTexture__8DGTexManFUs
    AttachTexture__8DGTexManFUs
    LoadTexture__8DGTexManFPCc

    __dt__8DGTexManFv
    __ct__8DGTexManFUs
    __ct__8DGTexManFv
    __ct__8DGTexManFRC8DGTexMan

    GetTexture__8DGTexManFUs

private:
    GetTextureHandle__8DGTexManFPCc
    DeleteTexture__8DGTexManFUs
    AddTexture__8DGTexManFPCcP9DGTexture
};
