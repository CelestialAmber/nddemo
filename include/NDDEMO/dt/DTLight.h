#pragma once

#include "types.h"
#include "NDDEMO/dg/DGLight.h"

class DTLight{
protected:
    DGLight light[8]; //0x0


    void SettingMpol();
    void SettingEnve();
    void SettingSpil();
    void SettingCine();
    void SettingCave();
    void SettingDome();
    void SettingHang();
    void SettingEntr();

public:
    void SetKuriboLight();
    void Setting(u8);

    ~DTLight();
    DTLight();
    DTLight(const DTLight&);
};
