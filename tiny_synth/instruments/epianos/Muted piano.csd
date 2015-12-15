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
ir12 = 3750.0
ir13 = 0.2
ir14 = 0.0
ar3 lpf18 ar0, ir12, ir13, ir14
ar0 lpf18 ar1, ir12, ir13, ir14
ir17 = 0.9
ir18 = 12000.0
ar4, ar5 reverbsc ar3, ar0, ir17, ir18
ar6 = (ar3 + ar4)
ar3 = (0.25 * ar6)
ar4 = (ar2 + ar3)
ar2 clip ar4, 0.0, 0dbfs
ar3 = (ar2 * 0.8)
arl0 = ar3
ar2 = (0.75 * ar1)
ar1 = (ar0 + ar5)
ar0 = (0.25 * ar1)
ar1 = (ar2 + ar0)
ar0 clip ar1, 0.0, 0dbfs
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

instr 18
ir1 = 1.0
ir2 = (p5 / 64.0)
ir3 = (ir2 ^ 2.0)
kr0 = (ir3 / 2.0)
kr1 = (11.0 * kr0)
ar0 random ir1, kr1
kr1 = (10.5 * kr0)
ar1 random ir1, kr1
ar2 = gargg0
ar3 = gargg1
kr1 chnget "volume"
ar4 upsamp kr1
ar5 = (1.0 * ar4)
ir17 = (ir3 / 2.0)
ir18 = (0.5 + ir17)
ir19 = (7.0 * ir18)
ir20 = (0.75 * ir19)
kr1 expsegr 1.0, 1.0, 0.7, ir19, 0.25, ir20, 0.1, 1.0, 0.1, ir20, 1.0e-6
ar4 upsamp kr1
ir22 = p4
kr1 = cpsmidinn(ir22)
ar6 upsamp kr1
ar7 = (ar6 - ar0)
ar0 oscil3 ir1, ar7, 2
ar7 = (ar0 + ar0)
ar0 = (ar4 * ar7)
ar7 = (ar0 * 0.5)
kr1 = (2.0 * kr0)
ir30 = (ir19 + 1.0)
kr0 linsegr 3000.0, ir30, 500.0, 1.0, 500.0, ir20, 500.0
kr2 = (kr1 * kr0)
ar0 butlp ar7, kr2
ar7 = (0.7 * ar0)
ar0 = (ar5 * ar7)
ar7 = (ar2 + ar0)
gargg0 = ar7
ar0 = (ar6 - ar1)
ar1 oscil3 ir1, ar0, 2
ar0 = (ar1 + ar1)
ar1 = (ar4 * ar0)
ar0 = (ar1 * 0.5)
ar1 butlp ar0, kr2
ar0 = (0.7 * ar1)
ar1 = (ar5 * ar0)
ar0 = (ar3 + ar1)
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