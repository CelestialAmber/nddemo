#ifndef NDDEMO_DGTEXTURE_H
#define NDDEMO_DGTEXTURE_H

#include "types.h"
#include "dolphin/GX.h"

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
	DGTexture(const DGTexture&);
	DGTexture();
	~DGTexture();

	u8 LoadDTX(char* szFileName);
	u16 IncRefer();
	u16 DecRefer();
	void* GetImagePtr();
	u16 GetWidth();
	u16 GetHeight();
	GXTexFmt GetFormat();
	u8 GetMipLevel();
};

#endif
