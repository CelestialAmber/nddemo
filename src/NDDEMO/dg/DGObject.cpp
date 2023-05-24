#include "NDDEMO/dg/DGObject.h"
#include "NDDEMO/du/DUMacro.h"
#include "dolphin/GX.h"
#include "dolphin/OS.h"
#include <cstring>

//GXTEXMAP_TABLE$160
//might be a local func var?
static const GXTexMapID GXTEXMAP_TABLE[] = {
	GX_TEXMAP0,
	GX_TEXMAP1,
	GX_TEXMAP2,
	GX_TEXMAP3,
	GX_TEXMAP4,
	GX_TEXMAP5,
	GX_TEXMAP6,
	GX_TEXMAP7
};

static const GXTevStageID TevStageID_TABLE[] = {
	GX_TEVSTAGE0,
	GX_TEVSTAGE1,
	GX_TEVSTAGE2,
	GX_TEVSTAGE3,
	GX_TEVSTAGE4,
	GX_TEVSTAGE5,
	GX_TEVSTAGE6,
	GX_TEVSTAGE7,
	GX_TEVSTAGE8,
	GX_TEVSTAGE9,
	GX_TEVSTAGE10,
	GX_TEVSTAGE11,
	GX_TEVSTAGE12,
	GX_TEVSTAGE13,
	GX_TEVSTAGE14,
	GX_TEVSTAGE15,
};

static const GXTexCoordID TexCoordID_TABLE[] = {
	GX_TEXCOORD0,
	GX_TEXCOORD1,
	GX_TEXCOORD2,
	GX_TEXCOORD3,
	GX_TEXCOORD4,
	GX_TEXCOORD5,
	GX_TEXCOORD6,
	GX_TEXCOORD7,
	GX_TEXCOORD_NULL
};

static const GXTexMapID TexMapID_TABLE[] = {
	GX_TEXMAP0,
	GX_TEXMAP1,
	GX_TEXMAP2,
	GX_TEXMAP3,
	GX_TEXMAP4,
	GX_TEXMAP5,
	GX_TEXMAP6,
	GX_TEXMAP7,
	GX_TEXMAP_NULL
};

static const GXChannelID ChannelID_TABLE[] = {
	GX_COLOR0,
	GX_COLOR1,
	GX_ALPHA0,
	GX_ALPHA1,
	GX_COLOR0A0,
	GX_COLOR1A1,
	GX_COLOR_ZERO,
	GX_ALPHA_BUMP,
	GX_ALPHA_BUMPN,
	GX_COLOR_NULL
};

static const GXTevColorArg TevColorArg_TABLE[] = {
	GX_CC_C0,
	GX_CC_C1,
	GX_CC_C2,
	GX_CC_CPREV,
	GX_CC_A0,
	GX_CC_A1,
	GX_CC_A2,
	GX_CC_APREV,
	GX_CC_TEXC,
	GX_CC_TEXRRR,
	GX_CC_TEXGGG,
	GX_CC_TEXBBB,
	GX_CC_TEXA,
	GX_CC_RASC,
	GX_CC_RASA,
	GX_CC_ONE,
	GX_CC_HALF,
	GX_CC_KONST,
	GX_CC_ZERO
};

static const GXTevOp TevOp_TABLE[] = {
	GX_TEV_ADD,
	GX_TEV_SUB
};

static const GXTevBias TevBias_TABLE[] = {
	GX_TB_ZERO,
	GX_TB_ADDHALF,
	GX_TB_SUBHALF
};

static const GXTevScale TevScale_TABLE[] = {
	GX_CS_SCALE_1,
	GX_CS_SCALE_2,
	GX_CS_SCALE_4,
	GX_CS_DIVIDE_2
};

//why oh why nintendo
static const GXBool Bool_TABLE[] = {
	false,
	true
};

static const GXTevRegID TevRegID_TABLE[] = {
	GX_TEVREG0,
	GX_TEVREG1,
	GX_TEVREG2,
	GX_TEVPREV
};

static const GXTevAlphaArg TevAlphaArg_TABLE[] = {
	GX_CA_A0,
	GX_CA_A1,
	GX_CA_A2,
	GX_CA_APREV,
	GX_CA_TEXA,
	GX_CA_RASA,
	GX_CA_KONST,
	GX_CA_ZERO
};

static const GXBlendMode BlendMode_TABLE[] = {
	GX_BM_NONE,
	GX_BM_BLEND,
	GX_BM_LOGIC
};

static const GXBlendFactor BlendFactor_src_TABLE[] = {
	GX_BL_ZERO,
	GX_BL_ONE,
	GX_BL_SRCCLR,
	GX_BL_INVSRCCLR,
	GX_BL_SRCALPHA,
	GX_BL_INVSRCALPHA,
	GX_BL_DSTALPHA,
	GX_BL_INVDSTALPHA
};

static const GXBlendFactor BlendFactor_dst_TABLE[] = {
	GX_BL_ZERO,
	GX_BL_ONE,
	GX_BL_DSTCLR,
	GX_BL_INVDSTCLR,
	GX_BL_SRCALPHA,
	GX_BL_INVSRCALPHA,
	GX_BL_DSTALPHA,
	GX_BL_INVDSTALPHA
};

