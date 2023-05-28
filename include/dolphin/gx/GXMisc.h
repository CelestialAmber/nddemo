#ifndef DOLPHIN_GX_MISC_H
#define DOLPHIN_GX_MISC_H
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

typedef void (*GXDrawDoneCallback)(void);

void GXSetMisc(u32 token, u32 val);
void GXFlush(void);
void GXResetWriteGatherPipe(void);
void GXAbortFrame(void);
void GXDrawDone();
GXDrawDoneCallback GXSetDrawDoneCallback(GXDrawDoneCallback cb);

#ifdef __cplusplus
}
#endif
#endif
