#ifndef RVL_SDK_MTX_VEC_H
#define RVL_SDK_MTX_VEC_H
#include "dolphin/mtx/mtx.h"
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

void PSVECAdd(const Vector*, const Vector*, Vector*);
void PSVECScale(const Vector*, Vector*, float);
void PSVECNormalize(const Vector*, Vector*);
float PSVECMag(const Vector*);
float PSVECDotProduct(const Vector*, const Vector*);
void PSVECCrossProduct(const Vector*, const Vector*, Vector*);
float PSVECSquareDistance(const Vector*, const Vector*);

void C_VECHalfAngle(const Vector*, const Vector*, Vector*);

#ifdef __cplusplus
}
#endif
#endif
