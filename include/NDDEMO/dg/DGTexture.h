#pragma once

#include "types.h"

class DGTexture{
private:
    u16 m_ReferCount; //0x0
    u8 unk2[2]; //padding
    u8* m_TexImage; //0x4
    u16 m_Width; //0x8
    u16 m_Height; //0xA
    ? m_TexFormat; //0xC
    u8 m_MipLevel; //0x10
    u8 unk11[3]; //padding

public:
    GetMipLevel__9DGTextureFv
    GetFormat__9DGTextureFv
    GetHeight__9DGTextureFv
    GetWidth__9DGTextureFv
    GetImagePtr__9DGTextureFv
    DecRefer__9DGTextureFv
    IncRefer__9DGTextureFv
    LoadDTX__9DGTextureFPc

    __dt__9DGTextureFv
    __ct__9DGTextureFv
    __ct__9DGTextureFRC9DGTexture
};
