DSP_FILES :=\
	$(BUILD_DIR)/asm/dolphin/dsp/dsp.o\
	$(BUILD_DIR)/asm/dolphin/dsp/dsp_debug.o\
	$(BUILD_DIR)/asm/dolphin/dsp/dsp_task.o

DEPENDS += $(DSP_FILES:.o=.d)

$(BUILD_DIR)/src/dolphin/dsp/dsp.a: $(DSP_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(DSP_FILES) > build/DSP_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/DSP_ofiles
