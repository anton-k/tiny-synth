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
ir13 vco2init 1, 1
irlft = ir13
ir16 vco2init 8, irlft
irlft = ir16
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
ar2 delayr 0.25
ir15 = 0.25
ar3 deltap3 ir15
ar4 = (0.55 * ar3)
ar5 = (ar0 + ar4)
 delayw ar5
ar4 delayr 0.25
ar5 deltap3 ir15
ar6 = (0.55 * ar5)
ar7 = (ar1 + ar6)
 delayw ar7
arl0 init 0.0
arl1 init 0.0
ir34 = 0.1
kr4 portk kr1, ir34
ar6 upsamp kr4
ar7 = (1.0 - ar6)
ar8 = (ar7 * ar0)
ar9 = (0.65 * ar0)
ar10 = (ar3 * 1.0)
ar3 = (ar0 + ar10)
ar0 = (0.35 * ar3)
ar3 = (ar9 + ar0)
ar0 = (0.65 * ar1)
ar9 = (ar5 * 1.0)
ar5 = (ar1 + ar9)
ar9 = (0.35 * ar5)
ar5 = (ar0 + ar9)
ir48 = 0.8
ir49 = 12000.0
ar0, ar9 reverbsc ar3, ar5, ir48, ir49
ar10 = (ar3 + ar0)
ar0 = (ar6 * ar10)
ar3 = (ar8 + ar0)
ar0 clip ar3, 0.0, 0dbfs
ar3 = (ar0 * 0.8)
arl0 = ar3
ar0 = (ar7 * ar1)
ar1 = (ar5 + ar9)
ar3 = (ar6 * ar1)
ar1 = (ar0 + ar3)
ar0 clip ar1, 0.0, 0dbfs
ar1 = (ar0 * 0.8)
arl1 = ar1
ar0 = arl0
ar1 = arl1
 outs ar0, ar1
endin

instr 18
ir1 = 1.0
ir2 = 6.0
ar0 randi ir1, ir2
ir5 = 10.0
ar1 randi ir1, ir5
ar2 = gargg0
ar3 = gargg1
kr0 chnget "volume"
ar4 upsamp kr0
ar5 = (1.0 * ar4)
ar4 madsr 1.0e-2, 0.3, 0.5, 0.3
kr0 linseg 0.0, 1.0e-2, 1.0, 5.0, 0.35, 1.0, 0.35
ar6 upsamp kr0
ar7 = (0.2 * ar6)
ar8 = (ar7 * ar0)
ar0 = (0.3 + ar8)
ar7 = (1.0 - ar0)
ar8 = (0.1 * ar6)
ar6 = (ar8 * ar1)
ar1 = (0.4 + ar6)
ar6 = (1.0 - ar1)
ar8 = (ar7 * ar6)
ir25 = p4
kr0 = cpsmidinn(ir25)
kr1 = (kr0 * 1.0)
kr2 vco2ft kr1, 0
ar9 oscilikt ir1, kr1, kr2
ar10 = (ar8 * ar9)
ar8 = (ar0 * ar6)
kr1 = (kr0 * 1.07)
kr2 vco2ft kr1, 3
ar6 oscilikt ir1, kr1, kr2
ar9 = (ar8 * ar6)
ar6 = (ar10 + ar9)
ar8 = (ar0 * ar1)
kr1 = (kr0 * 2.02)
kr2 vco2ft kr1, 0
ar0 oscilikt ir1, kr1, kr2
ar9 = (ar8 * ar0)
ar0 = (ar6 + ar9)
ar6 = (ar7 * ar1)
kr1 = (kr0 * 0.5)
kr2 vco2ft kr1, 3
ar1 oscilikt ir1, kr1, kr2
ar7 = (ar6 * ar1)
ar1 = (ar0 + ar7)
kr1 = (kr0 * 2.0)
kr0 madsr 5.0e-2, 0.3, 0.2, 0.2
kr2 = (0.5 * kr0)
kr0 = (6500.0 * kr2)
kr2 = (kr1 + kr0)
ir54 = 0.1
ar0 moogladder ar1, kr2, ir54
ar1 = (ar4 * ar0)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar0 upsamp kr0
ar4 = (ar1 * ar0)
ar0 = (0.63 * ar4)
ar1 = (ar5 * ar0)
ar0 = (ar2 + ar1)
gargg0 = ar0
ar0 = (ar3 + ar1)
gargg1 = ar0
endin

</CsInstruments>

<CsScore>



f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>