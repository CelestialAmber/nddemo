OS_FILES :=\
	$(BUILD_DIR)/asm/dolphin/os/OS.o\
	$(BUILD_DIR)/asm/dolphin/os/OSAlarm.o\
	$(BUILD_DIR)/asm/dolphin/os/OSAlloc.o\
	$(BUILD_DIR)/asm/dolphin/os/OSArena.o\
	$(BUILD_DIR)/asm/dolphin/os/OSAudioSystem.o\
	$(BUILD_DIR)/asm/dolphin/os/OSCache.o\
	$(BUILD_DIR)/asm/dolphin/os/OSContext.o\
	$(BUILD_DIR)/asm/dolphin/os/OSError.o\
	$(BUILD_DIR)/asm/dolphin/os/OSExi.o\
	$(BUILD_DIR)/asm/dolphin/os/OSInterrupt.o\
	$(BUILD_DIR)/asm/dolphin/os/OSLink.o\
	$(BUILD_DIR)/asm/dolphin/os/OSMemory.o\
	$(BUILD_DIR)/asm/dolphin/os/OSMutex.o\
	$(BUILD_DIR)/asm/dolphin/os/OSReboot.o\
	$(BUILD_DIR)/asm/dolphin/os/OSReset.o\
	$(BUILD_DIR)/asm/dolphin/os/OSResetSW.o\
	$(BUILD_DIR)/asm/dolphin/os/OSRtc.o\
	$(BUILD_DIR)/asm/dolphin/os/OSSerial.o\
	$(BUILD_DIR)/asm/dolphin/os/OSStopwatch.o\
	$(BUILD_DIR)/asm/dolphin/os/OSSync.o\
	$(BUILD_DIR)/asm/dolphin/os/OSThread.o\
	$(BUILD_DIR)/asm/dolphin/os/OSTime.o\
	$(BUILD_DIR)/asm/dolphin/os/OSUartExi.o\
	$(BUILD_DIR)/src/dolphin/os/init/__start.o\
	$(BUILD_DIR)/src/dolphin/os/init/__ppc_eabi_init.o

DEPENDS += $(OS_FILES:.o=.d)

$(BUILD_DIR)/src/dolphin/os/os.a: $(OS_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(OS_FILES) > build/OS_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/OS_ofiles
