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



instr 1

anoise = rand(0.5)


kfc invalue "fc"
kfc = portk(kfc, 0.001)

kbw invalue "bw"
kbw = portk(kbw, 0.001)

ksimple_lfo_fc = poscil:k(100, 30)
ksimple_lfo_bw = poscil:k(5000, expseg:k(5000, 1,  10, p3 - 1, 0.01))

ay1 = butbp(anoise, kfc + ksimple_lfo_fc, ksimple_lfo_bw)
ay2 = butbp(anoise, kfc * 1.2, kbw)
ay3 = butbp(anoise, kfc * 1.5, kbw)
ay4 = butbp(anoise, kfc * 1.7, kbw)

;ay = sum(ay1, ay2, ay3, ay4)

outs(ay1, ay1)

dispfft(ay1, .01, 2048)

endin









</CsInstruments>
<CsScore>

i 1 0 60

</CsScore>
</CsoundSynthesizer>


<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>848</width>
 <height>437</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
 <bsbObject type="BSBGraph" version="2">
  <objectName/>
  <x>7</x>
  <y>15</y>
  <width>841</width>
  <height>327</height>
  <uuid>{df6d00c6-d2c4-4d13-9290-b4d7f88464dc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <value>0</value>
  <objectName2/>
  <zoomx>3.00000000</zoomx>
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
 <bsbObject type="BSBKnob" version="2">
  <objectName>fc</objectName>
  <x>56</x>
  <y>356</y>
  <width>80</width>
  <height>80</height>
  <uuid>{7f37225c-f09d-4828-b626-f08f11b0bfcc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>50.00000000</minimum>
  <maximum>10000.00000000</maximum>
  <value>50.00000000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>245</r>
   <g>124</g>
   <b>0</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject type="BSBKnob" version="2">
  <objectName>bw</objectName>
  <x>153</x>
  <y>357</y>
  <width>80</width>
  <height>80</height>
  <uuid>{8d2cd951-a6ef-4cd6-94ea-ea5a0667a954}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>1.00000000</minimum>
  <maximum>210.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>245</r>
   <g>124</g>
   <b>0</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
