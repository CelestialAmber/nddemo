METROTRK_FILES :=\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/mainloop.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/nubevent.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/nubinit.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/msg.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/msgbuf.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/serpoll.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Os/dolphin/usr_put.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/dispatch.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/msghndlr.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/support.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/mutex_TRK.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/notify.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Processor/ppc/Generic/flush_cache.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/mem_TRK.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Processor/ppc/Generic/__exception.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Processor/ppc/Generic/targimpl.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Os/dolphin/dolphin_trk.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Processor/ppc/Generic/mpc_7xx_603e.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/main_TRK.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Os/dolphin/dolphin_trk_glue.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Os/dolphin/targcont.o

$(METROTRK_FILES): CFLAGS += -inline deferred

DEPENDS += $(METROTRK_FILES:.o=.d)

$(BUILD_DIR)/src/PowerPC_EABI_Support/MetroTRK/TRK_MINNOW_DOLPHIN.a: $(METROTRK_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(METROTRK_FILES) > build/METROTRK_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/METROTRK_ofiles
