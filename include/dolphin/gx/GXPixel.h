#ifndef DOLPHIN_GX_PIXEL_H
#define DOLPHIN_GX_PIXEL_H
#include "dolphin/gx/GXTypes.h"
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

void GXSetFog(GXFogType type, f32 startz, f32 endz, f32 nearz, f32 farz, GXColor color);

void GXSetBlendMode(GXBlendMode type, GXBlendFactor src_factor, GXBlendFactor dst_factor, GXLogicOp op);
void GXSetColorUpdate(GXBool update_enable);
void GXSetAlphaUpdate(GXBool update_enable);
void GXSetZMode(GXBool compare_enable, GXCompare func, GXBool update_enable);
void GXSetZCompLoc(GXBool before_tex);

void GXSetDither(GXBool enable);
void GXSetDstAlpha(GXBool enable, u8 alpha);

#ifdef __cplusplus
}
#endif
#endif
