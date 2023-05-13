#pragma once

#include "types"

struct _SND_REVHI_DELAYLINE{
    s32 inPoint; //0x0
    s32 outPoint; //0x4
    s32 length; //0x8
    float* inputs; //0xC
    float lastOutput; //0x10
};

struct _SND_REVHI_WORK{
    _SND_REVHI_DELAYLINE AP[9]; //0x0
    _SND_REVHI_DELAYLINE C[9]; //0xB4
    float allPassCoeff; //0x168
    float combCoef[9]; //0x16C
    float lpLastout[3]; //0x190
    float level; //0x19C
    float damping; //0x1A0
    float preDelayTime; //0x1A4
    float crosstalk; //0x1A8
    float* preDelayLine[3]; //0x1AC
    float* preDelayPtr[3]; //0x1B8
};

struct SND_AUX_REVERBHI{
    _SND_REVHI_WORK rv; //0x0
    u8 tempDisableFX; //0x1C4
    u8 unk1C5[3]; //filler?
    float coloration; //0x1C8
    float mix; //0x1CC
    float time; //0x1D0
    float damping; //0x1D4
    float preDelay; //0x1D8
    float crosstalk; //0x1DC
};

struct _SND_CHORUS_SRCINFO{
    s32* dest; //0x0
    s32* smpBase; //0x4
    s32* old; //0x8
    u32 posLo; //0xC
    u32 posHi; //0x10
    u32 pitchLo; //0x14
    u32 pitchHi; //0x18
    u32 trigger; //0x1C
    u32 target; //0x20
};

struct _SND_CHORUS_WORK{
    s32* lastLeft[3] //0x0
    s32* lastRight[3]; //0xC
    s32* lastSur[3]; //0x18
    u8 currentLast; //0x24
    u8 unk25[3]; //filler?
    s32 oldLeft[4]; //0x28
    s32 oldRight[4]; //0x38
    s32 oldSur[4]; //0x48
    u32 currentPosLo; //0x58
    u32 currentPosHi; //0x5C
    s32 pitchOffset; //0x60
    u32 pitchOffsetPeriodCount; //0x64
    u32 pitchOffsetPeriod; //0x68
    _SND_CHORUS_SRCINFO src; //0x6C
};

struct SND_AUX_CHORUS{
    u8 work[0x90]; //0x0
    u32 baseDelay; //0x90
    u32 variation; //0x94
    u32 period; //0x98
};

class CSong{
public:
    s32 m_SongId;
    u32 m_SeqId;
    u8* m_buffer;
    s32 m_flag;
};

class DAudio{
public:
    u32 m_aramMemArray[2]; //0x0
    u8* m_poolBuffer; //0x8
    u8* m_projBuffer; //0xC
    u8* m_sampBuffer; //0x10
    u8* m_sdirBuffer; //0x14
    CSong* m_curSong; //0x18
    u16 m_songGroupId; //0x1C
    s8 m_sequenceMute; //0x1E
    s8 m_seMute; //0x1F
    s8 m_muteAll; //0x20
    u8 unk21[3]; //filler?
    SND_AUX_REVERBHI revH; //0x24
    SND_AUX_CHORUS cho; //0x204
    s32 m_autoDemoFlag; //0x2A0
};