static const GXLogicOp LogicOp_TABLE[] = {
	GX_LO_CLEAR,
	GX_LO_SET,
	GX_LO_COPY,
	GX_LO_INVCOPY,
	GX_LO_NOOP,
	GX_LO_INV,
	GX_LO_AND,
	GX_LO_NAND,
	GX_LO_OR,
	GX_LO_NOR,
	GX_LO_XOR,
	GX_LO_EQUIV,
	GX_LO_REVAND,
	GX_LO_INVAND,
	GX_LO_REVOR,
	GX_LO_INVOR
};

static const GXCompare Compare_TABLE[] = {
	GX_NEVER,
	GX_LESS,
	GX_LEQUAL,
	GX_EQUAL,
	GX_NEQUAL,
	GX_GEQUAL,
	GX_GREATER,
	GX_ALWAYS
};

static const GXTexGenType TexGenType_TABLE[] = {
	GX_TG_MTX3x4,
	GX_TG_MTX2x4,
	GX_TG_BUMP0,
	GX_TG_BUMP1,
	GX_TG_BUMP2,
	GX_TG_BUMP3,
	GX_TG_SRTG
};

static const GXTexGenSrc TexGenSrc_TABLE[] = {
	GX_TG_POS,
	GX_TG_NRM,
	GX_TG_BINRM,
	GX_TG_TANGENT,
	GX_TG_TEX0,
	GX_TG_TEX1,
	GX_TG_TEX2,
	GX_TG_TEX3,
	GX_TG_TEX4,
	GX_TG_TEX5,
	GX_TG_TEX6,
	GX_TG_TEX7,
	GX_TG_TEXCOORD0,
	GX_TG_TEXCOORD1,
	GX_TG_TEXCOORD2,
	GX_TG_TEXCOORD3,
	GX_TG_TEXCOORD4,
	GX_TG_TEXCOORD5,
	GX_TG_TEXCOORD6,
	GX_TG_COLOR0,
	GX_TG_COLOR1
};

static const GXTexMtx TexMtx_TABLE[] = {
	GX_TEXMTX0,
	GX_TEXMTX1,
	GX_TEXMTX2,
	GX_TEXMTX3,
	GX_TEXMTX4,
	GX_TEXMTX5,
	GX_TEXMTX6,
	GX_TEXMTX7,
	GX_TEXMTX8,
	GX_TEXMTX9,
	GX_IDENTITY
};

static const GXIndTexStageID IndTexStageID_TABLE[] = {
	GX_INDTEXSTAGE0,
	GX_INDTEXSTAGE1,
	GX_INDTEXSTAGE2,
	GX_INDTEXSTAGE3,
	GX_MAX_INDTEXSTAGE
};

static const GXIndTexScale IndTexScale_TABLE[] = {
	GX_ITS_1,
	GX_ITS_2,
	GX_ITS_4,
	GX_ITS_8,
	GX_ITS_16,
	GX_ITS_32,
	GX_ITS_64,
	GX_ITS_128,
	GX_ITS_256,
	GX_MAX_ITSCALE
};

static const GXIndTexMtxID IndTexMtxID_TABLE[] = {
	GX_ITM_OFF,
	GX_ITM_0,
	GX_ITM_1,
	GX_ITM_2,
	GX_ITM_S0,
	GX_ITM_S1,
	GX_ITM_S2,
	GX_ITM_T0,
	GX_ITM_T1,
	GX_ITM_T2
};

//local var?
//TEX_AT$288
static const GXAttr TEX_AT[] = {
	GX_VA_TEX0,
	GX_VA_TEX1,
	GX_VA_TEX2,
	GX_VA_TEX3,
	GX_VA_TEX4,
	GX_VA_TEX5,
	GX_VA_TEX6,
	GX_VA_TEX7
};

u32 DGObject::lineMode;


DGObject::DGObject(DGTexMan* TexMan){
	m_ReferCount = 0;
	m_TexMan = TexMan;

	m_VIAT = GX_NONE;
	m_NIAT = GX_NONE;
	m_CIAT = GX_NONE;
	m_TIAT = GX_NONE;

	m_VCompCnt = GX_POS_XYZ;
	m_VCompType = GX_F32;
	m_VFixPoint = 0;
	m_VStride = 0;

	m_NCompCnt = GX_NRM_XYZ;
	m_NCompType = GX_F32;
	m_NFixPoint = 0;
	m_NStride = 0;

	m_CCompCnt = GX_CLR_RGBA;
	m_CCompType = GX_RGBA8;
	m_CStride = 0;

	m_TCompCnt = GX_TEX_ST;
	m_TCompType = GX_F32;
	m_TFixPoint = 0;
	m_TStride = 0;

	m_ArrayImg = nullptr;
	m_ArrayImgSize = 0;
	m_NormalArrayImg = nullptr;
	m_ColorArrayImg = nullptr;
	m_TexUVArrayImg = nullptr;
	m_ObjSteram = nullptr;
	m_DispList = nullptr;

	m_TexTrans[0] = 0;
	m_TexTrans[1] = 0;
	m_TexTrans[2] = 0;
	m_TexTrans[3] = 0;
	m_TexTrans[4] = 0;
	m_TexTrans[5] = 0;
	m_TexTrans[6] = 0;
	m_TexTrans[7] = 0;

	m_uTexWrap = 0;
	m_vTexWrap = 0;
	m_PartsBlock = nullptr;
}

