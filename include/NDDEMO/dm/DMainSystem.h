#include "NDDEMO/Math.h"

class DMainSystem{
public:
    u8 _stimer; //0x0
    u8 _step[2]; //0x1
    u8 _save_step[2]; //0x3
    s8 _cursol_pos[2]; //0x5
    s8 _cursol_wait; //0x7
    s8 _old_stick[2]; //0x8
    s8 _stage_no; //0xA
    s8 _mode_no; //0xB
    s8 _mipmap_mode; //0xC
    s8 _tv_mode; //0xD
    s8 _old_tv_mode; //0xE
    s8 _fog_sw; //0xf
    s8 _movie_camera_rcd; //0x10
    s8 _sys_inf_disp_flag; //0x11
    s8 _meter_disp_flag; //0x12
    s8 _perf0_type; //0x13
    s8 _perf1_type; //0x14
    u8 unk15; //filler?
    s16 _console_step; //0x16
    s8 _route_counter; //0x18
    s8 _old_route_counter; //0x19
    u8 _resetFlag; //0x1a
    u8 _resetButton; //0x1b
    u32 _resetTime; //0x1c
    DTPad _pad; //0x20
    DTCamera _cam; //0x88
    DTLight _light; //0x5b0
    DTGimmick _gim; //0x790
    DTPlayer _player; //0x7c8

    //fabricated name
    //Dwarf name: @class$147DMainSystem_cpp
    struct GoNextRoom{
        s8 flag; //0x0
        u8 next_room_no; //0x1
        u8 old_room_no; //0x2
        u8 open_door_no; //0x3
        Vec door_start; //0x4
        Vec door_end; //0x10
    };

    GoNextRoom _go_next_room; //0xa90
    s32 free_mem_size; //0xaac
    DTHit _hit; //0xab0
    DGAniModel* mario_model; //0xc28
    u16 mario_hm; //0xc2c
    u8 unkC2E[2]; //filler?

    //fabricated name
    //Dwarf name: @class$148DMainSystem_cpp
    struct Stage{
        s8 load_status; //0x0
        u8 unk1[3]; //filler?
        void* datBGH; //0x4
        void* datMCD; //0x8
        DGModel model[32]; //0xC
        u16 hm[32]; //0x8C
    };

    Stage stage[8]; //0xc30

    //fabricated name
    //Dwarf name: @class$149DMainSystem_cpp
    struct Cinema{
        s16 film_cnt; //0x0
        u8 unk2[2]; //filler?
        DGTexPro* texpro[75]; //0x4
        DGTexPro* star; //0x130
        DGTexPro* hart; //0x134
        DGTexPro* mirrorpro; //0x138
        DGCamera cam; //0x13C
        DGLight light; //0x5EC
        u8 mirrorbuf[0x20000]; //0x6A0

        //__ct__Q211DMainSystem22@class$149DTPlayer_cppFv
        Cinema();
        //__ct__Q211DMainSystem22@class$149DTPlayer_cppFRCQ211DMainSystem22@class$149DTPlayer_cpp
        Cinema(const Cinema&);
        //__dt__Q211DMainSystem22@class$149DTPlayer_cppFv
        ~Cinema();
    }

    Cinema cinema; //0x1290
    DGRendMan rend_man; //0x21930
    DGModelMan model_man; //0x219c0
    DGFont* sysFont; //0x219d8
    DGFont* title_bg; //0x219dc
    DGFont* movie_icon; //0x219e0
    DGCamera sysCam; //0x219e4
    CSong song[9]; //0x21b10
};
