<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

rev@global:a = init(0)

instr 1
    noise:a = rand(0.5)
    noise = expseg:a(0.001, 0.01, 1, p3 - 0.01, 0.0001) * noise
    out(noise, noise)

    rev = rev + (noise * 0.3)

endin

instr Reverb

    // y[n] = b0x[n] + bMx[n - M]
    // y[n] = b0x[n] + bMy[n - M]

    del_samples:i = 128 // delay in samples
    del_seconds:i = del_samples / sr
    g:i = 10^(-3 * del_seconds / p3)

    delayed_signal:a = init(0)
    delayed_signal = delay(rev + tone(delayed_signal * g, 5000), del_seconds)

    out(delayed_signal, delayed_signal)

    clear(rev)


endin


</CsInstruments>
<CsScore>

i "Reverb" 0 5

i 1 0 0.5

</CsScore>
</CsoundSynthesizer>
