#include <math.h>
#include "dolphin/MTX.h"

void C_MTXFrustum(Mtx44 m, float t, float b, float l, float r, float n, float f){
	f32 temp_f8;
    f32 temp_f6;
    f32 temp_f9;
    f32 temp_f11;

    temp_f11 = 1.0f / (r - l);
    temp_f8 = 2.0f * n;
    temp_f9 = 1.0f / (t - b);
    temp_f6 = 1.0f / (f - n);

    m[0][0] = temp_f8 * temp_f11;
    m[0][1] = 0.0f;
    m[0][2] = temp_f11 * (r + l);
    m[0][3] = 0.0f;

    m[1][0] = 0.0f;
    m[1][1] = temp_f8 * temp_f9;
    m[1][2] = temp_f9 * (t + b);
    m[1][3] = 0.0f;

    m[2][0] = 0.0f;
    m[2][1] = 0.0f;
    m[2][2] = -n * temp_f6;
    m[2][3] = temp_f6 * -(f * n);

    m[3][0] = 0.0f;
    m[3][1] = 0.0f;
    m[3][2] = -1.0f;
    m[3][3] = 0.0f;
}

//unused
void C_MTXPerspective(Mtx44 m, float fovY, float aspect, float n, float f){
}

void C_MTXOrtho(Mtx44 m, float t, float b, float l, float r, float n, float f){
	    f32 temp_f8;
    f32 temp_f10;
    f32 temp_f4;

    temp_f10 = 1.0F / (r - l);
    m[0][0] = 2.0F * temp_f10;
    m[0][1] = 0.0F;
    m[0][2] = 0.0F;
    m[0][3] = temp_f10 * -(r + l);

    temp_f8 = 1.0F / (t - b);
    m[1][0] = 0.0F;
    m[1][1] = 2.0F * temp_f8;
    m[1][2] = 0.0F;
    m[1][3] = temp_f8 * -(t + b);

    temp_f4 = 1.0F / (f - n);
    m[2][0] = 0.0F;
    m[2][1] = 0.0F;
    m[2][2] = -1.0F * temp_f4;
    m[2][3] = -f * temp_f4;

    m[3][0] = 0.0F;
    m[3][1] = 0.0F;
    m[3][2] = 0.0F;
    m[3][3] = 1.0F;
}

//unused
void C_MTX44Identity(){
}

//unused
asm void PSMTX44Identity(){
}

//unused
void C_MTX44Copy(){
}

//unused
asm void PSMTX44Copy(){
}

//unused
void C_MTX44Concat(){
}

//unused
asm void PSMTX44Concat(){
}

//unused
void C_MTX44Transpose(){
}

//unused
asm void PSMTX44Transpose(){
}

//unused
void C_MTX44Inverse(){
}

//unused
void C_MTX44Trans(){
}

//unused
asm void PSMTX44Trans(){
}

//unused
void C_MTX44TransApply(){
}

//unused
asm void PSMTX44TransApply(){
}

//unused
void C_MTX44Scale(){
}

//unused
asm void PSMTX44Scale(){
}

//unused
void C_MTX44ScaleApply(){
}

//unused
asm void PSMTX44ScaleApply(){
}

//unused
void C_MTX44RotRad(){
}

//unused
void PSMTXRotRad(Mtx m, char axis, float rad) {
	float sinA, cosA;
	sinA = sinf(rad);
	cosA = cosf(rad);
	PSMTXRotTrig(m, axis, sinA, cosA);
}

//unused
void C_MTX44RotTrig(){
}

//unused
asm void PSMTX44RotTrig(){
}

//unused
void C_MTX44RotAxisRad(){
}

//unused
asm void PSMTX44RotAxisRad(){
}
