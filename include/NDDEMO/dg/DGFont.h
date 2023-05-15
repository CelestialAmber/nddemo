#ifndef NDDEMO_DGFONT_H
#define NDDEMO_DGFONT_H

#include "types.h"
#include "dolphin/GX.h"
#include "NDDEMO/dg/DGRendMan.h"
#include "NDDEMO/dg/DGTexMan.h"

class DGFont{
private:
	DGTexMan* m_TexMan; //0x0
	u16 m_HTex; //0x4
	u16 m_TexWidth; //0x6
	u16 m_TexHeight; //0x8
	u8 m_FontWidth; //0xA
	u8 m_FontHeight; //0xB
	u8 m_Sequence; //0xC
	char m_Start; //0xD
	char m_End; //0xE
	u8 unkF; //padding
	s16 m_RetPosX; //0x10
	s16 m_PosX; //0x12
	s16 m_PosY; //0x14
	s16 m_Size; //0x16
	GXColor m_Color; //0x18
	u8 m_Ready; //0x1C
	u8 unk1D[3]; //padding

public:
	DGFont(const DGFont&);
	DGFont(DGTexMan* TexMan, const char* szFileName, u8 width, u8 height, u8 sequence, char start, char end);
	~DGFont();

	void Begin(DGRendMan* rman);
	void End();
	void StrOut(const char* str);
	void SetPosition(s16 x, s16 y);
	void SetSize(s16 s);
	void SetColor(u8 r, u8 g, u8 b, u8 a);

private:
	void CharOut(char character);
};

#endif
