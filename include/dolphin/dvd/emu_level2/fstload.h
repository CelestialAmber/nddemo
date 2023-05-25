#ifndef DOLPHIN_FSTLOAD_H
#define DOLPHIN_FSTLOAD_H

#include "types.h"
#include "dolphin/dvd/dvd.h"

void __fstLoad(void);

void cb(s32 param_1, DVDCommandBlock* block);

#endif
