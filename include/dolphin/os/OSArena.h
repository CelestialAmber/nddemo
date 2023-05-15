#ifndef DOLPHIN_OS_ARENA_H
#define DOLPHIN_OS_ARENA_H
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

void* OSGetArenaHi(void);
void* OSGetArenaLo(void);

void OSSetArenaHi(void* hi);
void OSSetArenaLo(void* lo);

#ifdef __cplusplus
}
#endif
#endif