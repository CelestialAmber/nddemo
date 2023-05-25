#include "NDDEMO/dm/DMainSystem.h"
#include "NDDEMO/du/DUMacro.h"
#include "dolphin/GX.h"
#include "dolphin/OS.h"

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
}

void DMainSystem::_Reset(){
}

void DMainSystem::_StepProc(){
}

void DMainSystem::_Step_Init_System(){
	if((s32)_step[1] == 0){
		_console_step = 0;
		_stage_no = 6;
		_mode_no = 4;
		_step[0] = 13;
		_step[1] = 0;
		_cursol_pos[1] = _cursol_pos[0];
		_cursol_pos[0] = 0;
	}
}

void DMainSystem::iSystemInitProc(){
}

void DMainSystem::_Step_Main_Menu(){
}

void DMainSystem::_DispSysInfo(){
}

void DMainSystem::_Step_Room_Select_Menu(){
}

void DMainSystem::_Step_Movie_Select_Menu(){
}

void DMainSystem::_Step_Pause_Menu(){
}


//Entrance area functions

void DMainSystem::_Step_Entr(){
}

void DMainSystem::_Draw_Entr(s8 mario_flag){
}

void DMainSystem::_CheckSubMenu(){
}

void DMainSystem::_LoadRequestEntr(){
}

//unused
void DMainSystem::_DelEntr(){
}


//Hangar area functions

void DMainSystem::_Step_Hang(){
}

void DMainSystem::_Draw_Hang(s8 mario_flag){
}

void DMainSystem::_LoadRequestHang(){
}

//unused
void DMainSystem::_DelHang(){
}

void DMainSystem::_iSetPlanePos(){
}


//Dome area functions

void DMainSystem::_Step_Dome(){
}

void DMainSystem::_Draw_Dome(s8 mario_flag){
}

void DMainSystem::_LoadRequestDome(){
}

//unused
void DMainSystem::_DelDome(){
}


//Cave area functions

void DMainSystem::_Step_Cave(){
}

void DMainSystem::_Draw_Cave(s8 mario_flag){
}

void DMainSystem::_iSetKriboPos(){
}

void DMainSystem::_LoadRequestCave(){
}

//unused
void DMainSystem::_DelCave(){
}

void DMainSystem::_iSetCaveFog(){
}


//Cinema area functions

void DMainSystem::_Step_Cine(){
}

void DMainSystem::_iCinemaProjectionProc(){
}

void DMainSystem::_Draw_Cine(s8 mario_flag){
}

void DMainSystem::_LoadRequestCine(){
}

//unused
void DMainSystem::_DelCine(){
}

void DMainSystem::_iCineProInit(){
}


//Spiral Staircase area functions

void DMainSystem::_Step_Spil(){
}

void DMainSystem::_Draw_Spil(s8 mario_flag){
}

void DMainSystem::_LoadRequestSpil(){
}

//unused
void DMainSystem::_DelSpil(){
}


//Metal Mario? area functions

void DMainSystem::_Step_Enve(){
}

void DMainSystem::_Draw_Enve(s8 mario_flag){
}

void DMainSystem::_LoadRequestEnve(){
}

//unused
void DMainSystem::_DelEnve(){
}



//How Many Coins?? area functions

void DMainSystem::_Step_Mpol(){
}

void DMainSystem::_Draw_Mpol(s8 mario_flag){
}

void DMainSystem::_LoadRequestMpol(s8 mode){
}

//unused
void DMainSystem::_DelMpol(){
}

void DMainSystem::_ModifiNumOfCoint(){
}



void DMainSystem::_Step_Opening(){
}

void DMainSystem::_Draw_Opening(){
}

void DMainSystem::_Step_Ending(){
}


//Movie step functions

void DMainSystem::_Step_Movie_All(){
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
}

void DMainSystem::_Step_Movie_Enve(){
}

void DMainSystem::_Step_Movie_Mpol(){
}




void DMainSystem::iCheckLoadStatus(){
}

void DMainSystem::_CursolMove(s8 max, s16 y){
}

static float iMarioInitPosDat[32] = {
	180,
	0,
	0,
	95,
	-20,
	-264.268,
	-108.74,
	171.35299,
	60,
	133.567,
	0,
	77.11,
	-50,
	103,
	-108.5,
	-56,
	180,
	60,
	40,
	-196,
	-60,
	-129.967,
	1,
	74,
	180,
	-54,
	44,
	-202,
	-90,
	-124.5,
	40,
	-126.5
};

void DMainSystem::_iSetMarioPosRol(s8 stage_no){
}

static float iCameraInitPosDat[48] = {
	0,
	30,
	125,
	0,
	17,
	95,
	-257.44299,
	-73.74,
	152.575,
	-264.268,
	-91.74,
	171.35299,
	107.586,
	35,
	62.1,
	133.567,
	17,
	77.11,
	126,
	-78.5,
	-74.7,
	103,
	-91.5,
	-56,
	85,
	70,
	-97,
	85,
	57,
	-127,
	-112.646,
	36,
	64,
	-119.967,
	18,
	91.321,
	-54,
	84,
	-182,
	-54,
	61,
	-202,
	-94.5,
	70,
	-126.5,
	-124.5,
	57,
	-126.5
};

void DMainSystem::_iSetCameraPos(s8 stage_no){
}

static float iRoomInitPosDat[32] = {
	0,
	0,
	0,
	0,
	120,
	-308.44,
	-153.26,
	226.37,
	150,
	161.287597,
	0,
	93.1117,
	0,
	50,
	-110,
	0,
	0,
	85,
	40,
	-222,
	-60,
	-175,
	-110,
	100,
	0,
	-54,
	40,
	-242,
	0,
	-185.5,
	40,
	-127.5
};

void DMainSystem::_iSetStagePos(s8 stage_no){
}

void DMainSystem::GetStageOffset(u8 stage_no, Vec* pos, Vec* rol){
}

void DMainSystem::_RoomCameraMoveProc(){
}

//unused
void DMainSystem::iSysInit(){
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
}

void DMainSystem::_FileManager(){
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
}

void DMainSystem::_disp_meter(){
}

static void CheckRenderingTime(){
}

static void DrawFrameBar(float mSecCPU, float mSecGX){
}

static void iBgThreadInit(){
}

static void iBgLoadRequest(u16 file_no, u8 request_flag, s8 stage_no, s8 model_no){
}

static void iBgCheckLoadEnd(s8 stg_no){
}

//unused
static void iBgClearRequest(){
}

//param name not in dwarf
static void iBgThread(void* arg0){
}

static void iBgDeleteRequest(){
}

