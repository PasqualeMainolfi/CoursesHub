<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

// y(t) = Ac(1 + m sin(wmt))sin(wct)

opcode AM, a, kkkkk
kamp, kfc, kdc, km, kfm xin

awc = 2 * $M_PI * phasor:a(kfc)
awm = 2 * $M_PI * phasor:a(kfm)

ay = kamp * (kdc + km * sin(awm)) * sin(awc)

xout(ay / 2)
endop


opcode osc_am, a, aak
apor, amod, kdc xin
ay = (apor * (kdc + amod)) / 2
xout(ay)
endop


; gienv = ftgen(1, 0, 2049, 5, .001, 48, 1, 2000, .001)


instr 1

kinv = expseg(.001, .01, 1, p3 - .01, .0001)

kamp = 0.5
kdc = 1
km = 1

kfm, kfc = p5, p6

amod = poscil(km * kinv, kfm)
apor = poscil(kamp, kfc)

ay = osc_am(apor, amod, 1)

amod2 = poscil(km * kinv, kfm * 3.4)
ay = osc_am(ay, amod2, 1)


ktndx = phasor(expseg(3, p3 / 2, p4, p3 / 2, 3))
ktinv = tablei(ktndx, 1, 1)

; ay *= ktinv

; ay = AM(kinv * kamp, kfc, kdc, kinv, kfm)

; ay *= ax

outs(ay, ay)

endin




</CsInstruments>
<CsScore>

f 1 0 2049 5 .001 48 1 2000 .000001

t0 60

i 1 0 10 15 200 100

</CsScore>
</CsoundSynthesizer>