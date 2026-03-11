<CsoundSynthesizer>
<CsOptions>
-o dac0
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

freqs@global:i = ftgen(0, 0, 5, -2, 60, 63, 64, 65, 66)
percussive_env@global:i = ftgen(0, 0, 2048, 5, .001, 24, 1, 2024, .0001)
//                                               ^ ->    ^ ->       ^
// 2048 -> 44100 -> 44100 / 2048 = 22 (1 sample da tab) 22 * 24 / 44100 = 0.011
// 24 : 2048 = x : 1 = 24 * 1 / 2048 = 0.011 | 3 / 256

instr 1

    period:k = expseg:k(500, p3 / 2, 10, p3 / 2, 10) / p3
    notes:k = tablei(phasor(period), freqs, 1)
    env:k = tablei(phasor(period), percussive_env, 1)
    atk:i = 0.011 * p3
    rel:i = p3 - atk
    env_inline:k = expseg(0.001, atk, 1, rel, 0.001)
    sig:a = poscil(0.707, mtof(70)) * env

    out(sig, sig)

endin




</CsInstruments>
<CsScore>

i 1 0 5

</CsScore>
</CsoundSynthesizer>
