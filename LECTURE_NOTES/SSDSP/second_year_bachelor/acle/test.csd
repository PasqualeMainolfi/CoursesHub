<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

gifile = ftgen(0, 0, 0, -23, "coord.txt")

/* 
<m>|<channels>
<s>|<channel>|<time_in_percent>|<channel>|...
*/

opcode push_to_array, i[], i[]i
iarr[], ivalue xin

ilen = lenarray(iarr)
if (iarr[0] == -1) then
    inew_len = 1
else 
    inew_len = ilen + 1
endif

inew_arr[] init inew_len
ii init 0
while ii < ilen do
    inew_arr[ii] = iarr[ii]
    ii += 1
od

inew_arr[inew_len - 1] = ivalue
xout(inew_arr)
endop

opcode decode_string, i[]S, S
Sencd xin

Sid = strsub(Sencd, 0, 1)
; prints("ID: %s \n", Sid)

Sbody = strsub(Sencd, 2, strlen(Sencd))

ivec[] init 1
ivec[0] = -1


icond = 1
while (icond == 1) do
    Schannel = strsub(Sbody, 0, 1)
    ichannel = strtol(Schannel)
    ivec[] = push_to_array(ivec, ichannel)
    id_next = strindex(Sbody, ":")
    ; prints("CHANNEL: %d\n", ichannel)
    
    if (strcmp(Sid, "s") == 0 || strcmp(Sid, "t") == 0)  then
        Sbody_temp = strsub(Sbody, id_next + 1, strlen(Sbody))
        id_next_next = strindex(Sbody_temp, ":")
        Stime = strsub(Sbody_temp, 0, id_next_next)
        itime = strtod(Stime)
        ivec[] = push_to_array(ivec, itime)
        ; prints("TIME: %.3f\n", itime)
    endif

    if (strcmp(Sid, "m") == 0) then
        Sbody = strsub(Sbody, id_next + 1)
    else
        Sbody = strsub(Sbody_temp, id_next_next + 1)
    endif

    if (id_next == -1) then
        icond = 0
    endif

od

iout[] = ivec
if (strcmp(Sid, "s") == 0 || strcmp(Sid, "t") == 0) then
    trim_i iout, lenarray(ivec) - 1
endif

xout(iout, Sid)
endop

instr 1

ilen = ftlen(gifile) / 3

itrack = 0
istart = 1
iend = 2
ii = 0
while ii < ilen do

    it = table(itrack, gifile, 0)
    is = table(istart, gifile, 0)
    ie = table(iend, gifile, 0)

    printf_i("traccia[%d]\tstart: %.3f\tend: %.3f\n", 1, it, is, ie)

    itrack += 3
    istart += 3
    iend += 3
    ii += 1
od

endin


instr 2

Stest = "s:1:0.01:3:50:5:10:3"
ivalues[], Sid decode_string Stest
printarray(ivalues)
prints("%s\n", Sid)

endin

</CsInstruments>
<CsScore>

; i 1 0 1
i 2 0 1

</CsScore>
</CsoundSynthesizer>