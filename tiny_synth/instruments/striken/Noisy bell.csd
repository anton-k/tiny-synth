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
ir1 = 0.2
kr0 linseg 17.360000000000003, 2.3, 70.0, 1.0, 70.0
ar0 randi ir1, kr0
ir5 = 0.134
kr0 linseg 18.360000000000003, 2.07, 71.0, 1.0, 71.0
ar1 randi ir5, kr0
ir9 = 0.27
kr0 linseg 28.52, 1.4949999999999999, 115.0, 1.0, 115.0
ar2 randi ir9, kr0
ir13 = 0.36000000000000004
kr0 linseg 30.22, 1.265, 116.7, 1.0, 116.7
ar3 randi ir13, kr0
ir17 = 0.534
kr0 linseg 36.89, 0.7474999999999999, 148.75, 1.0, 148.75
ar4 randi ir17, kr0
ir21 = 0.334
kr0 linseg 52.699999999999996, 0.8049999999999999, 212.5, 1.0, 212.5
ar5 randi ir21, kr0
ir25 = 0.292
kr0 linseg 62.0, 0.575, 250.0, 1.0, 250.0
ar6 randi ir25, kr0
ir29 = 0.266
kr0 linseg 84.94000000000001, 0.45999999999999996, 342.5, 1.0, 342.5
ar7 randi ir29, kr0
kr0 linseg 93.0, 0.345, 375.0, 1.0, 375.0
ar8 randi ir29, kr0
ir36 = 0.15000000000000002
kr0 linseg 116.25, 0.22999999999999998, 468.75, 1.0, 468.75
ar9 randi ir36, kr0
kr0 linseg 126.17000000000002, 0.1725, 508.75000000000006, 1.0, 508.75000000000006
ar10 randi ir29, kr0
ar11 = gargg0
ar12 = gargg1
kr0 chnget "volume"
ar13 upsamp kr0
ar14 = (1.0 * ar13)
kr0 expsegr 1.0, 2.3, 1.0e-3, 1.0, 1.0e-3, 2.3, 1.0e-3
ar13 upsamp kr0
ir50 = 1.0
ir51 = p4
kr0 = cpsmidinn(ir51)
ar15 upsamp kr0
ar16 = (ar15 * 8.0)
ar15 = (ar16 * 0.56)
ar17 oscil3 ir50, ar15, 2
ar18 = (ar0 * ar17)
ar0 = (ar15 + 1.0)
ar15 oscil3 ir50, ar0, 2
ar0 = (ar1 * ar15)
ar1 = (ar18 + ar0)
ar0 = (ar16 * 0.92)
ar15 oscil3 ir50, ar0, 2
ar17 = (ar2 * ar15)
ar2 = (ar1 + ar17)
ar1 = (ar0 + 1.7)
ar0 oscil3 ir50, ar1, 2
ar1 = (ar3 * ar0)
ar0 = (ar2 + ar1)
ar1 = (ar16 * 1.19)
ar2 oscil3 ir50, ar1, 2
ar1 = (ar4 * ar2)
ar2 = (ar0 + ar1)
ar0 = (ar16 * 1.7)
ar1 oscil3 ir50, ar0, 2
ar0 = (ar5 * ar1)
ar1 = (ar2 + ar0)
ar0 = (ar16 * 3.0)
ar2 oscil3 ir50, ar0, 2
ar0 = (ar6 * ar2)
ar3 = (ar1 + ar0)
ar0 = (ar16 * 2.74)
ar1 oscil3 ir50, ar0, 2
ar0 = (ar7 * ar1)
ar1 = (ar3 + ar0)
ar0 = (ar8 * ar2)
ar2 = (ar1 + ar0)
ar0 = (ar16 * 3.75)
ar1 oscil3 ir50, ar0, 2
ar0 = (ar9 * ar1)
ar1 = (ar2 + ar0)
ar0 = (ar16 * 4.07)
ar2 oscil3 ir50, ar0, 2
ar0 = (ar10 * ar2)
ar2 = (ar1 + ar0)
ar0 = (0.75 * ar2)
ar1 = (ar13 * ar0)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar0 upsamp kr0
ar2 = (ar1 * ar0)
ar0 = (0.75 * ar2)
ar1 = (ar14 * ar0)
ar0 = (ar11 + ar1)
gargg0 = ar0
ar0 = (ar12 + ar1)
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