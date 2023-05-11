.include "macros.inc"

.section .dtors, "wa"  # 0x80063D00 - 0x80063D20 ; 0x00000020

#__destroy_global_chain_reference
.global __destroy_global_chain_reference_
__destroy_global_chain_reference_:
	.4byte __destroy_global_chain_
	.4byte __fini_cpp_exceptions_
	.4byte __destroy_global_chain_
	.4byte 0
