#pragma once

#include "types.h"
#include "NDDEMO/dg/DGLight.h"

class DTLight{
protected:
    DGLight light[8]; //0x0


    SettingMpol__7DTLightFv
    SettingEnve__7DTLightFv
    SettingSpil__7DTLightFv
    SettingCine__7DTLightFv
    SettingCave__7DTLightFv
    SettingDome__7DTLightFv
    SettingHang__7DTLightFv
    SettingEntr__7DTLightFv

public:
    SetKuriboLight__7DTLightFv
    Setting__7DTLightFUc

    __dt__7DTLightFv
    __ct__7DTLightFv
    __ct__7DTLightFRC7DTLight
};
