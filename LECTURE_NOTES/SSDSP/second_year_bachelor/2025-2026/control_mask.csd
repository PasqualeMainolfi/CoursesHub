<CsoundSynthesizer>
<CsOptions>

-o dac

</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

seed(0)
instr 1
    noise:a = rand(5)
    sig:a = butterbp(noise, 120, 3)
    sig = butterbp(sig, 120, 3)

    sig = poscil(1.0 * poscil(0.7, 5 + (sig * 1000)), 70)
    out(sig, sig)
endin


</CsInstruments>
<CsScore>

i 1 0 10

</CsScore>
</CsoundSynthesizer>
