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
kr0 linseg 0.0, 1.0e-2, 1.0, 1.0, 1.0
ar2 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 0.5, 0.0
ar4 upsamp kr0
ar5 = (ar2 * ar4)
ar2 = (0.8 * ar5)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar4 upsamp kr0
kr0 expseg 1.0e-4, 3.0e-2, 1.0, 4.97, 1.0e-3, 1.0, 1.0e-3
ar5 upsamp kr0
kr0 linseg 1.0, 3.0e-2, 1.0, 4.97, 3.0, 1.0, 3.0
ar6 upsamp kr0
ar7 = (ar5 * ar6)
ir17 = p4
kr0 = cpsmidinn(ir17)
kr1 linseg 2.25, 3.0e-2, 3.0, 4.97, 2.0, 1.0, 2.0
ir20 = 0.0
ir21 = 35.0
ar5 gbuzz ar7, kr0, kr1, ir20, ir21, 2
ir23 = 500.0
ir24 = 50.0
ar6 reson ar5, ir23, ir24, 1.0
ir26 = 150.0
ir27 = 100.0
ar7 reson ar6, ir26, ir27, 1.0
ir29 = 3500.0
ar6 reson ar7, ir29, ir26, 1.0
ar7 reson ar6, ir29, ir26, 1.0
ar6 balance ar7, ar5
ar5 = (ar4 * ar6)
ar4 = (ar2 * ar5)
ar2 = (ar3 * ar4)
ar3 = (ar0 + ar2)
gargg0 = ar3
ar0 = (ar1 + ar2)
gargg1 = ar0
endin

</CsInstruments>

<CsScore>

f2 0 8192 9  1.0 1.0 90.0

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>