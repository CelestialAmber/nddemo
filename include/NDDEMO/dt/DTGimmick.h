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

    Randomf32__9DTGimmickFv
    Random__9DTGimmickFv
    FadeAction__9DTGimmickFv
    SetDoorMpol__9DTGimmickFUc
    SetDoorEnve__9DTGimmickFUc
    SetDoorSpil__9DTGimmickFUc
    SetDoorCine__9DTGimmickFUc
    SetDoorDome__9DTGimmickFUc
    SetDoorHang__9DTGimmickFUc
    SetDoorEntr__9DTGimmickFUc
    DoorAction__9DTGimmickFv
    ActionMpol__9DTGimmickFv
    ActionEnve__9DTGimmickFv
    ActionSpil__9DTGimmickFv
    ActionCine__9DTGimmickFv
    ActionCave__9DTGimmickFv
    ActionDome__9DTGimmickFv
    ActionHang__9DTGimmickFv
    ActionEntr__9DTGimmickFv
    MovieModeDraw__9DTGimmickFUl

public:
    MovieAction__9DTGimmickFUl
    OpeningTitleAction__9DTGimmickFv
    OpeningTitleOn__9DTGimmickFv
    TitleAction__9DTGimmickFv
    TitleOff__9DTGimmickFv
    TitleOn__9DTGimmickFUc
    AddNumOfCoin__9DTGimmickFs
    GetNumOfCoin__9DTGimmickFv
    IsAllOffCoin__9DTGimmickFv
    CoinExit__9DTGimmickFv
    CoinDraw__9DTGimmickFv
    CoinDrop__9DTGimmickFv
    CoinInit__9DTGimmickFv
    IsFadeOut__9DTGimmickFv
    IsFadeIn__9DTGimmickFv
    FadeOut__9DTGimmickFv
    FadeIn__9DTGimmickFv
    DoorClose__9DTGimmickFUcUc
    DoorOpen__9DTGimmickFUcUc
    Action__9DTGimmickFUc

    __dt__9DTGimmickFv
    __ct__9DTGimmickFv
    __ct__9DTGimmickFRC9DTGimmick
};
