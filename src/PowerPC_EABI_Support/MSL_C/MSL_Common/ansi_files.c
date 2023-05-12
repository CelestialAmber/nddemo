#include "types.h"
#include "PowerPC_EABI_Support/MSL_C/MSL_Common/ansi_files.h"
#include "PowerPC_EABI_Support/MSL_C/MSL_Common/critical_regions.h"
#include "PowerPC_EABI_Support/MSL_C/MSL_Common/console_io.h"
#include <stdlib.h>
#include <stdio.h>


#define console_buff_mode	_IONBF

#define console_buff_size	1

#define	stdin_buff &__files[0].char_buffer
#define	stdout_buff &__files[1].char_buffer
#define	stderr_buff &__files[2].char_buffer

FILE __files[_STATIC_FILES] = { 
	{
		0,                   // _00
		{
		__must_exist,        // _04, open_mode
		__read,              // _04, io_mode
		console_buff_mode,   // _04, buffer_mode
		__console_file,      // _04, file_kind
		0                    // _04, binary_io
		},
		{
		__neutral,           // _08, io_state
		0,                   // _08, free_buffer
		0,                   // _08, eof
		0                    // _08, error
		},
		//0,                   // _0C
		0,                   // _0D
		0,                   // _0E
		{0, 0},              // _0F
		{0, 0},              // _12
		0,					 // _18
		stdin_buff,          // _1C
		console_buff_size,   // _20
		stdin_buff,          // _24
		0,                   // _28
		0,                   // _2C
		0,                   // _30
		0,                   // _34
		0,                   // _38
		__read_console,      // _3C
		__write_console,     // _40
		__close_console,     // _44
		0,                   // _48
		//&__files[1]          // _4C
	},
	{
		0,                   // _00
		{
		__must_exist,        // _04, open_mode
		__write,             // _04, io_mode
		console_buff_mode,   // _04, buffer_mode
		__console_file,      // _04, file_kind
		0                    // _04, binary_io
		},
		{
		__neutral,           // _08, io_state
		0,                   // _08, free_buffer
		0,                   // _08, eof
		0                    // _08, error
		},
		//0,                   // _0C
		0,                   // _0D
		0,                   // _0E
		{0, 0},              // _0F
		{0, 0},              // _12
		0,					 // _18
		stdout_buff,         // _1C
		console_buff_size,   // _20
		stdout_buff,         // _24
		0,                   // _28
		0,                   // _2C
		0,                   // _30
		0,                   // _34
		0,                   // _38
		__read_console,      // _3C
		__write_console,     // _40
		__close_console,     // _44
		0,                   // _48
		//&__files[2]          // _4C
	},
	{
		0,                   // _00
		{
		__must_exist,        // _04, open_mode
		__write,             // _04, io_mode
		_IONBF,              // _04, buffer_mode
		__console_file,      // _04, file_kind
		0,                   // _04, binary_io
		},
		{
		__neutral,           // _08, io_state
		0,                   // _08, free_buffer
		0,                   // _08, eof
		0,                   // _08, error
		},
		//0,                   // _0C
		0,                   // _0D
		0,                   // _0E
		{0, 0},              // _0F
		{0, 0},              // _12
		0,					 // _18
		stderr_buff,         // _1C
		console_buff_size,   // _20
		stderr_buff,         // _24
		0,                   // _28
		0,                   // _2C
		0,                   // _30
		0,                   // _34
		0,                   // _38
		__read_console,      // _3C
		__write_console,     // _40
		__close_console,     // _44
		0,                   // _48
		//&__files[3]          // _4C
	}
};

//unused
void __close_all(){
}

//unused
u32 __flush_all(){
}
