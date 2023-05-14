#pragma once

#include "types.h"
#include "dolphin/PAD.h"

class DTPad{
private:
	u32 ResetReq; //0x0
	u32 count; //0x4

protected:
	PADStatus prepad[3]; //0x8
	PADStatus pad[3]; //0x38

public:
	DTPad(const DTPad&);
	DTPad();
	~DTPad();

	void Read();
	s8 StickX(u16 id);
	s8 StickY(u16 id);
	s8 SubStickX(u16 id);
	s8 SubStickY(u16 id);
	int IsTrg(u16 id, u16 key);
	int IsCnd(u16 id, u16 key);
	int IsTrp(u16 id, u16 key);
	int IsPush(u16 id, u16 key);
	int IsStickTrg(u16 id, u16 stk);
	PADStatus* GetPADStatus(u8 padNo);
}
