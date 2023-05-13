#include "types.h"

typedef void (*DVDAsyncCallback)(s32, struct DVDFileInfo*);
typedef void (*DVDCBAsyncCallback)(s32, struct DVDCommandBlock*);

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
  DVDCBAsyncCallback callback;
  void* userData;
} DVDCommandBlock;

typedef struct DVDFileInfo{
    DVDCommandBlock cb;
    u32 startAddr;
    u32 length;
    DVDAsyncCallback callback;
} DVDFileInfo;
