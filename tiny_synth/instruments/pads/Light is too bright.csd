<CsoundSynthesizer>

<CsOptions>

--output=dac --nodisplays

</CsOptions>

<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1.0
gargg1 init 0.0
gargg0 init 0.0
ir13 vco2init 1, 5
irlft = ir13
ir16 vco2init 16, irlft
irlft = ir16
giPort init 1
opcode FreePort, i, 0
xout giPort
giPort = giPort + 1
endop




instr main
if (p4 == 1.0) then
    ir3 = (p5 / 1000.0)
    ir4 = (18 + ir3)
     event "i", ir4, 0.0, -1.0, p5, p6
endif
if (p4 == 0.0) then
    ir11 = (p5 / 1000.0)
    ir12 = (18 + ir11)
    ir13 = (-ir12)
     event "i", ir13, 0.0, 0.0, p5, p6
endif
 turnoff 
endin

instr 22

endin

instr 21
gargg1 = 0.0
gargg0 = 0.0
 event_i "i", 20, 604800.0, 1.0e-2
endin

instr 20
 turnoff2 19, 0.0, 0.0
 turnoff2 18, 0.0, 0.0
 exitnow 
endin

instr 19
kr0 chnget "volume"
ar0 = gargg0
ar1 = gargg1
ar2 delayr 1.2
ir9 = 1.0
ir10 = 3.75
ar3 oscil3 ir9, ir10, 4
ar4 = (2.1000000000000003e-3 * ar3)
ar3 = (ar4 + 1.0e-2)
ar4 deltap3 ar3
 delayw ar0
ar5 delayr 1.2
ar6 deltap3 ar3
 delayw ar1
ar3 delayr 0.25
ir26 = 0.25
ar7 deltap3 ir26
ar8 = (0.75 * ar0)
ar9 ntrpol ar0, ar4, ir9
ar0 = (0.25 * ar9)
ar4 = (ar8 + ar0)
ar0 = (0.65 * ar7)
ar8 = (ar4 + ar0)
 delayw ar8
ar0 delayr 0.25
ar8 deltap3 ir26
ar9 = (0.75 * ar1)
ar10 ntrpol ar1, ar6, ir9
ar1 = (0.25 * ar10)
ar6 = (ar9 + ar1)
ar1 = (0.65 * ar8)
ar9 = (ar6 + ar1)
 delayw ar9
arl0 init 0.0
arl1 init 0.0
ar1 = (0.75 * ar4)
ar9 = (ar7 * 1.0)
ar7 = (ar4 + ar9)
ar4 = (0.25 * ar7)
ar7 = (ar1 + ar4)
ar1 = (0.65 * ar7)
ar4 = (0.75 * ar6)
ar9 = (ar8 * 1.0)
ar8 = (ar6 + ar9)
ar6 = (0.25 * ar8)
ar8 = (ar4 + ar6)
ir64 = 0.9
ir65 = 12000.0
ar4, ar6 reverbsc ar7, ar8, ir64, ir65
ar9 = (ar7 + ar4)
ar4 = (0.35 * ar9)
ar7 = (ar1 + ar4)
ar1 clip ar7, 0.0, 0dbfs
ar4 = (ar1 * 0.8)
arl0 = ar4
ar1 = (0.65 * ar8)
ar4 = (ar8 + ar6)
ar6 = (0.35 * ar4)
ar4 = (ar1 + ar6)
ar1 clip ar4, 0.0, 0dbfs
ar4 = (ar1 * 0.8)
arl1 = ar4
ar1 = arl0
ar4 = arl1
 outs ar1, ar4
endin

