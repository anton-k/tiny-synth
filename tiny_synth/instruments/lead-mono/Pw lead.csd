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
ir15 vco2init 16, 3
irlft = ir15
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
kr0 chnget "fx"
kr1 chnget "cut-off"
kr2 chnget "resonance"
ir9 = girgg2
kr3 TabQueue2_HasElements ir9
if (kr3 == 1.0) then
    kr4, kr5 TabQueue2_ReadLastElement ir9
    ar1 upsamp kr4
    gargg0 = ar1
    kr4, kr6 TabQueue2_ReadLastElement ir9
    ar1 upsamp kr6
    gargg1 = ar1
endif
if (kr3 != 1.0) then
    gargg1 = 0.0
endif
ar1 = gargg0
ar2 = gargg1
arl0 init 0.0
arl1 init 0.0
ir38 = 0.1
kr6 portk kr0, ir38
ar3 upsamp kr6
ar4 = (1.0 - ar3)
ar5 = (1.0 * ar0)
kr0 downsamp ar2
kr6 portk kr0, 1.0e-2
ar0 upsamp kr6
if (kr3 == 1.0) then
    kr0 = 1.0
else
    kr0 = 0.0
endif
kr3 portk kr0, 0.1
ar2 upsamp kr3
ar6 = (ar0 * ar2)
ar0 = (ar6 / 64.0)
ar2 = (ar0 ^ 2.0)
ar0 = (ar2 / 2.0)
kr0 linseg 0.0, 0.3, 1.0, 1.0, 1.0
ar2 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 0.95, 0.0
ar6 upsamp kr0
ar7 = (ar2 * ar6)
ir53 = 1.0
kr0 downsamp ar1
kr3 portk kr0, 1.0e-2
kr0 = cpsmidinn(kr3)
ir57 = 4.0
kr3 oscil3 ir53, ir57, 2
kr6 = (0.5 * kr3)
kr3 = (0.5 + kr6)
kr6 = (0.4 * kr3)
kr3 = (0.2 + kr6)
ar1 vco2 ir53, kr0, 2.0, kr3
ir64 = 8.0
kr3 = cent(ir64)
kr6 = (kr0 * kr3)
kr3 vco2ft kr6, 4
ar2 oscilikt ir53, kr6, kr3
ar6 = (ar1 + ar2)
ar1 = (0.5 * ar6)
kr3 = (kr0 * 5.0)
ir72 = 0.15
ar2 moogladder ar1, kr3, ir72
ar1 = (ar7 * ar2)
ar2 = (ar0 * ar1)
ar0 = (0.6 * ar2)
ar1 = (ar5 * ar0)
ar0 = (ar4 * ar1)
ir79 = 0.8
ir80 = 12000.0
ar2, ar4 reverbsc ar1, ar1, ir79, ir80
ar5 = (ar1 + ar2)
ar2 = (ar3 * ar5)
ar5 = (ar0 + ar2)
ar2 clip ar5, 0.0, 0dbfs
ar5 = (ar2 * 0.8)
arl0 = ar5
ar2 = (ar1 + ar4)
ar1 = (ar3 * ar2)
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

f2 0 8192 10  1.0
f10 0 24 2  0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0

f0 604800.0

i 21 0.0 -1.0 
i 20 0.0 -1.0 
i 18 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>