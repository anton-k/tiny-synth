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
ar0 = (0.8 * ar1)
ir13 = 0.99
ir14 = 12000.0
ar1, ar3 reverbsc ar2, ar0, ir13, ir14
ar4 = (ar2 + ar1)
ar1 = (0.2 * ar4)
ar4 = (ar2 + ar1)
ar1 clip ar4, 0.0, 0dbfs
ar2 = (ar1 * 0.8)
arl0 = ar2
ar1 = (ar0 + ar3)
ar2 = (0.2 * ar1)
ar1 = (ar0 + ar2)
ar0 clip ar1, 0.0, 0dbfs
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
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar2 upsamp kr0
kr0 linseg 0.0, 0.25, 1.0, 1.0, 1.0
ar4 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 1.2, 0.0
ar5 upsamp kr0
ar6 = (ar4 * ar5)
ir13 = 1.0
ir14 = p4
kr0 = cpsmidinn(ir14)
ir116 = i(kr0)
ar5 upsamp kr0
ar7 = (-0.264 + ar5)
ir17 = cpsmidinn(ir14)
if (ir17 < 350.0) then
    ir18 = 4
else
    ir18 = 6
endif
if (ir17 < 230.0) then
    ir19 = 2
else
    ir19 = ir18
endif
ar8 oscil3 ir13, ar7, ir19
ar7 = (-0.21600000000000003 + ar5)
ar9 oscil3 ir13, ar7, ir19
ar7 = (ar8 + ar9)
ar8 = (-0.168 + ar5)
ar9 oscil3 ir13, ar8, ir19
ar8 = (ar7 + ar9)
ar7 = (-0.12 + ar5)
ar9 oscil3 ir13, ar7, ir19
ar7 = (ar8 + ar9)
ar8 = (-7.200000000000001e-2 + ar5)
ar9 oscil3 ir13, ar8, ir19
ar8 = (ar7 + ar9)
ar7 = (-2.400000000000002e-2 + ar5)
ar9 oscil3 ir13, ar7, ir19
ar7 = (ar8 + ar9)
ar8 = (2.400000000000002e-2 + ar5)
ar9 oscil3 ir13, ar8, ir19
ar8 = (ar7 + ar9)
ar7 = (7.200000000000001e-2 + ar5)
ar9 oscil3 ir13, ar7, ir19
ar7 = (ar8 + ar9)
ar8 = (0.12 + ar5)
ar9 oscil3 ir13, ar8, ir19
ar8 = (ar7 + ar9)
ar7 = (0.16799999999999998 + ar5)
ar9 oscil3 ir13, ar7, ir19
ar7 = (ar8 + ar9)
ar8 = (0.21599999999999997 + ar5)
ar9 oscil3 ir13, ar8, ir19
ar8 = (ar7 + ar9)
ar7 = (ar8 / 11.0)
ar8 = (ar6 * ar7)
kr0 linsegr 1.0, 1.0, 1.0, 1.0, 0.0
ar6 upsamp kr0
ar7 = (ar4 * ar6)
ar4 = (ar5 * 0.5)
ar5 = (-0.39 + ar4)
ir57 = (ir116 * 0.5)
if (ir57 < 350.0) then
    ir58 = 4
else
    ir58 = 6
endif
if (ir57 < 230.0) then
    ir59 = 2
else
    ir59 = ir58
endif
ar6 oscil3 ir13, ar5, ir59
ar5 = (-0.33 + ar4)
ar9 oscil3 ir13, ar5, ir59
ar5 = (ar6 + ar9)
ar6 = (-0.27 + ar4)
ar9 oscil3 ir13, ar6, ir59
ar6 = (ar5 + ar9)
ar5 = (-0.21 + ar4)
ar9 oscil3 ir13, ar5, ir59
ar5 = (ar6 + ar9)
ar6 = (-0.15 + ar4)
ar9 oscil3 ir13, ar6, ir59
ar6 = (ar5 + ar9)
ar5 = (-8.999999999999997e-2 + ar4)
ar9 oscil3 ir13, ar5, ir59
ar5 = (ar6 + ar9)
ar6 = (-2.999999999999997e-2 + ar4)
ar9 oscil3 ir13, ar6, ir59
ar6 = (ar5 + ar9)
ar5 = (3.0000000000000027e-2 + ar4)
ar9 oscil3 ir13, ar5, ir59
ar5 = (ar6 + ar9)
ar6 = (9.000000000000002e-2 + ar4)
ar9 oscil3 ir13, ar6, ir59
ar6 = (ar5 + ar9)
ar5 = (0.15000000000000002 + ar4)
ar9 oscil3 ir13, ar5, ir59
ar5 = (ar6 + ar9)
ar6 = (0.21000000000000008 + ar4)
ar9 oscil3 ir13, ar6, ir59
ar6 = (ar5 + ar9)
ar5 = (0.27 + ar4)
ar9 oscil3 ir13, ar5, ir59
ar5 = (ar6 + ar9)
ar6 = (0.33000000000000007 + ar4)
ar4 oscil3 ir13, ar6, ir59
ar6 = (ar5 + ar4)
ar4 = (ar6 / 13.0)
ar5 = (ar7 * ar4)
ar4 = (ar8 + ar5)
ar5 = (ar2 * ar4)
ar2 = (0.75 * ar5)
ir102 = 1500.0
ir103 = 0.1
ar4 moogladder ar5, ir102, ir103
ar5 = (0.25 * ar4)
ar4 = (ar2 + ar5)
ar2 = (0.65 * ar4)
ar4 = (ar3 * ar2)
ar2 = (ar0 + ar4)
gargg0 = ar2
ar0 = (ar1 + ar4)
gargg1 = ar0
endin

</CsInstruments>

<CsScore>

f6 0 8192 10  0.3 0.0 0.0 0.0 0.1
f4 0 8192 10  0.3 0.0 0.0 0.0 0.1 0.1 0.1
f2 0 8192 10  0.3 0.0 0.0 0.0 0.1 0.1 0.1 0.1 0.1

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>