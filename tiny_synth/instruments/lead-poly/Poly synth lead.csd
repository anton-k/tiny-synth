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
ir13 vco2init 1, 3
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
ar2 delayr 1.2
ir15 = 1.0
ir16 = 3.75
ar3 oscil3 ir15, ir16, 2
ar4 = (2.1000000000000003e-3 * ar3)
ar3 = (ar4 + 1.0e-2)
ar4 deltap3 ar3
 delayw ar0
ar5 delayr 1.2
ar6 deltap3 ar3
 delayw ar1
ar3 delayr 0.25
ir32 = 0.25
ar7 deltap3 ir32
ar8 = (0.75 * ar0)
ar9 ntrpol ar0, ar4, ir15
ar0 = (0.25 * ar9)
ar4 = (ar8 + ar0)
ar0 = (0.65 * ar7)
ar8 = (ar4 + ar0)
 delayw ar8
ar0 delayr 0.25
ar8 deltap3 ir32
ar9 = (0.75 * ar1)
ar10 ntrpol ar1, ar6, ir15
ar1 = (0.25 * ar10)
ar6 = (ar9 + ar1)
ar1 = (0.65 * ar8)
ar9 = (ar6 + ar1)
 delayw ar9
arl0 init 0.0
arl1 init 0.0
ir59 = 0.1
kr4 portk kr1, ir59
ar1 upsamp kr4
ar9 = (1.0 - ar1)
ar10 = (0.75 * ar4)
ar11 = (ar7 * 1.0)
ar7 = (ar4 + ar11)
ar4 = (0.25 * ar7)
ar7 = (ar10 + ar4)
ar4 = (ar9 * ar7)
ar10 = (0.75 * ar6)
ar11 = (ar8 * 1.0)
ar8 = (ar6 + ar11)
ar6 = (0.25 * ar8)
ar8 = (ar10 + ar6)
ir73 = 0.9
ir74 = 12000.0
ar6, ar10 reverbsc ar7, ar8, ir73, ir74
ar11 = (ar7 + ar6)
ar6 = (ar1 * ar11)
ar7 = (ar4 + ar6)
ar4 clip ar7, 0.0, 0dbfs
ar6 = (ar4 * 0.8)
arl0 = ar6
ar4 = (ar9 * ar8)
ar6 = (ar8 + ar10)
ar7 = (ar1 * ar6)
ar1 = (ar4 + ar7)
ar4 clip ar1, 0.0, 0dbfs
ar1 = (ar4 * 0.8)
arl1 = ar1
ar1 = arl0
ar4 = arl1
 outs ar1, ar4
endin

instr 18
ir1 = 1.0
ir2 = rnd(ir1)
ir4 = rnd(ir1)
ir6 = rnd(ir1)
ir8 = rnd(ir1)
ir10 = rnd(ir1)
ir12 = rnd(ir1)
ir14 = 0.0
ar0 noise ir1, ir14
ar1 = gargg0
ar2 = gargg1
kr0 chnget "volume"
ar3 upsamp kr0
ar4 = (1.0 * ar3)
kr0 linseg 0.0, 1.0e-2, 1.0, 1.0, 1.0
ar3 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 0.15, 0.0
ar5 upsamp kr0
ar6 = (ar3 * ar5)
ir26 = p4
kr0 = cpsmidinn(ir26)
ir28 = 50.0
kr1 = cent(ir28)
kr2 = (kr1 * -1.0)
kr3 = (kr0 + kr2)
kr4 vco2ft kr3, 0
ar3 oscilikt ir1, kr3, kr4, ir2
kr3 vco2ft kr0, 0
ar5 oscilikt ir1, kr0, kr3, ir4
ar7 = (ar3 + ar5)
kr3 = (kr1 * 1.0)
kr1 = (kr0 + kr3)
kr4 vco2ft kr1, 0
ar3 oscilikt ir1, kr1, kr4, ir6
ar5 = (ar7 + ar3)
ar3 = (ar5 / 3.0)
ir43 = 14.0
kr1 = cent(ir43)
kr4 = (kr0 * kr1)
kr0 = (kr4 + kr2)
kr1 vco2ft kr0, 0
ar5 oscilikt ir1, kr0, kr1, ir8
kr0 vco2ft kr4, 0
ar7 oscilikt ir1, kr4, kr0, ir10
ar8 = (ar5 + ar7)
kr0 = (kr4 + kr3)
kr1 vco2ft kr0, 0
ar5 oscilikt ir1, kr0, kr1, ir12
ar7 = (ar8 + ar5)
ar5 = (ar7 / 3.0)
ar7 = (ar3 + ar5)
ir58 = 400.0
ir59 = 0.1
ar3 bqrez ar0, ir58, ir59
ar0 = (0.2 * ar3)
ar3 = (ar7 + ar0)
ir63 = 18000.0
ir64 = 0.3
ar0 bqrez ar3, ir63, ir64, 3.0
ar3 bqrez ar0, ir63, ir64, 3.0
ir67 = 5500.0
ir68 = 0.12
ar0 moogladder ar3, ir67, ir68
ar3 = (ar6 * ar0)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar0 upsamp kr0
ar5 = (ar3 * ar0)
ar0 = (ar4 * ar5)
ar3 = (ar1 + ar0)
gargg0 = ar3
ar1 = (ar2 + ar0)
gargg1 = ar1
endin

</CsInstruments>

<CsScore>

f2 0 8192 19  0.5 1.0 180.0 1.0

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>