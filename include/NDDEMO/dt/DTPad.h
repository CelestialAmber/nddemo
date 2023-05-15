#ifndef NDDEMO_DTPAD_H
#define NDDEMO_DTPAD_H

#include "types.h"
#include "dolphin/PAD.h"

class DTPad{
private:
	u32 ResetReq; //0x0
	u32 count; //0x4

protected:
	PADStatus prepad[3]; //0x8
	u8 unk24[0xC]; //padding
	PADStatus pad[3]; //0x38
	u8 unk5C[0xC]; //padding

public:
	DTPad(const DTPad&);
	DTPad();
	~DTPad();

	void Read();
	PADStatus* GetPADStatus(u8 padNo);

	s8 StickX(u16 id);
	s8 StickY(u16 id);
	s8 SubStickX(u16 id);
	s8 SubStickY(u16 id);
	BOOL IsTrg(u16 id, u16 key);
	BOOL IsCnd(u16 id, u16 key);
	BOOL IsTrp(u16 id, u16 key);
	BOOL IsPush(u16 id, u16 key);
	BOOL IsStickTrg(u16 id, u16 stk);
};

#endif
