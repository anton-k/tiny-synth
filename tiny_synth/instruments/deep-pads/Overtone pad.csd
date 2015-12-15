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
ar2 = (0.65 * ar0)
ir12 = 0.8
ir13 = 12000.0
ar3, ar4 reverbsc ar0, ar1, ir12, ir13
ar5 = (ar0 + ar3)
ar0 = (0.35 * ar5)
ar3 = (ar2 + ar0)
ar0 clip ar3, 0.0, 0dbfs
ar2 = (ar0 * 0.8)
arl0 = ar2
ar0 = (0.65 * ar1)
ar2 = (ar1 + ar4)
ar1 = (0.35 * ar2)
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
ir15 = cpsmidinn(ir14)
kr0 = (ir15 * 1.0)
ir211 = i(kr0)
ar5 upsamp kr0
ar7 = (-0.264 + ar5)
ir18 = (ir15 * 1.0)
if (ir18 < 350.0) then
    ir19 = 4
else
    ir19 = 6
endif
if (ir18 < 230.0) then
    ir20 = 2
else
    ir20 = ir19
endif
ar8 oscil3 ir13, ar7, ir20
ar7 = (-0.21600000000000003 + ar5)
ar9 oscil3 ir13, ar7, ir20
ar7 = (ar8 + ar9)
ar8 = (-0.168 + ar5)
ar9 oscil3 ir13, ar8, ir20
ar8 = (ar7 + ar9)
ar7 = (-0.12 + ar5)
ar9 oscil3 ir13, ar7, ir20
ar7 = (ar8 + ar9)
ar8 = (-7.200000000000001e-2 + ar5)
ar9 oscil3 ir13, ar8, ir20
ar8 = (ar7 + ar9)
ar7 = (-2.400000000000002e-2 + ar5)
ar9 oscil3 ir13, ar7, ir20
ar7 = (ar8 + ar9)
ar8 = (2.400000000000002e-2 + ar5)
ar9 oscil3 ir13, ar8, ir20
ar8 = (ar7 + ar9)
ar7 = (7.200000000000001e-2 + ar5)
ar9 oscil3 ir13, ar7, ir20
ar7 = (ar8 + ar9)
ar8 = (0.12 + ar5)
ar9 oscil3 ir13, ar8, ir20
ar8 = (ar7 + ar9)
ar7 = (0.16799999999999998 + ar5)
ar9 oscil3 ir13, ar7, ir20
ar7 = (ar8 + ar9)
ar8 = (0.21599999999999997 + ar5)
ar9 oscil3 ir13, ar8, ir20
ar8 = (ar7 + ar9)
ar7 = (ar8 / 11.0)
ar8 = (ar6 * ar7)
kr0 linsegr 1.0, 1.0, 1.0, 1.0, 0.0
ar7 upsamp kr0
ar9 = (ar4 * ar7)
ar4 = (ar5 * 0.5)
ar5 = (-0.39 + ar4)
ir58 = (ir211 * 0.5)
if (ir58 < 350.0) then
    ir59 = 4
else
    ir59 = 6
endif
if (ir58 < 230.0) then
    ir60 = 2
else
    ir60 = ir59
endif
ar7 oscil3 ir13, ar5, ir60
ar5 = (-0.33 + ar4)
ar10 oscil3 ir13, ar5, ir60
ar5 = (ar7 + ar10)
ar7 = (-0.27 + ar4)
ar10 oscil3 ir13, ar7, ir60
ar7 = (ar5 + ar10)
ar5 = (-0.21 + ar4)
ar10 oscil3 ir13, ar5, ir60
ar5 = (ar7 + ar10)
ar7 = (-0.15 + ar4)
ar10 oscil3 ir13, ar7, ir60
ar7 = (ar5 + ar10)
ar5 = (-8.999999999999997e-2 + ar4)
ar10 oscil3 ir13, ar5, ir60
ar5 = (ar7 + ar10)
ar7 = (-2.999999999999997e-2 + ar4)
ar10 oscil3 ir13, ar7, ir60
ar7 = (ar5 + ar10)
ar5 = (3.0000000000000027e-2 + ar4)
ar10 oscil3 ir13, ar5, ir60
ar5 = (ar7 + ar10)
ar7 = (9.000000000000002e-2 + ar4)
ar10 oscil3 ir13, ar7, ir60
ar7 = (ar5 + ar10)
ar5 = (0.15000000000000002 + ar4)
ar10 oscil3 ir13, ar5, ir60
ar5 = (ar7 + ar10)
ar7 = (0.21000000000000008 + ar4)
ar10 oscil3 ir13, ar7, ir60
ar7 = (ar5 + ar10)
ar5 = (0.27 + ar4)
ar10 oscil3 ir13, ar5, ir60
ar5 = (ar7 + ar10)
ar7 = (0.33000000000000007 + ar4)
ar4 oscil3 ir13, ar7, ir60
ar7 = (ar5 + ar4)
ar4 = (ar7 / 13.0)
ar5 = (ar9 * ar4)
ar4 = (ar8 + ar5)
ar5 = (ar2 * ar4)
ar4 = (0.75 * ar5)
ir103 = 1500.0
ir104 = 0.1
ar7 moogladder ar5, ir103, ir104
ar5 = (0.25 * ar7)
ar7 = (ar4 + ar5)
ar4 = (0.65 * ar7)
ar5 = (0.75 * ar4)
kr0 = (ir15 * 0.5)
ir208 = i(kr0)
ar4 upsamp kr0
ar7 = (-0.264 + ar4)
ir112 = (ir15 * 0.5)
if (ir112 < 350.0) then
    ir113 = 4
