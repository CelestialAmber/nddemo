RUNTIME_FILES :=\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/Runtime/__mem.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/Runtime/__va_arg.o\
	$(BUILD_DIR)/src/PowerPC_EABI_Support/Runtime/global_destructor_chain.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/Runtime/NMWException.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/Runtime/ExceptionPPC.o\
	$(BUILD_DIR)/asm/PowerPC_EABI_Support/Runtime/runtime.o\
	$(BUILD_DIR)/src/PowerPC_EABI_Support/Runtime/__init_cpp_exceptions.o


# Some files need inline deferred
$(BUILD_DIR)/src/PowerPC_EABI_Support/Runtime/global_destructor_chain.o: CFLAGS += -inline deferred
$(BUILD_DIR)/src/PowerPC_EABI_Support/Runtime/NMWException.o: CFLAGS += -inline deferred
$(BUILD_DIR)/src/PowerPC_EABI_Support/Runtime/__init_cpp_exceptions.o: CFLAGS += -inline deferred
$(BUILD_DIR)/src/PowerPC_EABI_Support/Runtime/ExceptionPPC.o: CFLAGS += -inline deferred

DEPENDS += $(RUNTIME_FILES:.o=.d)

$(BUILD_DIR)/src/PowerPC_EABI_Support/Runtime/Runtime.PPCEABI.H.a: $(RUNTIME_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(RUNTIME_FILES) > build/RUNTIME_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/RUNTIME_ofiles
