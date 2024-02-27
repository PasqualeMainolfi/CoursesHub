<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1


opcode fm, a, kka
kacar, kfcar, amod xin
ay = poscil(kacar, kfcar + amod)
xout(ay)
endop


instr 1

iatk = 0.01
idec = 0.001
isus = 0.15
irel = p3 - (iatk + idec + isus)
kinv = expseg(.0001, iatk, 1, idec, .91, isus, .91, irel, .0001)

kratio[] = fillarray(p7, p9, p11, p13, p15, p17)
kamps[] = fillarray(p6, p8, p10, p12, p14, p16)

kcar1 = p4
kcar2 = p5

kf2 = kcar1 / kratio[1]
aop2 = poscil(kamps[1] * kf2 * kinv, kf2)
aop1 = fm(kamps[0] * kinv, kcar1, aop2)

aop6 init 0
kf5 = kcar2 / kratio[5]
aop6 = fm(kamps[5] * kf5 * kinv, kf5, aop6)
kf4 = kcar2 / kratio[4]
aop5 = fm(kamps[4] * kf4 * kinv, kf4, aop6)
kf3 = kcar2 / kratio[3]
aop4 = fm(kamps[3] * kf3 * kinv, kf3, aop5)
aop3 = fm(kamps[2] * kinv, kcar2, aop4)

ay = (aop1 + aop3) / 2

outs(ay, ay)

endin


</CsInstruments>
<CsScore>

// Algo 1
i 1 0 1 120 150     0.7 0   0.6 0.3     1.2 0   0.57 0.9    1.2 2.1     1.4 1.6

</CsScore>
</CsoundSynthesizer>