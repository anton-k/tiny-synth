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
kr0 linseg 0.0, 0.65, 1.0, 1.0, 1.0
ar2 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 1.0, 0.0
ar4 upsamp kr0
ar5 = (ar2 * ar4)
ir44 = 1.0
ar2 linen ir44, 0.5, 13.0, 10.0
kr0 downsamp ar1
kr3 portk kr0, 1.0e-2
kr0 = cpsmidinn(kr3)
ar1 upsamp kr0
kr3 = (kr0 + -1.0)
ir50 = 2.0
kr4 oscil3 ir44, ir50, 2
ar4 upsamp kr4
kr5 = (kr3 + kr4)
kr3 vco2ft kr5, 0
ar6 oscilikt ir44, kr5, kr3
ar7 = (ar2 * ar6)
kr3 linseg 1.0, 13.0, 0.0, 1.0, 0.0
ir57 = 10.0
ar6 areson ar7, kr3, ir57, 1.0
kr5 = (kr0 + 0.5)
kr6 vco2ft kr5, 0
ar7 oscilikt ir44, kr5, kr6
ar8 = (ar2 * ar7)
ir63 = 40.0
ar7 areson ar8, kr3, ir63, 1.0
ar8 = (ar6 + ar7)
ar6 = (ar1 + 2.0)
ar7 = (ar6 + ar4)
ar6 oscil ir44, ar7, 4
ar7 = (ar2 * ar6)
ir70 = 60.0
ar6 areson ar7, kr3, ir70, 1.0
ar7 = (ar8 + ar6)
ar6 = (ar1 + 1.5)
ar8 = (ar6 + ar4)
ar4 oscil ir44, ar8, 4
ar6 = (ar2 * ar4)
ir77 = 80.0
ar4 areson ar6, kr3, ir77, 1.0
ar6 = (ar7 + ar4)
ar4 = (ar1 + -0.25)
ar7 oscil ir44, ar4, 4
ar4 = (ar2 * ar7)
ir83 = 50.0
ar7 areson ar4, kr3, ir83, 1.0
ar4 = (ar6 + ar7)
ar6 = (ar4 / 5.5)
kr5 = (kr0 + -0.8)
kr6 oscil3 ir44, ir50, 2
kr7 = (0.5 * kr6)
ar4 upsamp kr7
kr6 = (kr5 + kr7)
kr5 vco2ft kr6, 0
ar7 oscilikt ir44, kr6, kr5
ar8 = (ar2 * ar7)
ir94 = 70.0
ar7 areson ar8, kr3, ir94, 1.0
ar8 = (ar1 + 0.8)
ar9 = (ar8 + ar4)
ar8 oscil ir44, ar9, 4
ar9 = (ar2 * ar8)
ar8 areson ar9, kr3, ir77, 1.0
ar9 = (ar7 + ar8)
ar7 = (0.5 * ar9)
ar8 = (ar6 + ar7)
ar6 = (0.5 * ar8)
ar8 = (ar5 * ar6)
ar6 = (ar0 * ar8)
ir107 = 0.1
kr5 oscil3 ir44, ir107, 2
kr6 = (0.5 * kr5)
kr5 = (0.5 + kr6)
kr6 = (2000.0 * kr5)
kr5 = (3500.0 + kr6)
ar8 moogladder ar6, kr5, ir107
ar6 = (0.9 * ar8)
ar8 = (ar3 * ar6)
ar6 = (0.65 * ar8)
ar9 = (ar1 + 1.0)
ar10 = (ar9 + ar4)
ar4 oscil ir44, ar10, 4
ar9 = (ar2 * ar4)
kr6 = (kr3 * kr4)
ir122 = 20.0
ar4 areson ar9, kr6, ir122, 1.0
ar9 = (ar1 + -0.5)
ar1 oscil ir44, ar9, 4
ar9 = (ar2 * ar1)
ir127 = 30.0
ar1 areson ar9, kr3, ir127, 1.0
ar9 = (ar4 + ar1)
kr6 = (kr0 + -2.0)
kr8 = (kr6 + kr7)
kr6 vco2ft kr8, 0
ar1 oscilikt ir44, kr8, kr6
ar4 = (ar2 * ar1)
ar1 areson ar4, kr3, ir83, 1.0
ar4 = (ar9 + ar1)
kr6 = (kr0 + -1.5)
kr7 = (kr6 + kr4)
kr4 vco2ft kr7, 0
ar1 oscilikt ir44, kr7, kr4
ar9 = (ar2 * ar1)
ar1 areson ar9, kr3, ir94, 1.0
ar9 = (ar4 + ar1)
kr4 = (kr0 + 0.25)
kr0 vco2ft kr4, 0
ar1 oscilikt ir44, kr4, kr0
ar4 = (ar2 * ar1)
ar1 areson ar4, kr3, ir70, 1.0
ar2 = (ar9 + ar1)
ar1 = (ar2 / 5.5)
ar2 = (ar1 + ar7)
ar1 = (0.5 * ar2)
ar2 = (ar5 * ar1)
ar1 = (ar0 * ar2)
ar0 moogladder ar1, kr5, ir107
ar1 = (0.9 * ar0)
ar0 = (ar3 * ar1)
ir158 = 0.8
ir159 = 12000.0
ar1, ar2 reverbsc ar8, ar0, ir158, ir159
ar3 = (ar8 + ar1)
ar1 = (0.35 * ar3)
ar3 = (ar6 + ar1)
ar1 clip ar3, 0.0, 0dbfs
ar3 = (ar1 * 0.8)
arl0 = ar3
ar1 = (0.65 * ar0)
ar3 = (ar0 + ar2)
ar0 = (0.35 * ar3)
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