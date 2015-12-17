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
ir13 vco2init 1, 5
irlft = ir13
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
ir21 = 0.6
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
ar5 upsamp kr1
ar6 = (ar4 * ar5)
ir15 = 1.0
ir16 = p4
kr1 = cpsmidinn(ir16)
ar4 upsamp kr1
ar5 = (ar4 * 0.998)
ar7 = (ar5 - 0.12)
ar5 oscil3 ir15, ar7, 2
ar7 = (0.4 * ar5)
ar5 = (ar4 * 1.002)
ar8 = (ar5 - 0.12)
ar5 oscil3 ir15, ar8, 4
ar8 = (0.4 * ar5)
ar5 = (ar7 + ar8)
ar8 = (ar5 + ar7)
ar5 = (ar4 - 0.24)
ar4 oscil3 ir15, ar5, 4
ar5 = (0.7 * ar4)
ar4 = (ar8 + ar5)
kr2 expsegr 3000.0, 3.0e-2, 9000.0, 1.0, 9000.0, 3.0, 1.0
kr3 = (kr2 - 3000.0)
ar5 butlp ar4, kr3
ar4 butlp ar5, kr3
ir36 = 65.0
ar5 buthp ar4, ir36
ar4 buthp ar5, ir36
kr2 = (kr0 * 500.0)
kr0 = (700.0 + kr2)
ar5 butlp ar4, kr0
ar4 = (ar6 * ar5)
ar5 = (0.32 * ar4)
ar4 mxadsr 5.0e-3, 0.6, 1.00001, 5.0e-2
kr0 = (kr1 * 0.5)
kr1 vco2ft kr0, 0
ar6 oscilikt ir15, kr0, kr1
ir48 = 275.0
ir49 = 0.25
ar7 bqrez ar6, ir48, ir49
ar6 bqrez ar7, ir48, ir49
ar7 oscil3 ir15, kr0, 4
ar8 = (ar6 + ar7)
ar6 = (ar4 * ar8)
ir55 = 0.45
ar4 dam ar6, ir55, 2.0, 2.0, 1.0e-2, 1.0e-2
ir57 = 45.0
ar6 atone ar4, ir57
ar4 = (0.5 * ar6)
ar6 = (ar2 * ar4)
ar2 = (0.4 * ar6)
ar4 = (0.5 * ar2)
ar2 = (ar5 + ar4)
ar4 = (ar3 * ar2)
ar2 = (ar0 + ar4)
gargg0 = ar2
ar0 = (ar1 + ar4)
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