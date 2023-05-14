#pragma once

#include "types.h"
#include "dolphin/DVD.h"


enum DU_DVD_OPEN_MODE{
    DUD_OM_SEQUENTIAL_ALIGN,
    DUD_OM_RANDOM_ALIGN,
    DUD_OM_SEQUENTIAL_NOALIGN,
    DUD_OM_RANDOM_NOALIGN
};

class DUDvd{
private:
    DVDFileInfo* m_Info; //0x0
    u32 m_FileSize; //0x4
    u32 m_BufSize; //0x8
    u32 m_FilePointer; //0xC
    u8* m_Buf; //0x10
    DU_DVD_OPEN_MODE m_OpenMode; //0x14

    //typedef in dwarf, but likely originally a static var?
    static u8 m_InitDVD;

public:
    void Read(void*, u32, s32);
    u32 FileSize();
    u8* Open(char*, DU_DVD_OPEN_MODE);
    void Close();

    ~DUDvd();
    DUDvd();
    DUDvd(char*, DU_DVD_OPEN_MODE);
    DUDvd(const DUDvd&);

private:
    void InitDVD();
    void Init();
};
