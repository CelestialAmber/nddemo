#include "NDDEMO/dg/DGTexPro.h"
#include "NDDEMO/du/DUMacro.h"
#include "dolphin/MTX.h"
#include "dolphin/OS.h"


DGTexPro::DGTexPro(DGTexMan* TexMan, const char* szFileName){
	m_TexMan = TexMan;
	m_HTex = m_TexMan->LoadTexture(szFileName);

	if(m_HTex == 0xFFFF){
		OSReport("DGTexPro::DGTexPro>\n");
	}

	m_TexMan->AttachTexture(m_HTex);
	m_WrapS = GX_CLAMP;
	m_WrapT = GX_CLAMP;
	m_Camera = nullptr;
	m_DirectTexImage = nullptr;
	m_DirectTexWidth = 0;
	m_DirectTexHeight = 0;
	m_DirectTexFormat = GX_TF_RGBA8;
	m_DirectTexMipLevel = 0;
}

DGTexPro::DGTexPro(DGTexMan* TexMan){
	m_TexMan = TexMan;
	m_HTex = 0xFFFF;
	m_WrapS = GX_CLAMP;
	m_WrapT = GX_CLAMP;
	m_Camera = nullptr;
	m_DirectTexImage = nullptr;
	m_DirectTexWidth = 0;
	m_DirectTexHeight = 0;
	m_DirectTexFormat = GX_TF_RGBA8;
	m_DirectTexMipLevel = 0;
}

DGTexPro::~DGTexPro(){
	m_TexMan->DetachTexture(m_HTex);
}

void DGTexPro::SetCamera(DGCamera* camera){
	m_Camera = camera;
}

//https://decomp.me/scratch/r6ZGY
u8 DGTexPro::InitTexObj(GXTexObj* texobj){
	if(m_DirectTexImage != nullptr){
		u8 mipmap = false;
		if(m_DirectTexMipLevel != 0){
			mipmap = true;
		}

		GXInitTexObj(texobj, m_DirectTexImage, m_DirectTexWidth, m_DirectTexHeight, m_DirectTexFormat, m_WrapS, m_WrapT, mipmap);
		return ++mipmap - 1; //has to be a fakematch
	}else{
		return m_TexMan->InitTexObj(texobj, m_HTex, m_WrapS, m_WrapT);
	}
}

void DGTexPro::GetLightMtx(Mtx& LightMtx){
	if(m_Camera != nullptr){
		if(m_DirectTexImage == nullptr){
			m_Camera->GetLightMtx(LightMtx);
		}else{
			m_Camera->GetLightMtxYInverse(LightMtx);
		}
	}else{
		PSMTXIdentity(LightMtx);
	}
}

void DGTexPro::SetDirectTex(void* image, u16 width, u16 height, GXTexFmt fmt, u8 miplevel){
	m_DirectTexImage = image;
	m_DirectTexWidth = width;
	m_DirectTexHeight = height;
	m_DirectTexFormat = fmt;
	m_DirectTexMipLevel = miplevel;
}