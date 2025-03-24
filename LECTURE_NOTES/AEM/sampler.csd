<CsoundSynthesizer>
<CsOptions>
-o dac4
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
nchnls_i = 1
0dbfs = 1

// time_skip, time_end

gitrack0 = ftgen(0, 0, 0, 1, "/Users/pm/AcaHub/AudioSamples/HelloWorld.wav", 0, 0, 0)

instr 1

Spath ="/Users/pm/AcaHub/AudioSamples/HelloWorld.wav"
; idur = itime_end - itime_skip
aframe diskin2 Spath, 1, 0, 0

outs(aframe, aframe)

p3 += filelen(Spath)
endin

instr 2
itot_dur = 0
ii = 0
ip2 = 0
Sscore = ""
while ii < 10 do

    istart = random(10000, ftlen(gitrack0) / 2) / sr
    iend =  istart + (random(5000, ftlen(gitrack0) / 2) / sr)
    idur = iend - istart

    Sline = sprintf("i 3 %.3f %.3f %.3f %.3f \n", ip2, idur, istart, iend)
    Sscore = strcat(Sscore, Sline)
    ip2 += random(0.5, 1.2)
    itot_dur += ip2
    ii += 1
od

puts(Sscore, 1)
scoreline_i(Sscore)

p3 += ip2
endin


instr 3

idif = p5 -  p4

idur = idif
ifreq = 1 / (ftlen(gitrack0) / sr)
andx = phasor:a(ifreq) + ((p4 * sr) / ftlen(gitrack0))
asample = tablei(andx, gitrack0, 1)
asample *= linseg(0, 0.01, 1, p3 - 0.02, 1, 0.01, 0)

outs(asample, asample)

endin







</CsInstruments>
<CsScore>

; i 1 0 0.1
i 2 0 0.01
</CsScore>
</CsoundSynthesizer>