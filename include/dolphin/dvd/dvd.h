#ifndef DOLPHIN_DVD_H
#define DOLPHIN_DVD_H

#include "types.h"

#ifdef __cplusplus
extern "C" {
#endif // ifdef __cplusplus

typedef struct DVDCommandBlock DVDCommandBlock;
typedef struct DVDFileInfo DVDFileInfo;

typedef void (*DVDCallback)(s32 result, DVDFileInfo* fileInfo);
typedef void (*DVDCBCallback)(s32 result, DVDCommandBlock* block);
typedef void (*DVDLowCallback)(u32 intType);
typedef void (*DVDDoneReadCallback)(s32, DVDFileInfo*);
typedef void (*DVDOptionalCommandChecker)(DVDCommandBlock* block, DVDLowCallback callback);

typedef void (*DVDAsyncCallback)(s32, struct DVDFileInfo*);
typedef void (*DVDCBAsyncCallback)(s32, struct DVDCommandBlock*);

typedef struct DVDDriveInfo {
	u16 revisionLevel;
	u16 deviceCode;
	u32 releaseDate;
	u8 padding[24];
} DVDDriveInfo;

typedef struct DVDDiskID {
  char gameName[4];
  char company[2];
  u8 diskNumber;
  u8 gameVersion;
  u8 streaming;
  u8 streamingBufSize;
  u8 padding[22];
} DVDDiskID;

typedef struct DVDCommandBlock {
  DVDCommandBlock* next;
  DVDCommandBlock* prev;
  u32 command;
  s32 state;
  u32 offset;
  u32 length;
  void* addr;
  u32 currTransferSize;
  u32 transferredSize;
  DVDDiskID* id;
  DVDCBCallback callback;
  void* userData;
} DVDCommandBlock;

typedef struct DVDFileInfo{
    DVDCommandBlock cb;
    u32 startAddr;
    u32 length;
    DVDCallback callback;
} DVDFileInfo;

// Struct for directory information (size 0xC).
typedef struct DVDDir {
	u32 entryNum; // _00
	u32 location; // _04
	u32 next;     // _08
} DVDDir;

// Struct for directory entries (size 0xC).
typedef struct DVDDirEntry {
	u32 entryNum; // _00
	BOOL isDir;   // _04
	char* name;   // _08
} DVDDirEntry;

// Struct for handing queues.
typedef struct DVDQueue DVDQueue;

struct DVDQueue {
	DVDQueue* mHead; // _00
	DVDQueue* mTail; // _04
};

// DVD Boot information instructions.
// Struct 1.
typedef struct DVDBB1 {
	u32 appLoaderLength;  // _00
	void* appLoaderFunc1; // _04
	void* appLoaderFunc2; // _08
	void* appLoaderFunc3; // _0C
} DVDBB1;

// Struct 2.
typedef struct DVDBB2 {
	u32 bootFilePosition; // _00
	u32 FSTPosition;      // _04
	u32 FSTLength;        // _08
	u32 FSTMaxLength;     // _0C
	void* FSTAddress;     // _10
	u32 userPosition;     // _14
	u32 userLength;       // _18
	u32 reserved_1C;      // _1C
} DVDBB2;


///////// DVD FUNCTIONS //////////
// Basic DVD functions.
void DVDInit();
BOOL DVDOpen(char* filename, DVDFileInfo* fileInfo);
BOOL DVDFastOpen(s32 entryNum, DVDFileInfo* fileInfo);
s32 DVDReadPrio(DVDFileInfo* fileInfo, void* addr, s32 length, s32 offset, s32 prio);
BOOL DVDReadAsyncPrio(DVDFileInfo* fileInfo, void* addr, s32 length, s32 offset, DVDCallback callback, s32 prio);
BOOL DVDClose(DVDFileInfo* fileInfo);

void DVDResume();
void DVDReset();

BOOL DVDCancelAsync(DVDCommandBlock* block, DVDCBCallback callback);
s32 DVDCancel(DVDCommandBlock* block);

s32 DVDChangeDisk(DVDCommandBlock* block, DVDDiskID* id);
BOOL DVDChangeDiskAsync(DVDCommandBlock* block, DVDDiskID* id, DVDCBCallback callback);

// Status functions.
s32 DVDGetCommandBlockStatus(const DVDCommandBlock* block);
s32 DVDGetDriveStatus();
BOOL DVDSetAutoInvalidation(BOOL doAutoInval);
void* DVDGetFSTLocation();

// DVD Dir functions.
BOOL DVDOpenDir(char* dirName, DVDDir* dir);
BOOL DVDReadDir(DVDDir* dir, DVDDirEntry* dirEntry);
BOOL DVDCloseDir(DVDDir* dir);
BOOL DVDGetCurrentDir(char* path, u32 maxLength);
BOOL DVDChangeDir(char* dirName);
s32 DVDConvertPathToEntrynum(char* path);

// Other disk functions.
s32 DVDGetTransferredSize(DVDFileInfo* fileInfo);
DVDDiskID* DVDGetCurrentDiskID();
BOOL DVDCompareDiskID(DVDDiskID* id1, DVDDiskID* id2);
DVDLowCallback DVDLowClearCallback();

BOOL DVDCheckDisk();

// Unused/inlined in P2.
void DVDPause();
s32 DVDSeekPrio(DVDFileInfo* fileInfo, s32 offset, s32 prio);
BOOL DVDSeekAsyncPrio(DVDFileInfo* fileInfo, s32 offset, DVDCallback callback, s32 prio);
s32 DVDGetFileInfoStatus(DVDFileInfo* fileInfo);
BOOL DVDFastOpenDir(s32 entryNum, DVDDir* dir);
BOOL DVDCancelAllAsync(DVDCBCallback callback);
s32 DVDCancelAll();
void DVDDumpWaitingQueue();


// Macro for reading.
#define DVDReadAsync(fileInfo, addr, length, offset, callback) DVDReadAsyncPrio((fileInfo), (addr), (length), (offset), (callback), 2)

// Minimum transfer size.
#define DVD_MIN_TRANSFER_SIZE 32

// DVD states.
#define DVD_STATE_FATAL_ERROR   -1
#define DVD_STATE_END           0
#define DVD_STATE_BUSY          1
#define DVD_STATE_WAITING       2
#define DVD_STATE_COVER_CLOSED  3
#define DVD_STATE_NO_DISK       4
#define DVD_STATE_COVER_OPEN    5
#define DVD_STATE_WRONG_DISK    6
#define DVD_STATE_MOTOR_STOPPED 7
#define DVD_STATE_PAUSING       8
#define DVD_STATE_IGNORED       9
#define DVD_STATE_CANCELED      10
#define DVD_STATE_RETRY         11

// File info states.
#define DVD_FILEINFO_READY 0
#define DVD_FILEINFO_BUSY  1

// DVD results.
#define DVD_RESULT_GOOD        0
#define DVD_RESULT_FATAL_ERROR -1
#define DVD_RESULT_IGNORED     -2
#define DVD_RESULT_CANCELED    -3

#define DVD_AIS_SUCCESS 0

#ifdef __cplusplus
};
#endif // ifdef __cplusplus

#endif
