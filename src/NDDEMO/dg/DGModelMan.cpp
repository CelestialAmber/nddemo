#include "NDDEMO/dg/DGModelMan.h"
#include "NDDEMO/du/DUMacro.h"
#include "dolphin/OS.h"
#include <cstring>

DGModelMan::DGModelMan(u16 MaxMaterModelNum, u16 MaxTextureNum, u16 MaxObjectNum){
	m_Lock = 0;
	m_ObjMan = new DGObjMan(MaxObjectNum);
	m_TexMan = new DGTexMan(MaxTextureNum);
	m_MaxMaterModelNum = MaxMaterModelNum;
	m_MsterModelNum = 0;
	m_MsterModelPointer = 0;
	m_MasterModelTable = (u8**)mAlloc(m_MaxMaterModelNum*4);
	memset(m_MasterModelTable, 0, m_MaxMaterModelNum*4);
}

DGModelMan::~DGModelMan(){
	//Destroy every model
	for(u16 i = 0; i < m_MaxMaterModelNum; i++){
		DestroyMasterModel(i);
	}

	Delete(m_MasterModelTable);
	Delete(m_ObjMan);
	Delete(m_TexMan);
}

//unused
u16 DGModelMan::AddMasterModel(u8* ModelClass){
	return 0;
}

void DGModelMan::DeleteMasterModel(u16 ModelHandle){
	u32 unused;

	//BUG?: If the lock is already enabled, the code prints a message, but doesn't
	//prevent the code from being ran.
	if(m_Lock != 0){
		OSReport("DGModelMan::DeleteMasterModel >Locked(%d)\n", m_Lock);
	}

	//Enable the lock
	m_Lock = 1;

	if(ModelHandle < m_MaxMaterModelNum){
		if(m_MasterModelTable[ModelHandle] != nullptr){
			if(DecRefer(ModelHandle) == 0){
				DestroyMasterModel(ModelHandle);
			}
		}
	}

	//Disable the lock
	m_Lock = 0;
}

void DGModelMan::DestroyMasterModel(u16 ModelHandle){
	if(ModelHandle < m_MaxMaterModelNum){
		u8* TempPtr = m_MasterModelTable[ModelHandle];
		
		if(TempPtr != nullptr){
			if(*(u16*)TempPtr != 0){
				OSReport("DGModelMan::DestroyMasterModel> ReferCount not Equal Zero\n");
			}

			TempPtr += 0x12;
			
			u16 ClassDepth = 0;

			while(true){
				if(*TempPtr == 1){
					ClassDepth++;
					m_ObjMan->DetachObject(*(u16*)(TempPtr + 1));
					TempPtr += 3;
					continue;
				}

				ClassDepth--;
				TempPtr++;

				if(ClassDepth == 0){
					break;
				}
			}

			m_MsterModelNum--;
			Delete(m_MasterModelTable[ModelHandle]);
		}
	}
}

DGModel* DGModelMan::CreateInstance(u16 ModelHandle){
	//BUG?: If the lock is already enabled, the code prints a message, but doesn't
	//prevent the code from being ran.
	if(m_Lock != 0){
		OSReport("DGModelMan::CreateInstance >Locked(%d)\n", m_Lock);
	}

	m_Lock = 2;

	if(ModelHandle < m_MaxMaterModelNum){
		if(m_MasterModelTable[ModelHandle] != nullptr){
			DGModel* TempModel = new DGModel(m_ObjMan);
			//If CreateInstance was successful, return the DGModel instance
			if(TempModel->CreateInstance(m_MasterModelTable[ModelHandle] + 0x12) == 1){
				m_Lock = 0;
				return TempModel;
			}
			
			OSReport("Error DGModelMan::CreateInstance False\n");
			Delete(TempModel);
		}
	}

	m_Lock = 0;
	return nullptr; //CreateInstance failed, so just return null
}

