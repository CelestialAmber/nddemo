.include "macros.s"

.section .dtors, "wa"  # 0x80063D00 - 0x80063D20 ; 0x00000020


.global __destroy_global_chain_reference
__destroy_global_chain_reference:

	# ROM: 0x60D00
	.4byte __destroy_global_chain
	.4byte __fini_cpp_exceptions
	.4byte __destroy_global_chain
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
	.4byte 0
