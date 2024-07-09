<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 2
nchnls = 2
nchnls_i = 1
0dbfs = 1


chnset(5, "bw1")
chnset(5, "bw2")
chnset(5, "bw3")

chnset(900, "bf1")
chnset(3000, "bf2")
chnset(10000, "bf3")

chnset(-6, "b1")
chnset(-6, "b2")
chnset(-6, "b3")

instr 1

inyquist = sr / 2
in_bands = 3
istep = inyquist / in_bands

al, ar diskin2 "/Users/pm/AcaHub/AudioSamples/suzanne.wav", 1, 0, 1
ax = (al + ar) / 2

kbw1 invalue "bw1"
kbw2 invalue "bw2"
kbw3 invalue "bw3"

kbf1 invalue "bf1"
kbf2 invalue "bf2"
kbf3 invalue "bf3"

;alow = tone(ax, 1000)
aband1 = butbp(ax, kbf1, kbw1)
aband2 = butbp(ax, kbf2, kbw2)
aband3 = butbp(ax, kbf3, kbw3)
;ahigh = atone(ax, 15000)

kb1 invalue "b1"
kb2 invalue "b2"
kb3 invalue "b3"

ay = (aband1 * ampdb(kb1) + aband2 * ampdb(kb2) + aband3 * ampdb(kb3)) * ampdb(-12)

outs(ay, ay)
dispfft(ay, 0.1, 2048)

endin


</CsInstruments>
<CsScore>

i 1 0 90

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>873</width>
 <height>459</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
 <bsbObject type="BSBGraph" version="2">
  <objectName/>
  <x>64</x>
  <y>39</y>
  <width>809</width>
  <height>240</height>
  <uuid>{cfe7d623-54bf-41ec-9d25-d845d92f22e4}</uuid>
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
 <bsbObject type="BSBKnob" version="2">
  <objectName>b1</objectName>
  <x>64</x>
  <y>288</y>
  <width>80</width>
  <height>80</height>
  <uuid>{130a31db-7841-4f11-b583-89777ea20cf7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-96.00000000</minimum>
  <maximum>24.00000000</maximum>
  <value>7.50000000</value>
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
  <objectName>b2</objectName>
  <x>157</x>
  <y>289</y>
  <width>80</width>
  <height>80</height>
  <uuid>{27faaac7-8e9e-44b3-ab75-68a585fb4f08}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-96.00000000</minimum>
  <maximum>24.00000000</maximum>
  <value>-6.00000000</value>
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
  <objectName>b3</objectName>
  <x>242</x>
  <y>289</y>
  <width>80</width>
  <height>80</height>
  <uuid>{a185d0de-db20-4eff-9668-9eb7b7ee0a99}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-96.00000000</minimum>
  <maximum>24.00000000</maximum>
  <value>-6.00000000</value>
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
  <objectName>bw1</objectName>
  <x>62</x>
  <y>378</y>
  <width>80</width>
  <height>80</height>
  <uuid>{70f05b8f-712a-42ed-a5f6-a1a82fa70ba9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>5.00000000</minimum>
  <maximum>5000.00000000</maximum>
  <value>879.12500000</value>
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
  <objectName>bw2</objectName>
  <x>155</x>
  <y>379</y>
  <width>80</width>
  <height>80</height>
  <uuid>{2e686d30-0a4d-48fa-ad0a-d398d4ac307f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>5.00000000</minimum>
  <maximum>5000.00000000</maximum>
  <value>1316.18750000</value>
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
  <objectName>bw3</objectName>
  <x>240</x>
  <y>379</y>
  <width>80</width>
  <height>80</height>
  <uuid>{0737684e-5c4a-4b62-888d-2522c343b6af}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>5.00000000</minimum>
  <maximum>5000.00000000</maximum>
  <value>2752.25000000</value>
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
  <objectName>bf1</objectName>
  <x>62</x>
  <y>464</y>
  <width>80</width>
  <height>80</height>
  <uuid>{041f7c57-de96-4b3c-bc05-d55f86c85b5f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>20000.00000000</maximum>
  <value>3400.00000000</value>
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
  <objectName>bf2</objectName>
  <x>155</x>
  <y>463</y>
  <width>80</width>
  <height>80</height>
  <uuid>{97494433-801c-41e3-aab9-8eab77b77b1e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>20000.00000000</maximum>
  <value>3000.00000000</value>
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
  <objectName>bf3</objectName>
  <x>240</x>
  <y>464</y>
  <width>80</width>
  <height>80</height>
  <uuid>{1cfcd0a3-9525-41c6-b035-79f5fc3ea1f8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>5.00000000</minimum>
  <maximum>20000.00000000</maximum>
  <value>10000.00000000</value>
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
