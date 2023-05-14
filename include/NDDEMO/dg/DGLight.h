#pragma once

#include "types.h"
#include "dolphin/GX.h"
#include "NDDEMO/Math.h"
#include "NDDEMO/dg/DGRendState.h"

class DGLight{
private:
    Vec m_Position; //0x0
    Vec m_Direction; //0xC
    GXColor m_LightColor; //0x18
    Vec m_DistanceAttenuation; //0x1C
    Vec m_AngleAttenuation; //0x28
    u8 m_AmbientVtx; //0x34
    u8 m_MaterialVtx; //0x35
    u8 m_SpotLight; //0x36
    u8 m_SpecularLight; //0x37
    float m_Shininess; //0x38

public:
    void SetAngleAttenuation_Cos2(float, float);
    void SetAngleAttenuation_Cos(float, float);
    void SetAngleAttenuation_Flat(float, float);
    void SetAngleAttenuation(float, float, float);
    void SetDistanceAttenuation_3(float, float, float, float, float);
    void SetDistanceAttenuation_2(float, float, float);
    void SetDistanceAttenuation_1(float, float, float);
    void SetDistanceAttenuation_0(float);
    void SetDistanceAttenuation(float, float, float);
    void EnableSpotLight(u8);
    void SetShininess(float);
    void EnableSpecularLight(u8);
    GXColor GetLightColor();
    void SetLightColor(const GXColor&);
    Vec GetDirection();
    void SetDirectionFromObserve(Vec&);
    void SetDirection(const Vec&);
    Vec GetPosition();
    Vec AddPosition(const Vec&);
    Vec SetPosition(const Vec&);
    void SetLight(GXLightID, DGRendState&);

    ~DGLight();
    DGLight();
    DGLight(const DGLight&);
};
