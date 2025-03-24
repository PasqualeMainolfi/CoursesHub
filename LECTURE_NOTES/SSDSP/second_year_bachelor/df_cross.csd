<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
nchnls_i = 1
0dbfs = 1


#define TWOPI # 2 * $M_PI #


instr 1 

aright init 0

kfreq = 200
kf1 = kfreq * 1.0
kf2 = kfreq * 2.7
kwt1 = phasor:a(kf1) * $TWOPI
kwt2 = phasor:a(kf2) * $TWOPI

kdf1 = 0.5 //* kf1
kdf2 = 0.7 //* kf2

aleft = sin(kwt1 + (kdf2 * aright))
aright = sin(kwt2 + (kdf1 * aleft))

amono = (aleft + aright) * 0.5
amono *= expseg:k(0.001, 0.01, 1, p3 - 0.01, 0.001)

outs(amono, amono)
endin


</CsInstruments>
<CsScore>

i 1 0 5

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
