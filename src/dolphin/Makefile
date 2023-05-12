DOLPHIN_FILES :=\
	$(BUILD_DIR)/src/dolphin/base/base.a\
	$(BUILD_DIR)/src/dolphin/os/os.a\
	$(BUILD_DIR)/src/dolphin/db/db.a\
	$(BUILD_DIR)/src/dolphin/mtx/mtx.a\
	$(BUILD_DIR)/src/dolphin/dvd/dvd.a\
	$(BUILD_DIR)/src/dolphin/vi/vi.a\
	$(BUILD_DIR)/src/dolphin/pad/pad.a\
	$(BUILD_DIR)/src/dolphin/ai/ai.a\
	$(BUILD_DIR)/src/dolphin/ar/ar.a\
	$(BUILD_DIR)/src/dolphin/dsp/dsp.a\
	$(BUILD_DIR)/src/dolphin/gx/gx.a\
	$(BUILD_DIR)/src/musyx/musyx.a\
	$(BUILD_DIR)/src/PowerPC_EABI_Support/MetroTRK/TRK_MINNOW_DOLPHIN.a\
	$(BUILD_DIR)/src/PowerPC_EABI_Support/Runtime/Runtime.PPCEABI.H.a\
	$(BUILD_DIR)/src/PowerPC_EABI_Support/MSL_C/MSL_C.PPCEABI.bare.H.a\
	$(BUILD_DIR)/src/dolphin/amcstubs/amcstubs.a\
	$(BUILD_DIR)/src/dolphin/OdemuExi2/OdemuExi2.a\
	$(BUILD_DIR)/src/dolphin/odenotstub/odenotstub.a

DEPENDS += $(DOLPHIN_FILES:.o=.d)

$(BUILD_DIR)/src/dolphin/dolphin.a: $(DOLPHIN_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(DOLPHIN_FILES) > build/DOLPHIN_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/DOLPHIN_ofiles
