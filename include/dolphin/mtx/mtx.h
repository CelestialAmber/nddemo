#ifndef DOLPHIN_MTX_H
#define DOLPHIN_MTX_H
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

typedef float Mtx[3][4];
typedef float Mtx44[4][4];

//renamed from Vec to avoid conflicts with NDDEMO struct.
//it's possible they used this struct?
typedef struct Vector {
    float x, y, z;
} Vector;

typedef struct PSQuaternion {
    float x, y, z, w;
} PSQuaternion;

void PSMTXIdentity(Mtx);
void PSMTXCopy(const Mtx, Mtx);
void PSMTXConcat(const Mtx, const Mtx, Mtx);
//void PSMTXConcatArray(const Mtx, const Mtx, Mtx, u32);
void PSMTXTranspose(const Mtx, Mtx);
u32 PSMTXInverse(const Mtx, Mtx);
void PSMTXInvXpose(const Mtx, Mtx);
void PSMTXRotRad(Mtx, char, float);
void PSMTXRotTrig(Mtx, char, float, float);
void PSMTXRotAxisRad(Mtx, const Vector*, float);
void PSMTXTrans(Mtx, float, float, float);
void PSMTXTransApply(const Mtx, Mtx, float, float, float);
void PSMTXScale(Mtx, float, float, float);
void PSMTXScaleApply(const Mtx, Mtx, float, float, float);
void PSMTXQuat(Mtx, const PSQuaternion*);

void C_MTXLookAt(Mtx, const Vector*, const Vector*, const Vector*);
void C_MTXLightFrustum(Mtx, float, float, float, float, float, float, float, float, float);
void C_MTXLightPerspective(Mtx, float, float, float, float, float, float);
void C_MTXLightOrtho(Mtx, float, float, float, float, float, float, float, float);

#ifdef __cplusplus
}
#endif
#endif
