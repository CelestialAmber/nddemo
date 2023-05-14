#pragma once

#include "types.h"
#include "NDDEMO/dg/DGModel.h"
#include "NDDEMO/dg/DGObjMan.h"
#include "NDDEMO/dg/DGParts.h"

class DGAniModel : DGModel {
private:
    u8 m_UseAniModel; //0x60
    u8 unk61; //padding
    u16 m_AniTypeNum; //0x62
    char* m_AniTypeName; //0x64
    u16* m_AniPartsNum; //0x68
    DGParts*** m_AniParts; //0x6C
    u16 m_NowHAniType; //0x70
    u16 m_NowPatNo; //0x72

public:
    u16 GetNowAniPat();
    u16 GetNowAniType();
    void SetAniPat(u16, u16);
    u16 NumOfAniTypePat(u16);
    u16 GetAniType(const char*);
    u8 ReconstructToAnimodelStruct();

    ~DGAniModel();
    DGAniModel(DGObjMan*);
    DGAniModel(const DGAniModel&);

private:
    void DeleteAniModelArray();
};
