#include "NDDEMO/dm/DMainSystem.h"
#include "NDDEMO/du/DUMacro.h"
#include "dolphin/GX.h"
#include "dolphin/OS.h"
#include <string.h>

static OSStopwatch SwMsec;
static float MSecGX;
static float iMSecGX;
static float MSecCPU;
static u32 triCnt;
static u32 verCnt;

struct iBGTHREAD{
	OSThread SMThread; //0x0
	u8 SMThreadStack[4096]; //0x310
	u8 request_flag[128]; //0x1310
	u16 request_file_number[128]; //0x1390
	s8 request_stage_no[128]; //0x1490
	s8 request_model_no[128]; //0x1510
	s16 read_p; //0x1590
	s16 write_p; //0x1592
	struct{
		s8 wait_count; //0x0
		s16 wait_table[128]; //0x2
	} stage[8]; //0x1594
	u8 delete_flag[9]; //0x1da4
};

iBGTHREAD bgThread;

//unused
GXRenderModeObj irmode;

static GXRenderModeObj irmodeobj;

//unused
static void* iDemoFrameBuffer1;
static void* iDemoFrameBuffer2;
static void* iDemoCurrentBuffer;
static void* iDefaultFifo;
static GXFifoObj* iDefaultFifoObj;
static s8 FirstFrame;

u8 bg_stimer;

//unused
static u16 token_id;
static u16 old_token_id;
static u16 token_timer;

static const char* iFileNameData[34] = {
	"ARROW.NDM",
	"STG_ENTR.NDM",
	"STG_ENTR.BGH",
	"STG_ENTR.MCD",
	"STG_HANG.NDM",
	"STG_HANG.BGH",
	"STG_HANG.MCD",
	"BIPLANE.NDM",
	"STG_DOME.NDM",
	"STG_DOME.BGH",
	"STG_DOME.MCD",
	"STG_CAVE.NDM",
	"STG_CAVE.BGH",
	"STG_CAVE.MCD",
	"KURIBO.NDM",
	"STG_CINE.NDM",
	"STG_CINE.BGH",
	"STG_CINE.MCD",
	"MARIO00",
	"T_STAR",
	"T_HART",
	"STG_SPIL.NDM",
	"STG_SPIL.BGH",
	"STG_SPIL.MCD",
	"STG_ENVE.NDM",
	"STG_ENVE.BGH",
	"STG_ENVE.MCD",
	"STG_MPOL.NDM",
	"STG_MPOL.BGH",
	"STG_MPOL.MCD",
	"MPOL_CAM.MCD",
	"COIN.NDM",
	"STG_OPEN.NDM",
	"STG_OPEN.MCD"
};

static const char* songFilenameTable[9] = {
	"audio/gcdemo.sng",
	"audio/entrance.sng",
	"audio/dome.sng",
	"audio/spiral.sng",
	"audio/hangar.sng",
	"audio/cave.sng",
	"audio/cinema.sng",
	"audio/metal.sng",
	"audio/coins.sng"
};

static s8 iCourseData[11] = {
	0,
	2,
	5,
	1,
	3,
	0,
	4,
	6,
	7,
	0,
	0xFF
};

typedef struct _StructPerf{
	u8 type; //0x0
	char text[11];
} StructPerf;

StructPerf stPerf0[23] = {
	{11, "TRIANGLES"},
	{0, "VERTICES "},
	{1, "CLIP_VTX "},
	{2, "CLIP_CLK "},
	{3, "XF_WAITIN"},
	{4, "XFWAITOUT"},
	{5, "XF_XFRM  "},
	{6, "XF_LIT   "},
	{7, "XF_BOT   "},
	{8, "XF_REGLD "},
	{9, "XF_REGRD "},
	{10, "CLIPRATIO"},
	{12, "TRI_CULL "},
	{13, "TRI_PASS "},
	{14, "TRI_SCISS"},
	{27, "QUAD_0CVG"},
	{28, "QUADNOCVG"},
	{29, "QUAD_1CVG"},
	{30, "QUAD_2CVG"},
	{31, "QUAD_3CVG"},
	{32, "QUAD_4CVG"},
	{33, "AVG_QUAD "},
	{35, ""}
};

StructPerf stPerf1[22] = {
	{16, "VERTICES "},
	{0, "TEXELS   "},
	{1, "TX_IDLE  "},
	{2, "TX_REGS  "},
	{3, "TX_MEMSTL"},
	{4, "TCCHECK12"},
	{5, "TCCHECK34"},
	{6, "TCCHECK56"},
	{7, "TCCHECK78"},
	{8, "TC_MISS  "},
	{9, "VC_ELEMQ "},
	{10, "VC_MISSQ "},
	{11, "VC_MEMREQ"},
	{12, "VC_STAT7 "},
	{13, "VCMISSREP"},
	{14, "VCSTRMLOW"},
	{15, "VCALLSTAT"},
	{17, "FIFO_REQ "},
	{18, "CALL_REQ "},
	{19, "VC_MISSRQ"},
	{20, "CP_ALLREQ"},
	{22, ""}
};

static void DrawFrameBar(float mSecCPU, float mSecGX);
static s16 iBgLoadRequest(u16 file_no, u8 request_flag, s8 stage_no, s8 model_no);
static s8 iBgCheckLoadEnd(s8 stg_no);


DMainSystem::DMainSystem() : model_man(16, 512, 2048) {
	_stimer = 0;
	_step[0] = 0;
	_step[1] = 0;

	for(s8 i = 0; i < 8; i++){
		stage[i].load_status = 0;
		stage[i].datBGH = NULL;
		stage[i].datMCD = NULL;

		for(s8 j = 0; j < 0x20; j++){
			stage[i].model[j] = NULL;
			stage[i].hm[j] = 0;
		}
	}

	mario_model = NULL;
	mario_hm = 0;
	_mipmap_mode = 2;
	_tv_mode = 4;
	_old_tv_mode = _tv_mode;
	_console_step = 0;
	_route_counter = 0;
	_old_route_counter = _route_counter;
	free_mem_size = 0;
	_perf0_type = 0;
	_perf1_type = 0;
	_resetButton = 0;
	_resetFlag = 0;
	_resetTime = OSTicksToMicroseconds(OSGetTime());
	DGObject::lineMode = 0;
}

DMainSystem::~DMainSystem(){
}

void DMainSystem::MainLoop(){
    GXSetCurrentGXThread();

    while(true){
		//Wait for vblank
        if(!v_flag) continue;

        v_flag = false;

		//Start the stopwatch
        OSStartStopwatch(&SwMsec);

		//Read controller inputs
        _pad.Read();

        dm->rend_man[0].DrawBegin();

        GXClearGPMetric();
        GXSetGPMetric(stPerf0[_perf0_type].type, stPerf1[_perf1_type].type);

		//Perform a game state step
        _StepProc();

        if (_pad.IsTrg(PAD_CHAN0,PAD_BUTTON_Y)) {
            if ((s32)DGObject::lineMode != 0) DGObject::lineMode = 0;
            else DGObject::lineMode = 1;
        }

		//Check if the reset button combo was entered
        if (_pad.IsPush(PAD_CHAN0, PAD_BUTTON_START | PAD_BUTTON_X | PAD_BUTTON_B)) {
			//If 
			if (_resetFlag == 0) {
				_resetTime = OSTicksToMicroseconds(OSGetTime());
            	_resetFlag++;
			}
		}else if (_resetFlag == 1) {
			u32 curTime = OSTicksToMicroseconds(OSGetTime());
			//If the button combo was entered before, and it's been at least 0.5s since the last reset,
			//queue a reset (resetFlag = 2)
            if (curTime - _resetTime > 500000) {
				_resetFlag++;
			}else{
                if (OSGetResetSwitchState()) {
                    _resetFlag = 0;
                }
            }
        }

        if (_resetButton == 0) {
            if (OSGetResetSwitchState()) {
                _resetButton++;
            }
        }else if (_resetButton == 1 && !OSGetResetSwitchState()) {
            _resetFlag = 2;
        }

		//If the requirements for a reset are met (resetFlag == 2), reset
        if (_resetFlag == 2) {
            _Reset();
        }

        if (_old_tv_mode == 6 || _old_tv_mode == 8) {
            _cam.SetCameraFrustumUpper(1.5f, 2, 2, 1024);

            rend_man[1].Draw(RMDM_MORE);
            rend_man[0].Draw(RMDM_MORE);

            _gim.TitleAction();
            _iConsoleDraw(0);
            rend_man[0].CopyRenderingBuffer(0);

            iMSecGX = MSecGX;

            _cam.SetCameraFrustumLower(1.5f, 2, 2, 1024, rend_man[0].GetxfbHeight());
            
			rend_man[1].Draw(RMDM_ONCE);
            rend_man[0].Draw(RMDM_ONCE);
            
			_iConsoleDraw(1);

            if(_sys_inf_disp_flag) _DispSysInfo();

            MSecGX = MSecGX + iMSecGX;

            if(_meter_disp_flag) _disp_meter();

            rend_man[0].CopyRenderingBuffer(1);
            rend_man[0].DrawEnd(false, false);

            _cam.SetCameraFrustumUpper(1.5f, 2, 2, 1024);
        } else {
            rend_man[1].Draw(RMDM_ONCE);
            rend_man[0].Draw(RMDM_ONCE);

            _gim.TitleAction();

            _iConsoleDraw(0);

            if (_sys_inf_disp_flag) _DispSysInfo();
            if (_meter_disp_flag) _disp_meter();

            rend_man[0].DrawEnd(true, false);
        }

        _iChangeTvMode();

		//Stop the stopwatch, and reset it
        OSStopStopwatch(&SwMsec);
        OSResetStopwatch(&SwMsec);

        _stimer++;

        OSSuspendThread(&dmThread);
    }
}

void DMainSystem::_Reset(){
	u32 cnt;
    u8* xfb = (u8*)DGRendMan::m_CurrentBuf;
    audio.ResetFade();
    OSReport("xfb %X\n", xfb);


    u8* ptr = xfb;

    for(u32 i = 0; i < 480; i += 2){
		for(u32 j = 0; j < 1280; j += 2){
            ptr[j] = 0;
        }

        ptr += 640 * 4;
    }

    for(cnt = 0; cnt < 50; cnt++){
        VIWaitForRetrace();
        DCStoreRange(xfb,0x96000);
        VISetNextFrameBuffer(xfb);
        VIFlush();
    }

    audio.Quit();
    GXDrawDone();
    VISetBlack(true);
    VIFlush();
    VIWaitForRetrace();
    OSResetSystem(0,0,0);
}


void DMainSystem::_StepProc(){
	//Execute the step function corresponding the the first value in the _step array
	switch(_step[0]){
		case STEP_INIT_SYS:
		_Step_Init_System();
		break;
		case STEP_MAIN_MENU:
		_Step_Main_Menu();
		break;
		case STEP_ROOM_SELECT_MENU:
		_Step_Room_Select_Menu();
		break;
		case STEP_MOVIE_SELECT_MENU:
		_Step_Movie_Select_Menu();
		break;
		case STEP_PAUSE_MENU:
		_Step_Pause_Menu();
		break;
		case STEP_ENTR:
		_Step_Entr();
		break;
		case STEP_HANG:
		_Step_Hang();
		break;
		case STEP_DOME:
		_Step_Dome();
		break;
		case STEP_CAVE:
		_Step_Cave();
		break;
		case STEP_CINE:
		_Step_Cine();
		break;
		case STEP_SPIL:
		_Step_Spil();
		break;
		case STEP_ENVE:
		_Step_Enve();
		break;
		case STEP_MPOL:
		_Step_Mpol();
		break;
		case STEP_OPENING:
		_Step_Opening();
		break;
		case STEP_ENDING:
		_Step_Ending();
		break;
		case STEP_MOVIE_ALL:
		_Step_Movie_All();
		break;
		case STEP_MOVIE_ENTR:
		_Step_Movie_Entr();
		break;
		case STEP_MOVIE_HANG:
		_Step_Movie_Hang();
		break;
		case STEP_MOVIE_DOME:
		_Step_Movie_Dome();
		break;
		case STEP_MOVIE_CAVE:
		_Step_Movie_Cave();
		break;
		case STEP_MOVIE_CINE:
		_Step_Movie_Cine();
		break;
		case STEP_MOVIE_SPIL:
		_Step_Movie_Spil();
		break;
		case STEP_MOVIE_ENVE:
		_Step_Movie_Enve();
		break;
		case STEP_MOVIE_MPOL:
		_Step_Movie_Mpol();
		break;
	}
}

void DMainSystem::_Step_Init_System(){
	if((s32)_step[1] == 0){
		//Set the console step state to init sys
		_console_step = STEP_INIT_SYS;
		_stage_no = 6;
		_mode_no = 4;
		//Set the step state to the opening state
		_step[0] = STEP_OPENING;
		_step[1] = 0;
		_cursol_pos[1] = _cursol_pos[0];
		_cursol_pos[0] = 0;
	}
}

void DMainSystem::iSystemInitProc(){
	s16 i; //r5
	Vec camup; //r1_60
	Vec campos; //r1_54
	Vec camtagpos; //r1_48
	GXColor fogcolor; //r1_44
}

void DMainSystem::_Step_Main_Menu(){
}

void DMainSystem::_DispSysInfo(){
	char buf[256]; //r1_c
	s8 i; //r27
	s16 y; //r1_8
	
	sysFont->Begin(rend_man);

	if(_old_tv_mode == 6 || _old_tv_mode == 8){
		y = -240;
	}else{
		y = 0;
	}

	sysFont->SetPosition(16, y + 360);
	sprintf(buf, "%s=%8d %s=%8d", stPerf0[_perf0_type].text, triCnt, stPerf1[_perf1_type].text, verCnt);
	sysFont->StrOut(buf);

	sprintf(buf, "Free Mem=[%09d] COIN=[%04d] %s\n", free_mem_size, _gim.GetNumOfCoin() & 0xFFFF, "V1.08");
	sysFont->SetPosition(16, y + 380);
	sysFont->StrOut(buf);

	iCheckLoadStatus();

	sysFont->StrOut("File : ");

	//Print the load status character for each stage
	//X: not loaded, +: loading, O: loaded
	for (i = 0; i < 8; i++) {
		if(stage[i].load_status == 0) {
			sysFont->StrOut("X");
		}else if(stage[i].load_status == 1) {
			sysFont->StrOut("+");
		} else {
			sysFont->StrOut("O");
		}
	}
	
	sysFont->StrOut(" ");

	switch(_cam.get_mode()) {
	case 0:
		sysFont->StrOut("CAM_MODE_STANDBY");
		break;
	case 1:
		sysFont->StrOut("CAM_MODE_TRAIL");
		break;
	case 2:
		sysFont->StrOut("CAM_MODE_MOVIE");
		break;
	case 3:
		sysFont->StrOut("CAM_MODE_MARIO_VIEW");
		break;
	case 4:
		sysFont->StrOut("CAM_MODE_DETACH");
		break;
	case 5:
		sysFont->StrOut("CAM_MODE_DOOR");
		break;
	case 6:
		sysFont->StrOut("CAM_MODE_DOKAN");
		break;
	case 7:
		sysFont->StrOut("CAM_MODE_SPIL");
		break;
	}

	sprintf(buf, " %3d\n", _stimer);
	sysFont->StrOut(buf);

	sysFont->End();
}

