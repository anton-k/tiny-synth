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
ar2 delayr 0.25
ir15 = 0.25
ar3 deltap3 ir15
ar4 = (0.55 * ar3)
ar5 = (ar0 + ar4)
 delayw ar5
ar4 delayr 0.25
ar5 deltap3 ir15
ar6 = (0.55 * ar5)
ar7 = (ar1 + ar6)
 delayw ar7
arl0 init 0.0
arl1 init 0.0
ir34 = 0.1
kr4 portk kr1, ir34
ar6 upsamp kr4
ar7 = (1.0 - ar6)
ar8 = (ar7 * ar0)
ar9 = (0.65 * ar0)
ar10 = (ar3 * 1.0)
ar3 = (ar0 + ar10)
ar0 = (0.35 * ar3)
ar3 = (ar9 + ar0)
ar0 = (0.65 * ar1)
ar9 = (ar5 * 1.0)
ar5 = (ar1 + ar9)
ar9 = (0.35 * ar5)
ar5 = (ar0 + ar9)
ir48 = 0.6
ir49 = 12000.0
ar0, ar9 reverbsc ar3, ar5, ir48, ir49
ar10 = (ar3 + ar0)
ar0 = (ar6 * ar10)
ar3 = (ar8 + ar0)
ar0 clip ar3, 0.0, 0dbfs
ar3 = (ar0 * 0.8)
arl0 = ar3
ar0 = (ar7 * ar1)
ar1 = (ar5 + ar9)
ar3 = (ar6 * ar1)
ar1 = (ar0 + ar3)
ar0 clip ar1, 0.0, 0dbfs
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
kr0 linsegr 1.0, 1.0, 1.0, 0.25, 0.0
ar2 upsamp kr0
ar4 = (1.5 * ar2)
ir9 = (p5 / 64.0)
ir10 = (ir9 ^ 2.0)
kr0 = (ir10 / 2.0)
ar2 upsamp kr0
ar5 = (0.75 * ar2)
ir13 = (ir10 / 2.0)
ir14 = (1.275 * ir13)
ir15 = (ir14 * ir13)
ir16 = (ir15 + 1.5)
ir17 = p4
ir18 = cpsmidinn(ir17)
ir19 = (ir18 / 10000.0)
ir20 = (ir16 - ir19)
kr0 linsegr 1.0, 1.0, 1.0, ir20, 0.0
ar6 upsamp kr0
ar7 = (ar5 * ar6)
ir23 = 1.0
ir24 = 0.0
ar5 mpulse ir23, ir24
kr0 = cpsmidinn(ir17)
ar6 butlp ar5, kr0
ar5 = (0.1 * ar6)
kr1 = (1.0 * kr0)
kr2 = (3.141592653589793 * kr1)
if (sr > kr2) then
    ar8 = 1.0
else
    ar8 = 0.0
endif
kr2 downsamp ar8
kr3 = (3.984 * kr0)
kr4 = (3.141592653589793 * kr3)
if (sr > kr4) then
    ar9 = 1.0
else
    ar9 = 0.0
endif
kr4 downsamp ar9
ar10 = (ar8 + ar9)
kr5 = (10.668 * kr0)
kr6 = (3.141592653589793 * kr5)
if (sr > kr6) then
    ar11 = 1.0
else
    ar11 = 0.0
endif
kr6 downsamp ar11
ar12 = (ar10 + ar11)
kr7 = (17.979 * kr0)
kr8 = (3.141592653589793 * kr7)
if (sr > kr8) then
    ar10 = 1.0
else
    ar10 = 0.0
endif
kr8 downsamp ar10
ar13 = (ar12 + ar10)
kr9 = (23.679 * kr0)
kr10 = (3.141592653589793 * kr9)
if (sr > kr10) then
    ar12 = 1.0
else
    ar12 = 0.0
endif
kr10 downsamp ar12
ar14 = (ar13 + ar12)
kr11 = (33.642 * kr0)
kr12 = (3.141592653589793 * kr11)
if (sr > kr12) then
    ar13 = 1.0
else
    ar13 = 0.0
endif
kr12 downsamp ar13
ar15 = (ar14 + ar13)
ar14 = (1.0 / ar15)
kr13 = (1.0 - kr2)
kr14 = (kr2 * kr1)
kr1 = (kr13 + kr14)
ir56 = 2000.0
ar15 mode ar6, kr1, ir56
ar16 = (ar8 * ar15)
kr1 = (1.0 - kr4)
kr2 = (kr4 * kr3)
kr3 = (kr1 + kr2)
ar8 mode ar6, kr3, ir56
ar15 = (ar9 * ar8)
ar8 = (ar16 + ar15)
kr1 = (1.0 - kr6)
kr2 = (kr6 * kr5)
kr3 = (kr1 + kr2)
ar9 mode ar6, kr3, ir56
ar15 = (ar11 * ar9)
ar9 = (ar8 + ar15)
kr1 = (1.0 - kr8)
kr2 = (kr8 * kr7)
kr3 = (kr1 + kr2)
ar8 mode ar6, kr3, ir56
ar11 = (ar10 * ar8)
ar8 = (ar9 + ar11)
kr1 = (1.0 - kr10)
kr2 = (kr10 * kr9)
kr3 = (kr1 + kr2)
ar9 mode ar6, kr3, ir56
ar10 = (ar12 * ar9)
ar9 = (ar8 + ar10)
kr1 = (1.0 - kr12)
kr2 = (kr12 * kr11)
kr3 = (kr1 + kr2)
ar8 mode ar6, kr3, ir56
ar6 = (ar13 * ar8)
ar8 = (ar9 + ar6)
ar6 = (ar14 * ar8)
ar8 = (0.9 * ar6)
ar6 = (ar5 + ar8)
ar5 = (15.0 * ar6)
ar6 = (ar7 * ar5)
ar5 = (0.75 * ar6)
ir95 = 6500.0
ir96 = 0.1
ar6 moogladder ar5, ir95, ir96
ar5 = (ar4 * ar6)
kr1 linsegr 1.0, 1.0, 1.0, 0.75, 0.0
ar4 upsamp kr1
ar6 = (0.8 * ar4)
ar4 mpulse k(ksmps), ir24, 0.0
kr1 downsamp ar4, ksmps
ar4 upsamp kr1
ir103 = 120.0
ar7 bqrez ar4, kr0, ir103, 2.0
ar8 balance ar7, ar4
ar4 = (ar2 * ar8)
ar2 = (ar6 * ar4)
ar4 = (0.15 * ar2)
ar2 = (ar5 + ar4)
ar4 = (ar3 * ar2)
ar2 = (ar0 + ar4)
gargg0 = ar2
ar0 = (ar1 + ar4)
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