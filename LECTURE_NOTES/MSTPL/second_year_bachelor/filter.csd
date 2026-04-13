<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
nchnls_i = 1
0dbfs = 1


instr 1
    noise:a = rand(0.7)
    lp1:a = tone(noise, 500) // I ordine -6dB/Ott
    lp2:a = tone(lp1, 500)   // I ordine -12dB/Ott
    
    bp1:a = butbp(noise, 5000, 30) * 0.3
    bp2:a = butbp(noise, 2500, 30)
    
    br2:a = butbr(noise, 5000, 5000)

    sig:a = br2
    out(sig, sig)
    dispfft(sig, 0.1, 2048)
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
 <bsbObject type="BSBGraph" version="2">
  <objectName/>
  <x>21</x>
  <y>15</y>
  <width>1024</width>
  <height>615</height>
  <uuid>{15db556d-d36c-4386-80ab-2758b89d0bde}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <value>0</value>
  <objectName2/>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>lin</modex>
  <modey>lin</modey>
  <showSelector>true</showSelector>
  <showGrid>true</showGrid>
  <showTableInfo>true</showTableInfo>
  <showScrollbars>true</showScrollbars>
  <enableTables>true</enableTables>
  <enableDisplays>true</enableDisplays>
  <all>true</all>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
