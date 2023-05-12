ODEMUEXI2_FILES :=\
	$(BUILD_DIR)/asm/dolphin/OdemuExi2/DebuggerDriver.o

DEPENDS += $(ODEMUEXI2_FILES:.o=.d)

$(BUILD_DIR)/src/dolphin/OdemuExi2/OdemuExi2.a: $(ODEMUEXI2_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(ODEMUEXI2_FILES) > build/ODEMUEXI2_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/ODEMUEXI2_ofiles
