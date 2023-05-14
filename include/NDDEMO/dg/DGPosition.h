#pragma once

#include "NDDEMO/Math.h"

class DGPosition{
protected:
	Vec m_Position; //0x0
	Vec m_Rotation; //0xC
	Vec m_Scale; //0x18
	Mtx m_Trans; //0x24
	u8 m_TransFlag; //0x54
	u8 unk55[3]; //padding

public:
	void GetDirectionalVec(Vec&, Vec&);

	Vec GetScale();
	void AddScale(const Vec&);
	void SetScale(const Vec&);

	void LimitRotation();
	Vec GetRotation();
	void AddRotation(const Vec&);
	void SetRotation(const Vec&);

	Vec GetPosition();
	void DirectionalAddPosition(Vec&);
	void AddPosition(const Vec&);
	void SetPosition(const Vec&);

	void GetTransMtx(Mtx&);

	~DGPosition();
	DGPosition();
	DGPosition(const DGPosition&);
};
