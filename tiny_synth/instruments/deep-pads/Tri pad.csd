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
ir13 vco2init 16, 3
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
ir16 = 0.8999999999999999
ar3 oscil3 ir15, ir16, 2
ar4 = (6.0e-3 * ar3)
ar3 = (ar4 + 1.0e-2)
ar4 deltap3 ar3
 delayw ar0
ar5 delayr 1.2
ar6 deltap3 ar3
 delayw ar1
ar7 delayr 1.2
ar8 deltap3 ar3
 delayw ar0
ar9 delayr 1.2
ar10 deltap3 ar3
 delayw ar1
arl0 init 0.0
arl1 init 0.0
ir46 = 0.1
kr4 portk kr1, ir46
ar3 upsamp kr4
ar11 = (1.0 - ar3)
ar12 = (ar11 * ar0)
ir50 = 0.25
ar13 ntrpol ar0, ar4, ir50
ar4 = (0.5 * ar13)
ar13 ntrpol ar0, ar8, ir50
ar0 ntrpol ar1, ar10, ir50
ir55 = 0.8
ir56 = 12000.0
ar8, ar10 reverbsc ar13, ar0, ir55, ir56
ar14 = (ar13 + ar8)
ar8 = (0.5 * ar14)
ar13 = (ar4 + ar8)
ar4 = (ar3 * ar13)
ar8 = (ar12 + ar4)
ar4 clip ar8, 0.0, 0dbfs
ar8 = (ar4 * 0.8)
arl0 = ar8
ar4 = (ar11 * ar1)
ar8 ntrpol ar1, ar6, ir50
ar1 = (0.5 * ar8)
ar6 = (ar0 + ar10)
ar0 = (0.5 * ar6)
ar6 = (ar1 + ar0)
ar0 = (ar3 * ar6)
ar1 = (ar4 + ar0)
ar0 clip ar1, 0.0, 0dbfs
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

instr 18
ir1 = 1.2
kr0 rand ir1
ir4 = 1.0
ir5 = rnd(ir4)
ir7 = rnd(ir4)
kr1 rand ir1
ir11 = rnd(ir4)
ir13 = rnd(ir4)
ar0 = gargg0
ar1 = gargg1
kr2 chnget "volume"
ar2 upsamp kr2
ar3 = (1.0 * ar2)
kr2 linseg 0.0, 0.3, 1.0, 1.0, 1.0
ar2 upsamp kr2
kr2 linsegr 1.0, 1.0, 1.0, 0.5, 0.0
ar4 upsamp kr2
ar5 = (ar2 * ar4)
ar2 = (1.5 * ar5)
ir25 = p4
kr2 = cpsmidinn(ir25)
kr3 = (kr2 * 1.0)
kr4 = (1.5 * kr0)
kr0 = (kr3 + kr4)
kr4 vco2ft kr0, 4
ar4 oscilikt ir4, kr0, kr4, ir5
ir32 = 8.0
kr0 = cent(ir32)
kr4 = (kr3 * kr0)
kr5 vco2ft kr4, 4
ar5 oscilikt ir4, kr4, kr5, ir7
ar6 = (ar4 + ar5)
ar4 = (0.5 * ar6)
kr4 = (kr3 * 5.0)
ir40 = 0.15
ar5 moogladder ar4, kr4, ir40
ar4 = (ar2 * ar5)
kr3 = (p5 / 64.0)
kr4 = (kr3 ^ 2.0)
kr3 = (kr4 / 2.0)
ar5 upsamp kr3
ar6 = (ar4 * ar5)
ar4 = (0.7 * ar6)
ar6 = (0.75 * ar4)
kr3 = (kr2 * 0.5)
kr2 = (1.5 * kr1)
kr1 = (kr3 + kr2)
kr2 vco2ft kr1, 4
ar4 oscilikt ir4, kr1, kr2, ir11
kr1 = (kr3 * kr0)
kr0 vco2ft kr1, 4
ar7 oscilikt ir4, kr1, kr0, ir13
ar8 = (ar4 + ar7)
ar4 = (0.5 * ar8)
kr0 = (kr3 * 5.0)
ar7 moogladder ar4, kr0, ir40
ar4 = (ar2 * ar7)
ar2 = (ar4 * ar5)
ar4 = (0.7 * ar2)
ar2 = (0.375 * ar4)
ar4 = (ar6 + ar2)
ar2 = (ar3 * ar4)
ar3 = (ar0 + ar2)
gargg0 = ar3
ar0 = (ar1 + ar2)
gargg1 = ar0
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