#include "dolphin/MTX.h"

//unused
void C_VECAdd(){
}

asm void PSVECAdd(const register Vector* vv1, const register Vector* vv2, register Vector* out) {
	nofralloc
	psq_l fp2, 0(vv1), 0, 0
	psq_l fp4, 0(vv2), 0, 0
	ps_add fp6, fp2, fp4
	psq_st fp6, 0(out), 0, 0
	psq_l fp3, 8(vv1), 1, 0
	psq_l fp5, 8(vv2), 1, 0
	ps_add fp7, fp3, fp5
	psq_st fp7, 8(out), 1, 0
	blr
}

//unused
void C_VECSubtract(){
}

asm void PSVECSubtract(const register Vector* vec1, const register Vector* vec2, register Vector* dst){
	nofralloc
	psq_l fp2, 0x0(vec1), 0, 0
	psq_l fp4, 0x0(vec2), 0, 0
	ps_sub fp6, fp2, fp4
	psq_st fp6, 0x0(dst), 0, 0
	psq_l fp3, 0x8(vec1), 1, 0
	psq_l fp5, 0x8(vec2), 1, 0
	ps_sub fp7, fp3, fp5
	psq_st fp7, 0x8(dst), 1, 0
	blr
}

//unused
void C_VECScale(){
}

//unused
void PSVECScale(const register Vector* in, register Vector* out, register float vv1) {
}

//unused
void C_VECNormalize(){
}

void PSVECNormalize(const register Vector* vec1, register Vector* dst) {
	register float vv1 = 0.5F;
	register float vv2 = 3.0f;
	register float vv3, vv4;
	register float vv5, vv6;
	register float vv7;
	register float vv8;
	register float vv9, vv10;

	asm{
		psq_l    vv3, 0(vec1), 0, 0
		ps_mul   vv6, vv3, vv3
		psq_l    vv4, 8(vec1), 1, 0
		ps_madd  vv5, vv4, vv4, vv6
		ps_sum0  vv7, vv5, vv4, vv6
		ps_rsqrte  vv8, vv7
		fmuls    vv9, vv8, vv8
		fmuls    vv10, vv8, vv1
		fnmsubs  vv9, vv9, vv7, vv2
		fmuls    vv8, vv9, vv10
		ps_muls0 vv3, vv3, vv8
		psq_st   vv3, 0(dst), 0, 0
		ps_muls0 vv4, vv4, vv8
		psq_st   vv4, 8(dst), 1, 0
	}
}

//unused
void C_VECSquareMag(){
}

//unused
asm void PSVECSquareMag(){
}

//unused
void C_VECMag(){
}

float PSVECMag(const register Vector* v) {
	register float vv1, vv2, vv3;
	register float vv4, vv5, vv6;
	register float vv7, vv8, vv9;

	asm {
		psq_l   vv1, 0(v), 0, 0
		ps_mul  vv1, vv1, vv1
		lfs     vv2, 8(v)
		ps_madd vv3, vv2, vv2, vv1
	}

	vv8 = 0.5f;

	asm{
		ps_sum0 vv3, vv3, vv1, vv1
		ps_rsqrte vv4, vv3
	}

	vv7 = 3.0f;

	asm {
		fmuls   vv5, vv4, vv4
		fmuls   vv6, vv4, vv8
		fnmsubs vv5, vv5, vv3, vv7
		fmuls   vv4, vv5, vv6
		fsel vv4, vv4, vv4, vv3
		fmuls   vv3, vv3, vv4
	}

	return vv3;
}

//unused
void C_VECDotProduct(){
}

asm float PSVECDotProduct(const register Vector* vec1, const register Vector* vec2) {
	nofralloc
	psq_l fp2, 4(vec1), 0, 0
	psq_l fp3, 4(vec2), 0, 0
	ps_mul fp2, fp2, fp3
	psq_l fp5, 0(vec1), 0, 0
	psq_l fp4, 0(vec2), 0, 0
	ps_madd fp3, fp5, fp4, fp2
	ps_sum0 fp1, fp3, fp2, fp2
	blr
}

//unused
void C_VECCrossProduct(){
}

asm void PSVECCrossProduct(const register Vector* vec1, const register Vector* vec2, register Vector* out) {
	nofralloc
	psq_l fp1, 0(vec2), 0, 0
	lfs fp2, 8(vec1)
	psq_l fp0, 0(vec1), 0, 0
	ps_merge10 fp6, fp1, fp1
	lfs fp3, 8(vec2)
	ps_mul fp4, fp1, fp2
	ps_muls0 fp7, fp1, fp0
	ps_msub fp5, fp0, fp3, fp4
	ps_msub fp8, fp0, fp6, fp7
	ps_merge11 fp9, fp5, fp5
	ps_merge01 fp10, fp5, fp8
	psq_st fp9, 0(out), 1, 0
	ps_neg fp10, fp10
	psq_st fp10, 4(out), 0, 0
	blr
}

//unused
void C_VECHalfAngle(const Vector* a, const Vector* b, Vector* half) {
}

//unused
void C_VECReflect(){
}

//unused
void C_VECSquareDistance(){
}

//unused
asm float PSVECSquareDistance(const register Vector* a, const register Vector* b){
}

//unused
void C_VECDistance(){
}

//unused
void PSVECDistance(){
}