DGAniModel* DGModelMan::CreateAnimeInstance(u16 ModelHandle){
	if(ModelHandle < m_MaxMaterModelNum){
		if(m_MasterModelTable[ModelHandle] != nullptr){
			DGAniModel* TempAniModel = new DGAniModel(m_ObjMan);
			//If CreateInstance was successful, return the DGModel instance
			if(TempAniModel->CreateInstance(m_MasterModelTable[ModelHandle] + 0x12) == 1){
				TempAniModel->ReconstructToAnimodelStruct();
				return TempAniModel;
			}
			
			OSReport("Error DGModelMan::CreateAnimeInstance False\n");
			Delete(TempAniModel);
		}
	}

	return nullptr; //CreateInstance failed, so just return null
}

u16 DGModelMan::LoadNDM(char* szFileName){
	//BUG?: If the lock is already enabled, the code prints a message, but doesn't
	//prevent the code from being ran.
	if(m_Lock != 0){
		OSReport("DGModelMan::LoadNDM >Locked(%d)\n", m_Lock);
	}

	m_Lock = 3;

	u16 hModel = 0xffff; //r21
	DUDvd File; //0x14

	if((u8)File.Open(szFileName, DUD_OM_SEQUENTIAL_NOALIGN) == 1){
		u8* ndmHeader = (u8*)mAlloc(0x20);

		if(ndmHeader == nullptr){
			OSReport("DGModelMan::LoadNDM >ndmHeader==NULL\n");
		}

		File.Read(ndmHeader,0x20,0);

		//Check if the version number is 0
		if(*(u16*)ndmHeader == 0){
			//Create pointers to header info
			u16* TexTableNum = (u16*)(ndmHeader + 2); //r27
			u32* TexTableSize = (u32*)(ndmHeader + 4); //r21
			u16* ClassBlockNum = (u16*)(ndmHeader + 8); //r26
			u32* ClassBlockSize = (u32*)(ndmHeader + 0xA); //r25
			u16* GlobalTexTable = nullptr; //r24

			if(*TexTableNum != 0){
				char* TexTabale = (char*)mAlloc(*TexTableSize);

				if(TexTabale == nullptr){
					OSReport("DGModelMan::LoadNDM >TexTabale==NULL\n");
				}

				File.Read(TexTabale, *TexTableSize, 0);

				GlobalTexTable = (u16*)mAlloc(*TexTableNum << 1);
				
				if(GlobalTexTable == nullptr){
					OSReport("DGModelMan::LoadNDM >GlobalTexTable==NULL\n");
				}

				/* Load all the textures using the file names from the file name table,
				and save all the handles to GlobalTexTable
				Each name entry is 16 bytes */
				for(u16 i = 0; i < *TexTableNum; i++){
					GlobalTexTable[i] = m_TexMan->LoadTexture(TexTabale + i*0x10);
				}

				if(TexTabale != nullptr){
					delete TexTabale;
				}
			}

			u8* ClassBlock = (u8*)mAlloc(*ClassBlockSize);

			if (ClassBlock == nullptr) {
				OSReport("DGModelMan::LoadNDM >ClassBlock==NULL\n");
			}

			File.Read(ClassBlock, *ClassBlockSize, 0);
			u8* ClassPointer = ClassBlock;

			for(u16 i = 0; i < *ClassBlockSize; i++){
				while(*ClassPointer != 0xFF){
					ClassPointer++;
				}

				DGObject* TempObject = new DGObject(m_TexMan);

				if (TempObject == nullptr) {
					OSReport("DGModelMan::LoadNDM >TempObject==NULL\n");
				}

				if(TempObject->LoadNDMPartsBlock(File) == 1){
					if (GlobalTexTable != nullptr) {
						TempObject->MakeTexTransTable(GlobalTexTable);
					}

					u16 ObjHandle = m_ObjMan->AddObject(TempObject);
					ObjHandle = m_ObjMan->AttachObject(ObjHandle);

					if (ObjHandle == 0xFFFF) {
						if (TempObject != nullptr) {
							delete TempObject;
						}
						OSReport("DGModelMan::LoadNDM >McrDeleteTempObject(ObjHandle ==0xffff)\n");
					}

					*ClassPointer = ObjHandle;
					ClassPointer += 2;
				}else{
					if (TempObject != nullptr) {
						delete TempObject;
					}

					OSReport("DGModelMan::LoadNDM >McrDeleteTempObject\n");
				}
			}

			if (GlobalTexTable != nullptr) {
				delete GlobalTexTable;
			}

			u32 ModelClassSize = (*ClassBlockNum)*4 + 0x12; //r20
			ModelClassSize += (0x20 - (ModelClassSize & 0x1f) & 0x1f);
			u8* ModelClass = (u8*)mAlloc(ModelClassSize); //r24
			memset(ModelClass, 0, ModelClassSize);
			strcpy((char*)(ModelClass + 2),szFileName);
			memcpy(ModelClass + 0x12, ClassBlock, (*ClassBlockNum) << 2);

			if (ClassBlock != nullptr) {
				delete ClassBlock;
			}

			u16 i;

			for(i = 0; i < m_MaxMaterModelNum; i++){
				if(m_MasterModelTable[i] == nullptr){
					m_MasterModelTable[i] = ModelClass;
					IncRefer(i);
					m_MsterModelNum++;
					goto lbl_380;
				}
			}

			i = 0xFFFF;

			lbl_380:
			hModel = i;

			if(hModel == 0xFFFF) {
				OSReport("Error DGModelMan::LoadNDM>AddMasterModel False\n");

				if(ModelClass != nullptr){
					delete ModelClass;
				}
			}
		}else{
			OSReport("NDM Version Error\n");
		}

		if(ndmHeader != nullptr){
			delete ndmHeader;
		}
	}else{
		OSReport("Error DGModelMan::LoadNDM>OpenFalse [%s]\n", szFileName);
	}

	File.Close();
	m_Lock = 0;
	return hModel;
}

