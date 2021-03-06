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
ir13 vco2init 16, 3
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
ar0 = gargg0
ar1 = gargg1
kr0 chnget "volume"
ar2 upsamp kr0
ar3 = (1.0 * ar2)
kr0 linseg 0.0, 0.3, 1.0, 1.0, 1.0
ar2 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 0.95, 0.0
ar4 upsamp kr0
ar5 = (ar2 * ar4)
ir10 = 1.0
ir11 = p4
kr0 = cpsmidinn(ir11)
kr1 = (kr0 * 1.0)
ir14 = 4.0
kr2 oscil3 ir10, ir14, 2
kr3 = (0.5 * kr2)
kr2 = (0.5 + kr3)
kr3 = (0.4 * kr2)
kr2 = (0.2 + kr3)
ar2 vco2 ir10, kr1, 2.0, kr2
ir21 = 8.0
kr3 = cent(ir21)
kr4 = (kr1 * kr3)
kr5 vco2ft kr4, 4
ar4 oscilikt ir10, kr4, kr5
ar6 = (ar2 + ar4)
ar2 = (0.5 * ar6)
kr4 = (kr1 * 5.0)
ir29 = 0.15
ar4 moogladder ar2, kr4, ir29
ar2 = (ar5 * ar4)
kr1 = (p5 / 64.0)
kr4 = (kr1 ^ 2.0)
kr1 = (kr4 / 2.0)
ar4 upsamp kr1
ar6 = (ar2 * ar4)
ar2 = (0.6 * ar6)
ar6 = (0.75 * ar2)
kr1 = (kr0 * 0.5)
ar2 vco2 ir10, kr1, 2.0, kr2
kr0 = (kr1 * kr3)
kr2 vco2ft kr0, 4
ar7 oscilikt ir10, kr0, kr2
ar8 = (ar2 + ar7)
ar2 = (0.5 * ar8)
kr0 = (kr1 * 5.0)
ar7 moogladder ar2, kr0, ir29
ar2 = (ar5 * ar7)
ar5 = (ar2 * ar4)
ar2 = (0.6 * ar5)
ar4 = (0.375 * ar2)
ar2 = (ar6 + ar4)
ar4 = (ar3 * ar2)
ar2 = (ar0 + ar4)
gargg0 = ar2
ar0 = (ar1 + ar4)
gargg1 = ar0
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