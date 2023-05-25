#ifndef DOLPHIN_PAD_H
#define DOLPHIN_PAD_H
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

void ClampStick(s8* px, s8* py, s8 max, s8 xy, s8 min);

#ifdef __cplusplus
}
#endif

#endif
