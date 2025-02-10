<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>

// ORCHESTRA
<CsInstruments>

// HEADER
sr = 44100 // sample rate
ksmps = 1
nchnls = 2
0dbfs = 1
// -------


/*

x -------> L (left channel)
		|
		---> R (right channel)

*/

instr 1

asine = poscil(0.707, 220)
outs(asine, asine)


endin


</CsInstruments>
// --------------

// SCORE
<CsScore>

i 1 0 5


</CsScore>
// -----------



</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>0</width>
 <height>0</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>41</x>
  <y>36</y>
  <width>886</width>
  <height>181</height>
  <uuid>{ad3ae9d6-5111-49c5-86d0-161a85de8412}</uuid>
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
