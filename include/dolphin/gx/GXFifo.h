#ifndef RVL_SDK_GX_FIFO_H
#define RVL_SDK_GX_FIFO_H
#include "dolphin/gx/GXHardware.h"
#include "dolphin/gx/GXInternal.h"
#include "dolphin/OS.h"
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

GX_DECL_PUBLIC_STRUCT(GXFifoObj, 128);

static inline void GXPosition2f32(const f32 x, const f32 y)
{
	WGPIPE.f = x;
	WGPIPE.f = y;
}

static inline void GXPosition3s16(const s16 x, const s16 y, const s16 z)
{
	WGPIPE.s = x;
	WGPIPE.s = y;
	WGPIPE.s = z;
}

static inline void GXPosition3u16(const u16 x, const u16 y, const u16 z)
{
	WGPIPE.us = x;
	WGPIPE.us = y;
	WGPIPE.us = z;
}

static inline void GXPosition3f32(const f32 x, const f32 y, const f32 z)
{
	WGPIPE.f = x;
	WGPIPE.f = y;
	WGPIPE.f = z;
}

static inline void GXNormal3f32(const f32 x, const f32 y, const f32 z)
{
	WGPIPE.f = x;
	WGPIPE.f = y;
	WGPIPE.f = z;
}

static inline void GXColor1u32(u32 c) { WGPIPE.ui = c; }

static inline void GXColor4u8(const u8 r, const u8 g, const u8 b, const u8 a)
{
	WGPIPE.uc = r;
	WGPIPE.uc = g;
	WGPIPE.uc = b;
	WGPIPE.uc = a;
}

static inline void GXTexCoord2s8(const s8 u, const s8 v)
{
	WGPIPE.c = u;
	WGPIPE.c = v;
}

static inline void GXTexCoord2u8(u8 s, u8 t)
{
	WGPIPE.uc = s;
	WGPIPE.uc = t;
}

static inline void GXPosition2u16(u16 x, u16 y)
{
	WGPIPE.us = x;
	WGPIPE.us = y;
}

static inline void GXTexCoord2s16(const s16 u, const s16 v)
{
	WGPIPE.s = u;
	WGPIPE.s = v;
}

static inline void GXTexCoord2f32(const f32 u, const f32 v)
{
	WGPIPE.f = u;
	WGPIPE.f = v;
}

void GXSetCPUFifo(GXFifoObj*);
BOOL GXGetCPUFifo(GXFifoObj*);

u32 GXGetFifoCount(GXFifoObj*);
u8 GXGetFifoWrap(GXFifoObj*);

OSThread* GXSetCurrentGXThread();

#ifdef __cplusplus
}
#endif
#endif