void DMainSystem::_Step_Room_Select_Menu(){
	switch(_step[1]){
		case 0:
			_console_step = STEP_ROOM_SELECT_MENU;
			_step[1]++;
			audio.MuteAll(1);
			break;
		case 1:
			if (_pad.IsTrg(PAD_CHAN0, PAD_BUTTON_A)) {
			switch(_cursol_pos[0]) {
				case 0:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_ENTR;
					_mode_no = 2;
					_step[0] = STEP_ENTR;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.PlaySongFadeOut();
					autoDemoFlag = false;
					audio.MuteAll(0);
					break;
				case 1:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_DOME;
					_mode_no = 2;
					_step[0] = STEP_DOME;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.PlaySongFadeOut();
					autoDemoFlag = false;
					audio.MuteAll(0);
					break;
				case 2:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_SPIL;
					_mode_no = 2;
					_step[0] = STEP_SPIL;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.PlaySongFadeOut();
					autoDemoFlag = false;
					audio.MuteAll(0);
					break;
				case 3:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_HANG;
					_mode_no = 2;
					_step[0] = STEP_HANG;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.PlaySongFadeOut();
					autoDemoFlag = false;
					audio.MuteAll(0);
					break;
				case 4:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_CAVE;
					_mode_no = 2;
					_step[0] = STEP_CAVE;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.PlaySongFadeOut();
					autoDemoFlag = false;
					audio.MuteAll(0);
					break;
				case 5:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_CINE;
					_mode_no = 2;
					_step[0] = STEP_CINE;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.PlaySongFadeOut();
					autoDemoFlag = false;
					audio.MuteAll(0);
					break;
				case 6:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_ENVE;
					_mode_no = 2;
					_step[0] = STEP_ENVE;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.PlaySongFadeOut();
					autoDemoFlag = false;
					audio.MuteAll(0);
					break;
				case 7:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_MPOL;
					_mode_no = 2;
					_step[0] = STEP_MPOL;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.PlaySongFadeOut();
					autoDemoFlag = false;
					audio.MuteAll(0);
					break;
				case 9:
					_console_step = STEP_INIT_SYS;
					_step[0] = STEP_MAIN_MENU;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.MuteAll(0);
					break;
				}
			}
			break;
	}
}

void DMainSystem::_Step_Movie_Select_Menu(){
	switch(_step[1]){
		case 0:
			_console_step = STEP_MOVIE_SELECT_MENU;
			_step[1]++;
			break;
		case 1:
			if (_pad.IsTrg(PAD_CHAN0, PAD_BUTTON_A)) {
				switch(_cursol_pos[0]) {
				case 0:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_ENTR;
					_mode_no = 3;
					_step[0] = STEP_MOVIE_ENTR;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.SetAutoDemo(true);
					autoDemoFlag = true;
					break;
				case 1:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_DOME;
					_mode_no = 3;
					_step[0] = STEP_MOVIE_DOME;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.SetAutoDemo(true);
					autoDemoFlag = true;
					break;
				case 2:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_SPIL;
					_mode_no = 3;
					_step[0] = STEP_MOVIE_SPIL;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.SetAutoDemo(true);
					autoDemoFlag = true;
					break;
				case 3:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_HANG;
					_mode_no = 3;
					_step[0] = STEP_MOVIE_HANG;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.SetAutoDemo(true);
					autoDemoFlag = true;
					break;
				case 4:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_CAVE;
					_mode_no = 3;
					_step[0] = STEP_MOVIE_CAVE;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.SetAutoDemo(true);
					autoDemoFlag = true;
					break;
				case 5:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_CINE;
					_mode_no = 3;
					_step[0] = STEP_MOVIE_CINE;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.SetAutoDemo(true);
					autoDemoFlag = true;
					break;
				case 6:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_ENVE;
					_mode_no = 3;
					_step[0] = STEP_MOVIE_ENVE;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.SetAutoDemo(true);
					autoDemoFlag = true;
					break;
				case 7:
					_console_step = STEP_INIT_SYS;
					_stage_no = STG_MPOL;
					_mode_no = 3;
					_step[0] = STEP_MOVIE_MPOL;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					audio.SetAutoDemo(true);
					autoDemoFlag = true;
					break;
				case 9:
					_console_step = STEP_INIT_SYS;
					_step[0] = STEP_MAIN_MENU;
					_step[1] = 0;
					_cursol_pos[0] = _cursol_pos[1];
					break;
				}
			}
			break;
	}
}

void DMainSystem::_Step_Pause_Menu(){
	switch(_step[1]){
		case 0:
			switch(_stage_no) {
			case 0:
				_Draw_Entr(false);
				break;
			case 1:
				_Draw_Hang(false);
				break;
			case 2:
				_Draw_Dome(false);
				break;
			case 3:
				_Draw_Cave(false);
				break;
			case 4:
				_Draw_Cine(false);
				break;
			case 5:
				_Draw_Spil(false);
				break;
			case 6:
				_Draw_Enve(false);
				break;
			case 7:
				_Draw_Mpol(false);
				break;
		}
		
		audio.MuteAll(true);
		_step[1]++;
		_console_step = 4;
		break;
	case 1:
		switch(_stage_no) {
			case 0:
				_Draw_Entr(false);
				break;
			case 1:
				_Draw_Hang(false);
				break;
			case 2:
				_Draw_Dome(false);
				break;
			case 3:
				_Draw_Cave(false);
				break;
			case 4:
				_Draw_Cine(false);
				break;
			case 5:
				_Draw_Spil(false);
				break;
			case 6:
				_Draw_Enve(false);
				break;
			case 7:
				_Draw_Mpol(false);
				break;
		}

		if (_cursol_pos[0] == 3 && !_sys_inf_disp_flag) {
			_cursol_pos[0] = 5;
		}

		if (_cursol_pos[0] == 4 && !_sys_inf_disp_flag) {
			_cursol_pos[0] = 2;
		}

		if (_pad.IsTrg(0, 0x100)) {
			switch(_cursol_pos[0]) {
				case 0:
					_mipmap_mode++;
					if (_mipmap_mode > 2) {
						_mipmap_mode = 0;
					}
					_SetMipMap();
					break;
				case 1:
					_tv_mode++;

					if (VIGetDTVStatus() != 0) {
						if (_tv_mode > 8) {
							_tv_mode = 0;
						}
					}else if (_tv_mode > 6) {
						_tv_mode = 0;
					}
					break;
				case 2:
					_sys_inf_disp_flag ^= 1;
					break;
				case 3:
					_perf0_type++;
					if (stPerf0[_perf0_type].type == 35) {
						_perf0_type = 0;
					}
					break;
				case 4:
					_perf1_type++;
					if (stPerf1[_perf1_type].type == 22) {
						_perf1_type = 0;
					}
					break;
				case 5:
					_meter_disp_flag ^= 1;
					break;
				case 6:
					s32 gamma_mode = DGRendMan::m_DispCopyGamma + 1;
					if (gamma_mode > 2) {
						gamma_mode = 0;
					}
					rend_man[1].SetDispCopyGamma((GXGamma)gamma_mode);
					break;
				case 7:
					s32 flag = audio.GetMuteSequence() ^ 1;
					audio.SetMuteSequence(flag);
					break;
				case 8:
					flag = audio.GetMuteSe() ^ 1;
					audio.SetMuteSe(flag);
					break;
				case 10:
					GXColor black = {0,0,0,0};
					rend_man[0].SetBGColor(black);
					_console_step = 0;

					if (_stage_no == 7) {
						_gim.CoinExit();
					}

					_step[0] = 1;
					_step[1] = 2;
					break;
			}
		}else if (_pad.IsTrg(0, 0x200)) {
			switch(_cursol_pos[0]){
				case 0:
					_mipmap_mode--;
					if (_mipmap_mode < 0) {
						_mipmap_mode = 2;
					}
					_SetMipMap();
					break;
				case 1:
					_tv_mode--;

					if (VIGetDTVStatus() == 0) {
						_tv_mode = 6;
					}
					else {
						_tv_mode = 8;
					}
					break;
				case 2:
					_sys_inf_disp_flag ^= 1;
					break;
				case 5:
					_meter_disp_flag ^= 1;
					break;
				case 6:
					s32 gamma_mode = DGRendMan::m_DispCopyGamma - 1;
					if (gamma_mode < 0) {
						gamma_mode = 2;
					}
					rend_man[1].SetDispCopyGamma((GXGamma)gamma_mode);
					break;
			}
		}else if (_pad.IsTrg(0, 0x1000)) {
			_console_step = 0;
			_step[0] = _save_step[0];
			_step[1] = _save_step[1];
			audio.MuteAll(false);
		}
		break;
	}
}


//Entrance area functions

void DMainSystem::_Step_Entr(){
	/*
	Vec pos; //r1_24

		byte bVar1;
	char cVar2;
	int iVar3;
	Vec local_3c;
	undefined4 local_30;
	undefined4 local_2c;
	undefined4 local_28;
	Vec local_24 [2];
	
	if (true) {
		cVar2 = (char)&stack0xffffffb8;
		switch(_step[1]) {
		case 0:
			_LoadRequestEntr();
			_step[1]++;
			break;
		case 1:
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[0].load_status == 3) {
				_gim.TitleOn(_stage_no);
				_step[1]++;
			}
			break;
		case 2:
			_iSetStagePos(_stage_no);
			_cam.set_current_room_number(_stage_no);
			if (_mode_no == 2) {
				_iSetMarioPosRol(_stage_no);
				_iSetCameraPos(_stage_no);
				_cam.set_mode(1);
				_cam.set_hit_enable_flag(1);
				_cam.set_speed(@394,@394,@390,@395);
				_mode_no = 0;
			}
			_hit.set_current_room_number(_stage_no);
			iVar3 = _hit.get_hit_data(_stage_no);

			if (iVar3 == 0) {
				_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
			}

			audio.PlaySong(song);
			_step[1]++;
			break;
		case 3:
			_RoomCameraMoveProc();
			_gim.Action(_stage_no);
			_player.Action();
			_Draw_Entr(1);
			_FileManager();
			_CheckSubMenu();
			_CheckMoveRoom();
			break;
		case 0x14:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_player.Action();
			_DrawOldStage();
			iCheckLoadStatus();
			if (stage[_go_next_room.next_room_no].load_status == 3) {
				_go_next_room.flag = 3;
				_stage_no = _go_next_room.next_room_no;
				_iSetStagePos(_stage_no);
				_cam.set_current_room_number(_stage_no);
				_hit.set_current_room_number(_stage_no);
				iVar3 = _hit.get_hit_data(_stage_no);
				if (iVar3 == 0) {
					_hit.set_hit_data(_stage_no,
										stage[_stage_no].datBGH);
				}
				bVar1 = _go_next_room.old_room_no;
				if (bVar1 == 7) {
					_step[1]++;
				}
				else {
					_gim.DoorOpen(bVar1,_go_next_room.open_door_no);
					_step[1] = _step[1] + 3;
				}
			}
			break;
		case 0x15:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_gim.Action(_go_next_room.next_room_no);
			_player.Action();
			_DrawOldStage();
			_Draw_Entr(0);
			if (_go_next_room.flag == 5) {
				local_28 = @602;
				rend_man[0].SetBGColor((_GXColor)(cVar2 + ' '));
				_gim.DoorOpen(_go_next_room.old_room_no,
									_go_next_room.open_door_no);
				_step[1]++;
			}
			break;
		case 0x16:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_gim.Action(_go_next_room.next_room_no);
			_player.Action();
			_DrawOldStage();
			local_2c = @605;
			rend_man[0].SetBGColor((_GXColor)(cVar2 + 0x1c));
			_Draw_Entr(0);
			if (_go_next_room.flag == 6) {
				_gim.DoorClose(_go_next_room.old_room_no, _go_next_room.open_door_no);
				_step[1]++;
			}
			break;
		case 0x17:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_gim.Action(_go_next_room.next_room_no);
			_player.Action();
			_DrawOldStage();
			local_30 = @610;
			rend_man[0].SetBGColor((_GXColor)(cVar2 + 0x18));
			_Draw_Entr(0);
			if (_go_next_room.flag == 4) {
				bVar1 = _go_next_room.old_room_no;
				if (bVar1 != 7) {
					_gim.DoorClose(bVar1,_go_next_room.open_door_no);
				}
				_go_next_room.flag = 0;
				_cam.set_mode(1);
				_cam.set_hit_enable_flag(1);
				_cam.set_speed(@394,@394,@390,@395);
				_gim.TitleOn(_stage_no);
				_old_route_counter = _go_next_room.old_room_no;
				audio.PlaySong(song);
				_step[1] = 3;
			}
			break;
		case 0x1e:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_player.Action();
			_DrawOldStage();
			iCheckLoadStatus();
			if (stage[_go_next_room.next_room_no].load_status == 3) {
				_go_next_room.flag = 3;
				_stage_no = _go_next_room.next_room_no;
				_iSetStagePos(_stage_no);
				_cam.set_current_room_number(_stage_no);
				_hit.set_current_room_number(_stage_no);
				iVar3 = _hit.get_hit_data(_stage_no);
				if (iVar3 == 0) {
					_hit.set_hit_data(_stage_no,
										stage[_stage_no].datBGH);
				}
				_step[1]++;
			}
			break;
		case 0x1f:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_player.Action();
			_DrawOldStage();
			if (_go_next_room.flag == 4) {
				_gim.FadeOut();
				_step[1]++;
			}
			break;
		case 0x20:
			_gim.Action(_go_next_room.next_room_no);
			iVar3 = _gim.IsFadeOut();
			if (iVar3 != 0) {
				_gim.FadeIn();
				_iSetMarioPosRol(_stage_no);
				_cam.set_mode(1);
				_cam.set_hit_enable_flag(1);
				_go_next_room.flag = 0;
				local_24[0].x = @643;
				local_24[0].y = @644;
				local_24[0].z = @645;
				local_3c.x = @643;
				local_3c.y = @644;
				local_3c.z = @645;
				_cam.SetTargetPos(&local_3c);
				local_24[0].x = local_24[0].x - @646;
				local_24[0].y = local_24[0].y + @646;
				_cam.SetPosition(local_24);
				_gim.TitleOn(_stage_no);
				_old_route_counter = _go_next_room.old_room_no;
				_step[1] = 2;
			}
		}
	}
	*/
}

void DMainSystem::_Draw_Entr(s8 mario_flag){
	if (mario_flag & ((7 - _stage_no) != 0)) {
		_player.CreateShadow();
	}

	_light.Setting(STG_ENTR);

	if(_fog_sw){
		_cam.SetFogType(GX_FOG_LIN);
	}else{
		_cam.SetFogType(GX_FOG_NONE);
	}

	rend_man[0].AddCamera(&_cam);

	if (mario_flag) {
		rend_man[0].AddModel(mario_model);
	}

	rend_man[0].SetTexProjection(0, _player.GetShadowPro(mario_flag));
	rend_man[0].AddModel(stage[STG_ENTR].model[0]);
}

void DMainSystem::_CheckSubMenu(){
	if(_pad.IsTrg(PAD_CHAN0, PAD_BUTTON_MENU)){
		_save_step[0] = _step[0];
		_save_step[1] = _step[1];
		_cursol_pos[0] = 0;
		_step[0] = 4;
		_step[1] = 0;
	}
}

