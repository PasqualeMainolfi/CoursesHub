<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1


// simple lfo-logic

// sin(2 * π * f * t / sr)


opcode simple_lfo, a, kkkio

/*
kamp = amp
kfreq = freq in Hz
kphase = phase in degree
ioffset = offset
imode = optional, default = 0 -> bipolar, = 1 unipolar
*/

kamp, kfreq, kphase, ioffset, imode xin

kmin = ioffset
kmax = kamp - kmin
awt = 2 * $M_PI * phasor:a(kfreq)
alfo = kmin + kmax * sin(awt + kphase)

alfo = imode == 0 ? alfo : alfo / 2 + 0.5 // operatore ternario  

xout(alfo)
endop


instr 1

ifreq = 500
itime_lfo = .3

alfo = simple_lfo(1, 1 / itime_lfo, 0.75 * $M_PI, 0, 1)
kinv = expseg(.001, .01, 1, p3 - .01, .001)
asig = poscil(alfo, kinv * ifreq * alfo) * kinv
outs(asig, asig)

endin




</CsInstruments>
<CsScore>

i 1 0 30

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
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>26</x>
  <y>12</y>
  <width>712</width>
  <height>456</height>
  <uuid>{dbfe695b-b359-49c9-9c31-6a0677f08141}</uuid>
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
