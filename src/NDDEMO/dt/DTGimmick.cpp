#include "NDDEMO/dt/DTGimmick.h"
#include "NDDEMO/dg/DGAniModel.h"

static u16 RandomNo = 12345;

struct tagMPOL_COIN{
	DGAniModel* model; //0x0
	Vec Vec; //0x4
	Vec Rot; //0x10
	u8 Mode; //0x1c
	u8 unk1D[3]; //padding
};

u8 DTGimmick::Random() {
    RandomNo = (RandomNo * 5) + 1;
    return (u8)((u32)RandomNo >> 8);
}

float DTGimmick::Randomf32() {
    u16 filler; //doesn't exist according to dwarf but necessary to match?
    RandomNo = (RandomNo * 1103515245) + 12345;
    return RandomNo/64.0f;
}
