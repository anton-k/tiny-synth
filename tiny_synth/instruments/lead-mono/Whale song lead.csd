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
ir15 vco2init 16, 5
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
ir28 = 1.0
ir29 = rnd(ir28)
ir31 = rnd(ir28)
ir33 = rnd(ir28)
ir35 = rnd(ir28)
ir37 = rnd(ir28)
ir39 = rnd(ir28)
ir41 = rnd(ir28)
ir43 = rnd(ir28)
ir45 = rnd(ir28)
ir47 = rnd(ir28)
ir49 = rnd(ir28)
ir51 = rnd(ir28)
ir53 = rnd(ir28)
ir55 = rnd(ir28)
ir57 = rnd(ir28)
ir59 = 0.0
ar3 noise ir28, ir59
ar4 delayr 1.2
ir64 = 3.75
ar5 oscil3 ir28, ir64, 2
ar6 = (2.1000000000000003e-3 * ar5)
ar5 = (ar6 + 1.0e-2)
ar6 deltap3 ar5
ar7 = (1.0 * ar0)
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
ar8 = (ar0 * ar2)
ar0 = (ar8 / 64.0)
ar2 = (ar0 ^ 2.0)
ar0 = (ar2 / 2.0)
kr0 linseg 0.0, 0.85, 1.0, 1.0, 1.0
ar2 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 0.95, 0.0
ar8 upsamp kr0
ar9 = (ar2 * ar8)
ir82 = 2400.0
ir83 = 0.1
ar2 bqrez ar3, ir82, ir83
ar3 = (0.35 * ar2)
kr0 downsamp ar1
kr3 portk kr0, 1.0e-2
kr0 = cpsmidinn(kr3)
kr3 oscil3 ir28, ir83, 4
kr4 = (5.0e-2 * kr3)
kr3 = (0.35 + kr4)
kr4 oscil3 ir28, kr3, 4
kr3 = (5.0e-3 * kr4)
kr5 = (1.0 + kr3)
kr3 = (kr0 * kr5)
ir96 = 50.0
kr5 = cent(ir96)
kr6 = (kr5 * -1.0)
kr7 = (kr3 + kr6)
kr8 vco2ft kr7, 4
ar1 oscilikt ir28, kr7, kr8, ir29
kr7 vco2ft kr3, 4
ar2 oscilikt ir28, kr3, kr7, ir31
ar8 = (ar1 + ar2)
kr7 = (kr5 * 1.0)
kr5 = (kr3 + kr7)
kr3 vco2ft kr5, 4
ar1 oscilikt ir28, kr5, kr3, ir33
ar2 = (ar8 + ar1)
ar1 = (ar2 / 3.0)
ir111 = 14.0
kr3 = cent(ir111)
kr5 = (kr0 * kr3)
ir114 = 0.14
kr8 oscil3 ir28, ir114, 4
kr9 = (4.3e-2 * kr8)
kr8 = (0.22 + kr9)
kr9 oscil3 ir28, kr8, 4
kr8 = (7.0e-3 * kr9)
kr10 = (1.0 + kr8)
kr8 = (kr5 * kr10)
kr5 = (kr8 + kr6)
kr11 vco2ft kr5, 4
ar2 oscilikt ir28, kr5, kr11, ir35
kr5 vco2ft kr8, 4
ar8 oscilikt ir28, kr8, kr5, ir37
ar10 = (ar2 + ar8)
kr5 = (kr8 + kr7)
kr8 vco2ft kr5, 4
ar2 oscilikt ir28, kr5, kr8, ir39
ar8 = (ar10 + ar2)
ar2 = (ar8 / 3.0)
ar8 = (ar1 + ar2)
kr5 = (3.0 * kr0)
kr8 = (kr5 * kr3)
kr5 = (kr8 * kr10)
kr8 = (kr5 + kr6)
kr11 vco2ft kr8, 4
ar1 oscilikt ir28, kr8, kr11, ir41
kr8 vco2ft kr5, 4
ar2 oscilikt ir28, kr5, kr8, ir43
ar10 = (ar1 + ar2)
kr8 = (kr5 + kr7)
kr5 vco2ft kr8, 4
ar1 oscilikt ir28, kr8, kr5, ir45
ar2 = (ar10 + ar1)
ar1 = (ar2 / 3.0)
ar2 = (ar8 + ar1)
kr5 = (7.0 * kr0)
kr8 = (kr5 * kr3)
kr5 = (kr8 * kr10)
kr8 = (kr5 + kr6)
kr11 vco2ft kr8, 4
ar1 oscilikt ir28, kr8, kr11, ir47
kr8 vco2ft kr5, 4
ar8 oscilikt ir28, kr5, kr8, ir49
ar10 = (ar1 + ar8)
kr8 = (kr5 + kr7)
kr5 vco2ft kr8, 4
ar1 oscilikt ir28, kr8, kr5, ir51
ar8 = (ar10 + ar1)
ar1 = (ar8 / 3.0)
ar8 = (0.15 * ar1)
ar1 = (ar2 + ar8)
kr5 = (11.0 * kr0)
kr0 = (kr5 * kr3)
kr3 = (kr0 * kr10)
ir168 = 0.2
kr0 oscil3 ir28, ir168, 4
kr5 = (0.5 * kr0)
kr0 = (0.5 + kr5)
kr5 = (400.0 * kr0)
kr0 = (kr3 + kr5)
kr3 = (kr0 + kr6)
kr5 vco2ft kr3, 4
ar2 oscilikt ir28, kr3, kr5, ir53
kr3 vco2ft kr0, 4
ar8 oscilikt ir28, kr0, kr3, ir55
ar10 = (ar2 + ar8)
kr3 = (kr0 + kr7)
kr0 vco2ft kr3, 4
ar2 oscilikt ir28, kr3, kr0, ir57
ar8 = (ar10 + ar2)
ar2 = (ar8 / 3.0)
ar8 = (0.15 * ar2)
ar2 = (ar1 + ar8)
ar1 = (ar3 + ar2)
kr0 = (0.18 * kr4)
kr3 = (1.0 + kr0)
kr0 = (1575.0 * kr3)
ir191 = 0.26
ar3 moogladder ar1, kr0, ir191
ar1 moogladder ar3, kr0, ir191
kr0 = (0.13 * kr9)
kr3 = (1.0 + kr0)
kr0 = (2075.0 * kr3)
ir197 = 0.32
ar3 moogladder ar2, kr0, ir197
ar2 = (ar1 + ar3)
ar1 = (ar9 * ar2)
ar2 = (ar0 * ar1)
ar0 = (ar7 * ar2)
 delayw ar0
