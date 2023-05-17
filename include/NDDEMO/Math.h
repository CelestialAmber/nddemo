#ifndef NDDEMO_MATH_H
#define NDDEMO_MATH_H

#define EPSILON 0.00000001f
#define DEG2RAD 0.017453292f

struct Vec{
	float x;
	float y;
	float z;

	/*
	Vec(float x, float y, float z){
		this->x = x;
		this->y = y;
		this->z = z;
	}
	*/

	inline void set(float x, float y, float z){
		this->x = x;
		this->y = y;
		this->z = z;
	}

	inline float magnitude(){
		return x*x + y*y + z*z + EPSILON;
	}

	Vec& operator+=(const Vec& add){
		x += add.x;
		y += add.y;
		z += add.z;
		return *this;
	}
};

typedef Vec Point3d;

typedef float Mtx[3][4];
typedef float Mtx44[4][4];

#endif
