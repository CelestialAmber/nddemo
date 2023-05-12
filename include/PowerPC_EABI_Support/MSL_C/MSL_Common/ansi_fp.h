#ifndef _MSL_C_ANSI_FP_H
#define _MSL_C_ANSI_FP_H

#include "types.h"
#include <math.h>
#include <float.h>

#define SIGDIGLEN 36

typedef struct decimal {
	char sign;
	char unk1;
    s16 exp;
	struct {
	    u8 length;
	    u8 text[36];
	    u8 unk41;
	} sig;
} decimal;

typedef struct decform
{
	char style;
	char unk1;
	short digits;
} decform;

void __num2dec(const decform*, double, decimal*);
double __dec2num(const decimal*);

#endif
