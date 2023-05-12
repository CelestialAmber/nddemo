#include "PowerPC_EABI_Support/MSL_C/MSL_Common/mbstring.h"

//unused
void mblen(void){
}

//unused
int mbtowc(wchar_t* pwc, const char* s, size_t n) {
}

//unused
int wctomb(char* s, wchar_t wchar) {
}

//unused
int mbstowcs(wchar_t* pwc, const char* s, size_t n){
}

size_t wcstombs(char* s, const wchar_t* pwcs, size_t n){
	size_t i;

	for(i = 0; i < n; i++){
		if(!(*s++ = *pwcs++)) break;
	}

	return i;
}
