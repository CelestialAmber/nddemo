#ifndef _MATH_H
#define _MATH_H

#include "types.h"

#ifdef __cplusplus
extern "C" {
#endif // ifdef __cplusplus

#include "PowerPC_EABI_Support/MSL_C/MSL_Common/math_api.h"

#ifndef __MWERKS__
// Get clangd to shut up about __fabs being undefined.
#define __fabs(x)    (x)
#define __frsqrte(x) (x)
#endif

extern int __float_nan[];
extern int __float_huge[];
extern int __double_huge[];

#define INFINITY (*(float*) __float_huge)	
#define NAN (*(float*) __float_nan)
#define HUGE_VAL (*(double*) __double_huge)


#define FP_NAN 1
#define FP_INFINITE 2
#define FP_ZERO 3
#define FP_NORMAL 4
#define FP_SUBNORMAL 5


inline int __fpclassifyf(float x)
{
	switch ((*(s32*)&x) & 0x7f800000) {
	case 0x7f800000: {
		if ((*(s32*)&x) & 0x007fffff)
			return FP_NAN;
		else
			return FP_INFINITE;
		break;
	}
	case 0: {
		if ((*(s32*)&x) & 0x007fffff)
			return FP_SUBNORMAL;
		else
			return FP_ZERO;
		break;
	}
	}
	return FP_NORMAL;
}
inline int __fpclassifyd(double x)
{
	switch (__HI(x) & 0x7ff00000) {
	case 0x7ff00000: {
		if ((__HI(x) & 0x000fffff) || (__LO(x) & 0xffffffff))
			return FP_NAN;
		else
			return FP_INFINITE;
		break;
	}
	case 0: {
		if ((__HI(x) & 0x000fffff) || (__LO(x) & 0xffffffff))
			return FP_SUBNORMAL;
		else
			return FP_ZERO;
		break;
	}
	}
	return FP_NORMAL;
}

#define fpclassify(x) ((sizeof(x) == sizeof(float)) ? __fpclassifyf((float)(x)) : __fpclassifyd((double)(x)))

#define isfinite(x) ((fpclassify(x) > FP_INFINITE))
#define isnan(x) (fpclassify(x) == FP_NAN)
#define isnormal(x) (fpclassify(x) == FP_NORMAL)

inline long double fabsl(long double x) {
    return  __fabs((double)x);
}


inline double sqrt(double x)
{
	static const double _half  = .5;
	static const double _three = 3.0;
	volatile double y;
	if (x > 0.0f) {

		double guess = __frsqrte(x);                         // returns an approximation to
		guess        = _half * guess * (_three - guess * guess * x); // now have 12 sig bits
		guess        = _half * guess * (_three - guess * guess * x); // now have 24 sig bits
		guess        = _half * guess * (_three - guess * guess * x); // now have 32 sig bits
        guess        = _half * guess * (_three - guess * guess * x); // now have 48 sig bits
		y            = x * guess;
		return y;
	}
	return x;
}

inline float sqrtf(float x)
{
	return (float)sqrt((double)x);
}

double acos(double);
double asin(double);
double atan(double);
double atan2(double, double);
double ceil(double);
double floor(double);
double frexp(double, int *);
double ldexp(double, int);
double pow(double, double);
double log(double);
double log10(double);
double fmod(double, double);
double sin(double x);
double cos(double x);
double tan(double x);
double nan(const char*);

double __ieee754_acos(double);
double __ieee754_fmod(double, double);
double __ieee754_log(double);
double __ieee754_log10(double);
double __ieee754_pow(double, double);
double __ieee754_sqrt(double);
double __ieee754_atan2(double, double);
double __ieee754_asin(double);

double copysign(double, double);
double scalbn(double, int);

double __kernel_sin(double, double, int);
double __kernel_cos(double, double);
double __kernel_tan(double, double, int);

int __ieee754_rem_pio2(double, double *);

float cosf(float);
float sinf(float);
float tanf(float);
double modf(double, double*);
float fabsf(float);

#ifdef __cplusplus
};
#endif // ifdef __cplusplus

#endif
