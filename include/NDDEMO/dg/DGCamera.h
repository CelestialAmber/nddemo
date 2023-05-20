#ifndef NDDEMO_DGCAMERA_H
#define NDDEMO_DGCAMERA_H

#include "types.h"
#include "dolphin/GX.h"
#include "NDDEMO/dg/DGPosition.h"
#include "NDDEMO/dg/DGRendManEnums.h"

class DGCamera : public DGPosition{
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
	DGCamera(const DGCamera&);
	DGCamera();
	~DGCamera();

	void SetCamera(Mtx& viewmtx);
	void SetProjectionMtx();
	void GetViewMtx(Mtx& viewmtx);
	void SetLightFrustum(float height, float width, float znear);
	void GetLightMtx(Mtx& texpromtx);
	void GetLightMtxYInverse(Mtx& texpromtx);
	void SetCameraFrustum(float height, float width, float znear, float zfar);
	void SetCameraFrustumUpper(float height, float width, float znear, float zfar);
	void SetCameraFrustumLower(float height, float width, float znear, float zfar, float xfbheight);
	void SetCamUp(Vec up);
	void SetTargetPos(Vec targetpos);
	Vec GetTargetPos();
	void SetTargetMode(DG_RENDMAN_TARGET_MODE mode);
	void SetFogType(GXFogType type);
	void SetFogRange(float fognear, float fogfar);
	void SetFogRangeRatio(float fognear, float fogfar);
	void SetFogColor(const GXColor& color);
};

#endif
