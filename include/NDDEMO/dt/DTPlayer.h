#pragma once

#include "types.h"
#include "NDDEMO/Math.h"
#include "NDDEMO/dg/DGAniModel.h"
#include "NDDEMO/dg/DGCamera.h"
#include "NDDEMO/dg/DGTexPro.h"

class DTPlayer{
protected:
    DGAniModel* model; //0x0
    u16 anitype; //0x4
    u16 patnum; //0x6
    u16 ani_time; //0x8
    u16 actNo; //0xA
    u16 actCount; //0xC
    u16 actFlag; //0xE
    u16 unkF; //padding
    Vec pos; //0x10
    Vec angle; //0x1C
    s8 stickX; //0x28
    s8 stickY; //0x29
    s8 stick_flag; //0x2A
    u8 unk2B; //padding
    DGTexPro* dummyPro; //0x2C
    DGTexPro* shadowPro; //0x30
    DGCamera shadowCam; //0x34
    u32 shadowSize; //0x160
    u8* shadowTex; //0x164
    DGTexPro* spilshadowPro; //0x168
    DGCamera spilshadowCam; //0x16C
    u8 spilshadowTex; //0x298
    float jumppow; //0x29C
    Vec _door_start; //0x2A0
    Vec _door_end; //0x2AC
    s8 _next_room_number; //0x2B8
    u8 unk2B9[3]; //padding
    u32 _exit_status; //0x2BC
    s8 _ground_hit_flag; //0x2C0
    s8 _dokan_hit_flag; //0x2C1
    u16 _wait_timer; //0x2C2
    u8 unk2C3; //padding
    u8 rolling; //0x2C4
    u8 unk2C5[3]; //padding


    act_movie_spil__8DTPlayerFv
    act_movie_spil_init__8DTPlayerFv
    act_spil__8DTPlayerFv
    act_spil_init__8DTPlayerFv
    act_mpol__8DTPlayerFv
    act_mpol_init__8DTPlayerFv
    act_opening__8DTPlayerFv
    act_opening_init__8DTPlayerFv
    act_go_enter_next__8DTPlayerFv
    act_go_enter_init__8DTPlayerFv
    act_dokan_in__8DTPlayerFv
    act_dokan_in_init__8DTPlayerFv
    act_dokan_out__8DTPlayerFv
    act_dokan_out_init__8DTPlayerFv
    act_open__8DTPlayerFv
    act_open_init__8DTPlayerFv
    act_walk__8DTPlayerFv
    act_walk_init__8DTPlayerFv
    act_idle2__8DTPlayerFv
    act_idle2_init__8DTPlayerFv
    act_idle__8DTPlayerFv
    act_idle_init__8DTPlayerFv
    act_init__8DTPlayerFv

    DirectionalAddPosition__8DTPlayerFR3Vec
    HitFloor__8DTPlayerFv
    Rolling__8DTPlayerFUc

    normalize__8DTPlayerFP3VecP3Vec

    _iSetDoorStartEnd__8DTPlayerFPf
    _iCheckDoor__8DTPlayerFv
    _iPointMove__8DTPlayerFP3Vecf
    _iSetDokanCenter__8DTPlayerFPfPf
    _iCheckDokan__8DTPlayerFv

    GetCamAngle__8DTPlayerFv
    Vec2Angle__8DTPlayerFff
    stickCheck__8DTPlayerFv
    PlayerMove__8DTPlayerFf
    RevAnimation__8DTPlayerFi
    Animation__8DTPlayerFi
    SetAnimation__8DTPlayerFUc

public:
    GetSpilShadowCamPos__8DTPlayerFv
    Action__8DTPlayerFv
    GetSpilShadowPro__8DTPlayerFi
    CreateSpilShadow__8DTPlayerFv
    GetShadowPro__8DTPlayerFi
    CreateShadow__8DTPlayerFv
    GetAngle__8DTPlayerFv
    SetRotation__8DTPlayerF3Vec
    SetPosition__8DTPlayerF3Vec
    GetPosition__8DTPlayerFv
    SpilModeInit__8DTPlayerFv
    MpolModeInit__8DTPlayerFv
    OpeningInit__8DTPlayerFv
    InitAction__8DTPlayerFv

    __dt__8DTPlayerFv
    __ct__8DTPlayerFv
    __ct__8DTPlayerFRC8DTPlayer
};
