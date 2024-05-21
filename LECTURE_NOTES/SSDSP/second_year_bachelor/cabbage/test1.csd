<Cabbage> bounds(0, 0, 0, 0)
form caption("Untitled") size(400, 300), guiMode("queue"), pluginId("def1")

rslider bounds(16, 12, 60, 60) channel("amp") range(0, 1, 0, 1, 0.001)
rslider bounds(114, 10, 60, 60) channel("freq") range(50, 10000, 220, 1, 1)
soundfiler bounds(22, 78, 300, 200)
</Cabbage>
-o
<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1


instr 1

kamp = cabbageGetValue("amp")
kamp = portk(kamp, 0.001)
kfreq = cabbageGetValue("freq")
kfreq = portk(kfreq, 0.001)

asig = poscil(kamp, kfreq)

outs(asig, asig)
endin

</CsInstruments>
<CsScore>

i 1 0 3600
</CsScore>
</CsoundSynthesizer>
