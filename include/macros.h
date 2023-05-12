
#ifndef MACROS_H
#define MACROS_H

#define MAX(x, y) ((x) > (y) ? (x) : (y))
#define MIN(x, y) ((x) < (y) ? (x) : (y))

#define CLAMP(low, high, x)                                                    \
    ((x) > (high) ? (high) : ((x) < (low) ? (low) : (x)))

#define ROUND_UP(x, align) (((x) + (align)-1) & (-(align)))
#define ROUND_UP_PTR(x, align)                                                 \
    ((void*)((((u32)(x)) + (align)-1) & (~((align)-1))))

#define ROUND_DOWN(x, align) ((x) & (-(align)))
#define ROUND_DOWN_PTR(x, align) ((void*)(((u32)(x)) & (~((align)-1))))

#define ARRAY_LENGTH(x) (sizeof((x)) / sizeof((x)[0]))

#define ALIGN(x) __attribute__((aligned(x)))
#define DECL_SECTION(x) __declspec(section x)
#define DECL_WEAK __declspec(weak)
#define DONT_INLINE __attribute__((never_inline))

// Codewarrior tricks for matching decomp
// (Functions are given prototypes for -requireprotos)
#ifdef __MWERKS__
// Force BSS order
#define CW_FORCE_BSS(module, ...)                                              \
    void fake_function(...);                                                   \
    void FORCE_BSS##module##x(void);                                           \
    void FORCE_BSS##module##x(void) { fake_function(__VA_ARGS__); }
// Force strings into pool
#define CW_FORCE_STRINGS(module, ...)                                          \
    void fake_function(...);                                                   \
    void FORCE_STRINGS##module(void);                                          \
    void FORCE_STRINGS##module(void) { fake_function(__VA_ARGS__); }
#else
#define CW_FORCE_BSS(module, ...)
#define CW_FORCE_STRINGS(module, ...)
#endif

// For VSCode
#ifdef __INTELLISENSE__
#define asm
#define __attribute__(x)
#define __declspec(x)
#endif

#endif
