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
	DGTexPro(const DGTexPro&);
	DGTexPro(DGTexMan* TexMan);
	DGTexPro(DGTexMan* TexMan, const char* szFileName);
	~DGTexPro();

	void SetCamera(DGCamera* camera);
	u8 InitTexObj(GXTexObj* texobj);
	void GetLightMtx(Mtx& LightMtx);
	void SetDirectTex(void* image, u16 width, u16 height, GXTexFmt fmt, u8 miplevel);
};
