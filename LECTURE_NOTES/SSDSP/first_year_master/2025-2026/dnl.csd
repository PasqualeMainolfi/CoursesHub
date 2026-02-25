<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

instr 1
    piano_sig:a init 0
    pathfile:S = "/Users/pm/AcaHub/AudioSamples/piano_samples/piano_loop1.wav"
    piano:a = diskin2(pathfile,  1, 0, 1, 0)

    // pre process
    piano_sig = delay(piano_sig * 0.7 + piano, 3000 / sr)
    amp_amount:k = linseg(1, p3 / 3, 30, p3 - (p3 / 3), 0.1)
    sample:k = downsamp(piano_sig) * amp_amount
    if sample <= -1 then
        sample = -2.0 / 3.0
    elseif sample >= 1 then
        sample = 2.0 / 3.0
    else
        sample = sample - pow(sample, 3) / 3
    endif

    p_sample:a = interp(sample)
    p_sample = tone(p_sample, 700)

    sig_out:a = piano_sig * 0.05 + p_sample * 0.7
    // post process

    out(sig_out, sig_out)
endin

</CsInstruments>
<CsScore>
i 1 0 15

</CsScore>
</CsoundSynthesizer>
