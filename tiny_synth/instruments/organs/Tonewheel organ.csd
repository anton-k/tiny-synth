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
ar2 = (0.7 * ar0)
ir12 = 0.8
ir13 = 12000.0
ar3, ar4 reverbsc ar0, ar1, ir12, ir13
ar5 = (ar0 + ar3)
ar0 = (0.3 * ar5)
ar3 = (ar2 + ar0)
ar0 clip ar3, 0.0, 0dbfs
ar2 = (ar0 * 0.8)
arl0 = ar2
ar0 = (0.7 * ar1)
ar2 = (ar1 + ar4)
ar1 = (0.3 * ar2)
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
kr0 linsegr 1.0, 1.0, 1.0, 5.0e-2, 0.0
ar2 upsamp kr0
ar4 = (0.6 * ar2)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar2 upsamp kr0
ir12 = 8.0
ir13 = p4
ir14 = cpsmidinn(ir13)
kr0 = (0.5 * ir14)
ir16 = (ir14 - 6.0)
ir17 = int(ir16)
ir18 = (12.0 * ir17)
ir19 = (100.0 * ir16)
ir20 = (ir18 + ir19)
ir21 = (ir20 - 12.0)
if (ir21 > 12.0) then
    ir22 = 2
else
    ir22 = 4
endif
ir23 = (ir20 - -12.0)
ir24 = (0.5 / ir23)
ar5 poscil ir12, kr0, ir22, ir24
kr0 = (1.4983 * ir14)
ir27 = (ir20 + 7.0)
if (ir27 > 12.0) then
    ir28 = 2
else
    ir28 = 4
endif
ir29 = (ir20 - 7.0)
ir30 = (0.5 / ir29)
ar6 poscil ir12, kr0, ir28, ir30
ar7 = (ar5 + ar6)
kr0 = (1.0 * ir14)
if (ir20 > 12.0) then
    ir34 = 2
else
    ir34 = 4
endif
ir35 = (0.5 / ir20)
ar5 poscil ir12, kr0, ir34, ir35
ar6 = (ar7 + ar5)
kr0 = (2.0 * ir14)
ir39 = (0.5 / ir21)
ar5 poscil ir12, kr0, 6, ir39
ar7 = (ar6 + ar5)
ir42 = 3.0
kr0 = (2.9966 * ir14)
ir44 = (ir20 - 19.0)
ir45 = (0.5 / ir44)
ar5 poscil ir42, kr0, 6, ir45
ar6 = (ar7 + ar5)
ir48 = 2.0
kr0 = (4.0 * ir14)
ir50 = (ir20 - 24.0)
ir51 = (0.5 / ir50)
ar5 poscil ir48, kr0, 6, ir51
ar7 = (ar6 + ar5)
ir54 = 1.0
kr0 = (5.0397 * ir14)
ir56 = (ir20 - 28.0)
ir57 = (0.5 / ir56)
ar5 poscil ir54, kr0, 6, ir57
ar6 = (ar7 + ar5)
ir60 = 0.0
kr0 = (5.9932 * ir14)
ir62 = (ir20 - 31.0)
ir63 = (0.5 / ir62)
ar5 poscil ir60, kr0, 6, ir63
ar7 = (ar6 + ar5)
ir66 = 4.0
kr0 = (8.0 * ir14)
ir68 = (ir20 - 36.0)
ir69 = (0.5 / ir68)
ar5 poscil ir66, kr0, 6, ir69
ar6 = (ar7 + ar5)
ar5 = (ar6 / 9.0)
ar6 = (ar5 / 9.0)
ar5 = (ar2 * ar6)
ar2 = (ar4 * ar5)
ar4 = (ar3 * ar2)
ar2 = (ar0 + ar4)
gargg0 = ar2
ar0 = (ar1 + ar4)
gargg1 = ar0
endin

</CsInstruments>

<CsScore>

f6 0 8192 10  1.0
f4 0 8192 10  1.0 0.0 0.2 0.0 0.1 0.0 5.0e-2 0.0 2.0e-2
f2 0 8192 10  1.0 2.0e-2 1.0e-2

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>