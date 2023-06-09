#ifndef NDDEMO_DUMACRO_H
#define NDDEMO_DUMACRO_H

#include "types.h"

//Memory allocation functions
void* mAlloc(size_t blocksize);
void mFree(void* block);

inline void* operator new(size_t blocksize){
	return mAlloc(blocksize);
}

void operator delete(void* block){
	mFree(block);
}

void operator delete[](void* block){
	mFree(block);
}

#define McrFree(block) \
	if(block != nullptr){ \
		delete block; \
		block = nullptr; \
	} \

#define McrDelete(block) \
	if(block != nullptr){ \
		delete block; \
	} \

#endif
