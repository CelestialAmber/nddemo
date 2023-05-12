#ifndef _FLOAT_H
#define _FLOAT_H

#ifdef __cplusplus
extern "C" {
#endif // ifdef __cplusplus

extern int __double_min[];
extern int __double_max[];
extern int __double_epsilon[];
extern int __extended_min[];
extern int __extended_max[];
extern int __extended_epsilon[];
extern int __float_max[];
extern int __float_epsilon[];

#define FLT_MANT_DIG 24
#define FLT_DIG 6
#define FLT_MIN_EXP (-125)
#define FLT_MIN_10_EXP (-37)
#define FLT_MAX_EXP 128
#define FLT_MAX_10_EXP 38

#define FLT_MAX 3.402823466e+38F
#define FLT_EPSILON 1.192092896e-07F
#define FLT_MIN 1.175494351e-38F


#define DBL_MANT_DIG 53
#define DBL_DIG 15
#define DBL_MIN_EXP (-1021)
#define DBL_MIN_10_EXP (-308)
#define DBL_MAX_EXP 1024
#define DBL_MAX_10_EXP 308

#define DBL_MAX (*(double *)__double_max)
#define DBL_EPSILON (*(double*)__double_epsilon)
#define DBL_MIN (*(double*)__double_min)


#define LDBL_MANT_DIG 53
#define LDBL_DIG 15
#define LDBL_MIN_EXP (-1021)
#define LDBL_MIN_10_EXP (-308)
#define LDBL_MAX_EXP 1024
#define LDBL_MAX_10_EXP 308

#define LDBL_MAX (*(long double*)__extended_max)
#define LDBL_EPSILON (* (long double*)__extended_epsilon)
#define LDBL_MIN (*(long double*)__extended_min)

#ifdef __cplusplus
};
#endif // ifdef __cplusplus

#endif
