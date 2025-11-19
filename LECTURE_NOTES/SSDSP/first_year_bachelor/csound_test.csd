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

amp:i = ampdb(-6)
freq:i = 220
sine:a = poscil(amp, freq)

outs(sine, sine)

endin






</CsInstruments>
<CsScore>

i 1 0 10

</CsScore>
</CsoundSynthesizer>