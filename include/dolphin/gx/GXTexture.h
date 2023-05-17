#ifndef DOLPHIN_GX_TEXTURE_H
#define DOLPHIN_GX_TEXTURE_H
#include "dolphin/gx/GXInternal.h"
#include "dolphin/gx/GXTypes.h"
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

GX_DECL_PUBLIC_STRUCT(GXTexObj, 32);

void __GXSetSUTexRegs(void);

void GXInitTexObj(GXTexObj*, void*, u16, u16, GXTexFmt, GXTexWrapMode,
                  GXTexWrapMode, u8);
void GXInitTexObjLOD(GXTexObj*, GXTexFilter, GXTexFilter, float, float, float, u8, u8,
                     GXAnisotropy);

void GXLoadTexObj(GXTexObj*, GXTexMapID);

#ifdef __cplusplus
}
#endif
#endif
