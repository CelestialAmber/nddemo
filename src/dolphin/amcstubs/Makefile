AMCSTUBS_FILES :=\
	$(BUILD_DIR)/asm/dolphin/amcstubs/AmcExi2Stubs.o

DEPENDS += $(AMCSTUBS_FILES:.o=.d)

$(BUILD_DIR)/src/dolphin/amcstubs/amcstubs.a: $(AMCSTUBS_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(AMCSTUBS_FILES) > build/AMCSTUBS_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/AMCSTUBS_ofiles
