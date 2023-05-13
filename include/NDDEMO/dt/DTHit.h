#pragma once

#include "types.h"
#include "NDDEMO/Math.h"

class DTHit{
private:
    s8 _step; //0x0
    s8 _room_number; //0x1
    u8 unk2[2];

    //fabricated name
    //Dwarf name: @class$19DTHit_cpp
    struct Hit{
        void* _ground_hit_data; //0x0
        u32 _ground_status; //0x4
        void* _roof_hit_data; //0x8
        u32 _roof_status; //0xC
        void* _wall_hit_data[8]; //0x10
        u32 _wall_status[8]; //0x30
        u8 _wall_wp; //0x50
        u8 unk51[3]; //padding
    };

    Hit _last_hit; //0x4

    //fabricated name
    //Dwarf name: @class$20DTHit_cpp
    struct HitData{
        void* _bgh_top; //0x0
        void* _header_top; //0x4
        u32 _num_of_status; //0x8
        u32* _map_list; //0xC
        float _area_size; //0x10
        u32 _num_of_area[2]; //0x14
        float _area_offset[2]; //0x1C
    };

    HitData _hit_data[8]; //0x58

public:
    get_wall_data__5DTHitFv
    get_wall_status__5DTHitFv
    get_wall_hit_count__5DTHitFv
    get_roof_data__5DTHitFv
    get_roof_status__5DTHitFv
    get_ground_data__5DTHitFv
    get_ground_status__5DTHitFv
    check_wall__5DTHitFP3VecfP3VecSc
    check_roof__5DTHitFP3VecPf
    check_ground__5DTHitFP3VecPf
    get_hit_data__5DTHitFSc
    set_hit_data__5DTHitFScPv
    get_current_room_number__5DTHitFv
    set_current_room_number__5DTHitFSc

    __dt__5DTHitFv
    __ct__5DTHitFv
    __ct__5DTHitFRC5DTHit

private:
    _wall_check_one_area__5DTHitFfScUlP3Vec
    _check_range__5DTHitFP3VecfUlPvSc
    _check_roof_y_pos__5DTHitFP3VecPfPv
    _check_y_pos__5DTHitFP3VecPfPv
};

