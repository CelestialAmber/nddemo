#ifndef NDDEMO_DUDVD_H
#define NDDEMO_DUDVD_H

#include "types.h"
#include "dolphin/DVD.h"


enum enumDU_DVD_OPEN_MODE{
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
	enumDU_DVD_OPEN_MODE m_OpenMode; //0x14

	//typedef in dwarf, but likely originally a static var?
	static u8 m_InitDVD;

public:
	DUDvd(const DUDvd&);
	DUDvd(char* szFileName, enumDU_DVD_OPEN_MODE openmode);
	DUDvd();
	~DUDvd();

	void Close();
	u8* Open(char* szFileName, enumDU_DVD_OPEN_MODE openmode);
	u32 FileSize();
	void Read(void* buf, u32 length, s32 offset);

private:
	void InitDVD();
	void Init();
};

#endif
