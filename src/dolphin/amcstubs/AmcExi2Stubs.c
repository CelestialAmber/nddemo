#include "dolphin/amcstubs/AmcExi2Stubs.h"

void EXI2_Init(void){
}

void EXI2_EnableInterrupts(void){
}

BOOL EXI2_Poll(void){
    return FALSE;
}

BOOL EXI2_ReadN(void){
    return FALSE;
}

BOOL EXI2_WriteN(void){
    return FALSE;
}

void EXI2_Reserve(void){
}

void EXI2_Unreserve(void){
}

BOOL AMC_IsStub(void){
    return TRUE;
}
