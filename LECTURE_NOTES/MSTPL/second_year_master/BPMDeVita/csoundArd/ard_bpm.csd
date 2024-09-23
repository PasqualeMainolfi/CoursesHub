<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1


opcode decodeFromArduinoSerial, k, Si
Sport, ibaud xin

iport serialBegin Sport, ibaud
kvalue = serialRead(iport)

ilen = 10
ibuffer[] = fillarray(-1, -1, -1, -1, -1, -1, -1, -1, -1, -1)

ii init 0

if (kvalue != -1) then
    if (kvalue != 13 && kvalue != 10) then
        ibuffer[ii] = i(kvalue)
    endif
    ii += 1
endif

if (kvalue == 10) then

    inums = 0
    ik = 0
    while (ik < ilen) do
        inums = ibuffer[ik] != -1 ? inums + 1 : inums
        ik += 1
    od

    imul = 10^inums
    ij = 0
    while (ij < inums) do
        ivalue = ibuffer[ij]
        
    od

endif


gkdata[] init 5
instr 1

kindex init 0
iport serialBegin "/dev/tty.usbmodem1101", 9600
kx = serialRead(iport)

if (kindex < 5 && (kx != 13 && kx != 10)) then
    if (kx != 13 && kx != 10) then
        gkdata[kindex] = kx
    else 
        gkdata[kindex] = -1.0
    endif
    kindex += 1
endif

if (kx == 10) then 
    println("%d", kdata)
    kindex = 0
endif

endin







</CsInstruments>
<CsScore>

i 1 0 100

</CsScore>
</CsoundSynthesizer>