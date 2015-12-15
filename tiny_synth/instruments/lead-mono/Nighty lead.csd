<CsoundSynthesizer>

<CsOptions>

--output=dac --nodisplays

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1.0
girgg2 init 10
gargg1 init 0.0
gargg0 init 0.0
giPort init 1
opcode FreePort, i, 0
xout giPort
giPort = giPort + 1
endop


opcode TabQueue2_Append, 0, iii
itab, ival1, ival2 xin
ind = 0
ik tab_i ind, itab
tabw_i ival1, (2 * (ik + 1)    ), itab
tabw_i ival2, (2 * (ik + 1) + 1), itab
tabw_i (ik + 1), ind, itab
endop

opcode TabQueue2_Delete, 0,ii
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

opcode TabQueue2_HasElements, k, i
itab xin
knd = 0
kk tab knd, itab
kres = (kk == 0) ? 0 : 1
xout kres
endop

opcode TabQueue2_ReadLastElement, kk, i
itab xin
knd = 0
kk tab knd, itab
kres1 tab (2 * kk)    , itab
kres2 tab (2 * kk + 1), itab
xout kres1, kres2
endop



instr main
if (p4 == 1.0) then
    ir3 = girgg2
     TabQueue2_Append ir3, p5, p6
endif
if (p4 == 0.0) then
    ir10 = girgg2
     TabQueue2_Delete ir10, p5
endif
 turnoff 
endin

instr 21

endin

instr 20
 event_i "i", 19, 604800.0, 1.0e-2
endin

instr 19
 turnoff2 18, 0.0, 0.0
 exitnow 
endin

instr 18
kr0 chnget "volume"
ar0 upsamp kr0
ir3 = girgg2
kr0 TabQueue2_HasElements ir3
if (kr0 == 1.0) then
    kr1, kr2 TabQueue2_ReadLastElement ir3
    ar1 upsamp kr1
    gargg0 = ar1
    kr1, kr3 TabQueue2_ReadLastElement ir3
    ar1 upsamp kr3
    gargg1 = ar1
endif
if (kr0 != 1.0) then
    gargg1 = 0.0
endif
ar1 = gargg0
ar2 = gargg1
arl0 init 0.0
arl1 init 0.0
ar3 = (1.0 * ar0)
kr3 downsamp ar2
kr4 portk kr3, 1.0e-2
ar0 upsamp kr4
if (kr0 == 1.0) then
    kr3 = 1.0
else
    kr3 = 0.0
endif
kr0 portk kr3, 0.1
ar2 upsamp kr0
ar4 = (ar0 * ar2)
ar0 = (ar4 / 64.0)
ar2 = (ar0 ^ 2.0)
ar0 = (ar2 / 2.0)
kr0 linsegr 1.0, 1.0, 1.0, 1.0, 0.0
ar2 upsamp kr0
kr0 linseg 0.0, 0.5, 1.0, 1.0, 1.0
ar4 upsamp kr0
ir43 = 1.0
kr0 downsamp ar1
kr3 portk kr0, 1.0e-2
kr0 = cpsmidinn(kr3)
kr3 = (-0.1 + kr0)
ar1 poscil ir43, kr3, 2
kr3 = (-3.333333333333334e-2 + kr0)
ar5 poscil ir43, kr3, 2
ar6 = (ar1 + ar5)
kr3 = (3.3333333333333326e-2 + kr0)
ar1 poscil ir43, kr3, 2
ar5 = (ar6 + ar1)
ar1 = (ar5 / 3.0)
ir56 = 1200.0
ar5 butlp ar1, ir56
ar1 = (ar4 * ar5)
ar4 = (ar2 * ar1)
ar1 = (ar0 * ar4)
ar0 = (0.48 * ar1)
ar1 = (ar3 * ar0)
ar0 = (0.75 * ar1)
ir64 = 0.9
ir65 = 12000.0
ar2, ar3 reverbsc ar1, ar1, ir64, ir65
ar4 = (ar1 + ar2)
ar2 = (0.25 * ar4)
ar4 = (ar0 + ar2)
ar2 clip ar4, 0.0, 0dbfs
ar4 = (ar2 * 0.8)
arl0 = ar4
ar2 = (ar1 + ar3)
ar1 = (0.25 * ar2)
ar2 = (ar0 + ar1)
ar0 clip ar2, 0.0, 0dbfs
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

</CsInstruments>

<CsScore>

f2 0 8192 10  1.0 0.5 0.33 0.25 0.0 0.1 0.1 0.1
f10 0 24 2  0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0

f0 604800.0

i 21 0.0 -1.0 
i 20 0.0 -1.0 
i 18 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>