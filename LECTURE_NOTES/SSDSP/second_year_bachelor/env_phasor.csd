<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1



instr 1

asig diskin2 "bell.wav", 1, 0, 1

kndx_ramp = linseg(1, p3 / 2, 100, p3 / 2, 1)
kndx = phasor(kndx_ramp / p3)
kenv = tablei(kndx, 1, 1)

kenv_guard = expseg(.001, 0.5, 1, p3 - 1, 1, 0.5, 0.001)

asig *= kenv
asig *= kenv_guard

outs(asig, asig)



endin






</CsInstruments>
<CsScore>

f 1 0 2049 5 .001 48 1 2000 .000001

i 1 0 10


</CsScore>
</CsoundSynthesizer>