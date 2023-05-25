#include "dolphin/MTX.h"

//unused
void C_MTXMultVec(){
}

asm void PSMTXMultVec(const register Mtx m, const register Vector* src, register Vector* dst) {
	nofralloc
	psq_l fp0, 0(src), 0, 0
	psq_l fp2, 0(m), 0, 0
	psq_l fp1, 8(src), 1, 0
	ps_mul fp4, fp2, fp0
	psq_l fp3, 8(m), 0, 0
	ps_madd fp5, fp3, fp1, fp4
	psq_l fp8, 16(m), 0, 0
	ps_sum0 fp6, fp5, fp6, fp5
	psq_l fp9, 24(m), 0, 0
	ps_mul fp10, fp8, fp0
	psq_st fp6, 0(dst), 1, 0
	ps_madd fp11, fp9, fp1, fp10
	psq_l fp2, 32(m), 0, 0
	ps_sum0 fp12, fp11, fp12, fp11
	psq_l fp3, 40(m), 0, 0
	ps_mul fp4, fp2, fp0
	psq_st fp12, 4(dst), 1, 0
	ps_madd fp5, fp3, fp1, fp4
	ps_sum0 fp6, fp5, fp6, fp5
	psq_st fp6, 8(dst), 1, 0
	blr
}

//unused
void C_MTXMultVecArray(){
}

//unused
asm void PSMTXMultVecArray(){
}

//unused
void C_MTXMultVecSR(){
}

asm void PSMTXMultVecSR(const register Mtx m, const register Vector* src, register Vector* dst){
	nofralloc
	psq_l fp0, 0x0(m), 0, 0
	psq_l fp6, 0x0(src), 0, 0
	psq_l fp2, 0x10(m), 0, 0
	ps_mul fp8, fp0, fp6
	psq_l fp4, 0x20(m), 0, 0
	ps_mul fp10, fp2, fp6
	psq_l fp7, 0x8(src), 1, 0
	ps_mul fp12, fp4, fp6
	psq_l fp3, 0x18(m), 0, 0
	ps_sum0 fp8, fp8, fp8, fp8
	psq_l fp5, 0x28(m), 0, 0
	ps_sum0 fp10, fp10, fp10, fp10
	psq_l fp1, 0x8(m), 0, 0
	ps_sum0 fp12, fp12, fp12, fp12
	ps_madd f9, fp1, fp7, fp8
	psq_st fp9, 0x0(dst), 1, 0
	ps_madd fp11, fp3, fp7, fp10
	psq_st fp11, 0x4(dst), 1, 0
	ps_madd fp13, fp5, fp7, fp12
	psq_st fp13, 0x8(dst), 1, 0
	blr
}

//unused
void C_MTXMultVecArraySR(){
}

//unused
asm void PSMTXMultVecArraySR(){
}
