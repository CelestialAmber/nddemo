#pragma once

#include "types.h"
#include "dolphin/PAD.h"
#include "NDDEMO/Math.h"
#include "NDDEMO/dg/DGCamera.h"

class DTCamera : DGCamera{
private:
    s8 _mode; //0x12C
    s8 _step; //0x12D
    s8 _movie_play_mode; //0x12E
    u8 unk12F; //padding

    //fabricated name
    //Dwarf name: @class$118DTCamera_cpp
    struct Spline{
        float _t[2]; //0x0
        float _pos[2][3][3]; //0x8
        float _speed[2]; //0x50
    };

    Spline _spline; //0x130

    //fabricated name
    //Dwarf name: @class$119DTCamera_cpp
    struct Offset{
        float _eye_hight; //0x0
        float _eye_distance; //0x4
        float _at_hight; //0x8
        float _at_distance; //0xC
    };

    Offset _offset; //0x188

    //fabricated name
    //Dwarf name: @class$120DTCamera_cpp
    struct Trail{
        float _rol_speed; //0x0
        float _target_y_rol; //0x4
        float _rol_offset; //0x8
        float _hight_offset; //0xC
        Vec oi_pos[2]; //0x10
        float oi_speed; //0x28
        s8 oi_counter; //0x2C
        u8 unk2D; //padding
        u16 old_button; //0x2E
    };

    Trail _trail; //0x198

    //fabricated name
    //Dwarf name: @class$121DTCamera_cpp
    struct Detach{
        Vec _main_stick; //0x0
        Vec _sub_stick; //0xC
        Vec _delta; //0x18
        Vec _at_offset; //0x24
        Vec _eye_pos; //0x30
        float _rotation[3]; //0x3C
        Vec _axis; //0x48
    };

    Detach _detach; //0x1C8

    //fabricated name
    //Dwarf name: @class$122DTCamera_cpp
    struct MarioView{
        Vec _eye_offset; //0x0
        Vec _at_offset; //0xC
        float _old_mario_angle; //0x18
        float _up_angle; //0x1C
    };

    MarioView _mario_view; //0x21C

    //fabricated name
    //Dwarf name: @class$123DTCamera_cpp
    struct Movie{
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
    };

    Movie _movie; //0x23C

    //fabricated name
    //Dwarf name: @class$124DTCamera_cpp
    struct Pad{
        u16 _old; //0x0
        u16 _trg; //0x2
    };

    Pad _pad; //0x408

    //fabricated name
    //Dwarf name: @class$125DTCamera_cpp
    struct Hit{
        s8 _enable_flag; //0x0
        s8 _wall_hit_flag; //0x1
        u8 unk2[2]; //padding
        void* _bgh; //0x4
        float _offset; //0x8
        float _range; //0xC
    };

    Hit _hit; //0x50C

    //fabricated name
    //Dwarf name: @class$126DTCamera_cpp
    struct Spil{
        s8 mode; //0x0
        s8 old_mode; //0x1
        u8 unk2[2]; //padding
        float speed[2]; //0x4
    };

    Spil _spil; //0x51C

public:
    move__8DTCameraFv
    move__8DTCameraFScP3VecfP9PADStatus
    move__8DTCameraFP9PADStatusPfSc
    move__8DTCameraFP9PADStatus
    move__8DTCameraFP9PADStatusP3Vecf
    move__8DTCameraFP3VecfP3VecP3Vec
    move__8DTCameraFP3VecfP3VecSc
    move__8DTCameraFfP9PADStatusP3Vec
    iGetMoviePlayMode__8DTCameraFv
    get_hit_enable_flag__8DTCameraFv
    set_hit_enable_flag__8DTCameraFSc
    get_bgh_handle__8DTCameraFv
    set_bgh_handle__8DTCameraFPv
    get_mcd_data__8DTCameraFSc
    set_mcd_data__8DTCameraFScPv
    get_current_room_number__8DTCameraFv
    set_current_room_number__8DTCameraFSc
    get_mario_view_offset__8DTCameraFP3VecP3Vec
    set_mario_view_offset__8DTCameraFP3VecP3Vec
    get_trail_rol_speed__8DTCameraFv
    set_trail_rol_speed__8DTCameraFf
    get_at_offset__8DTCameraFPfPf
    set_at_offset__8DTCameraFff
    get_eye_offset__8DTCameraFPfPf
    set_eye_offset__8DTCameraFff
    get_movie_lo_speed__8DTCameraFv
    get_movie_hi_speed__8DTCameraFv
    get_at_speed__8DTCameraFv
    get_speed__8DTCameraFv
    set_speed__8DTCameraFffff
    get_mode__8DTCameraFv
    set_mode__8DTCameraFSc

    __dt__8DTCameraFv
    __ct__8DTCameraFv
    __ct__8DTCameraFRC8DTCamera

private:
    _Vec2Angle__8DTCameraFff
    _get_spil_eye_pos__8DTCameraFP3VecP3Vec
    _get_pipe_at_pos__8DTCameraFP3VecP3Vec
    _get_pipe_eye_pos__8DTCameraFP3VecfP3Vec
    init_spline_table__8DTCameraFP3VecSc
    _check_abs__8DTCameraFff
    _check_bg__8DTCameraFP3Vec
    _get_pad_trg__8DTCameraFP9PADStatus
    set_trail_offset__8DTCameraFP9PADStatus
    set_mario_view_sub_rol__8DTCameraFP9PADStatus
    set_mario_view_home_keep__8DTCameraFP3Vecf
    iabs__8DTCameraFf
    get_mario_view_home__8DTCameraFP3VecP3VecP3Vecf
    go_mario_view_home__8DTCameraFP3Vecf
    get_next_rotation__8DTCameraFfSc
    set_detach_at__8DTCameraFv
    set_detach_eye__8DTCameraFv
    get_delta__8DTCameraFP9PADStatus
    normalize__8DTCameraFP3VecP3Vec
    get_spline__8DTCameraFffff
    get_next_at_position__8DTCameraFP3VecP3Vec
    get_next_position__8DTCameraFP3VecP3Vec
    shift_pos_r__8DTCameraFP3VecSc
    shift_pos__8DTCameraFP3VecSc
};
