#ifndef DOLPHIN_GX_TYPES_H
#define DOLPHIN_GX_TYPES_H
#include "types.h"
#ifdef __cplusplus
extern "C" {
#endif

/**
 * Pack value into bitfield.
 * Value is shifted to the specified bit position.
 */
#define GX_BITSET(field, pos, size, value)                                     \
	__rlwimi((field), (value), 31 - (pos) - (size) + 1, (pos), (pos) + (size)-1)

/**
 * Pack value into bitfield.
 * Value is not shifted, only masked.
 */
#define GX_BITSET_TRUNC(field, mb, size, value)                                \
	__rlwimi((field), (value), 0, (mb), (mb) + (size)-1)

/**
 * Common types used throughout many GX files.
 * To avoid circular depencies, common structures and all enums have been moved
 * here. Everything is organized in alphabetical order.
 */

//! TODO: Many GX functions use 8-bit booleans.
//! As those files are decompiled, update prototypes that use u8 -> GXBool8,
//! so it is evident to callers that the 8-bit value is meant to be TRUE/FALSE
typedef unsigned char GXBool;

/**
 * Common structs
 */

typedef struct _GXColor {
	u8 r, g, b, a;
} GXColor;

typedef struct _GXColorS10 {
	s16 r, g, b, a;
} GXColorS10;

/**
 * Common enums
 */

typedef enum _GXAlphaOp {
	GX_AOP_AND,
	GX_AOP_OR,
	GX_AOP_XOR,
	GX_AOP_XNOR,

	GX_MAX_ALPHAOP
} GXAlphaOp;

typedef enum _GXAlphaReadMode{
	GX_READ_00,
	GX_READ_FF,
	GX_READ_NONE
} GXAlphaReadMode;

typedef enum _GXAnisotropy {
	GX_ANISO_1,
	GX_ANISO_2,
	GX_ANISO_4,

	GX_MAX_ANISOTROPY
} GXAnisotropy;

typedef enum _GXAttnFn {
	GX_AF_SPEC,
	GX_AF_SPOT,
	GX_AF_NONE,
} GXAttnFn;

typedef enum _GXAttr {
	GX_VA_PNMTXIDX,
	GX_VA_TEX0MTXIDX,
	GX_VA_TEX1MTXIDX,
	GX_VA_TEX2MTXIDX,
	GX_VA_TEX3MTXIDX,
	GX_VA_TEX4MTXIDX,
	GX_VA_TEX5MTXIDX,
	GX_VA_TEX6MTXIDX,
	GX_VA_TEX7MTXIDX,
	GX_VA_POS,
	GX_VA_NRM,
	GX_VA_CLR0,
	GX_VA_CLR1,
	GX_VA_TEX0,
	GX_VA_TEX1,
	GX_VA_TEX2,
	GX_VA_TEX3,
	GX_VA_TEX4,
	GX_VA_TEX5,
	GX_VA_TEX6,
	GX_VA_TEX7,
	GX_POS_MTX_ARRAY,
	GX_NRM_MTX_ARRAY,
	GX_TEX_MTX_ARRAY,
	GX_LIGHT_ARRAY,
	GX_VA_NBT,

	GX_VA_MAX_ATTR,
	GX_VA_NULL = 255
} GXAttr;

typedef enum _GXAttrType{
	GX_NONE,
	GX_DIRECT,
	GX_INDEX8,
	GX_INDEX16
} GXAttrType;

typedef enum _GXBlendFactor {
	GX_BL_ZERO,
	GX_BL_ONE,
	GX_BL_SRCCLR,
	GX_BL_INVSRCCLR,
	GX_BL_SRCALPHA,
	GX_BL_INVSRCALPHA,
	GX_BL_DSTALPHA,
	GX_BL_INVDSTALPHA,

	GX_BL_DSTCLR = GX_BL_SRCCLR,
	GX_BL_INVDSTCLR = GX_BL_INVSRCCLR
} GXBlendFactor;

typedef enum _GXBlendMode {
	GX_BM_NONE,
	GX_BM_BLEND,
	GX_BM_LOGIC,
	GX_BM_SUBTRACT,

	GX_MAX_BLENDMODE
} GXBlendMode;

typedef enum _GXChannelID {
	GX_COLOR0,
	GX_COLOR1,
	GX_ALPHA0,
	GX_ALPHA1,
	GX_COLOR0A0,
	GX_COLOR1A1,
	GX_COLOR_ZERO,
	GX_ALPHA_BUMP,
	GX_ALPHA_BUMPN,

	GX_COLOR_NULL = 255
} GXChannelID;

typedef enum _GXCITexFmt{
	GX_TF_C4 = 8,
	GX_TF_C8,
	GX_TF_C14X2
} GXCITexFmt;

typedef enum _GXClipMode {
	// "ClipDisable" in XF mem, so 0 = enable
	GX_CLIP_ENABLE,
	GX_CLIP_DISABLE,
} GXClipMode;

typedef enum _GXColorSrc {
	GX_SRC_REG,
	GX_SRC_VTX
} GXColorSrc;

typedef enum _GXCompare {
	GX_NEVER,
	GX_LESS,
	GX_EQUAL,
	GX_LEQUAL,
	GX_GREATER,
	GX_NEQUAL,
	GX_GEQUAL,
	GX_ALWAYS
} GXCompare;

typedef enum _GXCompCnt{
	GX_POS_XY = 0,
	GX_POS_XYZ,

	GX_NRM_XYZ = 0,
	GX_NRM_NBT,
	GX_NRM_NBT3,

	GX_CLR_RGB = 0,
	GX_CLR_RGBA,

	GX_TEX_S = 0,
	GX_TEX_ST
} GXCompCnt;

typedef enum _GXCompType{
	GX_U8 = 0,
	GX_S8,
	GX_U16,
	GX_S16,
	GX_F32,

	GX_RGB565 = 0,
	GX_RGB8,
	GX_RGBX8,
	GX_RGBA4,
	GX_RGBA6,
	GX_RGBA8
} GXCompType;

typedef enum _GXCopyMode{
	GX_COPY_PROGRESSIVE = 0,
	GX_COPY_INTLC_EVEN = 2,
	GX_COPY_INTLC_ODD = 3
} GXCopyMode;

typedef enum _GXCullMode {
	GX_CULL_NONE,
	GX_CULL_FRONT,
	GX_CULL_BACK,
	GX_CULL_ALL
} GXCullMode;

typedef enum _GXDiffuseFn {
	GX_DF_NONE,
	GX_DF_SIGN,
	GX_DF_CLAMP
} GXDiffuseFn;

typedef enum _GXDistAttnFn {
	GX_DA_OFF,
	GX_DA_GENTLE,
	GX_DA_MEDIUM,
	GX_DA_STEEP
} GXDistAttnFn;

typedef enum _GXFBClamp{
	GX_CLAMP_NONE,
	GX_CLAMP_TOP,
	GX_CLAMP_BOTTOM
} GXFBClamp;

typedef enum _GXFogType{
	GX_FOG_NONE,

	GX_FOG_LIN = 2,
	GX_FOG_EXP = 4,
	GX_FOG_EXP2 = 5,
	GX_FOG_REVEXP = 6,
	GX_FOG_REVEXP2 = 7,
} GXFogType;

typedef enum _GXGamma{
	GX_GM_1_0,
	GX_GM_1_7,
	GX_GM_2_2
} GXGamma;

typedef enum _GXIndTexAlphaSel {
	GX_ITBA_OFF,
	GX_ITBA_S,
	GX_ITBA_T,
	GX_ITBA_U,

	GX_MAX_ITBALPHA
} GXIndTexAlphaSel;

typedef enum _GXIndTexBiasSel {
	GX_ITB_NONE,
	GX_ITB_S,
	GX_ITB_T,
	GX_ITB_ST,
	GX_ITB_U,
	GX_ITB_SU,
	GX_ITB_TU,
	GX_ITB_STU,

	GX_MAX_ITBIAS
} GXIndTexBiasSel;

typedef enum _GXIndTexFormat {
	GX_ITF_8,
	GX_ITF_5,
	GX_ITF_4,
	GX_ITF_3,

	GX_MAX_ITFORMAT
} GXIndTexFormat;

typedef enum _GXIndTexMtxID {
	GX_ITM_OFF,
	GX_ITM_0,
	GX_ITM_1,
	GX_ITM_2,

	GX_ITM_S0 = 5,
	GX_ITM_S1,
	GX_ITM_S2,

	GX_ITM_T0 = 9,
	GX_ITM_T1,
	GX_ITM_T2,
} GXIndTexMtxID;

typedef enum _GXIndTexScale {
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
} GXIndTexScale;

typedef enum _GXIndTexStageID {
	GX_INDTEXSTAGE0,
	GX_INDTEXSTAGE1,
	GX_INDTEXSTAGE2,
	GX_INDTEXSTAGE3,

	GX_MAX_INDTEXSTAGE
} GXIndTexStageID;

typedef enum _GXIndTexWrap {
	GX_ITW_OFF,
	GX_ITW_256,
	GX_ITW_128,
	GX_ITW_64,
	GX_ITW_32,
	GX_ITW_16,
	GX_ITW_0,

	GX_MAX_ITWRAP,
} GXIndTexWrap;

typedef enum _GXLightID {
	GX_LIGHT0 = 1,
	GX_LIGHT1 = 2,
	GX_LIGHT2 = 4,
	GX_LIGHT3 = 8,
	GX_LIGHT4 = 16,
	GX_LIGHT5 = 32,
	GX_LIGHT6 = 64,
	GX_LIGHT7 = 128,

	GX_MAX_LIGHT = 256,
	GX_LIGHT_NULL = 0
} GXLightID;


typedef enum _GXLogicOp {
	GX_LO_CLEAR,
	GX_LO_AND,
	GX_LO_REVAND,
	GX_LO_COPY,
	GX_LO_INVAND,
	GX_LO_NOOP,
	GX_LO_XOR,
	GX_LO_OR,
	GX_LO_NOR,
	GX_LO_EQUIV,
	GX_LO_INV,
	GX_LO_REVOR,
	GX_LO_INVCOPY,
	GX_LO_INVOR,
	GX_LO_NAND,
	GX_LO_SET
} GXLogicOp;

typedef enum _GXMiscToken{
	GX_MT_XF_FLUSH = 1,
	GX_MT_DL_SAVE_CONTEXT = 2,
	
	GX_MT_NULL = 0
} GXMiscToken;

typedef enum _GXPerf0{
	GX_PERF0_VERTICES,
	GX_PERF0_CLIP_VTX,
	GX_PERF0_CLIP_CLKS,
	GX_PERF0_XF_WAIT_IN,
	GX_PERF0_XF_WAIT_OUT,
	GX_PERF0_XF_XFRM_CLKS,
	GX_PERF0_XF_LIT_CLKS,
	GX_PERF0_XF_BOT_CLKS,
	GX_PERF0_XF_REGLD_CLKS,
	GX_PERF0_XF_REGRD_CLKS,
	GX_PERF0_CLIP_RATIO,
	GX_PERF0_TRIANGLES,
	GX_PERF0_TRIANGLES_CULLED,
	GX_PERF0_TRIANGLES_PASSED,
	GX_PERF0_TRIANGLES_SCISSORED,
	GX_PERF0_TRIANGLES_0TEX,
	GX_PERF0_TRIANGLES_1TEX,
	GX_PERF0_TRIANGLES_2TEX,
	GX_PERF0_TRIANGLES_3TEX,
	GX_PERF0_TRIANGLES_4TEX,
	GX_PERF0_TRIANGLES_5TEX,
	GX_PERF0_TRIANGLES_6TEX,
	GX_PERF0_TRIANGLES_7TEX,
	GX_PERF0_TRIANGLES_8TEX,
	GX_PERF0_TRIANGLES_0CLR,
	GX_PERF0_TRIANGLES_1CLR,
	GX_PERF0_TRIANGLES_2CLR,
	GX_PERF0_QUAD_0CVG,
	GX_PERF0_QUAD_NON0CVG,
	GX_PERF0_QUAD_1CVG,
	GX_PERF0_QUAD_2CVG,
	GX_PERF0_QUAD_3CVG,
	GX_PERF0_QUAD_4CVG,
	GX_PERF0_AVG_QUAD_CNT,
	GX_PERF0_CLOCKS,
	GX_PERF0_NONE
} GXPerf0;

typedef enum _GXPerf1{
	GX_PERF1_TEXELS,
	GX_PERF1_TX_IDLE,
	GX_PERF1_TX_REGS,
	GX_PERF1_TX_MEMSTALL,
	GX_PERF1_TC_CHECK1_2,
	GX_PERF1_TC_CHECK3_4,
	GX_PERF1_TC_CHECK5_6,
	GX_PERF1_TC_CHECK7_8,
	GX_PERF1_TC_MISS,
	GX_PERF1_VC_ELEMQ_FULL,
	GX_PERF1_VC_MISSQ_FULL,
	GX_PERF1_VC_MEMREQ_FULL,
	GX_PERF1_VC_STATUS7,
	GX_PERF1_VC_MISSREP_FULL,
	GX_PERF1_VC_STREAMBUF_LOW,
	GX_PERF1_VC_ALL_STALLS,
	GX_PERF1_VERTICES,
	GX_PERF1_FIFO_REQ,
	GX_PERF1_CALL_REQ,
	GX_PERF1_VC_MISS_REQ,
	GX_PERF1_CP_ALL_REQ,
	GX_PERF1_CLOCKS,
	GX_PERF1_NONE
} GXPerf1;

typedef enum _GXPixelFmt{
	GX_PF_RGB8_Z24,
	GX_PF_RGBA6_Z24,
	GX_PF_RGB565_Z16,
	GX_PF_Z24,
	GX_PF_Y8,
	GX_PF_U8,
	GX_PF_V8,
	GX_PF_YUV420
} GXPixelFmt;

typedef enum _GXPrimitive {
	GX_POINTS = 0xB8,
	GX_LINES = 0xA8,
	GX_LINESTRIP = 0xB0,
	GX_TRIANGLES = 0x90,
	GX_TRIANGLESTRIP = 0x98,
	GX_TRIANGLEFAN = 0xA0,
	GX_QUADS = 0x80,
} GXPrimitive;

typedef enum _GXProjectionType {
	GX_PERSPECTIVE,
	GX_ORTHOGRAPHIC
} GXProjectionType;


typedef enum _GXSpotFn {
	GX_SP_OFF,
	GX_SP_FLAT,
	GX_SP_COS,
	GX_SP_COS2,
	GX_SP_SHARP,
	GX_SP_RING1,
	GX_SP_RING2
} GXSpotFn;

typedef enum _GXTevAlphaArg {
	GX_CA_APREV,
	GX_CA_A0,
	GX_CA_A1,
	GX_CA_A2,
	GX_CA_TEXA,
	GX_CA_RASA,
	GX_CA_KONST,
	GX_CA_ZERO,
	GX_CA_ONE
} GXTevAlphaArg;


typedef enum _GXTevBias {
	GX_TB_ZERO,
	GX_TB_ADDHALF,
	GX_TB_SUBHALF,

	GX_MAX_TEVBIAS
} GXTevBias;

typedef enum _GXTevColorArg {
	GX_CC_CPREV,
	GX_CC_APREV,
	GX_CC_C0,
	GX_CC_A0,
	GX_CC_C1,
	GX_CC_A1,
	GX_CC_C2,
	GX_CC_A2,
	GX_CC_TEXC,
	GX_CC_TEXA,
	GX_CC_RASC,
	GX_CC_RASA,
	GX_CC_ONE,
	GX_CC_HALF,
	GX_CC_KONST,
	GX_CC_ZERO,
	GX_CC_TEXRRR,
	GX_CC_TEXGGG,
	GX_CC_TEXBBB,

	GX_CC_QUARTER = GX_CC_KONST
} GXTevColorArg;

typedef enum _GXTevColorChan {
	GX_CH_RED,
	GX_CH_GREEN,
	GX_CH_BLUE,
	GX_CH_ALPHA
} GXTevColorChan;

typedef enum _GXTevKAlphaSel {
	GX_TEV_KASEL_1,
	GX_TEV_KASEL_7_8,
	GX_TEV_KASEL_3_4,
	GX_TEV_KASEL_5_8,
	GX_TEV_KASEL_1_2,
	GX_TEV_KASEL_3_8,
	GX_TEV_KASEL_1_4,
	GX_TEV_KASEL_1_8,

	GX_TEV_KASEL_K0_R = 16,
	GX_TEV_KASEL_K1_R,
	GX_TEV_KASEL_K2_R,
	GX_TEV_KASEL_K3_R,
	GX_TEV_KASEL_K0_G,
	GX_TEV_KASEL_K1_G,
	GX_TEV_KASEL_K2_G,
	GX_TEV_KASEL_K3_G,
	GX_TEV_KASEL_K0_B,
	GX_TEV_KASEL_K1_B,
	GX_TEV_KASEL_K2_B,
	GX_TEV_KASEL_K3_B,
	GX_TEV_KASEL_K0_A,
	GX_TEV_KASEL_K1_A,
	GX_TEV_KASEL_K2_A,
	GX_TEV_KASEL_K3_A
} GXTevKAlphaSel;

typedef enum _GXTevKColorID {
	GX_KCOLOR0,
	GX_KCOLOR1,
	GX_KCOLOR2,
	GX_KCOLOR3,

	GX_MAX_KCOLOR
} GXTevKColorID;

typedef enum _GXTevKColorSel {
	GX_TEV_KCSEL_1,
	GX_TEV_KCSEL_7_8,
	GX_TEV_KCSEL_3_4,
	GX_TEV_KCSEL_5_8,
	GX_TEV_KCSEL_1_2,
	GX_TEV_KCSEL_3_8,
	GX_TEV_KCSEL_1_4,
	GX_TEV_KCSEL_1_8,

	GX_TEV_KCSEL_K0 = 12,
	GX_TEV_KCSEL_K1,
	GX_TEV_KCSEL_K2,
	GX_TEV_KCSEL_K3,
	GX_TEV_KCSEL_K0_R,
	GX_TEV_KCSEL_K1_R,
	GX_TEV_KCSEL_K2_R,
	GX_TEV_KCSEL_K3_R,
	GX_TEV_KCSEL_K0_G,
	GX_TEV_KCSEL_K1_G,
	GX_TEV_KCSEL_K2_G,
	GX_TEV_KCSEL_K3_G,
	GX_TEV_KCSEL_K0_B,
	GX_TEV_KCSEL_K1_B,
	GX_TEV_KCSEL_K2_B,
	GX_TEV_KCSEL_K3_B,
	GX_TEV_KCSEL_K0_A,
	GX_TEV_KCSEL_K1_A,
	GX_TEV_KCSEL_K2_A,
	GX_TEV_KCSEL_K3_A
} GXTevKColorSel;

typedef enum _GXTevMode{
	GX_MODULATE,
	GX_DECAL,
	GX_BLEND,
	GX_REPLACE,
	GX_PASSCLR
} GXTevMode;

typedef enum _GXTevOp {
	GX_TEV_ADD,
	GX_TEV_SUB,

	GX_TEV_COMP_R8_GT = 8,
	GX_TEV_COMP_R8_EQ,
	GX_TEV_COMP_GR16_GT,
	GX_TEV_COMP_GR16_EQ,
	GX_TEV_COMP_BGR24_GT,
	GX_TEV_COMP_BGR24_EQ,
	GX_TEV_COMP_RGB8_GT,
	GX_TEV_COMP_RGB8_EQ,

	GX_TEV_COMP_A8_GT = GX_TEV_COMP_RGB8_GT,
	GX_TEV_COMP_A8_EQ = GX_TEV_COMP_RGB8_EQ
} GXTevOp;

typedef enum _GXTevRegID {
	GX_TEVPREV,
	GX_TEVREG0,
	GX_TEVREG1,
	GX_TEVREG2,

	GX_MAX_TEVREG
} GXTevRegID;

typedef enum _GXTevScale {
	GX_CS_SCALE_1,
	GX_CS_SCALE_2,
	GX_CS_SCALE_4,
	GX_CS_DIVIDE_2,

	GX_MAX_TEVSCALE
} GXTevScale;

typedef enum _GXTevStageID {
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

	GX_MAX_TEVSTAGE
} GXTevStageID;


typedef enum _GXTevSwapSel {
	GX_TEV_SWAP0,
	GX_TEV_SWAP1,
	GX_TEV_SWAP2,
	GX_TEV_SWAP3,

	GX_MAX_TEVSWAP
} GXTevSwapSel;

typedef enum _GXTexCacheSize{
	GX_TEXCACHE_32K,
	GX_TEXCACHE_128K,
	GX_TEXCACHE_512K,
	GX_TEXCACHE_NONE
} GXTexCacheSize;

typedef enum _GXTexCoordID {
	GX_TEXCOORD0,
	GX_TEXCOORD1,
	GX_TEXCOORD2,
	GX_TEXCOORD3,
	GX_TEXCOORD4,
	GX_TEXCOORD5,
	GX_TEXCOORD6,
	GX_TEXCOORD7,

	GX_MAX_TEXCOORD,
	GX_TEXCOORD_NULL = 255
} GXTexCoordID;

typedef enum _GXTexFilter {
	GX_NEAR,
	GX_LINEAR,
	GX_NEAR_MIP_NEAR,
	GX_LIN_MIP_NEAR,
	GX_NEAR_MIP_LIN,
	GX_LIN_MIP_LIN,
} GXTexFilter;

typedef enum _GXTexFmt {
	GX_TF_I4,
	GX_TF_I8,
	GX_TF_IA4,
	GX_TF_IA8,
	GX_TF_RGB565,
	GX_TF_RGB5A3,
	GX_TF_RGBA8,
	GX_TF_CMPR = 14,

	GX_CTF_R4 = 32,
	GX_CTF_RA4 = 34,
	GX_CTF_RA8 = 35,
	GX_CTF_YUVA8 = 38,
	GX_CTF_A8 = 39,
	GX_CTF_R8 = 40,
	GX_CTF_G8 = 41,
	GX_CTF_B8 = 42,
	GX_CTF_RG8 = 43,
	GX_CTF_GB8 = 44,

	GX_TF_Z8 = 17,
	GX_TF_Z16 = 19,
	GX_TF_Z24X8 = 22,

	GX_CTF_Z4 = 48,
	GX_CTF_Z8M = 57,
	GX_CTF_Z8L = 58,
	GX_CTF_Z16L = 60,

	GX_TF_A8 = GX_CTF_A8
} GXTexFmt;

typedef enum _GXTexGenSrc {
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
	GX_TG_COLOR1,
} GXTexGenSrc;


typedef enum _GXTexGenType {
	GX_TG_MTX3x4,
	GX_TG_MTX2x4,
	GX_TG_BUMP0,
	GX_TG_BUMP1,
	GX_TG_BUMP2,
	GX_TG_BUMP3,
	GX_TG_BUMP4,
	GX_TG_BUMP5,
	GX_TG_BUMP6,
	GX_TG_BUMP7,
	GX_TG_SRTG
} GXTexGenType;

typedef enum _GXTexMapID {
	GX_TEXMAP0,
	GX_TEXMAP1,
	GX_TEXMAP2,
	GX_TEXMAP3,
	GX_TEXMAP4,
	GX_TEXMAP5,
	GX_TEXMAP6,
	GX_TEXMAP7,
	GX_MAX_TEXMAP,

	GX_TEXMAP_NULL = 255,
	GX_TEX_DISABLE
} GXTexMapID;

typedef enum _GXTexMtx {
	// Any dimension (in standard XF matrix memory)
	GX_TEXMTX0 = 30,
	GX_TEXMTX1 = 33,
	GX_TEXMTX2 = 36,
	GX_TEXMTX3 = 39,
	GX_TEXMTX4 = 42,
	GX_TEXMTX5 = 45,
	GX_TEXMTX6 = 48,
	GX_TEXMTX7 = 51,
	GX_TEXMTX8 = 54,
	GX_TEXMTX9 = 57,
	GX_IDENTITY = 60
} GXTexMtx;

typedef enum _GXTexMtxType{
	GX_MTX3x4,
	GX_MTX2x4,
} GXTexMtxType;

typedef enum _GXTexWrapMode {
	GX_CLAMP,
	GX_REPEAT,
	GX_MIRROR,

	GX_MAX_TEXWRAPMODE
} GXTexWrapMode;

typedef enum _GXTlutFmt {
	GX_TL_IA8,
	GX_TL_RGB565,
	GX_TL_RGB5A3,

	GX_MAX_TLUTFMT
} GXTlutFmt;

typedef enum _GXTlutSize{
	GX_TLUT_16 = 1,
	GX_TLUT_32 = 2,
	GX_TLUT_64 = 4,
	GX_TLUT_128 = 8,
	GX_TLUT_256 = 16,
	GX_TLUT_512 = 32,
	GX_TLUT_1K = 64,
	GX_TLUT_2K = 128,
	GX_TLUT_4K = 256,
	GX_TLUT_8K = 512,
	GX_TLUT_16K = 1024,
} GXTlutSize;

typedef enum _GXVCachePerf{
	GX_VC_POS,
	GX_VC_NRM,
	GX_VC_CLR0,
	GX_VC_CLR1,
	GX_VC_TEX0,
	GX_VC_TEX1,
	GX_VC_TEX2,
	GX_VC_TEX3,
	GX_VC_TEX4,
	GX_VC_TEX5,
	GX_VC_TEX6,
	GX_VC_TEX7,
	GX_VC_ALL = 15
} GXVCachePerf;

typedef enum _GXVtxFmt{
	GX_VTXFMT0,
	GX_VTXFMT1,
	GX_VTXFMT2,
	GX_VTXFMT3,
	GX_VTXFMT4,
	GX_VTXFMT5,
	GX_VTXFMT6,
	GX_VTXFMT7,
	GX_MAX_VTXFMT
} GXVtxFmt;

typedef enum _GXZFmt16{
	GX_ZC_LINEAR,
	GX_ZC_NEAR,
	GX_ZC_MID,
	GX_ZC_FAR
} GXZFmt16;

typedef enum _GXZTexOp{
	GX_ZT_DISABLE,
	GX_ZT_ADD,
	GX_ZT_REPLACE,

	GX_MAX_ZTEXOP
} GXZTexOp;

#ifdef __cplusplus
}
#endif
#endif