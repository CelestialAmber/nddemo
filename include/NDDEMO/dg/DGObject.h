#ifndef NDDEMO_DGOBJECT_H
#define NDDEMO_DGOBJECT_H

#include "types.h"
#include "dolphin/GX.h"
#include "NDDEMO/dg/DGTexMan.h"
#include "NDDEMO/du/DUDvd.h"

class DGObject{
private:
	u16 m_ReferCount; //0x0
	u8 unk2[2]; //padding
	DGTexMan* m_TexMan; //0x4

	GXAttrType m_VIAT; //0x8
	GXAttrType m_NIAT; //0xC
	GXAttrType m_CIAT; //0x10
	GXAttrType m_TIAT; //0x14

	GXCompCnt m_VCompCnt; //0x18
	GXCompType m_VCompType; //0x1C
	u8 m_VFixPoint; //0x20
	u8 m_VStride; //0x21
	u8 unk22[2]; //padding

	GXCompCnt m_NCompCnt; //0x24
	GXCompType m_NCompType; //0x28
	u8 m_NFixPoint; //0x2C
	u8 m_NStride; //0x2D
	u8 unk2E[2]; //padding

	GXCompCnt m_CCompCnt; //0x30
	GXCompType m_CCompType; //0x34
	u8 m_CStride; //0x38
	u8 unk39[3]; //padding

	GXCompCnt m_TCompCnt; //0x3C
	GXCompType m_TCompType; //0x40
	u8 m_TFixPoint; //0x44
	u8 m_TStride; //0x45
	u8 unk46[2]; //padding

	u8* m_ArrayImg; //0x48
	u32 m_ArrayImgSize; //0x4C
	void* m_NormalArrayImg; //0x50
	void* m_ColorArrayImg; //0x54
	void* m_TexUVArrayImg; //0x58
	u8* m_ObjSteram; //0x5C
	u8* m_DispList; //0x60

	u16 m_TexTrans[8]; //0x64
	u16 m_uTexWrap; //0x74
	u16 m_vTexWrap; //0x76
	u8* m_PartsBlock; //0x78

public:
	//referred to as a typedef in dwarf
	static u32 lineMode;

	DGObject(const DGObject&);
	DGObject(DGTexMan* TexMan);
	~DGObject();

	void Draw();
	u16 IncRefer();
	u16 DecRefer();
	u8 LoadNDMPartsBlock(DUDvd& File);
	void MakeTexTransTable(u16* GlobalTexTable);
	u8* GetPartsBlock();
	bool IsNull();

	//fabricated param name
	void SetLineMode(int mode){
		lineMode = mode;
	}

	int GetLineMode(){
		return lineMode;
	}

private:
	void SetArrayFormat(u16 VertexArrayFormat, u16 NormalArrayFormat, u16 ColorArrayFormat, u16 TexUVArrayFormat);
	void ExecuteObjStream();
	
	void oscmdExtend0(u8*& OSPtr);
	void oscmdExtendF(u8*& OSPtr);
	void oscmdVtxDesc(u8*& OSPtr);
	void oscmdTevDirect(u8*& OSPtr);
	void oscmdTevOrder(u8*& OSPtr);
	void oscmdTevStages(u8*& OSPtr);
	void oscmdTexGens(u8*& OSPtr);
	void oscmdTevColorInOp(u8*& OSPtr);
	void oscmdTevAlphaInOp(u8*& OSPtr);
	void oscmdTevColor(u8*& OSPtr);
	void oscmdBlendMode(u8*& OSPtr);
	void oscmdTexCoordGen(u8*& OSPtr);
	void oscmdIndStages(u8*& OSPtr);
	void oscmdIndTexOrder(u8*& OSPtr);
	void oscmdIndTexCoordScale(u8*& OSPtr);
	void oscmdDrawLine(u8*& OSPtr);
	void oscmdDisplayList(u8*& OSPtr);
	void oscmdZMode(u8*& OSPtr);
	void oscmdIndBumpXYZ(u8*& OSPtr);
};

#endif
