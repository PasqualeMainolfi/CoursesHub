/*
COMB FILTER

FeedForward Comb Filter ---> y[n] = b0 * x[n] + bM * x[n - M] ---> Hz = (z^M + a) / z^M
FeedBack Comb Filter ---> y[n] = b0 * x[n] + aM * y[n - M] ---> (z^M / (z^M - a)) = 1 / 1 - g * z^-M

g = guadagno

Risposta = N/t
Apicco = 1 / 1 - g; Avalle = 1 / 1 + g
Tempo totale di decadimento = 20log(gi) / MjT
T60 = [60 / -20log(g)]t = [3/log(1/g)]t
g = 10^(-3t/T60)

--------------------------------

ALL PASS FILTER (non-zero costante)

All Pass Filter = y[n] = b0 * x[n] + x[n - M] - aM * y[n - M]
b0 + z^-M / 1 + aM * z^-M = -g + z^-M / 1 - g * z^-M
b0 = aM


N.B.
Un filtro con funzione di trasferimento con zeri interni al cerchio unitario
ammette un filtro inverso stabile in cui gli zeri della funzione Hz diventano
i poli dell'inverso H'z:

Hz * H'z = 1
H'z = 1 / Hz
*/

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------


    opcode FFCF, a, aii ;FEEDFORWARD COMB FILTER
aIn, iG, iSampleDel xin

iRit = iSampleDel / sr
aFFCB = (aIn + delay(aIn * iG, iRit)) / 2

xout aFFCB
    endop


    opcode FBCF, a, aii ;FEEDBACK COMB FILTER
aIn, iT60, iSampleDel xin

/*
FBCF = 1 / 1 - g * z^-M

aIn = sig in
iT60 = tempo di riverbero in secondi
iRit = ritardo in campioni
*/

iRit = iSampleDel / sr
iG = 10^((-3 * iRit) / iT60)

aComb delayr iRit
    delayw(aIn + (aComb * iG))

xout aComb
    endop


    opcode LPFBCF, a, aiik ;LOW-PASS FEEDBACK COMB FILTER
aIn, iT60, iSampleDel, kFreqLowPass xin

/*
LPFBCF = 1 / 1 - g * (1 - d / 1 - d * z^-1) * z^-M

aIn = sig in
iT60 = tempo di riverbero in secondi
iRit = ritardo in campioni
kFreqLowPass = frequenza di taglio filtro passa-basso
*/

iRit = iSampleDel / sr
iG = 10^((-3 * iRit) / iT60)

aComb delayr iRit
    aLowPass = tone(aComb * iG, kFreqLowPass)
    delayw(aIn + aLowPass)

xout aLowPass
    endop

    opcode AP, a, aii ;ALLPASS FILTER
aIn, iT60, iSampleDel xin

/*
AP = -g + z^-M / 1 - g * z^-M

aIn = sig in
iT60 = tempo di riverbero in secondi
iRit = ritardo in campioni
*/

iRit = iSampleDel / sr
iG = 10^((-3 * iRit) / iT60)

aAllPass delayr iRit
    aAP = aAllPass + (aIn * -iG)
    delayw(aIn + (aAP * iG))

xout aAP
    endop


    opcode LPAP, a, aiik ;ALLPASS WITH LOW PASS FILTER
aIn, iT60, iSampleDel, kFreqLowPass xin

/*
aIn = sig in
iT60 = tempo di riverbero in secondi
iRit = ritardo in campioni
kFreqLowPass = frequenza di taglio filtro passa-basso
*/

iRit = iSampleDel / sr
iG = 10^((-3 * iRit) / iT60)

aAllPass delayr iRit
    aAP = aAllPass + (aIn * -iG)
    aLPAP = tone(aAP * iG, kFreqLowPass)
    delayw(aIn + aLPAP)

xout aLPAP
    endop
