<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

#include "lib_logic.udo"

#define PORT # 6969 # 

gihandle = OSCinit($PORT)

instr Master
; kfreq init 0
; kstatus = OSClisten(gihandle, p4, "f", kfreq)
; if (kstatus == 1) then
;     ...

asig = generate_sine(0.7, 440)
outs(asig, asig)

endin


; instr Receiver1

; asine = poscil(p4, p5) * expseg(0.001, 0.01, 1, p3 - 0.01, 0.001)
; outs(asine, asine)

; endin




</CsInstruments>
<CsScore>

; i "Master" 0 30 "/rettangolo"
; i "Master" 0 30 "/circle"

i "Master" 0 30


</CsScore>
</CsoundSynthesizer>