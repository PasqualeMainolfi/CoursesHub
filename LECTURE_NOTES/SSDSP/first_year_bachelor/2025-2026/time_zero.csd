<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
nchnls_i = 1
0dbfs = 1

seed(0)
instr 1

    ratio:i = p4 * p7 / 100
    random_value:i = random(-ratio, ratio)
    freq:i = p4 + random_value
    prints("[freq]: %.3f\n", freq)
    sig:a = poscil(p5, freq, p6)
    read_index:k = phasor(1 / p3)
    env:k = tablei(read_index, p8, 1)
    ; env:k = expseg(0.001, 0.01, 1, p3 - 0.01, 0.0001)
    sig *= env
    out(sig, sig)

endin

</CsInstruments>
<CsScore>

f 1 0 4097 10 1 0.5 0.333
f 2 0 4097 10 1 0 0.333 0 0.125
f 3 0 4097 10 0 0.7 0 0.25

f 4 0 2049 5 0.001 28 1 [2049 - 28] 0.0001
f 5 0 2049 5 0.001 1024 1 1024 0.0001

i 1 0 5 440 0.707   1 5     4
i 1 1 5 220 0.5     2 10    5
i 1 3 5 700 0.1     3 50    5

</CsScore>
</CsoundSynthesizer>
