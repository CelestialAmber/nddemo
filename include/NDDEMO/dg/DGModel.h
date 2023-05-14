#pragma once

#include "types.h"
#include "NDDEMO/dg/DGObjMan.h"
#include "NDDEMO/dg/DGPosition.h"
#include "NDDEMO/dg/DGParts.h"
#include "NDDEMO/dg/DGRendState.h"

class DGModel : DGPosition {
private:
	DGObjMan* m_ObjMan; //0x58

protected:
	DGParts* m_Parts; //0x5C

public:
	Vec GetPartsWorldPosition(const char*);
	void SetPartsWorldPosition();
	u8 CreateInstance(u8*);
	void Draw(DGRendState&);
	DGParts* GetPartsPtr(u16);
	DGParts* GetPartsPtr(const char*);

	~DGModel();
	DGModel(DGObjMan*);
	DGModel(const DGModel&);
};
