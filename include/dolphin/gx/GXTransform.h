#ifndef DOLPHIN_GX_TRANSFORM_H
#define DOLPHIN_GX_TRANSFORM_H
#include "dolphin/gx/GXTypes.h"
#include "dolphin/MTX.h"
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

void GXSetProjection(const Mtx44 proj, GXProjectionType type);
void GXSetProjectionv(const float proj[7]);
void GXGetProjectionv(float proj[7]);
void GXLoadPosMtxImm(const Mtx mtx, u32 id);
void GXLoadPosMtxIndx(u16 index, u32 id);
void GXLoadNrmMtxImm(const Mtx mtx, u32 id);
void GXLoadNrmMtxIndx3x3(u16 index, u32 id);
void GXSetCurrentMtx(u32 id);
void GXLoadTexMtxImm(const Mtx mtx, u32 id, GXTexMtxType type);
void GXSetViewportJitter(float ox, float oy, float sx, float sy, float near, float far,
                         u32 nextField);
void GXSetViewport(float ox, float oy, float sx, float sy, float near, float far);
void GXGetViewportv(float view[6]);
void GXSetZScaleOffset(float scale, float offset);
void GXSetScissor(u32 x, u32 y, u32 w, u32 h);
void GXGetScissor(u32* x, u32* y, u32* w, u32* h);
void GXSetScissorBoxOffset(u32 ox, u32 oy);
void GXSetClipMode(GXClipMode mode);

void __GXSetProjection(void);
void __GXSetViewport(void);
void __GXSetMatrixIndex(GXAttr index);

#ifdef __cplusplus
}
#endif
#endif
