<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

#define PORT #8969#
#define IP #"127.0.0.1"#

opcode open_audio_file, a, S
Spath xin

ichn = filenchnls(Spath)

if ichn == 1 then
    asig diskin2 Spath, 1, 0, 0
else
    al, ar diskin2 Spath, 1, 0, 0
    asig = (al + ar) / 2
endif

xout(asig)
endop



instr 1

Spath = "/Users/pm/AcaHub/AudioSamples/piano_samples/piano_loop1.wav"
asig = open_audio_file(Spath)

krms = rms(asig)

OSCsend(krms, "127.0.0.1", 8969, "/test", "f", krms)

outs(asig, asig)

endin




</CsInstruments>
<CsScore>

i 1 0 30

</CsScore>
</CsoundSynthesizer>