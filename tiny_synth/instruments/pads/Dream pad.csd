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
ir14 = 0.0
ar0 noise ir1, ir14
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
ir26 = 2400.0
ir27 = 0.1
ar3 bqrez ar0, ir26, ir27
ar0 = (0.35 * ar3)
ir30 = p4
kr0 = cpsmidinn(ir30)
kr1 oscil3 ir1, ir27, 2
kr2 = (5.0e-2 * kr1)
kr1 = (0.35 + kr2)
kr2 oscil3 ir1, kr1, 2
kr1 = (5.0e-3 * kr2)
kr3 = (1.0 + kr1)
kr1 = (kr0 * kr3)
ir39 = 50.0
kr3 = cent(ir39)
kr4 = (kr3 * -1.0)
kr5 = (kr1 + kr4)
kr6 vco2ft kr5, 0
ar3 oscilikt ir1, kr5, kr6, ir2
kr5 vco2ft kr1, 0
ar5 oscilikt ir1, kr1, kr5, ir4
ar7 = (ar3 + ar5)
kr5 = (kr3 * 1.0)
kr3 = (kr1 + kr5)
kr1 vco2ft kr3, 0
ar3 oscilikt ir1, kr3, kr1, ir6
ar5 = (ar7 + ar3)
ar3 = (ar5 / 3.0)
ir54 = 14.0
kr1 = cent(ir54)
kr3 = (kr0 * kr1)
ir57 = 0.14
kr0 oscil3 ir1, ir57, 2
kr1 = (4.3e-2 * kr0)
kr0 = (0.22 + kr1)
kr1 oscil3 ir1, kr0, 2
kr0 = (7.0e-3 * kr1)
kr6 = (1.0 + kr0)
kr0 = (kr3 * kr6)
kr3 = (kr0 + kr4)
kr4 vco2ft kr3, 0
ar5 oscilikt ir1, kr3, kr4, ir8
kr3 vco2ft kr0, 0
ar7 oscilikt ir1, kr0, kr3, ir10
ar8 = (ar5 + ar7)
kr3 = (kr0 + kr5)
kr0 vco2ft kr3, 0
ar5 oscilikt ir1, kr3, kr0, ir12
ar7 = (ar8 + ar5)
ar5 = (ar7 / 3.0)
ar7 = (ar3 + ar5)
ar3 = (ar0 + ar7)
kr0 = (0.18 * kr2)
kr2 = (1.0 + kr0)
kr0 = (1575.0 * kr2)
ir81 = 0.26
ar0 moogladder ar3, kr0, ir81
ar3 moogladder ar0, kr0, ir81
kr0 = (0.13 * kr1)
kr1 = (1.0 + kr0)
kr0 = (2075.0 * kr1)
ir87 = 0.32
ar0 moogladder ar7, kr0, ir87
ar5 = (ar3 + ar0)
ar0 = (ar6 * ar5)
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