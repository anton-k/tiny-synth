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
ar2 = (0.85 * ar0)
ir12 = 0.8
ir13 = 12000.0
ar3, ar4 reverbsc ar0, ar1, ir12, ir13
ar5 = (ar0 + ar3)
ar0 = (0.15 * ar5)
ar3 = (ar2 + ar0)
ar0 clip ar3, 0.0, 0dbfs
ar2 = (ar0 * 0.8)
arl0 = ar2
ar0 = (0.85 * ar1)
ar2 = (ar1 + ar4)
ar1 = (0.15 * ar2)
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
kr0 linseg 0.0, 0.1, 1.0, 1.0, 1.0
ar2 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 0.1, 0.0
ar4 upsamp kr0
ar5 = (ar2 * ar4)
ar2 = (1.1 * ar5)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar4 upsamp kr0
ir14 = 37.0
kr0 table ir14, 2
ir16 = p4
kr1 = cpsmidinn(ir16)
ir18 = 36.0
kr2 table ir18, 2
ir20 = 0.0
ir21 = 38.0
kr3 table ir21, 2
ir23 = 51.0
kr4 table ir23, 2
ir25 = 52.0
kr5 table ir25, 2
ir27 = 53.0
kr6 table ir27, 2
ar5 fof kr0, kr1, kr2, ir20, kr3, kr4, kr5, kr6, 20.0, 4, 6, 25.0, 0.0, 1.0
ir30 = 40.0
kr0 table ir30, 2
ir32 = 39.0
kr2 table ir32, 2
ir34 = 41.0
kr3 table ir34, 2
ar6 fof kr0, kr1, kr2, ir20, kr3, kr4, kr5, kr6, 20.0, 4, 6, 25.0, 0.0, 1.0
ar7 = (ar5 + ar6)
ir38 = 43.0
kr0 table ir38, 2
ir40 = 42.0
kr2 table ir40, 2
ir42 = 44.0
kr3 table ir42, 2
ar5 fof kr0, kr1, kr2, ir20, kr3, kr4, kr5, kr6, 20.0, 4, 6, 25.0, 0.0, 1.0
ar6 = (ar7 + ar5)
ir46 = 46.0
kr0 table ir46, 2
ir48 = 45.0
kr2 table ir48, 2
ir50 = 47.0
kr3 table ir50, 2
ar5 fof kr0, kr1, kr2, ir20, kr3, kr4, kr5, kr6, 20.0, 4, 6, 25.0, 0.0, 1.0
ar7 = (ar6 + ar5)
ir54 = 49.0
kr0 table ir54, 2
ir56 = 48.0
kr2 table ir56, 2
ir58 = 50.0
kr3 table ir58, 2
ar5 fof kr0, kr1, kr2, ir20, kr3, kr4, kr5, kr6, 20.0, 4, 6, 25.0, 0.0, 1.0
ar6 = (ar7 + ar5)
ar5 = (ar6 / 100.0)
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

f2 0 -234 -2  609.0 0.0 100.0 1000.0 -6.0 100.0 2450.0 -12.0 100.0 2700.0 -11.0 100.0 3240.0 -24.0 100.0 3.0e-3 2.0e-2 7.0e-3 400.0 0.0 100.0 1700.0 -9.0 100.0 2300.0 -8.0 100.0 2900.0 -11.0 100.0 3400.0 -19.0 100.0 3.0e-3 2.0e-2 7.0e-3 238.0 0.0 100.0 1741.0 -20.0 100.0 2450.0 -16.0 100.0 2900.0 -20.0 100.0 4000.0 -32.0 100.0 3.0e-3 2.0e-2 7.0e-3 325.0 0.0 100.0 700.0 -12.0 100.0 2550.0 -26.0 100.0 2850.0 -22.0 100.0 3100.0 -28.0 100.0 3.0e-3 2.0e-2 7.0e-3 360.0 0.0 100.0 750.0 -12.0 100.0 2400.0 -29.0 100.0 2675.0 -26.0 100.0 2950.0 -35.0 100.0 3.0e-3 2.0e-2 7.0e-3 415.0 0.0 100.0 1400.0 -12.0 100.0 2200.0 -16.0 100.0 2800.0 -18.0 100.0 3300.0 -27.0 100.0 3.0e-3 2.0e-2 7.0e-3 300.0 0.0 100.0 1600.0 -14.0 100.0 2150.0 -12.0 100.0 2700.0 -15.0 100.0 3100.0 -23.0 100.0 3.0e-3 2.0e-2 7.0e-3 400.0 0.0 100.0 1050.0 -12.0 100.0 2200.0 -19.0 100.0 2650.0 -20.0 100.0 3100.0 -29.0 100.0 3.0e-3 2.0e-2 7.0e-3 650.0 0.0 100.0 1100.0 -8.0 100.0 2860.0 -13.0 100.0 3300.0 -12.0 100.0 4500.0 -19.0 100.0 3.0e-3 2.0e-2 7.0e-3 500.0 0.0 100.0 1750.0 -9.0 100.0 2450.0 -10.0 100.0 3350.0 -14.0 100.0 5000.0 -23.0 100.0 3.0e-3 2.0e-2 7.0e-3 330.0 0.0 100.0 2000.0 -14.0 100.0 2800.0 -11.0 100.0 3450.0 -50.0 100.0 4500.0 -52.0 100.0 3.0e-3 2.0e-2 7.0e-3 400.0 0.0 100.0 840.0 -12.0 100.0 2800.0 -26.0 100.0 3250.0 -24.0 100.0 4500.0 -31.0 100.0 3.0e-3 2.0e-2 7.0e-3 280.0 0.0 100.0 650.0 -18.0 100.0 2200.0 -48.0 100.0 3450.0 -50.0 100.0 4500.0 -52.0 100.0 3.0e-3 2.0e-2 7.0e-3
f4 0 8192 10  1.0
f6 0 8192 19  0.5 0.5 270.0 0.5

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>