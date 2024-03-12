<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

// HEADER 
sr = 44100
ksmps = 64
nchnls = 2
nchnls_i = 1
0dbfs = 1


/*

a, k, i

a-sig -> asig = segnale audio (sr)
k-sig -> ksig = segnale di controllo (kr / ksmps)
i-data -> idata = valore istantaneo 

*/

seed(0)


// Esempio... fate VOI!
opcode get_amp_fac, k, 0
kamp = random(0.1, 1)
xout(kamp)
endop

opcode get_freq_fac, k, 0
kfreq = random(-100, 100)
xout(kfreq)
endop

void ciao(string nome) {
    println(nome)
}


opcode ricorsive_additive, a, kkio
kf0, ka0, icomp_num, icount xin

kfreq = (kf0 * (icount + 1))
kamp = (ka0 / (icount + 1)) * ((icount + 1) % 2)
kfreq += get_freq_fac()
kamp *= get_amp_fac()

asig = poscil(kamp, kfreq)

if (icount < icomp_num - 1) then
    asig += ricorsive_additive(kf0, ka0, icomp_num, icount + 1)
endif

xout(asig)
endop



gamaster init 0


instr 1

iamp = ampdb(p4)
kfreq invalue "freq"
kfreq = portk(kfreq, 0.001)
ifreq = p5
iatk = 0.001
irel = p3 - iatk

af0 = poscil(iamp, kfreq)
af1 = poscil(iamp / random(1, 2), kfreq * random(1, 2))
af2 = poscil(iamp / random(2, 3), kfreq * random(2, 3))

ay = (af0 + af1 + af2) / 3

;kinv = linseg(0, iatk, 1, irel, 0)
kinv = expseg(0.0001, iatk, 1, irel, 0.001)

ay = ay * kinv

gamaster += ay

; outs(ay, ay)



endin


instr 2

kf = 90
ka = ampdb(-6)
inum = 100

additive = ricorsive_additive(kf, ka, inum)
kinv = expseg(0.001, 0.01, 1, p3 - 0.01, 0.000001)
additive *= kinv

; outs(additive, additive)

gamaster += additive

endin


instr Master

aouts = gamaster

outs(aouts, aouts)
clear(gamaster)

endin



</CsInstruments>
<CsScore>
 
/* 
p0 = event 
p1 = strumento (numero o stringa) 
p2 = start time 
p3 = duration
*/ 
 
t0 60 

i "Master" 0 60

; i 1 0 30 -6 
; i 1 0 3 -6 250
;i 1 .5 3 -3 300
;i 1 1.2 5 -1 210
 

i 2 0 2

 
 </CsScore>
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
 <bsbObject type="BSBKnob" version="2">
  <objectName>freq</objectName>
  <x>86</x>
  <y>311</y>
  <width>80</width>
  <height>80</height>
  <uuid>{44b1d2ff-80af-44b7-822e-64015bc40d52}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>90.00000000</minimum>
  <maximum>1500.00000000</maximum>
  <value>971.25000000</value>
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
  <x>46</x>
  <y>31</y>
  <width>639</width>
  <height>235</height>
  <uuid>{a7e18735-d30c-47cd-b71a-ae4448e14b5e}</uuid>
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
