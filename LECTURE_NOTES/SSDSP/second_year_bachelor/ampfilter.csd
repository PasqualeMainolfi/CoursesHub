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


gSm = "/Users/pm/AcaHub/AudioSamples/piano_samples/piano_loop1.wav"
gSk = "/Users/pm/AcaHub/AudioSamples/Datasets/genres/blues/blues.00001.wav"

opcode open_file, a, Si
Spath, iwrap xin
ichns = filenchnls(Spath)

if ichns > 1 then
    al, ar diskin2 Spath, 1, 0, iwrap
    aout = (al + ar) / 2
else 
    aout diskin2 Spath, 1, 0, iwrap
endif

xout(aout)
endop

opcode sabiofilt, a, SSki
Sfm, Sfk, kthr, iwrap xin

ax = open_file(Sfm, iwrap)
ak = open_file(Sfk, iwrap)
ksig = abs(downsamp(ak))
kthr = portk(kthr, 0.01)
kfactor = ksig > kthr ? 1.0 : 0.0
ax *= kfactor

xout(ax)
endop




instr 1

asig = sabiofilt(gSm, gSk, 0.1, 1)
outs(asig, asig)

endin




</CsInstruments>
<CsScore>

i 1 0 120


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
 <bsbObject type="BSBKnob" version="2">
  <objectName>thr</objectName>
  <x>27</x>
  <y>322</y>
  <width>219</width>
  <height>127</height>
  <uuid>{4e6b5c78-ef88-4cb4-9342-e0bf78afee1c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.22820000</value>
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
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>18</x>
  <y>7</y>
  <width>656</width>
  <height>283</height>
  <uuid>{1a07e85f-d98b-4ee9-800d-b5d30d90af73}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
  <triggermode>NoTrigger</triggermode>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
