<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

#define PORT #8000#

gihandle = OSCinit($PORT)

instr 1

kamp init 0

kcheck = OSClisten(gihandle, "/sine/amp", "f",  kamp)

; if (kcheck == 1) then
;     asine = poscil(kamp, 200)
; endif

asine = poscil(portk(kamp, .01), 200)

outs(asine, asine)
endin




</CsInstruments>
<CsScore>

i 1 0 30

</CsScore>
</CsoundSynthesizer>