DGObject::~DGObject(){
	if(m_ReferCount > 0){
		OSReport("Error DGObject::~DGObject ReferCount>0\n");
	}

	McrFree(m_ArrayImg);
	McrFree(m_ObjSteram);
	McrFree(m_DispList);
	McrFree(m_PartsBlock);
}

void DGObject::Draw(){
	if(m_VIAT != 0){
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, m_VCompCnt, m_VCompType, m_VFixPoint);
		GXSetArray(GX_VA_POS, (u32)m_ArrayImg, m_VStride);
	}

	if(m_NIAT != 0){
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_NRM, m_NCompCnt, m_NCompType, m_NFixPoint);
		GXSetArray(GX_VA_NRM, (u32)m_NormalArrayImg, m_NStride);
	}

	if(m_CIAT != 0){
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_CLR0, m_CCompCnt, m_CCompType, 0);
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_CLR1, m_CCompCnt, m_CCompType, 0);
		GXSetArray(GX_VA_CLR0, (u32)m_ColorArrayImg, m_CStride);
		GXSetArray(GX_VA_CLR1, (u32)m_ColorArrayImg, m_CStride);
	}

	if(m_TIAT != 0){
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, m_TCompCnt, m_TCompType, m_TFixPoint);
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX1, m_TCompCnt, m_TCompType, m_TFixPoint);
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX2, m_TCompCnt, m_TCompType, m_TFixPoint);
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX3, m_TCompCnt, m_TCompType, m_TFixPoint);
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX4, m_TCompCnt, m_TCompType, m_TFixPoint);
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX5, m_TCompCnt, m_TCompType, m_TFixPoint);
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX6, m_TCompCnt, m_TCompType, m_TFixPoint);
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX7, m_TCompCnt, m_TCompType, m_TFixPoint);
		GXSetArray(GX_VA_TEX0, (u32)m_TexUVArrayImg, m_TStride);
		GXSetArray(GX_VA_TEX1, (u32)m_TexUVArrayImg, m_TStride);
		GXSetArray(GX_VA_TEX2, (u32)m_TexUVArrayImg, m_TStride);
		GXSetArray(GX_VA_TEX3, (u32)m_TexUVArrayImg, m_TStride);
		GXSetArray(GX_VA_TEX4, (u32)m_TexUVArrayImg, m_TStride);
		GXSetArray(GX_VA_TEX5, (u32)m_TexUVArrayImg, m_TStride);
		GXSetArray(GX_VA_TEX6, (u32)m_TexUVArrayImg, m_TStride);
		GXSetArray(GX_VA_TEX7, (u32)m_TexUVArrayImg, m_TStride);
	}

	for(u8 i = 0; i < 8; i++){
		if(m_TexTrans[i] != 0xFFFF){
			GXTexObj texobj;
			u32 filler;

			GXTexWrapMode wrap_s = GX_CLAMP;

			if((m_uTexWrap & (1 << (i*2))) != 0){
				wrap_s = GX_REPEAT;
			}else if((m_uTexWrap & (2 << (i*2))) != 0){
				wrap_s = GX_MIRROR;
			}

			GXTexWrapMode wrap_t = GX_CLAMP;

			if((m_vTexWrap & (1 << (i*2))) != 0){
				wrap_t = GX_REPEAT;
			}else if((m_vTexWrap & (2 << (i*2))) != 0){
				wrap_t = GX_MIRROR;
			}

			m_TexMan->InitTexObj(&texobj, m_TexTrans[i], wrap_s, wrap_t);
			GXLoadTexObj(&texobj, GXTEXMAP_TABLE[i]);
		}
	}

	ExecuteObjStream();
}

void DGObject::SetArrayFormat(u16 VertexArrayFormat, u16 NormalArrayFormat, u16 ColorArrayFormat, u16 TexUVArrayFormat){
	if(m_NIAT != GX_NONE){
		switch(VertexArrayFormat & 0xE000){
			case 0xE000:
			m_VCompType = GX_F32;
			break;
			case 0xA000:
			m_VCompType = GX_S16;
			break;
			case 0x2000:
			m_VCompType = GX_U16;
			break;
			case 0x8000:
			m_VCompType = GX_S8;
			break;
			case 0x0:
			m_VCompType = GX_U8;
			break;
			default:
			OSReport("Error:SetArrayFormat(m_VCompType)\n");
			break;
		}

		m_VCompCnt = !(VertexArrayFormat & 0x1000) ? GX_POS_XY : GX_POS_XYZ;
		m_VFixPoint = (VertexArrayFormat >> 8) & 0xF;
		m_VStride = (((VertexArrayFormat >> 13) & 0x3) + 1) * (((VertexArrayFormat >> 12) & 1) + 2);
	}

	if(m_NIAT != GX_NONE){
		switch(NormalArrayFormat & 0xE000){
			case 0xE000:
			m_NCompType = GX_F32;
			break;
			case 0xA000:
			m_NCompType = GX_S16;
			break;
			case 0x8000:
			m_NCompType = GX_S8;
			break;
			default:
			OSReport("Error:SetArrayFormat(m_NCompType)\n");
			break;
		}

		m_NCompCnt = !(NormalArrayFormat & 0x1000) ? GX_NRM_XYZ : GX_NRM_NBT;
		m_NFixPoint = (NormalArrayFormat >> 8) & 0xF;
		m_NStride = (((NormalArrayFormat >> 13) & 0x3) + 1) * 3;
	}

	if(m_CIAT != GX_NONE){
		switch(ColorArrayFormat & 0xE000){
			case 0xE000:
			m_CCompType = GX_RGBA8;
			break;
			case 0xC000:
			m_CCompType = GX_RGBA6;
			break;
			case 0xA000:
			m_CCompType = GX_RGBA4;
			break;
			case 0x6000:
			m_CCompType = GX_RGBX8;
			break;
			case 0x4000:
			m_CCompType = GX_RGB8;
			break;
			case 0x2000:
			m_CCompType = GX_RGB565;
			break;
			default:
			OSReport("Error:SetArrayFormat(m_CCompType)\n");
			break;
		}

		m_CCompCnt = !(ColorArrayFormat & 0x1000) ? GX_CLR_RGB : GX_CLR_RGBA;
		m_CStride = (((ColorArrayFormat >> 13) & 0x3) + 1);
	}

	if(m_TIAT != GX_NONE){
		switch(TexUVArrayFormat & 0xE000){
			case 0xE000:
			m_TCompType = GX_F32;
			break;
			case 0xA000:
			m_TCompType = GX_S16;
			break;
			case 0x2000:
			m_TCompType = GX_U16;
			break;
			case 0x8000:
			m_TCompType = GX_S8;
			break;
			case 0x0:
			m_TCompType = GX_U8;
			break;
			default:
			OSReport("Error:SetArrayFormat(m_TCompType)\n");
			break;
		}

		m_TCompCnt = !(TexUVArrayFormat & 0x1000) ? GX_TEX_S : GX_TEX_ST;
		m_TFixPoint = (TexUVArrayFormat >> 8) & 0xF;
		m_TStride = (((TexUVArrayFormat >> 13) & 0x3) + 1) * (((TexUVArrayFormat >> 12) & 1) + 1);
	}

}

