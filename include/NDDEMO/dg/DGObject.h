#pragma once

#include "types.h"
#include "dolphin/GX.h"
#include "NDDEMO/dg/DGTexMan.h"

class DGObject{
private:
    u16 m_ReferCount; //0x0
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
    IsNull__8DGObjectFv
    GetPartsBlock__8DGObjectFv
    MakeTexTransTable__8DGObjectFPUs
    LoadNDMPartsBlock__8DGObjectFR5DUDvd
    DecRefer__8DGObjectFv
    IncRefer__8DGObjectFv
    Draw__8DGObjectFv

    __dt__8DGObjectFv
    __ct__8DGObjectFP8DGTexMan
    __ct__8DGObjectFRC8DGObject

    GetLineMode__8DGObjectFv
    SetLineMode__8DGObjectFi

    typedef u32 lineMode;

private:
    oscmdDrawLine__8DGObjectFRPUc
    oscmdIndBumpXYZ__8DGObjectFRPUc
    oscmdZMode__8DGObjectFRPUc
    oscmdDisplayList__8DGObjectFRPUc
    oscmdExtendF__8DGObjectFRPUc
    oscmdIndTexCoordScale__8DGObjectFRPUc
    oscmdIndTexOrder__8DGObjectFRPUc
    oscmdIndStages__8DGObjectFRPUc
    oscmdTexCoordGen__8DGObjectFRPUc
    oscmdBlendMode__8DGObjectFRPUc
    oscmdTevColor__8DGObjectFRPUc
    oscmdTevAlphaInOp__8DGObjectFRPUc
    oscmdTevColorInOp__8DGObjectFRPUc
    oscmdTexGens__8DGObjectFRPUc
    oscmdTevStages__8DGObjectFRPUc
    oscmdTevOrder__8DGObjectFRPUc
    oscmdTevDirect__8DGObjectFRPUc
    oscmdVtxDesc__8DGObjectFRPUc
    oscmdExtend0__8DGObjectFRPUc
    ExecuteObjStream__8DGObjectFv
    SetArrayFormat__8DGObjectFUsUsUsUs
};
