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
ir1 = (p5 / 64.0)
ir2 = (ir1 ^ 2.0)
kr0 = (ir2 / 2.0)
ar0 upsamp kr0
kr1 = (3.5 + kr0)
kr2 = (6.7 * kr0)
kr3 = (kr2 / 4.0)
kr4 = (kr3 * -9.000000000000001e-2)
kr5 = (kr3 * 0.11)
kr6 rspline kr0, kr1, kr4, kr5
kr4 = (kr3 * -8.0e-2)
kr5 = (kr3 * 0.12000000000000001)
kr3 rspline kr0, kr1, kr4, kr5
ar1 = gargg0
ar2 = gargg1
kr1 chnget "volume"
ar3 upsamp kr1
ar4 = (1.0 * ar3)
ir21 = (ir2 / 2.0)
ir22 = (ir21 * 0.3)
ir23 = (5.0e-2 + ir22)
kr1 linsegr 1.0, 1.0, 1.0, ir23, 0.0
ar3 upsamp kr1
ar5 madsr 1.0e-2, 1.0, 0.5, 0.5
ar6 = (0.5 * ar5)
ir27 = 1.0
ir28 = p4
kr1 = cpsmidinn(ir28)
ir30 = 3.0
kr4 oscil3 ir27, kr2, 2
kr5 = (0.5 * kr4)
kr4 = (0.5 + kr5)
kr5 = (kr6 * kr4)
ar5 foscili ir27, kr1, ir27, ir30, kr5, 2
kr4 = (kr2 + 0.2)
kr5 oscil3 ir27, kr4, 2
kr4 = (0.5 * kr5)
kr5 = (0.5 + kr4)
kr4 = (kr3 * kr5)
ar7 foscili ir27, kr1, ir30, ir27, kr4, 2
ar8 = (ar5 + ar7)
ir43 = 7.0
kr3 = (kr2 - 0.15)
kr2 oscil3 ir27, kr3, 2
kr3 = (0.5 * kr2)
kr2 = (0.5 + kr3)
kr3 = (kr6 * kr2)
ar5 foscili ir27, kr1, ir27, ir43, kr3, 2
ar7 = (ar8 + ar5)
ar5 = (ar7 / 3.0)
kr2 = (2.0 * kr1)
kr1 = (1000.0 + kr2)
kr2 = (500.0 * kr0)
kr3 = (kr1 + kr2)
ir56 = 0.1
kr1 = (0.5 * kr0)
kr0 = (2.0 * kr1)
ar7 lpf18 ar5, kr3, ir56, kr0
ar5 lpf18 ar7, kr3, ir56, kr0
ar7 = (ar0 * ar5)
ar0 = (ar6 * ar7)
ar5 = (ar3 * ar0)
ar0 = (ar4 * ar5)
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