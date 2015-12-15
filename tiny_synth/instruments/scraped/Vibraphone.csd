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
ar2 = (0.85 * ar0)
ir12 = 0.9
ir13 = 12000.0
ar3, ar4 reverbsc ar0, ar1, ir12, ir13
ar5 = (ar0 + ar3)
ar0 = (0.15 * ar5)
ar3 = (ar2 + ar0)
ar0 clip ar3, 0.0, 0dbfs
ar2 = (ar0 * 0.8)
arl0 = ar2
ar0 = (0.85 * ar1)
ar2 = (ar1 + ar4)
ar1 = (0.15 * ar2)
ar2 = (ar0 + ar1)
ar0 clip ar2, 0.0, 0dbfs
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

instr 18
ir1 = 5.0e-3
ar0 pinkish ir1
ar1 = gargg0
ar2 = gargg1
kr0 chnget "volume"
ar3 upsamp kr0
ar4 = (1.0 * ar3)
ir10 = (p5 / 64.0)
ir11 = (ir10 ^ 2.0)
kr0 = (ir11 / 2.0)
ar3 upsamp kr0
ar5 = (0.75 * ar3)
ar3 = (ar5 * 0.9)
kr0 linseg 0.0, 0.5, 1.0, 1.0, 1.0
ar5 upsamp kr0
ir16 = (ir11 / 2.0)
ir17 = (0.8245 * ir16)
ir18 = (ir17 * ir16)
ir19 = (ir18 + 0.97)
ir20 = p4
ir21 = cpsmidinn(ir20)
ir22 = (ir21 / 10000.0)
ir23 = (ir19 - ir22)
kr0 linsegr 1.0, 1.0, 1.0, ir23, 0.0
ar6 upsamp kr0
ar7 = (ar5 * ar6)
ar5 = (ar3 * ar7)
ir27 = 5000.0
ar3 butlp ar0, ir27
ir29 = 50.0
ar0 buthp ar3, ir29
ar3 = (0.1 * ar0)
kr0 = cpsmidinn(ir20)
kr1 = (1.0 * kr0)
kr2 = (3.141592653589793 * kr1)
if (sr > kr2) then
    ar6 = 1.0
else
    ar6 = 0.0
endif
kr2 downsamp ar6
kr3 = (3.984 * kr0)
kr4 = (3.141592653589793 * kr3)
if (sr > kr4) then
    ar7 = 1.0
else
    ar7 = 0.0
endif
kr4 downsamp ar7
ar8 = (ar6 + ar7)
kr5 = (10.668 * kr0)
kr6 = (3.141592653589793 * kr5)
if (sr > kr6) then
    ar9 = 1.0
else
    ar9 = 0.0
endif
kr6 downsamp ar9
ar10 = (ar8 + ar9)
kr7 = (17.979 * kr0)
kr8 = (3.141592653589793 * kr7)
if (sr > kr8) then
    ar8 = 1.0
else
    ar8 = 0.0
endif
kr8 downsamp ar8
ar11 = (ar10 + ar8)
kr9 = (23.679 * kr0)
kr10 = (3.141592653589793 * kr9)
if (sr > kr10) then
    ar10 = 1.0
else
    ar10 = 0.0
endif
kr10 downsamp ar10
ar12 = (ar11 + ar10)
kr11 = (33.642 * kr0)
kr0 = (3.141592653589793 * kr11)
if (sr > kr0) then
    ar11 = 1.0
else
    ar11 = 0.0
endif
kr0 downsamp ar11
ar13 = (ar12 + ar11)
ar12 = (1.0 / ar13)
kr12 = (1.0 - kr2)
kr13 = (kr2 * kr1)
kr1 = (kr12 + kr13)
ir60 = 2000.0
ar13 mode ar0, kr1, ir60
ar14 = (ar6 * ar13)
kr1 = (1.0 - kr4)
kr2 = (kr4 * kr3)
kr3 = (kr1 + kr2)
ar6 mode ar0, kr3, ir60
ar13 = (ar7 * ar6)
ar6 = (ar14 + ar13)
kr1 = (1.0 - kr6)
kr2 = (kr6 * kr5)
kr3 = (kr1 + kr2)
ar7 mode ar0, kr3, ir60
ar13 = (ar9 * ar7)
ar7 = (ar6 + ar13)
kr1 = (1.0 - kr8)
kr2 = (kr8 * kr7)
kr3 = (kr1 + kr2)
ar6 mode ar0, kr3, ir60
ar9 = (ar8 * ar6)
ar6 = (ar7 + ar9)
kr1 = (1.0 - kr10)
kr2 = (kr10 * kr9)
kr3 = (kr1 + kr2)
ar7 mode ar0, kr3, ir60
ar8 = (ar10 * ar7)
ar7 = (ar6 + ar8)
kr1 = (1.0 - kr0)
kr2 = (kr0 * kr11)
kr0 = (kr1 + kr2)
ar6 mode ar0, kr0, ir60
ar0 = (ar11 * ar6)
ar6 = (ar7 + ar0)
ar0 = (ar12 * ar6)
ar6 = (0.9 * ar0)
ar0 = (ar3 + ar6)
ar3 = (15.0 * ar0)
ar0 = (ar5 * ar3)
ar3 = (ar4 * ar0)
ar0 = (ar1 + ar3)
gargg0 = ar0
ar0 = (ar2 + ar3)
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