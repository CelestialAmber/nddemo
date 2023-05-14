#pragma once

#include "types.h"
#include "NDDEMO/dg/DGObjMan.h"
#include "NDDEMO/dg/DGTexMan.h"
#include "NDDEMO/dg/DGTexPro.h"

class DGModelMan{
private:
	DGObjMan* m_ObjMan; //0x0
	DGTexMan* m_TexMan; //0x4
	u16 m_MaxMaterModelNum; //0x8
	u16 m_MsterModelNum; //0xA
	u16 m_MsterModelPointer; //0xC
	u8** m_MasterModelTable; //0x10

protected:
	u8 m_Lock; //0x14
	u8 unk15[3]; //padding

public:
	void EnableExpensiveMipMap(u8);
	void EnableMipMap(u8);
	DGTexPro* LoadTexPro(const char*);
	DGFont* LoadFont(const char*, u8, u8, u8, char, char);
	void DeleteMasterModel(u16);
	u16 LoadDuplicateNDM(char*);
	u16 LoadNDM(char*);
	DGAniModel* CreateAnimeInstance(u16);
	DGModel* CreateInstance(u16);

	~DGModelMan();
	DGModelMan(u16, u16, u16);
	DGModelMan();
	DGModelMan(const DGModelMan&);

private:
	u16 DecRefer(u16);
	u16 IncRefer(u16);
	void DestroyMasterModel(u16);
	u16 AddMasterModel(u8*);
};
