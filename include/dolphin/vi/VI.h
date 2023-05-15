#ifndef _DOLPHIN_VI_H
#define _DOLPHIN_VI_H

#ifdef __cplusplus
extern "C" {
#endif // ifdef __cplusplus

#include "types.h"

#define VI_DISPLAY_PIX_SZ 2

#define VI_INTERLACE     0
#define VI_NON_INTERLACE 1
#define VI_PROGRESSIVE   2

#define VI_NTSC      0
#define VI_PAL       1
#define VI_MPAL      2
#define VI_DEBUG     3

#define VI_TVMODE(FMT, INT) (((FMT) << 2) + (INT))

typedef enum {
	VI_TVMODE_NTSC_INT  = VI_TVMODE(VI_NTSC, VI_INTERLACE),
	VI_TVMODE_NTSC_DS   = VI_TVMODE(VI_NTSC, VI_NON_INTERLACE),
	VI_TVMODE_NTSC_PROG = VI_TVMODE(VI_NTSC, VI_PROGRESSIVE),

	VI_TVMODE_PAL_INT = VI_TVMODE(VI_PAL, VI_INTERLACE),
	VI_TVMODE_PAL_DS  = VI_TVMODE(VI_PAL, VI_NON_INTERLACE),

	VI_TVMODE_MPAL_INT = VI_TVMODE(VI_MPAL, VI_INTERLACE),
	VI_TVMODE_MPAL_DS  = VI_TVMODE(VI_MPAL, VI_NON_INTERLACE),

	VI_TVMODE_DEBUG_INT = VI_TVMODE(VI_DEBUG, VI_INTERLACE)
} VITVMode;

typedef enum {
	VI_XFBMODE_SF,
	VI_XFBMODE_DF
} VIXFBMode;

#define VI_FIELD_ABOVE 1
#define VI_FIELD_BELOW 0

// Maximum screen space
#define VI_MAX_WIDTH_NTSC  720
#define VI_MAX_HEIGHT_NTSC 480

#define VI_MAX_WIDTH_PAL  720
#define VI_MAX_HEIGHT_PAL 574

#define VI_MAX_WIDTH_MPAL  720
#define VI_MAX_HEIGHT_MPAL 480

#define VI_MAX_WIDTH_EURGB60  VI_MAX_WIDTH_NTSC
#define VI_MAX_HEIGHT_EURGB60 VI_MAX_HEIGHT_NTSC

typedef void (*VIRetraceCallback)(u32 retraceCount);

#define VIPadFrameBufferWidth(width) ((u16)(((u16)(width) + 15) & ~15))

void VIInit(void);
void VIFlush(void);
void VIWaitForRetrace(void);

void VIConfigure(const struct _GXRenderModeObj* rm);
void VIConfigurePan(u16 PanPosX, u16 PanPosY, u16 PanSizeX, u16 PanSizeY);
void VISetNextFrameBuffer(void* fb);
void* VIGetCurrentFrameBuffer();

VIRetraceCallback VISetPreRetraceCallback(VIRetraceCallback callback);
VIRetraceCallback VISetPostRetraceCallback(VIRetraceCallback callback);

void VISetBlack(BOOL black);
u32 VIGetRetraceCount(void);
u32 VIGetNextField(void);
u32 VIGetCurrentLine(void);
u32 VIGetTvFormat(void);

u32 VIGetDTVStatus(void);

#ifdef __cplusplus
};
#endif // ifdef __cplusplus

#endif