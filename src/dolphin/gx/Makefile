GX_FILES :=\
	$(BUILD_DIR)/asm/dolphin/gx/GXInit.o\
	$(BUILD_DIR)/asm/dolphin/gx/GXFifo.o\
	$(BUILD_DIR)/asm/dolphin/gx/GXAttr.o\
	$(BUILD_DIR)/asm/dolphin/gx/GXMisc.o\
	$(BUILD_DIR)/asm/dolphin/gx/GXGeometry.o\
	$(BUILD_DIR)/asm/dolphin/gx/GXFrameBuf.o\
	$(BUILD_DIR)/asm/dolphin/gx/GXLight.o\
	$(BUILD_DIR)/asm/dolphin/gx/GXTexture.o\
	$(BUILD_DIR)/asm/dolphin/gx/GXBump.o\
	$(BUILD_DIR)/asm/dolphin/gx/GXTev.o\
	$(BUILD_DIR)/asm/dolphin/gx/GXPixel.o\
	$(BUILD_DIR)/asm/dolphin/gx/GXStubs.o\
	$(BUILD_DIR)/asm/dolphin/gx/GXDisplayList.o\
	$(BUILD_DIR)/asm/dolphin/gx/GXTransform.o\
	$(BUILD_DIR)/asm/dolphin/gx/GXPerf.o

DEPENDS += $(GX_FILES:.o=.d)

$(BUILD_DIR)/src/dolphin/gx/gx.a: $(GX_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(GX_FILES) > build/GX_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/GX_ofiles
