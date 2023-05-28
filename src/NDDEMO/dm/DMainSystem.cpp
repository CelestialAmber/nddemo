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
		u8 unk1; //padding
		s16 wait_table[128]; //0x2
	} stage[8]; //0x1594
	u8 delete_flag[9]; //0x1da4
	u8 unk1DAD[3]; //padding
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

static void CheckRenderingTime();
static void DrawFrameBar(float mSecCPU, float mSecGX);
static s16 iBgLoadRequest(u16 file_no, u8 request_flag, s8 stage_no, s8 model_no);
static s8 iBgCheckLoadEnd(s8 stg_no);
static void iBgThreadInit();


DMainSystem::DMainSystem() : model_man(16, 512, 2048) {
	_stimer = 0;
	_step[0] = 0;
	_step[1] = 0;

	for(s8 i = 0; i < 8; i++){
		stage[i].load_status = STG_NOT_LOADED;
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
	//s16 i; //r5
	//Vec camup; //r1_60
	//Vec campos; //r1_54
	//Vec camtagpos; //r1_48
	//GXColor fogcolor; //r1_44

		
	GXColor black = {0,0,0,0};

	GXSetCopyClear(black, 0xffffff);
	GXClearVtxDesc();

	sysFont = model_man.LoadFont("fontY4a",8,10,0x10,' ','\x7f');
	sysFont->SetSize(2);
	title_bg = model_man.LoadFont("title01",0x80,0x40,2,'A','P');
	title_bg->SetSize(2);
	title_bg->SetColor(0xff,0xff,0xff,0xff);
	movie_icon = model_man.LoadFont("title01",0x20,0x20,8,'A','H');
	movie_icon->SetSize(1);
	movie_icon->SetColor(0xff,0xff,0xff,0xff);

	Vec camup = {0,1,0};
	Vec campos = {0,0,50};
	Vec camtagpos = {0,0,0};
	GXColor fogcolor = {0,0,0,0};

	sysCam.SetCameraFrustum(1.5,2.0,2.0,1024.0);
	sysCam.SetCamUp(camup);
	sysCam.SetPosition(campos);
	sysCam.SetTargetPos(camtagpos);
	sysCam.SetTargetMode(DGR_TARGET_POSITION);
	sysCam.SetFogColor(fogcolor);
	sysCam.SetFogRange(50.0,256.0);

	_fog_sw = false;

	camup.set(0,1,0);
	campos.set(0,0,50);
	camtagpos.set(0,0,0);

	fogcolor.r = 0;
	fogcolor.g = 0;
	fogcolor.b = 0;
	fogcolor.a = 0;

	_cam.SetCameraFrustum(1.5,2.0,2.0,1024.0);
	_cam.SetCamUp(camup);
	_cam.SetPosition(campos);
	_cam.SetTargetPos(camtagpos);
	_cam.SetTargetMode(DGR_TARGET_POSITION);
	_cam.SetFogColor(fogcolor);
	_cam.SetFogRange(50.0,256.0);
	_cam.set_eye_offset(9.0,25.0);
	_cam.set_at_offset(10.0,0.0);
	_cam.set_bgh_handle(&_hit);
	_cam.set_speed(0.7,0.7,1.0,0.125);

	OSInitStopwatch(&SwMsec, "render");
	GXSetDrawDoneCallback(CheckRenderingTime);
	mario_hm = model_man.LoadDuplicateNDM((char*)iFileNameData[0]);
	mario_model = model_man.CreateAnimeInstance(mario_hm);
	model_man.DeleteMasterModel(mario_hm);

	for (s16 i = 0; i < 75; i++) {
		cinema.texpro[i] = NULL;
	}

	cinema.star = NULL;
	cinema.hart = NULL;
	cinema.mirrorpro = NULL;
	_go_next_room.flag = 0;
	_go_next_room.next_room_no = 0;
	_go_next_room.old_room_no = 0;
	_go_next_room.open_door_no = 0;

	iBgThreadInit();

	_cursol_pos[0] = 0;
	_cursol_pos[1] = 0;
	_cursol_wait = 0;
	_old_stick[0] = 0;
	_old_stick[1] = 0;
	_sys_inf_disp_flag = 0;
	_meter_disp_flag = 1;

	rend_man[0].SetRenderMode(&GXNtsc480IntDf);
}

void DMainSystem::_Step_Main_Menu(){
	switch(_step[1]){
		case 0:
		_route_counter = 0;
		_old_route_counter = _route_counter;
		_console_step = STEP_MAIN_MENU;
		_step[1]++;
		audio.SetAutoDemo(0);
		autoDemoFlag = false;
		audio.SongStop();
		audio.MuteAll(false);
		break;
		case 1:
		if (_pad.IsTrg(0,0x100)) {
			switch(_cursol_pos[0]){
				case 0:
				_console_step = STEP_INIT_SYS;
				_stage_no = STG_ENVE;
				_mode_no = 4;
				_step[0] = STEP_OPENING;
				_step[1] = 0;
				_cursol_pos[1] = _cursol_pos[0];
				_cursol_pos[0] = 0;
				break;
				case 1:
				_console_step = STEP_INIT_SYS;
				_step[0] = STEP_MOVIE_ALL;
				_step[1] = 0;
				_cursol_pos[1] = _cursol_pos[0];
				_cursol_pos[0] = 0;
				audio.SetAutoDemo(true);
				autoDemoFlag = 1;
				break;
				case 3:
				_console_step = STEP_INIT_SYS;
				_step[0] = STEP_ROOM_SELECT_MENU;
				_step[1] = 0;
				_cursol_pos[1] = _cursol_pos[0];
				_cursol_pos[0] = 0;
				break;
				case 4:
				_console_step = STEP_INIT_SYS;
				_step[0] = STEP_MOVIE_SELECT_MENU;
				_step[1] = 0;
				_cursol_pos[1] = _cursol_pos[0];
				_cursol_pos[0] = 0;
				break;
			}
		}
		break;
		case 2:
		_DispNowLoding();
		if (_DeleteAllStage()) {
			_player.InitAction();
			_step[1] = 0;
		}
		break;
	}
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
		if(stage[i].load_status == STG_NOT_LOADED) {
			sysFont->StrOut("X");
		}else if(stage[i].load_status == STG_LOADING) {
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

				if(VIGetDTVStatus() != 0){
					if(_tv_mode > 8) _tv_mode = 0;
				}else if(_tv_mode > 6){
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
	Vec pos; //r1_24
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
	stage[STG_ENTR].load_status = STG_LOADING;
	return;
}

//unused
void DMainSystem::_DelEntr(){
}


//Hangar area functions

void DMainSystem::_Step_Hang(){
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
	stage[STG_HANG].load_status = STG_LOADING;
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
	stage[STG_DOME].load_status = STG_LOADING;
}

//unused
void DMainSystem::_DelDome(){
}


//Cave area functions

void DMainSystem::_Step_Cave(){
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
	stage[STG_CAVE].load_status = STG_LOADING;
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
}

void DMainSystem::_iCinemaProjectionProc(){
	Vec wpos; //r1_c4
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
	stage[STG_CINE].load_status = STG_LOADING;
}

//unused
void DMainSystem::_DelCine(){
}

void DMainSystem::_iCineProInit(){
	s16 i; //r29
	Vec camup; //r1_58
	Vec campos; //r1_4c
	Vec camrot; //r1_40
	GXColor fogcolor; //r1_3c
}


//Spiral Staircase area functions

void DMainSystem::_Step_Spil(){
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
	stage[5].load_status = STG_LOADING;
}

//unused
void DMainSystem::_DelSpil(){
}


//Metal Mario area functions

void DMainSystem::_Step_Enve(){
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
	stage[STG_ENVE].load_status = STG_LOADING;
}

//unused
void DMainSystem::_DelEnve(){
}



//How Many Coins? area functions

void DMainSystem::_Step_Mpol(){
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
	stage[STG_MPOL].load_status = STG_LOADING;
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
	Vec pos; //r1_24
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
}

void DMainSystem::_Step_Movie_Hang(){
}

void DMainSystem::_Step_Movie_Dome(){
}

void DMainSystem::_Step_Movie_Cave(){
}

void DMainSystem::_Step_Movie_Cine(){
}

void DMainSystem::_Step_Movie_Spil(){
	Vec player_rol; //r1_24
}

void DMainSystem::_Step_Movie_Enve(){
}

void DMainSystem::_Step_Movie_Mpol(){
}




void DMainSystem::iCheckLoadStatus(){
	for (s8 i = 0; i < 8; i++) {
		if (stage[i].load_status == STG_LOADING && iBgCheckLoadEnd(i)){
			stage[i].load_status = STG_LOADED;
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
	switch(_mipmap_mode){
		case 0:
		model_man.EnableMipMap(false);
		break;
		case 1:
		model_man.EnableMipMap(true);
		model_man.EnableExpensiveMipMap(false);
		break;
		case 2:
		model_man.EnableMipMap(true);
		model_man.EnableExpensiveMipMap(true);
		break;
	}
}

s8 DMainSystem::_DeleteAllStage(){
	s8 i; //r4
	s8 rcd; //r26
}

void DMainSystem::_FileManager(){
	if (iCourseData[_route_counter + 1] == _stage_no) {
		_route_counter++;
		if (iCourseData[_route_counter + 1] < 0) {
			_route_counter = 0;
		}
	}

	for(s8 i = 0; i < 8; i++){
		if (i == STG_CINE) {
			if (_stage_no == STG_CAVE || _stage_no == STG_ENTR){
				if(iCourseData[_route_counter] == 3 || iCourseData[_route_counter + 1] == 0){
					if (stage[STG_CINE].load_status == STG_NOT_LOADED) {
						_LoadRequestRoomFile(STG_CINE);
					}
					continue;
				}
			}
		}

		if (_stage_no == i) {
			if (stage[i].load_status == STG_NOT_LOADED) {
				_LoadRequestRoomFile(i);
			}
		}else {
			if (_old_route_counter == i && stage[i].load_status == 3) {
				_FreeRequestRoomFile(i);
			}

			if (iCourseData[_route_counter + 1] == i) {
				if (stage[i].load_status == STG_NOT_LOADED) {
					_LoadRequestRoomFile(i);
					OSReport("Next room %d\n", i);
				}
			}else if (stage[i].load_status == 3) {
				_FreeRequestRoomFile(i);
			}
		}
	}
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
	switch(_go_next_room.old_room_no) {
		case 0:
		_Draw_Entr(true);
		break;
		case 1:
		_Draw_Hang(true);
		break;
		case 2:
		_Draw_Dome(true);
		break;
		case 3:
		_Draw_Cave(true);
		break;
		case 4:
		_Draw_Cine(true);
		break;
		case 5:
		_Draw_Spil(true);
		break;
		case 6:
		_Draw_Enve(true);
		break;
		case 7:
		_Draw_Mpol(true);
		break;
	}
}

void DMainSystem::_CheckMoveRoom(){
	if (_go_next_room.flag == 1) {
		_cam.set_mode(5);
		_cam.set_hit_enable_flag(false);

		_step[0] = _go_next_room.next_room_no + 5;
		_step[1] = 0x14;

		if (_stage_no == STG_MPOL) {
			_gim.CoinExit();
		}

		iCheckLoadStatus();

		if (stage[_go_next_room.next_room_no].load_status == STG_NOT_LOADED) {
			if (_tv_mode == 6) {
				_tv_mode = 4;
			}

			switch(_go_next_room.next_room_no) {
				case 0:
				_LoadRequestEntr();
				break;
				case 1:
				_LoadRequestHang();
				break;
				case 2:
				_LoadRequestDome();
				break;
				case 3:
				_LoadRequestCave();
				break;
				case 4:
				_LoadRequestCine();
				break;
				case 5:
				_LoadRequestSpil();
				break;
				case 6:
				_LoadRequestEnve();
				break;
				case 7:
				_LoadRequestMpol(1);
				break;
			}
		}
		audio.PlaySongFadeOut();
	}else if(_go_next_room.flag == 2) {
		_cam.set_mode(6);
		_cam.set_hit_enable_flag(false);

		_step[0] = _go_next_room.next_room_no + 5;
		_step[1] = 0x1e;

		iCheckLoadStatus();

		if (stage[_go_next_room.next_room_no].load_status == STG_NOT_LOADED) {
			switch(_go_next_room.next_room_no) {
				case 0:
				_LoadRequestEntr();
				break;
				case 1:
				_LoadRequestHang();
				break;
				case 2:
				_LoadRequestDome();
				break;
				case 3:
				_LoadRequestCave();
				break;
				case 4:
				_LoadRequestCine();
				break;
				case 5:
				_LoadRequestSpil();
				break;
				case 6:
				_LoadRequestEnve();
				break;
				case 7:
				_LoadRequestMpol(1);
				break;
			}
		}

		audio.PlaySongFadeOut();
	}
}

//unused
void DMainSystem::iSetFogSw(s8 sw){
}

void DMainSystem::_iChangeTvMode(){
	if (_tv_mode != _old_tv_mode) {
		switch(_tv_mode) {
			case 0:
			rend_man[0].SetRenderMode(&GXNtsc240Ds);
			break;
			case 1:
			rend_man[0].SetRenderMode(&GXNtsc240DsAa);
			break;
			case 2:
			rend_man[0].SetRenderMode(&GXNtsc240Int);
			break;
			case 3:
			rend_man[0].SetRenderMode(&GXNtsc240IntAa);
			break;
			case 4:
			rend_man[0].SetRenderMode(&GXNtsc480IntDf);
			break;
			case 5:
			rend_man[0].SetRenderMode(&GXNtsc480Int);
			break;
			case 6:
			rend_man[0].SetRenderMode(&GXNtsc480IntAa);
			break;
			case 7:
			rend_man[0].SetRenderMode(&GXNtsc480Prog);
			break;
			case 8:
			rend_man[0].SetRenderMode(&GXNtsc480ProgAa);
		}

		_old_tv_mode = _tv_mode;
	}
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

//Draws the debbuging profiler, showing both the CPU and GPU frame times.
static void DrawFrameBar(f32 mSecCPU, f32 mSecGX) {
	GXColor frmClr = {0,0,0,255}; //0x22c
	float frmPts[28] = { //0x1bc
		0,0,0,16,
		0,0,616,0,
		616,0,616,16,
		0,16,616,16,
		154,0,154,16,
		308,0,308,16,
		462,0,462,16
	};
	u8 frmLineWid = 12;
	
	GXColor bkdClr = {0x40,0x40,0x40,0xFF};
	float bkdPts[4] = {0,0,616,0};
	u8 bkdLineWid = 96;
	
	GXColor cpuClr = {0x4B,0x19,0x00,0xFF};
	float cpuPts[4] = {0,0,616,0};
	u8 cpuLineWid = 24;
	
	GXColor gxClr = {0x00,0x32,0x7D,0xFF};
	float gxPts[4] = {0,0,616,0};
	u8 gxLineWid = 24;

	float pixelScaleY = 1.0f/240.0f;
	float pixelScaleX = 1.0f/320.0f;

	float SCRN_X_OFFSET = -304 * pixelScaleX;
	float SCRN_Y_OFFSET = 216 * pixelScaleY;

	float bkdOffset = 0;
	float cpuOffset = -2;
	float gxOffset = 2;
	float frmOffset = -8;

	Mtx44 mProj;
	float pSave[7];
	u32 i,j;
	float maxFPS = 16.67f * 4;
	float length = 1;
	float scale = 0;
	Mtx mID;
	
	
	if (dm->iGetOldTvMode() == 6 || dm->iGetOldTvMode() == 8) {
		SCRN_Y_OFFSET = 40 * pixelScaleY;
	} else {
		SCRN_Y_OFFSET = -200 * pixelScaleY;
	}

	//Scale the end points of the GX and CPU bars by ms/66.68,
	//clamping the scale value at 1
	
	scale = mSecGX/maxFPS;
	if (scale > 1) scale = 1;
	
	gxPts[2] *= scale;
	
	scale = mSecCPU/maxFPS;
	if (scale > 1) scale = 1;
	
	cpuPts[2] *= scale;
	
	cpuPts[1] += cpuOffset;
	cpuPts[3] += cpuOffset;
	
	gxPts[1] += gxOffset;
	gxPts[3] += gxOffset;

	frmPts[1] += frmOffset;
	frmPts[3] += frmOffset;
	frmPts[5] += frmOffset;
	frmPts[7] += frmOffset;
	frmPts[9] += frmOffset;
	frmPts[11] += frmOffset;
	frmPts[13] += frmOffset;
	frmPts[15] += frmOffset;
	frmPts[17] += frmOffset;
	frmPts[19] += frmOffset;
	frmPts[21] += frmOffset;
	frmPts[23] += frmOffset;
	frmPts[25] += frmOffset;
	frmPts[27] += frmOffset;
	
	GXGetProjectionv(pSave);

	for(i = 0; i < 4; i++){
		for(j = 0; j < 4; j++){
			mProj[i][j] = 0;
		}
	}
	
	mProj[0][0] = pixelScaleX;
	mProj[1][1] = pixelScaleY;
	mProj[2][2] = length;
	mProj[3][3] = length;
	
	mProj[0][3] = SCRN_X_OFFSET;
	mProj[1][3] = SCRN_Y_OFFSET;

	
	//Setup GX
	GXSetProjection(mProj, GX_ORTHOGRAPHIC);
	GXSetNumChans(1);
	GXSetChanCtrl(GX_COLOR0A0, false, GX_SRC_REG, GX_SRC_REG, GX_LIGHT_NULL, GX_DF_NONE, GX_AF_NONE);
	GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
	GXSetTevOp(GX_TEVSTAGE0, GX_PASSCLR);
	GXSetNumTexGens(0);
	GXSetNumTevStages(1);
	GXSetZMode(false, GX_ALWAYS, false);
	GXClearVtxDesc();
	GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
	PSMTXIdentity(mID);
	GXLoadPosMtxImm(mID, 0);

	//Draw the background
	GXSetChanMatColor(GX_COLOR0, bkdClr);
	GXSetLineWidth(bkdLineWid, 0);
	GXBegin(GX_LINES, GX_VTXFMT0, 2);
	
	GXPosition3f32(bkdPts[0],bkdPts[1],-1);
	GXPosition3f32(bkdPts[2],bkdPts[3],-1);

	GXEnd();

	//Draw the cpu bar
	GXSetChanMatColor(GX_COLOR0, cpuClr);
	GXSetLineWidth(cpuLineWid, 0);
	GXBegin(GX_LINES, GX_VTXFMT0, 2);
	
	GXPosition3f32(cpuPts[0],cpuPts[1],-1);
	GXPosition3f32(cpuPts[2],cpuPts[3],-1);

	GXEnd();

	//Draw the gx bar
	GXSetChanMatColor(GX_COLOR0, gxClr);
	GXSetLineWidth(gxLineWid, 0);
	GXBegin(GX_LINES, GX_VTXFMT0, 2);
	
	GXPosition3f32(gxPts[0],gxPts[1],-1);
	GXPosition3f32(gxPts[2],gxPts[3],-1);

	GXEnd();

	//Draw the frame lines
	GXSetChanMatColor(GX_COLOR0, frmClr);
	GXSetLineWidth(frmLineWid, 0);
	
	GXBegin(GX_LINES, GX_VTXFMT0, 14);
	
	GXPosition3f32(frmPts[0],frmPts[1],-1);
	GXPosition3f32(frmPts[2],frmPts[3],-1);
	GXPosition3f32(frmPts[4],frmPts[5],-1);
	GXPosition3f32(frmPts[6],frmPts[7],-1);
	GXPosition3f32(frmPts[8],frmPts[9],-1);
	GXPosition3f32(frmPts[10],frmPts[11],-1);
	GXPosition3f32(frmPts[12],frmPts[13],-1);
	GXPosition3f32(frmPts[14],frmPts[15],-1);
	GXPosition3f32(frmPts[16],frmPts[17],-1);
	GXPosition3f32(frmPts[18],frmPts[19],-1);
	GXPosition3f32(frmPts[20],frmPts[21],-1);
	GXPosition3f32(frmPts[22],frmPts[23],-1);
	GXPosition3f32(frmPts[24],frmPts[25],-1);
	GXPosition3f32(frmPts[26],frmPts[27],-1);

	GXEnd();
	
	GXSetZMode(true, GX_LEQUAL, true);

	
	for(i = 0; i < 4; i++){
		for(j = 0; j < 4; j++){
			mProj[i][j] = 0;
		}
	}
	
	mProj[0][0] = pSave[1];
	mProj[0][2] = pSave[2];
	mProj[1][1] = pSave[3];
	mProj[1][2] = pSave[4];
	mProj[2][2] = pSave[5];
	mProj[2][3] = pSave[6];
	mProj[3][2] = -1;
	
	GXSetProjection(mProj, GX_PERSPECTIVE);
}

static void* iBgThread(void* arg0);

static void iBgThreadInit(){
	s32 i;
	
	for(i = 0; i < 0x80; i++){
		bgThread.request_flag[i] = 0;
		bgThread.request_file_number[i] = 0;
	}

	bgThread.read_p = 0;
	bgThread.write_p = 0;

	for(i = 0; i < 8; i++){
		bgThread.stage[i].wait_count = 0;
	}

	for(i = 0; i < 9; i++){
		bgThread.delete_flag[i] = 0;
	}

	OSCreateThread(&bgThread.SMThread, iBgThread, 0, (void*)bgThread.request_flag, 0x1000, 0x1f, 1);
	OSResumeThread(&bgThread.SMThread);
}

static s16 iBgLoadRequest(u16 file_no, u8 request_flag, s8 stage_no, s8 model_no){
	bgThread.request_flag[bgThread.write_p] = request_flag;
	bgThread.request_file_number[bgThread.write_p] = file_no;
	bgThread.request_stage_no[bgThread.write_p] = stage_no;
	bgThread.request_model_no[bgThread.write_p] = model_no;
	
	s16 rcd = bgThread.write_p;
	bgThread.write_p++;
	if (bgThread.write_p >= 0x80) {
		bgThread.write_p = 0;
	}

	bgThread.stage[stage_no].wait_table[bgThread.stage[stage_no].wait_count] = rcd;
	bgThread.stage[stage_no].wait_count++;
}

static s8 iBgCheckLoadEnd(s8 stg_no){
	s8 rcd = 1;
	//s8 i = 0;

	for(s8 i = 0; i < bgThread.stage[stg_no].wait_count; i++){
		if(bgThread.request_flag[bgThread.stage[stg_no].wait_table[i]] != 7){
			rcd = 0;
		}
	}

	if(rcd != 0){
		bgThread.stage[stg_no].wait_count = 0;
	}
}

//unused
static s16 iBgClearRequest(){
}

static s16 iBgDeleteRequest();

//param name not in dwarf
static void* iBgThread(void* arg0){
	s16 i; //r25
	u32 size; //r28
	DVDFileInfo fp; //r1_1c
	u8* dat; //r4
	char buf[16]; //r1_c

	s16 iVar10;

	while(true){
		do {
			bg_stimer++;
			iBgDeleteRequest();
			iVar10 = bgThread.read_p;
		} while (iVar10 == bgThread.write_p);

		switch(bgThread.request_flag[iVar10]){
			case 1:
			OSReport("load %s : start : rp=%d wp=%d\n",iFileNameData[bgThread.request_file_number[iVar10]]);

			dm->stage[bgThread.request_stage_no[bgThread.read_p]].hm[bgThread.request_model_no[bgThread.read_p]] =
			dm->model_man.LoadDuplicateNDM((char*)iFileNameData[bgThread.request_file_number[bgThread.read_p]]);

			dm->stage[bgThread.request_stage_no[bgThread.read_p]].model[bgThread.request_model_no[bgThread.read_p]] =
			dm->model_man.CreateInstance(dm->stage[bgThread.request_stage_no[bgThread.read_p]].hm[bgThread.request_model_no[bgThread.read_p]]);
			
			dm->model_man.DeleteMasterModel(dm->stage[bgThread.request_stage_no[bgThread.read_p]].hm[bgThread.request_model_no[bgThread.read_p]]);
			
			OSSetThreadPriority(&bgThread.SMThread,0xf);
			bgThread.request_flag[bgThread.read_p] = 7;
			bgThread.read_p = bgThread.read_p + 1;

			if (0x7f < bgThread.read_p) {
				bgThread.read_p = 0;
			}

			OSSetThreadPriority(&bgThread.SMThread,0x1f);
			OSReport("load : end\n");
			break;
			case 2:
			OSReport("load %s : start : rp=%d wp=%d\n",iFileNameData[bgThread.request_file_number[iVar10]]);
			
			dm->stage[bgThread.request_stage_no[bgThread.read_p]].hm[bgThread.request_model_no[bgThread.read_p]] =
			dm->model_man.LoadDuplicateNDM((char*)iFileNameData[bgThread.request_file_number[bgThread.read_p]]);

			dm->stage[bgThread.request_stage_no[bgThread.read_p]].model[bgThread.request_model_no[bgThread.read_p]] =
			dm->model_man.CreateInstance(dm->stage[bgThread.request_stage_no[bgThread.read_p]].hm[bgThread.request_model_no[bgThread.read_p]]);

			OSSetThreadPriority(&bgThread.SMThread,0xf);
			bgThread.request_flag[bgThread.read_p] = 7;
			bgThread.read_p++;

			if (0x7f < bgThread.read_p) {
				bgThread.read_p = 0;
			}

			OSSetThreadPriority(&bgThread.SMThread,0x1f);
			OSReport("load : end\n");
			break;
			case 3:
			OSReport("load %s : start : rp=%d wp=%d\n",(&iFileNameData)[bgThread.request_file_number[iVar10]]);
			
			iVar10 = DVDOpen((char*)iFileNameData[bgThread.request_file_number[bgThread.read_p]],&fp);
				
			if (iVar10 == 0) {
				OSReport("iBgThread> File op0en error. (%s)\n",iFileNameData[bgThread.request_file_number[bgThread.read_p]]);
			}else {
				u32 uVar4 = fp.length + 0x1f & 0xffffffe0;
				void* pvVar6 = mAlloc(uVar4);
				DVDReadPrio(&fp, pvVar6, uVar4, 0, 2);
				DVDClose(&fp);
				dm->stage[bgThread.request_stage_no[bgThread.read_p]].datBGH = pvVar6;
			}
				
			OSSetThreadPriority(&bgThread.SMThread,0xf);
			bgThread.request_flag[bgThread.read_p] = 7;
			bgThread.read_p = bgThread.read_p + 1;

			if (0x7f < bgThread.read_p) {
				bgThread.read_p = 0;
			}

			OSSetThreadPriority(&bgThread.SMThread,0x1f);
			OSReport("load : end\n");
			break;
			case 4:
			OSReport("load %s : start : rp=%d wp=%d\n",(&iFileNameData)[bgThread.request_file_number[iVar10]]);
			
			iVar10 = DVDOpen((char*)iFileNameData[bgThread.request_file_number[bgThread.read_p]],&fp);
			
			if (iVar10 == 0) {
				OSReport("iBgThread> File op0en error. (%s)\n",iFileNameData[bgThread.request_file_number[bgThread.read_p]]);
			}else {
				u32 uVar4 = fp.length + 0x1f & 0xffffffe0;
				void* pvVar6 = mAlloc(uVar4);
				DVDReadPrio(&fp,pvVar6,uVar4,0,2);
				DVDClose(&fp);
				dm->stage[bgThread.request_stage_no[bgThread.read_p]].datMCD = pvVar6;
			}

			OSSetThreadPriority(&bgThread.SMThread,0xf);
			bgThread.request_flag[bgThread.read_p] = 7;
			bgThread.read_p++;

			if (0x7f < bgThread.read_p) {
				bgThread.read_p = 0;
			}
			OSSetThreadPriority(&bgThread.SMThread,0x1f);
			OSReport("load : end\n");
			break;
			case 5:
			OSReport("load : start : rp=%d wp=%d\n",iVar10,(int)bgThread.write_p);
			dm->cinema.star = dm->model_man.LoadTexPro("T_STAR");
			dm->cinema.hart = dm->model_man.LoadTexPro("T_HART");
			dm->cinema.mirrorpro = dm->model_man.LoadTexPro("T_STAR");

			sprintf(buf,"%s","MARIO00");
			iVar10 = 0;
			
			for (i = 0; i < 0x4b; i = i + 1) {
				u32 iVar9 = (int)i / 10 + ((int)i >> 0x1f);
				u32 cVar2 = (char)iVar9;
				u32 cVar3 = (char)(iVar9 >> 0x1f);

				buf[5] = (cVar2 - cVar3) + '0';
				buf[6] = (char)i + (cVar2 - cVar3) * -10 + '0';

				OSReport("%s\n",buf);
				dm->cinema.texpro[iVar10] = dm->model_man.LoadTexPro(buf);
				iVar10 += 4;
			}

			OSSetThreadPriority(&bgThread.SMThread,0xf);
			bgThread.request_flag[bgThread.read_p] = 7;
			bgThread.read_p = bgThread.read_p + 1;

			if (0x7f < bgThread.read_p) {
				bgThread.read_p = 0;
			}

			OSSetThreadPriority(&bgThread.SMThread,0x1f);
			OSReport("load : end\n");
			break;
			case 6:
			if (!autoDemoFlag) {
				OSReport("load %s : start : rp=%d wp=%d\n",songFilenameTable[bgThread.request_file_number[iVar10]]);

				if (dm->song[bgThread.request_stage_no[bgThread.read_p]].ReadBuffer(bgThread.request_file_number[bgThread.read_p],songFilenameTable[bgThread.request_file_number[bgThread.read_p]]) == 0) {
					OSReport("Song file read error %s\n",iFileNameData[bgThread.request_file_number[bgThread.read_p]]);
				}

				OSReport("load : end\n");
			}else {
				if (dm->song[8].ReadBuffer(0,(char*)songFilenameTable[8]) == 0) {
					OSReport("Song file read error %s\n",(&iFileNameData)[bgThread.request_file_number[bgThread.read_p]]);
				}
			}

			OSSetThreadPriority(&bgThread.SMThread,0xf);
			bgThread.request_flag[bgThread.read_p] = 7;
			bgThread.read_p = bgThread.read_p + 1;

			if (0x7f < bgThread.read_p) {
				bgThread.read_p = 0;
			}
			OSSetThreadPriority(&bgThread.SMThread,0x1f);
			break;
			default:
			OSReport("iBgThread>File load error.\n");
			break;
		}

		dm->free_mem_size = OSCheckHeap(0);
	}
}

static s16 iBgDeleteRequest(){
	s16 i; //r31
	
	for (i = 0; i < 9; i = i + 1) {
		if (i < 8 && i < 0) {
			dm->song[i].DelayDeleteBuffer();
		}

		if (bgThread.delete_flag[i] != 0) {
			switch(i) {
			case 0:
				OSReport("del STG_ENTR : start\n");
				McrDelete(dm->stage[0].model[0]);
				dm->stage[0].model[0] = NULL;
				McrDelete(dm->stage[0].datBGH);
				dm->_hit.set_hit_data(0,NULL);
				dm->stage[0].datBGH = NULL;
				McrDelete(dm->stage[0].datMCD);
				dm->stage[0].datMCD = NULL;
				dm->song[0].DeleteBuffer();

				bgThread.stage[0].wait_count = 0;
				dm->stage[0].load_status = 0;
				bgThread.delete_flag[0] = 0;
				dm->free_mem_size = OSCheckHeap(0);
				OSReport("del STG_ENTR : end\n");
				break;
			case 1:
				OSReport("del STG_HANG : start\n");
				McrDelete(dm->stage[1].model[0]);
				dm->stage[1].model[0] = NULL;
				McrDelete(dm->stage[1].model[1]);
				dm->stage[1].model[1] = NULL;
				McrDelete(dm->stage[1].datBGH);
				dm->_hit.set_hit_data(1,NULL);
				dm->stage[1].datBGH = NULL;
				McrDelete(dm->stage[1].datMCD);
				dm->stage[1].datMCD = NULL;
				dm->song[1].DeleteBuffer();

				bgThread.stage[1].wait_count = 0;
				dm->stage[1].load_status = 0;
				bgThread.delete_flag[1] = 0;
				dm->free_mem_size = OSCheckHeap(0);
				OSReport("del STG_HANG : end\n");
				break;
			case 2:
				OSReport("del STG_DOME : start\n");
				McrDelete(dm->stage[2].model[0]);
				dm->stage[2].model[0] = NULL;
				McrDelete(dm->stage[2].datBGH);
				dm->_hit.set_hit_data(2,NULL);
				dm->stage[2].datBGH = NULL;
				McrDelete(dm->stage[2].datMCD);
				dm->stage[2].datMCD = NULL;
				dm->song[2].DeleteBuffer();

				bgThread.stage[2].wait_count = 0;
				dm->stage[2].load_status = 0;
				bgThread.delete_flag[2] = 0;
				dm->free_mem_size = OSCheckHeap(0);
				OSReport("del STG_DOME : end\n");
				break;
			case 3:
				OSReport("del STG_CAVE : start\n");
				McrDelete(dm->stage[3].model[0]);
				dm->stage[1].model[0] = NULL;
				McrDelete(dm->stage[3].model[1]);
				dm->stage[3].model[1] = NULL;
				McrDelete(dm->stage[3].datBGH);
				dm->_hit.set_hit_data(3,NULL);
				dm->stage[3].datBGH = NULL;
				McrDelete(dm->stage[3].datMCD);
				dm->stage[3].datMCD = NULL;
				dm->song[3].DeleteBuffer();

				bgThread.stage[3].wait_count = 0;
				dm->stage[3].load_status = 0;
				bgThread.delete_flag[3] = 0;
				dm->free_mem_size = OSCheckHeap(0);
				OSReport("del STG_CAVE : end\n");
				break;
			case 4:
				OSReport("del STG_CINE : start\n");
				McrDelete(dm->stage[4].model[0]);
				dm->stage[4].model[0] = NULL;
				McrDelete(dm->stage[4].datBGH);
				dm->_hit.set_hit_data(4,NULL);
				dm->stage[4].datBGH = NULL;
				McrDelete(dm->stage[4].datMCD);
				dm->stage[4].datMCD = NULL;

				for (i = 0; i < 75; i++) {
					McrDelete(dm->cinema.texpro[i]);
					dm->cinema.texpro[i] = NULL;
				}

				McrDelete(dm->cinema.star);
				dm->cinema.star = NULL;
				McrDelete(dm->cinema.hart);
				dm->cinema.hart = NULL;
				McrDelete(dm->cinema.mirrorpro);
				dm->cinema.mirrorpro = NULL;

				dm->song[4].DeleteBuffer();

				bgThread.stage[4].wait_count = 0;
				dm->stage[4].load_status = 0;
				bgThread.delete_flag[4] = 0;
				dm->free_mem_size = OSCheckHeap(0);
				OSReport("del STG_CINE : end\n");
				break;
			case 5:
				OSReport("del STG_SPIL : start\n");
				McrDelete(dm->stage[5].model[0]);
				dm->stage[5].model[0] = NULL;
				McrDelete(dm->stage[5].datBGH);
				dm->_hit.set_hit_data(5,NULL);
				dm->stage[5].datBGH = NULL;
				McrDelete(dm->stage[5].datMCD);
				dm->stage[5].datMCD = NULL;
				dm->song[5].DeleteBuffer();

				bgThread.stage[5].wait_count = 0;
				dm->stage[5].load_status = 0;
				bgThread.delete_flag[5] = 0;
				dm->free_mem_size = OSCheckHeap(0);
				OSReport("del STG_SPIL : end\n");
				break;
			case 6:
				OSReport("del STG_ENVE : start\n");
				McrDelete(dm->stage[6].model[0]);
				dm->stage[6].model[0] = NULL;
				McrDelete(dm->stage[6].datBGH);
				dm->_hit.set_hit_data(6,NULL);
				dm->stage[6].datBGH = NULL;
				McrDelete(dm->stage[6].datMCD);
				dm->stage[6].datMCD = NULL;
				dm->song[6].DeleteBuffer();

				bgThread.stage[6].wait_count = 0;
				dm->stage[6].load_status = 0;
				bgThread.delete_flag[6] = 0;
				dm->free_mem_size = OSCheckHeap(0);
				OSReport("del STG_ENVE : end\n");
				break;
			case 7:
				OSReport("del STG_MPOL : start\n");
				McrDelete(dm->stage[7].model[0]);
				dm->stage[7].model[0] = NULL;
				dm->model_man.DeleteMasterModel(dm->stage[7].hm[1]);
				McrDelete(dm->stage[7].model[1]);
				dm->stage[7].model[1] = NULL;
				McrDelete(dm->stage[7].datBGH);
				dm->_hit.set_hit_data(7,NULL);
				dm->stage[7].datBGH = NULL;
				McrDelete(dm->stage[7].datMCD);
				dm->stage[7].datMCD = NULL;
				dm->song[7].DeleteBuffer();

				bgThread.stage[7].wait_count = 0;
				dm->stage[7].load_status = 0;
				bgThread.delete_flag[7] = 0;
				dm->free_mem_size = OSCheckHeap(0);
				OSReport("del STG_MPOL : end\n");
				break;
			case 8:
				bgThread.delete_flag[8] = 0;
			}
		}
	}
}

