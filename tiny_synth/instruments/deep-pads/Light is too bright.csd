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
kr1 chnget "fx"
kr2 chnget "cut-off"
kr3 chnget "resonance"
ar0 = gargg0
ar1 = gargg1
ar2 delayr 1.2
ir15 = 1.0
ir16 = 3.75
ar3 oscil3 ir15, ir16, 4
ar4 = (2.1000000000000003e-3 * ar3)
ar3 = (ar4 + 1.0e-2)
ar4 deltap3 ar3
 delayw ar0
ar5 delayr 1.2
ar6 deltap3 ar3
 delayw ar1
ar3 delayr 0.25
ir32 = 0.25
ar7 deltap3 ir32
ar8 = (0.75 * ar0)
ar9 ntrpol ar0, ar4, ir15
ar0 = (0.25 * ar9)
ar4 = (ar8 + ar0)
ar0 = (0.65 * ar7)
ar8 = (ar4 + ar0)
 delayw ar8
ar0 delayr 0.25
ar8 deltap3 ir32
ar9 = (0.75 * ar1)
ar10 ntrpol ar1, ar6, ir15
ar1 = (0.25 * ar10)
ar6 = (ar9 + ar1)
ar1 = (0.65 * ar8)
ar9 = (ar6 + ar1)
 delayw ar9
