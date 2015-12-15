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
arl0 init 0.0
arl1 init 0.0
ar2 = (0.65 * ar0)
ir12 = 0.9
ir13 = 12000.0
ar3, ar4 reverbsc ar0, ar1, ir12, ir13
ar5 = (ar0 + ar3)
ar0 = (0.35 * ar5)
ar3 = (ar2 + ar0)
ar0 clip ar3, 0.0, 0dbfs
ar2 = (ar0 * 0.8)
arl0 = ar2
ar0 = (0.65 * ar1)
ar2 = (ar1 + ar4)
ar1 = (0.35 * ar2)
ar2 = (ar0 + ar1)
ar0 clip ar2, 0.0, 0dbfs
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

instr 18
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar0 upsamp kr0
kr1 = (3.5 + kr0)
ir5 = -1.1250000000000001e-2
ir6 = 1.375e-2
kr2 rspline kr0, kr1, ir5, ir6
ir9 = -1.0e-2
ir10 = 1.5000000000000001e-2
kr3 rspline kr0, kr1, ir9, ir10
kr4 rspline kr0, kr1, ir5, ir6
kr5 rspline kr0, kr1, ir9, ir10
ar1 = gargg0
ar2 = gargg1
kr1 chnget "volume"
ar3 upsamp kr1
ar4 = (1.0 * ar3)
ar3 madsr 0.5, 0.0, 1.0, 1.0
ir24 = 1.0
ir25 = p4
kr1 = cpsmidinn(ir25)
ir27 = 3.0
ir28 = 0.5
kr6 oscil3 ir24, ir28, 2
kr7 = (0.5 * kr6)
kr6 = (0.5 + kr7)
kr7 = (kr2 * kr6)
ar5 foscili ir24, kr1, ir24, ir27, kr7, 2
ir34 = 0.7
kr7 oscil3 ir24, ir34, 2
kr8 = (0.5 * kr7)
kr7 = (0.5 + kr8)
kr8 = (kr3 * kr7)
ar6 foscili ir24, kr1, ir27, ir24, kr8, 2
ar7 = (ar5 + ar6)
ir41 = 7.0
ir42 = 0.35
kr3 oscil3 ir24, ir42, 2
kr8 = (0.5 * kr3)
kr3 = (0.5 + kr8)
kr8 = (kr2 * kr3)
ar5 foscili ir24, kr1, ir24, ir41, kr8, 2
ar6 = (ar7 + ar5)
ar5 = (ar6 / 3.0)
kr2 = (2.0 * kr1)
kr8 = (1000.0 + kr2)
kr2 = (500.0 * kr0)
kr0 = (kr8 + kr2)
ir54 = 0.1
ar6 moogladder ar5, kr0, ir54
ar5 = (ar0 * ar6)
ar6 = (ar3 * ar5)
kr0 = (kr1 * 0.5)
kr1 = (kr4 * kr6)
ar5 foscili ir24, kr0, ir24, ir27, kr1, 2
kr1 = (kr5 * kr7)
ar7 foscili ir24, kr0, ir27, ir24, kr1, 2
ar8 = (ar5 + ar7)
kr1 = (kr4 * kr3)
ar5 foscili ir24, kr0, ir24, ir41, kr1, 2
ar7 = (ar8 + ar5)
ar5 = (ar7 / 3.0)
kr1 = (2.0 * kr0)
kr0 = (1000.0 + kr1)
kr1 = (kr0 + kr2)
ar7 moogladder ar5, kr1, ir54
ar5 = (ar0 * ar7)
ar0 = (ar3 * ar5)
ar3 = (0.75 * ar0)
ar0 = (ar6 + ar3)
ar3 = (0.6 * ar0)
ar0 = (ar4 * ar3)
ar3 = (ar1 + ar0)
gargg0 = ar3
ar1 = (ar2 + ar0)
gargg1 = ar1
endin

</CsInstruments>

<CsScore>

f2 0 8192 10  1.0

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>