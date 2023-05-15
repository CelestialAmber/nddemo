#include "dolphin/OS.h"
#include "dolphin/DVD.h"
#include "dolphin/VI.h"
#include "dolphin/PAD.h"
#include "NDDEMO/main/main.h"

//These three variables might belong to DMainSystem.cpp
DMainSystem* dm;
BOOL autoDemoFlag;
bool v_flag;

DAudio audio;
OSThread dmThread;
u8 dmThreadStack[0x8000];


extern "C" void main();

void iMakeMainHeap() {
    void* arenaHi;
    void* arenaLo;

    arenaLo = (void*)(((u32)OSGetArenaLo() + 0x1F) & 0xFFFFFFE0);
    arenaHi = OSGetArenaHi();
    OSSetArenaLo(arenaLo);

    arenaLo = OSGetArenaLo();
    arenaHi = OSGetArenaHi();
    
    arenaLo = OSInitAlloc(arenaLo, arenaHi, 1);
    OSSetArenaLo(arenaLo);
    
    arenaLo = (void*)(((u32)arenaLo + 0x1F) & 0xFFFFFFE0);
    arenaHi = (void*)((u32)arenaHi & 0xFFFFFFE0);
    
    OSSetCurrentHeap(OSCreateHeap(arenaLo, arenaHi));
    OSReport("iMakeMainHeap>start=%x / end=%x\n", arenaLo, arenaHi);
    OSSetArenaLo(arenaHi);
}

//param name missing in dwarf
static void* idmThread(void* arg0) {
    dm->MainLoop();
    
    if (dm != nullptr) {
        delete dm;
        dm = nullptr;
    }

    return nullptr;
}


void main() {
    //Initialize OS
    OSInit();

    iMakeMainHeap();

	//Initialize other SDK libs
    DVDInit();
    VIInit();
    PADInit();

    //Initialize the audio manager
    audio.Initialize();
    audio.ReadPoolData("audio/nddemo.pol");
    audio.ReadProjData("audio/nddemo.prj");
    audio.ReadSdirData("audio/nddemo.sdr");
    audio.ReadSampData("audio/nddemo.smp"); 
    OSReport("Read Audio data\n");
    audio.PushGroupData(0);
    audio.PushGroupData(1); 
    audio.SetSongGroupId(0);
    audio.FreeSampBuffer();

    dm = new DMainSystem;
    dm->iSystemInitProc();

    //Create and start the main thread
    OSCreateThread(&dmThread, idmThread, nullptr, dmThreadStack + 0x8000, 0x8000, 0x11, 1);
    OSResumeThread(&dmThread);

    //Loop forever 
    while(TRUE){
        VIWaitForRetrace();
        v_flag = true;
        
        if (!OSIsThreadSuspended(&dmThread)) {
            continue;
        }

        //Resume the main thread if it was suspended.
        OSResumeThread(&dmThread);
    }
}

