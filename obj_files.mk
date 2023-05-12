NDDEMO := \
$(BUILD_DIR)/asm/NDDEMO/main/main.o \
$(BUILD_DIR)/asm/NDDEMO/dm/DMainSystem.o \
$(BUILD_DIR)/asm/NDDEMO/du/DUDvd.o \
$(BUILD_DIR)/asm/NDDEMO/du/DUMacro.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGLight.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGModel.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGModelMan.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGObject.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGObjMan.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGParts.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGRendMan.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGTexMan.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGCamera.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGPosition.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGFont.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGRendState.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGTexPro.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGAniModel.o \
$(BUILD_DIR)/asm/NDDEMO/dg/DGTexture.o \
$(BUILD_DIR)/asm/NDDEMO/dt/DTPad.o \
$(BUILD_DIR)/asm/NDDEMO/dt/DTHit.o \
$(BUILD_DIR)/asm/NDDEMO/dt/DTLight.o \
$(BUILD_DIR)/asm/NDDEMO/dt/DTGimmick.o \
$(BUILD_DIR)/asm/NDDEMO/dt/DTPlayer.o \
$(BUILD_DIR)/asm/NDDEMO/dt/DTCamera.o \
$(BUILD_DIR)/asm/NDDEMO/da/DAudio.o

DOLPHIN := \
$(BUILD_DIR)/asm/dolphin/base/PPCArch.o \
$(BUILD_DIR)/asm/dolphin/os/OS.o \
$(BUILD_DIR)/asm/dolphin/os/OSAlarm.o \
$(BUILD_DIR)/asm/dolphin/os/OSAlloc.o \
$(BUILD_DIR)/asm/dolphin/os/OSArena.o \
$(BUILD_DIR)/asm/dolphin/os/OSAudioSystem.o \
$(BUILD_DIR)/asm/dolphin/os/OSCache.o \
$(BUILD_DIR)/asm/dolphin/os/OSContext.o \
$(BUILD_DIR)/asm/dolphin/os/OSError.o \
$(BUILD_DIR)/asm/dolphin/os/OSExi.o \
$(BUILD_DIR)/asm/dolphin/os/OSInterrupt.o \
$(BUILD_DIR)/asm/dolphin/os/OSLink.o \
$(BUILD_DIR)/asm/dolphin/os/OSMemory.o \
$(BUILD_DIR)/asm/dolphin/os/OSMutex.o \
$(BUILD_DIR)/asm/dolphin/os/OSReboot.o \
$(BUILD_DIR)/asm/dolphin/os/OSReset.o \
$(BUILD_DIR)/asm/dolphin/os/OSResetSW.o \
$(BUILD_DIR)/asm/dolphin/os/OSRtc.o \
$(BUILD_DIR)/asm/dolphin/os/OSSerial.o \
$(BUILD_DIR)/asm/dolphin/os/OSStopwatch.o \
$(BUILD_DIR)/asm/dolphin/os/OSSync.o \
$(BUILD_DIR)/asm/dolphin/os/OSThread.o \
$(BUILD_DIR)/asm/dolphin/os/OSTime.o \
$(BUILD_DIR)/asm/dolphin/os/OSUartExi.o \
$(BUILD_DIR)/src/dolphin/os/init/__start.o \
$(BUILD_DIR)/src/dolphin/os/init/__ppc_eabi_init.o \
$(BUILD_DIR)/asm/dolphin/db/db.o \
$(BUILD_DIR)/asm/dolphin/mtx/mtx.o \
$(BUILD_DIR)/asm/dolphin/mtx/mtxvec.o \
$(BUILD_DIR)/asm/dolphin/mtx/mtx44.o \
$(BUILD_DIR)/asm/dolphin/mtx/vec.o \
$(BUILD_DIR)/asm/dolphin/dvd/dvdlow.o \
$(BUILD_DIR)/asm/dolphin/dvd/dvdfs.o \
$(BUILD_DIR)/asm/dolphin/dvd/dvd.o \
$(BUILD_DIR)/asm/dolphin/dvd/dvdqueue.o \
$(BUILD_DIR)/asm/dolphin/dvd/dvderror.o \
$(BUILD_DIR)/asm/dolphin/dvd/emu_level2/fstload.o \
$(BUILD_DIR)/asm/dolphin/vi/vi.o \
$(BUILD_DIR)/asm/dolphin/pad/Padclamp.o \
$(BUILD_DIR)/asm/dolphin/pad/Pad.o \
$(BUILD_DIR)/asm/dolphin/ai/ai.o \
$(BUILD_DIR)/asm/dolphin/ar/ar.o \
$(BUILD_DIR)/asm/dolphin/ar/arq.o \
$(BUILD_DIR)/asm/dolphin/dsp/dsp.o \
$(BUILD_DIR)/asm/dolphin/dsp/dsp_debug.o \
$(BUILD_DIR)/asm/dolphin/dsp/dsp_task.o \
$(BUILD_DIR)/asm/dolphin/gx/GXInit.o \
$(BUILD_DIR)/asm/dolphin/gx/GXFifo.o \
$(BUILD_DIR)/asm/dolphin/gx/GXAttr.o \
$(BUILD_DIR)/asm/dolphin/gx/GXMisc.o \
$(BUILD_DIR)/asm/dolphin/gx/GXGeometry.o \
$(BUILD_DIR)/asm/dolphin/gx/GXFrameBuf.o \
$(BUILD_DIR)/asm/dolphin/gx/GXLight.o \
$(BUILD_DIR)/asm/dolphin/gx/GXTexture.o \
$(BUILD_DIR)/asm/dolphin/gx/GXBump.o \
$(BUILD_DIR)/asm/dolphin/gx/GXTev.o \
$(BUILD_DIR)/asm/dolphin/gx/GXPixel.o \
$(BUILD_DIR)/asm/dolphin/gx/GXStubs.o \
$(BUILD_DIR)/asm/dolphin/gx/GXDisplayList.o \
$(BUILD_DIR)/asm/dolphin/gx/GXTransform.o \
$(BUILD_DIR)/asm/dolphin/gx/GXPerf.o

