#include <math.h>
#include "dolphin/MTX.h"

static float Unit01[] = { 0.0f, 1.0f };

//forces sdata2 order
void dummy(Mtx m){
	m[0][0] = 1.0f;
	m[0][1] = 0.0f;
}

//unused
void C_MTXIdentity(){
}

void PSMTXIdentity(register Mtx m) {
	register float tmp0 = 0.0f;
	register float tmp1 = 1.0f;
	register float tmp2;
	register float tmp3;
	asm{
		psq_st tmp0, 8(m), 0, 0
		ps_merge01 tmp2, tmp0, tmp1
		psq_st tmp0, 24(m), 0, 0
		ps_merge10 tmp3, tmp1, tmp0
		psq_st tmp0, 32(m), 0, 0
		psq_st tmp2, 16(m), 0, 0
		psq_st tmp3, 0(m), 0, 0
		psq_st tmp3, 40(m), 0, 0
	}
}

//unused
void C_MTXCopy(){
}

asm void PSMTXCopy(const register Mtx in, register Mtx out) {
	nofralloc
	psq_l fp0, 0(in), 0, 0
	psq_st fp0, 0(out), 0, 0
	psq_l fp1, 8(in), 0, 0
	psq_st fp1, 8(out), 0, 0
	psq_l fp2, 16(in), 0, 0
	psq_st fp2, 16(out), 0, 0
	psq_l fp3, 24(in), 0, 0
	psq_st fp3, 24(out), 0, 0
	psq_l fp4, 32(in), 0, 0
	psq_st fp4, 32(out), 0, 0
	psq_l fp5, 40(in), 0, 0
	psq_st fp5, 40(out), 0, 0
	blr
}

//unused
void C_MTXConcat(){
}

asm void PSMTXConcat(const register Mtx mA, const register Mtx mB, register Mtx mAB) {
	nofralloc
	stwu r1, -64(r1)
	psq_l fp0, 0(mA), 0, 0
	stfd fp14, 8(r1)
	psq_l fp6, 0(mB), 0, 0
	addis r6, 0, Unit01@ha
	psq_l fp7, 8(mB), 0, 0
	stfd fp15, 16(r1)
	addi r6, r6, Unit01@l
	stfd fp31, 40(r1)
	psq_l fp8, 16(mB), 0, 0
	ps_muls0 fp12, fp6, fp0
	psq_l fp2, 16(mA), 0, 0
	ps_muls0 fp13, fp7, fp0
	psq_l fp31, 0(r6), 0, 0
	ps_muls0 fp14, fp6, fp2
	psq_l fp9, 24(mB), 0, 0
	ps_muls0 fp15, fp7, fp2
	psq_l fp1, 8(mA), 0, 0
	ps_madds1 fp12, fp8, fp0, fp12
	psq_l fp3, 24(mA), 0, 0
	ps_madds1 fp14, fp8, fp2, fp14
	psq_l fp10, 32(mB), 0, 0
	ps_madds1 fp13, fp9, fp0, fp13
	psq_l fp11, 40(mB), 0, 0
	ps_madds1 fp15, fp9, fp2, fp15
	psq_l fp4, 32(mA), 0, 0
	psq_l fp5, 40(mA), 0, 0
	ps_madds0 fp12, fp10, fp1, fp12
	ps_madds0 fp13, fp11, fp1, fp13
	ps_madds0 fp14, fp10, fp3, fp14
	ps_madds0 fp15, fp11, fp3, fp15
	psq_st fp12, 0(mAB), 0, 0
	ps_muls0 fp2, fp6, fp4
	ps_madds1 fp13, fp31, fp1, fp13
	ps_muls0 fp0, fp7, fp4
	psq_st fp14, 16(mAB), 0, 0
	ps_madds1 fp15, fp31, fp3, fp15
	psq_st fp13, 8(mAB), 0, 0
	ps_madds1 fp2, fp8, fp4, fp2
	ps_madds1 fp0, fp9, fp4, fp0
	ps_madds0 fp2, fp10, fp5, fp2
	lfd fp14, 8(r1)
	psq_st fp15, 24(mAB), 0, 0
	ps_madds0 fp0, fp11, fp5, fp0
	psq_st fp2, 32(mAB), 0, 0
	ps_madds1 fp0, fp31, fp5, fp0
	lfd fp15, 16(r1)
	psq_st fp0, 40(mAB), 0, 0
	lfd fp31, 40(r1)
	addi r1, r1, 64
	blr
}

