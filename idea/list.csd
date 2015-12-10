<CsoundSynthesizer>
<CsOptions>

-d -odac

</CsOptions>
<CsInstruments>

sr  = 44100 
kr  = 4410  
ksmps   = 10
nchnls  = 1
0dbfs = 1

opcode Append, 0, ii
itab, ival xin
ind = 0
ik tab_i ind, itab
tabw_i ival, (ik + 1), itab
tabw_i (ik + 1), ind, itab
endop

opcode Delete, 0,ii
itab, ival xin
ind = 0
iLast tab_i ind, itab
iCount = 1
iFound = 0
until iCount > iLast do
    iCur tab_i iCount, itab
    if (iCur == ival) then
        iFound = 1
        tabw_i (iLast - 1), ind, itab
    endif

    if (iFound == 1) then
        iNext tab_i (iCount + 1), itab
        tabw_i iNext, iCount, itab
    endif

    iCount = iCount + 1
od
endop

opcode HasElement, k, i
itab xin
knd = 0
kk tab knd, itab
kres = (kk == 0) ? 0 : 1
xout kres
endop

opcode ReadLastElement, k, i
itab xin
knd = 0
kk tab knd, itab
kres tab kk, itab
xout kres
endop

opcode Echo, 0, i
itab xin
i1 = 1
i2 = 2
i3 = 3
i4 = 4
iv1 tab_i i1, itab
iv2 tab_i i2, itab
iv3 tab_i i3, itab
iv4 tab_i i4, itab
print iv1, iv2, iv3, iv4
endop

opcode Append2, 0, iii
itab, ival1, ival2 xin
ind = 0
ik tab_i ind, itab
tabw_i ival1, (2 * (ik + 1)    ), itab
tabw_i ival2, (2 * (ik + 1) + 1), itab
tabw_i (ik + 1), ind, itab
endop

opcode Delete2, 0,ii
itab, ival xin
ind = 0
iLast tab_i ind, itab
iCount = 1
iFound = 0
until iCount > iLast do
    iCur tab_i (2 * iCount), itab
    if (iCur == ival) then
        iFound = 1
        tabw_i (iLast - 1), ind, itab
    endif

    if (iFound == 1) then
        iNext1 tab_i (2 * (iCount + 1))    , itab
        iNext2 tab_i (2 * (iCount + 1) + 1), itab
        tabw_i iNext1, (2 * iCount)    , itab
        tabw_i iNext2, (2 * iCount + 1), itab
    endif

    iCount = iCount + 1
od
endop

opcode HasElement2, k, i
itab xin
knd = 0
kk tab knd, itab
kres = (kk == 0) ? 0 : 1
xout kres
endop

opcode ReadLastElement2, kk, i
itab xin
knd = 0
kk tab knd, itab
kres1 tab (2 * kk)    , itab
kres2 tab (2 * kk + 1), itab
xout kres1, kres2
endop

opcode Echo2, 0, i
itab xin
i1 = 1
i2 = 2
i3 = 3
i4 = 4
iv1 tab_i (i1*2), itab
iv2 tab_i (i2*2), itab
iv3 tab_i (i3*2), itab
iv4 tab_i (i4*2), itab
print iv1, iv2, iv3, iv4
endop

instr 1 
    itab = 2
    if (p4 == 1) then
        Append2 itab, p5, p6
    else
        Delete2 itab, p5
    endif

    Echo2 itab
    turnoff
endin

instr 10
itab = 2
kFlag HasElement2 itab
kcps init 0
kamp init 0
if (kFlag == 1) then    
    kcps, kamp ReadLastElement2 itab    
else 
    kcps = 0
    kamp = 0
endif

printks "on: %f\n", 1, kcps

ares oscil kamp, kcps, 1
out ares
endin

</CsInstruments>
<CsScore>

f1 0 4096 10 1
f2 0 10 2 0 0 0 0 0 0 0 0 0 0

i 10 0 20

i1 0 1 1 220 0.25
;i1 + . 1 330
;i1 + . 1 440

;i1 + . 0 440
;i1 + . 0 330
;i1 + . 0 220

i1 + . 1 440 0.5
i1 + . 1 330 0.75
i1 + . 0 220 0.5
i1 + . 0 440 0.5
i1 + . 0 330 0.5

e

</CsScore>
</CsoundSynthesizer>