MUSYX := \
$(BUILD_DIR)/asm/musyx/seq.o \
$(BUILD_DIR)/asm/musyx/synth.o \
$(BUILD_DIR)/asm/musyx/seq_api.o \
$(BUILD_DIR)/asm/musyx/snd_synthapi.o \
$(BUILD_DIR)/asm/musyx/stream.o \
$(BUILD_DIR)/asm/musyx/synthdata.o \
$(BUILD_DIR)/asm/musyx/synthmacros.o \
$(BUILD_DIR)/asm/musyx/synthvoice.o \
$(BUILD_DIR)/asm/musyx/synth_ac.o \
$(BUILD_DIR)/asm/musyx/synth_adsr.o \
$(BUILD_DIR)/asm/musyx/synth_dbtab.o \
$(BUILD_DIR)/asm/musyx/s_data.o \
$(BUILD_DIR)/asm/musyx/hw_dspctrl.o \
$(BUILD_DIR)/asm/musyx/hw_volconv.o \
$(BUILD_DIR)/asm/musyx/snd3d.o \
$(BUILD_DIR)/asm/musyx/snd_init.o \
$(BUILD_DIR)/asm/musyx/snd_math.o \
$(BUILD_DIR)/asm/musyx/snd_midictrl.o \
$(BUILD_DIR)/asm/musyx/snd_service.o \
$(BUILD_DIR)/asm/musyx/hardware.o \
$(BUILD_DIR)/asm/musyx/hw_aramdma.o \
$(BUILD_DIR)/asm/musyx/hw_dolphin.o \
$(BUILD_DIR)/asm/musyx/hw_memory.o \
$(BUILD_DIR)/asm/musyx/dsp_import.o \
$(BUILD_DIR)/asm/musyx/reverb_fx.o \
$(BUILD_DIR)/asm/musyx/reverb.o \
$(BUILD_DIR)/asm/musyx/chorus_fx.o


METROTRK := \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/mainloop.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/nubevent.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/nubinit.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/msg.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/msgbuf.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/serpoll.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Os/dolphin/usr_put.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/dispatch.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/msghndlr.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/support.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/mutex_TRK.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/notify.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Processor/ppc/Generic/flush_cache.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/mem_TRK.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Processor/ppc/Generic/__exception.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Processor/ppc/Generic/targimpl.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Os/dolphin/dolphin_trk.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Processor/ppc/Generic/mpc_7xx_603e.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Portable/main_TRK.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Os/dolphin/dolphin_trk_glue.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MetroTRK/Os/dolphin/targcont.o

RUNTIME := \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/Runtime/__mem.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/Runtime/__va_arg.o \
$(BUILD_DIR)/src/PowerPC_EABI_Support/Runtime/global_destructor_chain.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/Runtime/NMWException.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/Runtime/ExceptionPPC.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/Runtime/runtime.o \
$(BUILD_DIR)/src/PowerPC_EABI_Support/Runtime/__init_cpp_exceptions.o

MSL_C := \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/abort_exit.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/ansi_files.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/ansi_fp.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/buffer_io.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/PPC_EABI/critical_regions.ppc_eabi.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/ctype.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/direct_io.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/mbstring.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/mem.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/mem_funcs.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/misc_io.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/printf.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/string.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/uart_console_io.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common/wchar_io.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/Math/Double_precision/s_frexp.o \
$(BUILD_DIR)/src/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/Math/Single_precision/hyperbolicsf.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/Math/Single_precision/inverse_trig.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/Math/Single_precision/trigf.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/Math/Single_precision/common_float_tables.o \
$(BUILD_DIR)/asm/PowerPC_EABI_Support/MSL_C/MSL_Common_Embedded/Math/Single_precision/exponentialsf.o

NDEV := \
$(BUILD_DIR)/asm/dolphin/amcstubs/AmcExi2Stubs.o \
$(BUILD_DIR)/asm/dolphin/OdemuExi2/DebuggerDriver.o \
$(BUILD_DIR)/asm/dolphin/odenotstub/odenotstub.o
