DVD_FILES :=\
	$(BUILD_DIR)/asm/dolphin/dvd/dvdlow.o\
	$(BUILD_DIR)/asm/dolphin/dvd/dvdfs.o\
	$(BUILD_DIR)/asm/dolphin/dvd/dvd.o\
	$(BUILD_DIR)/asm/dolphin/dvd/dvdqueue.o\
	$(BUILD_DIR)/asm/dolphin/dvd/dvderror.o\
	$(BUILD_DIR)/asm/dolphin/dvd/emu_level2/fstload.o

DEPENDS += $(DVD_FILES:.o=.d)

$(BUILD_DIR)/src/dolphin/dvd/dvd.a: $(DVD_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(DVD_FILES) > build/DVD_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/DVD_ofiles
