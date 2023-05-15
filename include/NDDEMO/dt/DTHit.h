#ifndef NDDEMO_DTHIT_H
#define NDDEMO_DTHIT_H

#include "types.h"
#include "NDDEMO/Math.h"

class DTHit{
private:
	s8 _step; //0x0
	s8 _room_number; //0x1
	u8 unk2[2]; //padding

	struct{
		void* _ground_hit_data; //0x0
		u32 _ground_status; //0x4
		void* _roof_hit_data; //0x8
		u32 _roof_status; //0xC
		void* _wall_hit_data[8]; //0x10
		u32 _wall_status[8]; //0x30
		u8 _wall_wp; //0x50
		u8 unk51[3]; //padding
	} _last_hit; //0x4

	struct{
		void* _bgh_top; //0x0
		void* _header_top; //0x4
		u32 _num_of_status; //0x8
		u32* _map_list; //0xC
		float _area_size; //0x10
		u32 _num_of_area[2]; //0x14
		float _area_offset[2]; //0x1C
	} _hit_data[8]; //0x58

public:
	DTHit(const DTHit&);
	DTHit();
	~DTHit();

	s8 set_current_room_number(s8 room_number);
	s8 get_current_room_number();
	s8 set_hit_data(s8 room_number, void* hit_data_address);
	void* get_hit_data(s8 room_number);
	s8 check_ground(Vec* check_position, float* graund_y); //typo
	s8 check_roof(Vec* check_position, float* roof_y);
	s8 check_wall(Vec* check_position, float range, Vec* new_position, s8 camera_flag);
	u32 get_ground_status();
	void* get_ground_data();
	u32 get_roof_status();
	void* get_roof_data();
	u8 get_wall_hit_count();
	u32* get_wall_status();
	void* get_wall_data();

private:
	s8 _wall_check_one_area(float range, s8 camera_flag, u32 area_index, Vec* ans_pos);
	s8 _check_range(Vec* pos, float range, u32 status_id, void* hit, s8 camera_flag);
	s8 _check_roof_y_pos(Vec* check_position, float* roof_y, void* hit);
	s8 _check_y_pos(Vec* check_position, float* graund_y, void* hit); //typo
};

#endif
