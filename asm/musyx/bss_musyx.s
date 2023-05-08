.include "macros.s"

.section .bss, "", @nobits  # 0x8006D1C0 - 0x800A8A80 ; 0x0003B8C0


seqNote:
	.skip 0x1400

.global seqInstance
seqInstance:
	.skip 0xBD20

.global seqMIDIPriority
seqMIDIPriority:
	.skip 0x100

synthTicksPerSecond:
	.skip 0x240

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

streamInfo:
	.skip 0x1800

dataSmpSDirs:
	.skip 0x600

dataCurveTab:
	.skip 0x4000

dataKeymapTab:
	.skip 0x800

dataLayerTab:
	.skip 0xC00

dataMacMainTab:
	.skip 0x800

dataMacSubTabMem:
	.skip 0x4000

dataFXGroups:
	.skip 0x400

"key$568":
	.skip 0x20

"key$604":
	.skip 0xC

"key$612":
	.skip 10

.skip 2

"newsmp$412":
	.skip 0x20

vidList:
	.skip 0x800

synth_last_started:
	.skip 0x80

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

gs:
	.skip 0x400

.global dspStudio
dspStudio:
	.skip 0x5E0

"voices$345":
	.skip 0x100

"tmp_em$514":
	.skip 0x50

startGroup:
	.skip 0x180

startListNum:
	.skip 0x380

runList:
	.skip 0x180

"em$893":
	.skip 0x50

midi_lastNote:
	.skip 0x80

fx_lastNote:
	.skip 0x40

midi_ctrl:
	.skip 0x4300

fx_ctrl:
	.skip 0x2180

midi_portstate:
	.skip 0x80

fx_portstate:
	.skip 0x40

inpGlobalMIDIDirtyFlags:
	.skip 0x200

inpChannelDefaults:
	.skip 0x80

inpFXChannelDefaults:
	.skip 0x40

aramQueue:
	.skip 0x200

aramStreamBuffers:
	.skip 0x400

.skip 0x18

dsp_task:
	.skip 0x50

.skip 0x10

dram_image:
	.skip 0x2000