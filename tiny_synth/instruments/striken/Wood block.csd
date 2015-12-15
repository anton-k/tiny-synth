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
ar2 = (0.75 * ar0)
ir12 = 0.6
ir13 = 12000.0
ar3, ar4 reverbsc ar0, ar1, ir12, ir13
ar5 = (ar0 + ar3)
ar0 = (0.25 * ar5)
ar3 = (ar2 + ar0)
ar0 clip ar3, 0.0, 0dbfs
ar2 = (ar0 * 0.8)
arl0 = ar2
ar0 = (0.75 * ar1)
ar2 = (ar1 + ar4)
ar1 = (0.25 * ar2)
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
ir7 = (p5 / 64.0)
ir8 = (ir7 ^ 2.0)
kr0 = (ir8 / 2.0)
ar2 upsamp kr0
ar4 = (0.75 * ar2)
ir11 = (ir8 / 2.0)
ir12 = (0.34 * ir11)
ir13 = (ir12 * ir11)
ir14 = (ir13 + 0.4)
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
kr3 = (1.6830601092896176 * kr0)
kr4 = (3.141592653589793 * kr3)
if (sr > kr4) then
    ar7 = 1.0
else
    ar7 = 0.0
endif
kr4 downsamp ar7
ar8 = (ar6 + ar7)
kr5 = (2.036065573770492 * kr0)
kr6 = (3.141592653589793 * kr5)
if (sr > kr6) then
    ar9 = 1.0
else
    ar9 = 0.0
endif
kr6 downsamp ar9
ar10 = (ar8 + ar9)
kr7 = (3.4010928961748634 * kr0)
kr0 = (3.141592653589793 * kr7)
if (sr > kr0) then
    ar8 = 1.0
else
    ar8 = 0.0
endif
kr0 downsamp ar8
ar11 = (ar10 + ar8)
ar10 = (1.0 / ar11)
kr8 = (1.0 - kr2)
kr9 = (kr2 * kr1)
kr1 = (kr8 + kr9)
ir46 = 60.0
ar11 mode ar4, kr1, ir46
ar12 = (ar6 * ar11)
kr1 = (1.0 - kr4)
kr2 = (kr4 * kr3)
kr3 = (kr1 + kr2)
ar6 mode ar4, kr3, ir46
ar11 = (ar7 * ar6)
ar6 = (ar12 + ar11)
kr1 = (1.0 - kr6)
kr2 = (kr6 * kr5)
kr3 = (kr1 + kr2)
ar7 mode ar4, kr3, ir46
ar11 = (ar9 * ar7)
ar7 = (ar6 + ar11)
kr1 = (1.0 - kr0)
kr2 = (kr0 * kr7)
kr0 = (kr1 + kr2)
ar6 mode ar4, kr0, ir46
ar4 = (ar8 * ar6)
ar6 = (ar7 + ar4)
ar4 = (ar10 * ar6)
ar6 = (0.9 * ar4)
ar4 = (ar2 + ar6)
ar2 = (15.0 * ar4)
ar4 = (ar5 * ar2)
ar2 = (0.85 * ar4)
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