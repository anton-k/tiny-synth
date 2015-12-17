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
kr0 linseg 0.0, 1.0e-2, 1.0, 1.0, 1.0
ar2 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 2.3, 0.0
ar4 upsamp kr0
ar5 = (ar2 * ar4)
ar2 = (0.5 * ar5)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar4 upsamp kr0
ir14 = 0.2
ir15 = 0.0
ir16 = 0.25
ir17 = 5.0
ir18 = 5.0
ir19 = 2.0
ir20 = 0.3333
kr0 loopseg ir14, ir15, 0.0, ir15, ir16, ir17, ir18, ir19, ir20, ir15, ir15
ir22 = 1.0e-3
kr1 portk kr0, ir22
ir24 = 0.1
ir25 = 0.3
ir26 = 1.0
ir27 = 2.2
kr0 loopseg ir24, ir15, 0.0, ir25, ir26, ir27, ir26, ir25, ir15
kr2 portk kr0, ir22
kr0 = (1.0 / kr2)
kr3 = (kr2 - kr0)
kr4 = (kr1 * kr3)
kr3 = (kr4 / 2.0)
kr4 = (kr3 / 10.0)
kr5 = abs(kr4)
kr4 tablei kr5, 2, 1.0
kr5 = (0.5 * kr4)
kr4 = (-kr5)
ir39 = p4
kr5 = cpsmidinn(ir39)
kr6 poscil kr3, kr5, 4
kr3 = (kr4 + kr6)
kr4 = exp(kr3)
kr3 = (kr2 + kr0)
kr0 = (kr1 * kr3)
kr1 = (kr0 / 2.0)
kr0 = (kr1 * kr5)
kr1 poscil kr0, kr5, 4
kr0 = octcps(kr5)
kr2 = (kr0 + 3.333333333333333e-4)
kr3 = cpsoct(kr2)
kr2 = (kr1 + kr3)
ar5 poscil kr4, kr2, 6
kr2 = (kr0 - 3.333333333333333e-4)
kr0 = cpsoct(kr2)
kr2 = (kr1 + kr0)
ar6 poscil kr4, kr2, 6
ar7 = (ar5 + ar6)
ar5 = (0.5 * ar7)
ar6 = (ar4 * ar5)
ar4 = (ar2 * ar6)
ar2 = (ar3 * ar4)
ar3 = (ar0 + ar2)
gargg0 = ar3
ar0 = (ar1 + ar2)
gargg1 = ar0
endin

</CsInstruments>

<CsScore>

f2 0 8192 -12  20.0
f6 0 8192 10  1.0
f4 0 8192 11  1.0

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>