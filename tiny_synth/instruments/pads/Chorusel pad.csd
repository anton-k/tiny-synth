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
kr0 linseg 0.0, 0.65, 1.0, 1.0, 1.0
ar2 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 1.0, 0.0
ar4 upsamp kr0
ar5 = (ar2 * ar4)
ir10 = 1.0
ar2 linen ir10, 0.5, 13.0, 10.0
ir12 = p4
kr0 = cpsmidinn(ir12)
ar4 upsamp kr0
kr1 = (kr0 + -1.0)
ir15 = 2.0
kr2 oscil3 ir10, ir15, 2
ar6 upsamp kr2
kr3 = (kr1 + kr2)
kr1 vco2ft kr3, 0
ar7 oscilikt ir10, kr3, kr1
ar8 = (ar2 * ar7)
kr1 linseg 1.0, 13.0, 0.0, 1.0, 0.0
ir22 = 10.0
ar7 areson ar8, kr1, ir22, 1.0
kr3 = (kr0 + 0.5)
kr4 vco2ft kr3, 0
ar8 oscilikt ir10, kr3, kr4
ar9 = (ar2 * ar8)
ir28 = 40.0
ar8 areson ar9, kr1, ir28, 1.0
ar9 = (ar7 + ar8)
ar7 = (ar4 + 2.0)
ar8 = (ar7 + ar6)
ar7 oscil ir10, ar8, 4
ar8 = (ar2 * ar7)
ir35 = 60.0
ar7 areson ar8, kr1, ir35, 1.0
ar8 = (ar9 + ar7)
ar7 = (ar4 + 1.5)
ar9 = (ar7 + ar6)
ar6 oscil ir10, ar9, 4
ar7 = (ar2 * ar6)
ir42 = 80.0
ar6 areson ar7, kr1, ir42, 1.0
ar7 = (ar8 + ar6)
ar6 = (ar4 + -0.25)
ar8 oscil ir10, ar6, 4
ar6 = (ar2 * ar8)
ir48 = 50.0
ar8 areson ar6, kr1, ir48, 1.0
ar6 = (ar7 + ar8)
ar7 = (ar6 / 5.5)
kr3 = (kr0 + -0.8)
kr4 oscil3 ir10, ir15, 2
kr5 = (0.5 * kr4)
ar6 upsamp kr5
kr4 = (kr3 + kr5)
kr3 vco2ft kr4, 0
ar8 oscilikt ir10, kr4, kr3
ar9 = (ar2 * ar8)
ir59 = 70.0
ar8 areson ar9, kr1, ir59, 1.0
ar9 = (ar4 + 0.8)
ar10 = (ar9 + ar6)
ar9 oscil ir10, ar10, 4
ar10 = (ar2 * ar9)
ar9 areson ar10, kr1, ir42, 1.0
ar10 = (ar8 + ar9)
ar8 = (0.5 * ar10)
ar9 = (ar7 + ar8)
ar7 = (0.5 * ar9)
ar9 = (ar5 * ar7)
kr3 = (p5 / 64.0)
kr4 = (kr3 ^ 2.0)
kr3 = (kr4 / 2.0)
ar7 upsamp kr3
ar10 = (ar9 * ar7)
ir75 = 0.1
kr3 oscil3 ir10, ir75, 2
kr4 = (0.5 * kr3)
kr3 = (0.5 + kr4)
kr4 = (2000.0 * kr3)
kr3 = (3500.0 + kr4)
ar9 moogladder ar10, kr3, ir75
ar10 = (0.9 * ar9)
ar9 = (ar3 * ar10)
ar10 = (ar0 + ar9)
gargg0 = ar10
ar0 = (ar4 + 1.0)
ar9 = (ar0 + ar6)
ar0 oscil ir10, ar9, 4
ar6 = (ar2 * ar0)
kr4 = (kr1 * kr2)
ir92 = 20.0
ar0 areson ar6, kr4, ir92, 1.0
ar6 = (ar4 + -0.5)
ar4 oscil ir10, ar6, 4
ar6 = (ar2 * ar4)
ir97 = 30.0
ar4 areson ar6, kr1, ir97, 1.0
ar6 = (ar0 + ar4)
kr4 = (kr0 + -2.0)
kr6 = (kr4 + kr5)
kr4 vco2ft kr6, 0
ar0 oscilikt ir10, kr6, kr4
ar4 = (ar2 * ar0)
ar0 areson ar4, kr1, ir48, 1.0
ar4 = (ar6 + ar0)
kr4 = (kr0 + -1.5)
kr5 = (kr4 + kr2)
kr2 vco2ft kr5, 0
ar0 oscilikt ir10, kr5, kr2
ar6 = (ar2 * ar0)
ar0 areson ar6, kr1, ir59, 1.0
ar6 = (ar4 + ar0)
kr2 = (kr0 + 0.25)
kr0 vco2ft kr2, 0
ar0 oscilikt ir10, kr2, kr0
ar4 = (ar2 * ar0)
ar0 areson ar4, kr1, ir35, 1.0
ar2 = (ar6 + ar0)
ar0 = (ar2 / 5.5)
ar2 = (ar0 + ar8)
ar0 = (0.5 * ar2)
ar2 = (ar5 * ar0)
ar0 = (ar2 * ar7)
ar2 moogladder ar0, kr3, ir75
ar0 = (0.9 * ar2)
ar2 = (ar3 * ar0)
ar0 = (ar1 + ar2)
gargg1 = ar0
endin

</CsInstruments>

<CsScore>

f4 0 8192 10  0.28 1.0 0.74 0.66 0.78 0.48 5.0e-2 0.33 0.12 8.0e-2 1.0e-2 0.54 0.19 8.0e-2 5.0e-2 0.16 1.0e-2 0.11 0.3 2.0e-2 0.2
f2 0 8192 10  1.0

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>