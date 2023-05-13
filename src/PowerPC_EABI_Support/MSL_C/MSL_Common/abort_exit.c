#include "PowerPC_EABI_Support/MSL_C/MSL_Common/critical_regions.h"
#include <signal.h>

int __aborting = 0;

void __destroy_global_chain(void);
void _ExitProcess(void);

extern void (*_dtors[])(void);


static void (*atexit_funcs[64])(void); //???
static long atexit_curr_func; //???

static void (*__atexit_funcs[64])(void);
static long __atexit_curr_func;

void (*__console_exit)(void);
void (*__stdio_exit)(void);

//unused
void abort(void){
    raise(1);
    __aborting = TRUE;
    exit(1);
}

//unused
void atexit(void){
}

//unused
void __atexit(void){
}


void exit(int status){
	int i;
	void (**dtor)(void);

	if (!__aborting) {
        while(atexit_curr_func > 0){
            atexit_funcs[--atexit_curr_func]();
        }

		__destroy_global_chain();
		dtor = _dtors;
		while (*dtor != NULL) {
			(*dtor)();
			dtor++;
		}
		if (__stdio_exit != NULL) {
			__stdio_exit();
			__stdio_exit = NULL;
		}
	}

	while (__atexit_curr_func > 0){
		__atexit_funcs[--__atexit_curr_func]();
    }

	__kill_critical_regions();
	if (__console_exit != NULL) {

		__console_exit();
		__console_exit = NULL;
	}
	_ExitProcess();
}

//unused
void __exit(void){
}
