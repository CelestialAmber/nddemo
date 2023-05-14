#pragma once

#include "types.h"
#include "NDDEMO/dg/DGLight.h"

class DTLight{
protected:
	DGLight light[8]; //0x0


	void SettingMpol();
	void SettingEnve();
	void SettingSpil();
	void SettingCine();
	void SettingCave();
	void SettingDome();
	void SettingHang();
	void SettingEntr();

public:
	DTLight(const DTLight&);
	DTLight();
	~DTLight();

	void Setting(u8 stageNo);
	void SetKuriboLight();
};
