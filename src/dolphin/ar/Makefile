AR_FILES :=\
	$(BUILD_DIR)/asm/dolphin/ar/ar.o\
	$(BUILD_DIR)/asm/dolphin/ar/arq.o

DEPENDS += $(AR_FILES:.o=.d)

$(BUILD_DIR)/src/dolphin/ar/ar.a: $(AR_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(AR_FILES) > build/AR_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/AR_ofiles
