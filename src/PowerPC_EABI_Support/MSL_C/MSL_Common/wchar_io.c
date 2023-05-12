#include "types.h"

#ifndef _MSL_WIDE_CHAR
#define _MSL_WIDE_CHAR
#endif

#include "PowerPC_EABI_Support/MSL_C/MSL_Common/ansi_files.h"

//unused
void putwc(void){
}

//unused
void putwchar(void){
}

//unused
void fputwc(void){
}

//unused
void getwc(void){
}

//unused
void getwchar(void){
}

//unused
void fgetwc(void){
}

//unused
void ungetwc(void){
}

//unused
void fputws(void){
}

//unused
void fgetws(void){
}

int fwide(FILE* stream, int mode)
{
	int orientation;

	if (stream->mode.file_kind == __closed_file)
		return 0;

	orientation = stream->mode.file_orientation;
	switch (orientation) {
	case __unoriented:
		if (mode > 0)
			stream->mode.file_orientation = __wide_oriented;
		else if (mode < 0)
			stream->mode.file_orientation = __char_oriented;

		return mode;

	case __wide_oriented:
		return 1;

	case __char_oriented:
		return -1;
	}
}
