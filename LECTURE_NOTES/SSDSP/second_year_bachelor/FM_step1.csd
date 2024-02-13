<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1


opcode FM, a, kkik
kfc, kac, ir, km xin

i2pi = 2 * $M_PI
kfm = kfc / ir

awmt = phasor:a(kfm) * i2pi
amod = km * sin(awmt)

awct = phasor:a(kfc) * i2pi
ay = kac * sin(awct + amod)

xout(ay)
endop



instr 1

kfreq = 150
kamp = 0.9
iratio = 1 / 2
km = 2

kinv = expseg(.001, p3 / 2, 1, p3 / 2, .001)
km *= kinv

asig = FM(kfreq, kamp, iratio, km)
asig *= kinv
outs(asig, asig)
endin




</CsInstruments>
<CsScore>

i 1 0 1


</CsScore>
</CsoundSynthesizer>