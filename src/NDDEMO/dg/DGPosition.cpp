#include "dolphin/MTX.h"
#include "NDDEMO/dg/DGPosition.h"
#include "NDDEMO/du/DUMacro.h"

DGPosition::DGPosition(){
	m_Position.set(0,0,0);
	m_Rotation.set(0,0,0);
	m_Scale.set(1,1,1);

	PSMTXIdentity(m_Trans);

	m_TransFlag = false;
}

DGPosition::~DGPosition(){
}

void DGPosition::GetTransMtx(Mtx& transmtx){
	if(!m_TransFlag){
		Mtx tempA, tempB; //0x40, 0x10
		PSMTXRotRad(tempA, 'X', m_Rotation.x * DEG2RAD);
		PSMTXRotRad(m_Trans, 'Y', m_Rotation.y * DEG2RAD);
		PSMTXConcat(m_Trans, tempA, tempB);
		PSMTXRotRad(m_Trans, 'Z', m_Rotation.z * DEG2RAD);
		PSMTXConcat(m_Trans, tempB, tempA);
		PSMTXTrans(m_Trans, m_Position.x, m_Position.y, m_Position.z);
		PSMTXConcat(m_Trans, tempA, tempB);
		PSMTXScale(tempA, m_Scale.x, m_Scale.y, m_Scale.z);
		PSMTXConcat(tempB, tempA, m_Trans);
		m_TransFlag = true;
	}

	PSMTXCopy(m_Trans, transmtx);
}

void DGPosition::SetPosition(const Vec& pos){
	m_TransFlag = false;
	m_Position = pos;
}

void DGPosition::AddPosition(const Vec& add){
	m_TransFlag = false;
	m_Position += add;
}

//unused
void DGPosition::DirectionalAddPosition(Vec& add){
	Mtx dummy;
	Mtx temp;
	Vec axis;
}

Vec DGPosition::GetPosition(){
	return m_Position;
}

void DGPosition::SetRotation(const Vec& rot){
	m_TransFlag = false;
	m_Rotation = rot;
	LimitRotation();
}

void DGPosition::AddRotation(const Vec& add){
	m_TransFlag = false;
	m_Rotation += add;
	LimitRotation();
}

//Clamps all rotation degrees to between -360 and 360 degrees.
void DGPosition::LimitRotation(){
	while(m_Rotation.x >= 360.0f){
		m_Rotation.x -= 360.0f;
	}

	while(m_Rotation.x <= -360.0f){
		m_Rotation.x += 360.0f;
	}

	while(m_Rotation.y >= 360.0f){
		m_Rotation.y -= 360.0f;
	}

	while(m_Rotation.y <= -360.0f){
		m_Rotation.y += 360.0f;
	}

	while(m_Rotation.z >= 360.0f){
		m_Rotation.z -= 360.0f;
	}

	while(m_Rotation.z <= -360.0f){
		m_Rotation.z += 360.0f;
	}
}

Vec DGPosition::GetRotation(){
	return m_Rotation;
}

//unused
void DGPosition::SetScale(const Vec& scale){
	m_TransFlag = false;
	m_Scale = scale;
}

//unused
void DGPosition::AddScale(const Vec& add){
	m_TransFlag = false;
	m_Scale += add;
}

//unused
Vec DGPosition::GetScale(){
	return m_Scale;
}

void DGPosition::GetDirectionalVec(Vec& src, Vec& dst){
	Mtx dummy; //0x44
	Mtx temp; //0x14

	PSMTXRotRad(temp, 'X', m_Rotation.x * DEG2RAD);
	PSMTXRotRad(dummy, 'Y', m_Rotation.y * DEG2RAD);
	PSMTXConcat(dummy, temp, temp);
	PSMTXRotRad(dummy, 'Z', m_Rotation.z * DEG2RAD);
	PSMTXConcat(dummy, temp, temp);
	PSMTXMultVecSR(temp, (Vector*)&src, (Vector*)&dst);
}

