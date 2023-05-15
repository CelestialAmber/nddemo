#include "dolphin/OS.h"
#include "dolphin/DVD.h"
#include "dolphin/VI.h"
#include "dolphin/PAD.h"
#include "NDDEMO/dm/DMainSystem.h"
#include "NDDEMO/da/DAudio.h"
#include "NDDEMO/du/DUMacro.h"

//These three variables might belong to DMainSystem.cpp
DMainSystem* dm;
BOOL autoDemoFlag;
bool v_flag;

DAudio audio;
OSThread dmThread;
u8 dmThreadStack[0x8000];

extern "C" void main();
void iMakeMainHeap();
static void* idmThread(void*);


//int largeHeap(){}
//int smallHeap(){}

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

//param name missing in dwarf
static void* idmThread(void* arg0) {
    dm->MainLoop();
    
    if (dm != nullptr) {
        delete dm;
        dm = nullptr;
    }

    return nullptr;
}


void iMakeMainHeap() {
    void* arenaHi;
    void* arenaLo;

    arenaLo = (void*)OSRoundUp32B(OSGetArenaLo());
    arenaHi = OSGetArenaHi();
    OSSetArenaLo(arenaLo);

    arenaLo = OSGetArenaLo();
    arenaHi = OSGetArenaHi();
    
    arenaLo = OSInitAlloc(arenaLo, arenaHi, 1);
    OSSetArenaLo(arenaLo);
    
    arenaLo = (void*)OSRoundUp32B(arenaLo);
    arenaHi = (void*)OSRoundDown32B(arenaHi);
    
    OSSetCurrentHeap(OSCreateHeap(arenaLo, arenaHi));
    OSReport("iMakeMainHeap>start=%x / end=%x\n", arenaLo, arenaHi);
    OSSetArenaLo(arenaHi);
}
