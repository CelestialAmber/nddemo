#ifndef _MSL_ANSI_FILES_H
#define _MSL_ANSI_FILES_H

#include "types.h"
#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif // ifdef __cplusplus

void __close_all();
u32 __flush_all();

#ifdef __cplusplus
};
#endif // ifdef __cplusplus

#endif
