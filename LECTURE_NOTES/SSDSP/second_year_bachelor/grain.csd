<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1


instr Master

inum_grains = p4
Score = ""

istart init 0.0

ii = 0
while ii < inum_grains do 
    idur = random(0.005, 0.01)
    iamp = random(0.1, 0.707)
    ifreq = random(p5, p6)

    Sline = sprintf("i 2 %.3f %.3f %.3f %.3f\n", istart, idur, iamp, ifreq)
    Score = strcat(Score, Sline)
    istart += random(0.05, 0.1)
    ii += 1
od

puts(Score, 1)
scoreline_i(Score)

p3 += istart + idur

endin


instr 2
kinv = expseg(0.001, 0.0001, 1, p3 - 0.0001, 0.0001)
iratio = random(0.1, 3.4)
kmod = p5 / iratio
im = 0.6
; asine = poscil(kinv * p4, p5 + poscil(kinv * im * kmod, kmod))
asine = poscil(kinv * p4, p5)
outs(asine, asine)
endin





</CsInstruments>
<CsScore>

i "Master" 0 0.1 100 500 500
; i "Master" 0 0.1 100 5000 7000


</CsScore>
</CsoundSynthesizer>