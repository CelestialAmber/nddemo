#pragma once

#include "types.h"

//Memory allocation functions
void* mAlloc(size_t blocksize);
void mFree(void* block);

void operator delete(void* block){
	mFree(block);
}
