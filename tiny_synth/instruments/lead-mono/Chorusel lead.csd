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
kr0 linseg 0.0, 0.65, 1.0, 1.0, 1.0
ar2 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 1.0, 0.0
ar6 upsamp kr0
ar7 = (ar2 * ar6)
ir53 = 1.0
ar2 linen ir53, 0.5, 13.0, 10.0
kr0 downsamp ar1
kr3 portk kr0, 1.0e-2
kr0 = cpsmidinn(kr3)
ar1 upsamp kr0
kr3 = (kr0 + -1.0)
ir59 = 2.0
kr6 oscil3 ir53, ir59, 2
ar6 upsamp kr6
kr7 = (kr3 + kr6)
kr3 vco2ft kr7, 0
ar8 oscilikt ir53, kr7, kr3
ar9 = (ar2 * ar8)
kr3 linseg 1.0, 13.0, 0.0, 1.0, 0.0
ir66 = 10.0
ar8 areson ar9, kr3, ir66, 1.0
kr7 = (kr0 + 0.5)
kr8 vco2ft kr7, 0
ar9 oscilikt ir53, kr7, kr8
ar10 = (ar2 * ar9)
ir72 = 40.0
ar9 areson ar10, kr3, ir72, 1.0
ar10 = (ar8 + ar9)
ar8 = (ar1 + 2.0)
ar9 = (ar8 + ar6)
ar8 oscil ir53, ar9, 4
ar9 = (ar2 * ar8)
ir79 = 60.0
ar8 areson ar9, kr3, ir79, 1.0
ar9 = (ar10 + ar8)
ar8 = (ar1 + 1.5)
ar10 = (ar8 + ar6)
ar6 oscil ir53, ar10, 4
ar8 = (ar2 * ar6)
ir86 = 80.0
ar6 areson ar8, kr3, ir86, 1.0
ar8 = (ar9 + ar6)
ar6 = (ar1 + -0.25)
ar9 oscil ir53, ar6, 4
ar6 = (ar2 * ar9)
ir92 = 50.0
ar9 areson ar6, kr3, ir92, 1.0
ar6 = (ar8 + ar9)
ar8 = (ar6 / 5.5)
kr7 = (kr0 + -0.8)
kr8 oscil3 ir53, ir59, 2
kr9 = (0.5 * kr8)
ar6 upsamp kr9
kr8 = (kr7 + kr9)
kr7 vco2ft kr8, 0
ar9 oscilikt ir53, kr8, kr7
ar10 = (ar2 * ar9)
ir103 = 70.0
ar9 areson ar10, kr3, ir103, 1.0
ar10 = (ar1 + 0.8)
ar11 = (ar10 + ar6)
ar10 oscil ir53, ar11, 4
ar11 = (ar2 * ar10)
ar10 areson ar11, kr3, ir86, 1.0
ar11 = (ar9 + ar10)
ar9 = (0.5 * ar11)
ar10 = (ar8 + ar9)
ar8 = (0.5 * ar10)
ar10 = (ar7 * ar8)
ar8 = (ar0 * ar10)
kr7 oscil3 ir53, ir38, 2
kr8 = (0.5 * kr7)
kr7 = (0.5 + kr8)
kr8 = (2000.0 * kr7)
kr7 = (3500.0 + kr8)
ar10 moogladder ar8, kr7, ir38
ar8 = (0.9 * ar10)
ar10 = (ar5 * ar8)
ar8 = (ar4 * ar10)
ar11 = (ar1 + 1.0)
ar12 = (ar11 + ar6)
ar6 oscil ir53, ar12, 4
ar11 = (ar2 * ar6)
kr8 = (kr3 * kr6)
ir130 = 20.0
ar6 areson ar11, kr8, ir130, 1.0
ar11 = (ar1 + -0.5)
ar1 oscil ir53, ar11, 4
ar11 = (ar2 * ar1)
ir135 = 30.0
ar1 areson ar11, kr3, ir135, 1.0
ar11 = (ar6 + ar1)
kr8 = (kr0 + -2.0)
kr10 = (kr8 + kr9)
kr8 vco2ft kr10, 0
ar1 oscilikt ir53, kr10, kr8
ar6 = (ar2 * ar1)
ar1 areson ar6, kr3, ir92, 1.0
ar6 = (ar11 + ar1)
kr8 = (kr0 + -1.5)
kr9 = (kr8 + kr6)
kr6 vco2ft kr9, 0
ar1 oscilikt ir53, kr9, kr6
ar11 = (ar2 * ar1)
ar1 areson ar11, kr3, ir103, 1.0
ar11 = (ar6 + ar1)
kr6 = (kr0 + 0.25)
kr0 vco2ft kr6, 0
ar1 oscilikt ir53, kr6, kr0
ar6 = (ar2 * ar1)
ar1 areson ar6, kr3, ir79, 1.0
ar2 = (ar11 + ar1)
ar1 = (ar2 / 5.5)
ar2 = (ar1 + ar9)
ar1 = (0.5 * ar2)
ar2 = (ar7 * ar1)
ar1 = (ar0 * ar2)
ar0 moogladder ar1, kr7, ir38
ar1 = (0.9 * ar0)
ar0 = (ar5 * ar1)
ir166 = 0.8
ir167 = 12000.0
ar1, ar2 reverbsc ar10, ar0, ir166, ir167
ar5 = (ar10 + ar1)
ar1 = (ar3 * ar5)
ar5 = (ar8 + ar1)
ar1 clip ar5, 0.0, 0dbfs
ar5 = (ar1 * 0.8)
arl0 = ar5
ar1 = (ar4 * ar0)
ar4 = (ar0 + ar2)
ar0 = (ar3 * ar4)
ar2 = (ar1 + ar0)
ar0 clip ar2, 0.0, 0dbfs
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

</CsInstruments>

<CsScore>

f4 0 8192 10  0.28 1.0 0.74 0.66 0.78 0.48 5.0e-2 0.33 0.12 8.0e-2 1.0e-2 0.54 0.19 8.0e-2 5.0e-2 0.16 1.0e-2 0.11 0.3 2.0e-2 0.2
f2 0 8192 10  1.0
f10 0 24 2  0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0

f0 604800.0

i 21 0.0 -1.0 
i 20 0.0 -1.0 
i 18 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>