else
    ir113 = 6
endif
if (ir112 < 230.0) then
    ir114 = 2
else
    ir114 = ir113
endif
ar8 oscil3 ir13, ar7, ir114
ar7 = (-0.21600000000000003 + ar4)
ar10 oscil3 ir13, ar7, ir114
ar7 = (ar8 + ar10)
ar8 = (-0.168 + ar4)
ar10 oscil3 ir13, ar8, ir114
ar8 = (ar7 + ar10)
ar7 = (-0.12 + ar4)
ar10 oscil3 ir13, ar7, ir114
ar7 = (ar8 + ar10)
ar8 = (-7.200000000000001e-2 + ar4)
ar10 oscil3 ir13, ar8, ir114
ar8 = (ar7 + ar10)
ar7 = (-2.400000000000002e-2 + ar4)
ar10 oscil3 ir13, ar7, ir114
ar7 = (ar8 + ar10)
ar8 = (2.400000000000002e-2 + ar4)
ar10 oscil3 ir13, ar8, ir114
ar8 = (ar7 + ar10)
ar7 = (7.200000000000001e-2 + ar4)
ar10 oscil3 ir13, ar7, ir114
ar7 = (ar8 + ar10)
ar8 = (0.12 + ar4)
ar10 oscil3 ir13, ar8, ir114
ar8 = (ar7 + ar10)
ar7 = (0.16799999999999998 + ar4)
ar10 oscil3 ir13, ar7, ir114
ar7 = (ar8 + ar10)
ar8 = (0.21599999999999997 + ar4)
ar10 oscil3 ir13, ar8, ir114
ar8 = (ar7 + ar10)
ar7 = (ar8 / 11.0)
ar8 = (ar6 * ar7)
ar6 = (ar4 * 0.5)
ar4 = (-0.39 + ar6)
ir150 = (ir208 * 0.5)
if (ir150 < 350.0) then
    ir151 = 4
else
    ir151 = 6
endif
if (ir150 < 230.0) then
    ir152 = 2
else
    ir152 = ir151
endif
ar7 oscil3 ir13, ar4, ir152
ar4 = (-0.33 + ar6)
ar10 oscil3 ir13, ar4, ir152
ar4 = (ar7 + ar10)
ar7 = (-0.27 + ar6)
ar10 oscil3 ir13, ar7, ir152
ar7 = (ar4 + ar10)
ar4 = (-0.21 + ar6)
ar10 oscil3 ir13, ar4, ir152
ar4 = (ar7 + ar10)
ar7 = (-0.15 + ar6)
ar10 oscil3 ir13, ar7, ir152
ar7 = (ar4 + ar10)
ar4 = (-8.999999999999997e-2 + ar6)
ar10 oscil3 ir13, ar4, ir152
ar4 = (ar7 + ar10)
ar7 = (-2.999999999999997e-2 + ar6)
ar10 oscil3 ir13, ar7, ir152
ar7 = (ar4 + ar10)
ar4 = (3.0000000000000027e-2 + ar6)
ar10 oscil3 ir13, ar4, ir152
ar4 = (ar7 + ar10)
ar7 = (9.000000000000002e-2 + ar6)
ar10 oscil3 ir13, ar7, ir152
ar7 = (ar4 + ar10)
ar4 = (0.15000000000000002 + ar6)
ar10 oscil3 ir13, ar4, ir152
ar4 = (ar7 + ar10)
ar7 = (0.21000000000000008 + ar6)
ar10 oscil3 ir13, ar7, ir152
ar7 = (ar4 + ar10)
ar4 = (0.27 + ar6)
ar10 oscil3 ir13, ar4, ir152
ar4 = (ar7 + ar10)
ar7 = (0.33000000000000007 + ar6)
ar6 oscil3 ir13, ar7, ir152
ar7 = (ar4 + ar6)
ar4 = (ar7 / 13.0)
ar6 = (ar9 * ar4)
ar4 = (ar8 + ar6)
ar6 = (ar2 * ar4)
ar2 = (0.75 * ar6)
ar4 moogladder ar6, ir103, ir104
ar6 = (0.25 * ar4)
ar4 = (ar2 + ar6)
ar2 = (0.65 * ar4)
ar4 = (0.375 * ar2)
ar2 = (ar5 + ar4)
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