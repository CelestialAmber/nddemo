#include "NDDEMO/dt/DTGimmick.h"

static u16 RandomNo = 12345;


u8 DTGimmick::Random() {
    RandomNo = (RandomNo * 5) + 1;
    return (u8)((u32)RandomNo >> 8);
}

float DTGimmick::Randomf32() {
    u16 filler; //doesn't exist according to dwarf but necessary to match?
    RandomNo = (RandomNo * 1103515245) + 12345;
    return RandomNo/64.0f;
}
