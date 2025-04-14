<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1


gifile = ftgen(0, 0, 0, -23, "coord.txt")

instr 1

ilen = ftlen(gifile) / 3

itrack = 0
istart = 1
iend = 2
ii = 0
while ii < ilen do

    it = table(itrack, gifile, 0)
    is = table(istart, gifile, 0)
    ie = table(iend, gifile, 0)

    printf_i("traccia[%d]\tstart: %.3f\tend: %.3f\n", 1, it, is, ie)

    itrack += 3
    istart += 3
    iend += 3
    ii += 1
od

endin

</CsInstruments>
<CsScore>

i 1 0 1

</CsScore>
</CsoundSynthesizer>