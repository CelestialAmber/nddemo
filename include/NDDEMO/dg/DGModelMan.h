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
    EnableExpensiveMipMap__10DGModelManFUc
    EnableMipMap__10DGModelManFUc
    LoadTexPro__10DGModelManFPCc
    LoadFont__10DGModelManFPCcUcUcUccc
    DeleteMasterModel__10DGModelManFUs
    LoadDuplicateNDM__10DGModelManFPc
    LoadNDM__10DGModelManFPc
    CreateAnimeInstance__10DGModelManFUs
    CreateInstance__10DGModelManFUs

    __dt__10DGModelManFv
    __ct__10DGModelManFUsUsUs
    __ct__10DGModelManFv
    __ct__10DGModelManFRC10DGModelMan

private:
    DecRefer__10DGModelManFUs
    IncRefer__10DGModelManFUs
    DestroyMasterModel__10DGModelManFUs
    AddMasterModel__10DGModelManFPUc
};
