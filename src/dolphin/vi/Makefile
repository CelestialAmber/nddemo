VI_FILES :=\
	$(BUILD_DIR)/asm/dolphin/vi/vi.o

DEPENDS += $(VI_FILES:.o=.d)

$(BUILD_DIR)/src/dolphin/vi/vi.a: $(VI_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(VI_FILES) > build/VI_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/VI_ofiles
