#pragma once

#include "NDDEMO/Math.h"

class DGPosition{
protected:
    Vec m_Position; //0x0
    Vec m_Rotation; //0xC
    Vec m_Scale; //0x18
    Mtx m_Trans; //0x24
    u8 m_TransFlag; //0x54

public:
    void GetDirectionalVec(Vec&, Vec&);
    void GetScale();
    void AddScale(const Vec&);
    void SetScale(const Vec&);
    void LimitRotation();
    void GetRotation();
    void AddRotation(const Vec&);
    void SetRotation(const Vec&);
    void GetPosition();
    void DirectionalAddPosition(Vec&);
    void AddPosition(const Vec&);
    void SetPosition(const Vec&);
    void GetTransMtx(Mtx&);

    ~DGPosition();
    DGPosition();
    DGPosition(const DGPosition&);
};