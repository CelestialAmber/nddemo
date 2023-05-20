#ifndef NDDEMO_DGMODELMAN_H
#define NDDEMO_DGMODELMAN_H

#include "types.h"
#include "NDDEMO/dg/DGObjMan.h"
#include "NDDEMO/dg/DGTexMan.h"
#include "NDDEMO/dg/DGTexPro.h"
#include "NDDEMO/dg/DGModel.h"
#include "NDDEMO/dg/DGAniModel.h"
#include "NDDEMO/dg/DGFont.h"

class DGModelMan{
private:
	DGObjMan* m_ObjMan; //0x0
	DGTexMan* m_TexMan; //0x4
	u16 m_MaxMaterModelNum; //0x8
	u16 m_MsterModelNum; //0xA
	u16 m_MsterModelPointer; //0xC
	u8 unkE[2]; //padding
	u8** m_MasterModelTable; //0x10

protected:
	u8 m_Lock; //0x14
	u8 unk15[3]; //padding

public:
	DGModelMan(const DGModelMan&);
	DGModelMan();
	DGModelMan(u16 MaxMaterModelNum, u16 MaxTextureNum, u16 MaxObjectNum);
	~DGModelMan();

	void DeleteMasterModel(u16 ModelHandle);

	DGModel* CreateInstance(u16 ModelHandle);
	DGAniModel* CreateAnimeInstance(u16 ModelHandle);

	u16 LoadNDM(char* szFileName);
	u16 LoadDuplicateNDM(char* szFileName);
	DGFont* LoadFont(const char* szFileName, u8 width, u8 height, u8 sequence, char start, char end);
	DGTexPro* LoadTexPro(const char* szFileName);
	
	void EnableMipMap(u8 mip);
	void EnableExpensiveMipMap(u8 mip);

private:
	u16 AddMasterModel(u8* ModelClass);
	void DestroyMasterModel(u16 ModelHandle);

	u16 IncRefer(u16 ModelHandle);
	u16 DecRefer(u16 ModelHandle);
};

#endif
