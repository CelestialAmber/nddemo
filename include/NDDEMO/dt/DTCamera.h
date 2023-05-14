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
    void move();
    void move(s8, Vec*, float, PADStatus*);
    s8 move(PADStatus*, float*, s8);
    void move(PADStatus*);
    void move(PADStatus*, Vec*, float);
    void move(Vec*, float, Vec*, Vec*);
    void move(Vec*, float, Vec*, s8);
    void move(float, PADStatus*, Vec*);
    s8 iGetMoviePlayMode();
    s8 get_hit_enable_flag();
    void set_hit_enable_flag(s8);
    void* get_bgh_handle();
    void set_bgh_handle(void*);
    void* get_mcd_data(s8);
    s8 set_mcd_data(s8, void*);
    s8 get_current_room_number();
    s8 set_current_room_number(s8);
    void get_mario_view_offset(Vec*, Vec*);
    void set_mario_view_offset(Vec*, Vec*);
    float get_trail_rol_speed();
    void set_trail_rol_speed(float);
    void get_at_offset(float*, float*);
    void set_at_offset(float, float);
    void get_eye_offset(float*, float*);
    void set_eye_offset(float, float);
    float get_movie_lo_speed();
    float get_movie_hi_speed();
    float get_at_speed();
    float get_speed();
    void set_speed(float, float, float, float);
    s8 get_mode();
    s8 set_mode(s8);

    ~DTCamera();
    DTCamera();
    DTCamera(const DTCamera&);

private:
    float _Vec2Angle(float, float);
    void _get_spil_eye_pos(Vec*, Vec*);
    void _get_pipe_at_pos(Vec*, Vec*);
    void _get_pipe_eye_pos(Vec*, float, Vec*);
    vodi init_spline_table(Vec*, s8);
    s8 _check_abs(float, float);
    s8 _check_bg(Vec*);
    void _get_pad_trg(PADStatus*);
    void set_trail_offset(PADStatus*);
    void set_mario_view_sub_rol(PADStatus*);
    void set_mario_view_home_keep(Vec*, float);
    float iabs(float);
    void get_mario_view_home(Vec*, Vec*, Vec*, float);
    s8 go_mario_view_home(Vec*, float);
    void get_next_rotation(float, s8);
    void set_detach_at();
    void set_detach_eye();
    void get_delta(PADStatus*);
    void normalize(Vec*, Vec*);
    float get_spline(float, float, float, float);
    void get_next_at_position(Vec*, Vec*);
    void get_next_position(Vec*, Vec*);
    void shift_pos_r(Vec*, s8);
    void shift_pos(Vec*, s8);
};
