#include "PowerPC_EABI_Support/Runtime/NMWException.h"
#include "PowerPC_EABI_Support/Runtime/__ppc_eabi_linker.h"

static int fragmentID = -2;

extern "C" {
extern void __init_cpp_exceptions(void);
extern void __fini_cpp_exceptions(void);
extern void suspend(void);
}

static asm char* GetR2() {
	nofralloc;
	mr r3, r2
	blr
}

extern void __init_cpp_exceptions(void) {
	char* R2;
	if (fragmentID == -2) {
		
		R2 = GetR2();
	
		fragmentID = __register_fragment(_eti_init_info, R2);
	}
}

extern void __fini_cpp_exceptions(void) {
	if (fragmentID != -2) {
		__unregister_fragment(fragmentID);
		fragmentID = -2;
	}
}

__declspec(section ".ctors") static void* const __init_cpp_exceptions_reference = __init_cpp_exceptions;
__declspec(section ".dtors") static void* const __destroy_global_chain_reference = __destroy_global_chain;
__declspec(section ".dtors") static void* const __fini_cpp_exceptions_reference = __fini_cpp_exceptions;
