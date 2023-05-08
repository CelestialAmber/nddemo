.include "macros.s"

.section .sbss, "", @nobits  # 0x800A8DC0 - 0x800A9380 ; 0x000005C0


.global __global_destructor_chain
__global_destructor_chain:
	.skip 0x8

.global __aborting
__aborting:
	.skip 0x4

atexit_curr_func:
	.skip 0x4

__atexit_curr_func:
	.skip 0x4

.global __stdio_exit
__stdio_exit:
	.skip 0x4

.global __console_exit
__console_exit:
	.skip 0x8

"initialized$16":
	.skip 0x8
