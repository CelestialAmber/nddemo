#ifndef DOLPHIN_MTX44_H
#define DOLPHIN_MTX44_H
#include "dolphin/mtx/mtx.h"
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

void C_MTXFrustum(Mtx44, float, float, float, float, float, float);
void C_MTXPerspective(Mtx44, float, float, float, float);
void C_MTXOrtho(Mtx44, float, float, float, float, float, float);

#ifdef __cplusplus
}
#endif
#endif
