MTX_FILES :=\
	$(BUILD_DIR)/asm/dolphin/mtx/mtx.o\
	$(BUILD_DIR)/asm/dolphin/mtx/mtxvec.o\
	$(BUILD_DIR)/asm/dolphin/mtx/mtx44.o\
	$(BUILD_DIR)/asm/dolphin/mtx/vec.o

DEPENDS += $(MTX_FILES:.o=.d)

$(BUILD_DIR)/src/dolphin/mtx/mtx.a: $(MTX_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(MTX_FILES) > build/MTX_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/MTX_ofiles
