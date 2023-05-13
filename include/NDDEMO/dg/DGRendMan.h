#pragma once

#include "types.h"
#include "dolphin/GX.h"
#include "dolphin/VI.h"
#include "NDDEMO/dg/DGCamera.h"
#include "NDDEMO/dg/DGLight.h"
#include "NDDEMO/dg/DGModel.h"
#include "NDDEMO/dg/DGTexPro.h"


enum DG_RENDMAN_TARGET_MODE{
	DGR_TARGET_POSITION,
	DGR_TARGET_VECTOR
};

enum RendManDrawMode{
	RMDM_ONCE,
	RMDM_MORE
};

struct tagRENDERING_LIST{
	tagRENDERING_LIST* next; //0x0
	tagRENDERING_LIST* prev; //0x4
	DGModel* model; //0x8
};

class DGRendMan{
private:
	tagRENDERING_LIST* m_RList; //0x0
	DGLight* m_LightList[8]; //0x4
	DGCamera* m_Camera; //0x24
	DGTexPro* m_TexProjection[8]; //0x28

public:
	GetCurrentBuf__9DGRendManFv
	//Dwarf typedef entries for external variables goes here
	GetxfbHeight__9DGRendManFv
	SetBGZValue__9DGRendManFUl
	SetBGColor__9DGRendManF8_GXColor
	SetAdjustForOverscanDefault__9DGRendManFv
	SetAdjustForOverscan__9DGRendManFUsUs
	GetDispCopyGamma__9DGRendManFv
	SetDispCopyGamma__9DGRendManF8_GXGamma
	SetDispCopyDstDefault__9DGRendManFv
	SetDispCopyDst__9DGRendManFUsUs
	SetDispCopyYScaleDefault__9DGRendManFv
	SetDispCopyYScale__9DGRendManFf
	SetDispCopySrcDefault__9DGRendManFv
	SetDispCopySrc__9DGRendManFUsUsUsUs
	GetBaseRenderMode__9DGRendManFv
	SetRenderMode__9DGRendManFP16_GXRenderModeObj
	SetViewportDefault__9DGRendManFv
	SetViewport__9DGRendManFffffff
	SetScissorDefault__9DGRendManFv
	SetScissor__9DGRendManFUlUlUlUl
	SetTexProjection__9DGRendManFUcP8DGTexPro
	AddCamera__9DGRendManFP8DGCamera
	AddLight__9DGRendManFP7DGLight
	AddModel__9DGRendManFP7DGModel
	CopyRenderingBuffer__9DGRendManFUc
	Draw__9DGRendManF19enumRendManDrawMode
	DrawEnd__9DGRendManFUcUc
	DrawBegin__9DGRendManFv

	__dt__9DGRendManFv
	__ct__9DGRendManFUl
	__ct__9DGRendManFv
	__ct__9DGRendManFRC9DGRendMan

private:
	ClearRenderingList__9DGRendManFv
	DisplaySetting__9DGRendManFv
};

VITVMode DGRendMan::m_progressive;

u16 DGRendMan::m_AdjustForOverscanH;
u16 DGRendMan::m_AdjustForOverscanW;

GXGamma DGRendMan::m_DispCopyGamma;
u16 DGRendMan::m_DispCopyDstH;
u16 DGRendMan::m_DispCopyDstW;
float DGRendMan::m_DispCopyYScale;
u16 DGRendMan::m_DispCopySrcH;
u16 DGRendMan::m_DispCopySrcW;
u16 DGRendMan::m_DispCopySrcY;
u16 DGRendMan::m_DispCopySrcX;

float DGRendMan::m_ViewportF;
float DGRendMan::m_ViewportN;
float DGRendMan::m_ViewportH;
float DGRendMan::m_ViewportW;
float DGRendMan::m_ViewportY;
float DGRendMan::m_ViewportX;

u32 DGRendMan::m_ScissorH;
u32 DGRendMan::m_ScissorW;
u32 DGRendMan::m_ScissorY;
u32 DGRendMan::m_ScissorX;

u32 DGRendMan::m_BGZValue;
GXColor DGRendMan::m_BGColor;

void* DGRendMan::m_FrameBuf2;
void* DGRendMan::m_FrameBuf1;
void* DGRendMan::m_CurrentBuf;

GXRenderModeObj* DGRendMan::m_RenderMode;
GXRenderModeObj* DGRendMan::m_BaseRenderMode;
u8 DGRendMan::m_ChangeRenderModeFlag;

GXFifoObj* DGRendMan::m_GpFIFO_Obj;
void* DGRendMan::m_GpFIFO;
u32 DGRendMan::m_GpFIFO_Size;

u8 DGRendMan::m_DrawReadyFlag;
u8 DGRendMan::m_FirstFrameFlag;
u8 DGRendMan::m_InstanceNum;
