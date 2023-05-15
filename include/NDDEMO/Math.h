#ifndef NDDEMO_MATH_H
#define NDDEMO_MATH_H

#define EPSILON 0.00000001f

struct Vec{
	float x;
	float y;
	float z;

	inline float magnitude(){
		return x*x + y*y + z*z + EPSILON;
	}
};

typedef Vec Point3d;

typedef float Mtx[3][4];
typedef float Mtx44[4][4];

#endif
