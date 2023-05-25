#ifndef DOLPHIN_AMCEXI2STUBS_H
#define DOLPHIN_AMCEXI2STUBS_H

#include "types.h"

typedef enum{
    AMC_EXI_NO_ERROR,
    AMC_EXI_UNSELECTED
} AmcExiError;

void EXI2_Init(void);
void EXI2_EnableInterrupts(void);
BOOL EXI2_Poll(void);
BOOL EXI2_ReadN(void);
BOOL EXI2_WriteN(void);
void EXI2_Reserve(void);
void EXI2_Unreserve(void);
BOOL AMC_IsStub(void);

#endif
