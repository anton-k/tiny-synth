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
ir13 vco2init 16, 1
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
arl0 init 0.0
arl1 init 0.0
ir17 = 0.1
kr4 portk kr1, ir17
ar2 upsamp kr4
ar3 = (1.0 - ar2)
ar4 = (ar3 * ar0)
ir21 = 0.8
ir22 = 12000.0
ar5, ar6 reverbsc ar0, ar1, ir21, ir22
ar7 = (ar0 + ar5)
ar0 = (ar2 * ar7)
ar5 = (ar4 + ar0)
ar0 clip ar5, 0.0, 0dbfs
ar4 = (ar0 * 0.8)
arl0 = ar4
ar0 = (ar3 * ar1)
ar3 = (ar1 + ar6)
ar1 = (ar2 * ar3)
ar2 = (ar0 + ar1)
ar0 clip ar2, 0.0, 0dbfs
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

instr 18
ir1 = 1.0
kr0 = rnd(ir1)
kr1 = rnd(ir1)
kr2 = rnd(ir1)
kr3 = rnd(ir1)
kr4 = rnd(ir1)
kr5 = rnd(ir1)
ar0 = gargg0
ar1 = gargg1
kr6 chnget "volume"
ar2 upsamp kr6
ar3 = (1.0 * ar2)
ar2 madsr 0.5, 0.0, 1.0, 1.0
ir21 = p4
kr6 = cpsmidinn(ir21)
kr7 = (kr6 * 1.0)
ir24 = -6.0
kr8 = cent(ir24)
kr9 = (kr7 * kr8)
ir27 = 2.0
kr10 vco2ft ir27, 4
kr11 oscilikt ir1, ir27, kr10
kr10 = (0.11 * kr11)
kr11 = (0.2 + kr10)
ar4 vco2 ir1, kr9, 2.0, kr11, kr0
ir33 = 6.0
kr0 = cent(ir33)
kr9 = (kr7 * kr0)
ir36 = 1.8
kr10 vco2ft ir36, 4
kr12 oscilikt ir1, ir36, kr10
kr10 = (-0.1 * kr12)
kr12 = (0.8 + kr10)
ar5 vco2 ir1, kr9, 2.0, kr12, kr1
ar6 = (ar4 + ar5)
kr1 = (kr7 * 0.5)
ar4 vco2 ir1, kr1, 2.0, kr11, kr2
ar5 = (ar6 + ar4)
ar4 = (ar2 * ar5)
kr1 = (kr7 * 2.0)
kr2 = (3500.0 + kr1)
ir49 = 0.1
ar5 moogladder ar4, kr2, ir49
ar4 = (0.3 * ar5)
kr1 = (p5 / 64.0)
kr2 = (kr1 ^ 2.0)
kr1 = (kr2 / 2.0)
ar5 upsamp kr1
ar6 = (ar4 * ar5)
ar4 = (0.55 * ar6)
ar6 = (0.75 * ar4)
kr1 = (kr6 * 0.5)
kr2 = (kr1 * kr8)
ar4 vco2 ir1, kr2, 2.0, kr11, kr3
kr2 = (kr1 * kr0)
ar7 vco2 ir1, kr2, 2.0, kr12, kr4
ar8 = (ar4 + ar7)
kr0 = (kr1 * 0.5)
ar4 vco2 ir1, kr0, 2.0, kr11, kr5
ar7 = (ar8 + ar4)
ar4 = (ar2 * ar7)
kr0 = (kr1 * 2.0)
kr1 = (3500.0 + kr0)
ar2 moogladder ar4, kr1, ir49
ar4 = (0.3 * ar2)
ar2 = (ar4 * ar5)
ar4 = (0.55 * ar2)
ar2 = (0.375 * ar4)
ar4 = (ar6 + ar2)
ar2 = (ar3 * ar4)
ar3 = (ar0 + ar2)
gargg0 = ar3
ar0 = (ar1 + ar2)
gargg1 = ar0
endin

</CsInstruments>

<CsScore>



f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>