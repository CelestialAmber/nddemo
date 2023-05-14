#include "NDDEMO/Math.h"
#include "NDDEMO/da/DAudio.h"
#include "NDDEMO/dg/DGAniModel.h"
#include "NDDEMO/dg/DGCamera.h"
#include "NDDEMO/dg/DGLight.h"
#include "NDDEMO/dg/DGModel.h"
#include "NDDEMO/dg/DGModelMan.h"
#include "NDDEMO/dg/DGRendMan.h"
#include "NDDEMO/dg/DGTexPro.h"
#include "NDDEMO/dt/DTCamera.h"
#include "NDDEMO/dt/DTGimmick.h"
#include "NDDEMO/dt/DTHit.h"
#include "NDDEMO/dt/DTLight.h"
#include "NDDEMO/dt/DTPad.h"
#include "NDDEMO/dt/DTPlayer.h"

class DMainSystem{
private:
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

    struct {
        s8 flag; //0x0
        u8 next_room_no; //0x1
        u8 old_room_no; //0x2
        u8 open_door_no; //0x3
        Vec door_start; //0x4
        Vec door_end; //0x10
    } _go_next_room; //0xa90

public:
    s32 free_mem_size; //0xaac
    DTHit _hit; //0xab0
    DGAniModel* mario_model; //0xc28
    u16 mario_hm; //0xc2c
    u8 unkC2E[2]; //filler?

    struct{
        s8 load_status; //0x0
        u8 unk1[3]; //filler?
        void* datBGH; //0x4
        void* datMCD; //0x8
        DGModel* model[32]; //0xC
        u16 hm[32]; //0x8C
    } stage[8]; //0xc30

    struct{
        s16 film_cnt; //0x0
        u8 unk2[2]; //filler
        DGTexPro* texpro[75]; //0x4
        DGTexPro* star; //0x130
        DGTexPro* hart; //0x134
        DGTexPro* mirrorpro; //0x138
        DGCamera cam[4]; //0x13C
        DGLight light[3]; //0x5EC
        u8 mirrorbuf[0x20000]; //0x6A0

        //These only appear in DTPlayer.cpp in the DWARF info
        //__ct__Q211DMainSystem22@class$149DTPlayer_cppFv
        //__ct__Q211DMainSystem22@class$149DTPlayer_cppFRCQ211DMainSystem22@class$149DTPlayer_cpp
        //__dt__Q211DMainSystem22@class$149DTPlayer_cppFv
    } cinema; //0x1290

    DGRendMan rend_man[2]; //0x21930
    DGModelMan model_man; //0x219c0
    DGFont* sysFont; //0x219d8
    DGFont* title_bg; //0x219dc
    DGFont* movie_icon; //0x219e0
    DGCamera sysCam; //0x219e4
    CSong song[9]; //0x21b10


    DMainSystem(const DMainSystem&);
    DMainSystem();
    ~DMainSystem();

    void MainLoop();
    void _StepProc();
    void iSysInit();
    void iBeforeRender();
    void iDoneRender();
    void GetStageOffset(u8 stage_no, Vec* pos, Vec* rol);
    void iSetFogSw(s8 sw);
    void iCoinDrop();
    DGFont* GetDGFontTitle();
    DTPad* GetDTPad();
    DTCamera* GetDTCamera();
    DTHit* GetDTHit();
    u8 GetStimer();
    u8 GetRoomNumber();
    s8 iGetGameMode();
    void iSystemInitProc();
    s8 iGetOldTvMode();
    Vec GetSpilShadowCamPos();
    s8 iGetMoviePlayMode();
    DGModel* GetStageModel(u8, u8); //dwarf missing param names
    u16 GetStageHandle(u8, u8); //dwarf missing param names
    DGAniModel* GetPlayerModel();
    s8 iIsAllOffCoin();
    void iGoNextRoom(u8 next_stage_no, u8 open_door_no, Vec* door_start, Vec* door_end);
    s8 iCheckReady();
    void iCheckIn();
    void iMpolDoorOpen();
    void iMpolDoorClose();
    void iGoNextPipe(u8 next_stage_no, Vec* pipe_pos, Vec* next_pipe_pos);
    s8 iGetLoadStatus(s8); //dwarf missing param names

private:
    void _Reset();
    void _LoadRequestMpol(s8 mode);
    void _LoadRequestEnve();
    void _LoadRequestSpil();
    void _LoadRequestCine();
    void _LoadRequestCave();
    void _LoadRequestDome();
    void _LoadRequestHang();
    void _LoadRequestEntr();
    void _Draw_Opening();

    void _DelMpol();
    void _DelEnve();
    void _DelSpil();
    void _DelCine();
    void _DelCave();
    void _DelDome();
    void _DelHang();
    void _DelEntr();

    void _Draw_Mpol(s8 mario_flag);
    void _Draw_Enve(s8 mario_flag);
    void _Draw_Spil(s8 mario_flag);
    void _Draw_Cine(s8 mario_flag);
    void _Draw_Cave(s8 mario_flag);
    void _Draw_Dome(s8 mario_flag);
    void _Draw_Hang(s8 mario_flag);
    void _Draw_Entr(s8 mario_flag);

    void _Step_Movie_Mpol();
    void _Step_Movie_Enve();
    void _Step_Movie_Spil();
    void _Step_Movie_Cine();
    void _Step_Movie_Cave();
    void _Step_Movie_Dome();
    void _Step_Movie_Hang();
    void _Step_Movie_Entr();
    void _Step_Movie_All();
    void _Step_Ending();
    void _Step_Opening();
    void _Step_Mpol();
    void _Step_Enve();
    void _Step_Spil();
    void _Step_Cine();
    void _Step_Cave();
    void _Step_Dome();
    void _Step_Hang();
    void _Step_Entr();
    void _Step_Pause_Menu();
    void _Step_Movie_Select_Menu();
    void _Step_Room_Select_Menu();
    void _Step_Main_Menu();
    void _Step_Init_System();

    void _ModifiNumOfCoint();
    void _FreeRequestRoomFile(s8 stage_no);
    void _LoadRequestRoomFile(s8 stage_no);
    void _iConsoleDraw(s8 pas_cnt);
    void _iChangeTvMode();
    void _iSetCaveFog();
    void _iSetKriboPos();
    void _iCinemaProjectionProc();
    void _iSetPlanePos();
    void _iCineProInit();
    void _CheckMoveRoom();
    void _DrawOldStage();
    void _DispNowLoding();
    void _FileManager();
    void _DispSysInfo();
    void _CheckSubMenu();
    s8 _DeleteAllStage();
    void _SetMipMap();
    void _RoomCameraMoveProc();
    void _iSetStagePos(s8 stage_no);
    void _iSetCameraPos(s8 stage_no);
    void _iSetMarioPosRol(s8 stage_no);
    void _CursolMove(s8 max, s16 y);
    void iCheckLoadStatus();
    void _disp_meter();
};
