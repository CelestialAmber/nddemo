#ifndef DOLPHIN_VI_TYPES_H
#define DOLPHIN_VI_TYPES_H
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

typedef enum VITVMode{
    VI_TVMODE_NTSC_INT = 0,
    VI_TVMODE_NTSC_DS,
    VI_TVMODE_NTSC_PROG,
    VI_TVMODE_PAL_INT = 4,
    VI_TVMODE_PAL_DS,
    VI_TVMODE_MPAL_INT = 8,
    VI_TVMODE_MPAL_DS,
    VI_TVMODE_DEBUG_INT = 12
} VITVMode;

typedef enum VIXFBMode{
    VI_XFBMODE_SF,
    VI_XFBMODE_DF
} VIXFBMode;

#ifdef __cplusplus
}
#endif
#endif