//unused
void C_MTXTranspose(){
}

void PSMTXTranspose(const register Mtx src, register Mtx xPose){
	register float c_zero = 0.0f;
	register float row0a, row1a, row0b, row1b;
	register float trns0, trns1, trns2;

	asm{
		psq_l       row0a, 0(src),  0, 0
		stfs        c_zero, 44(xPose)
		psq_l       row1a, 16(src), 0, 0
		ps_merge00  trns0, row0a, row1a
		psq_l       row0b, 8(src),  1, 0
		ps_merge11  trns1, row0a, row1a
		psq_l       row1b, 24(src), 1, 0
		psq_st      trns0, 0(xPose),  0, 0
		psq_l       row0a, 32(src), 0, 0
		ps_merge00  trns2, row0b, row1b
		psq_st      trns1, 16(xPose), 0, 0
		ps_merge00  trns0, row0a, c_zero
		psq_st      trns2, 32(xPose), 0, 0
		ps_merge10  trns1, row0a, c_zero
		psq_st      trns0, 8(xPose),  0, 0
		lfs         row0b, 40(src)
		psq_st      trns1, 24(xPose), 0, 0
		stfs        row0b, 40(xPose)
	}
}

//unused
void C_MTXInverse(){
}

asm u32 PSMTXInverse(const register Mtx src, register Mtx inv) {
	nofralloc
	psq_l fp0, 0(src), 1, 0
	psq_l fp1, 4(src), 0, 0
	psq_l fp2, 16(src), 1, 0
	ps_merge10 fp6, fp1, fp0
	psq_l fp3, 20(src), 0, 0
	psq_l fp4, 32(src), 1, 0
	ps_merge10 fp7, fp3, fp2
	psq_l fp5, 36(src), 0, 0
	ps_mul fp11, fp3, fp6
	ps_mul fp13, fp5, fp7
	ps_merge10 fp8, fp5, fp4
	ps_msub fp11, fp1, fp7, fp11
	ps_mul fp12, fp1, fp8
	ps_msub fp13, fp3, fp8, fp13
	ps_mul fp10, fp3, fp4
	ps_msub fp12, fp5, fp6, fp12
	ps_mul fp9, fp0, fp5
	ps_mul fp8, fp1, fp2
	ps_sub fp6, fp6, fp6
	ps_msub fp10, fp2, fp5, fp10
	ps_mul fp7, fp0, fp13
	ps_msub fp9, fp1, fp4, fp9
	ps_madd fp7, fp2, fp12, fp7
	ps_msub fp8, fp0, fp3, fp8
	ps_madd fp7, fp4, fp11, fp7
	ps_cmpo0 cr0, fp7, fp6
	bne loc0
	addi r3, 0, 0
	blr
loc0:
	ps_res fp0, fp7
	ps_add fp6, fp0, fp0
	ps_mul fp5, fp0, fp0
	ps_nmsub fp0, fp7, fp5, fp6
	lfs fp1, 12(src)
	ps_muls0 fp13, fp13, fp0
	lfs fp2, 28(src)
	ps_muls0 fp12, fp12, fp0
	lfs fp3, 44(src)
	ps_muls0 fp11, fp11, fp0
	ps_merge00 fp5, fp13, fp12
	ps_muls0 fp10, fp10, fp0
	ps_merge11 fp4, fp13, fp12
	ps_muls0 fp9, fp9, fp0
	psq_st fp5, 0(inv), 0, 0
	ps_mul fp6, fp13, fp1
	psq_st fp4, 16(inv), 0, 0
	ps_muls0 fp8, fp8, f0
	ps_madd fp6, fp12, fp2, fp6
	psq_st fp10, 32(inv), 1, 0
	ps_nmadd fp6, fp11, fp3, fp6
	psq_st fp9, 36(inv), 1, 0
	ps_mul fp7, fp10, fp1
	ps_merge00 fp5, fp11, fp6
	psq_st fp8, 40(inv), 1, 0
	ps_merge11 fp4, fp11, fp6
	psq_st fp5, 8(inv), 0, 0
	ps_madd fp7, fp9, fp2, fp7
	psq_st fp4, 24(inv), 0, 0
	ps_nmadd fp7, fp8, fp3, fp7
	li r3, 1
	psq_st fp7, 44(inv), 1, 0
	blr
}

