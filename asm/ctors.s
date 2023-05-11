.include "macros.inc"

.section .ctors, "wa"  # 0x80063CE0 - 0x80063D00 ; 0x00000020


.global __init_cpp_exceptions_reference
__init_cpp_exceptions_reference:
	.4byte __init_cpp_exceptions
