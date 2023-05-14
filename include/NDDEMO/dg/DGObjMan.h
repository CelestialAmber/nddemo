#pragma once

#include "types.h"
#include "NDDEMO/dg/DGObject.h"

class DGObjMan{
private:
	u16 m_MaxObjectNum; //0x0
	u16 m_ObjectNum; //0x2
	DGObject** m_ObjectTable; //0x4

public:
	DGObjMan(const DGObjMan&);
	DGObjMan(u16 MaxObjectNum);
	~DGObjMan();

	u16 AddObject(DGObject* object);
	DGObject* GetObject(u16 hobj);
	u16 AttachObject(u16 hobj);
	void DetachObject(u16 hobj);

private:
	void DeleteObject(u16 hobj);
};
