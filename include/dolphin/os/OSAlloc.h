#ifndef DOLPHIN_OS_ALLOC_H
#define DOLPHIN_OS_ALLOC_H
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

extern volatile s32 __OSCurrHeap;

void* OSAllocFromHeap(s32 handle, s32 size);
void OSFreeToHeap(s32 handle, void* p);
s32 OSSetCurrentHeap(s32 handle);
void* OSInitAlloc(void* start, void* end, s32 numHeaps);
s32 OSCreateHeap(void* start, void* end);
s32 OSCheckHeap(s32 handle);

#ifdef __cplusplus
}
#endif
#endif