void DMainSystem::_LoadRequestEntr(){
	iBgLoadRequest(1, 1, STG_ENTR, 0);
	iBgLoadRequest(2, 3, STG_ENTR, 0);
	iBgLoadRequest(3, 4, STG_ENTR, 0);
	iBgLoadRequest(1, 6, STG_ENTR, 0);
	stage[STG_ENTR].load_status = 1;
	return;
}

//unused
void DMainSystem::_DelEntr(){
}


//Hangar area functions

void DMainSystem::_Step_Hang(){
	/*
		int iVar1;
	
	if (true) {
		switch(_step[1]) {
		case 0:
			_LoadRequestHang();
			_step[1]++;
			break;
		case 1:
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[1].load_status == 3) {
				_gim.TitleOn(_stage_no);
				_step[1]++;
			}
			break;
		case 2:
			_iSetStagePos(_stage_no);
			_iSetPlanePos();
			_cam.set_current_room_number(_stage_no);
			if (_mode_no == 2) {
				_iSetMarioPosRol(_stage_no);
				_iSetCameraPos(_stage_no);
				_cam.set_mode(1);
				_cam.set_hit_enable_flag(1);
				_cam.set_speed(@394,@394,@390,@395);
				_mode_no = 0;
			}
			_hit.set_current_room_number(_stage_no);
			iVar1 = _hit.get_hit_data(_stage_no);

			if (iVar1 == 0) {
				_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
			}

			audio.PlaySong(song[1]);
			_step[1]++;
			break;
		case 3:
			_RoomCameraMoveProc();
			_gim.Action(_stage_no);
			_player.Action();
			_Draw_Hang(1);
			_FileManager();
			_pad.IsTrg(0,0x1000);
			if (iVar1 != 0) {
				_save_step[0] = _step[0];
				_save_step[1] = _step[1];
				_cursol_pos[0] = 0;
				_step[0] = 4;
				_step[1] = 0;
			}
			_CheckMoveRoom();
			break;
		case 0x14:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_player.Action();
			_DrawOldStage();
			iCheckLoadStatus();
			if (stage[_go_next_room.next_room_no].load_status == 3) {
				_go_next_room.flag = 3;
				_gim.DoorOpen(_go_next_room.old_room_no,_go_next_room.open_door_no);
				_stage_no = _go_next_room.next_room_no;
				_iSetStagePos(_stage_no);
				_iSetPlanePos();
				_cam.set_current_room_number(_stage_no);
				_hit.set_current_room_number(_stage_no);
				iVar1 = _hit.get_hit_data(_stage_no);

				if (iVar1 == 0) {
					_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
				}
				
				audio.PlaySong(song[1]);
				_step[1]++;
			}
			break;
		case 0x15:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_gim.Action(_go_next_room.next_room_no);
			_player.Action();
			_DrawOldStage();
			_Draw_Hang(0);
			if (_go_next_room.flag == 4) {
				_gim.DoorClose(_go_next_room.old_room_no,_go_next_room.open_door_no);
				_go_next_room.flag = 0;
				_cam.set_mode(1);
				_cam.set_hit_enable_flag(1);
				_gim.TitleOn(_stage_no);
				_old_route_counter = _go_next_room.old_room_no;
				_step[1] = 3;
			}
		}
	}
	*/
}

void DMainSystem::_Draw_Hang(s8 mario_flag){
	if(mario_flag) _player.CreateShadow();

	if(_fog_sw) _cam.SetFogType(GX_FOG_LIN);
	else _cam.SetFogType(GX_FOG_NONE);

	_light.Setting(1);

	rend_man[0].AddCamera(&_cam);

	if(mario_flag) rend_man[0].AddModel(mario_model);

	rend_man[0].SetTexProjection(0, _player.GetShadowPro(mario_flag));
	rend_man[0].AddModel(stage[1].model[1]);
	rend_man[0].AddModel(stage[1].model[0]);
}

void DMainSystem::_LoadRequestHang(){
	iBgLoadRequest(4, 1, STG_HANG, 0);
	iBgLoadRequest(7, 1, STG_HANG, 1);
	iBgLoadRequest(5, 3, STG_HANG, 0);
	iBgLoadRequest(6, 4, STG_HANG, 0);
	iBgLoadRequest(4, 6, STG_HANG, 0);
	stage[STG_HANG].load_status = 1;
}

//unused
void DMainSystem::_DelHang(){
}

void DMainSystem::_iSetPlanePos(){
	//Vec pos;

	stage[_stage_no].model[1]->SetPosition(stage[_stage_no].model[0]->GetPosition());
	stage[_stage_no].model[1]->SetRotation(stage[_stage_no].model[0]->GetRotation());
}


//Dome area functions

void DMainSystem::_Step_Dome(){
	/*
		int iVar1;
	
	if (true) {
		switch(_step[1]) {
		case 0:
			_LoadRequestDome();
			_step[1]++;
			break;
		case 1:
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[_stage_no].load_status == 3) {
				_gim.TitleOn(_stage_no);
				_step[1]++;
			}
			break;
		case 2:
			_iSetStagePos(_stage_no);
			_cam.set_current_room_number(_stage_no);
			if (_mode_no == 2) {
				_iSetMarioPosRol(_stage_no);
				_iSetCameraPos(_stage_no);
				_cam.set_mode(1);
				_cam.set_hit_enable_flag(1);
				_cam.set_speed(@394,@394,@390,@395);
				_mode_no = 0;
			}
			_hit.set_current_room_number(_stage_no);
			iVar1 = _hit.get_hit_data(_stage_no);

			if (iVar1 == 0) {
				_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
			}

			audio.PlaySong(song[2]);
			_step[1]++;
			break;
		case 3:
			_RoomCameraMoveProc();
			_gim.Action(_stage_no);
			_player.Action();
			_Draw_Dome(1);
			_FileManager();
			_pad.IsTrg(0,0x1000);
			if (iVar1 != 0) {
				_save_step[0] = _step[0];
				_save_step[1] = _step[1];
				_cursol_pos[0] = 0;
				_step[0] = 4;
				_step[1] = 0;
			}
			_CheckMoveRoom();
			break;
		case 0x14:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_player.Action();
			_DrawOldStage();
			iCheckLoadStatus();
			if (stage[_go_next_room.next_room_no].load_status == 3) {
				_go_next_room.flag = 3;
				_gim.DoorOpen(_go_next_room.old_room_no,_go_next_room.open_door_no);
				_stage_no = _go_next_room.next_room_no;
				_iSetStagePos(_stage_no);
				_cam.set_current_room_number(_stage_no);
				_hit.set_current_room_number(_stage_no);
				iVar1 = _hit.get_hit_data(_stage_no);

				if (iVar1 == 0) {
					_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
				}

				audio.PlaySong(song[2]);
				_step[1]++;
			}
			break;
		case 0x15:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_gim.Action(_go_next_room.next_room_no);
			_player.Action();
			_DrawOldStage();
			_Draw_Dome(0);
			if (_go_next_room.flag == 4) {
				_gim.DoorClose(_go_next_room.old_room_no,_go_next_room.open_door_no);
				_go_next_room.flag = 0;
				_cam.set_mode(1);
				_cam.set_hit_enable_flag(1);
				_gim.TitleOn(_stage_no);
				_old_route_counter = _go_next_room.old_room_no;
				_step[1] = 3;
			}
		}
	}
	*/
}

void DMainSystem::_Draw_Dome(s8 mario_flag){
	if(mario_flag) _player.CreateShadow();

	_light.Setting(2);

	if(_fog_sw) _cam.SetFogType(GX_FOG_LIN);
	else _cam.SetFogType(GX_FOG_NONE);

	rend_man[0].AddCamera(&_cam);
	if(mario_flag) rend_man[0].AddModel(mario_model);
	rend_man[0].SetTexProjection(0, _player.GetShadowPro(mario_flag));
	rend_man[0].AddModel(stage[2].model[0]);
}

void DMainSystem::_LoadRequestDome(){
	iBgLoadRequest(8, 1, STG_DOME, 0);
	iBgLoadRequest(9, 3, STG_DOME, 0);
	iBgLoadRequest(10, 4, STG_DOME, 0);
	iBgLoadRequest(2, 6, STG_DOME, 0);
	stage[STG_DOME].load_status = 1;
}

//unused
void DMainSystem::_DelDome(){
}


//Cave area functions

void DMainSystem::_Step_Cave(){
	/*    byte bVar1;
	int iVar2;
	
	bVar1 = _step[1];
	if (bVar1 == 3) {
		_RoomCameraMoveProc();
		_gim.Action(_stage_no);
		_player.Action();
		_Draw_Cave(1);
		_FileManager();
		_pad.IsTrg(0,0x1000);
		if (iVar2 != 0) {
			_save_step[0] = _step[0];
			_save_step[1] = _step[1];
			_cursol_pos[0] = 0;
			_step[0] = 4;
			_step[1] = 0;
		}
		_CheckMoveRoom();
	}
	else if (bVar1 < 3) {
		if (bVar1 == 1) {
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[_stage_no].load_status == 3) {
				_gim.TitleOn(_stage_no);
				_step[1]++;
			}
		}
		else if (bVar1 == 0) {
			if (true) {
				_LoadRequestCave();
				_step[1]++;
			}
		}
		else {
			_iSetStagePos(_stage_no);
			_iSetKriboPos();
			_iSetCaveFog();
			_cam.set_current_room_number(_stage_no);
			if (_mode_no == 2) {
				_iSetMarioPosRol(_stage_no);
				_iSetCameraPos(_stage_no);
				_cam.set_mode(1);
				_cam.set_hit_enable_flag(1);
				_cam.set_speed(@394,@394,@390,@395);
				_mode_no = 0;
			}
			_hit.set_current_room_number(_stage_no);
			iVar2 = _hit.get_hit_data(_stage_no);

			if (iVar2 == 0) {
				_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
			}

			audio.PlaySong(song[3]);
			_step[1]++;
		}
	}
	else if (bVar1 == 0x1f) {
		_RoomCameraMoveProc();
		_gim.Action(_go_next_room.old_room_no);
		_player.Action();
		_DrawOldStage();
		if (_go_next_room.flag == 4) {
			_gim.FadeOut();
			_step[1]++;
		}
	}
	else if (bVar1 < 0x1f) {
		if (0x1d < bVar1) {
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_player.Action();
			_DrawOldStage();
			iCheckLoadStatus();
			if (stage[_go_next_room.next_room_no].load_status == 3) {
				_go_next_room.flag = 3;
				_stage_no = _go_next_room.next_room_no;
				_iSetStagePos(_stage_no);
				_cam.set_current_room_number(_stage_no);
				_hit.set_current_room_number(_stage_no);
				iVar2 = _hit.get_hit_data(_stage_no);
				if (iVar2 == 0) {
					_hit.set_hit_data(_stage_no,
										stage[_stage_no].datBGH);
				}
				audio.PlaySong(song[3]);
				_step[1]++;
			}
		}
	}
	else if (bVar1 < 0x21) {
		_gim.Action(_go_next_room.next_room_no);
		iVar2 = _gim.IsFadeOut();
		if (iVar2 != 0) {
			_gim.FadeIn();
			_iSetMarioPosRol(_stage_no);
			_iSetCameraPos(_stage_no);
			_cam.set_mode(1);
			_cam.set_hit_enable_flag(1);
			_go_next_room.flag = 0;
			_gim.TitleOn(_stage_no);
			_iSetCaveFog();
			_old_route_counter = _go_next_room.old_room_no;
			_step[1] = 2;
		}
	}*/
}

void DMainSystem::_Draw_Cave(s8 mario_flag){
	if(mario_flag) _player.CreateShadow();

	if(_fog_sw) _cam.SetFogType(GX_FOG_LIN);
	else _cam.SetFogType(GX_FOG_EXP2);

	rend_man[1].AddCamera(&_cam);
	_light.SetKuriboLight();
	rend_man[1].AddModel(stage[3].model[1]);
	rend_man[0].AddCamera(&_cam);
	_light.Setting(3);

	if(mario_flag) rend_man[0].AddModel(mario_model);

	rend_man[0].SetTexProjection(0, _player.GetShadowPro(mario_flag));
	rend_man[0].AddModel(stage[3].model[0]);
}

void DMainSystem::_iSetKriboPos(){
	//Vec pos; //r1_c

	stage[_stage_no].model[1]->SetPosition(stage[_stage_no].model[0]->GetPosition());
	stage[_stage_no].model[1]->SetRotation(stage[_stage_no].model[0]->GetRotation());
}

void DMainSystem::_LoadRequestCave(){
	iBgLoadRequest(0xb, 1, STG_CAVE, 0);
	iBgLoadRequest(0xe, 1, STG_CAVE, 1);
	iBgLoadRequest(0xc, 3, STG_CAVE, 0);
	iBgLoadRequest(0xd, 4, STG_CAVE, 0);
	iBgLoadRequest(5, 6, STG_CAVE, 0);
	stage[STG_CAVE].load_status = 1;
}

//unused
void DMainSystem::_DelCave(){
}

void DMainSystem::_iSetCaveFog(){
	GXColor fogcolor = {0,0,0,0};
	
	_cam.SetFogColor(fogcolor);
	_cam.SetFogRange(192, 512);
}


//Cinema area functions

void DMainSystem::_Step_Cine(){
	/*    int iVar1;
	
	if (true) {
		switch(_step[1]) {
		case 0:
			_LoadRequestCine();
			_step[1]++;
			break;
		case 1:
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[_stage_no].load_status == 3) {
				_gim.TitleOn(_stage_no);
				_step[1]++;
			}
			break;
		case 2:
			_iSetStagePos(_stage_no);
			_cam.set_current_room_number(_stage_no);
			if (_mode_no == 2) {
				_iSetMarioPosRol(_stage_no);
				_iSetCameraPos(_stage_no);
				_cam.set_mode(1);
				_cam.set_hit_enable_flag(1);
				_cam.set_speed(@394,@394,@390,@395);
				_mode_no = 0;
			}
			_hit.set_current_room_number(_stage_no);
			iVar1 = _hit.get_hit_data(_stage_no);

			if (iVar1 == 0) {
				_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
			}

			_iCineProInit();
			audio.PlaySong(song[4]);
			_step[1]++;
			break;
		case 3:
			_iCinemaProjectionProc();
			_RoomCameraMoveProc();
			_gim.Action(_stage_no);
			_player.Action();
			_Draw_Cine(1);
			_FileManager();
			_pad.IsTrg(0,0x1000);
			if (iVar1 != 0) {
				_save_step[0] = _step[0];
				_save_step[1] = _step[1];
				_cursol_pos[0] = 0;
				_step[0] = 4;
				_step[1] = 0;
			}
			_CheckMoveRoom();
			if ((_stimer & 3) == 0) {
				cinema.film_cnt = cinema.film_cnt + 1;
			}
			if (0x4a < cinema.film_cnt) {
				cinema.film_cnt = 0;
			}
			break;
		case 0x14:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_player.Action();
			_DrawOldStage();
			iCheckLoadStatus();
			if (stage[_go_next_room.next_room_no].load_status == 3) {
				_go_next_room.flag = 3;
				_gim.DoorOpen(_go_next_room.old_room_no,_go_next_room.open_door_no);
				_stage_no = _go_next_room.next_room_no;
				_iSetStagePos(_stage_no);
				_cam.set_current_room_number(_stage_no);
				_hit.set_current_room_number(_stage_no);
				iVar1 = _hit.get_hit_data(_stage_no);
				if (iVar1 == 0) {
					_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
				}
				_iCineProInit();
				audio.PlaySong(song[4]);
				_step[1]++;
			}
			break;
		case 0x15:
			_RoomCameraMoveProc();
			_iCinemaProjectionProc();
			_gim.Action(_go_next_room.old_room_no);
			_gim.Action(_go_next_room.next_room_no);
			_player.Action();
			_DrawOldStage();
			_Draw_Cine(0);
			if (_go_next_room.flag == 4) {
				_gim.DoorClose(_go_next_room.old_room_no, _go_next_room.open_door_no);
				_go_next_room.flag = 0;
				_cam.set_mode(1);
				_cam.set_hit_enable_flag(1);
				_gim.TitleOn(_stage_no);
				_old_route_counter = _go_next_room.old_room_no;
				_step[1] = 3;
			}
		}
	}
	*/
}