arl0 init 0.0
arl1 init 0.0
ir59 = 0.1
kr4 portk kr1, ir59
ar1 upsamp kr4
ar9 = (1.0 - ar1)
ar10 = (0.75 * ar4)
ar11 = (ar7 * 1.0)
ar7 = (ar4 + ar11)
ar4 = (0.25 * ar7)
ar7 = (ar10 + ar4)
ar4 = (ar9 * ar7)
ar10 = (0.75 * ar6)
ar11 = (ar8 * 1.0)
ar8 = (ar6 + ar11)
ar6 = (0.25 * ar8)
ar8 = (ar10 + ar6)
ir73 = 0.9
ir74 = 12000.0
ar6, ar10 reverbsc ar7, ar8, ir73, ir74
ar11 = (ar7 + ar6)
ar6 = (ar1 * ar11)
ar7 = (ar4 + ar6)
ar4 clip ar7, 0.0, 0dbfs
ar6 = (ar4 * 0.8)
arl0 = ar6
ar4 = (ar9 * ar8)
ar6 = (ar8 + ar10)
ar7 = (ar1 * ar6)
ar1 = (ar4 + ar7)
ar4 clip ar1, 0.0, 0dbfs
ar1 = (ar4 * 0.8)
arl1 = ar1
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
ir23 = rnd(ir1)
ir25 = rnd(ir1)
ir27 = rnd(ir1)
ir29 = rnd(ir1)
ir31 = rnd(ir1)
ir33 = rnd(ir1)
ir35 = rnd(ir1)
ir37 = rnd(ir1)
ir39 = rnd(ir1)
ar1 noise ir1, ir20
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
ir52 = 2400.0
ir53 = 0.1
ar4 bqrez ar0, ir52, ir53
ar0 = (0.35 * ar4)
ir56 = p4
kr0 = cpsmidinn(ir56)
kr1 = (kr0 * 1.0)
ar4 upsamp kr1
kr2 oscil3 ir1, ir53, 2
kr3 = (5.0e-2 * kr2)
kr2 = (0.35 + kr3)
kr3 oscil3 ir1, kr2, 2
kr2 = (5.0e-3 * kr3)
kr4 = (1.0 + kr2)
kr2 = (kr1 * kr4)
ir66 = 50.0
kr5 = cent(ir66)
kr6 = (kr5 * -1.0)
kr7 = (kr2 + kr6)
kr8 vco2ft kr7, 0
ar6 oscilikt ir1, kr7, kr8, ir2
kr7 vco2ft kr2, 0
ar8 oscilikt ir1, kr2, kr7, ir4
ar9 = (ar6 + ar8)
kr7 = (kr5 * 1.0)
kr5 = (kr2 + kr7)
kr2 vco2ft kr5, 0
ar6 oscilikt ir1, kr5, kr2, ir6
ar8 = (ar9 + ar6)
ar6 = (ar8 / 3.0)
ir81 = 14.0
kr2 = cent(ir81)
kr5 = (kr1 * kr2)
ir84 = 0.14
kr8 oscil3 ir1, ir84, 2
kr9 = (4.3e-2 * kr8)
kr8 = (0.22 + kr9)
kr9 oscil3 ir1, kr8, 2
kr8 = (7.0e-3 * kr9)
kr10 = (1.0 + kr8)
ar8 upsamp kr10
kr8 = (kr5 * kr10)
kr5 = (kr8 + kr6)
kr11 vco2ft kr5, 0
ar9 oscilikt ir1, kr5, kr11, ir8
kr5 vco2ft kr8, 0
ar10 oscilikt ir1, kr8, kr5, ir10
ar11 = (ar9 + ar10)
kr5 = (kr8 + kr7)
kr8 vco2ft kr5, 0
ar9 oscilikt ir1, kr5, kr8, ir12
ar10 = (ar11 + ar9)
ar9 = (ar10 / 3.0)
ar10 = (ar6 + ar9)
ir104 = 0.25
ar6 oscil3 ir1, ir104, 2
ar9 = (0.5 * ar6)
ar6 = (0.5 + ar9)
kr5 = (kr1 * 7.0)
ir109 = 4.0
kr8 = cent(ir109)
kr11 = (kr5 * kr8)
kr5 = (kr11 * kr10)
kr11 vco2ft kr5, 4
ar9 oscilikt ir1, kr5, kr11, ir14
ar11 = (ar6 * ar9)
ir116 = 2.0
ir117 = 0.5
kr5 loopseg ir116, ir20, 0.0, ir20, ir1, ir1, ir20, ir20, ir1, ir117, ir20, ir20, ir1, ir104, ir20
ir119 = 1.0e-3
kr11 portk kr5, ir119
ar9 upsamp kr11
ir121 = 0.17
ar12 oscil3 ir1, ir121, 2
ar13 = (0.5 * ar12)
ar12 = (0.5 + ar13)
ar13 = (ar9 * ar12)
kr5 = (kr1 * 13.0)
kr1 = (kr5 * kr10)
kr5 vco2ft kr1, 4
ar9 oscilikt ir1, kr1, kr5, ir16
ar12 = (ar13 * ar9)
ar9 = (ar11 + ar12)
kr1 lpshold ir116, ir20, 0.0, ir1, ir1, ir20, ir1, ir117, ir1, ir20, ir1, ir104, ir1, ir20, ir1, ir53, ir1, ir20, ir1
kr5 portk kr1, ir119
ar11 upsamp kr5
ir134 = 0.28
ar12 oscil3 ir1, ir134, 2
ar14 = (0.5 * ar12)
ar12 = (0.5 + ar14)
ar14 = (ar11 * ar12)
ar11 = (ar4 * 9.0)
ir140 = 3.0
ar4 upsamp k(ir140)
ar12 = cent(ar4)
ar4 = (ar11 * ar12)
ar11 = (ar4 * ar8)
ar4 oscil3 ir1, ar11, 2, ir18
ar11 = (ar14 * ar4)
ar4 = (ar9 + ar11)
ar9 = (0.3 * ar4)
ar4 = (ar10 + ar9)
ar9 = (ar0 + ar4)
kr1 = (0.18 * kr3)
kr3 = (1.0 + kr1)
kr1 = (2075.0 * kr3)
ir153 = 0.26
ar0 moogladder ar9, kr1, ir153
ar9 moogladder ar0, kr1, ir153
kr3 = (0.13 * kr9)
kr5 = (1.0 + kr3)
kr3 = (2575.0 * kr5)
ir159 = 0.32
ar0 moogladder ar4, kr3, ir159
ar4 = (ar9 + ar0)
ar0 = (ar7 * ar4)
kr5 = (p5 / 64.0)
kr9 = (kr5 ^ 2.0)
kr5 = (kr9 / 2.0)
ar4 upsamp kr5
ar9 = (ar0 * ar4)
ar0 = (0.75 * ar9)
ar9 bqrez ar1, ir52, ir53
ar1 = (0.35 * ar9)
kr5 = (kr0 * 0.5)
ar9 upsamp kr5
kr0 = (kr5 * kr4)
kr4 = (kr0 + kr6)
kr9 vco2ft kr4, 0
ar10 oscilikt ir1, kr4, kr9, ir23
kr4 vco2ft kr0, 0
ar11 oscilikt ir1, kr0, kr4, ir25
ar15 = (ar10 + ar11)
kr4 = (kr0 + kr7)
kr0 vco2ft kr4, 0
ar10 oscilikt ir1, kr4, kr0, ir27
ar11 = (ar15 + ar10)
ar10 = (ar11 / 3.0)
kr0 = (kr5 * kr2)
kr2 = (kr0 * kr10)
kr0 = (kr2 + kr6)
kr4 vco2ft kr0, 0
ar11 oscilikt ir1, kr0, kr4, ir29
kr0 vco2ft kr2, 0
ar15 oscilikt ir1, kr2, kr0, ir31
ar16 = (ar11 + ar15)
kr0 = (kr2 + kr7)
kr2 vco2ft kr0, 0
ar11 oscilikt ir1, kr0, kr2, ir33
ar15 = (ar16 + ar11)
ar11 = (ar15 / 3.0)
ar15 = (ar10 + ar11)
kr0 = (kr5 * 7.0)
kr2 = (kr0 * kr8)
kr0 = (kr2 * kr10)
kr2 vco2ft kr0, 4
ar10 oscilikt ir1, kr0, kr2, ir35
ar11 = (ar6 * ar10)
kr0 = (kr5 * 13.0)
kr2 = (kr0 * kr10)
kr0 vco2ft kr2, 4
ar6 oscilikt ir1, kr2, kr0, ir37
ar10 = (ar13 * ar6)
ar6 = (ar11 + ar10)
ar10 = (ar9 * 9.0)
ar9 = (ar10 * ar12)
ar10 = (ar9 * ar8)
ar8 oscil3 ir1, ar10, 2, ir39
ar9 = (ar14 * ar8)
ar8 = (ar6 + ar9)
ar6 = (0.3 * ar8)
ar8 = (ar15 + ar6)
ar6 = (ar1 + ar8)
ar1 moogladder ar6, kr1, ir153
ar6 moogladder ar1, kr1, ir153
ar1 moogladder ar8, kr3, ir159
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