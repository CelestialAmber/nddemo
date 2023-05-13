#pragma once

#include "types.h"
#include "NDDEMO/Math.h"

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
    SetAngleAttenuation_Cos2__7DGLightFff
    SetAngleAttenuation_Cos__7DGLightFff
    SetAngleAttenuation_Flat__7DGLightFff
    SetAngleAttenuation__7DGLightFfff
    SetDistanceAttenuation_3__7DGLightFfffff
    SetDistanceAttenuation_2__7DGLightFfff
    SetDistanceAttenuation_1__7DGLightFfff
    SetDistanceAttenuation_0__7DGLightFf
    SetDistanceAttenuation__7DGLightFfff
    EnableSpotLight__7DGLightFUc
    SetShininess__7DGLightFf
    EnableSpecularLight__7DGLightFUc
    GetLightColor__7DGLightFv
    SetLightColor__7DGLightFRC8_GXColor
    GetDirection__7DGLightFv
    SetDirectionFromObserve__7DGLightFR3Vec
    SetDirection__7DGLightFRC3Vec
    GetPosition__7DGLightFv
    AddPosition__7DGLightFRC3Vec
    SetPosition__7DGLightFRC3Vec
    SetLight__7DGLightF10_GXLightIDR11DGRendState

    __dt__7DGLightFv
    __ct__7DGLightFv
    __ct__7DGLightFRC7DGLight
};
