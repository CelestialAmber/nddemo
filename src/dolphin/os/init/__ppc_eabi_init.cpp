#include "dolphin/OS.h"
#include "dolphin/BASE.h"

#ifdef __cplusplus
extern "C" {
#endif

DECL_SECTION(".ctors") extern funcptr_t _ctors[];
DECL_SECTION(".dtors") extern funcptr_t _dtors[];

asm void __init_hardware(void) {
  nofralloc
  mfmsr r0
  ori r0, r0, 0x2000
  mtmsr r0

  mflr r31
  bl __OSPSInit
  bl __OSCacheInit
  mtlr r31
  blr
}

asm void __flush_cache(register void* address, register size_t size) {
	nofralloc
	lis r5,  ~0
	ori r5, r5, ~14
	and r5, r5, r3
	subf r3, r5, r3
	add r4, r4, r3
loop:    
	dcbst r0, r5
	sync
	icbi r0, r5
	addic r5, r5, 8
	subic. r4, r4, 8    
	bge loop
	isync
	blr
}

void __init_user() {
	__init_cpp();
}

void __init_cpp(void) {
  funcptr_t* constructor;

  //call static initializers
	for (constructor = _ctors; *constructor; constructor++) {
		(*constructor)();
	}
}

void _ExitProcess(void) {
	PPCHalt();
}

#ifdef __cplusplus
}
#endif