void DMainSystem::_iCinemaProjectionProc(){
	/*Vec wpos; //r1_c4
	DGParts* j_movie;
	float kakudo; //f2
	Vec camrot; //r1_b8
	DGParts* j_star; //r3
	Vec kaiten; //r1_ac
	DGParts* j_hart; //r3
	//Vec kaiten; //r1_a0
	GXColor lc0; //r1_9c
	Vec lp0; //r1_90
	GXColor lc1; //r1_8c
	Vec lp1; //r1_80
	Vec lt1; //r1_74
	GXColor lc2; //r1_70
	Vec lp2; //r1_64
	Vec lt2; //r1_58
	Vec campos; //r1_4c


		DGPosition *pDVar1;
	float fVar2;
	Vec local_f0;
	float local_e4;
	float local_e0;
	float local_dc;
	Vec local_d8;
	Vec local_cc;
	Vec local_c0;
	Vec local_b4;
	Vec local_a8;
	Vec local_9c;
	undefined4 local_90;
	Vec local_8c;
	Vec local_80;
	undefined4 local_74;
	Vec local_70;
	undefined4 local_64;
	Vec local_60;
	Vec local_54;
	Vec local_48;
	Vec local_3c;
	undefined4 local_30;
	uint uStack_2c;
	undefined4 local_28;
	uint uStack_24;
	undefined4 local_20;
	uint uStack_1c;
	undefined4 local_18;
	uint uStack_14;
	
	stage[_stage_no].model[0]->SetPartsWorldPosition();
	pDVar1 = stage[_stage_no].model[0]->GetPartsPtr("j_movie");
	if (pDVar1 != NULL) {
		if (init$810 == 0) {
			cammode$809 = 0;
			init$810 = 1;
		}
		if (init$813 == 0) {
			init$813 = 1;
			time$812 = @389;
		}
		time$812 = time$812 + @390;
		if (@863 <= time$812) {
			cammode$809 = cammode$809 + 1;
			time$812 = @389;
			if (3 < cammode$809) {
				cammode$809 = 0;
			}
		}
		fVar2 = sinf((@864 * time$812) / @865);
		local_48.x = 0.0;
		fVar2 = @646 * fVar2;
		local_48.y = 0.0;
		local_48.z = 0.0;
		if (cammode$809 == 1) {
			local_48.x = fVar2 / @297 + 0.0;
		}
		else if (cammode$809 == 2) {
			local_48.y = fVar2 + 0.0;
		}
		else if (cammode$809 == 3) {
			local_48.z = @866 * fVar2 + 0.0;
		}
		pDVar1->SetRotation(&local_48);
	}
	(DGModel *)&local_3c->GetPartsWorldPosition((char *)stage[_stage_no].model[0]);
	cinema.cam[0].SetPosition(&local_3c);
	(DGModel *)&local_3c->GetPartsWorldPosition((char *)stage[_stage_no].model[0]);
	local_c0.x = local_3c.x;
	local_c0.y = local_3c.y;
	local_c0.z = local_3c.z;
	cinema.cam[0].SetTargetPos(&local_c0);
	stage[_stage_no].model[0]->GetPartsPtr("j_star");
	if (pDVar1 != NULL) {
		local_54.x = 0.0;
		local_54.y = 0.0;
		local_54.z = 1.0;
		pDVar1->AddRotation(&local_54);
	}
	DGModel::GetPartsWorldPosition((DGModel *)&local_3c,(char *)stage[_stage_no].model[0]);
	(cinema.cam[1])->SetPosition(&local_3c);
	DGModel::GetPartsWorldPosition((DGModel *)&local_3c,(char *)stage[_stage_no].model[0]);
	local_cc.x = local_3c.x;
	local_cc.y = local_3c.y;
	local_cc.z = local_3c.z;
	cinema.cam[1].SetTargetPos(&local_cc);
	stage[_stage_no].model[0]->GetPartsPtr("j_hart");
	if (pDVar1 != NULL) {
		local_60.x = 0.0;
		local_60.y = 0.0;
		local_60.z = 1.0;
		pDVar1->AddRotation(&local_60);
	}
	DGModel::GetPartsWorldPosition((DGModel *)&local_3c,(char *)stage[_stage_no].model[0]);
	(cinema.cam[2])->SetPosition(&local_3c);
	DGModel::GetPartsWorldPosition((DGModel *)&local_3c,(char *)stage[_stage_no].model[0]);
	local_d8.x = local_3c.x;
	local_d8.y = local_3c.y;
	local_d8.z = local_3c.z;
	cinema.cam[2].SetTargetPos(&local_d8);
	local_64 = @837;
	local_70.x = 85.0;
	local_70.y = 110.0;
	local_70.z = -222.0;
	cinema.light[0].SetLightColor((_GXColor *)&local_64);
	cinema.light[0].SetPosition(&local_70);
	cinema.light[0].SetDistanceAttenuation_0(@390);
	cinema.light[0].SetDistanceAttenuation_2(@390,@872,@873);
	cinema.light[0].SetAngleAttenuation_Cos(@387,@390);
	cinema.light[0].EnableSpotLight(0);
	cinema.light[0].EnableSpecularLight(0);
	local_74 = @839;
	local_80.x = 95.0;
	local_80.y = 80.0;
	local_80.z = -172.0;
	local_8c.x = 85.0;
	local_8c.y = 70.0;
	local_8c.z = -272.0;
	cinema.light[1].SetLightColor((_GXColor *)&local_74);
	cinema.light[1].SetPosition(&local_80);
	cinema.light[1].SetDirectionFromObserve(&local_8c);
	cinema.light[1].SetDistanceAttenuation_2(@390,@874,@392);
	cinema.light[1].SetAngleAttenuation_Cos(@875,@390);
	cinema.light[1].EnableSpotLight(0);
	cinema.light[1].EnableSpecularLight(0);
	local_90 = @842;
	local_9c.x = 85.0;
	local_9c.y = 70.0;
	local_9c.z = -302.0;
	local_a8.x = 95.0;
	local_a8.y = 80.0;
	local_a8.z = -172.0;
	cinema.light[2].SetLightColor((_GXColor *)&local_90);
	cinema.light[2].SetPosition(&local_9c);
	cinema.light[2].SetDirectionFromObserve(&local_a8);
	cinema.light[2].SetDistanceAttenuation_0(@390);
	cinema.light[2].SetAngleAttenuation_Cos(@387,@390);
	cinema.light[2].EnableSpotLight(1);
	cinema.light[2].EnableSpecularLight(0);
	uStack_14 = (uint)_stimer + ((int)(uint)_stimer >> 3) * -8 ^ 0x80000000;
	local_18 = 0x43300000;
	DGLight::SetDistanceAttenuation_2(cinema.light[1],@390,@874,@392 + @876 * (float)((double)CONCAT44(0x43300000,uStack_14) - @881));
	uStack_1c = (uint)_stimer + ((int)(uint)_stimer >> 3) * -8 ^ 0x80000000;
	local_20 = 0x43300000;
	DGLight::SetAngleAttenuation_Cos(cinema.light[1],@875 - @877 * (float)((double)CONCAT44(0x43300000,uStack_1c) - @881),@390);
	uStack_24 = (uint)_stimer + ((int)(uint)_stimer >> 3) * -8 ^ 0x80000000;
	local_28 = 0x43300000;
	DGLight::SetDistanceAttenuation_2(cinema.light[2],@390,@874,@393 + (float)((double)CONCAT44(0x43300000,uStack_24) - @881));
	uStack_2c = (uint)_stimer + ((int)(uint)_stimer >> 3) * -8 ^ 0x80000000;
	local_30 = 0x43300000;
	DGLight::SetAngleAttenuation_Cos(cinema.light[2],@878 - @876 * (float)((double)CONCAT44(0x43300000,uStack_2c) - @881),@390);
	(DGModel *)&local_3c->GetPartsWorldPosition((char *)stage[4].model[0]);
	&local_e4->GetPosition();
	local_b4.x = local_e4;
	local_b4.y = local_e0;
	local_b4.z = @298 * local_3c.z - local_dc;
	cinema.cam[3].SetPosition(&local_b4);
	(DGCamera *)&local_b4->GetTargetPos();
	local_f0.z = @298 * local_3c.z - local_b4.z;
	local_f0.x = local_b4.x;
	local_f0.y = local_b4.y;
	local_b4.z = local_f0.z;
	cinema.cam[3].SetTargetPos(&local_f0);
	*/
}

void DMainSystem::_Draw_Cine(s8 mario_flag){
	if(mario_flag) _player.CreateShadow();

	if (_go_next_room.flag == 0) {
		rend_man[0].SetViewport(0,0,256,256,0,1);
		rend_man[0].SetScissor(0,0,0x100,0x100);

		DGParts* partsdelete = stage[4].model[0]->GetPartsPtr("delete");

		if (partsdelete != NULL) {
			partsdelete->SetVisible(false);
			partsdelete->SetVisibleChild(false);
		}

		rend_man[0].AddCamera(&(cinema.cam[3]));
		rend_man[0].AddLight(&(cinema.light[0]));
		rend_man[0].AddLight(&(cinema.light[1]));
		rend_man[0].AddLight(&(cinema.light[2]));

		rend_man[0].SetTexProjection(0, _player.GetShadowPro(mario_flag));
		rend_man[0].SetTexProjection(1,cinema.texpro[cinema.film_cnt]);
		rend_man[0].SetTexProjection(2,cinema.star);
		rend_man[0].SetTexProjection(3,cinema.hart);
		rend_man[0].SetTexProjection(4,cinema.mirrorpro);

		if(mario_flag) rend_man[0].AddModel(mario_model);

		rend_man[0].AddModel(stage[4].model[0]);
		rend_man[0].Draw(RMDM_ONCE);

		//Copy the texture data to mirrorbuf
		GXInvalidateTexAll();
		GXSetTexCopySrc(0, 0, 256, 256);
		GXSetTexCopyDst(256, 256, GX_TF_RGB565, 0);
		GXCopyTex(cinema.mirrorbuf, true);
		GXPixModeSync();
		GXInvalidateTexAll();

		partsdelete = stage[4].model[0]->GetPartsPtr("delete");

		if (partsdelete != NULL) {
			partsdelete->SetVisible(true);
			partsdelete->SetVisibleChild(true);
		}
	}

	rend_man[0].SetViewportDefault();
	rend_man[0].SetScissorDefault();

	if (_fog_sw == 0) _cam.SetFogType(GX_FOG_LIN);
	else _cam.SetFogType(GX_FOG_NONE);

	rend_man[0].AddCamera(&_cam);

	if (mario_flag) rend_man[0].AddModel(mario_model);

	rend_man[0].SetTexProjection(0, _player.GetShadowPro(mario_flag));
	rend_man[0].SetTexProjection(1, cinema.texpro[cinema.film_cnt]);
	rend_man[0].SetTexProjection(2, cinema.star);
	rend_man[0].SetTexProjection(3, cinema.hart);
	rend_man[0].SetTexProjection(4, cinema.mirrorpro);
	rend_man[0].AddLight(&(cinema.light[0]));
	rend_man[0].AddLight(&(cinema.light[1]));
	rend_man[0].AddLight(&(cinema.light[2]));
	rend_man[0].AddModel(stage[4].model[0]);
}

void DMainSystem::_LoadRequestCine(){
	iBgLoadRequest(0xf, 1, STG_CINE, 0);
	iBgLoadRequest(0x10, 3, STG_CINE, 0);
	iBgLoadRequest(0x11, 4, STG_CINE, 0);
	iBgLoadRequest(0, 5, STG_CINE, 0);
	iBgLoadRequest(6, 6, STG_CINE, 0);
	stage[STG_CINE].load_status = 1;
}

//unused
void DMainSystem::_DelCine(){
}

void DMainSystem::_iCineProInit(){
	/*s16 i; //r29
	Vec camup; //r1_58
	Vec campos; //r1_4c
	Vec camrot; //r1_40
	GXColor fogcolor; //r1_3c


		short sVar1;
	DMainSystem *pDVar2;
	Vec local_6c;
	Vec local_60;
	Vec local_54;
	Vec local_48;
	undefined4 local_3c;
	Vec local_38;
	Vec local_2c;
	float local_20;
	float local_1c;
	float local_18;
	
	local_20 = 0.0;
	local_1c = 1.0;
	local_18 = 0.0;
	local_2c.x = 10.0;
	local_2c.y = 40.0;
	local_2c.z = 50.0;
	local_38.x = -5.0;
	local_38.y = 5.0;
	local_38.z = 0.0;
	cinema.cam[0].SetLightFrustum(@392,@387,@874);
	local_48.x = local_20;
	local_48.y = local_1c;
	local_48.z = local_18;
	cinema.cam[0].SetCamUp(&local_48);
	cinema.cam[0].SetTargetMode(0);
	cinema.cam[0].SetPosition(&local_2c);
	cinema.cam[1].SetLightFrustum(@392,@392,@874);
	local_54.x = local_20;
	local_54.y = local_1c;
	local_54.z = local_18;
	cinema.cam[1].SetCamUp(&local_54);
	cinema.cam[1].SetTargetMode(0);
	cinema.cam[1].SetPosition(&local_2c);
	cinema.cam[1].SetRotation(&local_38);
	cinema.cam[2].SetLightFrustum(@392,@392,@874);
	local_60.x = local_20;
	local_60.y = local_1c;
	local_60.z = local_18;
	cinema.cam[2].SetCamUp(&local_60);
	cinema.cam[2].SetTargetMode(0);
	cinema.cam[2].SetPosition(&local_2c);
	cinema.cam[2].SetRotation(&local_38);
	cinema.cam[3].SetTargetMode(0);
	cinema.cam[3].SetCameraFrustum(@297,@298,@298,@299);
	cinema.cam[3].SetLightFrustum(@297,@298,@298);
	local_6c.x = local_20;
	local_6c.y = local_1c;
	local_6c.z = local_18;
	cinema.cam[3].SetCamUp(&local_6c);
	local_3c = @911;
	cinema.cam[3].SetFogColor((_GXColor *)&local_3c);
	cinema.cam[3].SetFogRange(@387,@388);
	cinema.cam[3].SetFogType(GX_FOG_NONE);
	pDVar2 = this;
	for (sVar1 = 0; sVar1 < 0x4b; sVar1 = sVar1 + 1) {
		pDVar2->cinema.texpro[0]->SetCamera(cinema.cam[0]);
		pDVar2 = (DMainSystem *)(pDVar2->_save_step + 1);
	}
	cinema.star->SetCamera(cinema.cam[1]);
	cinema.hart->SetCamera(cinema.cam[2]);
	cinema.mirrorpro->SetCamera(cinema.cam[3]);
	cinema.mirrorpro->SetDirectTex(cinema.mirrorbuf,0x100,0x100,4,0);
	cinema.film_cnt = 0;
	*/
}


