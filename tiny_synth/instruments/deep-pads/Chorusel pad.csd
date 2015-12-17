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
kr1 = (kr0 * 1.0)
ar4 upsamp kr1
kr2 = (kr1 + -1.0)
ir16 = 2.0
kr3 oscil3 ir10, ir16, 2
ar6 upsamp kr3
kr4 = (kr2 + kr3)
kr2 vco2ft kr4, 0
ar7 oscilikt ir10, kr4, kr2
ar8 = (ar2 * ar7)
kr2 linseg 1.0, 13.0, 0.0, 1.0, 0.0
ir23 = 10.0
ar7 areson ar8, kr2, ir23, 1.0
kr4 = (kr1 + 0.5)
kr5 vco2ft kr4, 0
ar8 oscilikt ir10, kr4, kr5
ar9 = (ar2 * ar8)
ir29 = 40.0
ar8 areson ar9, kr2, ir29, 1.0
ar9 = (ar7 + ar8)
ar7 = (ar4 + 2.0)
ar8 = (ar7 + ar6)
ar7 oscil ir10, ar8, 4
ar8 = (ar2 * ar7)
ir36 = 60.0
ar7 areson ar8, kr2, ir36, 1.0
ar8 = (ar9 + ar7)
ar7 = (ar4 + 1.5)
ar9 = (ar7 + ar6)
ar7 oscil ir10, ar9, 4
ar9 = (ar2 * ar7)
ir43 = 80.0
ar7 areson ar9, kr2, ir43, 1.0
ar9 = (ar8 + ar7)
ar7 = (ar4 + -0.25)
ar8 oscil ir10, ar7, 4
ar7 = (ar2 * ar8)
ir49 = 50.0
ar8 areson ar7, kr2, ir49, 1.0
ar7 = (ar9 + ar8)
ar8 = (ar7 / 5.5)
kr4 = (kr1 + -0.8)
kr5 oscil3 ir10, ir16, 2
kr6 = (0.5 * kr5)
ar7 upsamp kr6
kr5 = (kr4 + kr6)
kr4 vco2ft kr5, 0
ar9 oscilikt ir10, kr5, kr4
ar10 = (ar2 * ar9)
ir60 = 70.0
ar9 areson ar10, kr2, ir60, 1.0
ar10 = (ar4 + 0.8)
ar11 = (ar10 + ar7)
ar10 oscil ir10, ar11, 4
ar11 = (ar2 * ar10)
ar10 areson ar11, kr2, ir43, 1.0
ar11 = (ar9 + ar10)
ar9 = (0.5 * ar11)
ar10 = (ar8 + ar9)
ar8 = (0.5 * ar10)
ar10 = (ar5 * ar8)
kr4 = (p5 / 64.0)
kr5 = (kr4 ^ 2.0)
kr4 = (kr5 / 2.0)
ar8 upsamp kr4
ar11 = (ar10 * ar8)
ir76 = 0.1
kr4 oscil3 ir10, ir76, 2
kr5 = (0.5 * kr4)
kr4 = (0.5 + kr5)
kr5 = (2000.0 * kr4)
kr4 = (3500.0 + kr5)
ar10 moogladder ar11, kr4, ir76
ar11 = (0.9 * ar10)
ar10 = (0.75 * ar11)
kr5 = (kr0 * 0.5)
ar11 upsamp kr5
kr0 = (kr5 + -1.0)
kr7 = (kr0 + kr3)
kr0 vco2ft kr7, 0
ar12 oscilikt ir10, kr7, kr0
ar13 = (ar2 * ar12)
ar12 areson ar13, kr2, ir23, 1.0
kr0 = (kr5 + 0.5)
kr7 vco2ft kr0, 0
ar13 oscilikt ir10, kr0, kr7
ar14 = (ar2 * ar13)
ar13 areson ar14, kr2, ir29, 1.0
ar14 = (ar12 + ar13)
ar12 = (ar11 + 2.0)
ar13 = (ar12 + ar6)
ar12 oscil ir10, ar13, 4
ar13 = (ar2 * ar12)
ar12 areson ar13, kr2, ir36, 1.0
ar13 = (ar14 + ar12)
ar12 = (ar11 + 1.5)
ar14 = (ar12 + ar6)
ar6 oscil ir10, ar14, 4
ar12 = (ar2 * ar6)
ar6 areson ar12, kr2, ir43, 1.0
ar12 = (ar13 + ar6)
ar6 = (ar11 + -0.25)
ar13 oscil ir10, ar6, 4
ar6 = (ar2 * ar13)
ar13 areson ar6, kr2, ir49, 1.0
ar6 = (ar12 + ar13)
ar12 = (ar6 / 5.5)
kr0 = (kr5 + -0.8)
kr7 = (kr0 + kr6)
kr0 vco2ft kr7, 0
ar6 oscilikt ir10, kr7, kr0
ar13 = (ar2 * ar6)
ar6 areson ar13, kr2, ir60, 1.0
ar13 = (ar11 + 0.8)
ar14 = (ar13 + ar7)
ar13 oscil ir10, ar14, 4
ar14 = (ar2 * ar13)
ar13 areson ar14, kr2, ir43, 1.0
ar14 = (ar6 + ar13)
ar6 = (0.5 * ar14)
ar13 = (ar12 + ar6)
ar12 = (0.5 * ar13)
ar13 = (ar5 * ar12)
ar12 = (ar13 * ar8)
ar13 moogladder ar12, kr4, ir76
ar12 = (0.9 * ar13)
ar13 = (0.375 * ar12)
ar12 = (ar10 + ar13)
ar10 = (ar3 * ar12)
ar12 = (ar0 + ar10)
gargg0 = ar12
ar0 = (ar4 + 1.0)
ar10 = (ar0 + ar7)
ar0 oscil ir10, ar10, 4
ar10 = (ar2 * ar0)
kr0 = (kr2 * kr3)
ir146 = 20.0
ar0 areson ar10, kr0, ir146, 1.0
ar10 = (ar4 + -0.5)
ar4 oscil ir10, ar10, 4
ar10 = (ar2 * ar4)
ir151 = 30.0
ar4 areson ar10, kr2, ir151, 1.0
ar10 = (ar0 + ar4)
kr7 = (kr1 + -2.0)
kr8 = (kr7 + kr6)
kr7 vco2ft kr8, 0
ar0 oscilikt ir10, kr8, kr7
ar4 = (ar2 * ar0)
ar0 areson ar4, kr2, ir49, 1.0
ar4 = (ar10 + ar0)
kr7 = (kr1 + -1.5)
kr8 = (kr7 + kr3)
kr7 vco2ft kr8, 0
ar0 oscilikt ir10, kr8, kr7
ar10 = (ar2 * ar0)
ar0 areson ar10, kr2, ir60, 1.0
ar10 = (ar4 + ar0)
kr7 = (kr1 + 0.25)
kr1 vco2ft kr7, 0
ar0 oscilikt ir10, kr7, kr1
ar4 = (ar2 * ar0)
ar0 areson ar4, kr2, ir36, 1.0
ar4 = (ar10 + ar0)
ar0 = (ar4 / 5.5)
ar4 = (ar0 + ar9)
ar0 = (0.5 * ar4)
ar4 = (ar5 * ar0)
ar0 = (ar4 * ar8)
ar4 moogladder ar0, kr4, ir76
ar0 = (0.9 * ar4)
ar4 = (0.75 * ar0)
ar0 = (ar11 + 1.0)
ar9 = (ar0 + ar7)
ar0 oscil ir10, ar9, 4
ar7 = (ar2 * ar0)
ar0 areson ar7, kr0, ir146, 1.0
ar7 = (ar11 + -0.5)
ar9 oscil ir10, ar7, 4
ar7 = (ar2 * ar9)
ar9 areson ar7, kr2, ir151, 1.0
ar7 = (ar0 + ar9)
kr0 = (kr5 + -2.0)
kr1 = (kr0 + kr6)
kr0 vco2ft kr1, 0
ar0 oscilikt ir10, kr1, kr0
ar9 = (ar2 * ar0)
ar0 areson ar9, kr2, ir49, 1.0
ar9 = (ar7 + ar0)
kr0 = (kr5 + -1.5)
kr1 = (kr0 + kr3)
kr0 vco2ft kr1, 0
ar0 oscilikt ir10, kr1, kr0
ar7 = (ar2 * ar0)
ar0 areson ar7, kr2, ir60, 1.0
ar7 = (ar9 + ar0)
kr0 = (kr5 + 0.25)
kr1 vco2ft kr0, 0
ar0 oscilikt ir10, kr0, kr1
ar9 = (ar2 * ar0)
ar0 areson ar9, kr2, ir36, 1.0
ar2 = (ar7 + ar0)
ar0 = (ar2 / 5.5)
ar2 = (ar0 + ar6)
ar0 = (0.5 * ar2)
ar2 = (ar5 * ar0)
ar0 = (ar2 * ar8)
ar2 moogladder ar0, kr4, ir76
ar0 = (0.9 * ar2)
ar2 = (0.375 * ar0)
ar0 = (ar4 + ar2)
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