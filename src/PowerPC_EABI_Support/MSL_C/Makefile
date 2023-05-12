MSL_C_FILES :=\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/abort_exit.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/ansi_files.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/ansi_fp.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/buffer_io.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/PPC_EABI/critical_regions.ppc_eabi.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/ctype.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/direct_io.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/mbstring.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/mem.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/mem_funcs.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/misc_io.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/printf.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/string.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/uart_console_io.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/wchar_io.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/Math/Double_precision/s_frexp.o\
	$(BUILD_DIR)/src/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/Math/Single_precision/hyperbolicsf.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/Math/Single_precision/inverse_trig.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/Math/Single_precision/trigf.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/Math/Single_precision/common_float_tables.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/Math/Single_precision/exponentialsf.o

$(MSL_C_FILES): CFLAGS += -inline deferred

# Also needs noauto
$(BUILD_DIR)/src/PowerPC_EABI_Support/MSL_C/MSL_Common/mbstring.o: CFLAGS += -inline noauto,deferred
$(BUILD_DIR)/src/PowerPC_EABI_Support/MSL_C/MSL_Common/direct_io.o: CFLAGS += -inline noauto,deferred

# Enable string pooling
$(BUILD_DIR)/src/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/ansi_fp.o: CFLAGS += -str pool
$(BUILD_DIR)/src/PowerPC_EABI_Support/MSL_C/MSL_Common/locale.o: CFLAGS += -str pool
$(BUILD_DIR)/src/PowerPC_EABI_Support/MSL_C/MSL_Common/printf.o: CFLAGS += -str pool

DEPENDS += $(MSL_C_FILES:.o=.d)

$(BUILD_DIR)/src/PowerPC_EABI_Support/MSL_C/MSL_C.PPCEABI.bare.H.a: $(MSL_C_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(MSL_C_FILES) > build/MSL_C_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/MSL_C_ofiles