//Executes all commands in the stored object stream.
void DGObject::ExecuteObjStream(){
	u8* OSPtr = m_ObjSteram;
	
	//Keep executing instructions until we hit an FF byte (terminator)
	while(*OSPtr != 0xFF){
		//Execute the next command
		switch(*OSPtr & 0xF0){
			case 0x00:
			oscmdExtend0(OSPtr);
			break;
			case 0x10:
			oscmdVtxDesc(OSPtr);
			break;
			case 0x20:
			oscmdTevDirect(OSPtr);
			break;
			case 0x40:
			oscmdTevOrder(OSPtr);
			break;
			case 0x50:
			oscmdTevStages(OSPtr);
			break;
			case 0x60:
			oscmdTexGens(OSPtr);
			break;
			case 0x70:
			oscmdTevColorInOp(OSPtr);
			break;
			case 0x80:
			oscmdTevAlphaInOp(OSPtr);
			break;
			case 0x90:
			oscmdTevColor(OSPtr);
			break;
			case 0xA0:
			oscmdBlendMode(OSPtr);
			break;
			case 0xB0:
			oscmdTexCoordGen(OSPtr);
			break;
			case 0xC0:
			oscmdIndStages(OSPtr);
			break;
			case 0xD0:
			oscmdIndTexOrder(OSPtr);
			break;
			case 0xE0:
			oscmdIndTexCoordScale(OSPtr);
			break;
			case 0xF0:
			oscmdExtendF(OSPtr);
			break;
			default:
			//A 0x3x byte was found, which doesn't map to a command
			OSReport("Error DGObject::ExecuteObjStream>%d\n", *OSPtr);
			OSPtr++;
			break;
		}
	}
}

void DGObject::oscmdExtend0(u8*& OSPtr){
	switch(OSPtr[0] & 0xF){
		case 0:
		OSPtr++;
		break;
		default:
		OSReport("Error DGObject::oscmdExtend0>");
		OSPtr++;
		break;
	}
}

/*
Parameters:
0x0: command id (bits 0-3)
*/
void DGObject::oscmdExtendF(u8*& OSPtr){
	switch(OSPtr[0] & 0xF){
		case 0:
		if(lineMode == 0) oscmdDisplayList(OSPtr);
		else oscmdDrawLine(OSPtr);
		break;
		case 1:
		oscmdZMode(OSPtr);
		break;
		case 2:
		oscmdIndBumpXYZ(OSPtr);
		break;
		default:
		OSReport("Error DGObject::oscmdExtendF>");
		OSPtr++;
		break;
	}
}

/*
Parameters:
0x0:
bit 0: viat flag
bit 1: niat flag
bit 2: ciat flag
bit 3: tiat flag
0x1:
bits 0-3: unused
bits 4-7: unknown length
*/
void DGObject::oscmdVtxDesc(u8*& OSPtr){
	if((OSPtr[0] & 0x1) == 0){
		GXSetVtxDesc(GX_VA_POS, GX_NONE);
	}else{
		GXSetVtxDesc(GX_VA_POS, m_VIAT);
	}

	if((OSPtr[0] & 0x2) == 0){
		GXSetVtxDesc(GX_VA_NRM, GX_NONE);
	}else{
		GXSetVtxDesc(GX_VA_NRM, m_NIAT);
	}

	if((OSPtr[0] & 0x4) == 0){
		GXSetVtxDesc(GX_VA_CLR0, GX_NONE);
	}else{
		GXSetVtxDesc(GX_VA_CLR0, m_CIAT);
	}

	if((OSPtr[0] & 0x8) == 0){
		GXSetVtxDesc(GX_VA_CLR1, GX_NONE);
	}else{
		GXSetVtxDesc(GX_VA_CLR1, m_CIAT);
	}

	int i = 0;

	while(i < ((OSPtr[1] >> 4) & 0xF)){
		GXSetVtxDesc(TEX_AT[i], m_TIAT);
		i++;
	}

	while(i < 8){
		GXSetVtxDesc(TEX_AT[i], GX_NONE);
		i++;
	}

	OSPtr += 2;
}

