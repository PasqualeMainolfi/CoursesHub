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
AMPLITUDE MODULATION

y = Ap (1 + m * sin(wmt)) sin(wpt)

params:
Ap = carrier amplitude
m = modulation index 0 <= m <= 1
wm = modulation frequency
wc = carrier frequency
*/

#define TWOPI # 2.0 * $M_PI #


opcode AM, a, kkkkk
kcfreq, kcamp, km, kmfreq, koffset xin
kwct = phasor:a(kcfreq) * $TWOPI // angular freq
kwmt = phasor:a(kmfreq) * $TWOPI // angular freq
ay = kcamp * (koffset + km * sin(kwmt)) * sin(kwct) // modulated signal
xout(ay)
endop

instr 1 

kfc = 220
kac = 0.707
im = 0.5
kfm = 300

asig = AM(kfc, kac, expseg:k(0.001, 0.01, 0.5, p3 - 0.01, 0.001), kfm, 0.5)

outs(asig, asig)

endin

instr 2 

amod = poscil(0.5, 1000)
asig1 = poscil(0.5 + amod, 220)
asig2 = poscil(0.5 + asig1 / 2, 360)

outs(asig2, asig2)

endin

opcode open_file, a, S
Spath xin

ic = filenchnls(Spath)

ay = 0.0
if (ic == 1) then
    ay diskin2 Spath, 1, 0, 1
else 
    al, ar diskin2 Spath, 1, 0, 1
    ay = (al + ar) / 2.0
endif

xout(ay)
endop


instr 3
apor = open_file("/Users/pm/AcaHub/AudioSamples/HelloWorld.wav")
amod = open_file("/Users/pm/AcaHub/AudioSamples/cane.wav")
ay = (apor * amod) * 5
outs(ay, ay)
endin



</CsInstruments>
<CsScore>

i 3 0 5


</CsScore>
</CsoundSynthesizer>