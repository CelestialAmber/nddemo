#pragma once

#include "types.h"
#include "NDDEMO/dg/DGObject.h"

class DGObjMan{
private:
    u16 m_MaxObjectNum; //0x0
    u16 m_ObjectNum; //0x2
    DGObject** m_ObjectTable; //0x4

public:
    void DetachObject(u16);
    u16 AttachObject(u16);
    DGObject* GetObject(u16);
    u16 AddObject(DGObject*);

    ~DGObjMan();
    DGObjMan(u16);
    DGObjMan(const DGObjMan&);

private:
    void DeleteObject(u16);
};
