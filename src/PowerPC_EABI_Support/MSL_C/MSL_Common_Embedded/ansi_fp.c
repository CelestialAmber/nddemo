#include "PowerPC_EABI_Support/MSL_C/MSL_Common/ansi_fp.h"

static const double bit_values[] ={
	1.0E+001,
	1.0E+002,
	1.0E+004,
	1.0E+008,
	1.0E+016,
	1.0E+032,
	1.0E+064,
	1.0E+128,
	1.0E+256
};

#define max_bits 511

static const double digit_values[] = {
	1.0E+01,
	1.0E+02,
	1.0E+03,
	1.0E+04,
	1.0E+05,
	1.0E+06,
	1.0E+07,
	1.0E+08
};

extern int __double_nan[];
#define Inf	HUGE_VAL
#define NaN	(*(double *)__double_nan)

//float order issues
void __num2dec(const decform *f, double x, decimal *d)
{
	int exp2;
	long exp10;
	int digits = f->digits;
	
	if (digits > DBL_DIG + 1){
		digits = DBL_DIG + 1;
	}
	
	d->sign = 0;
	d->exp = 0;
	
	d->sig.length = 1;
	
	if (x == 0.0)
	{
		d->sig.text[0] = '0';
		return;
	}
	
	if (!isfinite(x))
	{
		d->sig.text[0] = isnan(x) ? 'N' : 'I';
		return;
	}
	
	d->sig.length = 0;
	
	if (x < 0.0)
	{
		d->sign = 1;
		x = -x;
	}
	
	frexp(x, &exp2);
	
	exp10 = (exp2 * 301029) / 1000000;
	
	{
		const double* p = bit_values;
		int n = exp10;
		
		if (n < 0)
		{
			for (n = -n; n; p++, n >>= 1)
				if (n & 1)
					x *= *p;
		}
		else if (n > 0)
		{
			double f = 1.0;
			
			for (; n; p++, n >>= 1){
				if (n & 1){
					f *= *p;
				}
			}
			
			x /= f;
		}
	}
	
	while (x >= 1.0)
	{
		x *= 0.1;
		++exp10;
	}
	
	while (x < 0.1)
	{
		x *= 10.0;
		--exp10;
	}
	
	{
		unsigned char *	p = d->sig.text;
		int i;
		
		while (digits)
		{
			int n = digits;
			long long_x;
			
			if (n > 8){
				n = 8;
			}
			
			digits -= n;
			
			exp10 -= n;
			
			d->sig.length += n;
			
			p += n;
			
			x *= digit_values[n - 1];
			
			long_x = (long)x;
			
			x -= (double)long_x;
			
			for (i = n + 1; --i;)
			{
				*--p = (long_x % 10) + '0';
				long_x /= 10;
			}
			
			p += n;
		}
		
		digits = f->digits;
		
		if (digits > SIGDIGLEN){
			digits = SIGDIGLEN;
		}
		
		digits -= d->sig.length;
		
		if (digits > 0)
		{
			for (i = digits + 1; --i;){
				*p++ = '0';
			}
			
			d->sig.length += digits;
			
			exp10 -= digits;
		}
	}

	d->exp = exp10;
}

//unused
double __dec2num(const decimal* d)
{
}