//Spiral Staircase area functions

void DMainSystem::_Step_Spil(){
	/*
		int iVar1;
	
	if (true) {
		switch(_step[1]) {
		case 0:
			_LoadRequestSpil();
			_step[1]++;
			break;
		case 1:
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[_stage_no].load_status == 3) {
				_gim.TitleOn(_stage_no);
				_step[1]++;
			}
			break;
		case 2:
			_iSetStagePos(_stage_no);
			_cam.set_current_room_number(_stage_no);
			if (_mode_no == 2) {
				_iSetMarioPosRol(_stage_no);
				_iSetCameraPos(_stage_no);
				_cam.set_mode('\a');
				_cam.set_hit_enable_flag(0);
				_cam.set_speed(@394,@394,@390,@395);
				_mode_no = 0;
			}
			_hit.set_current_room_number(_stage_no);
			iVar1 = _hit.get_hit_data(_stage_no);

			if (iVar1 == 0) {
				_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
			}

			audio.PlaySong(song[5]);
			_step[1]++;
			break;
		case 3:
			_RoomCameraMoveProc();
			_gim.Action(_stage_no);
			_player.Action();
			_Draw_Spil(1);
			_FileManager();
			_pad.IsTrg(0,0x1000);
			if (iVar1 != 0) {
				_save_step[0] = _step[0];
				_save_step[1] = _step[1];
				_cursol_pos[0] = 0;
				_step[0] = 4;
				_step[1] = 0;
			}
			_CheckMoveRoom();
			break;
		case 0x14:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_player.Action();
			_DrawOldStage();
			iCheckLoadStatus();
			if (stage[_go_next_room.next_room_no].load_status == 3) {
				_go_next_room.flag = 3;
				_gim.DoorOpen(_go_next_room.old_room_no,_go_next_room.open_door_no);
				_stage_no = _go_next_room.next_room_no;
				_iSetStagePos(_stage_no);
				_cam.set_current_room_number(_stage_no);
				_hit.set_current_room_number(_stage_no);
				iVar1 = _hit.get_hit_data(_stage_no);
				if (iVar1 == 0) {
					_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
				}
				audio.PlaySong(song[5]);
				_step[1]++;
			}
			break;
		case 0x15:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_gim.Action(_go_next_room.next_room_no);
			_player.Action();
			_DrawOldStage();
			_Draw_Spil(0);
			if (_go_next_room.flag == 4) {
				_gim.DoorClose(_go_next_room.old_room_no,_go_next_room.open_door_no);
				_go_next_room.flag = 0;
				_cam.set_mode('\a');
				_cam.set_hit_enable_flag(0);
				_gim.TitleOn(_stage_no);
				_old_route_counter = _go_next_room.old_room_no;
				_step[1] = 3;
			}
		}
	}
	*/
}

void DMainSystem::_Draw_Spil(s8 mario_flag){
	if(mario_flag){
		_player.CreateShadow();
		_player.CreateSpilShadow();
	}

	_light.Setting(5);

	if(_fog_sw) _cam.SetFogType(GX_FOG_LIN);
	else _cam.SetFogType(GX_FOG_NONE);

	rend_man[0].AddCamera(&_cam);

	if (mario_flag) rend_man[0].AddModel(mario_model);

	rend_man[0].SetTexProjection(0, _player.GetShadowPro(mario_flag));
	rend_man[0].SetTexProjection(1, _player.GetSpilShadowPro(mario_flag));
	rend_man[0].AddModel(stage[5].model[0]);
}

void DMainSystem::_LoadRequestSpil(){
	iBgLoadRequest(0x15, 1, STG_SPIL, 0);
	iBgLoadRequest(0x16, 3, STG_SPIL, 0);
	iBgLoadRequest(0x17, 4, STG_SPIL, 0);
	iBgLoadRequest(3, 6, STG_SPIL, 0);
	stage[5].load_status = 1;
}

//unused
void DMainSystem::_DelSpil(){
}


//Metal Mario area functions

void DMainSystem::_Step_Enve(){
	/*
		int iVar1;
	
	if (true) {
		switch(_step[1]) {
		case 0:
			_LoadRequestEnve();
			_step[1]++;
			break;
		case 1:
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[_stage_no].load_status == 3) {
				_gim.TitleOn(_stage_no);
				_step[1]++;
			}
			break;
		case 2:
			_iSetStagePos(_stage_no);
			_cam.set_current_room_number(_stage_no);
			if (_mode_no == 2) {
				_iSetMarioPosRol(_stage_no);
				_iSetCameraPos(_stage_no);
				_cam.set_mode(1);
				_cam.set_hit_enable_flag(1);
				_cam.set_speed(@394,@394,@390,@395);
				_mode_no = 0;
			}
			_hit.set_current_room_number(_stage_no);
			iVar1 = _hit.get_hit_data(_stage_no);

			if (iVar1 == 0) {
				_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
			}
			audio.PlaySong(song[6]);
			_step[1]++;
			break;
		case 3:
			_RoomCameraMoveProc();
			_gim.Action(_stage_no);
			_player.Action();
			_Draw_Enve(1);
			_FileManager();
			_pad.IsTrg(0,0x1000);
			if (iVar1 != 0) {
				_save_step[0] = _step[0];
				_save_step[1] = _step[1];
				_cursol_pos[0] = 0;
				_step[0] = 4;
				_step[1] = 0;
			}
			_CheckMoveRoom();
			break;
		case 0x14:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_player.Action();
			_DrawOldStage();
			iCheckLoadStatus();
			if (stage[_go_next_room.next_room_no].load_status == 3) {
				_go_next_room.flag = 3;
				_gim.DoorOpen(_go_next_room.old_room_no,
									_go_next_room.open_door_no);
				_stage_no = _go_next_room.next_room_no;
				_iSetStagePos(_stage_no);
				_cam.set_current_room_number(_stage_no);
				_hit.set_current_room_number(_stage_no);
				iVar1 = _hit.get_hit_data(_stage_no);
				if (iVar1 == 0) {
					_hit.set_hit_data(_stage_no,
										stage[_stage_no].datBGH);
				}
				audio.PlaySong(song[6]);
				_step[1]++;
			}
			break;
		case 0x15:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_gim.Action(_go_next_room.next_room_no);
			_player.Action();
			_DrawOldStage();
			_Draw_Enve(0);
			if (_go_next_room.flag == 4) {
				_gim.DoorClose(_go_next_room.old_room_no,_go_next_room.open_door_no);
				_go_next_room.flag = 0;
				_cam.set_mode(1);
				_cam.set_hit_enable_flag(1);
				_gim.TitleOn(_stage_no);
				_old_route_counter = _go_next_room.old_room_no;
				_step[1] = 3;
			}
		}
	}
	*/
}

void DMainSystem::_Draw_Enve(s8 mario_flag){
	if(mario_flag) _player.CreateShadow();

	_light.Setting(6);

	if(_fog_sw) _cam.SetFogType(GX_FOG_LIN);
	else _cam.SetFogType(GX_FOG_NONE);

	rend_man[0].AddCamera(&_cam);

	if(mario_flag) rend_man[0].AddModel(mario_model);

	rend_man[0].SetTexProjection(0, _player.GetShadowPro(mario_flag));
	rend_man[0].AddModel(stage[6].model[0]);
}

void DMainSystem::_LoadRequestEnve(){
	iBgLoadRequest(0x18, 1, STG_ENVE, 0);
	iBgLoadRequest(0x19, 3, STG_ENVE, 0);
	iBgLoadRequest(0x1a, 4, STG_ENVE, 0);
	iBgLoadRequest(7, 6, STG_ENVE, 0);
	stage[STG_ENVE].load_status = 1;
}

//unused
void DMainSystem::_DelEnve(){
}



//How Many Coins? area functions

void DMainSystem::_Step_Mpol(){
	/*
		char cVar2;
	int iVar1;
	
	if (true) {
		switch(_step[1]) {
		case 0:
			_LoadRequestMpol(1);
			_step[1]++;
			break;
		case 1:
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[_stage_no].load_status == 3) {
				rend_man[0].SetBGColor((_GXColor)0xe8);
				_gim.TitleOn(_stage_no);
				_step[1]++;
			}
			break;
		case 2:
			_iSetStagePos(_stage_no);
			_cam.set_current_room_number(_stage_no);
			if (_mode_no == 2) {
				_iSetMarioPosRol(_stage_no);
				_iSetCameraPos(_stage_no);
				_cam.set_mode(2);
				_cam.set_hit_enable_flag(0);
				_cam.set_mcd_data(_stage_no,stage[_stage_no].datMCD);
				_cam.set_speed(@1038,@1038,@1039,@1040);
				_mode_no = 0;
			}
			_hit.set_current_room_number(_stage_no);
			iVar1 = _hit.get_hit_data(_stage_no);

			if (iVar1 == 0) {
				_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
			}

			_gim.CoinInit();
			_player.MpolModeInit();
			audio.PlaySong(song[7]);
			_step[1]++;
			break;
		case 3:
			_RoomCameraMoveProc();
			_gim.Action(_stage_no);
			_player.Action();
			_pad.IsTrg(0,0x100);
			_cam.get_mode( cVar2 == 4)) {
				_gim.CoinDrop();
			}
			_Draw_Mpol(1);
			_FileManager();
			_ModifiNumOfCoint();
			_pad.IsTrg(0,0x1000);
			if (iVar1 != 0) {
				_save_step[0] = _step[0];
				_save_step[1] = _step[1];
				_cursol_pos[0] = 0;
				_step[0] = 4;
				_step[1] = 0;
			}
			_CheckMoveRoom();
			break;
		case 0x14:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_player.Action();
			_DrawOldStage();
			rend_man[0].SetBGColor((_GXColor)0xe4);
			iCheckLoadStatus();
			if (stage[_go_next_room.next_room_no].load_status == 3) {
				_go_next_room.flag = 3;
				_gim.DoorOpen(_go_next_room.old_room_no,
									_go_next_room.open_door_no);
				_stage_no = _go_next_room.next_room_no;
				_iSetStagePos(_stage_no);
				_cam.set_current_room_number(_stage_no);
				_hit.set_current_room_number(_stage_no);
				iVar1 = _hit.get_hit_data(_stage_no);
				if (iVar1 == 0) {
					_hit.set_hit_data(_stage_no,
										stage[_stage_no].datBGH);
				}
				_gim.CoinInit();
				audio.PlaySong(song[7]);
				_step[1]++;
			}
			break;
		case 0x15:
			_RoomCameraMoveProc();
			_gim.Action(_go_next_room.old_room_no);
			_gim.Action(_go_next_room.next_room_no);
			_player.Action();
			_DrawOldStage();
			_Draw_Mpol(0);
			if (_go_next_room.flag == 4) {
				_gim.DoorClose(_go_next_room.old_room_no, _go_next_room.open_door_no);
				_go_next_room.flag = 0;
				_gim.TitleOn(_stage_no);
				_cam.set_mode(2);
				_cam.set_hit_enable_flag(0);
				_cam.set_mcd_data(_stage_no,stage[_stage_no].datMCD);
				_cam.set_speed(@1038,@1038,@1039,@1040);
				_player.MpolModeInit();
				_old_route_counter = _go_next_room.old_room_no;
				_step[1] = 3;
			}
		}
	}
	*/
}

void DMainSystem::_Draw_Mpol(s8 mario_flag){
	GXColor white = {255,255,255,0};

	rend_man[0].SetBGColor(white);

	_gim.CoinDraw();
	_light.Setting(7);

	if(_fog_sw) _cam.SetFogType(GX_FOG_LIN);
	else _cam.SetFogType(GX_FOG_NONE);

	rend_man[0].AddCamera(&_cam);
	if(mario_flag) rend_man[0].AddModel(mario_model);
	rend_man[0].SetTexProjection(0, _player.GetShadowPro(mario_flag));
	rend_man[0].AddModel(stage[7].model[0]);
}

void DMainSystem::_LoadRequestMpol(s8 mode){
	iBgLoadRequest(0x1b, 1, STG_MPOL, 0);
	iBgLoadRequest(0x1f, 2, STG_MPOL, 1);
	iBgLoadRequest(0x1c, 3, STG_MPOL, 0);
	if (mode == 0) {
		iBgLoadRequest(0x1d, 4, STG_MPOL, 0);
	} else {
		iBgLoadRequest(0x1e, 4, STG_MPOL, 0);
	}
	iBgLoadRequest(8, 6, STG_MPOL, 0);
	stage[STG_MPOL].load_status = 1;
}

//unused
void DMainSystem::_DelMpol(){
}

//Adds/subtracts coins depending on which dpad direction is pressed.
//Left/Right: +/-1 coin, Up/Down: +/-20 coins
void DMainSystem::_ModifiNumOfCoint(){
	if(_pad.IsTrg(PAD_CHAN0,PAD_BUTTON_RIGHT)){
		_gim.AddNumOfCoin(1);
	}else if(_pad.IsTrg(PAD_CHAN0,PAD_BUTTON_LEFT)){
		_gim.AddNumOfCoin(-1);
	}else if(_pad.IsTrg(PAD_CHAN0,PAD_BUTTON_UP)){
		_gim.AddNumOfCoin(20);
	}else if(_pad.IsTrg(PAD_CHAN0,PAD_BUTTON_DOWN)){
		_gim.AddNumOfCoin(-20);
	}
}


//Opening/Ending functions

