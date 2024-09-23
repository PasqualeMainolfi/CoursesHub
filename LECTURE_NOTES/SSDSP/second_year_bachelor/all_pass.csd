<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

opcode ap, a, aii
asig, idel, ig xin

adel delayr idel
afb = adel + asig * -ig
delayw(afb + asig * ig)

xout(afb)
endop

gar init 0


instr 1

asig = rand(1)
kinv = expseg(.001, .001, 1, p3 - .001, .0001)
asig *= kinv

asig = butbp(asig, 250, 100)

outs(asig, asig)
gar += asig * 0.707
endin

instr 2 
asig = gar
clear(gar)

aout init 0
ain = aout + 0.7 * asig
ap1 = delay(ain, 0.030)
ap2 = ap(ap1, 0.022, .78)
ap3 = ap(ap2, 0.0083, .81)

aout = ap3 + asig * -0.7
outs(aout, aout)

endin



</CsInstruments>
<CsScore>

i 1 0 1
i 2 0 30


</CsScore>
</CsoundSynthesizer>