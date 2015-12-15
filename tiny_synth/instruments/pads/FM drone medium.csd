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
ir12 = 0.8
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
ar2 madsr 5.0, 0.0, 1.0, 3.0
ar4 = (0.5 * ar2)
ir9 = 1.0
ir10 = p4
kr0 = cpsmidinn(ir10)
ar5 upsamp kr0
ar6 = (ar5 * 0.998)
ar7 = (3.0 * ar5)
ar8 = (ar7 * ar2)
ar2 = (ar5 * 1.0)
ar7 oscil3 ir9, ar2, 2
ar2 = (ar8 * ar7)
ar7 = (ar6 + ar2)
ar6 oscil3 ir9, ar7, 2
ar7 = (ar5 * 1.5007)
ar9 = (ar7 + ar2)
ar7 oscil3 ir9, ar9, 2
ar9 = (ar6 + ar7)
ar6 = (0.1 + ar2)
ar2 oscil3 ir9, ar6, 2
ar6 = (ar9 + ar2)
ar2 = (ar4 * ar6)
ar6 = (0.39 * ar2)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar2 upsamp kr0
ar7 = (ar6 * ar2)
ar6 = (0.5 * ar7)
ar7 = (ar5 * 0.987)
ar9 = (ar5 * 0.99)
ar10 oscil3 ir9, ar9, 2
ar9 = (ar8 * ar10)
ar8 = (ar7 + ar9)
ar7 oscil3 ir9, ar8, 2
ar8 = (ar5 * 1.498)
ar5 = (ar8 + ar9)
ar8 oscil3 ir9, ar5, 2
ar5 = (ar7 + ar8)
ar7 = (0.13 + ar9)
ar8 oscil3 ir9, ar7, 2
ar7 = (ar5 + ar8)
ar5 = (ar4 * ar7)
ar4 = (0.39 * ar5)
ar5 = (ar4 * ar2)
ar2 = (0.5 * ar5)
ar4 = (ar6 + ar2)
ar2 = (0.5 * ar4)
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