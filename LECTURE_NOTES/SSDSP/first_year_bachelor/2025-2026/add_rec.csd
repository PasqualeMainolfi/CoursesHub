<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
nchnls_i = 1
0dbfs = 1

seed(0)

opcode rec_additive, a, kkio
    freq:k, amp:k, num:i, count:i xin
    rnd_factor:i = random(count, count + 2)
    sig:a = poscil(amp / rnd_factor, freq * rnd_factor) / num
    if count < num then
        sig_rec:a = rec_additive(freq, amp, num, count + 1)
    endif
    xout(sig + sig_rec)
endop


instr 1

    sig_add:a = rec_additive(p4, p5, p6) * expseg(.001, .01, 1, p3 - .01, .0001)
    out(sig_add, sig_add)

endin

</CsInstruments>
<CsScore>

t0 120

i 1 0 5 400 0.7 10
i 1 1 10 190 0.5 5
i 1 3 3 500 1.0 30

</CsScore>
</CsoundSynthesizer>
