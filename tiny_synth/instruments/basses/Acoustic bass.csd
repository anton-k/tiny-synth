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
ar4 = (2.0 * ar2)
ir11 = (ir8 / 2.0)
ir12 = (3.5 * ir11)
kr1 linsegr 0.0, 1.0e-2, 1.0, ir12, 0.0, 1.0, 0.0, 0.35, 0.0
ar2 upsamp kr1
ar5 = (ar4 * ar2)
ir15 = 1.0
ir16 = p4
kr1 = cpsmidinn(ir16)
ar2 upsamp kr1
ar4 = (ar2 * 0.998)
ar6 = (ar4 - 0.12)
ar4 oscil3 ir15, ar6, 2
ar6 = (0.4 * ar4)
ar4 = (ar2 * 1.002)
ar7 = (ar4 - 0.12)
ar4 oscil3 ir15, ar7, 4
ar7 = (0.4 * ar4)
ar4 = (ar6 + ar7)
ar7 = (ar4 + ar6)
ar4 = (ar2 - 0.24)
ar2 oscil3 ir15, ar4, 4
ar4 = (0.7 * ar2)
ar2 = (ar7 + ar4)
kr1 expsegr 3000.0, 3.0e-2, 9000.0, 1.0, 9000.0, 3.0, 1.0
kr2 = (kr1 - 3000.0)
ar4 butlp ar2, kr2
ar2 butlp ar4, kr2
ir36 = 65.0
ar4 buthp ar2, ir36
ar2 buthp ar4, ir36
kr1 = (kr0 * 500.0)
kr0 = (700.0 + kr1)
ar4 butlp ar2, kr0
ar2 = (ar5 * ar4)
ar4 = (0.32 * ar2)
ar2 = (ar3 * ar4)
ar3 = (ar0 + ar2)
gargg0 = ar3
ar0 = (ar1 + ar2)
gargg1 = ar0
endin

</CsInstruments>

<CsScore>

f4 0 8192 10  1.0
f2 0 8192 10  1.0 1.0 1.0 1.0 0.7 0.5 0.3 0.1

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>