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
ar3 = (0.25 * ar0)
ar0 = (ar2 + ar3)
ar2 clip ar0, 0.0, 0dbfs
ar0 = (ar2 * 0.8)
arl0 = ar0
ar0 = (0.75 * ar1)
ar2 = (0.25 * ar1)
ar1 = (ar0 + ar2)
ar0 clip ar1, 0.0, 0dbfs
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

instr 18
ir1 = 11000.0
ir2 = 0.99
ar0 noise ir1, ir2
ar1 = gargg0
ar2 = gargg1
kr0 chnget "volume"
ar3 upsamp kr0
ar4 = (1.0 * ar3)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar3 upsamp kr0
ar5 = (0.75 * ar3)
kr1 linseg 0.0, 1.0e-2, 1.0, 1.0, 1.0
ar3 upsamp kr1
kr1 linsegr 1.0, 1.0, 1.0, 1.0e-2, 0.0
ar6 upsamp kr1
ar7 = (ar3 * ar6)
ar3 = (ar5 * ar7)
ir19 = 1.0
ir20 = p4
kr1 = cpsmidinn(ir20)
kr2 = (kr1 / 25.0)
kr1 oscil ir19, kr2, 2
ar5 upsamp kr1
ar6 samphold ar0, ar5
ar0 oscil3 ir19, ar6, 4
kr1 = (kr0 * 8500.0)
kr0 = (1500.0 + kr1)
ir28 = 0.1
ar5 moogladder ar0, kr0, ir28
ar0 = (ar3 * ar5)
ar3 = (ar4 * ar0)
ar0 = (ar1 + ar3)
gargg0 = ar0
ar0 = (ar2 + ar3)
gargg1 = ar0
endin

</CsInstruments>

<CsScore>

f2 0 2048 7  1.0 1024.0 0.0 1024.0 0.0
f4 0 8192 10  1.0

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>