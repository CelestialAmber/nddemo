NDDEMO_FILES :=\
	$(BUILD_DIR)/src/NDDEMO/main/main.o\
	$(BUILD_DIR)/asm/NDDEMO/dm/DMainSystem.o\
	$(BUILD_DIR)/asm/NDDEMO/du/DUDvd.o\
	$(BUILD_DIR)/src/NDDEMO/du/DUMacro.o\
	$(BUILD_DIR)/asm/NDDEMO/dg/DGLight.o\
	$(BUILD_DIR)/asm/NDDEMO/dg/DGModel.o\
	$(BUILD_DIR)/asm/NDDEMO/dg/DGModelMan.o\
	$(BUILD_DIR)/asm/NDDEMO/dg/DGObject.o\
	$(BUILD_DIR)/asm/NDDEMO/dg/DGObjMan.o\
	$(BUILD_DIR)/asm/NDDEMO/dg/DGParts.o\
	$(BUILD_DIR)/asm/NDDEMO/dg/DGRendMan.o\
	$(BUILD_DIR)/asm/NDDEMO/dg/DGTexMan.o\
	$(BUILD_DIR)/asm/NDDEMO/dg/DGCamera.o\
	$(BUILD_DIR)/src/NDDEMO/dg/DGPosition.o\
	$(BUILD_DIR)/asm/NDDEMO/dg/DGFont.o\
	$(BUILD_DIR)/asm/NDDEMO/dg/DGRendState.o\
	$(BUILD_DIR)/src/NDDEMO/dg/DGTexPro.o\
	$(BUILD_DIR)/asm/NDDEMO/dg/DGAniModel.o\
	$(BUILD_DIR)/src/NDDEMO/dg/DGTexture.o\
	$(BUILD_DIR)/src/NDDEMO/dt/DTPad.o\
	$(BUILD_DIR)/asm/NDDEMO/dt/DTHit.o\
	$(BUILD_DIR)/asm/NDDEMO/dt/DTLight.o\
	$(BUILD_DIR)/asm/NDDEMO/dt/DTGimmick.o\
	$(BUILD_DIR)/asm/NDDEMO/dt/DTPlayer.o\
	$(BUILD_DIR)/asm/NDDEMO/dt/DTCamera.o\
	$(BUILD_DIR)/asm/NDDEMO/da/DAudio.o

$(NDDEMO_FILES): CFLAGS = -O4,p -g -enum int -inline auto -proc gekko -fp hard -nodefaults -Cpp_exceptions off -RTTI off $(INCLUDES)

DEPENDS += $(NDDEMO_FILES:.o=.d)

$(BUILD_DIR)/src/NDDEMO/NDDEMO.a: $(NDDEMO_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(NDDEMO_FILES) > build/NDDEMO_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/NDDEMO_ofiles
