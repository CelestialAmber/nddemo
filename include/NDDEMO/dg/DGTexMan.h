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
    u8 unk12[2]; //padding

public:
    void EnableExpensiveMipMap(u8);
    void EnableMipMap(u8);
    u16 GetHeight(u16);
    u16 GetWidth(u16);
    u8 InitTexObj(GXTexObj*, u16, GXTexWrapMode, GXTexWrapMode);
    void DetachTexture(u16);
    u16 AttachTexture(u16);
    u16 LoadTexture(const char*);

    ~DGTexMan();
    DGTexMan(u16);
    DGTexMan();
    DGTexMan(const DGTexMan&);

    DGTexture* GetTexture(u16);

private:
    u16 GetTextureHandle(const char*);
    void DeleteTexture(u16);
    u16 AddTexture(const char*, DGTexture*);
};