ar1 delayr 1.2
ar2 deltap3 ar5
 delayw ar0
ar3 delayr 0.25
ir213 = 0.25
ar5 deltap3 ir213
ar7 = (0.75 * ar0)
ar8 ntrpol ar0, ar6, ir28
ar6 = (0.25 * ar8)
ar8 = (ar7 + ar6)
ar6 = (0.65 * ar5)
ar9 = (ar8 + ar6)
 delayw ar9
ar6 delayr 0.25
ar9 deltap3 ir213
ar10 ntrpol ar0, ar2, ir28
ar0 = (0.25 * ar10)
ar2 = (ar7 + ar0)
ar0 = (0.65 * ar9)
ar7 = (ar2 + ar0)
 delayw ar7
arl0 init 0.0
arl1 init 0.0
ar0 = (0.75 * ar8)
ar7 = (ar5 * 1.0)
ar5 = (ar8 + ar7)
ar7 = (0.25 * ar5)
ar5 = (ar0 + ar7)
ar0 = (0.65 * ar5)
ar7 = (0.75 * ar2)
ar8 = (ar9 * 1.0)
ar9 = (ar2 + ar8)
ar2 = (0.25 * ar9)
ar8 = (ar7 + ar2)
ir250 = 0.9
ir251 = 12000.0
ar2, ar7 reverbsc ar5, ar8, ir250, ir251
ar9 = (ar5 + ar2)
ar2 = (0.35 * ar9)
ar5 = (ar0 + ar2)
ar0 clip ar5, 0.0, 0dbfs
ar2 = (ar0 * 0.8)
arl0 = ar2
ar0 = (0.65 * ar8)
ar2 = (ar8 + ar7)
ar5 = (0.35 * ar2)
ar2 = (ar0 + ar5)
ar0 clip ar2, 0.0, 0dbfs
ar2 = (ar0 * 0.8)
arl1 = ar2
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