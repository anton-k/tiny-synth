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
ir13 vco2init 16, 5
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
ir17 = rnd(ir1)
ir19 = rnd(ir1)
ir21 = rnd(ir1)
ir23 = rnd(ir1)
ir25 = rnd(ir1)
ir27 = rnd(ir1)
ar1 noise ir1, ir14
ar2 = gargg0
ar3 = gargg1
kr0 chnget "volume"
ar4 upsamp kr0
ar5 = (1.0 * ar4)
kr0 linseg 0.0, 0.85, 1.0, 1.0, 1.0
ar4 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 0.95, 0.0
ar6 upsamp kr0
ar7 = (ar4 * ar6)
ir40 = 2400.0
ir41 = 0.1
ar4 bqrez ar0, ir40, ir41
ar0 = (0.35 * ar4)
ir44 = p4
kr0 = cpsmidinn(ir44)
kr1 = (kr0 * 1.0)
kr2 oscil3 ir1, ir41, 2
kr3 = (5.0e-2 * kr2)
kr2 = (0.35 + kr3)
kr3 oscil3 ir1, kr2, 2
kr2 = (5.0e-3 * kr3)
kr4 = (1.0 + kr2)
kr2 = (kr1 * kr4)
ir54 = 50.0
kr5 = cent(ir54)
kr6 = (kr5 * -1.0)
kr7 = (kr2 + kr6)
kr8 vco2ft kr7, 4
ar4 oscilikt ir1, kr7, kr8, ir2
kr7 vco2ft kr2, 4
ar6 oscilikt ir1, kr2, kr7, ir4
ar8 = (ar4 + ar6)
kr7 = (kr5 * 1.0)
kr5 = (kr2 + kr7)
kr2 vco2ft kr5, 4
ar4 oscilikt ir1, kr5, kr2, ir6
ar6 = (ar8 + ar4)
ar4 = (ar6 / 3.0)
ir69 = 14.0
kr2 = cent(ir69)
kr5 = (kr1 * kr2)
ir72 = 0.14
kr1 oscil3 ir1, ir72, 2
kr8 = (4.3e-2 * kr1)
kr1 = (0.22 + kr8)
kr8 oscil3 ir1, kr1, 2
kr1 = (7.0e-3 * kr8)
kr9 = (1.0 + kr1)
kr1 = (kr5 * kr9)
kr5 = (kr1 + kr6)
kr10 vco2ft kr5, 4
ar6 oscilikt ir1, kr5, kr10, ir8
kr5 vco2ft kr1, 4
ar8 oscilikt ir1, kr1, kr5, ir10
ar9 = (ar6 + ar8)
kr5 = (kr1 + kr7)
kr1 vco2ft kr5, 4
ar6 oscilikt ir1, kr5, kr1, ir12
ar8 = (ar9 + ar6)
ar6 = (ar8 / 3.0)
ar8 = (ar4 + ar6)
ar4 = (ar0 + ar8)
kr1 = (0.18 * kr3)
kr3 = (1.0 + kr1)
kr1 = (1575.0 * kr3)
ir96 = 0.26
ar0 moogladder ar4, kr1, ir96
ar4 moogladder ar0, kr1, ir96
kr3 = (0.13 * kr8)
kr5 = (1.0 + kr3)
kr3 = (2075.0 * kr5)
ir102 = 0.32
ar0 moogladder ar8, kr3, ir102
ar6 = (ar4 + ar0)
ar0 = (ar7 * ar6)
kr5 = (p5 / 64.0)
kr8 = (kr5 ^ 2.0)
kr5 = (kr8 / 2.0)
ar4 upsamp kr5
ar6 = (ar0 * ar4)
ar0 = (0.75 * ar6)
ar6 bqrez ar1, ir40, ir41
ar1 = (0.35 * ar6)
kr5 = (kr0 * 0.5)
kr0 = (kr5 * kr4)
kr4 = (kr0 + kr6)
kr8 vco2ft kr4, 4
ar6 oscilikt ir1, kr4, kr8, ir17
kr4 vco2ft kr0, 4
ar8 oscilikt ir1, kr0, kr4, ir19
ar9 = (ar6 + ar8)
kr4 = (kr0 + kr7)
kr0 vco2ft kr4, 4
ar6 oscilikt ir1, kr4, kr0, ir21
ar8 = (ar9 + ar6)
ar6 = (ar8 / 3.0)
kr0 = (kr5 * kr2)
kr2 = (kr0 * kr9)
kr0 = (kr2 + kr6)
kr4 vco2ft kr0, 4
ar8 oscilikt ir1, kr0, kr4, ir23
kr0 vco2ft kr2, 4
ar9 oscilikt ir1, kr2, kr0, ir25
ar10 = (ar8 + ar9)
kr0 = (kr2 + kr7)
kr2 vco2ft kr0, 4
ar8 oscilikt ir1, kr0, kr2, ir27
ar9 = (ar10 + ar8)
ar8 = (ar9 / 3.0)
ar9 = (ar6 + ar8)
ar6 = (ar1 + ar9)
ar1 moogladder ar6, kr1, ir96
ar6 moogladder ar1, kr1, ir96
ar1 moogladder ar9, kr3, ir102
ar8 = (ar6 + ar1)
ar1 = (ar7 * ar8)
ar6 = (ar1 * ar4)
ar1 = (0.375 * ar6)
ar4 = (ar0 + ar1)
ar0 = (ar5 * ar4)
ar1 = (ar2 + ar0)
gargg0 = ar1
ar1 = (ar3 + ar0)
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