/*
Paramaters:
0x0:
bits 0-3: tev stage
*/
void DGObject::oscmdTevDirect(u8*& OSPtr){
	GXSetTevDirect(TevStageID_TABLE[OSPtr[0] & 0xF]);
	OSPtr++;
}

/*
Parameters:
0x0:
bits 0-3: tev stage
0x1:
bits 0-3: tex map id
bits 4-7: tex coord id
0x2:
bits 0-3: channel id
bits 4-7: unused
*/
void DGObject::oscmdTevOrder(u8*& OSPtr){
	GXSetTevOrder(TevStageID_TABLE[(OSPtr[0] & 0xF)], TexCoordID_TABLE[(OSPtr[1] >> 4) & 0xF], TexMapID_TABLE[OSPtr[1] & 0xF], ChannelID_TABLE[OSPtr[2] & 0xF]);
	OSPtr += 3;
}

/*
Parameters:
0x0:
bits 0-3: tev stages
*/
void DGObject::oscmdTevStages(u8*& OSPtr){
	GXSetNumTevStages((OSPtr[0] & 0xF) + 1);
	OSPtr++;
}

/*
Parameters:
0x0:
bits 0-3: tex gens
*/
void DGObject::oscmdTexGens(u8*& OSPtr){
	GXSetNumTexGens(OSPtr[0] & 0xF);
	OSPtr++;
}

void DGObject::oscmdTevColorInOp(u8*& OSPtr){
	GXSetTevColorIn(TevStageID_TABLE[OSPtr[0] & 0xF], TevColorArg_TABLE[OSPtr[1] & 0x1F], TevColorArg_TABLE[OSPtr[2] & 0x1F],
					TevColorArg_TABLE[OSPtr[3] & 0x1F], TevColorArg_TABLE[OSPtr[4] & 0x1F]);
	GXSetTevColorOp(TevStageID_TABLE[OSPtr[0] & 0xF], TevOp_TABLE[(OSPtr[1] >> 5) & 1], TevBias_TABLE[(OSPtr[1] >> 6) & 3],
					TevScale_TABLE[(OSPtr[2] >> 5) & 3], Bool_TABLE[(OSPtr[2] >> 7) & 1], TevRegID_TABLE[(OSPtr[3] >> 5) & 3]);
	OSPtr += 5;
}

void DGObject::oscmdTevAlphaInOp(u8*& OSPtr){
	GXSetTevAlphaIn(TevStageID_TABLE[OSPtr[0] & 0xF], TevAlphaArg_TABLE[OSPtr[1] & 0xF], TevAlphaArg_TABLE[(OSPtr[1] >> 4) & 0xF],
					TevAlphaArg_TABLE[OSPtr[2] & 0xF], TevAlphaArg_TABLE[(OSPtr[2] >> 4) & 0xF]);
	GXSetTevAlphaOp(TevStageID_TABLE[(OSPtr[0] & 0xf)], TevOp_TABLE[OSPtr[3] & 1], TevBias_TABLE[(OSPtr[3] >> 1) & 3],
					TevScale_TABLE[(OSPtr[3] >> 3) & 3], Bool_TABLE[(OSPtr[3] >> 5) & 1], TevRegID_TABLE[(OSPtr[3] >> 6) & 3]);
	OSPtr += 4;
}

void DGObject::oscmdTevColor(u8*& OSPtr){
	GXSetTevColor(TevRegID_TABLE[OSPtr[0] & 3], *(GXColor*)(OSPtr + 1));
	OSPtr += 5;
}

void DGObject::oscmdBlendMode(u8*& OSPtr){
	GXSetBlendMode(BlendMode_TABLE[(OSPtr[1] >> 6) & 3], BlendFactor_src_TABLE[(OSPtr[1] >> 3) & 0x7], BlendFactor_dst_TABLE[(OSPtr[1] & 0x7)], LogicOp_TABLE[OSPtr[0] & 0xF]);
	OSPtr += 2;
}

void DGObject::oscmdTexCoordGen(u8*& OSPtr){
	GXSetTexCoordGen(TexCoordID_TABLE[OSPtr[0] & 0xF], TexGenType_TABLE[(OSPtr[1] >> 5) & 0x7], TexGenSrc_TABLE[OSPtr[1] & 0x1F], TexMtx_TABLE[OSPtr[2] & 0xF]);
	OSPtr += 3;
}

/*
Parameters:
0x0:
bits 0-3: ind stages
*/
void DGObject::oscmdIndStages(u8*& OSPtr){
	GXSetNumIndStages(OSPtr[0] & 0xF);
	OSPtr++;
}

/*
Parameters:
0x0: ind tex stage (bits 0-3)
0x1: tex map id (bits 0-3), tex coord id (bits 4-7)
*/
void DGObject::oscmdIndTexOrder(u8*& OSPtr){
	GXSetIndTexOrder(IndTexStageID_TABLE[OSPtr[0] & 0xF], TexCoordID_TABLE[(OSPtr[1] >> 4) & 0xF], TexMapID_TABLE[OSPtr[1] & 0xF]);
	OSPtr += 2;
}

