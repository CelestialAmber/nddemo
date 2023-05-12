#ifndef DOLPHIN_OSUTIL_H
#define DOLPHIN_OSUTIL_H

#include "types.h"

#ifdef __cplusplus
extern "C" {
#endif // ifdef __cplusplus

///// USEFUL MACROS/DEFINES //////
// Macro for making clear things are addresses.
// if-def for future proofing and so VSCode doesn't yell.
#ifdef __MWERKS__
#define AT_ADDRESS(addr) : (addr)
#else
#define AT_ADDRESS(addr)
#endif

// Defines for cached and uncached memory.
#define OS_BASE_CACHED   (0x80000000)
#define OS_BASE_UNCACHED (0xC0000000)

// Necessary for inline asm functions.
#define OS_CACHED_REGION_PREFIX   (0x8000)
#define OS_UNCACHED_REGION_PREFIX (0xC000)
#define OS_PHYSICAL_MASK          (0x3FFF)

// Macros for rounding to 32-alignment.
#define OSRoundUp32B(x)   (((u32)(x) + 0x1F) & ~(0x1F))
#define OSRoundDown32B(x) (((u32)(x)) & ~(0x1F))

#ifdef __cplusplus
};
#endif // ifdef __cplusplus

#endif
