<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

#define PORT # 6969 #
#define HOST # "localhost" #

giosc = OSCinit($PORT)

instr 1
imin_freq = 90

kvalue1 init 0
kvalue2 init 0
kstatus = OSClisten(giosc, "/mouse_x", "ff", kvalue1, kvalue2)
; if (kstatus == 1) then
;     ; println("[INFO] Amp fac: %.5f\tFreq fac: %.5f", kvalue1, kvalue2)
; endif

kvalue1 = portk(kvalue1, 0.001)
kvalue2 = portk(kvalue2, 0.001)

asig = poscil(0.707, 220 + kvalue2)
asig_left = asig * sqrt(1 - kvalue1)
asig_right = asig * sqrt(kvalue1)
; asig = poscil(0.707, 220)
outs(asig_left, asig_right)
endin

</CsInstruments>
<CsScore>
i 1 0 3600


</CsScore>
</CsoundSynthesizer>