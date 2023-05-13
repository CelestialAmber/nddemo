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
	GetPartsWorldPosition__7DGModelFPCc
	SetPartsWorldPosition__7DGModelFv
	CreateInstance__7DGModelFPUc
	Draw__7DGModelFR11DGRendState
	GetPartsPtr__7DGModelFUs
	GetPartsPtr__7DGModelFPCc

	~DGModel();
	DGModel(DGObjMan*);
	DGModel(const DGModel&);
};