void DMainSystem::_Step_Opening(){
	/*
	Vec pos; //r1_24


		int iVar1;
	DGTexPro *pDVar2;
	DGModel *this_00;
	void *pvVar3;
	Vec local_2c;
	Vec local_20;
	Vec local_14;
	
	switch(_step[1]) {
	case 0:
		iBgLoadRequest(0x20, 1, 6, 0);
		iBgLoadRequest(0x21, 4, 6, 0);
		stage[6].load_status = 1;
		audio.PlaySongFadeOut();
		_step[1]++;
		break;
	case 1:
		_DispNowLoding();
		iCheckLoadStatus();
		if (stage[6].load_status == 3) {
			iBgLoadRequest(1, 1, 0x0, 0);
			iBgLoadRequest(2, 3, 0x0, 0);
			iBgLoadRequest(3, 4, 0x0, 0);
			iBgLoadRequest(1, 6, 0x0, 0);
			stage[0].load_status = 1;
			_step[1]++;
		}
		break;
	case 2:
		local_14.x = @389;
		local_14.y = @389;
		local_14.z = @1114;
		stage[_stage_no].model[0]->SetPosition(&local_14);
		local_14.x = @389;
		local_14.y = @389;
		local_14.z = @389;
		stage[_stage_no].model[0]->SetRotation(&local_14);
		_cam.set_current_room_number(_stage_no);
		_cam.set_mode(2);
		_cam.set_hit_enable_flag(0);
		_cam.set_mcd_data(_stage_no,stage[_stage_no].datMCD);
		_cam.set_speed(@1038,@1038,@1039,@1040);
		local_14.x = @389;
		local_14.y = @389;
		local_14.z = @1115;
		local_20.x = @389;
		local_20.y = @389;
		local_20.z = @1115;
		_player.SetPosition(&local_20);
		local_14.x = @389;
		local_14.y = @865;
		local_14.z = @389;
		local_2c.x = @389;
		local_2c.y = @865;
		local_2c.z = @389;
		_player.SetRotation(&local_2c);
		_player.OpeningInit();
		_gim.OpeningTitleOn();
		_step[1]++;
		break;
	case 3:
		_RoomCameraMoveProc();
		_player.Action();
		_Draw_Opening();
		if (_movie_camera_rcd == 0) {
			_cam.set_mode(1);
			_cam.set_hit_enable_flag(0);
			_cam.set_speed(@1116,@1116,@390,@395);
			_step[1]++;
		}
		break;
	case 4:
		_RoomCameraMoveProc();
		_player.Action();
		_Draw_Opening();
		if (_go_next_room.flag == 1) {
			_cam.set_mode(5);
			_cam.set_hit_enable_flag(0);
			_step[1]++;
		}
		break;
	case 5:
		_RoomCameraMoveProc();
		_player.Action();
		_Draw_Opening();
		iCheckLoadStatus();
		if (stage[_go_next_room.next_room_no].load_status == 3) {
			_go_next_room.flag = 3;

			_gim.DoorOpen(_go_next_room.old_room_no,_go_next_room.open_door_no + 1);
			_stage_no = _go_next_room.next_room_no;
			_iSetStagePos(_stage_no);
			
			_cam.set_current_room_number(_stage_no);
			_hit.set_current_room_number(_stage_no);

			iVar1 = _hit.get_hit_data(_stage_no);

			if (iVar1 == 0) {
				_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
			}

			audio.PlaySong(song);
			_step[1]++;
		}
		break;
	case 6:
		_RoomCameraMoveProc();
		_gim.Action(_go_next_room.next_room_no);
		_player.Action();
		_Draw_Opening();
		_light.Setting(0);
		if (_fog_sw == 0) {
			_cam.SetFogType(GX_FOG_NONE);
		}
		else {
			_cam.SetFogType(GX_FOG_LIN);
		}
		rend_man[0].AddCamera(&_cam);
		pDVar2 = (DGTexPro *)_player.GetShadowPro(0);
		rend_man[0].SetTexProjection(pDVar2);
		rend_man[0].AddModel(stage[0].model[0]);
		if (_go_next_room.flag == 4) {
			_gim.DoorClose(_go_next_room.old_room_no,_go_next_room.open_door_no + 1);
			this_00 = stage[6].model[0];
			if (this_00 != NULL) {
				this_00->~DGModel();
			}
			stage[6].model[0] = NULL;
			pvVar3 = stage[6].datMCD;
			if (pvVar3 != NULL) {
				mFree(pvVar3);
			}
			stage[6].datMCD = NULL;
			bgThread[7072] = 0;
			stage[6].load_status = 0;
			_go_next_room.flag = 0;
			_gim.TitleOn(_stage_no);
			_stage_no = 0;
			_step[0] = 5;
			_step[1] = 3;
			_cam.set_mode(1);
			_cam.set_hit_enable_flag(1);
			_cam.set_speed(@394,@394,@390,@395);
			_mode_no = 0;
		}
	}
	*/
}

void DMainSystem::_Draw_Opening(){
	_light.Setting(6);
	_cam.SetFogType(GX_FOG_NONE);
	rend_man[0].AddCamera(&_cam);
	rend_man[0].AddModel(mario_model);
	rend_man[0].AddModel(stage[6].model[0]);
}

void DMainSystem::_Step_Ending(){
}


//Movie step functions

void DMainSystem::_Step_Movie_All(){
	if (_step[1] != 0) {
		return;
	}
	_stage_no = 0;
	_mode_no = 3;
	_step[0] = 0x10;
	_step[1] = 0;
}

void DMainSystem::_Step_Movie_Entr(){
	/*
		byte bVar1;
	DGTexPro *pDVar2;
	int iVar3;
	
	bVar1 = _step[1];
	if (bVar1 == 2) {
		_iSetStagePos(_stage_no);
		_cam.set_current_room_number(_stage_no);
		_cam.set_mode(2);
		_cam.set_hit_enable_flag(0);
		_cam.set_mcd_data(_stage_no,stage[_stage_no].datMCD);
		_cam.set_speed(@1038,@1038,@1039,@1040);
		iVar3 = _hit.get_hit_data(_stage_no);
		if (iVar3 == 0) {
			_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
		}
		_hit.set_current_room_number(_stage_no);
		_step[1]++;
	}
	else if (bVar1 < 2) {
		if (bVar1 == 0) {
			iBgLoadRequest(1, 1, 0x0, 0);
			iBgLoadRequest(2, 3, 0x0, 0);
			iBgLoadRequest(3, 4, 0x0, 0);
			iBgLoadRequest(1, 6, 0x0, 0);
			stage[0].load_status = 1;
			_step[1]++;
		}
		else if (true) {
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[0].load_status == 3) {
				if (stage[1].load_status == 3) {
					bgThread[7589] = 1;
					stage[1].load_status = 2;
				}
				if (stage[2].load_status == 3) {
					bgThread[7590] = 1;
					stage[2].load_status = 2;
				}
				if (stage[3].load_status == 3) {
					bgThread[7591] = 1;
					stage[3].load_status = 2;
				}
				if (stage[4].load_status == 3) {
					bgThread[7592] = 1;
					stage[4].load_status = 2;
				}
				if (stage[5].load_status == 3) {
					bgThread[7593] = 1;
					stage[5].load_status = 2;
				}
				if (stage[6].load_status == 3) {
					bgThread[7594] = 1;
					stage[6].load_status = 2;
				}
				if (stage[7].load_status == 3) {
					bgThread[7595] = 1;
					stage[7].load_status = 2;
				}
				iBgLoadRequest(8, 1, 2, 0);
				iBgLoadRequest(9, 3, 2, 0);
				iBgLoadRequest(10, 4, 2, 0);
				iBgLoadRequest(2, 6, 2, 0);
				stage[2].load_status = 1;
				_gim.TitleOn(_stage_no);
				_step[1]++;
				audio.PlaySong(song[8]);
			}
		}
	}
	else if (bVar1 < 4) {
		_RoomCameraMoveProc();
		_gim.Action(_stage_no);
		_light.Setting(0);
		if (_fog_sw == 0) {
			_cam.SetFogType(GX_FOG_NONE);
		}
		else {
			_cam.SetFogType(GX_FOG_LIN);
		}
		rend_man[0].AddCamera(&_cam);
		pDVar2 = (DGTexPro *)_player.GetShadowPro(0);
		rend_man[0].SetTexProjection(pDVar2);
		rend_man[0].AddModel(stage[0].model[0]);
		if (_movie_camera_rcd == 0) {
			_stage_no = 2;
			_step[0] = 0x12;
			_step[1] = 1;
		}
		else {
			_pad.IsTrg(0,0x1000);
			if (iVar3 != 0) {
				_save_step[0] = _step[0];
				_save_step[1] = _step[1];
				_cursol_pos[0] = 0;
				_step[0] = 4;
				_step[1] = 0;
			}
		}
	}
	*/
}

void DMainSystem::_Step_Movie_Hang(){
	/*
		byte bVar1;
	DGTexPro *pDVar2;
	int iVar3;
	Vec VStack_14;
	
	bVar1 = _step[1];
	if (bVar1 == 2) {
		_iSetStagePos(_stage_no);
		&VStack_14->GetPosition();
		stage[_stage_no].model[1]->SetPosition(&VStack_14);
		&VStack_14->GetRotation();
		stage[_stage_no].model[1]->SetRotation(&VStack_14);
		_cam.set_current_room_number(_stage_no);
		_cam.set_mode(2);
		_cam.set_hit_enable_flag(0);
		_cam.set_mcd_data(_stage_no,stage[_stage_no].datMCD);
		_cam.set_speed(@1038,@1038,@1039,@1040);
		iVar3 = _hit.get_hit_data(_stage_no);
		if (iVar3 == 0) {
			_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
		}
		_hit.set_current_room_number(_stage_no);
		_step[1]++;
	}
	else if (bVar1 < 2) {
		if (bVar1 == 0) {
			iBgLoadRequest(4, 1, 1, 0);
			iBgLoadRequest(7, 1, 1, 1);
			iBgLoadRequest(5, 3, 1, 0);
			iBgLoadRequest(6, 4, 1, 0);
			iBgLoadRequest(4, 6, 1, 0);
			stage[1].load_status = 1;
			_step[1]++;
		}
		else if (true) {
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[1].load_status == 3) {
				if (stage[0].load_status == 3) {
					bgThread[7588] = 1;
					stage[0].load_status = 2;
				}
				if (stage[2].load_status == 3) {
					bgThread[7590] = 1;
					stage[2].load_status = 2;
				}
				if (stage[3].load_status == 3) {
					bgThread[7591] = 1;
					stage[3].load_status = 2;
				}
				if (stage[4].load_status == 3) {
					bgThread[7592] = 1;
					stage[4].load_status = 2;
				}
				if (stage[5].load_status == 3) {
					bgThread[7593] = 1;
					stage[5].load_status = 2;
				}
				if (stage[6].load_status == 3) {
					bgThread[7594] = 1;
					stage[6].load_status = 2;
				}
				if (stage[7].load_status == 3) {
					bgThread[7595] = 1;
					stage[7].load_status = 2;
				}
				iBgLoadRequest(0xb, 1, 3, 0);
				iBgLoadRequest(0xe, 1, 3, 1);
				iBgLoadRequest(0xc, 3, 3, 0);
				iBgLoadRequest(0xd, 4, 3, 0);
				iBgLoadRequest(5, 6, 3, 0);
				stage[3].load_status = 1;
				_gim.TitleOn(_stage_no);
				_step[1]++;
				audio.PlaySong(song[8]);
			}
		}
	}
	else if (bVar1 < 4) {
		_RoomCameraMoveProc();
		_gim.Action(_stage_no);
		if (_fog_sw == 0) {
			_cam.SetFogType(GX_FOG_NONE);
		}
		else {
			_cam.SetFogType(GX_FOG_LIN);
		}
		_light.Setting(1);
		rend_man[0].AddCamera(&_cam);
		pDVar2 = (DGTexPro *)_player.GetShadowPro(0);
		rend_man[0].SetTexProjection(pDVar2);
		rend_man[0].AddModel(stage[1].model[1]);
		rend_man[0].AddModel(stage[1].model[0]);
		if (_movie_camera_rcd == 0) {
			_stage_no = 3;
			_step[0] = 0x13;
			_step[1] = 1;
		}
		else {
			_pad.IsTrg(0,0x1000);
			if (iVar3 != 0) {
				_save_step[0] = _step[0];
				_save_step[1] = _step[1];
				_cursol_pos[0] = 0;
				_step[0] = 4;
				_step[1] = 0;
			}
		}
	}
	*/
}

void DMainSystem::_Step_Movie_Dome(){
	/*
		byte bVar1;
	DGTexPro *pDVar2;
	int iVar3;
	
	bVar1 = _step[1];
	if (bVar1 == 2) {
		_iSetStagePos(_stage_no);
		_cam.set_current_room_number(_stage_no);
		_cam.set_mode(2);
		_cam.set_hit_enable_flag(0);
		_cam.set_mcd_data(_stage_no,stage[_stage_no].datMCD);
		_cam.set_speed(@1038,@1038,@1039,@1040);
		iVar3 = _hit.get_hit_data(_stage_no);
		if (iVar3 == 0) {
			_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
		}
		_hit.set_current_room_number(_stage_no);
		_step[1]++;
	}
	else if (bVar1 < 2) {
		if (bVar1 == 0) {
			iBgLoadRequest(8, 1, 2, 0);
			iBgLoadRequest(9, 3, 2, 0);
			iBgLoadRequest(10, 4, 2, 0);
			iBgLoadRequest(2, 6, 2, 0);
			stage[2].load_status = 1;
			_step[1]++;
		}
		else if (true) {
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[2].load_status == 3) {
				if (stage[0].load_status == 3) {
					bgThread[7588] = 1;
					stage[0].load_status = 2;
				}
				if (stage[1].load_status == 3) {
					bgThread[7589] = 1;
					stage[1].load_status = 2;
				}
				if (stage[3].load_status == 3) {
					bgThread[7591] = 1;
					stage[3].load_status = 2;
				}
				if (stage[4].load_status == 3) {
					bgThread[7592] = 1;
					stage[4].load_status = 2;
				}
				if (stage[5].load_status == 3) {
					bgThread[7593] = 1;
					stage[5].load_status = 2;
				}
				if (stage[6].load_status == 3) {
					bgThread[7594] = 1;
					stage[6].load_status = 2;
				}
				if (stage[7].load_status == 3) {
					bgThread[7595] = 1;
					stage[7].load_status = 2;
				}
				iBgLoadRequest(0x15, 1, 5, 0);
				iBgLoadRequest(0x16, 3, 5, 0);
				iBgLoadRequest(0x17, 4, 5, 0);
				iBgLoadRequest(3, 6, 5, 0);
				stage[5].load_status = 1;
				_gim.TitleOn(_stage_no);
				_step[1]++;
				audio.PlaySong(song[8]);
			}
		}
	}
	else if (bVar1 < 4) {
		_RoomCameraMoveProc();
		_gim.Action(_stage_no);
		_light.Setting(2);
		if (_fog_sw == 0) {
			_cam.SetFogType(GX_FOG_NONE);
		}
		else {
			_cam.SetFogType(GX_FOG_LIN);
		}
		rend_man[0].AddCamera(&_cam);
		pDVar2 = (DGTexPro *)_player.GetShadowPro(0);
		rend_man[0].SetTexProjection(pDVar2);
		rend_man[0].AddModel(stage[2].model[0]);
		if (_movie_camera_rcd == 0) {
			_stage_no = 5;
			_step[0] = 0x15;
			_step[1] = 1;
		}
		else {
			_pad.IsTrg(0,0x1000);
			if (iVar3 != 0) {
				_save_step[0] = _step[0];
				_save_step[1] = _step[1];
				_cursol_pos[0] = 0;
				_step[0] = 4;
				_step[1] = 0;
			}
		}
	}
	*/
}

