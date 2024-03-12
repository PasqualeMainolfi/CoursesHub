<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

opcode fm, a, kka
kaop, kfop, amod xin
aout = poscil(kaop, kfop + amod)
xout(aout)
endop

seed(0)

instr patch_22


kampp = p4
kfp = p5

iatk = 0.01
idec = 0.05
isus = 0.20
irel = p3 - (iatk + idec + isus)

kinvp = expseg(.0001, iatk, .95, idec, .8, isus, .8, irel, .0001)


kratio[] = fillarray(p7, p9)
kamps[] = fillarray(p6, p8)

iatkm = 0.05
idecm = 0.1
isusm = 0.1
irelm = p3 - (iatkm + idecm + isusm)

kinvm = expseg(.0001, iatkm, .9, idecm, .7, isusm, .7, irelm, .0001)

kf2 = kfp / kratio[0]
aop2 = poscil(kamps[0] * kinvm * kf2, kf2)
aop1 = fm(kampp * kinvp, kf2, aop2)


aop6 init 0

kf1, kf2, kf3 = kfp * random(0.5, 2), kfp * random(0.5, 2), kfp * random(0.5, 2)

kf6 = ((kf1 + kf2 + kf3) / 3) / kratio[1]
aop6 = fm(kamps[1] * kf6, kf6, aop6)
aop3 = fm(kampp * kinvp, kf1, aop6)
aop4 = fm(kampp * kinvp, kf2, aop6)
aop5 = fm(kampp * kinvp, kf3, aop6)

aout = (aop1 + aop3 + aop4 + aop5) / 4

outs(aout, aout)
endin


instr patch_30

aop5 init 0

kampp = p4
kfp = p5

iatk = 0.01
idec = 0.05
isus = 0.20
irel = p3 - (iatk + idec + isus)
; kinvp = expseg(.001, .0001, 1, p3 - .0001, .001)
kinvp = expseg(.0001, iatk, .95, idec, .8, isus, .8, irel, .0001)

kratio[] = fillarray(p7, p9)
kamps[] = fillarray(p6, p8)

iatkm = 0.05
idecm = 0.1
isusm = 0.1
irelm = p3 - (iatkm + idecm + isusm)
kinvm = expseg(.0001, iatkm, .9, idecm, .7, isusm, .7, irelm, .0001)
; kinvm = expseg(1, p3, .001)


kf5 = kfp / kratio[0]
aop5 = fm(kamps[0] * kf5, kf5, aop5)
kf4 = kfp / kratio[1]
aop4 = fm(kamps[1] * kf4 * kinvm, kf4, aop5)

 
aop1 = poscil(kampp, kfp + 100)
aop2 = poscil(kampp, kfp + 120)
aop3 = fm(kampp * kinvp, kfp, aop4)
aop6 = poscil(kampp, kfp + 78)
 
aout = (aop1 + aop2 + aop3 + aop6) / 4

aout *= kinvp

outs(aout, aout)

endin


</CsInstruments>
<CsScore>

i "patch_22" 0 5 .6 440 .7 1 .4 1
; i "patch_30" 0 5 .6 440 1.8 0.3 0.3 1
//i 3 10 15 .6 440 .7 1 .4 1 .5 7 .6 8

</CsScore>
</CsoundSynthesizer>