//unused
void C_MTXInvXpose(){
}

//unused
asm void PSMTXInvXpose(const Mtx, Mtx){
}

//unused
void C_MTXRotRad(){
}

void PSMTXRotRad(Mtx m, char axis, float rad) {
	float sinA, cosA;
	sinA = sinf(rad);
	cosA = cosf(rad);
	PSMTXRotTrig(m, axis, sinA, cosA);
}

//unused
void C_MTXRotTrig(){
}

void PSMTXRotTrig (register Mtx m, register char axis, register float sinA, register float cosA){
    register float fc0, fc1, nsinA;
    register float fw0, fw1, fw2, fw3;

    fc0 = 0.0f;
    fc1 = 1.0f;

    asm{
        ori axis, axis, 0x20
        ps_neg nsinA, sinA
        cmplwi axis, 'x'
        beq _case_x
        cmplwi axis, 'y'
        beq _case_y
        cmplwi axis, 'z'
        beq _case_z
        b _end

    _case_x:
        psq_st fc1, 0(m), 1, 0
        psq_st fc0, 4(m), 0, 0
        ps_merge00 fw0, sinA, cosA
        psq_st fc0, 12(m), 0, 0
        ps_merge00 fw1, cosA, nsinA
        psq_st fc0, 28(m), 0, 0
        psq_st fc0, 44(m), 1, 0
        psq_st fw0, 36(m), 0, 0
        psq_st fw1, 20(m), 0, 0
        b _end;

    _case_y:
        ps_merge00 fw0, cosA, fc0
        ps_merge00 fw1, fc0, fc1
        psq_st fc0, 24(m), 0, 0
        psq_st fw0, 0(m), 0, 0
        ps_merge00 fw2, nsinA, fc0
        ps_merge00 fw3, sinA, fc0
        psq_st fw0, 40(m), 0, 0;
        psq_st fw1, 16(m), 0, 0;
        psq_st fw3, 8(m), 0, 0;
        psq_st fw2, 32(m), 0, 0;
        b _end;

    _case_z:
        psq_st fc0, 8(m), 0, 0
        ps_merge00 fw0, sinA, cosA
        ps_merge00 fw2, cosA, nsinA
        psq_st fc0, 24(m), 0, 0
        psq_st fc0, 32(m), 0, 0
        ps_merge00 fw1, fc1, fc0
        psq_st fw0, 16(m), 0, 0
        psq_st fw2, 0(m), 0, 0
        psq_st fw1, 40(m), 0, 0

    _end:

    }
}

//unused
void C_MTXRotAxisRad(){
}

//unused
void PSMTXRotAxisRad(Mtx m, const Vector* arg2, float arg3) {
}

//unused
void C_MTXTrans(){
}

