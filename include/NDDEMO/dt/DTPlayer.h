#ifndef NDDEMO_DTPLAYER_H
#define NDDEMO_DTPLAYER_H

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
	u8 unk299[3]; //padding
	float jumppow; //0x29C
	Vec _door_start; //0x2A0
	Vec _door_end; //0x2AC
	s8 _next_room_number; //0x2B8
	u8 unk2B9[3]; //padding
	u32 _exit_status; //0x2BC
	s8 _ground_hit_flag; //0x2C0
	s8 _dokan_hit_flag; //0x2C1
	u16 _wait_timer; //0x2C2
	u8 rolling; //0x2C4
	u8 unk2C5[3]; //padding


	void act_movie_spil();
	void act_movie_spil_init();
	void act_spil();
	void act_spil_init();
	void act_mpol();
	void act_mpol_init();
	void act_opening();
	void act_opening_init();
	void act_go_enter_next();
	void act_go_enter_init();
	void act_dokan_in();
	void act_dokan_in_init();
	void act_dokan_out();
	void act_dokan_out_init();
	void act_open();
	void act_open_init();
	void act_walk();
	void act_walk_init();
	void act_idle2();
	void act_idle2_init();
	void act_idle();
	void act_idle_init();
	void act_init();

	void DirectionalAddPosition(Vec& add);
	u8 HitFloor();
	void Rolling(u8 off);
	void normalize(Vec* src, Vec* dst);

	void _iSetDoorStartEnd(float* door_pos);
	s8 _iCheckDoor();
	s8 _iPointMove(Vec* goal, float speed);
	void _iSetDokanCenter(float* current_dokan_pos, float* next_dokan_pos);
	s8 _iCheckDokan();

	float GetCamAngle();
	float Vec2Angle(float x, float z);
	void stickCheck();
	void PlayerMove(float speed);
	int RevAnimation(int clamp);
	int Animation(int clamp);
	void SetAnimation(u8 name);

public:
	DTPlayer(const DTPlayer&);
	DTPlayer();
	~DTPlayer();

	void InitAction();
	void OpeningInit();
	void MpolModeInit();
	void SpilModeInit();
	Vec* GetPosition();
	void SetPosition(Vec p);
	void SetRotation(Vec p);
	float GetAngle();
	void CreateShadow();
	DGTexPro* GetShadowPro(int dummy);
	void CreateSpilShadow();
	DGTexPro* GetSpilShadowPro(int dummy);
	u8 Action();
	Vec GetSpilShadowCamPos();
};

#endif
