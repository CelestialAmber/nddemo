#ifndef DOLPHIN_MTXVEC_H
#define DOLPHIN_MTXVEC_H
#include "dolphin/mtx/mtx.h"
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

void PSMTXMultVec(const Mtx, const Vector*, Vector*);
void PSMTXMultVecSR(const Mtx, const Vector*, Vector*);

#ifdef __cplusplus
}
#endif
#endif
