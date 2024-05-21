<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

#define FILEPATH #"suzanne_mono.wav"#


gigauss = ftgen(0, 0, 16385, 20, 2)
giperc = ftgen(0, 0, 16385, -5, .001, 40, 1, 16344, .0001)

gifile_tab = ftgen(0, 0, 0, 1, $FILEPATH, 0, 4, 1)

seed(0)

gabus1 init 0
gabus2 init 0


instr CONSTRUCTOR

schedule("CLOUD", 0, p3)

update:
    // parametri di sintesi
    ifreqmin, ifreqmax = p4, p5
    ifreq = random:i(ifreqmin, ifreqmax)
    iampmin, iampmax = ampdb(p6), ampdb(p7)
    iamp = random:i(iampmin, iampmax)
    ipanmin, ipanmax = p8, p9
    ipan = random:i(ipanmin, ipanmax)
    idurmin, idurmax = p10, p11
    idur = random:i(idurmin, idurmax)

    idelmin, idelmax = p12, p13
    idel = random:i(idelmin, idelmax)

        timout(0, idel, goo)
        reinit update

goo:
    // schedulatore 
    schedule("GRAIN", 0, idur, ifreq, iamp, ipan)

endin

instr GRAIN

aindex = phasor:a(1 / p3)
aenv = tablei:a(aindex, giperc, 1)

ifm = p4 / random:i(0.1, 3)
im = .7
amod = aenv * poscil(im * ifm, ifm)
agrain = poscil(p5, p4 + amod)

ay = agrain * aenv

aleft = ay * sqrt(p6)
aright = ay * sqrt(1 - p6)

gabus1 += aleft
gabus2 += aright

endin


instr CLOUD

aindex = phasor:a(1 / p3)
aenv = tablei:a(aindex, gigauss, 1)

aleft = aenv * gabus1
aright = aenv * gabus2

aleft, aright freeverb aleft, aright, linseg:k(0.7, p3 / 2, 0.01), 0.7


outs(aleft, aright)
clear(gabus1, gabus2)

endin


instr SAMPLE_CONSTRUCTOR

ispeed init 4
istep = ispeed / 10
update:

    idur = random:i(1, 3)
    idur_ceil = ceil(idur * sr)
    iphase_start = random:i(0, ftlen(gifile_tab) - idur_ceil)
    idel = random:i(0.001, 0.7)

        timout(0, idel, goo)
        reinit update

goo:
    // schedulatore 
    schedule("SAMPLE_GRAIN", 0, idur_ceil / sr, idur_ceil, iphase_start, ispeed)
    ispeed -= istep

endin



instr SAMPLE_GRAIN

ksi init 0
kii init 0
if (kii < p4) then
    asig = tablei:a(interp((ksi + p5) % ftlen(gifile_tab)) , gifile_tab)
    kii += 1
    ksi += p6 + poscil(0.5, 100)
endif

asig *= tablei:a(phasor:a(1 / p3), giperc, 1) * ampdb(-6) // add env

outs(asig, asig)

endin



</CsInstruments>
<CsScore>

; #include "grain.sco"

i "SAMPLE_CONSTRUCTOR" 0 10


</CsScore>
</CsoundSynthesizer>