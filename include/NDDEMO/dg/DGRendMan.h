#ifndef NDDEMO_DGRENDMAN_H
#define NDDEMO_DGRENDMAN_H

#include "types.h"
#include "dolphin/GX.h"
#include "dolphin/VI.h"
#include "NDDEMO/dg/DGRendManEnums.h"
#include "NDDEMO/dg/DGLight.h"
#include "NDDEMO/dg/DGCamera.h"
#include "NDDEMO/dg/DGModel.h"
#include "NDDEMO/dg/DGTexPro.h"

struct tagRENDERING_LIST{
	tagRENDERING_LIST* next; //0x0
	tagRENDERING_LIST* prev; //0x4
	DGModel* model; //0x8

	tagRENDERING_LIST(const tagRENDERING_LIST&);
	tagRENDERING_LIST();
};

class DGRendMan{
private:
	tagRENDERING_LIST* m_RList; //0x0
	DGLight* m_LightList[8]; //0x4
	DGCamera* m_Camera; //0x24
	DGTexPro* m_TexProjection[8]; //0x28

public:
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


	DGRendMan(const DGRendMan&);

	DGRendMan(){
		DGRendMan(0x40000);
	}

	DGRendMan(u32 FifoSize);
	~DGRendMan();

	void DrawBegin();
	void DrawEnd(u8 cpy, u8 vsnc);
	void Draw(enumRendManDrawMode mode);

	void CopyRenderingBuffer(u8 lower);

	void AddModel(DGModel* model);
	void AddLight(DGLight* light);
	void AddCamera(DGCamera* camera);

	void SetTexProjection(u8 no, DGTexPro* texpro);

	void SetScissor(u32 x, u32 y, u32 w, u32 h);
	void SetScissorDefault();

	void SetViewport(float x, float y, float w, float h, float n, float f);
	void SetViewportDefault();

	void SetRenderMode(GXRenderModeObj* rendermode);
	GXRenderModeObj* GetBaseRenderMode();

	void SetDispCopySrc(u16 x, u16 y, u16 w, u16 h);
	void SetDispCopySrcDefault();

	void SetDispCopyYScale(float s);
	void SetDispCopyYScaleDefault();

	void SetDispCopyDst(u16 w, u16 h);
	void SetDispCopyDstDefault();

	void SetDispCopyGamma(GXGamma gamma);
	GXGamma GetDispCopyGamma();

	void SetAdjustForOverscan(u16 w, u16 h);
	void SetAdjustForOverscanDefault();

	void SetBGColor(GXColor bgcolor);
	void SetBGZValue(u32 zvalue);
	u16 GetxfbHeight();
	void* GetCurrentBuf();

private:
	void ClearRenderingList();
	void DisplaySetting();
};

#endif