void PSMTXTrans(register Mtx m, register float _x, register float _y,
				register float _z) {
	register float vv0 = 0.0f;
	register float vv1 = 1.0f;
	asm{
		stfs _x, 12(m)
		stfs _y, 28(m)
		psq_st vv0, 4(m), 0, 0
		psq_st vv0, 32(m), 0, 0
		stfs vv0, 16(m)
		stfs vv1, 20(m)
		stfs vv0, 24(m)
		stfs vv1, 40(m)
		stfs _z, 44(m)
		stfs vv1, 0(m)
	}
}

//unused
void C_MTXTransApply(){
}

//unused
asm void PSMTXTransApply(const register Mtx in, register Mtx out, register float _x, register float _y, register float _z) {
}

//unused
void C_MTXScale(){
}

void PSMTXScale(register Mtx m, register float _x, register float _y, register float _z) {
	register float vv0 = 0.0f;
	asm{
		stfs _x, 0(m)
		psq_st vv0, 4(m), 0, 0
		psq_st vv0, 12(m), 0, 0
		stfs _y, 20(m)
		psq_st vv0, 24(m), 0, 0
		psq_st vv0, 32(m), 0, 0
		stfs _z, 40(m)
		stfs vv0, 44(m)
	}
}

//unused
void C_MTXScaleApply(){
}

//unused
asm void PSMTXScaleApply(const register Mtx in, register Mtx out, register float _x, register float _y, register float _z) {
}

//unused
void C_MTXQuat(){
}

//unused
void PSMTXQuat(register Mtx m, const register PSQuaternion* quat) {
}

//unused
void C_MTXReflect(){
}

//unused
asm void PSMTXReflect(){
}

void C_MTXLookAt(Mtx m, const Vector* _pos, const Vector* _up, const Vector* _dest) {
	Vector vv0, vv1, vv2;
	vv0.x = _pos->x - _dest->x;
	vv0.y = _pos->y - _dest->y;
	vv0.z = _pos->z - _dest->z;
	PSVECNormalize(&vv0, &vv0);
	PSVECCrossProduct(_up, &vv0, &vv1);
	PSVECNormalize(&vv1, &vv1);
	PSVECCrossProduct(&vv0, &vv1, &vv2);
	m[0][0] = vv1.x;
	m[0][1] = vv1.y;
	m[0][2] = vv1.z;
	m[0][3] = -(_pos->x * vv1.x + _pos->y * vv1.y + _pos->z * vv1.z);
	m[1][0] = vv2.x;
	m[1][1] = vv2.y;
	m[1][2] = vv2.z;
	m[1][3] = -(_pos->x * vv2.x + _pos->y * vv2.y + _pos->z * vv2.z);
	m[2][0] = vv0.x;
	m[2][1] = vv0.y;
	m[2][2] = vv0.z;
	m[2][3] = -(_pos->x * vv0.x + _pos->y * vv0.y + _pos->z * vv0.z);
}

void C_MTXLightFrustum(Mtx m, float arg1, float arg2, float arg3, float arg4, float arg5,
float arg6, float arg7, float arg8, float arg9) {
	float tmp = 1.0f / (arg4 - arg3);
	m[0][0] = ((2 * arg5) * tmp) * arg6;
	m[0][1] = 0.0f;
	m[0][2] = (((arg4 + arg3) * tmp) * arg6) - arg8;
	m[0][3] = 0.0f;
	tmp = 1.0f / (arg1 - arg2);
	m[1][0] = 0.0f;
	m[1][1] = ((2 * arg5) * tmp) * arg7;
	m[1][2] = (((arg1 + arg2) * tmp) * arg7) - arg9;
	m[1][3] = 0.0f;
	m[2][0] = 0.0f;
	m[2][1] = 0.0f;
	m[2][2] = -1.0f;
	m[2][3] = 0.0f;
}

//unused
void C_MTXLightPerspective(Mtx m, float arg1, float arg2, float arg3, float arg4,
float arg5, float arg6) {
}

//unused
void C_MTXLightOrtho(Mtx m, float arg2, float arg3, float arg4, float arg5, float arg6, float arg7, float arg8, float arg9) {
}
