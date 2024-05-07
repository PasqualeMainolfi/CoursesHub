<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

#define PATH #"suzanne.wav"#

gabus init 0

instr 1

asig diskin2 $PATH, 1, 0, 0

ig = 0.9
ay init 0
ay = delay(asig + ig * ay, 1)

outs(ay, ay)

endin


instr 2
asig = poscil(0.707, 120) * expseg(.001, .01, 1, p3 - 0.001, .0001)
outs(asig, asig)
gabus += asig
endin


instr 3

idel = 0.5
ig = pow(10, -3 * idel / p3)
adel delayr idel
delayw(gabus + ig * adel)
outs(adel, adel)
clear(gabus)
endin


</CsInstruments>
<CsScore>

i 2 0 .5
i 3 0 5

</CsScore>
</CsoundSynthesizer>