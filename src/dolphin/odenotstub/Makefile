ODENOTSTUB_FILES :=\
	$(BUILD_DIR)/src/dolphin/odenotstub/odenotstub.o

DEPENDS += $(ODENOTSTUB_FILES:.o=.d)

$(BUILD_DIR)/src/dolphin/odenotstub/odenotstub.a: $(ODENOTSTUB_FILES)
	@echo Linking... $@
	$(QUIET) mkdir -p $(dir $@)
	@echo $(ODENOTSTUB_FILES) > build/ODENOTSTUB_ofiles
	$(QUIET) $(LD) -library $(LIBRARY_LDFLAGS) -o $@ -lcf ldscript.lcf @build/ODENOTSTUB_ofiles
