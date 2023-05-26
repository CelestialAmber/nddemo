#ifndef DOLPHIN_GX_PERF_H
#define DOLPHIN_GX_PERF_H

#include "types.h"

#ifdef __cplusplus
extern "C" {
#endif

void GXClearGPMetric();
void GXReadGPMetric(u32* cnt0, u32* cnt1);
void GXSetGPMetric(u32, u32);

#ifdef __cplusplus
}
#endif
#endif
