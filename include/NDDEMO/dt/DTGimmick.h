#pragma once

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
    void SetDoorMpol(u8);
    void SetDoorEnve(u8);
    void SetDoorSpil(u8);
    void SetDoorCine(u8);
    void SetDoorDome(u8);
    void SetDoorHang(u8);
    void SetDoorEntr(u8);
    void DoorAction();
    void ActionMpol();
    void ActionEnve();
    void ActionSpil();
    void ActionCine();
    void ActionCave();
    void ActionDome();
    void ActionHang();
    void ActionEntr();
    void MovieModeDraw(u32);

public:
    void MovieAction(u32);
    void OpeningTitleAction();
    void OpeningTitleOn();
    void TitleAction();
    void TitleOff();
    void TitleOn(u8);
    void AddNumOfCoin(s16);
    u16 GetNumOfCoin();
    u8 IsAllOffCoin();
    void CoinExit();
    void CoinDraw();
    void CoinDrop();
    void CoinInit();
    int IsFadeOut();
    int IsFadeIn();
    void FadeOut();
    void FadeIn();
    void DoorClose(u8, u8);
    void DoorOpen(u8, u8);
    void Action(u8);

    ~DTGimmick();
    DTGimmick();
    DTGimmick(const DTGimmick&);
};
