#include "NDDEMO/du/DUMacro.h"
#include "dolphin/OS.h"

void* mAlloc(size_t blocksize){
	void* new_memory;
	OSThread* current_thread;
	s32 save_priority;
	
	current_thread = OSGetCurrentThread();
	save_priority = OSGetThreadPriority(current_thread);
	OSSetThreadPriority(current_thread, 0xf);
	new_memory = OSAllocFromHeap(0,blocksize);

	if (new_memory == nullptr) {
		OSReport("Heap free %d blocksize %d\n", OSCheckHeap(0), blocksize);
#line 45
		OSError("No memory\n");
	}

	OSSetThreadPriority(current_thread, save_priority);
	return new_memory;
}

void mFree(void* block){
	OSThread* current_thread = OSGetCurrentThread();
	s32 save_priority = OSGetThreadPriority(current_thread);
	OSSetThreadPriority(current_thread,0xf);
	OSFreeToHeap(0,block);
	OSSetThreadPriority(current_thread,save_priority);
}

