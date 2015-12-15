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
ar0 = gargg0
ar1 = gargg1
arl0 init 0.0
arl1 init 0.0
ar2 = (0.75 * ar0)
ir12 = 0.8
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