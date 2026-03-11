<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1


instr 1
    lspeakers:i[] = [0, 90]
    psource:i = 45

    g1:i = (lspeakers[1] - psource) / (lspeakers[1] - lspeakers[0])
    g2:i = (psource - lspeakers[0]) / (lspeakers[1] - lspeakers[0])
    ep1:i = cos(g1 * $M_PI_2)
    ep2:i = sin(g2 * $M_PI_2)
    ep3:i = sqrt(g1)
    ep4:i = sqrt(g2)
    ep5:i = sqrt(g1 * cos(g1 * $M_PI_2))
    ep6:i = sqrt(g2 * sin(g2 * $M_PI_2))

    sum1:i = sqrt(g1 * g1 + g2 * g2)
    sum2:i = sqrt(ep1 * ep1 + ep2 * ep2)
    sum3:i = sqrt(ep3 * ep3 + ep4 * ep4)
    sum4:i = sqrt(ep5 * ep5 + ep6 * ep6)


    prints("g1 = %.3f, g2 = %.3f, sum = %.3fdB\n", g1, g2, 20 * log10(sum1))
    prints("g1 = %.3f, g2 = %.3f, sum = %.3fdB\n", ep1, ep2, 20 * log10(sum2))
    prints("g1 = %.3f, g2 = %.3f, sum = %.3fdB\n", ep3, ep4, 20 * log10(sum3))
    prints("g1 = %.3f, g2 = %.3f, sum = %.3fdB\n", ep5, ep6, 20 * log10(sum4))


endin





</CsInstruments>
<CsScore>

i 1 0 1

</CsScore>
</CsoundSynthesizer>
