#ifndef NDDEMO_DGPARTS_H
#define NDDEMO_DGPARTS_H

#include "types.h"
#include "dolphin/GX.h"
#include "NDDEMO/Math.h"
#include "NDDEMO/dg/DGObjMan.h"
#include "NDDEMO/dg/DGPosition.h"
#include "NDDEMO/dg/DGRendState.h"

class DGParts;

struct tagPARTS_LIST{
	tagPARTS_LIST* next; //0x0
	tagPARTS_LIST* prev; //0x4
	DGParts* parts; //0x8

	tagPARTS_LIST(const tagPARTS_LIST&);
	tagPARTS_LIST();
};

class DGParts : public DGPosition{
private:
	DGObjMan* m_ObjMan; //0x58
	tagPARTS_LIST* m_PartsList; //0x5C
	char* m_Name; //0x60
	u16 m_HObject; //0x64
	u8 m_LightChannel_Amb; //0x66
	u8 m_LightChannel_Mat; //0x67
	GXColor m_LightChannel_AmbColor; //0x68
	GXColor m_LightChannel_MatColor; //0x6C
	u8 m_Blend; //0x70
	u8 m_Culling_Front; //0x71
	u8 m_Culling_Back; //0x72
	u8 m_Visible; //0x73
	u8 m_VisibleChild; //0x74
	u8 m_Specular; //0x75
	u8 m_EnvMap; //0x76
	u8 m_EnableChannels; //0x77
	u8 m_SpecMap; //0x78
	u8 m_BumpMap; //0x79
	u8 m_TextureProjection; //0x7A
	u8 m_EnableLightingD; //0x7B
	u8 m_EnableLightingS; //0x7C
	Vec m_WorldPosition; //0x80

public:
	DGParts(const DGParts&);
	DGParts(DGObjMan* objman);
	~DGParts();

	void AddPartsList(DGParts* parts);
	DGParts* CullPartsListStr(const char* ChildName);
	DGParts* CullPartsListNo(u16 ChildNo);
	DGParts* GetPartsPtr(const char* name, u8& flag);
	DGParts* GetPartsPtr(u16& no);
	char* GetNamePtr();
	u16 NumOfChild();
	void Draw(DGRendState& RendState);
	void SetVisible(u8 visible);
	u8 GetVisible();
	void SetVisibleChild(u8 visible);
	u8 GetVisibleChild();
	u8 CreateInstance(u8*& ClassPtr);
	void SetWorldPosition(Mtx& Trans);
	Vec GetWorldPosition();

private:
	void AllDeletePartsList();
};

#endif
