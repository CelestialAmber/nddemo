#pragma once

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
    void* get_wall_data();
    u32* get_wall_status();
    u8 get_wall_hit_count();
    void* get_roof_data();
    u32 get_roof_status();
    void* get_ground_data();
    u32 get_ground_status();
    s8 check_wall(Vec*, float, Vec*, s8);
    s8 check_roof(Vec*, float*);
    s8 check_ground(Vec*, float*);
    void* get_hit_data(s8);
    s8 set_hit_data(s8, void*);
    s8 get_current_room_number();
    s8 set_current_room_number(s8);

    ~DTHit();
    DTHit();
    DTHit(const DTHit&);

private:
    s8 _wall_check_one_area(float, s8, u32, Vec*);
    s8 _check_range(Vec*, float, u32, void*, s8);
    s8 _check_roof_y_pos(Vec*, float*, void*);
    s8 _check_y_pos(Vec*, float*, void*);
};

