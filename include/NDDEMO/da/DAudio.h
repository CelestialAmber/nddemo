#ifndef NDDEMO_AUDIO_H
#define NDDEMO_AUDIO_H

#include "types.h"
#include "dolphin/DVD.h"

class CSong{
public:
	s32 m_SongId; //0x0
	u32 m_SeqId; //0x4
	u8* m_buffer; //0x8
	s32 m_flag; //0xC

	CSong(const CSong&); //unused
	CSong();

	s32 InitBuffer(s32 size); //unused
	void DeleteBuffer();
	s32 ReadBuffer(s32 songId, char* filename);
	s32 PlaySong(u16 songGroupId);
	void DelayDeleteBuffer();
	s32 GetSongValid();
};

typedef struct _SND_REVHI_DELAYLINE{
	s32 inPoint; //0x0
	s32 outPoint; //0x4
	s32 length; //0x8
	float* inputs; //0xC
	float lastOutput; //0x10
} SND_REVHI_DELAYLINE;

struct _SND_REVHI_WORK{
	SND_REVHI_DELAYLINE AP[9]; //0x0
	SND_REVHI_DELAYLINE C[9]; //0xB4
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

typedef struct _SND_CHORUS_SRCINFO{
	s32* dest; //0x0
	s32* smpBase; //0x4
	s32* old; //0x8
	u32 posLo; //0xC
	u32 posHi; //0x10
	u32 pitchLo; //0x14
	u32 pitchHi; //0x18
	u32 trigger; //0x1C
	u32 target; //0x20
} SND_CHORUS_SRCINFO;

typedef struct _SND_CHORUS_WORK{
	s32* lastLeft[3]; //0x0
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
	SND_CHORUS_SRCINFO src; //0x6C
} SND_CHORUS_WORK;

struct SND_AUX_CHORUS{
	SND_CHORUS_WORK work; //0x0
	u32 baseDelay; //0x90
	u32 variation; //0x94
	u32 period; //0x98
};


class DAudio{
private:
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
	u8 unk21[3]; //padding
	SND_AUX_REVERBHI revH; //0x24
	SND_AUX_CHORUS cho; //0x204

public:
	s32 m_autoDemoFlag; //0x2A0


	DAudio(const DAudio&);
	DAudio();
	~DAudio();

	s32 Initialize();
	s32 ReadMusyXData(u8** buffer, char* filename);
	s32 ReadPoolData(char* filename);
	s32 ReadProjData(char* filename);
	s32 ReadSdirData(char* filename);
	s32 ReadSampData(char* filename);
	s32 PushGroupData(u16 gid);
	void FreeSampBuffer();
	s32 InitSongBuffer();
	s32 ReadDataAll(DVDFileInfo* fInfo, void* buffer);
	s32 PlaySongFadeOut();
	s32 PlaySong(CSong* song);
	void Coin();
	void DoorOpen();
	void DoorKnock();
	void Jump();
	void Fall();

    //fabricated param name
	void SetSongGroupId(u16 gid){
        m_songGroupId = gid;
    }

	void SetAutoDemo(s32 flag);
	void MuteAll(s32 flag);
	s32 SongStop();
	void Manager();

	void SetMuteSequence(s32 flag);
	void SetMuteSe(s32 flag);

	s32 GetMuteSequence(){
		return m_sequenceMute;
	}

	s32 GetMuteSe(){
		return m_seMute;
	}
	
	void ResetFade();
	void Quit();
	void* ReadDataAlloc(char* filename);
};

extern DAudio audio;

#endif
