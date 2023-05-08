.include "macros.s"

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80 ; 0x0003B8C0


.global seqNote
seqNote:
	.skip 0x1400

.global seqInstance
seqInstance:
	.skip 0xBD20

.global seqMIDIPriority
seqMIDIPriority:
	.skip 0x100

.global synthTicksPerSecond
synthTicksPerSecond:
	.skip 0x240

.global synthJobTable
synthJobTable:
	.skip 0x180

.global synthInfo
synthInfo:
	.skip 0x214

.global synthMasterFader
synthMasterFader:
	.skip 0x600

.global synthTrackVolume
synthTrackVolume:
	.skip 0x40

.global synthAuxAUser
synthAuxAUser:
	.skip 0x10

.global synthAuxACallback
synthAuxACallback:
	.skip 0x10

.global synthAuxBUser
synthAuxBUser:
	.skip 0x10

.global synthAuxBCallback
synthAuxBCallback:
	.skip 0x10

.global synthGlobalVariable
synthGlobalVariable:
	.skip 0x40

.global inpAuxB
inpAuxB:
	.skip 0x240

.global inpAuxA
inpAuxA:
	.skip 0x240

.skip 4

.global streamInfo
streamInfo:
	.skip 0x1800

.global dataSmpSDirs
dataSmpSDirs:
	.skip 0x600

.global dataCurveTab
dataCurveTab:
	.skip 0x4000

.global dataKeymapTab
dataKeymapTab:
	.skip 0x800

.global dataLayerTab
dataLayerTab:
	.skip 0xC00

.global dataMacMainTab
dataMacMainTab:
	.skip 0x800

.global dataMacSubTabMem
dataMacSubTabMem:
	.skip 0x4000

.global dataFXGroups
dataFXGroups:
	.skip 0x400

.global "key$568"
"key$568":
	.skip 0x20

.global "key$604"
"key$604":
	.skip 0xC

.global "key$612"
"key$612":
	.skip 10

.skip 2

.global "newsmp$412"
"newsmp$412":
	.skip 0x20

.global vidList
vidList:
	.skip 0x800

.global synth_last_started
synth_last_started:
	.skip 0x80

.global synth_last_fxstarted
synth_last_fxstarted:
	.skip 0x40

.global voicePrioSortVoices
voicePrioSortVoices:
	.skip 0x100

.global voicePrioSortVoicesRoot
voicePrioSortVoicesRoot:
	.skip 0x100

.global voicePrioSortRootList
voicePrioSortRootList:
	.skip 0x400

.global voiceList
voiceList:
	.skip 0x100

.global gs
gs:
	.skip 0x400

.global dspStudio
dspStudio:
	.skip 0x5E0

.global "voices$345"
"voices$345":
	.skip 0x100

.global "tmp_em$514"
"tmp_em$514":
	.skip 0x50

.global startGroup
startGroup:
	.skip 0x180

.global startListNum
startListNum:
	.skip 0x380

.global runList
runList:
	.skip 0x180

.global "em$893"
"em$893":
	.skip 0x50

.global midi_lastNote
midi_lastNote:
	.skip 0x80

.global fx_lastNote
fx_lastNote:
	.skip 0x40

.global midi_ctrl
midi_ctrl:
	.skip 0x4300

.global fx_ctrl
fx_ctrl:
	.skip 0x2180

.global midi_portstate
midi_portstate:
	.skip 0x80

.global fx_portstate
fx_portstate:
	.skip 0x40

.global inpGlobalMIDIDirtyFlags
inpGlobalMIDIDirtyFlags:
	.skip 0x200

.global inpChannelDefaults
inpChannelDefaults:
	.skip 0x80

.global inpFXChannelDefaults
inpFXChannelDefaults:
	.skip 0x40

.global aramQueue
aramQueue:
	.skip 0x200

.global aramStreamBuffers
aramStreamBuffers:
	.skip 0x400

.skip 0x18

.global dsp_task
dsp_task:
	.skip 0x50

.skip 0x10

.global dram_image
dram_image:
	.skip 0x2000