void DMainSystem::_Step_Movie_Cave(){
	/*
		byte bVar1;
	int iVar2;
	undefined4 local_1c;
	Vec VStack_18;
	
	bVar1 = _step[1];
	if (bVar1 == 2) {
		_iSetStagePos(_stage_no);
		&VStack_18->GetPosition();
		stage[_stage_no].model[1]->SetPosition(&VStack_18);
		&VStack_18->GetRotation();
		stage[_stage_no].model[1]->SetRotation(&VStack_18);
		local_1c = @773;
		_cam.SetFogColor((_GXColor *)&local_1c);
		_cam.SetFogRange(@775,@776);
		_cam.set_current_room_number(_stage_no);
		_cam.set_mode(2);
		_cam.set_hit_enable_flag(0);
		_cam.set_mcd_data(_stage_no,stage[_stage_no].datMCD);
		_cam.set_speed(@1038,@1038,@1039,@1040);
		iVar2 = _hit.get_hit_data(_stage_no);
		if (iVar2 == 0) {
			_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
		}
		_hit.set_current_room_number(_stage_no);
		_step[1]++;
	}
	else if (bVar1 < 2) {
		if (bVar1 == 0) {
			iBgLoadRequest(0xb, 1, 3, 0);
			iBgLoadRequest(0xe, 1, 3, 1);
			iBgLoadRequest(0xc, 3, 3, 0);
			iBgLoadRequest(0xd, 4, 3, 0);
			iBgLoadRequest(5, 6, 3, 0);
			stage[3].load_status = 1;
			_step[1]++;
		}
		else if (true) {
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[3].load_status == 3) {
				if (stage[0].load_status == 3) {
					bgThread[7588] = 1;
					stage[0].load_status = 2;
				}
				if (stage[1].load_status == 3) {
					bgThread[7589] = 1;
					stage[1].load_status = 2;
				}
				if (stage[2].load_status == 3) {
					bgThread[7590] = 1;
					stage[2].load_status = 2;
				}
				if (stage[4].load_status == 3) {
					bgThread[7592] = 1;
					stage[4].load_status = 2;
				}
				if (stage[5].load_status == 3) {
					bgThread[7593] = 1;
					stage[5].load_status = 2;
				}
				if (stage[6].load_status == 3) {
					bgThread[7594] = 1;
					stage[6].load_status = 2;
				}
				if (stage[7].load_status == 3) {
					bgThread[7595] = 1;
					stage[7].load_status = 2;
				}
				iBgLoadRequest(0xf, 1, 4, 0);
				iBgLoadRequest(0x10, 3, 4, 0);
				iBgLoadRequest(0x11, 4, 4, 0);
				iBgLoadRequest(0, 5, 4, 0);
				iBgLoadRequest(6, 6, 4, 0);
				stage[4].load_status = 1;
				_gim.TitleOn(_stage_no);
				_step[1]++;
				audio.PlaySong(song[8]);
			}
		}
	}
	else if (bVar1 < 4) {
		_RoomCameraMoveProc();
		_gim.Action(_stage_no);
		_Draw_Cave(0);
		if (_movie_camera_rcd == 0) {
			_stage_no = 4;
			_step[0] = 0x14;
			_step[1] = 1;
		}
		else {
			_pad.IsTrg(0,0x1000);
			if (iVar2 != 0) {
				_save_step[0] = _step[0];
				_save_step[1] = _step[1];
				_cursol_pos[0] = 0;
				_step[0] = 4;
				_step[1] = 0;
			}
		}
	}
	*/
}

void DMainSystem::_Step_Movie_Cine(){
	/*
		byte bVar1;
	int iVar2;
	
	bVar1 = _step[1];
	if (bVar1 == 2) {
		_iSetStagePos(_stage_no);
		_cam.set_current_room_number(_stage_no);
		_cam.set_mode(2);
		_cam.set_hit_enable_flag(0);
		_cam.set_mcd_data(_stage_no,stage[_stage_no].datMCD);
		_cam.set_speed(@1038,@1038,@1039,@1040);
		iVar2 = _hit.get_hit_data(_stage_no);
		if (iVar2 == 0) {
			_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
		}
		_hit.set_current_room_number(_stage_no);
		_iCineProInit();
		_step[1]++;
	}
	else if (bVar1 < 2) {
		if (bVar1 == 0) {
			iBgLoadRequest(0xf, 1, 4, 0);
			iBgLoadRequest(0x10, 3, 4, 0);
			iBgLoadRequest(0x11, 4, 4, 0);
			iBgLoadRequest(0, 5, 4, 0);
			iBgLoadRequest(6, 6, 4, 0);
			stage[4].load_status = 1;
			_step[1]++;
		}
		else if (true) {
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[4].load_status == 3) {
				if (stage[0].load_status == 3) {
					bgThread[7588] = 1;
					stage[0].load_status = 2;
				}
				if (stage[1].load_status == 3) {
					bgThread[7589] = 1;
					stage[1].load_status = 2;
				}
				if (stage[2].load_status == 3) {
					bgThread[7590] = 1;
					stage[2].load_status = 2;
				}
				if (stage[3].load_status == 3) {
					bgThread[7591] = 1;
					stage[3].load_status = 2;
				}
				if (stage[5].load_status == 3) {
					bgThread[7593] = 1;
					stage[5].load_status = 2;
				}
				if (stage[6].load_status == 3) {
					bgThread[7594] = 1;
					stage[6].load_status = 2;
				}
				if (stage[7].load_status == 3) {
					bgThread[7595] = 1;
					stage[7].load_status = 2;
				}
				iBgLoadRequest(0x18, 1, 6, 0);
				iBgLoadRequest(0x19, 3, 6, 0);
				iBgLoadRequest(0x1a, 4, 6, 0);
				iBgLoadRequest(7, 6, 6, 0);
				stage[6].load_status = 1;
				_gim.TitleOn(_stage_no);
				_step[1]++;
				audio.PlaySong(song[8]);
			}
		}
	}
	else if (bVar1 < 4) {
		_RoomCameraMoveProc();
		_gim.Action(_stage_no);
		_iCinemaProjectionProc();
		if ((_stimer & 3) == 0) {
			cinema.film_cnt = cinema.film_cnt + 1;
		}
		if (0x4a < cinema.film_cnt) {
			cinema.film_cnt = 0;
		}
		_Draw_Cine(0);
		if (_movie_camera_rcd == 0) {
			_stage_no = 6;
			_step[0] = 0x16;
			_step[1] = 1;
		}
		else {
			_pad.IsTrg(0,0x1000);
			if (iVar2 != 0) {
				_save_step[0] = _step[0];
				_save_step[1] = _step[1];
				_cursol_pos[0] = 0;
				_step[0] = 4;
				_step[1] = 0;
			}
		}
	}
	*/
}

void DMainSystem::_Step_Movie_Spil(){
	/*
	Vec player_rol; //r1_24

		byte bVar1;
	DGTexPro *pDVar2;
	int iVar3;
	Vec local_3c;
	Vec local_30;
	float local_24;
	float local_20;
	float local_1c;
	
	bVar1 = _step[1];
	if (bVar1 == 2) {
		_iSetStagePos(_stage_no);
		_cam.set_current_room_number(_stage_no);
		_cam.set_mode(2);
		_cam.set_hit_enable_flag(0);
		_cam.set_mcd_data(_stage_no,stage[_stage_no].datMCD);
		_cam.set_speed(@1038,@1038,@1039,@1040);
		local_24 = 0.0;
		local_20 = 0.0;
		local_1c = 0.0;
		local_30.x = -158.68;
		local_30.y = -95.0;
		local_30.z = 88.26;
		_player.SetPosition(&local_30);
		local_3c.x = local_24;
		local_3c.y = local_20;
		local_3c.z = local_1c;
		_player.SetRotation(&local_3c);
		_player.SpilModeInit();
		iVar3 = _hit.get_hit_data(_stage_no);
		if (iVar3 == 0) {
			_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
		}
		_hit.set_current_room_number(_stage_no);
		_step[1]++;
	}
	else if (bVar1 < 2) {
		if (bVar1 == 0) {
			iBgLoadRequest(0x15, 1, 5, 0);
			iBgLoadRequest(0x16, 3, 5, 0);
			iBgLoadRequest(0x17, 4, 5, 0);
			iBgLoadRequest(3, 6, 5, 0);
			stage[5].load_status = 1;
			_step[1]++;
		}
		else if (true) {
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[5].load_status == 3) {
				if (stage[0].load_status == 3) {
					bgThread[7588] = 1;
					stage[0].load_status = 2;
				}
				if (stage[1].load_status == 3) {
					bgThread[7589] = 1;
					stage[1].load_status = 2;
				}
				if (stage[2].load_status == 3) {
					bgThread[7590] = 1;
					stage[2].load_status = 2;
				}
				if (stage[3].load_status == 3) {
					bgThread[7591] = 1;
					stage[3].load_status = 2;
				}
				if (stage[4].load_status == 3) {
					bgThread[7592] = 1;
					stage[4].load_status = 2;
				}
				if (stage[6].load_status == 3) {
					bgThread[7594] = 1;
					stage[6].load_status = 2;
				}
				if (stage[7].load_status == 3) {
					bgThread[7595] = 1;
					stage[7].load_status = 2;
				}
				iBgLoadRequest(4, 1, 1, 0);
				iBgLoadRequest(7, 1, 1, 1);
				iBgLoadRequest(5, 3, 1, 0);
				iBgLoadRequest(6, 4, 1, 0);
				iBgLoadRequest(4, 6, 1, 0);
				stage[1].load_status = 1;
				_gim.TitleOn(_stage_no);
				_step[1]++;
				audio.PlaySong(song[8]);
			}
		}
	}
	else if (bVar1 < 4) {
		_RoomCameraMoveProc();
		_gim.Action(_stage_no);
		_player.Action();
		_player.CreateShadow();
		_player.CreateSpilShadow();
		_light.Setting(5);
		if (_fog_sw == 0) {
			_cam.SetFogType(GX_FOG_NONE);
		}
		else {
			_cam.SetFogType(GX_FOG_LIN);
		}
		rend_man[0].AddCamera(&_cam);
		rend_man[0].AddModel(mario_model);
		pDVar2 = (DGTexPro *)_player.GetShadowPro(1);
		rend_man[0].SetTexProjection(pDVar2);
		pDVar2 = (DGTexPro *)_player.GetSpilShadowPro(1);
		rend_man[0].SetTexProjection(1, pDVar2);
		rend_man[0].AddModel(stage[5].model[0]);
		if (_movie_camera_rcd == 0) {
			_stage_no = 1;
			_step[0] = 0x11;
			_step[1] = 1;
		}
		else {
			_pad.IsTrg(0,0x1000);
			if (iVar3 != 0) {
				_save_step[0] = _step[0];
				_save_step[1] = _step[1];
				_cursol_pos[0] = 0;
				_step[0] = 4;
				_step[1] = 0;
			}
		}
	}
	*/
}

void DMainSystem::_Step_Movie_Enve(){
	/*
		byte bVar1;
	DGTexPro *pDVar2;
	int iVar3;
	
	bVar1 = _step[1];
	if (bVar1 == 2) {
		_iSetStagePos(_stage_no);
		_cam.set_current_room_number(_stage_no);
		_cam.set_mode(2);
		_cam.set_hit_enable_flag(0);
		_cam.set_mcd_data(_stage_no,stage[_stage_no].datMCD);
		_cam.set_speed(@1038,@1038,@1039,@1040);
		iVar3 = _hit.get_hit_data(_stage_no);
		if (iVar3 == 0) {
			_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
		}
		_hit.set_current_room_number(_stage_no);
		_step[1]++;
	}
	else if (bVar1 < 2) {
		if (bVar1 == 0) {
			iBgLoadRequest(0x18, 1, 6, 0);
			iBgLoadRequest(0x19, 3, 6, 0);
			iBgLoadRequest(0x1a, 4, 6, 0);
			iBgLoadRequest(7, 6, 6, 0);
			stage[6].load_status = 1;
			_step[1]++;
		}
		else if (true) {
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[6].load_status == 3) {
				if (stage[0].load_status == 3) {
					bgThread[7588] = 1;
					stage[0].load_status = 2;
				}
				if (stage[1].load_status == 3) {
					bgThread[7589] = 1;
					stage[1].load_status = 2;
				}
				if (stage[2].load_status == 3) {
					bgThread[7590] = 1;
					stage[2].load_status = 2;
				}
				if (stage[3].load_status == 3) {
					bgThread[7591] = 1;
					stage[3].load_status = 2;
				}
				if (stage[4].load_status == 3) {
					bgThread[7592] = 1;
					stage[4].load_status = 2;
				}
				if (stage[5].load_status == 3) {
					bgThread[7593] = 1;
					stage[5].load_status = 2;
				}
				if (stage[7].load_status == 3) {
					bgThread[7595] = 1;
					stage[7].load_status = 2;
				}
				iBgLoadRequest(0x1b, 1, 0xa, 0);
				iBgLoadRequest(0x1f, 2, 0xa, 1);
				iBgLoadRequest(0x1c, 3, 0xa, 0);
				iBgLoadRequest(0x1d, 4, 0xa, 0);
				iBgLoadRequest(8, 6, 0xa, 0);
				stage[7].load_status = 1;
				_gim.TitleOn(_stage_no);
				_step[1]++;
				audio.PlaySong(song[8]);
			}
		}
	}
	else if (bVar1 < 4) {
		_RoomCameraMoveProc();
		_gim.Action(_stage_no);
		_light.Setting(6);
		if (_fog_sw == 0) {
			_cam.SetFogType(GX_FOG_NONE);
		}
		else {
			_cam.SetFogType(GX_FOG_LIN);
		}
		rend_man[0].AddCamera(&_cam);
		pDVar2 = (DGTexPro *)_player.GetShadowPro(0);
		rend_man[0].SetTexProjection(pDVar2);
		rend_man[0].AddModel(stage[6].model[0]);
		if (_movie_camera_rcd == 0) {
			_stage_no = 7;
			_step[0] = 0x17;
			_step[1] = 1;
		}
		else {
			_pad.IsTrg(0,0x1000);
			if (iVar3 != 0) {
				_save_step[0] = _step[0];
				_save_step[1] = _step[1];
				_cursol_pos[0] = 0;
				_step[0] = 4;
				_step[1] = 0;
			}
		}
	}
	*/
}

void DMainSystem::_Step_Movie_Mpol(){
	/*
		byte bVar1;
	int iVar2;
	DGTexPro *pDVar3;
	
	bVar1 = _step[1];
	if (bVar1 == 2) {
		_iSetStagePos(_stage_no);
		_cam.set_current_room_number(_stage_no);
		_cam.set_mode(2);
		_cam.set_hit_enable_flag(0);
		_cam.set_mcd_data(_stage_no,stage[_stage_no].datMCD);
		_cam.set_speed(@1038,@1038,@1039,@1040);
		_gim.CoinInit();
		iVar2 = _hit.get_hit_data(_stage_no);
		if (iVar2 == 0) {
			_hit.set_hit_data(_stage_no,stage[_stage_no].datBGH);
		}
		_hit.set_current_room_number(_stage_no);
		_step[1]++;
	}
	else if (bVar1 < 2) {
		if (bVar1 == 0) {
			iBgLoadRequest(0x1b, 1, 0xa, 0);
			iBgLoadRequest(0x1f, 2, 0xa, 1);
			iBgLoadRequest(0x1c, 3, 0xa, 0);
			iBgLoadRequest(0x1d, 4, 0xa, 0);
			iBgLoadRequest(8, 6, 0xa, 0);
			stage[7].load_status = 1;
			_step[1]++;
		}
		else if (true) {
			_DispNowLoding();
			iCheckLoadStatus();
			if (stage[7].load_status == 3) {
				if (stage[0].load_status == 3) {
					bgThread[7588] = 1;
					stage[0].load_status = 2;
				}
				if (stage[1].load_status == 3) {
					bgThread[7589] = 1;
					stage[1].load_status = 2;
				}
				if (stage[2].load_status == 3) {
					bgThread[7590] = 1;
					stage[2].load_status = 2;
				}
				if (stage[3].load_status == 3) {
					bgThread[7591] = 1;
					stage[3].load_status = 2;
				}
				if (stage[4].load_status == 3) {
					bgThread[7592] = 1;
					stage[4].load_status = 2;
				}
				if (stage[5].load_status == 3) {
					bgThread[7593] = 1;
					stage[5].load_status = 2;
				}
				if (stage[6].load_status == 3) {
					bgThread[7594] = 1;
					stage[6].load_status = 2;
				}
				iBgLoadRequest(1, 1, 0x0, 0);
				iBgLoadRequest(2, 3, 0x0, 0);
				iBgLoadRequest(3, 4, 0x0, 0);
				iBgLoadRequest(1, 6, 0x0, 0);
				stage[0].load_status = 1;
				_gim.TitleOn(_stage_no);
				_step[1]++;
				audio.PlaySong(song[8]);
			}
		}
	}
	else if (bVar1 < 4) {
		_RoomCameraMoveProc();
		_gim.Action(_stage_no);
		if ((_stimer & 0x1f) == 0) {
			_gim.CoinDrop();
		}
		if (_movie_camera_rcd == 0) {
			rend_man[0].SetBGColor((_GXColor)0xec);
			_gim.CoinExit();
			_stage_no = 0;
			_step[0] = 0x10;
			_step[1] = 1;
			audio.PlaySongFadeOut();
		}
		else {
			_pad.IsTrg(0,0x1000);
			if (iVar2 != 0) {
				_save_step[0] = _step[0];
				_save_step[1] = _step[1];
				_cursol_pos[0] = 0;
				_step[0] = 4;
				_step[1] = 0;
			}
			rend_man[0].SetBGColor((_GXColor)0xe8);
			_gim.CoinDraw();
			_light.Setting('\a');
			if (_fog_sw == 0) {
				_cam.SetFogType(GX_FOG_NONE);
			}
			else {
				_cam.SetFogType(GX_FOG_LIN);
			}
			rend_man[0].AddCamera(&_cam);
			pDVar3 = (DGTexPro *)_player.GetShadowPro(0);
			rend_man[0].SetTexProjection(pDVar3);
			rend_man[0].AddModel(stage[7].model[0]);
		}
	}
	*/
}




