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
	DGLight(const DGLight&);
	DGLight();
	~DGLight();

	void SetLight(GXLightID lid, DGRendState& RendState);
	Vec SetPosition(const Vec& pos);
	Vec AddPosition(const Vec& add);
	Vec GetPosition();
	void SetDirection(const Vec& dir);
	void SetDirectionFromObserve(Vec& pos);
	Vec GetDirection();
	void SetLightColor(const GXColor& color);
	GXColor GetLightColor();
	void EnableSpecularLight(u8 flag);
	void SetShininess(float shininess);
	void EnableSpotLight(u8 flag);
	void SetDistanceAttenuation(float k0, float k1, float k2);
	void SetDistanceAttenuation_0(float p0);
	void SetDistanceAttenuation_1(float p0, float d1, float p1);
	void SetDistanceAttenuation_2(float p0, float d1, float p1);
	void SetDistanceAttenuation_3(float p0, float d1, float p1, float d2, float p2);
	void SetAngleAttenuation(float a0, float a1, float a2);
	void SetAngleAttenuation_Flat(float cutoff, float p0); //2nd param name isn't in dwarf for some reason
	void SetAngleAttenuation_Cos(float cutoff, float p0);
	void SetAngleAttenuation_Cos2(float cutoff, float p0);
};
