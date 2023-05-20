#ifndef NDDEMO_DTCAMERA_H
#define NDDEMO_DTCAMERA_H

#include "types.h"
#include "dolphin/PAD.h"
#include "NDDEMO/Math.h"
#include "NDDEMO/dg/DGCamera.h"

class DTCamera : public DGCamera{
private:
	s8 _mode; //0x12C
	s8 _step; //0x12D
	s8 _movie_play_mode; //0x12E
	u8 unk12F; //padding

	struct{
		float _t[2]; //0x0
		float _pos[2][3][3]; //0x8
		float _speed[2]; //0x50
	} _spline; //0x130

	struct{
		float _eye_hight; //0x0
		float _eye_distance; //0x4
		float _at_hight; //0x8
		float _at_distance; //0xC
	} _offset; //0x188


	struct{
		float _rol_speed; //0x0
		float _target_y_rol; //0x4
		float _rol_offset; //0x8
		float _hight_offset; //0xC
		Vec oi_pos[2]; //0x10
		float oi_speed; //0x28
		s8 oi_counter; //0x2C
		u8 unk2D; //padding
		u16 old_button; //0x2E
	} _trail; //0x198

	struct{
		Vec _main_stick; //0x0
		Vec _sub_stick; //0xC
		Vec _delta; //0x18
		Vec _at_offset; //0x24
		Vec _eye_pos; //0x30
		float _rotation[3]; //0x3C
		Vec _axis; //0x48
	} _detach; //0x1C8

	struct{
		Vec _eye_offset; //0x0
		Vec _at_offset; //0xC
		float _old_mario_angle; //0x18
		float _up_angle; //0x1C
	} _mario_view; //0x21C

	struct{
		s8 _current_room; //0x0
		u8 unk1[3]; //padding
		float _speed; //0x4
		float _slow_speed; //0x8
		void* _mcd_top[16]; //0xC
		void* _read_p[2][16]; //0x4C
		void* _data_top_p[2][16]; //0xCC
		void* _data_bottom_p[2][16]; //0x14C
		u32 _num_of_point[2][16]; //0x1CC
		u32 _current_point[2][16]; //0x24C
	} _movie; //0x23C

	struct{
		u16 _old; //0x0
		u16 _trg; //0x2
	} _pad; //0x408

	struct{
		s8 _enable_flag; //0x0
		s8 _wall_hit_flag; //0x1
		u8 unk2[2]; //padding
		void* _bgh; //0x4
		float _offset; //0x8
		float _range; //0xC
	} _hit; //0x50C

	struct{
		s8 mode; //0x0
		s8 old_mode; //0x1
		u8 unk2[2]; //padding
		float speed[2]; //0x4
	} _spil; //0x51C

public:
	DTCamera(const DTCamera&);
	DTCamera();
	~DTCamera();

	s8 set_mode(s8 new_mode);
	s8 get_mode();
	void set_speed(float speed, float at_speed, float movie_hi_speed, float movie_lo_speed);
	float get_speed();
	float get_at_speed();
	float get_movie_hi_speed();
	float get_movie_lo_speed();
	void set_eye_offset(float eye_hight, float eye_distance);
	void get_eye_offset(float* eye_hight, float* eye_distance);
	void set_at_offset(float at_hight, float at_distance);
	void get_at_offset(float* at_hight, float* at_distance);
	void set_trail_rol_speed(float rol_speed);
	float get_trail_rol_speed();
	void set_mario_view_offset(Vec* eye_offset, Vec* at_offset);
	void get_mario_view_offset(Vec* eye_offset, Vec* at_offset);
	s8 set_current_room_number(s8 set_current_room_number);
	s8 get_current_room_number();
	s8 set_mcd_data(s8 room_number, void* mcd_data_address);
	void* get_mcd_data(s8 room_number);
	void set_bgh_handle(void* bgh_handle);
	void* get_bgh_handle();
	void set_hit_enable_flag(s8 enable_flag);
	s8 get_hit_enable_flag();
	s8 iGetMoviePlayMode();
	void move(float mario_angle, PADStatus* pad, Vec* mario_position);
	void move(Vec* mario_position, float mario_angle, Vec* pipe_position, s8 mode); //1st param name is missing in dwarf
	void move(Vec* mario_position, float mario_angle, Vec*, Vec*); //last 2 param names aren't in dwarf
	void move(PADStatus* pad, Vec* mario_position, float mario_angle);
	void move(PADStatus* pad);
	s8 move(PADStatus* pad, float* t, s8 pause_mode);
	void move(s8 game_mode, Vec* mario_position, float mario_angle, PADStatus* pad);
	void move();

private:
	float _Vec2Angle(float x, float z);
	void _get_spil_eye_pos(Vec* mario_position, Vec* next_position);
	void _get_pipe_at_pos(Vec* pipe_position, Vec* next_position);
	void _get_pipe_eye_pos(Vec* pipe_position, float mario_angle, Vec* next_position);
	void init_spline_table(Vec* pos, s8 eyeat);
	s8 _check_abs(float a, float b);
	s8 _check_bg(Vec* pos);
	void _get_pad_trg(PADStatus* pad);
	void set_trail_offset(PADStatus* pad);
	void set_mario_view_sub_rol(PADStatus* pad);
	void set_mario_view_home_keep(Vec* mario_position, float mario_angle);
	float iabs(float value);
	void get_mario_view_home(Vec* home_eye_position, Vec* home_at_position, Vec* mario_position, float mario_angle);
	s8 go_mario_view_home(Vec* mario_position, float mario_angle);
	void get_next_rotation(float mario_angle, s8 stick_flag);
	void set_detach_at();
	void set_detach_eye();
	void get_delta(PADStatus* pad);
	void normalize(Vec* src, Vec* dst);
	float get_spline(float t, float p0, float p1, float p2);
	void get_next_at_position(Vec* next_position, Vec* mario_position);
	void get_next_position(Vec* next_position, Vec* mario_position);
	void shift_pos_r(Vec* next_position, s8 eyeat);
	void shift_pos(Vec* next_position, s8 eyeat);
};

#endif