/*
Parameters:
0x0: ind tex stage (bits 0-3)
0x1: scaleT (bits 0-3), scaleS (bits 4-7)
*/
void DGObject::oscmdIndTexCoordScale(u8*& OSPtr){
	GXSetIndTexCoordScale(IndTexStageID_TABLE[OSPtr[0] & 0xF], IndTexScale_TABLE[(OSPtr[1] >> 4) & 0xF], IndTexScale_TABLE[OSPtr[1] & 0xF]);
	OSPtr += 2;
}

//nonmatching
//https://decomp.me/scratch/DRfDV
/*
Parameters:
0x1-4: display list start offset
0x5-8: display list data length
*/
void DGObject::oscmdDrawLine(u8*& OSPtr){
	static u32 vtxByteSize[] = {0,0,1,2};
	u8* ptr = m_DispList + *(u32*)(OSPtr + 1); //r20
	u8* ptrEnd = ptr + *(u32*)(OSPtr + 5); //r19
	u32 vtxStride; //r18
	GXVtxDescList attrList[27]; //0x6C
	
	GXGetVtxDescv(attrList);

	//0x8
	u32 colOffset = vtxByteSize[m_VIAT] + vtxByteSize[m_NIAT];

	vtxStride = colOffset;
	vtxStride += vtxByteSize[attrList[12].type];
	vtxStride += vtxByteSize[attrList[11].type];
	vtxStride += vtxByteSize[attrList[13].type];
	vtxStride += vtxByteSize[attrList[14].type];
	vtxStride += vtxByteSize[attrList[15].type];
	vtxStride += vtxByteSize[attrList[16].type];
	vtxStride += vtxByteSize[attrList[17].type];
	vtxStride += vtxByteSize[attrList[18].type];
	vtxStride += vtxByteSize[attrList[19].type];
	vtxStride += vtxByteSize[attrList[20].type];

	GXClearVtxDesc();
	GXSetVtxDesc(GX_VA_POS, m_VIAT);
	GXSetVtxDesc(GX_VA_CLR0, m_CIAT);
	GXSetNumChans(1);

	GXColor matCol = {0, 144, 0, 255}; //0x60, not in dwarf
	u32 filler[21];

	GXSetChanMatColor(GX_COLOR0A0, matCol);
	GXSetChanCtrl(GX_COLOR0A0, false, GX_SRC_VTX, GX_SRC_REG, GX_LIGHT_NULL, GX_DF_NONE, GX_AF_NONE);
	GXSetNumTevStages(1);
	GXSetNumTexGens(0);
	GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
	GXSetTevOp(GX_TEVSTAGE0, GX_PASSCLR);
	GXSetLineWidth(6, 0);

	//Draw all the quads/triangles specified in the display list until the end is reached
	while(ptrEnd > ptr){ //why not ptr < ptrEnd?
		u32 primType; //r3
		u32 vtxFmt; //r17
		u16 nverts; //r16

		/*
		Parameter bytes format:
		0x0:
		bits 0-2: vertex format
		bits 3-7: primitive type
		0x1-2: total vertices
		*/
		nverts = *(u16*)(ptr + 1);
		primType = *ptr & 0xf8;
		vtxFmt = *ptr & 7;
		ptr += 3;

		if (primType == GX_QUADS) {
			for (u32 cnt = 0; cnt < nverts; cnt += 4) {
				GXBegin(GX_LINESTRIP, (GXVtxFmt)vtxFmt, 5);

				//Line 1
				if (m_VIAT == GX_INDEX8) {
					WGPIPE.uc = *ptr;
				}else if (m_VIAT == GX_INDEX16) {
					WGPIPE.us = *(u16*)ptr;
				}

				if (m_CIAT == GX_INDEX8) {
					WGPIPE.uc = *(ptr + colOffset);
				}else if (m_CIAT == GX_INDEX16) {
					WGPIPE.us = *(u16*)(ptr + colOffset);
				}

				//Line 2
				if (m_VIAT == GX_INDEX8) {
					WGPIPE.uc = *(ptr + vtxStride);
				}else if (m_VIAT == GX_INDEX16) {
					WGPIPE.us = *(u16*)(ptr + vtxStride);
				}

				if (m_CIAT == GX_INDEX8) {
					WGPIPE.uc = *(ptr + (vtxStride + colOffset));
				}else if (m_CIAT == GX_INDEX16) {
					WGPIPE.us = *(u16*)(ptr + (vtxStride + colOffset));
				}

				//Line 3
				if (m_VIAT == GX_INDEX8) {
					WGPIPE.uc = *(ptr + (vtxStride * 2));
				}else if (m_VIAT == GX_INDEX16) {
					WGPIPE.us = *(u16*)(ptr + (vtxStride * 2));
				}

				if (m_CIAT == GX_INDEX8) {
					WGPIPE.uc = *(ptr + ((vtxStride * 2) + colOffset));
				}else if (m_CIAT == GX_INDEX16) {
					WGPIPE.us = *(u16*)(ptr + ((vtxStride * 2) + colOffset));
				}

				//Line 4
				if (m_VIAT == GX_INDEX8) {
					WGPIPE.uc = *(ptr + (vtxStride * 3));
				}else if (m_VIAT == GX_INDEX16) {
					WGPIPE.us = *(u16*)(ptr + (vtxStride * 3));
				}

				if (m_CIAT == GX_INDEX8) {
					WGPIPE.uc = *(ptr + ((vtxStride * 3) + colOffset));
				}else if (m_CIAT == GX_INDEX16) {
					WGPIPE.us = *(u16*)(ptr + ((vtxStride * 3) + colOffset));
				}

				//Line 5
				if (m_VIAT == GX_INDEX8) {
					WGPIPE.uc = *ptr;
				}else if (m_VIAT == GX_INDEX16) {
					WGPIPE.us = *(u16*)ptr;
				}

				if (m_CIAT == GX_INDEX8) {
					WGPIPE.uc = *(ptr + colOffset);
				}else if (m_CIAT == GX_INDEX16) {
					WGPIPE.us = *(u16*)(ptr + colOffset);
				}

				GXEnd();

				ptr += vtxStride * 4;
			}
		} else if (primType == GX_TRIANGLES) {
				for (u32 cnt = 0; cnt < nverts; cnt += 3) {
					GXBegin(GX_LINESTRIP, (GXVtxFmt)vtxFmt, 4);

					//Line 1
					if (m_VIAT == GX_INDEX8) {
						WGPIPE.uc = *ptr;
					}else if (m_VIAT == GX_INDEX16) {
						WGPIPE.us = *(u16*)ptr;
					}

					if (m_CIAT == GX_INDEX8) {
						WGPIPE.uc = *(ptr + colOffset);
					}else if (m_CIAT == GX_INDEX16) {
						WGPIPE.us = ((u16*)ptr)[colOffset];
					}

					//Line 2
					if (m_VIAT == GX_INDEX8) {
						WGPIPE.uc = *(ptr + vtxStride);
					}else if (m_VIAT == GX_INDEX16) {
						WGPIPE.us = *(u16*)(ptr + vtxStride);
					}

					if (m_CIAT == GX_INDEX8) {
						WGPIPE.uc = *(ptr + (vtxStride + colOffset));
					}else if (m_CIAT == GX_INDEX16) {
						WGPIPE.us = *(u16*)(ptr + (vtxStride + colOffset));
					}

					//Line 3
					if (m_VIAT == GX_INDEX8) {
						WGPIPE.uc = *(ptr + (vtxStride * 2));
					}else if (m_VIAT == GX_INDEX16) {
						WGPIPE.us = *(u16*)(ptr + (vtxStride * 2));
					}

					if (m_CIAT == GX_INDEX8) {
						WGPIPE.uc = *(ptr + ((vtxStride * 2) + colOffset));
					}else if (m_CIAT == GX_INDEX16) {
						WGPIPE.us = *(u16*)(ptr + ((vtxStride * 2) + colOffset));
					}

					//Line 4
					if (m_VIAT == GX_INDEX8) {
						WGPIPE.uc = *ptr;
					}else if (m_VIAT == GX_INDEX16) {
						WGPIPE.us = *(u16*)ptr;
					}

					if (m_CIAT == GX_INDEX8) {
						WGPIPE.uc = *(ptr + colOffset);
					}else if (m_CIAT == GX_INDEX16) {
						WGPIPE.us = ((u16*)ptr)[colOffset];
					}

					GXEnd();

					ptr += vtxStride * 3;
				}
		}else{
			OSReport("Primitive error\n");
			break;
		}

		if(*ptr == 0) break;
	}

	GXDrawDone();
	GXSetVtxDescv(attrList);

	OSPtr += 9;
}

