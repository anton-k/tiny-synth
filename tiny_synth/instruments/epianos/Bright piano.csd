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
ar2 = (0.8 * ar0)
ir12 = 0.8
ir13 = 12000.0
ar3, ar4 reverbsc ar0, ar1, ir12, ir13
ar5 = (ar0 + ar3)
ar0 = (0.2 * ar5)
ar3 = (ar2 + ar0)
ar0 clip ar3, 0.0, 0dbfs
ar2 = (ar0 * 0.8)
arl0 = ar2
ar0 = (0.8 * ar1)
ar2 = (ar1 + ar4)
ar1 = (0.2 * ar2)
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
ir4 = rnd(ir1)
kr1 = rnd(ir1)
ir8 = rnd(ir1)
kr2 = rnd(ir1)
ir12 = rnd(ir1)
kr3 = rnd(ir1)
ir16 = rnd(ir1)
kr4 = rnd(ir1)
ir20 = rnd(ir1)
kr5 = rnd(ir1)
ir24 = rnd(ir1)
kr6 = rnd(ir1)
ir28 = rnd(ir1)
kr7 = rnd(ir1)
ir32 = rnd(ir1)
kr8 = rnd(ir1)
ir36 = rnd(ir1)
kr9 = rnd(ir1)
ir40 = rnd(ir1)
kr10 = rnd(ir1)
ir44 = rnd(ir1)
kr11 = rnd(ir1)
ir48 = rnd(ir1)
kr12 = rnd(ir1)
ir52 = rnd(ir1)
kr13 = rnd(ir1)
ir56 = rnd(ir1)
kr14 = rnd(ir1)
ir60 = rnd(ir1)
kr15 = rnd(ir1)
ir64 = rnd(ir1)
kr16 = rnd(ir1)
ir68 = rnd(ir1)
kr17 = rnd(ir1)
ir72 = rnd(ir1)
kr18 = rnd(ir1)
ir76 = rnd(ir1)
kr19 = rnd(ir1)
ir80 = rnd(ir1)
kr20 = rnd(ir1)
ir84 = rnd(ir1)
kr21 = rnd(ir1)
ir88 = rnd(ir1)
kr22 = rnd(ir1)
ir92 = rnd(ir1)
kr23 = rnd(ir1)
ir96 = rnd(ir1)
kr24 = rnd(ir1)
ir100 = rnd(ir1)
kr25 = rnd(ir1)
ir104 = rnd(ir1)
kr26 = rnd(ir1)
ir108 = rnd(ir1)
kr27 = rnd(ir1)
ir112 = rnd(ir1)
ar0 = gargg0
ar1 = gargg1
kr28 chnget "volume"
ar2 upsamp kr28
ar3 = (1.0 * ar2)
ir120 = (p5 / 64.0)
ir121 = (ir120 ^ 2.0)
kr28 = (ir121 / 2.0)
ar2 upsamp kr28
ir123 = (ir121 / 2.0)
ir124 = (ir123 + 2.0)
ir125 = p4
ir126 = cpsmidinn(ir125)
ir127 = (ir126 / 1000.0)
ir128 = (ir127 ^ 2.0)
ir129 = (3.0 * ir128)
ir130 = (0.7 - ir129)
ir131 = (ir124 + ir130)
ir132 = (ir123 / 10.0)
ir133 = (ir132 + 5.0e-2)
ir134 = (ir127 / 10.0)
ir135 = (ir133 - ir134)
ar4 madsr 1.0e-3, ir131, 0.0, ir135
ar5 = (ar2 * ar4)
kr28 = cpsmidinn(ir125)
ar4 upsamp kr28
kr29 = (2.0 * kr0)
kr0 = (kr29 - 1.0)
ar6 upsamp kr0
ar7 = (5.0 * ar6)
ar6 = cent(ar7)
ar7 = (ar4 * ar6)
ar6 = (1.0 * ar7)
ar7 oscil3 ir1, ar6, 2, ir4
kr0 = (2.0 * kr1)
kr1 = (kr0 - 1.0)
ar6 upsamp kr1
ar8 = (5.0 * ar6)
ar6 = cent(ar8)
ar8 = (ar4 * ar6)
ar6 = (1.0 * ar8)
ar8 oscil3 ir1, ar6, 2, ir8
ar6 = (ar7 + ar8)
kr0 = (2.0 * kr2)
kr1 = (kr0 - 1.0)
ar7 upsamp kr1
ar8 = (5.0 * ar7)
ar7 = cent(ar8)
ar8 = (ar4 * ar7)
ar7 = (1.0 * ar8)
ar8 oscil3 ir1, ar7, 2, ir12
ar7 = (ar6 + ar8)
kr0 = (2.0 * kr3)
kr1 = (kr0 - 1.0)
ar6 upsamp kr1
ar8 = (5.0 * ar6)
ar6 = cent(ar8)
ar8 = (ar4 * ar6)
ar6 = (1.0 * ar8)
ar8 oscil3 ir1, ar6, 2, ir16
ar6 = (ar7 + ar8)
ar7 = (ar6 / 4.0)
ar6 = (1.0 * ar7)
kr0 = (2.0 * kr4)
kr1 = (kr0 - 1.0)
ar7 upsamp kr1
ar8 = (10.0 * ar7)
ar7 = cent(ar8)
ar8 = (ar4 * ar7)
ar7 = (3.01 * ar8)
ar8 oscil3 ir1, ar7, 2, ir20
kr0 = (2.0 * kr5)
kr1 = (kr0 - 1.0)
ar7 upsamp kr1
ar9 = (10.0 * ar7)
ar7 = cent(ar9)
ar9 = (ar4 * ar7)
ar7 = (3.01 * ar9)
ar9 oscil3 ir1, ar7, 2, ir24
ar7 = (ar8 + ar9)
kr0 = (2.0 * kr6)
kr1 = (kr0 - 1.0)
ar8 upsamp kr1
ar9 = (10.0 * ar8)
ar8 = cent(ar9)
ar9 = (ar4 * ar8)
ar8 = (3.01 * ar9)
ar9 oscil3 ir1, ar8, 2, ir28
ar8 = (ar7 + ar9)
kr0 = (2.0 * kr7)
kr1 = (kr0 - 1.0)
ar7 upsamp kr1
ar9 = (10.0 * ar7)
ar7 = cent(ar9)
ar9 = (ar4 * ar7)
ar7 = (3.01 * ar9)
ar9 oscil3 ir1, ar7, 2, ir32
ar7 = (ar8 + ar9)
kr0 = (2.0 * kr8)
kr1 = (kr0 - 1.0)
ar8 upsamp kr1
ar9 = (10.0 * ar8)
ar8 = cent(ar9)
ar9 = (ar4 * ar8)
ar8 = (3.01 * ar9)
ar9 oscil3 ir1, ar8, 2, ir36
ar8 = (ar7 + ar9)
kr0 = (2.0 * kr9)
kr1 = (kr0 - 1.0)
ar7 upsamp kr1
ar9 = (10.0 * ar7)
ar7 = cent(ar9)
ar9 = (ar4 * ar7)
ar7 = (3.01 * ar9)
ar9 oscil3 ir1, ar7, 2, ir40
ar7 = (ar8 + ar9)
kr0 = (2.0 * kr10)
kr1 = (kr0 - 1.0)
ar8 upsamp kr1
ar9 = (10.0 * ar8)
ar8 = cent(ar9)
ar9 = (ar4 * ar8)
ar8 = (3.01 * ar9)
ar9 oscil3 ir1, ar8, 2, ir44
ar8 = (ar7 + ar9)
kr0 = (2.0 * kr11)
kr1 = (kr0 - 1.0)
ar7 upsamp kr1
ar9 = (10.0 * ar7)
ar7 = cent(ar9)
ar9 = (ar4 * ar7)
ar7 = (3.01 * ar9)
ar9 oscil3 ir1, ar7, 2, ir48
ar7 = (ar8 + ar9)
ar8 = (ar7 / 8.0)
ar7 = (1.0 * ar8)
ar8 = (ar6 + ar7)
kr0 = (2.0 * kr12)
kr1 = (kr0 - 1.0)
ar6 upsamp kr1
ar7 = (15.0 * ar6)
ar6 = cent(ar7)
ar7 = (ar4 * ar6)
ar6 = (5.0 * ar7)
ar7 oscil3 ir1, ar6, 2, ir52
kr0 = (2.0 * kr13)
kr1 = (kr0 - 1.0)
ar6 upsamp kr1
ar9 = (15.0 * ar6)
ar6 = cent(ar9)
ar9 = (ar4 * ar6)
ar6 = (5.0 * ar9)
ar9 oscil3 ir1, ar6, 2, ir56
ar6 = (ar7 + ar9)
kr0 = (2.0 * kr14)
kr1 = (kr0 - 1.0)
ar7 upsamp kr1
ar9 = (15.0 * ar7)
ar7 = cent(ar9)
ar9 = (ar4 * ar7)
ar7 = (5.0 * ar9)
ar9 oscil3 ir1, ar7, 2, ir60
ar7 = (ar6 + ar9)
kr0 = (2.0 * kr15)
kr1 = (kr0 - 1.0)
ar6 upsamp kr1
ar9 = (15.0 * ar6)
ar6 = cent(ar9)
ar9 = (ar4 * ar6)
ar6 = (5.0 * ar9)
ar9 oscil3 ir1, ar6, 2, ir64
ar6 = (ar7 + ar9)
kr0 = (2.0 * kr16)
kr1 = (kr0 - 1.0)
ar7 upsamp kr1
ar9 = (15.0 * ar7)
ar7 = cent(ar9)
ar9 = (ar4 * ar7)
ar7 = (5.0 * ar9)
ar9 oscil3 ir1, ar7, 2, ir68
ar7 = (ar6 + ar9)
kr0 = (2.0 * kr17)
kr1 = (kr0 - 1.0)
ar6 upsamp kr1
ar9 = (15.0 * ar6)
ar6 = cent(ar9)
ar9 = (ar4 * ar6)
ar6 = (5.0 * ar9)
ar9 oscil3 ir1, ar6, 2, ir72
ar6 = (ar7 + ar9)
kr0 = (2.0 * kr18)
kr1 = (kr0 - 1.0)
ar7 upsamp kr1
ar9 = (15.0 * ar7)
ar7 = cent(ar9)
ar9 = (ar4 * ar7)
ar7 = (5.0 * ar9)
ar9 oscil3 ir1, ar7, 2, ir76
ar7 = (ar6 + ar9)
kr0 = (2.0 * kr19)
kr1 = (kr0 - 1.0)
ar6 upsamp kr1
ar9 = (15.0 * ar6)
ar6 = cent(ar9)
ar9 = (ar4 * ar6)
ar6 = (5.0 * ar9)
ar9 oscil3 ir1, ar6, 2, ir80
ar6 = (ar7 + ar9)
ar7 = (ar6 / 8.0)
ar6 = (0.5 * ar7)
ar7 = (ar8 + ar6)
kr0 = (2.0 * kr20)
kr1 = (kr0 - 1.0)
ar6 upsamp kr1
ar8 = (4.0 * ar6)
ar6 = cent(ar8)
ar8 = (ar4 * ar6)
ar6 = (7.0 * ar8)
ar8 oscil3 ir1, ar6, 2, ir84
kr0 = (2.0 * kr21)
kr1 = (kr0 - 1.0)
ar6 upsamp kr1
ar9 = (4.0 * ar6)
ar6 = cent(ar9)
ar9 = (ar4 * ar6)
ar6 = (7.0 * ar9)
ar9 oscil3 ir1, ar6, 2, ir88
ar6 = (ar8 + ar9)
kr0 = (2.0 * kr22)
kr1 = (kr0 - 1.0)
ar8 upsamp kr1
ar9 = (4.0 * ar8)
ar8 = cent(ar9)
ar9 = (ar4 * ar8)
ar8 = (7.0 * ar9)
ar9 oscil3 ir1, ar8, 2, ir92
ar8 = (ar6 + ar9)
kr0 = (2.0 * kr23)
kr1 = (kr0 - 1.0)
ar6 upsamp kr1
ar9 = (4.0 * ar6)
ar6 = cent(ar9)
ar9 = (ar4 * ar6)
ar6 = (7.0 * ar9)
ar9 oscil3 ir1, ar6, 2, ir96
ar6 = (ar8 + ar9)
kr0 = (2.0 * kr24)
kr1 = (kr0 - 1.0)
ar8 upsamp kr1
ar9 = (4.0 * ar8)
ar8 = cent(ar9)
ar9 = (ar4 * ar8)
ar8 = (7.0 * ar9)
ar9 oscil3 ir1, ar8, 2, ir100
ar8 = (ar6 + ar9)
kr0 = (2.0 * kr25)
kr1 = (kr0 - 1.0)
ar6 upsamp kr1
ar9 = (4.0 * ar6)
ar6 = cent(ar9)
ar9 = (ar4 * ar6)
ar6 = (7.0 * ar9)
ar9 oscil3 ir1, ar6, 2, ir104
ar6 = (ar8 + ar9)
kr0 = (2.0 * kr26)
kr1 = (kr0 - 1.0)
ar8 upsamp kr1
ar9 = (4.0 * ar8)
ar8 = cent(ar9)
ar9 = (ar4 * ar8)
ar8 = (7.0 * ar9)
ar9 oscil3 ir1, ar8, 2, ir108
ar8 = (ar6 + ar9)
kr0 = (2.0 * kr27)
kr1 = (kr0 - 1.0)
ar6 upsamp kr1
ar9 = (4.0 * ar6)
ar6 = cent(ar9)
ar9 = (ar4 * ar6)
ar4 = (7.0 * ar9)
ar6 oscil3 ir1, ar4, 2, ir112
ar4 = (ar8 + ar6)
ar6 = (ar4 / 8.0)
ar4 = (0.3 * ar6)
ar6 = (ar7 + ar4)
kr0 madsr 8.5e-2, 3.0, 0.0, 0.1
kr1 = (4500.0 * kr0)
kr0 = (2500.0 + kr1)
ir373 = 0.25
ar4 moogladder ar6, kr0, ir373
ar6 = (ar5 * ar4)
ar4 = (1.12 * ar6)
kr0 linsegr 1.0, 1.0, 1.0, 0.75, 0.0
ar5 upsamp kr0
ar6 = (0.8 * ar5)
ir379 = 0.0
ar5 mpulse k(ksmps), ir379, 0.0
kr0 downsamp ar5, ksmps
ar5 upsamp kr0
ir382 = 120.0
ar7 bqrez ar5, kr28, ir382, 2.0
ar8 balance ar7, ar5
ar5 = (ar2 * ar8)
ar2 = (ar6 * ar5)
ar5 = (0.15 * ar2)
ar2 = (ar4 + ar5)
ar4 = (ar3 * ar2)
ar2 = (ar0 + ar4)
gargg0 = ar2
ar0 = (ar1 + ar4)
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