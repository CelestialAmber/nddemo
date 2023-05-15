#ifndef NDDEMO_DGRENDSTATE_H
#define NDDEMO_DGRENDSTATE_H

#include "types.h"
#include "dolphin/GX.h"
#include "NDDEMO/Math.h"
#include "NDDEMO/dg/DGCamera.h"
#include "NDDEMO/dg/DGTexPro.h"

class DGRendState{
public:
	Mtx m_Viewmtx; //0x0
	Mtx m_Worldmtx; //0x30
	DGCamera* m_Camera; //0x60
	u32 m_CH_COLOR0A0; //0x64
	u32 m_CH_COLOR1A1; //0x68
	GXColor m_LightChannel0_AmbColor; //0x6C
	GXColor m_LightChannel0_MatColor; //0x70
	GXColor m_LightChannel1_AmbColor; //0x74
	GXColor m_LightChannel1_MatColor; //0x78
	u8 m_ChannelNum; //0x7C
	u8 m_ExistBlendParts; //0x7D
	u8 m_RendBlendParts; //0x7E
	u8 unk7F; //padding
	DGTexPro* m_TexProjection[8]; //0x80

	DGRendState(const DGRendState&);
	DGRendState();
	~DGRendState();

	void SetChan0AmbColor(GXColor& AmbColor);
	void SetChan0MatColor(GXColor& MatColor);
	void SetChan1AmbColor(GXColor& AmbColor);
	void SetChan1MatColor(GXColor& MatColor);
	void SetNumChans(u8 channum);
};

#endif
