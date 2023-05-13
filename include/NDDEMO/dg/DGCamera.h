#pragma once

#include "types.h"
#include "dolphin/GX.h"
#include "NDDEMO/dg/DGPosition.h"
#include "NDDEMO/dg/DGRendMan.h"

class DGCamera : DGPosition{
private:
    Mtx44 m_ProjectionMtx; //0x58
    Mtx m_LightProjectionMtx; //0x98
    Mtx m_LightProjectionMtxYInverse; //0xC8
    float m_ZNear; //0xF8
    float m_ZFar; //0xFC
    Vec m_CamUp; //0x100
    Vec m_TargetPos; //0x10C
    DG_RENDMAN_TARGET_MODE m_TargetMode; //0x118
    GXColor m_FogColor; //0x11C
    GXFogType m_FogType; //0x120
    float m_FogNear; //0x124
    float m_FogFar; //0x128

public:
    void SetFogColor(const GXColor&);
    void SetFogRangeRatio(float, float);
    void SetFogRange(float, float);
    void SetFogType(GXFogType);
    void SetTargetMode(DG_RENDMAN_TARGET_MODE);
    Vec GetTargetPos();
    void SetTargetPos(Vec);
    void SetCamUp(Vec);
    void SetCameraFrustumLower(float, float, float, float, float)
    void SetCameraFrustumUpper(float, float, float, float);
    void SetCameraFrustum(float, float, float, float);
    void GetLightMtxYInverse(Mtx&);
    void GetLightMtx(Mtx&);
    void SetLightFrustum(float, float, float);
    void GetViewMtx(Mtx&);
    void SetProjectionMtx();
    void SetCamera(Mtx&);

    ~DGCamera();
    DGCamera();
    DGCamera(const DGCamera&);
};