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

	tagRENDERING_LIST();
	tagRENDERING_LIST(const tagRENDERING_LIST&);
};

class DGRendMan{
private:
	tagRENDERING_LIST* m_RList; //0x0
	DGLight* m_LightList[8]; //0x4
	DGCamera* m_Camera; //0x24
	DGTexPro* m_TexProjection[8]; //0x28

public:
	GetCurrentBuf();

	//these variables are referred to as typedefs, but probably are static vars?
	static VITVMode m_progressive;

	static u16 m_AdjustForOverscanH;
	static u16 m_AdjustForOverscanW;

	static GXGamma m_DispCopyGamma;
	static u16 m_DispCopyDstH;
	static u16 m_DispCopyDstW;
	static float m_DispCopyYScale;
	static u16 m_DispCopySrcH;
	static u16 m_DispCopySrcW;
	static u16 m_DispCopySrcY;
	static u16 m_DispCopySrcX;

	static float m_ViewportF;
	static float m_ViewportN;
	static float m_ViewportH;
	static float m_ViewportW;
	static float m_ViewportY;
	static float m_ViewportX;

	static u32 m_ScissorH;
	static u32 m_ScissorW;
	static u32 m_ScissorY;
	static u32 m_ScissorX;

	static u32 m_BGZValue;
	static GXColor m_BGColor;

	static void* m_FrameBuf2;
	static void* m_FrameBuf1;
	static void* m_CurrentBuf;

	static GXRenderModeObj* m_RenderMode;
	static GXRenderModeObj* m_BaseRenderMode;
	static u8 m_ChangeRenderModeFlag;

	static GXFifoObj* m_GpFIFO_Obj;
	static void* m_GpFIFO;
	static u32 m_GpFIFO_Size;

	static u8 m_DrawReadyFlag;
	static u8 m_FirstFrameFlag;
	static u8 m_InstanceNum;

	u16 GetxfbHeight();
	void SetBGZValue(u32);
	void SetBGColor(GXColor)
	void SetAdjustForOverscanDefault();
	void SetAdjustForOverscan(u16, u16);
	GXGamma GetDispCopyGamma();
	void SetDispCopyGamma(GXGamma);
	void SetDispCopyDstDefault();
	void SetDispCopyDst(u16, u16);
	void SetDispCopyYScaleDefault();
	void SetDispCopyYScale(float);
	void SetDispCopySrcDefault();
	void SetDispCopySrc(u16, u16, u16, u16);
	GXRenderModeObj* GetBaseRenderMode();
	void SetRenderMode(GXRenderModeObj*);
	void SetViewportDefault();
	void SetViewport(float, float, float, float, float, float);
	void SetScissorDefault();
	void SetScissor(u32, u32, u32, u32);
	void SetTexProjection(u8, DGTexPro*);
	void AddCamera(DGCamera*);
	void AddLight(DGLight*);
	void AddModel(DGModel*);
	void CopyRenderingBuffer(u8);
	void Draw(RendManDrawMode);
	void DrawEnd(u8, u8);
	void DrawBegin();

	~DGRendMan();
	DGRendMan(u32);
	DGRendMan();
	DGRendMan(const DGRendMan&);

private:
	void ClearRenderingList();
	void DisplaySetting();
};