instr 18
ir1 = 1.0
ir2 = rnd(ir1)
ir4 = rnd(ir1)
ir6 = rnd(ir1)
ir8 = rnd(ir1)
ir10 = rnd(ir1)
ir12 = rnd(ir1)
ir14 = rnd(ir1)
ir16 = rnd(ir1)
ir18 = rnd(ir1)
ir20 = 0.0
ar0 noise ir1, ir20
ar1 = gargg0
ar2 = gargg1
kr0 chnget "volume"
ar3 upsamp kr0
ar4 = (1.0 * ar3)
kr0 linseg 0.0, 0.85, 1.0, 1.0, 1.0
ar3 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 0.95, 0.0
ar5 upsamp kr0
ar6 = (ar3 * ar5)
ir32 = 2400.0
ir33 = 0.1
ar3 bqrez ar0, ir32, ir33
ar0 = (0.35 * ar3)
ir36 = p4
kr0 = cpsmidinn(ir36)
ar3 upsamp kr0
kr1 oscil3 ir1, ir33, 2
kr2 = (5.0e-2 * kr1)
kr1 = (0.35 + kr2)
kr2 oscil3 ir1, kr1, 2
kr1 = (5.0e-3 * kr2)
kr3 = (1.0 + kr1)
kr1 = (kr0 * kr3)
ir45 = 50.0
kr3 = cent(ir45)
kr4 = (kr3 * -1.0)
kr5 = (kr1 + kr4)
kr6 vco2ft kr5, 0
ar5 oscilikt ir1, kr5, kr6, ir2
kr5 vco2ft kr1, 0
ar7 oscilikt ir1, kr1, kr5, ir4
ar8 = (ar5 + ar7)
kr5 = (kr3 * 1.0)
kr3 = (kr1 + kr5)
kr1 vco2ft kr3, 0
ar5 oscilikt ir1, kr3, kr1, ir6
ar7 = (ar8 + ar5)
ar5 = (ar7 / 3.0)
ir60 = 14.0
kr1 = cent(ir60)
kr3 = (kr0 * kr1)
ir63 = 0.14
kr1 oscil3 ir1, ir63, 2
kr6 = (4.3e-2 * kr1)
kr1 = (0.22 + kr6)
kr6 oscil3 ir1, kr1, 2
kr1 = (7.0e-3 * kr6)
kr7 = (1.0 + kr1)
ar7 upsamp kr7
kr1 = (kr3 * kr7)
kr3 = (kr1 + kr4)
kr4 vco2ft kr3, 0
ar8 oscilikt ir1, kr3, kr4, ir8
kr3 vco2ft kr1, 0
ar9 oscilikt ir1, kr1, kr3, ir10
ar10 = (ar8 + ar9)
kr3 = (kr1 + kr5)
kr1 vco2ft kr3, 0
ar8 oscilikt ir1, kr3, kr1, ir12
ar9 = (ar10 + ar8)
ar8 = (ar9 / 3.0)
ar9 = (ar5 + ar8)
ir83 = 0.25
ar5 oscil3 ir1, ir83, 2
ar8 = (0.5 * ar5)
ar5 = (0.5 + ar8)
kr1 = (kr0 * 7.0)
ir88 = 4.0
kr3 = cent(ir88)
kr4 = (kr1 * kr3)
kr1 = (kr4 * kr7)
kr3 vco2ft kr1, 4
ar8 oscilikt ir1, kr1, kr3, ir14
ar10 = (ar5 * ar8)
ir95 = 2.0
ir96 = 0.5
kr1 loopseg ir95, ir20, 0.0, ir20, ir1, ir1, ir20, ir20, ir1, ir96, ir20, ir20, ir1, ir83, ir20
ir98 = 1.0e-3
kr3 portk kr1, ir98
ar5 upsamp kr3
ir100 = 0.17
ar8 oscil3 ir1, ir100, 2
ar11 = (0.5 * ar8)
ar8 = (0.5 + ar11)
ar11 = (ar5 * ar8)
kr1 = (kr0 * 13.0)
kr0 = (kr1 * kr7)
kr1 vco2ft kr0, 4
ar5 oscilikt ir1, kr0, kr1, ir16
ar8 = (ar11 * ar5)
ar5 = (ar10 + ar8)
kr0 lpshold ir95, ir20, 0.0, ir1, ir1, ir20, ir1, ir96, ir1, ir20, ir1, ir83, ir1, ir20, ir1, ir33, ir1, ir20, ir1
kr1 portk kr0, ir98
ar8 upsamp kr1
ir113 = 0.28
ar10 oscil3 ir1, ir113, 2
ar11 = (0.5 * ar10)
ar10 = (0.5 + ar11)
ar11 = (ar8 * ar10)
ar8 = (ar3 * 9.0)
ir119 = 3.0
ar3 upsamp k(ir119)
ar10 = cent(ar3)
ar3 = (ar8 * ar10)
ar8 = (ar3 * ar7)
ar3 oscil3 ir1, ar8, 2, ir18
ar7 = (ar11 * ar3)
ar3 = (ar5 + ar7)
ar5 = (0.3 * ar3)
ar3 = (ar9 + ar5)
ar5 = (ar0 + ar3)
kr0 = (0.18 * kr2)
kr1 = (1.0 + kr0)
kr0 = (2075.0 * kr1)
ir132 = 0.26
ar0 moogladder ar5, kr0, ir132
ar5 moogladder ar0, kr0, ir132
kr0 = (0.13 * kr6)
kr1 = (1.0 + kr0)
kr0 = (2575.0 * kr1)
ir138 = 0.32
ar0 moogladder ar3, kr0, ir138
ar3 = (ar5 + ar0)
ar0 = (ar6 * ar3)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar3 upsamp kr0
ar5 = (ar0 * ar3)
ar0 = (ar4 * ar5)
ar3 = (ar1 + ar0)
gargg0 = ar3
ar1 = (ar2 + ar0)
gargg1 = ar1
endin

</CsInstruments>

<CsScore>

f2 0 8192 10  1.0
f4 0 8192 19  0.5 1.0 180.0 1.0

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>