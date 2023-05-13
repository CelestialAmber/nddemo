#pragma once

#include "types.h"
#include "NDDEMO/dg/DGObject.h"

class DGObjMan{
private:
    u16 m_MaxObjectNum; //0x0
    u16 m_ObjectNum; //0x2
    DGObject** m_ObjectTable; //0x4

public:
    DetachObject__8DGObjManFUs
    AttachObject__8DGObjManFUs
    GetObject__8DGObjManFUs
    AddObject__8DGObjManFP8DGObject

    __dt__8DGObjManFv
    __ct__8DGObjManFUs
    __ct__8DGObjManFRC8DGObjMan

private:
    DeleteObject__8DGObjManFUs
};
