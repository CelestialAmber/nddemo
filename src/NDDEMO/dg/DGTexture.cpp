#include "NDDEMO/dg/DGTexture.h"
#include "NDDEMO/du/DUDvd.h"
#include "NDDEMO/du/DUMacro.h"
#include "dolphin/OS.h"

DGTexture::DGTexture(){
	m_ReferCount = 0;
	m_TexImage = nullptr;
	m_Width = 0;
	m_Height = 0;
	m_TexFormat = GX_TF_RGB5A3;
	m_MipLevel = 0;
}

DGTexture::~DGTexture(){
	if(m_ReferCount > 0){
		OSReport("Error DGTexture::~DGTexture  ReferCount>0\n");
	}

	if(m_TexImage != nullptr){
		delete m_TexImage;
		m_TexImage = nullptr;
	}
}

u16 DGTexture::IncRefer(){
	return ++m_ReferCount;
}

u16 DGTexture::DecRefer(){
	if(m_ReferCount > 0){
		return --m_ReferCount;
	}else{
		OSReport("Error DGTexture::DecRefer  ReferCount<0\n");
		return 0;
	}
}

u8 DGTexture::LoadDTX(char* szFileName){
	if(m_TexImage != nullptr){
		delete m_TexImage;
		m_TexImage = nullptr;
	}

	DUDvd dvd;

	if(!(u8)dvd.Open(szFileName, DUD_OM_SEQUENTIAL_ALIGN)){
		OSReport("DGTexture::LoadDTX>dvd.Open\n");
		return false;
	}

	u8* header = (u8*)mAlloc(0x20);

	//Read the header data
	dvd.Read(header, 0x20, 0);

	if(header[0] != 0){
		OSReport("DGTexture::LoadDTX>DTX_VERSION\n");
		dvd.Close();

		if(header != nullptr){
			mFree(header);
		}

		return false;
	}

	//Parse the information from the header
	u32* ImageSize = (u32*)(header + 4);
	m_TexFormat = (GXTexFmt)header[1];
	m_Width = 1 << header[2];
	m_Height = 1 << header[3];
	m_MipLevel = header[8];

	//Read the image data
	m_TexImage = (u8*)mAlloc(*ImageSize);
	dvd.Read(m_TexImage, *ImageSize, 0);
	DCFlushRange(m_TexImage, *ImageSize);
	dvd.Close();

	if(header != nullptr){
		mFree(header);
	}

	return true;
}

void* DGTexture::GetImagePtr(){
	return m_TexImage;
}

u16 DGTexture::GetWidth(){
	return m_Width;
}

u16 DGTexture::GetHeight(){
	return m_Height;
}

GXTexFmt DGTexture::GetFormat(){
	return m_TexFormat;
}

u8 DGTexture::GetMipLevel(){
	return m_MipLevel;
}

