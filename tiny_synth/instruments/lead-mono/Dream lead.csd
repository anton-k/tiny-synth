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
ir15 vco2init 1, 5
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
ir34 = 1.0
ir35 = rnd(ir34)
ir37 = rnd(ir34)
ir39 = rnd(ir34)
ir41 = rnd(ir34)
ir43 = rnd(ir34)
ir45 = rnd(ir34)
ir47 = 0.0
ar3 noise ir34, ir47
ar4 delayr 1.2
ir52 = 3.75
ar5 oscil3 ir34, ir52, 2
ar6 = (2.1000000000000003e-3 * ar5)
ar5 = (ar6 + 1.0e-2)
ar6 deltap3 ar5
ar7 = (1.0 * ar0)
kr6 downsamp ar2
kr7 portk kr6, 1.0e-2
ar0 upsamp kr7
if (kr3 == 1.0) then
    kr6 = 1.0
else
    kr6 = 0.0
endif
kr3 portk kr6, 0.1
ar2 upsamp kr3
ar8 = (ar0 * ar2)
ar0 = (ar8 / 64.0)
ar2 = (ar0 ^ 2.0)
ar0 = (ar2 / 2.0)
kr3 linseg 0.0, 0.85, 1.0, 1.0, 1.0
ar2 upsamp kr3
kr3 linsegr 1.0, 1.0, 1.0, 0.95, 0.0
ar8 upsamp kr3
ar9 = (ar2 * ar8)
ir70 = 2400.0
ir71 = 0.1
ar2 bqrez ar3, ir70, ir71
ar3 = (0.35 * ar2)
kr3 downsamp ar1
kr6 portk kr3, 1.0e-2
kr3 = cpsmidinn(kr6)
kr6 oscil3 ir34, ir71, 4
kr7 = (5.0e-2 * kr6)
kr6 = (0.35 + kr7)
kr7 oscil3 ir34, kr6, 4
kr6 = (5.0e-3 * kr7)
kr8 = (1.0 + kr6)
kr6 = (kr3 * kr8)
ir84 = 50.0
kr8 = cent(ir84)
kr9 = (kr8 * -1.0)
kr10 = (kr6 + kr9)
kr11 vco2ft kr10, 0
ar1 oscilikt ir34, kr10, kr11, ir35
kr10 vco2ft kr6, 0
ar2 oscilikt ir34, kr6, kr10, ir37
ar8 = (ar1 + ar2)
kr10 = (kr8 * 1.0)
kr8 = (kr6 + kr10)
kr6 vco2ft kr8, 0
ar1 oscilikt ir34, kr8, kr6, ir39
ar2 = (ar8 + ar1)
ar1 = (ar2 / 3.0)
ir99 = 14.0
kr6 = cent(ir99)
kr8 = (kr3 * kr6)
ir102 = 0.14
kr3 oscil3 ir34, ir102, 4
kr6 = (4.3e-2 * kr3)
kr3 = (0.22 + kr6)
kr6 oscil3 ir34, kr3, 4
kr3 = (7.0e-3 * kr6)
kr11 = (1.0 + kr3)
kr3 = (kr8 * kr11)
kr8 = (kr3 + kr9)
kr9 vco2ft kr8, 0
ar2 oscilikt ir34, kr8, kr9, ir41
kr8 vco2ft kr3, 0
ar8 oscilikt ir34, kr3, kr8, ir43
ar10 = (ar2 + ar8)
kr8 = (kr3 + kr10)
kr3 vco2ft kr8, 0
ar2 oscilikt ir34, kr8, kr3, ir45
ar8 = (ar10 + ar2)
ar2 = (ar8 / 3.0)
ar8 = (ar1 + ar2)
ar1 = (ar3 + ar8)
kr3 = (0.18 * kr7)
kr7 = (1.0 + kr3)
kr3 = (1575.0 * kr7)
ir126 = 0.26
ar2 moogladder ar1, kr3, ir126
ar1 moogladder ar2, kr3, ir126
kr3 = (0.13 * kr6)
kr6 = (1.0 + kr3)
kr3 = (2075.0 * kr6)
ir132 = 0.32
ar2 moogladder ar8, kr3, ir132
ar3 = (ar1 + ar2)
ar1 = (ar9 * ar3)
ar2 = (ar0 * ar1)
ar0 = (ar7 * ar2)
 delayw ar0
ar1 delayr 1.2
ar2 deltap3 ar5
 delayw ar0
ar3 delayr 0.25
ir148 = 0.25
ar5 deltap3 ir148
ar7 = (0.75 * ar0)
ar8 ntrpol ar0, ar6, ir34
ar6 = (0.25 * ar8)
ar8 = (ar7 + ar6)
ar6 = (0.65 * ar5)
ar9 = (ar8 + ar6)
 delayw ar9
ar6 delayr 0.25
ar9 deltap3 ir148
ar10 ntrpol ar0, ar2, ir34
ar0 = (0.25 * ar10)
ar2 = (ar7 + ar0)
ar0 = (0.65 * ar9)
ar7 = (ar2 + ar0)
 delayw ar7
arl0 init 0.0
arl1 init 0.0
kr3 portk kr0, ir71
ar0 upsamp kr3
ar7 = (1.0 - ar0)
ar10 = (0.75 * ar8)
ar11 = (ar5 * 1.0)
ar5 = (ar8 + ar11)
ar8 = (0.25 * ar5)
ar5 = (ar10 + ar8)
ar8 = (ar7 * ar5)
ar10 = (0.75 * ar2)
ar11 = (ar9 * 1.0)
ar9 = (ar2 + ar11)
ar2 = (0.25 * ar9)
ar9 = (ar10 + ar2)
ir187 = 0.9
ir188 = 12000.0
ar2, ar10 reverbsc ar5, ar9, ir187, ir188
ar11 = (ar5 + ar2)
ar2 = (ar0 * ar11)
ar5 = (ar8 + ar2)
ar2 clip ar5, 0.0, 0dbfs
ar5 = (ar2 * 0.8)
arl0 = ar5
ar2 = (ar7 * ar9)
ar5 = (ar9 + ar10)
ar7 = (ar0 * ar5)
ar0 = (ar2 + ar7)
ar2 clip ar0, 0.0, 0dbfs
ar0 = (ar2 * 0.8)
arl1 = ar0
ar0 = arl0
ar2 = arl1
 outs ar0, ar2
endin

</CsInstruments>

<CsScore>

f4 0 8192 10  1.0
f2 0 8192 19  0.5 1.0 180.0 1.0
f10 0 24 2  0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0

f0 604800.0

i 21 0.0 -1.0 
i 20 0.0 -1.0 
i 18 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>