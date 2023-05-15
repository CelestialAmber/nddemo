#ifndef NDDEMO_DGPOSITION_H
#define NDDEMO_DGPOSITION_H

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
	DGPosition(const DGPosition&);
	DGPosition();
	~DGPosition();

	void GetTransMtx(Mtx& transmtx);

	void SetPosition(const Vec& pos);
	void AddPosition(const Vec& add);
	void DirectionalAddPosition(Vec& add);
	Vec GetPosition();

	void SetRotation(const Vec& rot);
	void AddRotation(const Vec& add);
	Vec GetRotation();
	void LimitRotation();

	void SetScale(const Vec& scale);
	void AddScale(const Vec& add);
	Vec GetScale();

	void GetDirectionalVec(Vec& src, Vec& dst);
};

#endif
