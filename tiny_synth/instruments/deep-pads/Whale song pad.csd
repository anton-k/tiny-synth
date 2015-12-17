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
ir20 = rnd(ir1)
ir22 = rnd(ir1)
ir24 = rnd(ir1)
ir26 = rnd(ir1)
ir28 = rnd(ir1)
ir30 = rnd(ir1)
ir32 = 0.0
ar0 noise ir1, ir32
ir35 = rnd(ir1)
ir37 = rnd(ir1)
ir39 = rnd(ir1)
ir41 = rnd(ir1)
ir43 = rnd(ir1)
ir45 = rnd(ir1)
ir47 = rnd(ir1)
ir49 = rnd(ir1)
ir51 = rnd(ir1)
ir53 = rnd(ir1)
ir55 = rnd(ir1)
ir57 = rnd(ir1)
ir59 = rnd(ir1)
ir61 = rnd(ir1)
ir63 = rnd(ir1)
ar1 noise ir1, ir32
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
ir76 = 2400.0
ir77 = 0.1
ar4 bqrez ar0, ir76, ir77
ar0 = (0.35 * ar4)
ir80 = p4
kr0 = cpsmidinn(ir80)
kr1 = (kr0 * 1.0)
kr2 oscil3 ir1, ir77, 2
kr3 = (5.0e-2 * kr2)
kr2 = (0.35 + kr3)
kr3 oscil3 ir1, kr2, 2
kr2 = (5.0e-3 * kr3)
kr4 = (1.0 + kr2)
kr2 = (kr1 * kr4)
ir90 = 50.0
kr5 = cent(ir90)
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
ir105 = 14.0
kr2 = cent(ir105)
kr5 = (kr1 * kr2)
ir108 = 0.14
kr8 oscil3 ir1, ir108, 2
kr9 = (4.3e-2 * kr8)
kr8 = (0.22 + kr9)
kr9 oscil3 ir1, kr8, 2
kr8 = (7.0e-3 * kr9)
kr10 = (1.0 + kr8)
kr8 = (kr5 * kr10)
kr5 = (kr8 + kr6)
kr11 vco2ft kr5, 4
ar6 oscilikt ir1, kr5, kr11, ir8
kr5 vco2ft kr8, 4
ar8 oscilikt ir1, kr8, kr5, ir10
ar9 = (ar6 + ar8)
kr5 = (kr8 + kr7)
kr8 vco2ft kr5, 4
ar6 oscilikt ir1, kr5, kr8, ir12
ar8 = (ar9 + ar6)
ar6 = (ar8 / 3.0)
ar8 = (ar4 + ar6)
kr5 = (3.0 * kr1)
kr8 = (kr5 * kr2)
kr5 = (kr8 * kr10)
kr8 = (kr5 + kr6)
kr11 vco2ft kr8, 4
ar4 oscilikt ir1, kr8, kr11, ir14
kr8 vco2ft kr5, 4
ar6 oscilikt ir1, kr5, kr8, ir16
ar9 = (ar4 + ar6)
kr8 = (kr5 + kr7)
kr5 vco2ft kr8, 4
ar4 oscilikt ir1, kr8, kr5, ir18
ar6 = (ar9 + ar4)
ar4 = (ar6 / 3.0)
ar6 = (ar8 + ar4)
kr5 = (7.0 * kr1)
kr8 = (kr5 * kr2)
kr5 = (kr8 * kr10)
kr8 = (kr5 + kr6)
kr11 vco2ft kr8, 4
ar4 oscilikt ir1, kr8, kr11, ir20
kr8 vco2ft kr5, 4
ar8 oscilikt ir1, kr5, kr8, ir22
ar9 = (ar4 + ar8)
kr8 = (kr5 + kr7)
kr5 vco2ft kr8, 4
ar4 oscilikt ir1, kr8, kr5, ir24
ar8 = (ar9 + ar4)
ar4 = (ar8 / 3.0)
ar8 = (0.15 * ar4)
ar4 = (ar6 + ar8)
kr5 = (11.0 * kr1)
kr1 = (kr5 * kr2)
kr5 = (kr1 * kr10)
ir162 = 0.2
kr1 oscil3 ir1, ir162, 2
kr8 = (0.5 * kr1)
kr1 = (0.5 + kr8)
kr8 = (400.0 * kr1)
kr1 = (kr5 + kr8)
kr5 = (kr1 + kr6)
kr11 vco2ft kr5, 4
ar6 oscilikt ir1, kr5, kr11, ir26
kr5 vco2ft kr1, 4
ar8 oscilikt ir1, kr1, kr5, ir28
ar9 = (ar6 + ar8)
kr5 = (kr1 + kr7)
kr1 vco2ft kr5, 4
ar6 oscilikt ir1, kr5, kr1, ir30
ar8 = (ar9 + ar6)
ar6 = (ar8 / 3.0)
ar8 = (0.15 * ar6)
ar6 = (ar4 + ar8)
ar4 = (ar0 + ar6)
kr1 = (0.18 * kr3)
kr3 = (1.0 + kr1)
kr1 = (1575.0 * kr3)
ir185 = 0.26
ar0 moogladder ar4, kr1, ir185
ar4 moogladder ar0, kr1, ir185
kr3 = (0.13 * kr9)
kr5 = (1.0 + kr3)
kr3 = (2075.0 * kr5)
ir191 = 0.32
ar0 moogladder ar6, kr3, ir191
ar6 = (ar4 + ar0)
ar0 = (ar7 * ar6)
kr5 = (p5 / 64.0)
kr9 = (kr5 ^ 2.0)
kr5 = (kr9 / 2.0)
ar4 upsamp kr5
ar6 = (ar0 * ar4)
ar0 = (0.75 * ar6)
ar6 bqrez ar1, ir76, ir77
ar1 = (0.35 * ar6)
kr5 = (kr0 * 0.5)
kr0 = (kr5 * kr4)
kr4 = (kr0 + kr6)
kr9 vco2ft kr4, 4
ar6 oscilikt ir1, kr4, kr9, ir35
kr4 vco2ft kr0, 4
ar8 oscilikt ir1, kr0, kr4, ir37
ar9 = (ar6 + ar8)
kr4 = (kr0 + kr7)
kr0 vco2ft kr4, 4
ar6 oscilikt ir1, kr4, kr0, ir39
ar8 = (ar9 + ar6)
ar6 = (ar8 / 3.0)
kr0 = (kr5 * kr2)
kr4 = (kr0 * kr10)
kr0 = (kr4 + kr6)
kr9 vco2ft kr0, 4
ar8 oscilikt ir1, kr0, kr9, ir41
kr0 vco2ft kr4, 4
ar9 oscilikt ir1, kr4, kr0, ir43
ar10 = (ar8 + ar9)
kr0 = (kr4 + kr7)
kr4 vco2ft kr0, 4
ar8 oscilikt ir1, kr0, kr4, ir45
ar9 = (ar10 + ar8)
ar8 = (ar9 / 3.0)
ar9 = (ar6 + ar8)
kr0 = (3.0 * kr5)
kr4 = (kr0 * kr2)
kr0 = (kr4 * kr10)
kr4 = (kr0 + kr6)
kr9 vco2ft kr4, 4
ar6 oscilikt ir1, kr4, kr9, ir47
kr4 vco2ft kr0, 4
ar8 oscilikt ir1, kr0, kr4, ir49
ar10 = (ar6 + ar8)
kr4 = (kr0 + kr7)
kr0 vco2ft kr4, 4
ar6 oscilikt ir1, kr4, kr0, ir51
ar8 = (ar10 + ar6)
ar6 = (ar8 / 3.0)
ar8 = (ar9 + ar6)
kr0 = (7.0 * kr5)
kr4 = (kr0 * kr2)
kr0 = (kr4 * kr10)
kr4 = (kr0 + kr6)
kr9 vco2ft kr4, 4
ar6 oscilikt ir1, kr4, kr9, ir53
kr4 vco2ft kr0, 4
ar9 oscilikt ir1, kr0, kr4, ir55
ar10 = (ar6 + ar9)
kr4 = (kr0 + kr7)
kr0 vco2ft kr4, 4
ar6 oscilikt ir1, kr4, kr0, ir57
ar9 = (ar10 + ar6)
ar6 = (ar9 / 3.0)
ar9 = (0.15 * ar6)
ar6 = (ar8 + ar9)
kr0 = (11.0 * kr5)
kr4 = (kr0 * kr2)
kr0 = (kr4 * kr10)
kr2 = (kr0 + kr8)
kr0 = (kr2 + kr6)
kr4 vco2ft kr0, 4
ar8 oscilikt ir1, kr0, kr4, ir59
kr0 vco2ft kr2, 4
ar9 oscilikt ir1, kr2, kr0, ir61
ar10 = (ar8 + ar9)
kr0 = (kr2 + kr7)
kr2 vco2ft kr0, 4
ar8 oscilikt ir1, kr0, kr2, ir63
ar9 = (ar10 + ar8)
ar8 = (ar9 / 3.0)
ar9 = (0.15 * ar8)
ar8 = (ar6 + ar9)
ar6 = (ar1 + ar8)
ar1 moogladder ar6, kr1, ir185
ar6 moogladder ar1, kr1, ir185
ar1 moogladder ar8, kr3, ir191
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