void DMainSystem::iCheckLoadStatus(){
	for (s8 i = 0; i < 8; i++) {
		if (stage[i].load_status == 1 && iBgCheckLoadEnd(i)){
			stage[i].load_status = 3;
		}
	}
}

void DMainSystem::_CursolMove(s8 max, s16 y){
	if(_cursol_wait != 0 && (_old_stick[1] > 12 || _old_stick[1] < -12)){
		_cursol_wait--;
	}else{
		_cursol_wait = 16;

		if(_pad.StickY(PAD_CHAN0) > 12){
			_cursol_pos[0]--;
			_stimer = 15;
		}else if(_pad.StickY(PAD_CHAN0) < -12){
			_cursol_pos[0]++;
			_stimer = 15;
		}

		if(_cursol_pos[0] >= max){
			_cursol_pos[0] = 0;
		}else if(_cursol_pos[0] < 0){
			_cursol_pos[0] = max - 1;
		}
	}

	sysFont->SetPosition(((_stimer >> 1) & 0xF) + 32, y + (80 + _cursol_pos[0]*20));
	sysFont->StrOut("=>");
	_old_stick[0] = _pad.StickX(PAD_CHAN0);
	_old_stick[1] = _pad.StickY(PAD_CHAN0);
}

//Format: y angle, x pos, y pos, z pos
static float iMarioInitPosDat[32] = {
	180, 0, 0, 95,
	-20, -264.268, -108.74, 171.35299,
	60, 133.567, 0, 77.11,
	-50, 103, -108.5, -56,
	180, 60, 40, -196,
	-60, -129.967, 1, 74,
	180, -54, 44, -202,
	-90, -124.5, 40, -126.5
};

void DMainSystem::_iSetMarioPosRol(s8 stage_no){
	Vec pos; //r1_34
	Vec rol; //r1_28
	s32 index = stage_no * 4;

	rol.x = 0;
	rol.y = iMarioInitPosDat[index];
	rol.z = 0;

	pos.x = iMarioInitPosDat[index + 1];
	pos.y = iMarioInitPosDat[index + 2];
	pos.z = iMarioInitPosDat[index + 3];

	_player.SetPosition(pos);
	_player.SetRotation(rol);
}

static float iCameraInitPosDat[48] = {
	0, 30, 125, 0,
	17, 95, -257.44299, -73.74,
	152.575, -264.268, -91.74, 171.35299,
	107.586, 35, 62.1, 133.567,
	17, 77.11, 126, -78.5,
	-74.7, 103, -91.5, -56,
	85, 70, -97, 85,
	57, -127, -112.646, 36,
	64, -119.967, 18, 91.321,
	-54, 84, -182, -54,
	61, -202, -94.5, 70,
	-126.5, -124.5, 57, -126.5
};

void DMainSystem::_iSetCameraPos(s8 stage_no){
	s32 index; //r30
	Vec pos; //r1_1c
}

static float iRoomInitPosDat[32] = {
	0, 0, 0, 0,
	120, -308.44, -153.26, 226.37,
	150, 161.287597, 0, 93.1117,
	0, 50, -110, 0,
	0, 85, 40, -222,
	-60, -175, -110, 100,
	0, -54, 40, -242,
	0, -185.5, 40, -127.5
};

void DMainSystem::_iSetStagePos(s8 stage_no){
	Vec pos; //r1_1c
	Vec rol; //r1_10
	s32 index; //r8
}

void DMainSystem::GetStageOffset(u8 stage_no, Vec* pos, Vec* rol){
	s32 index;
}

void DMainSystem::_RoomCameraMoveProc(){
	float t; //r1_c
}

//unused
void DMainSystem::iSysInit(){
	u32 fbSize; //r30
}

//unused
void DMainSystem::iBeforeRender(){
}

//unused
void DMainSystem::iDoneRender(){
}

void DMainSystem::_SetMipMap(){
}

s8 DMainSystem::_DeleteAllStage(){
	s8 i; //r4
	s8 rcd; //r26
}

void DMainSystem::_FileManager(){
	s8 i; //r29
}

void DMainSystem::_LoadRequestRoomFile(s8 stage_no){
}

void DMainSystem::_FreeRequestRoomFile(s8 stage_no){
}

void DMainSystem::_DispNowLoding(){
	if(_stimer & 0x10){
		sysFont->Begin(&(rend_man[0]));
		sysFont->SetPosition(400, 40);
		sysFont->StrOut("Now Loading...");
		sysFont->End();
	}
}

void DMainSystem::iGoNextRoom(u8 next_stage_no, u8 open_door_no, Vec* door_start, Vec* door_end){
	_go_next_room.flag = 1;
	_go_next_room.next_room_no = next_stage_no;
	_go_next_room.open_door_no = open_door_no;
	_go_next_room.old_room_no = _stage_no;
	_go_next_room.door_start.set(door_start);
	_go_next_room.door_end.set(door_end);
}

void DMainSystem::iGoNextPipe(u8 next_stage_no, Vec* pipe_pos, Vec* next_pipe_pos){
	_go_next_room.flag = 2;
	_go_next_room.next_room_no = next_stage_no;
	_go_next_room.old_room_no = _stage_no;
	_go_next_room.door_start.set(pipe_pos);
	_go_next_room.door_end.set(next_pipe_pos);
}

s8 DMainSystem::iCheckReady(){
	if(_go_next_room.flag == 3) return true;
	else return false;
}

void DMainSystem::iCheckIn(){
	_go_next_room.flag = 4;
}

void DMainSystem::_DrawOldStage(){
}

void DMainSystem::_CheckMoveRoom(){
}

//unused
void DMainSystem::iSetFogSw(s8 sw){
}

void DMainSystem::_iChangeTvMode(){
}

s8 DMainSystem::iIsAllOffCoin(){
	return _gim.IsAllOffCoin();
}

void DMainSystem::iMpolDoorOpen(){
	_go_next_room.flag = 5;
}

void DMainSystem::iMpolDoorClose(){
	_go_next_room.flag = 6;
}

static const char* textMipmap[3] = {
	"OFF\n",
	"Normal\n",
	"Expensive\n"
};

static const char* textRenderMode[9] = {
	"GXNtsc240Ds\n",
	"GXNtsc240DsAa\n",
	"GXNtsc240Int\n",
	"GXNtsc240IntAa\n",
	"GXNtsc480IntDf\n",
	"GXNtsc480Int\n",
	"GXNtsc480IntAa\n",
	"GXNtsc480Prog\n",
	"GXNtsc480ProgAa\n"
};

static const char* textOnOff[2] = {
	"OFF\n",
	"ON\n"
};

static const char* textGamma[3] = {
	"1.0\n",
	"1.7\n",
	"2.2\n"
};

void DMainSystem::_iConsoleDraw(s8 pas_cnt){
	u8 unused;
	s16 y; //r29

	if((_old_tv_mode == 6 || _old_tv_mode == 8) && pas_cnt == 1){
		y = -240;
	}else{
		y = 0;
	}

	switch(_console_step){
		case STEP_PAUSE_MENU:
			sysFont->Begin(&(rend_man[0]));

			sysFont->SetPosition(0x30, y + 0x28);
			sysFont->StrOut("PAUSE MENU");

			sysFont->SetPosition(0x30, y + 0x50);
			sysFont->StrOut("MIP MAP     :");
			sysFont->StrOut(textMipmap[_mipmap_mode]);

			sysFont->StrOut("RENDER MODE :");
			sysFont->StrOut(textRenderMode[_tv_mode]);

			sysFont->StrOut("SYSTEM INFO :");
			sysFont->StrOut(textOnOff[_sys_inf_disp_flag]);

			if(!_sys_inf_disp_flag){
				sysFont->SetColor(128, 128, 128, 255);
			}

			sysFont->StrOut("      Perf0 :");
			sysFont->StrOut(stPerf0[_perf0_type].text);
			sysFont->StrOut("\n");

			sysFont->StrOut("      Perf1: ");
			sysFont->StrOut(stPerf1[_perf1_type].text);
			sysFont->StrOut("\n");

			sysFont->SetColor(255, 255, 255, 255);

			sysFont->StrOut("METER       :");
			sysFont->StrOut(textOnOff[_meter_disp_flag]);

			s32 gamma_type = DGRendMan::m_DispCopyGamma;

			sysFont->StrOut("GAMMA       :");
			sysFont->StrOut(textGamma[gamma_type]);

			sysFont->StrOut("Sequence    :");
			if(audio.GetMuteSequence() == 0){
				sysFont->StrOut(textOnOff[1]);
			}else{
				sysFont->StrOut(textOnOff[0]);
			}

			sysFont->StrOut("SE          :");
			if(audio.GetMuteSe() == 0){
				sysFont->StrOut(textOnOff[1]);
			}else{
				sysFont->StrOut(textOnOff[0]);
			}

			sysFont->StrOut("\n");
			sysFont->StrOut("Return -MAIN MENU\n");

			_CursolMove(11, y);
			sysFont->End();
			break;
		case STEP_MOVIE_SELECT_MENU:
			sysFont->Begin(&(rend_man[0]));

			sysFont->SetPosition(0x30, y + 0x28);
			sysFont->StrOut("AUTO DEMO STAGE SELECT MENU");

			sysFont->SetPosition(0x50, y + 0x50);
			sysFont->StrOut("ENTRANCE\n");
			sysFont->StrOut("DOME\n");
			sysFont->StrOut("SPIRAL STAIRCASE\n");
			sysFont->StrOut("HANGAR\n");
			sysFont->StrOut("CAVE\n");
			sysFont->StrOut("CINEMA THEATER\n");
			sysFont->StrOut("METAL MARIO!\n");
			sysFont->StrOut("How Many COINS?\n");
			sysFont->StrOut("\n");
			sysFont->StrOut("Return -MAIN MENU\n");

			_CursolMove(10, y);
			sysFont->End();
			break;
		case STEP_ROOM_SELECT_MENU:
			sysFont->Begin(&(rend_man[0]));

			sysFont->SetPosition(0x30, y + 0x28);
			sysFont->StrOut("STAGE SELECT MENU");

			sysFont->SetPosition(0x50, y + 0x50);
			sysFont->StrOut("ENTRANCE\n");
			sysFont->StrOut("DOME\n");
			sysFont->StrOut("SPIRAL STAIRCASE\n");
			sysFont->StrOut("HANGAR\n");
			sysFont->StrOut("CAVE\n");
			sysFont->StrOut("CINEMA THEATER\n");
			sysFont->StrOut("METAL MARIO!\n");
			sysFont->StrOut("How Many COINS?\n");
			sysFont->StrOut("\n");
			sysFont->StrOut("Return -MAIN MENU\n");

			_CursolMove(10, y);
			sysFont->End();
			break;
		case STEP_MAIN_MENU:
			sysFont->Begin(&(rend_man[0]));

			sysFont->SetPosition(0x30, y + 0x28);
		
			sysFont->StrOut("MAIN MENU");
			sysFont->SetPosition(0x50, y + 0x50);
			sysFont->StrOut("NORMAL DEMO -START\n");
			sysFont->StrOut("AUTO DEMO -START\n");
			sysFont->StrOut("\n");

			sysFont->StrOut("NORMAL DEMO  -STAGE SELECT MENU\n");
			sysFont->StrOut("AUTO DEMO -STAGE SELECT MENU\n");

			_CursolMove(5, y);
			sysFont->End();
			break;
		case STEP_INIT_SYS:
		default:
		break;
	}

	if(_mode_no == 3 || _mode_no == 1){
		_gim.MovieAction(y);
	}
}

void DMainSystem::_disp_meter(){
	s64 swTime = OSCheckStopwatch(&SwMsec);
	MSecCPU = OSTicksToMilliseconds((float)swTime);
	DrawFrameBar(MSecCPU, MSecGX);
}

static void CheckRenderingTime(){
	s64 swTime = OSCheckStopwatch(&SwMsec);
	MSecGX = OSTicksToMilliseconds((float)swTime);
	GXReadGPMetric(&triCnt, &verCnt);
}

static void DrawFrameBar(float mSecCPU, float mSecGX){
	GXColor frmClr; //r1_22c
	float frmPts[28]; //r1_1bc
	u8 frmLineWid; //r1_8
	GXColor bkdClr; //r1_1b8
	float bkdPts[4]; //r1_1a8
	u8 bkdLineWid; //r1_8
	GXColor cpuClr; //r1_1a4
	float cpuPts[4]; //r1_194
	u8 cpuLineWid; //r1_8
	GXColor gxClr; //r1_190
	float gxPts[4]; //r1_180
	u8 gxLineWid; //r1_8

	float SCRN_Y_OFFSET; //f15
	Mtx44 mProj; //r1_124
	float pSave[7]; //r1_108
	u32 i; //r1_8
	float scale; //f2
	Mtx mID; //r1_cc
}

static void iBgThreadInit(){
	s32 i; //r1_8
}

static s16 iBgLoadRequest(u16 file_no, u8 request_flag, s8 stage_no, s8 model_no){
	s16 rcd; //r3
}

static s8 iBgCheckLoadEnd(s8 stg_no){
	s8 rcd; //r3
	s8 i; //r8
}

//unused
static s16 iBgClearRequest(){
}

//param name not in dwarf
static void* iBgThread(void* arg0){
	s16 i; //r25
	u32 size; //r28
	DVDFileInfo fp; //r1_1c
	u8* dat; //r4
	char buf[16]; //r1_c
}

static s16 iBgDeleteRequest(){
	s16 i; //r31
}

