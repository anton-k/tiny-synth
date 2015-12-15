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
ar2 = (0.73 * ar0)
ir12 = 0.9
ir13 = 12000.0
ar3, ar4 reverbsc ar0, ar1, ir12, ir13
ar5 = (ar0 + ar3)
ar0 = (0.27 * ar5)
ar3 = (ar2 + ar0)
ar0 clip ar3, 0.0, 0dbfs
ar2 = (ar0 * 0.8)
arl0 = ar2
ar0 = (0.73 * ar1)
ar2 = (ar1 + ar4)
ar1 = (0.27 * ar2)
ar2 = (ar0 + ar1)
ar0 clip ar2, 0.0, 0dbfs
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

instr 18
ar0 delayr 2.0
kr0 expseg 1.0e-2, 10.0, 1.0, 1.0, 1.0
ar1 deltap3 kr0
kr0 expseg 1.5e-2, 15.0, 1.055, 1.0, 1.055
ar2 deltap3 kr0
ir9 = 2.0
ar3 deltap3 ir9
ir12 = 1.1
ar4 deltap3 ir12
ir15 = 1.0
ir16 = p4
ir17 = cpsmidinn(ir16)
kr0 = octcps(ir17)
ir19 = 8.333333333333333e-3
kr1 = (ir17 / 50.0)
kr2 poscil ir19, kr1, 2
kr1 = (kr0 + kr2)
kr2 = cpsoct(kr1)
ar5 pluck ir15, kr2, ir17, 4, 1.0
ar6 = (ar5 * 1.0)
 delayw ar6
ar5 = gargg0
ar6 = gargg1
kr1 chnget "volume"
ar7 upsamp kr1
ar8 = (1.0 * ar7)
kr1 linseg 0.0, 1.0e-2, 1.0, 1.0, 1.0
ar7 upsamp kr1
kr1 linsegr 1.0, 1.0, 1.0, 2.2, 0.0
ar9 upsamp kr1
ar10 = (ar7 * ar9)
kr1 = (kr0 + 6.666666666666667e-3)
kr2 = cpsoct(kr1)
ar7 pluck ir15, kr2, ir17, 4, 1.0
ar9 = (ar7 + ar1)
ar1 = (ar9 + ar3)
kr1 = (kr0 + -6.666666666666667e-3)
kr0 = cpsoct(kr1)
ar3 pluck ir15, kr0, ir17, 4, 1.0
ar7 = (ar1 + ar3)
ar1 = (ar7 + ar2)
ar2 = (ar1 + ar4)
ar1 = (ar2 / 6.0)
ar2 = (1.0 * ar1)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar1 upsamp kr0
ar3 = (ar2 * ar1)
ar1 = (ar10 * ar3)
ar2 = (0.72 * ar1)
ar1 = (ar8 * ar2)
ar2 = (ar5 + ar1)
gargg0 = ar2
ar2 = (ar6 + ar1)
gargg1 = ar2
endin

</CsInstruments>

<CsScore>

f4 0 8192 10  1.0 0.5 0.33 0.25 0.0 0.1 0.1 0.1
f2 0 8192 11  1.0

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>