#ifndef NDDEMO_DGTEXMAN_H
#define NDDEMO_DGTEXMAN_H

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
    DGTexMan(const DGTexMan&);
    DGTexMan();
    DGTexMan(u16 MaxTextureNum);
    ~DGTexMan();

    DGTexture* GetTexture(u16 htex);
    u16 LoadTexture(const char* szFileName);
    u16 AttachTexture(u16 htex);
    void DetachTexture(u16 htex);
    u8 InitTexObj(GXTexObj* texobj, u16 htex, GXTexWrapMode wrapS, GXTexWrapMode wrapT);
    u16 GetWidth(u16 htex);
    u16 GetHeight(u16 htex);
    void EnableMipMap(u8 mip);
    void EnableExpensiveMipMap(u8 mip);

private:
    u16 AddTexture(const char* szFileName, DGTexture* Texture);
    void DeleteTexture(u16 htex);
    u16 GetTextureHandle(const char* szFileName);
};

#endif
