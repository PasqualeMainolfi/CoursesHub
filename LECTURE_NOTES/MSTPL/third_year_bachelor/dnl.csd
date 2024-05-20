<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

/*
SOFT CLIPPER
x <= -1 -> -2 / 3
-1 <= x <= +1 -> (3/2) * (x - x^3 / 3)
x >= +1 -> 2 / 3
*/



#define AUDIO_PATH #"/Users/pm/AcaHub/Coding/Qubx/QubxPython/audio_files_for_test/suzanne_mono.wav"#

instr 1 

asig diskin2 $AUDIO_PATH, 1, 0, 0

ksample = downsamp(asig * 100) 
if (ksample <= -1) then
    ksample = -2 / 3
elseif (ksample >= 1) then 
    ksample = 2 / 3
else
    ksample = ksample - pow:k(ksample, 3) / 3
endif

asig = interp(ksample)
asig = tone(tone(asig, poscil:a(250, 0.5)), 150)
outs(asig, asig)
endin





</CsInstruments>
<CsScore>

i 1 0 60

</CsScore>
</CsoundSynthesizer>