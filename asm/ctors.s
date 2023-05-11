.include "macros.inc"

.section .ctors, "wa"  # 0x80063CE0 - 0x80063D00 ; 0x00000020

#__init_cpp_exceptions_reference
.obj __init_cpp_exceptions_reference_, global
	.4byte __init_cpp_exceptions_
	.4byte __sinit_main_cpp
	.4byte __sinit_trigf_c
	.4byte 0
.endobj __init_cpp_exceptions_reference_
