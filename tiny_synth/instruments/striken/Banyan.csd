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
ar2 delayr 0.25
ir9 = 0.25
ar3 deltap3 ir9
ar4 = (0.55 * ar3)
ar5 = (ar0 + ar4)
 delayw ar5
ar4 delayr 0.25
ar5 deltap3 ir9
ar6 = (0.55 * ar5)
ar7 = (ar1 + ar6)
 delayw ar7
arl0 init 0.0
arl1 init 0.0
ar6 = (0.75 * ar0)
ar7 = (0.65 * ar0)
ar8 = (ar3 * 1.0)
ar3 = (ar0 + ar8)
ar0 = (0.35 * ar3)
ar3 = (ar7 + ar0)
ar0 = (0.65 * ar1)
ar7 = (ar5 * 1.0)
ar5 = (ar1 + ar7)
ar7 = (0.35 * ar5)
ar5 = (ar0 + ar7)
ir39 = 0.8
ir40 = 12000.0
ar0, ar7 reverbsc ar3, ar5, ir39, ir40
ar8 = (ar3 + ar0)
ar0 = (0.25 * ar8)
ar3 = (ar6 + ar0)
ar0 clip ar3, 0.0, 0dbfs
ar3 = (ar0 * 0.8)
arl0 = ar3
ar0 = (0.75 * ar1)
ar1 = (ar5 + ar7)
ar3 = (0.25 * ar1)
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
ir7 = (p5 / 64.0)
ir8 = (ir7 ^ 2.0)
kr0 = (ir8 / 2.0)
ar2 upsamp kr0
ar4 = (0.75 * ar2)
ir11 = (ir8 / 2.0)
ir12 = (1.275 * ir11)
ir13 = (ir12 * ir11)
ir14 = (ir13 + 1.5)
ir15 = p4
ir16 = cpsmidinn(ir15)
ir17 = (ir16 / 10000.0)
ir18 = (ir14 - ir17)
kr0 linsegr 1.0, 1.0, 1.0, ir18, 0.0
ar2 upsamp kr0
ar5 = (ar4 * ar2)
ir21 = 1.0
ir22 = 0.0
ar2 mpulse ir21, ir22
kr0 = cpsmidinn(ir15)
ar4 butlp ar2, kr0
ar2 = (0.1 * ar4)
kr1 = (1.0 * kr0)
kr2 = (3.141592653589793 * kr1)
if (sr > kr2) then
    ar6 = 1.0
else
    ar6 = 0.0
endif
kr2 downsamp ar6
kr3 = (2.0 * kr0)
kr4 = (3.141592653589793 * kr3)
if (sr > kr4) then
    ar7 = 1.0
else
    ar7 = 0.0
endif
kr4 downsamp ar7
ar8 = (ar6 + ar7)
kr5 = (3.01 * kr0)
kr6 = (3.141592653589793 * kr5)
if (sr > kr6) then
    ar9 = 1.0
else
    ar9 = 0.0
endif
kr6 downsamp ar9
ar10 = (ar8 + ar9)
kr7 = (4.01 * kr0)
kr8 = (3.141592653589793 * kr7)
if (sr > kr8) then
    ar8 = 1.0
else
    ar8 = 0.0
endif
kr8 downsamp ar8
ar11 = (ar10 + ar8)
kr9 = (4.69 * kr0)
kr10 = (3.141592653589793 * kr9)
if (sr > kr10) then
    ar10 = 1.0
else
    ar10 = 0.0
endif
kr10 downsamp ar10
ar12 = (ar11 + ar10)
kr11 = (5.63 * kr0)
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
ir54 = 444.0
ar13 mode ar4, kr1, ir54
ar14 = (ar6 * ar13)
kr1 = (1.0 - kr4)
kr2 = (kr4 * kr3)
kr3 = (kr1 + kr2)
ar6 mode ar4, kr3, ir54
ar13 = (ar7 * ar6)
ar6 = (ar14 + ar13)
kr1 = (1.0 - kr6)
kr2 = (kr6 * kr5)
kr3 = (kr1 + kr2)
ar7 mode ar4, kr3, ir54
ar13 = (ar9 * ar7)
ar7 = (ar6 + ar13)
kr1 = (1.0 - kr8)
kr2 = (kr8 * kr7)
kr3 = (kr1 + kr2)
ar6 mode ar4, kr3, ir54
ar9 = (ar8 * ar6)
ar6 = (ar7 + ar9)
kr1 = (1.0 - kr10)
kr2 = (kr10 * kr9)
kr3 = (kr1 + kr2)
ar7 mode ar4, kr3, ir54
ar8 = (ar10 * ar7)
ar7 = (ar6 + ar8)
kr1 = (1.0 - kr0)
kr2 = (kr0 * kr11)
kr0 = (kr1 + kr2)
ar6 mode ar4, kr0, ir54
ar4 = (ar11 * ar6)
ar6 = (ar7 + ar4)
ar4 = (ar12 * ar6)
ar6 = (0.9 * ar4)
ar4 = (ar2 + ar6)
ar2 = (15.0 * ar4)
ar4 = (ar5 * ar2)
ar2 = (0.75 * ar4)
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