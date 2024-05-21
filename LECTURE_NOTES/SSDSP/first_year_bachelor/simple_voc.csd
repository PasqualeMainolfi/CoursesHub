<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1


/*
Ref. Paper: TOWARDS OBJECTIVE MEASURES OF SPEECH INTELLIGIBILITY FOR COCHLEAR IMPLANT USERS IN REVERBERANT ENVIRONMENTS

6 CF 180 446 885 1609 2803 4773
Ch BW 201 331 546 901 1487 2453
*/


#define MOD #"/Users/pm/AcaHub/AudioSamples/clarinet.wav"#
#define CAR #"/Users/pm/AcaHub/AudioSamples/vox.wav"#

opcode filter_bank, aaaaaa, ai[]i[]
asource, icf[], ibw[] xin
    ab1 = butbp(asource, icf[0], ibw[0])
    ab2 = butbp(asource, icf[1], ibw[1])
    ab3 = butbp(asource, icf[2], ibw[2])
    ab4 = butbp(asource, icf[3], ibw[3])
    ab5 = butbp(asource, icf[4], ibw[4])
    ab6 = butbp(asource, icf[5], ibw[5])
xout(ab1, ab2, ab3, ab4, ab5, ab6)
endop

opcode get_rms, kkkkkk, aaaaaa
ab1, ab2, ab3, ab4, ab5, ab6 xin
    kbe1 = rms(ab1)
    kbe2 = rms(ab2)
    kbe3 = rms(ab3)
    kbe4 = rms(ab4)
    kbe5 = rms(ab5)
    kbe6 = rms(ab6)
xout(kbe1, kbe2, kbe3, kbe4, kbe5, kbe6)
endop

opcode get_new_band, aaaaaa, aaaaaakkkkkk
ab1, ab2, ab3, ab4, ab5, ab6, kbe1, kbe2, kbe3, kbe4, kbe5, kbe6 xin
    ab1 *= kbe1
    ab2 *= kbe2
    ab3 *= kbe3
    ab4 *= kbe4
    ab5 *= kbe5
    ab6 *= kbe6
xout(ab1, ab2, ab3, ab4, ab5, ab6)
endop



gicf[] = fillarray(180, 446, 885, 1609, 2803, 4773)
gibw[] = fillarray(201, 331, 546, 901, 1487, 2453)

instr 1

amod diskin2 $MOD, 1, 0, 1
; acar diskin2 $CAR, 1, 0, 1
acar = pinkish(rand:a(.5), 1)

gicf[] = gicf * p4
gibw[] = gibw / p5

ab1, ab2, ab3, ab4, ab5, ab6 filter_bank amod, gicf, gibw
kb1, kb2, kb3, kb4, kb5, kb6 get_rms ab1, ab2, ab3, ab4, ab5, ab6

; println("E(b1) = [%.3f]\tE(b2) = [%.3f]\tE(b3) = [%.3f]\tE(b4) = [%.3f]\tE(b5) = [%.3f]\tE(b6) = [%.3f]", kbe1, kbe2, kbe3, kbe4, kbe5, kbe6)

ab1, ab2, ab3, ab4, ab5, ab6 filter_bank acar, gicf, gibw
ab1, ab2, ab3, ab4, ab5, ab6 get_new_band ab1, ab2, ab3, ab4, ab5, ab6, kb1, kb2, kb3, kb4, kb5, kb6

// TODO: lavorare poi sulla gestione delle bande della portante in relazione alle energie della modulante

ay = sum(ab1, ab2, ab3, ab4, ab5, ab6)
ay = balance(ay, acar)

kinv = expseg(.001, .001, 1, p3 - .001, .0001)
ay *= kinv

outs(ay, ay)

endin



</CsInstruments>
<CsScore>

i 1 0 5 1 10
i 1 2 3 0.5 100
i 1 3 7 0.7 300


</CsScore>
</CsoundSynthesizer>