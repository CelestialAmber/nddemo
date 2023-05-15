#ifndef NDDEMO_DTGIMMICK_H
#define NDDEMO_DTGIMMICK_H

#include "types.h"
#include "NDDEMO/Math.h"
#include "NDDEMO/dg/DGParts.h"

class DTGimmick{
private:
	u16 num_of_coin; //0x0

protected:
	u8 doorCnt; //0x2
	u8 unk3; //padding
	DGParts* doorCL; //0x4
	DGParts* doorCR; //0x8
	DGParts* doorNL; //0xC
	DGParts* doorNR; //0x10
	float fogTime; //0x14
	float fogCount; //0x18
	u8 fadeFlag; //0x1C
	u8 titleFlag; //0x1D
	u8 unk1E[2]; //padding
	float title_time; //0x20
	u8 openingFlag; //0x24
	s8 mm; //0x25
	s8 premm; //0x26
	s8 mmcount; //0x27
	u8 boxStep; //0x28
	u8 boxCount; //0x29
	u8 unk2A[2]; //padding
	Vec wpos; //0x2C

	float Randomf32();
	u8 Random();
	
	void FadeAction();
	void SetDoorMpol(u8 doorNo);
	void SetDoorEnve(u8 doorNo);
	void SetDoorSpil(u8 doorNo);
	void SetDoorCine(u8 doorNo);
	void SetDoorDome(u8 doorNo);
	void SetDoorHang(u8 doorNo);
	void SetDoorEntr(u8 doorNo);
	void DoorAction();
	void ActionMpol();
	void ActionEnve();
	void ActionSpil();
	void ActionCine();
	void ActionCave();
	void ActionDome();
	void ActionHang();
	void ActionEntr();
	void MovieModeDraw(u32 offsetY);

public:
	DTGimmick(const DTGimmick&);
	DTGimmick();
	~DTGimmick();

	void Action(u8 stageNo);
	void DoorOpen(u8 stageNo, u8 doorNo);
	void DoorClose(u8 stageNo, u8 doorNo);
	void FadeIn();
	void FadeOut();
	int IsFadeIn();
	int IsFadeOut();
	void CoinInit();
	void CoinDrop();
	void CoinDraw();
	void CoinExit();
	u8 IsAllOffCoin();
	u16 GetNumOfCoin();
	void AddNumOfCoin(s16 add_value);
	void TitleOn(u8 stageNo);
	void TitleOff();
	void TitleAction();
	void OpeningTitleOn();
	void OpeningTitleAction();
	void MovieAction(u32 offsetY);
};

#endif
