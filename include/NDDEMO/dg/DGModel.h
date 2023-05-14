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
	DGModel(const DGModel&);
	DGModel(DGObjMan* objman);
	~DGModel();

	DGParts* GetPartsPtr(const char* name);
	DGParts* GetPartsPtr(u16 no);
	void Draw(DGRendState& RendState);
	u8 CreateInstance(u8* MasterModel);
	void SetPartsWorldPosition();
	Vec GetPartsWorldPosition(const char* PartsName);
};
