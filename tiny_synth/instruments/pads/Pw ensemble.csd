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
ir13 vco2init 16, 1
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
ir1 = 1.0
kr0 = rnd(ir1)
kr1 = rnd(ir1)
kr2 = rnd(ir1)
ar0 = gargg0
ar1 = gargg1
kr3 chnget "volume"
ar2 upsamp kr3
ar3 = (1.0 * ar2)
ar2 madsr 0.5, 0.0, 1.0, 1.0
ir15 = p4
kr3 = cpsmidinn(ir15)
ir17 = -6.0
kr4 = cent(ir17)
kr5 = (kr3 * kr4)
ir20 = 2.0
kr4 vco2ft ir20, 4
kr6 oscilikt ir1, ir20, kr4
kr4 = (0.11 * kr6)
kr6 = (0.2 + kr4)
ar4 vco2 ir1, kr5, 2.0, kr6, kr0
ir26 = 6.0
kr0 = cent(ir26)
kr4 = (kr3 * kr0)
ir29 = 1.8
kr0 vco2ft ir29, 4
kr5 oscilikt ir1, ir29, kr0
kr0 = (-0.1 * kr5)
kr5 = (0.8 + kr0)
ar5 vco2 ir1, kr4, 2.0, kr5, kr1
ar6 = (ar4 + ar5)
kr0 = (kr3 * 0.5)
ar4 vco2 ir1, kr0, 2.0, kr6, kr2
ar5 = (ar6 + ar4)
ar4 = (ar2 * ar5)
kr0 = (kr3 * 2.0)
kr1 = (3500.0 + kr0)
ir42 = 0.1
ar2 moogladder ar4, kr1, ir42
ar4 = (0.3 * ar2)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar2 upsamp kr0
ar5 = (ar4 * ar2)
ar2 = (0.55 * ar5)
ar4 = (ar3 * ar2)
ar2 = (ar0 + ar4)
gargg0 = ar2
ar0 = (ar1 + ar4)
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