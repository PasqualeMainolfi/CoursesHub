<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1


opcode fm, a, kkik
kfc, kac, ir, km xin

itwopi = 2 * $M_PI

// modulator
kfm = kfc / ir
awmt = phasor:a(kfm) * itwopi
kdeltaf = km

// carrier phase
awct = phasor:a(kfc) * itwopi

// modulated signal
amodulated = kac * sin(awct + kdeltaf * sin(awmt))

xout(amodulated)
endop


instr 1 

kinv = expseg:k(.001, .01, 1, p3 - .01, .001)

kfc = p4
kac = 0.707 * kinv
iratio = 2 / 5
km = 1.5 * kinv

ay = fm(kfc, kac, iratio, km)
; kfm = kfc / iratio
; ay = poscil(kac, kfc + poscil(km * kfm, kfm))


outs(ay, ay)

endin

</CsInstruments>
<CsScore>

i 1 0 10 90
i 1 3 10 50
i 1 5 10 120

</CsScore>
</CsoundSynthesizer>