/*
Parameters:
0x1-0x4: display list offset
0x5-0x8: list size
*/
void DGObject::oscmdDisplayList(u8*& OSPtr){
	GXCallDisplayList(m_DispList + *(u32*)(OSPtr + 1), *(u32*)(OSPtr + 5));
	OSPtr += 9;
}

/*
Parameters:
0x1: compare enable (bit 4), compare type (bits 0-2), update enable (bit 3)
*/
void DGObject::oscmdZMode(u8*& OSPtr){
	GXSetZMode(Bool_TABLE[(OSPtr[1] >> 4) & 1], Compare_TABLE[OSPtr[1] & 0x7], Bool_TABLE[(OSPtr[1] >> 3) & 1]);
	OSPtr += 2;
}

/*
Parameters:
0x1: tev stage (bits 0-3), ind tev stage (bits 4-7)
0x2: ind tex matrix id (bits 0-3)
*/
void DGObject::oscmdIndBumpXYZ(u8*& OSPtr){
	GXSetTevIndBumpXYZ(TevStageID_TABLE[(OSPtr[1] >> 4) & 0xF], IndTexStageID_TABLE[(OSPtr[1] & 0xF)], IndTexMtxID_TABLE[OSPtr[2] & 0xF]);
	OSPtr += 3;
}

u16 DGObject::IncRefer(){
	for(u8 i = 0; i < 8; i++){
		if(m_TexTrans[i] != 0xFFFF){
			m_TexMan->AttachTexture(m_TexTrans[i]);
		}
	}

	return ++m_ReferCount;
}

u16 DGObject::DecRefer(){
	if(m_ReferCount > 0){
		for(u8 i = 0; i < 8; i++){
			if(m_TexTrans[i] != 0xFFFF){
				m_TexMan->DetachTexture(m_TexTrans[i]);
			}
		}
	
		return --m_ReferCount;
	}else{
		OSReport("Error DGObject::DecRefer  ReferCount<0\n");
		return 0;
	}
}

