MUSYX_FILES :=\
	$(BUILD_DIR)/asm/musyx/seq.o\
	$(BUILD_DIR)/asm/musyx/synth.o\
	$(BUILD_DIR)/asm/musyx/seq_api.o\
	$(BUILD_DIR)/asm/musyx/snd_synthapi.o\
	$(BUILD_DIR)/asm/musyx/stream.o\
	$(BUILD_DIR)/asm/musyx/synthdata.o\
	$(BUILD_DIR)/asm/musyx/synthmacros.o\
	$(BUILD_DIR)/asm/musyx/synthvoice.o\
	$(BUILD_DIR)/asm/musyx/synth_ac.o\
	$(BUILD_DIR)/asm/musyx/synth_adsr.o\
	$(BUILD_DIR)/asm/musyx/synth_dbtab.o\
	$(BUILD_DIR)/asm/musyx/s_data.o\
	$(BUILD_DIR)/asm/musyx/hw_dspctrl.o\
	$(BUILD_DIR)/asm/musyx/hw_volconv.o\
	$(BUILD_DIR)/asm/musyx/snd3d.o\
	$(BUILD_DIR)/asm/musyx/snd_init.o\
	$(BUILD_DIR)/asm/musyx/snd_math.o\
	$(BUILD_DIR)/asm/musyx/snd_midictrl.o\
	$(BUILD_DIR)/asm/musyx/snd_service.o\
	$(BUILD_DIR)/asm/musyx/hardware.o\
	$(BUILD_DIR)/asm/musyx/hw_aramdma.o\
	$(BUILD_DIR)/asm/musyx/hw_dolphin.o\
	$(BUILD_DIR)/asm/musyx/hw_memory.o\
	$(BUILD_DIR)/asm/musyx/dsp_import.o\
	$(BUILD_DIR)/asm/musyx/reverb_fx.o\
	$(BUILD_DIR)/asm/musyx/reverb.o\
	$(BUILD_DIR)/asm/musyx/chorus_fx.o

DEPENDS += $(MUSYX_FILES:.o=.d)

$(BUILD_DIR)/src/musyx/musyx.a: $(MUSYX_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(MUSYX_FILES) > build/MUSYX_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/musyx_ofiles