u16 DGModelMan::LoadDuplicateNDM(char* szFileName){
	if(m_Lock != 0){
		OSReport("DGModelMan::LoadDuplicateNDM >Locked(%d)\n", m_Lock);
	}

	m_Lock = 4;

	for(u16 i = 0; i < m_MaxMaterModelNum; i++){
		if(m_MasterModelTable[i] != nullptr){
			if(!strncmp((char*)(m_MasterModelTable[i] + 2), szFileName, 8)){
				OSReport("DGModelMan::LoadDuplicateNDM>MasterModel Duplicate [%s]\n", szFileName);
				IncRefer(i);
				m_Lock = 0;
				return i;
			}
		}
	}

	m_Lock = 0; //Disable the lock
	return LoadNDM(szFileName); //Load the ndm file
}

u16 DGModelMan::IncRefer(u16 ModelHandle){
	u16* r4 = (u16*)m_MasterModelTable[ModelHandle];

	if(r4 != nullptr){
		return ++r4[0];
	}
	
	return 0;
}

u16 DGModelMan::DecRefer(u16 ModelHandle){
	u16* r4 = (u16*)m_MasterModelTable[ModelHandle];

	if(r4 != nullptr){
		if(r4[0] > 0){
			return --r4[0];
		}else{
			OSReport("Error DGModelMan::DecRefer ReferCount<0\n");
		}
	}
	
	return 0;
}

DGFont* DGModelMan::LoadFont(const char* szFileName, u8 width, u8 height, u8 sequence, char start, char end){
	if(m_Lock != 0){
		OSReport("DGModelMan::LoadFont >Locked(%d)\n", m_Lock);
	}

	m_Lock = 5;

	//not in dwarf
	DGFont* TempFont = new DGFont(m_TexMan, szFileName, width, height, sequence, start, end);

	m_Lock = 0;

	return TempFont;
}

DGTexPro* DGModelMan::LoadTexPro(const char* szFileName){
	if(m_Lock != 0){
		OSReport("DGModelMan::LoadTexPro >Locked(%d)\n", m_Lock);
	}

	m_Lock = 6;

	//not in dwarf
	DGTexPro* TempTexPro;

	if(szFileName == nullptr){
		TempTexPro = new DGTexPro(m_TexMan);
		m_Lock = 0;
		return TempTexPro;
	}else{
		TempTexPro = new DGTexPro(m_TexMan, szFileName);
		m_Lock = 0;
		return TempTexPro;
	}

}

void DGModelMan::EnableMipMap(u8 mip){
	m_TexMan->EnableMipMap(mip);
}

void DGModelMan::EnableExpensiveMipMap(u8 mip){
	m_TexMan->EnableExpensiveMipMap(mip);
}
