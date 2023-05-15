#include "NDDEMO/dt/DTPad.h"
#include <cstring>

static u32 PadChanMask[4] = {
	0x80000000,
	0x40000000,
	0x20000000,
	0x10000000
};

DTPad::DTPad(){
	PADRead(prepad);

	ResetReq = 0;
	count = 0;
}

DTPad::~DTPad(){
}

void DTPad::Read(){
	ResetReq = 0;
	//copy the current pad status array to the previous one
	memcpy(prepad, pad, sizeof(pad) + 0xC);
	PADRead(pad);
	PADClamp(pad);
	
	s8 i = 0;

	//check each controller to see if there was an error
	while(i < 4){
		s8 err = pad[i].err;

		if(err != 0 && err != PAD_ERR_TRANSFER && err == PAD_ERR_NO_CONTROLLER){
			ResetReq |= PadChanMask[i];
		}

		i++;
	}

	//if ResetReq != 0 (one of the controllers had an error), call PADReset
	if(ResetReq != 0) PADReset(ResetReq);
}

PADStatus* DTPad::GetPADStatus(u8 padNo){
	return &(pad[padNo]);
}

s8 DTPad::StickX(u16 id){
	return pad[id].stickX;
}

s8 DTPad::StickY(u16 id){
	return pad[id].stickY;
}

//unused
s8 DTPad::SubStickX(u16 id){
	return pad[id].substickX;
}

//unused
s8 DTPad::SubStickY(u16 id){
	return pad[id].substickY;
}

//Checks whether the specified key was pressed
BOOL DTPad::IsTrg(u16 id, u16 key){
	if((pad[id].button & key) && !(prepad[id].button & key)){
		return true;
	}

	return false;
}

//unused
BOOL DTPad::IsCnd(u16 id, u16 key){
}

//unused
BOOL DTPad::IsTrp(u16 id, u16 key){
}

//nonmatching
//Checks whether the specified button is being held
BOOL DTPad::IsPush(u16 id, u16 key){
	if((pad[id].button & key) == pad[id].button){
		return true;
	}

	return false;
}

//unused
BOOL DTPad::IsStickTrg(u16 id, u16 key){
}
