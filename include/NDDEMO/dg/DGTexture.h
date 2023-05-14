#pragma once

#include "types.h"

class DGTexture{
private:
    u16 m_ReferCount; //0x0
    u8 unk2[2]; //padding
    u8* m_TexImage; //0x4
    u16 m_Width; //0x8
    u16 m_Height; //0xA
    GXTexFmt m_TexFormat; //0xC
    u8 m_MipLevel; //0x10
    u8 unk11[3]; //padding

public:
    u8 GetMipLevel();
    GXTexFmt GetFormat();
    u16 GetHeight();
    u16 GetWidth();
    void* GetImagePtr();
    u16 DecRefer();
    u16 IncRefer();
    u8 LoadDTX(char*);

    ~DGTexture();
    DGTexture();
    DGTexture(const DGTexture&);
};
