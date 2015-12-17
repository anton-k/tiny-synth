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
arl0 init 0.0
arl1 init 0.0
ir17 = 0.1
kr4 portk kr1, ir17
ar2 upsamp kr4
ar3 = (1.0 - ar2)
ar4 = (ar3 * ar0)
ir21 = 0.8
ir22 = 12000.0
ar5, ar6 reverbsc ar0, ar1, ir21, ir22
ar7 = (ar0 + ar5)
ar0 = (ar2 * ar7)
ar5 = (ar4 + ar0)
ar0 clip ar5, 0.0, 0dbfs
ar4 = (ar0 * 0.8)
arl0 = ar4
ar0 = (ar3 * ar1)
ar3 = (ar1 + ar6)
ar1 = (ar2 * ar3)
ar2 = (ar0 + ar1)
ar0 clip ar2, 0.0, 0dbfs
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

instr 18
ir1 = 500.0
ar0 rand ir1
ar1 = gargg0
ar2 = gargg1
kr0 chnget "volume"
ar3 upsamp kr0
ar4 = (1.0 * ar3)
kr0 linseg 0.0, 1.0e-2, 1.0, 1.0, 1.0
ar3 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 0.5, 0.0
ar5 upsamp kr0
ar6 = (ar3 * ar5)
ar3 = (1.5 * ar6)
ir14 = 0.3
ir15 = p4
kr0 = cpsmidinn(ir15)
ar5 upsamp kr0
ar6 = (1.0 * ar5)
kr0 linseg 1.0, 5.0e-2, 100.0, 0.2, 100.0, 2.0, 1.0, p3, 1.0, 1.0, 1.0
ar7 buzz ir14, ar6, kr0, 2
ir20 = 1.0
ar6 = (0.5 * ar5)
ar8 buzz ir20, ar6, kr0, 2
ar6 = (ar7 + ar8)
ar7 = (0.501 * ar5)
ar5 buzz ir20, ar7, kr0, 2
ar7 = (ar6 + ar5)
ar5 = (ar7 / 3.0)
ar6 rand ir1, 1.0
ar7 oscil3 ir20, ar6, 2
ar6 = (ar5 * ar7)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar5 upsamp kr0
ar7 = (ar6 * ar5)
ar5 = (ar3 * ar7)
ar3 = (ar4 * ar5)
ar4 = (ar1 + ar3)
gargg0 = ar4
ar1 = (ar2 + ar3)
gargg1 = ar1
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