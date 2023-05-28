#ifndef DOLPHIN_GX_FRAMEBUF_H
#define DOLPHIN_GX_FRAMEBUF_H

#include "types.h"
#include "dolphin/gx/GXTypes.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct _GXRenderModeObj {
    u32 tvInfo;               // at 0x0
    u16 fbWidth;              // at 0x4
    u16 efbHeight;            // at 0x6
    u16 xfbHeight;            // at 0x8
    u16 viXOrigin;            // at 0xA
    u16 viYOrigin;            // at 0xC
    u16 viWidth;              // at 0xE
    u16 viHeight;             // at 0x10
    u32 xfbMode;              // at 0x14
    u8 field_rendering;       // at 0x18
    u8 aa;                    // at 0x19
    u8 sample_pattern[12][2]; // at 0x1A
    u8 vfilter[7];            // at 0x32
} GXRenderModeObj;


extern GXRenderModeObj GXNtsc240Ds;
extern GXRenderModeObj GXNtsc240DsAa;
extern GXRenderModeObj GXNtsc240Int;
extern GXRenderModeObj GXNtsc240IntAa;
extern GXRenderModeObj GXNtsc480IntDf;
extern GXRenderModeObj GXNtsc480Int;
extern GXRenderModeObj GXNtsc480IntAa;
extern GXRenderModeObj GXNtsc480Prog;
extern GXRenderModeObj GXNtsc480ProgAa;


void GXCopyTex(void* dst, GXBool clear);
void GXSetTexCopySrc(u16 left, u16 top, u16 width, u16 height);
void GXSetTexCopyDst(u16 width, u16 height, GXTexFmt fmt, GXBool mipmap);
void GXSetCopyClear(GXColor clearColor, u32 clearZ);

#ifdef __cplusplus
}
#endif
#endif