//nonmatching
//https://decomp.me/scratch/rt3TT
u8 DGObject::LoadNDMPartsBlock(DUDvd& File){
	if (m_PartsBlock != NULL) {
		OSReport("DGObject::LoadNDMPartsBlock >McrFree(m_PartsBlock);\n");
	}

	McrFree(m_PartsBlock);

	m_PartsBlock = (u8*)mAlloc(0x40);

	if (m_PartsBlock == NULL) {
		OSReport("DGObject::LoadNDMPartsBlock >m_PartsBlock==NULL\n");
	}

	File.Read(m_PartsBlock, 0x40, 0);

	u8* ndmObjectBlock = (u8*)mAlloc(0x20);

	if (ndmObjectBlock == NULL) {
		OSReport("DGObject::LoadNDMPartsBlock >ndmObjectBlock==NULL\n");
	}

	File.Read(ndmObjectBlock,0x20,0);

	u16* TexTrans = m_TexTrans; //r4

	memcpy(TexTrans, ndmObjectBlock, 0x10);

	u32* ObjStreamSize = (u32*)(ndmObjectBlock + 0x14); //r29
	u32* DispListSize = (u32*)(ndmObjectBlock + 0x18); //r28


	m_uTexWrap = *(u16*)(ndmObjectBlock + 0x1c);
	m_vTexWrap = *(u16*)(ndmObjectBlock + 0x1e);

	u8* ndmArrayBlock = (u8*)mAlloc(0x20);

	if (ndmArrayBlock == NULL) {
		OSReport("DGObject::LoadNDMPartsBlock >ndmArrayBlock==NULL\n");
	}

	File.Read(ndmArrayBlock,0x20,0);

	GXAttrType ATYPE_TABLE[4] = {
		GX_NONE,
		GX_DIRECT,
		GX_INDEX8,
		GX_INDEX16
	};

	m_VIAT = ATYPE_TABLE[*(ndmArrayBlock + 0x10) >> 4 & 0xc];
	m_NIAT = ATYPE_TABLE[*(ndmArrayBlock + 0x10) >> 2 & 0xc];
	m_CIAT = ATYPE_TABLE[*(ndmArrayBlock + 0x10) & 0xc];
	m_TIAT = ATYPE_TABLE[*(ndmArrayBlock + 0x10) & 3];
	
	SetArrayFormat(*(u16*)(ndmArrayBlock + 8), *(u16*)(ndmArrayBlock + 0xA), *(u16*)(ndmArrayBlock + 0xC), *(u16*)(ndmArrayBlock + 0xE));
	
	if (m_ArrayImg != NULL) {
		mFree(m_ArrayImg);
		m_ArrayImg = NULL;
	}

	m_ArrayImgSize = *(u32*)(ndmArrayBlock + 4);

	if (m_ArrayImgSize != 0) {
		m_ArrayImg = (u8*)mAlloc(m_ArrayImgSize);

		if (m_ArrayImg == NULL) {
			OSReport("DGObject::LoadNDMPartsBlock >m_ArrayImg==NULL\n");
		}

		File.Read(m_ArrayImg, m_ArrayImgSize, 0);
		DCFlushRange(m_ArrayImg, m_ArrayImgSize);
		m_NormalArrayImg = m_ArrayImg + *(u32*)(ndmArrayBlock + 0x14);
		m_ColorArrayImg = m_ArrayImg + *(u32*)(ndmArrayBlock + 0x18);
		m_TexUVArrayImg = m_ArrayImg + *(u32*)(ndmArrayBlock + 0x1c);
	}

	if (m_ObjSteram != NULL) {
		OSReport("DGObject::LoadNDMPartsBlock >McrFree(m_ObjSteram);\n");
	}

	McrFree(m_ObjSteram);

	if (ObjStreamSize != 0) {
		m_ObjSteram = (u8*)mAlloc(*ObjStreamSize);

		if (m_ObjSteram == NULL) {
			OSReport("DGObject::LoadNDMPartsBlock >m_ObjSteram==NULL\n");
		}

		File.Read(m_ObjSteram, *ObjStreamSize, 0);
	}

	if (m_DispList != NULL) {
		OSReport("DGObject::LoadNDMPartsBlock >McrFree(m_DispList);\n");
	}

	McrFree(m_DispList);

	if (*DispListSize != 0) {
		m_DispList = (u8*)mAlloc(*DispListSize);

		if (m_DispList == NULL) {
			OSReport("DGObject::LoadNDMPartsBlock >m_DispList==NULL\n");
		}

		File.Read(m_DispList, *DispListSize, 0);
		DCFlushRange(m_DispList, *DispListSize);
	}

	McrDelete(ndmObjectBlock);
	McrDelete(ndmArrayBlock);

	return true;
}

void DGObject::MakeTexTransTable(u16* GlobalTexTable){
	for(u8 i = 0; i < 8; i++){
		if(m_TexTrans[i] != 0xFFFF){
			m_TexTrans[i] = GlobalTexTable[m_TexTrans[i]];
		}
	}
}

u8* DGObject::GetPartsBlock(){
	return m_PartsBlock;
}

bool DGObject::IsNull(){
	if(m_VIAT == GX_NONE) return true;
	else return false;
}
