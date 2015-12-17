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
arl0 init 0.0
arl1 init 0.0
ir5 = p4
kr0 = cpsmidinn(ir5)
if (kr0 <= 220.0) then
    ir9 = 5.0e-2
    ir10 = 0.75
    ar0 randi ir9, ir10
    ir13 = 5.0e-2
    ir14 = 0.75
    ar1 randi ir13, ir14
    ir17 = 5.0e-2
    ir18 = 0.75
    ar2 randi ir17, ir18
    ir21 = 5.0e-2
    ir22 = 0.75
    ar3 randi ir21, ir22
    ir25 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir28 = 1.0
    ir29 = 0.9
    ar4 gbuzz ir25, kr0, kr2, ir28, ir29, 2
    ar5 madsr 0.1, 0.0, 1.0, 0.1
    ar6 = (ar4 * ar5)
    ir33 = 1.0
    ir34 = 4.0
    ar4 oscil3 ir33, ir34, 4
    ar5 = (1.2e-3 * ar4)
    ir37 = 5.0e-2
    ir38 = 0.75
    ar4 randi ir37, ir38
    ar7 = (1.0 + ar4)
    ar4 = (7.0 * ar7)
    ar7 = (ar5 * ar4)
    ar4 vdelay ar6, ar7, 1.5e-2
    ir44 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir47 = 1.0
    ir48 = 0.9
    ar5 gbuzz ir44, kr0, kr2, ir47, ir48, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar5 * ar6)
    ir52 = 1.0
    ir53 = 5.0
    ar5 oscil3 ir52, ir53, 4
    ar6 = (9.0e-4 * ar5)
    ir56 = 5.0e-2
    ir57 = 0.75
    ar5 randi ir56, ir57
    ar8 = (1.0 + ar5)
    ar5 = (7.0 * ar8)
    ar8 = (ar6 * ar5)
    ar5 vdelay ar7, ar8, 1.5e-2
    ar6 = (ar4 + ar5)
    ir64 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir67 = 1.0
    ir68 = 0.9
    ar4 gbuzz ir64, kr0, kr2, ir67, ir68, 2
    ar5 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar4 * ar5)
    ir72 = 1.0
    ir73 = 6.3
    ar4 oscil3 ir72, ir73, 4
    ar5 = (8.7e-4 * ar4)
    ir76 = 5.0e-2
    ir77 = 0.75
    ar4 randi ir76, ir77
    ar8 = (1.0 + ar4)
    ar4 = (7.0 * ar8)
    ar8 = (ar5 * ar4)
    ar4 vdelay ar7, ar8, 1.5e-2
    ar5 = (ar6 + ar4)
    ir84 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir87 = 1.0
    ir88 = 0.9
    ar4 gbuzz ir84, kr0, kr2, ir87, ir88, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar4 * ar6)
    ir92 = 1.0
    ir93 = 4.4
    ar4 oscil3 ir92, ir93, 4
    ar6 = (1.1e-3 * ar4)
    ir96 = 5.0e-2
    ir97 = 0.75
    ar4 randi ir96, ir97
    ar8 = (1.0 + ar4)
    ar4 = (7.0 * ar8)
    ar8 = (ar6 * ar4)
    ar4 vdelay ar7, ar8, 1.5e-2
    ar6 = (ar5 + ar4)
    ar4 = (ar6 / 4.0)
    ir105 = 330.0
    ir106 = 50.0
    ar5 reson ar4, ir105, ir106
    ir108 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir111 = 1.0
    ir112 = 0.9
    ar4 gbuzz ir108, kr0, kr2, ir111, ir112, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar4 * ar6)
    ir116 = 1.0
    ir117 = 4.0
    ar4 oscil3 ir116, ir117, 4
    ar6 = (1.2e-3 * ar4)
    ir120 = 5.0e-2
    ir121 = 0.75
    ar4 randi ir120, ir121
    ar8 = (1.0 + ar4)
    ar4 = (7.0 * ar8)
    ar8 = (ar6 * ar4)
    ar4 vdelay ar7, ar8, 1.5e-2
    ir127 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir130 = 1.0
    ir131 = 0.9
    ar6 gbuzz ir127, kr0, kr2, ir130, ir131, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar6 * ar7)
    ir135 = 1.0
    ir136 = 5.0
    ar6 oscil3 ir135, ir136, 4
    ar7 = (9.0e-4 * ar6)
    ir139 = 5.0e-2
    ir140 = 0.75
    ar6 randi ir139, ir140
    ar9 = (1.0 + ar6)
    ar6 = (7.0 * ar9)
    ar9 = (ar7 * ar6)
    ar6 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar4 + ar6)
    ir147 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir150 = 1.0
    ir151 = 0.9
    ar4 gbuzz ir147, kr0, kr2, ir150, ir151, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar4 * ar6)
    ir155 = 1.0
    ir156 = 6.3
    ar4 oscil3 ir155, ir156, 4
    ar6 = (8.7e-4 * ar4)
    ir159 = 5.0e-2
    ir160 = 0.75
    ar4 randi ir159, ir160
    ar9 = (1.0 + ar4)
    ar4 = (7.0 * ar9)
    ar9 = (ar6 * ar4)
    ar4 vdelay ar8, ar9, 1.5e-2
    ar6 = (ar7 + ar4)
    ir167 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir170 = 1.0
    ir171 = 0.9
    ar4 gbuzz ir167, kr0, kr2, ir170, ir171, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar4 * ar7)
    ir175 = 1.0
    ir176 = 4.4
    ar4 oscil3 ir175, ir176, 4
    ar7 = (1.1e-3 * ar4)
    ir179 = 5.0e-2
    ir180 = 0.75
    ar4 randi ir179, ir180
    ar9 = (1.0 + ar4)
    ar4 = (7.0 * ar9)
    ar9 = (ar7 * ar4)
    ar4 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar6 + ar4)
    ar4 = (ar7 / 4.0)
    ir188 = 2000.0
    ir189 = 50.0
    ar6 reson ar4, ir188, ir189
    ar4 = (ar5 + ar6)
    ir192 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir195 = 1.0
    ir196 = 0.9
    ar5 gbuzz ir192, kr0, kr2, ir195, ir196, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar5 * ar6)
    ir200 = 1.0
    ir201 = 4.0
    ar5 oscil3 ir200, ir201, 4
    ar6 = (1.2e-3 * ar5)
    ir204 = 5.0e-2
    ir205 = 0.75
    ar5 randi ir204, ir205
    ar8 = (1.0 + ar5)
    ar5 = (7.0 * ar8)
    ar8 = (ar6 * ar5)
    ar5 vdelay ar7, ar8, 1.5e-2
    ir211 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir214 = 1.0
    ir215 = 0.9
    ar6 gbuzz ir211, kr0, kr2, ir214, ir215, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar6 * ar7)
    ir219 = 1.0
    ir220 = 5.0
    ar6 oscil3 ir219, ir220, 4
    ar7 = (9.0e-4 * ar6)
    ir223 = 5.0e-2
    ir224 = 0.75
    ar6 randi ir223, ir224
    ar9 = (1.0 + ar6)
    ar6 = (7.0 * ar9)
    ar9 = (ar7 * ar6)
    ar6 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar5 + ar6)
    ir231 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir234 = 1.0
    ir235 = 0.9
    ar5 gbuzz ir231, kr0, kr2, ir234, ir235, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar5 * ar6)
    ir239 = 1.0
    ir240 = 6.3
    ar5 oscil3 ir239, ir240, 4
    ar6 = (8.7e-4 * ar5)
    ir243 = 5.0e-2
    ir244 = 0.75
    ar5 randi ir243, ir244
    ar9 = (1.0 + ar5)
    ar5 = (7.0 * ar9)
    ar9 = (ar6 * ar5)
    ar5 vdelay ar8, ar9, 1.5e-2
    ar6 = (ar7 + ar5)
    ir251 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir254 = 1.0
    ir255 = 0.9
    ar5 gbuzz ir251, kr0, kr2, ir254, ir255, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar5 * ar7)
    ir259 = 1.0
    ir260 = 4.4
    ar5 oscil3 ir259, ir260, 4
    ar7 = (1.1e-3 * ar5)
    ir263 = 5.0e-2
    ir264 = 0.75
    ar5 randi ir263, ir264
    ar9 = (1.0 + ar5)
    ar5 = (7.0 * ar9)
    ar9 = (ar7 * ar5)
    ar5 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar6 + ar5)
    ar5 = (ar7 / 4.0)
    ir272 = 2800.0
    ir273 = 50.0
    ar6 reson ar5, ir272, ir273
    ar5 = (ar4 + ar6)
    ir276 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir279 = 1.0
    ir280 = 0.9
    ar4 gbuzz ir276, kr0, kr2, ir279, ir280, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar4 * ar6)
    ir284 = 1.0
    ir285 = 4.0
    ar4 oscil3 ir284, ir285, 4
    ar6 = (1.2e-3 * ar4)
    ir288 = 5.0e-2
    ir289 = 0.75
    ar4 randi ir288, ir289
    ar8 = (1.0 + ar4)
    ar4 = (7.0 * ar8)
    ar8 = (ar6 * ar4)
    ar4 vdelay ar7, ar8, 1.5e-2
    ir295 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir298 = 1.0
    ir299 = 0.9
    ar6 gbuzz ir295, kr0, kr2, ir298, ir299, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar6 * ar7)
    ir303 = 1.0
    ir304 = 5.0
    ar6 oscil3 ir303, ir304, 4
    ar7 = (9.0e-4 * ar6)
    ir307 = 5.0e-2
    ir308 = 0.75
    ar6 randi ir307, ir308
    ar9 = (1.0 + ar6)
    ar6 = (7.0 * ar9)
    ar9 = (ar7 * ar6)
    ar6 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar4 + ar6)
    ir315 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir318 = 1.0
    ir319 = 0.9
    ar4 gbuzz ir315, kr0, kr2, ir318, ir319, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar4 * ar6)
    ir323 = 1.0
    ir324 = 6.3
    ar4 oscil3 ir323, ir324, 4
    ar6 = (8.7e-4 * ar4)
    ir327 = 5.0e-2
    ir328 = 0.75
    ar4 randi ir327, ir328
    ar9 = (1.0 + ar4)
    ar4 = (7.0 * ar9)
    ar9 = (ar6 * ar4)
    ar4 vdelay ar8, ar9, 1.5e-2
    ar6 = (ar7 + ar4)
    ir335 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir338 = 1.0
    ir339 = 0.9
    ar4 gbuzz ir335, kr0, kr2, ir338, ir339, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar4 * ar7)
    ir343 = 1.0
    ir344 = 4.4
    ar4 oscil3 ir343, ir344, 4
    ar7 = (1.1e-3 * ar4)
    ir347 = 5.0e-2
    ir348 = 0.75
    ar4 randi ir347, ir348
    ar9 = (1.0 + ar4)
    ar4 = (7.0 * ar9)
    ar9 = (ar7 * ar4)
    ar4 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar6 + ar4)
    ar4 = (ar7 / 4.0)
    ir356 = 3650.0
    ir357 = 50.0
    ar6 reson ar4, ir356, ir357
    ar4 = (ar5 + ar6)
    ir360 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir363 = 1.0
    ir364 = 0.9
    ar5 gbuzz ir360, kr0, kr2, ir363, ir364, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar5 * ar6)
    ir368 = 1.0
    ir369 = 4.0
    ar5 oscil3 ir368, ir369, 4
    ar6 = (1.2e-3 * ar5)
    ir372 = 5.0e-2
    ir373 = 0.75
    ar5 randi ir372, ir373
    ar8 = (1.0 + ar5)
    ar5 = (7.0 * ar8)
    ar8 = (ar6 * ar5)
    ar5 vdelay ar7, ar8, 1.5e-2
    ir379 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir382 = 1.0
    ir383 = 0.9
    ar6 gbuzz ir379, kr0, kr2, ir382, ir383, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar6 * ar7)
    ir387 = 1.0
    ir388 = 5.0
    ar6 oscil3 ir387, ir388, 4
    ar7 = (9.0e-4 * ar6)
    ir391 = 5.0e-2
    ir392 = 0.75
    ar6 randi ir391, ir392
    ar9 = (1.0 + ar6)
    ar6 = (7.0 * ar9)
    ar9 = (ar7 * ar6)
    ar6 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar5 + ar6)
    ir399 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir402 = 1.0
    ir403 = 0.9
    ar5 gbuzz ir399, kr0, kr2, ir402, ir403, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar5 * ar6)
    ir407 = 1.0
    ir408 = 6.3
    ar5 oscil3 ir407, ir408, 4
    ar6 = (8.7e-4 * ar5)
    ir411 = 5.0e-2
    ir412 = 0.75
    ar5 randi ir411, ir412
    ar9 = (1.0 + ar5)
    ar5 = (7.0 * ar9)
    ar9 = (ar6 * ar5)
    ar5 vdelay ar8, ar9, 1.5e-2
    ar6 = (ar7 + ar5)
    ir419 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir422 = 1.0
    ir423 = 0.9
    ar5 gbuzz ir419, kr0, kr2, ir422, ir423, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar5 * ar7)
    ir427 = 1.0
    ir428 = 4.4
    ar5 oscil3 ir427, ir428, 4
    ar7 = (1.1e-3 * ar5)
    ir431 = 5.0e-2
    ir432 = 0.75
    ar5 randi ir431, ir432
    ar9 = (1.0 + ar5)
    ar5 = (7.0 * ar9)
    ar9 = (ar7 * ar5)
    ar5 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar6 + ar5)
    ar5 = (ar7 / 4.0)
    ir440 = 5000.0
    ir441 = 50.0
    ar6 reson ar5, ir440, ir441
    ar5 = (ar4 + ar6)
    ir444 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir447 = 1.0
    ir448 = 0.9
    ar4 gbuzz ir444, kr0, kr2, ir447, ir448, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar4 * ar6)
    ir452 = 1.0
    ir453 = 4.0
    ar4 oscil3 ir452, ir453, 4
    ar6 = (1.2e-3 * ar4)
    ir456 = 5.0e-2
    ir457 = 0.75
    ar4 randi ir456, ir457
    ar8 = (1.0 + ar4)
    ar4 = (7.0 * ar8)
    ar8 = (ar6 * ar4)
    ar4 vdelay ar7, ar8, 1.5e-2
    ir463 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir466 = 1.0
    ir467 = 0.9
    ar6 gbuzz ir463, kr0, kr2, ir466, ir467, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar6 * ar7)
    ir471 = 1.0
    ir472 = 5.0
    ar6 oscil3 ir471, ir472, 4
    ar7 = (9.0e-4 * ar6)
    ir475 = 5.0e-2
    ir476 = 0.75
    ar6 randi ir475, ir476
    ar9 = (1.0 + ar6)
    ar6 = (7.0 * ar9)
    ar9 = (ar7 * ar6)
    ar6 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar4 + ar6)
    ir483 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir486 = 1.0
    ir487 = 0.9
    ar4 gbuzz ir483, kr0, kr2, ir486, ir487, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar4 * ar6)
    ir491 = 1.0
    ir492 = 6.3
    ar4 oscil3 ir491, ir492, 4
    ar6 = (8.7e-4 * ar4)
    ir495 = 5.0e-2
    ir496 = 0.75
    ar4 randi ir495, ir496
    ar9 = (1.0 + ar4)
    ar4 = (7.0 * ar9)
    ar9 = (ar6 * ar4)
    ar4 vdelay ar8, ar9, 1.5e-2
    ar6 = (ar7 + ar4)
    ir503 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir506 = 1.0
    ir507 = 0.9
    ar4 gbuzz ir503, kr0, kr2, ir506, ir507, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar4 * ar7)
    ir511 = 1.0
    ir512 = 4.4
    ar4 oscil3 ir511, ir512, 4
    ar7 = (1.1e-3 * ar4)
    ir515 = 5.0e-2
    ir516 = 0.75
    ar4 randi ir515, ir516
    ar9 = (1.0 + ar4)
    ar4 = (7.0 * ar9)
    ar9 = (ar7 * ar4)
    ar4 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar6 + ar4)
    ar4 = (ar7 / 4.0)
    ar6 balance ar5, ar4
    kr1 = (p5 / 64.0)
    kr2 = (kr1 ^ 2.0)
    kr1 = (kr2 / 2.0)
    ar4 upsamp kr1
    ar5 = (ar6 * ar4)
    ar4 = (0.15 * ar5)
    arl0 = ar4
    ir532 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir535 = 1.0
    ir536 = 0.9
    ar4 gbuzz ir532, kr0, kr2, ir535, ir536, 2
    ar5 madsr 0.1, 0.0, 1.0, 0.1
    ar6 = (ar4 * ar5)
    ir540 = 1.0
    ir541 = 4.0
    ar4 oscil3 ir540, ir541, 4
    ar5 = (1.2e-3 * ar4)
    ir544 = 5.0e-2
    ir545 = 0.75
    ar4 randi ir544, ir545
    ar7 = (1.0 + ar4)
    ar4 = (7.0 * ar7)
    ar7 = (ar5 * ar4)
    ar4 vdelay ar6, ar7, 1.5e-2
    ir551 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir554 = 1.0
    ir555 = 0.9
    ar5 gbuzz ir551, kr0, kr2, ir554, ir555, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar5 * ar6)
    ir559 = 1.0
    ir560 = 5.0
    ar5 oscil3 ir559, ir560, 4
    ar6 = (9.0e-4 * ar5)
    ir563 = 5.0e-2
    ir564 = 0.75
    ar5 randi ir563, ir564
    ar8 = (1.0 + ar5)
    ar5 = (7.0 * ar8)
    ar8 = (ar6 * ar5)
    ar5 vdelay ar7, ar8, 1.5e-2
    ar6 = (ar4 + ar5)
    ir571 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir574 = 1.0
    ir575 = 0.9
    ar4 gbuzz ir571, kr0, kr2, ir574, ir575, 2
    ar5 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar4 * ar5)
    ir579 = 1.0
    ir580 = 6.3
    ar4 oscil3 ir579, ir580, 4
    ar5 = (8.7e-4 * ar4)
    ir583 = 5.0e-2
    ir584 = 0.75
    ar4 randi ir583, ir584
    ar8 = (1.0 + ar4)
    ar4 = (7.0 * ar8)
    ar8 = (ar5 * ar4)
    ar4 vdelay ar7, ar8, 1.5e-2
    ar5 = (ar6 + ar4)
    ir591 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir594 = 1.0
    ir595 = 0.9
    ar4 gbuzz ir591, kr0, kr2, ir594, ir595, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar4 * ar6)
    ir599 = 1.0
    ir600 = 4.4
    ar4 oscil3 ir599, ir600, 4
    ar6 = (1.1e-3 * ar4)
    ir603 = 5.0e-2
    ir604 = 0.75
    ar4 randi ir603, ir604
    ar8 = (1.0 + ar4)
    ar4 = (7.0 * ar8)
    ar8 = (ar6 * ar4)
    ar4 vdelay ar7, ar8, 1.5e-2
    ar6 = (ar5 + ar4)
    ar4 = (ar6 / 4.0)
    ir612 = 330.0
    ir613 = 50.0
    ar5 reson ar4, ir612, ir613
    ir615 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir618 = 1.0
    ir619 = 0.9
    ar4 gbuzz ir615, kr0, kr2, ir618, ir619, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar4 * ar6)
    ir623 = 1.0
    ir624 = 4.0
    ar4 oscil3 ir623, ir624, 4
    ar6 = (1.2e-3 * ar4)
    ir627 = 5.0e-2
    ir628 = 0.75
    ar4 randi ir627, ir628
    ar8 = (1.0 + ar4)
    ar4 = (7.0 * ar8)
    ar8 = (ar6 * ar4)
    ar4 vdelay ar7, ar8, 1.5e-2
    ir634 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir637 = 1.0
    ir638 = 0.9
    ar6 gbuzz ir634, kr0, kr2, ir637, ir638, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar6 * ar7)
    ir642 = 1.0
    ir643 = 5.0
    ar6 oscil3 ir642, ir643, 4
    ar7 = (9.0e-4 * ar6)
    ir646 = 5.0e-2
    ir647 = 0.75
    ar6 randi ir646, ir647
    ar9 = (1.0 + ar6)
    ar6 = (7.0 * ar9)
    ar9 = (ar7 * ar6)
    ar6 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar4 + ar6)
    ir654 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir657 = 1.0
    ir658 = 0.9
    ar4 gbuzz ir654, kr0, kr2, ir657, ir658, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar4 * ar6)
    ir662 = 1.0
    ir663 = 6.3
    ar4 oscil3 ir662, ir663, 4
    ar6 = (8.7e-4 * ar4)
    ir666 = 5.0e-2
    ir667 = 0.75
    ar4 randi ir666, ir667
    ar9 = (1.0 + ar4)
    ar4 = (7.0 * ar9)
    ar9 = (ar6 * ar4)
    ar4 vdelay ar8, ar9, 1.5e-2
    ar6 = (ar7 + ar4)
    ir674 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir677 = 1.0
    ir678 = 0.9
    ar4 gbuzz ir674, kr0, kr2, ir677, ir678, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar4 * ar7)
    ir682 = 1.0
    ir683 = 4.4
    ar4 oscil3 ir682, ir683, 4
    ar7 = (1.1e-3 * ar4)
    ir686 = 5.0e-2
    ir687 = 0.75
    ar4 randi ir686, ir687
    ar9 = (1.0 + ar4)
    ar4 = (7.0 * ar9)
    ar9 = (ar7 * ar4)
    ar4 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar6 + ar4)
    ar4 = (ar7 / 4.0)
    ir695 = 2000.0
    ir696 = 50.0
    ar6 reson ar4, ir695, ir696
    ar4 = (ar5 + ar6)
    ir699 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir702 = 1.0
    ir703 = 0.9
    ar5 gbuzz ir699, kr0, kr2, ir702, ir703, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar5 * ar6)
    ir707 = 1.0
    ir708 = 4.0
    ar5 oscil3 ir707, ir708, 4
    ar6 = (1.2e-3 * ar5)
    ir711 = 5.0e-2
    ir712 = 0.75
    ar5 randi ir711, ir712
    ar8 = (1.0 + ar5)
    ar5 = (7.0 * ar8)
    ar8 = (ar6 * ar5)
    ar5 vdelay ar7, ar8, 1.5e-2
    ir718 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir721 = 1.0
    ir722 = 0.9
    ar6 gbuzz ir718, kr0, kr2, ir721, ir722, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar6 * ar7)
    ir726 = 1.0
    ir727 = 5.0
    ar6 oscil3 ir726, ir727, 4
    ar7 = (9.0e-4 * ar6)
    ir730 = 5.0e-2
    ir731 = 0.75
    ar6 randi ir730, ir731
    ar9 = (1.0 + ar6)
    ar6 = (7.0 * ar9)
    ar9 = (ar7 * ar6)
    ar6 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar5 + ar6)
    ir738 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir741 = 1.0
    ir742 = 0.9
    ar5 gbuzz ir738, kr0, kr2, ir741, ir742, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar5 * ar6)
    ir746 = 1.0
    ir747 = 6.3
    ar5 oscil3 ir746, ir747, 4
    ar6 = (8.7e-4 * ar5)
    ir750 = 5.0e-2
    ir751 = 0.75
    ar5 randi ir750, ir751
    ar9 = (1.0 + ar5)
    ar5 = (7.0 * ar9)
    ar9 = (ar6 * ar5)
    ar5 vdelay ar8, ar9, 1.5e-2
    ar6 = (ar7 + ar5)
    ir758 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir761 = 1.0
    ir762 = 0.9
    ar5 gbuzz ir758, kr0, kr2, ir761, ir762, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar5 * ar7)
    ir766 = 1.0
    ir767 = 4.4
    ar5 oscil3 ir766, ir767, 4
    ar7 = (1.1e-3 * ar5)
    ir770 = 5.0e-2
    ir771 = 0.75
    ar5 randi ir770, ir771
    ar9 = (1.0 + ar5)
    ar5 = (7.0 * ar9)
    ar9 = (ar7 * ar5)
    ar5 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar6 + ar5)
    ar5 = (ar7 / 4.0)
    ir779 = 2800.0
    ir780 = 50.0
    ar6 reson ar5, ir779, ir780
    ar5 = (ar4 + ar6)
    ir783 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir786 = 1.0
    ir787 = 0.9
    ar4 gbuzz ir783, kr0, kr2, ir786, ir787, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar4 * ar6)
    ir791 = 1.0
    ir792 = 4.0
    ar4 oscil3 ir791, ir792, 4
    ar6 = (1.2e-3 * ar4)
    ir795 = 5.0e-2
    ir796 = 0.75
    ar4 randi ir795, ir796
    ar8 = (1.0 + ar4)
    ar4 = (7.0 * ar8)
    ar8 = (ar6 * ar4)
    ar4 vdelay ar7, ar8, 1.5e-2
    ir802 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir805 = 1.0
    ir806 = 0.9
    ar6 gbuzz ir802, kr0, kr2, ir805, ir806, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar6 * ar7)
    ir810 = 1.0
    ir811 = 5.0
    ar6 oscil3 ir810, ir811, 4
    ar7 = (9.0e-4 * ar6)
    ir814 = 5.0e-2
    ir815 = 0.75
    ar6 randi ir814, ir815
    ar9 = (1.0 + ar6)
    ar6 = (7.0 * ar9)
    ar9 = (ar7 * ar6)
    ar6 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar4 + ar6)
    ir822 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir825 = 1.0
    ir826 = 0.9
    ar4 gbuzz ir822, kr0, kr2, ir825, ir826, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar4 * ar6)
    ir830 = 1.0
    ir831 = 6.3
    ar4 oscil3 ir830, ir831, 4
    ar6 = (8.7e-4 * ar4)
    ir834 = 5.0e-2
    ir835 = 0.75
    ar4 randi ir834, ir835
    ar9 = (1.0 + ar4)
    ar4 = (7.0 * ar9)
    ar9 = (ar6 * ar4)
    ar4 vdelay ar8, ar9, 1.5e-2
    ar6 = (ar7 + ar4)
    ir842 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir845 = 1.0
    ir846 = 0.9
    ar4 gbuzz ir842, kr0, kr2, ir845, ir846, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar4 * ar7)
    ir850 = 1.0
    ir851 = 4.4
    ar4 oscil3 ir850, ir851, 4
    ar7 = (1.1e-3 * ar4)
    ir854 = 5.0e-2
    ir855 = 0.75
    ar4 randi ir854, ir855
    ar9 = (1.0 + ar4)
    ar4 = (7.0 * ar9)
    ar9 = (ar7 * ar4)
    ar4 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar6 + ar4)
    ar4 = (ar7 / 4.0)
    ir863 = 3650.0
    ir864 = 50.0
    ar6 reson ar4, ir863, ir864
    ar4 = (ar5 + ar6)
    ir867 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir870 = 1.0
    ir871 = 0.9
    ar5 gbuzz ir867, kr0, kr2, ir870, ir871, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar5 * ar6)
    ir875 = 1.0
    ir876 = 4.0
    ar5 oscil3 ir875, ir876, 4
    ar6 = (1.2e-3 * ar5)
    ir879 = 5.0e-2
    ir880 = 0.75
    ar5 randi ir879, ir880
    ar8 = (1.0 + ar5)
    ar5 = (7.0 * ar8)
    ar8 = (ar6 * ar5)
    ar5 vdelay ar7, ar8, 1.5e-2
    ir886 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir889 = 1.0
    ir890 = 0.9
    ar6 gbuzz ir886, kr0, kr2, ir889, ir890, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar6 * ar7)
    ir894 = 1.0
    ir895 = 5.0
    ar6 oscil3 ir894, ir895, 4
    ar7 = (9.0e-4 * ar6)
    ir898 = 5.0e-2
    ir899 = 0.75
    ar6 randi ir898, ir899
    ar9 = (1.0 + ar6)
    ar6 = (7.0 * ar9)
    ar9 = (ar7 * ar6)
    ar6 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar5 + ar6)
    ir906 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir909 = 1.0
    ir910 = 0.9
    ar5 gbuzz ir906, kr0, kr2, ir909, ir910, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar5 * ar6)
    ir914 = 1.0
    ir915 = 6.3
    ar5 oscil3 ir914, ir915, 4
    ar6 = (8.7e-4 * ar5)
    ir918 = 5.0e-2
    ir919 = 0.75
    ar5 randi ir918, ir919
    ar9 = (1.0 + ar5)
    ar5 = (7.0 * ar9)
    ar9 = (ar6 * ar5)
    ar5 vdelay ar8, ar9, 1.5e-2
    ar6 = (ar7 + ar5)
    ir926 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir929 = 1.0
    ir930 = 0.9
    ar5 gbuzz ir926, kr0, kr2, ir929, ir930, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar5 * ar7)
    ir934 = 1.0
    ir935 = 4.4
    ar5 oscil3 ir934, ir935, 4
    ar7 = (1.1e-3 * ar5)
    ir938 = 5.0e-2
    ir939 = 0.75
    ar5 randi ir938, ir939
    ar9 = (1.0 + ar5)
    ar5 = (7.0 * ar9)
    ar9 = (ar7 * ar5)
    ar5 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar6 + ar5)
    ar5 = (ar7 / 4.0)
    ir947 = 5000.0
    ir948 = 50.0
    ar6 reson ar5, ir947, ir948
    ar5 = (ar4 + ar6)
    ir951 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir954 = 1.0
    ir955 = 0.9
    ar4 gbuzz ir951, kr0, kr2, ir954, ir955, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar7 = (ar4 * ar6)
    ir959 = 1.0
    ir960 = 4.0
    ar4 oscil3 ir959, ir960, 4
    ar6 = (1.2e-3 * ar4)
    ir963 = 5.0e-2
    ir964 = 0.75
    ar4 randi ir963, ir964
    ar8 = (1.0 + ar4)
    ar4 = (7.0 * ar8)
    ar8 = (ar6 * ar4)
    ar4 vdelay ar7, ar8, 1.5e-2
    ir970 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir973 = 1.0
    ir974 = 0.9
    ar6 gbuzz ir970, kr0, kr2, ir973, ir974, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar6 * ar7)
    ir978 = 1.0
    ir979 = 5.0
    ar6 oscil3 ir978, ir979, 4
    ar7 = (9.0e-4 * ar6)
    ir982 = 5.0e-2
    ir983 = 0.75
    ar6 randi ir982, ir983
    ar9 = (1.0 + ar6)
    ar6 = (7.0 * ar9)
    ar9 = (ar7 * ar6)
    ar6 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar4 + ar6)
    ir990 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir993 = 1.0
    ir994 = 0.9
    ar4 gbuzz ir990, kr0, kr2, ir993, ir994, 2
    ar6 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar4 * ar6)
    ir998 = 1.0
    ir999 = 6.3
    ar4 oscil3 ir998, ir999, 4
    ar6 = (8.7e-4 * ar4)
    ir1002 = 5.0e-2
    ir1003 = 0.75
    ar4 randi ir1002, ir1003
    ar9 = (1.0 + ar4)
    ar4 = (7.0 * ar9)
    ar9 = (ar6 * ar4)
    ar4 vdelay ar8, ar9, 1.5e-2
    ar6 = (ar7 + ar4)
    ir1010 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1013 = 1.0
    ir1014 = 0.9
    ar4 gbuzz ir1010, kr0, kr2, ir1013, ir1014, 2
    ar7 madsr 0.1, 0.0, 1.0, 0.1
    ar8 = (ar4 * ar7)
    ir1018 = 1.0
    ir1019 = 4.4
    ar4 oscil3 ir1018, ir1019, 4
    ar7 = (1.1e-3 * ar4)
    ir1022 = 5.0e-2
    ir1023 = 0.75
    ar4 randi ir1022, ir1023
    ar9 = (1.0 + ar4)
    ar4 = (7.0 * ar9)
    ar9 = (ar7 * ar4)
    ar4 vdelay ar8, ar9, 1.5e-2
    ar7 = (ar6 + ar4)
    ar4 = (ar7 / 4.0)
    ar6 balance ar5, ar4
    kr1 = (p5 / 64.0)
    kr2 = (kr1 ^ 2.0)
    kr1 = (kr2 / 2.0)
    ar4 upsamp kr1
    ar5 = (ar6 * ar4)
    ar4 = (0.15 * ar5)
    arl1 = ar4
endif
if (kr0 > 220.0) then
    ir1043 = 5.0e-2
    ir1044 = 0.75
    ar4 randi ir1043, ir1044
    ir1047 = 5.0e-2
    ir1048 = 0.75
    ar5 randi ir1047, ir1048
    ir1051 = 5.0e-2
    ir1052 = 0.75
    ar6 randi ir1051, ir1052
    ir1055 = 5.0e-2
    ir1056 = 0.75
    ar7 randi ir1055, ir1056
    ir1059 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1062 = 1.0
    ir1063 = 0.8
    ar8 gbuzz ir1059, kr0, kr2, ir1062, ir1063, 2
    ar9 madsr 0.1, 0.0, 1.0, 0.1
    ar10 = (ar8 * ar9)
    ir1067 = 1.0
    ir1068 = 4.0
    ar8 oscil3 ir1067, ir1068, 4
    ar9 = (1.2e-3 * ar8)
    ir1071 = 5.0e-2
    ir1072 = 0.75
    ar8 randi ir1071, ir1072
    ar11 = (1.0 + ar8)
    ar8 = (7.0 * ar11)
    ar11 = (ar9 * ar8)
    ar8 vdelay ar10, ar11, 1.5e-2
    ir1078 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1081 = 1.0
    ir1082 = 0.8
    ar9 gbuzz ir1078, kr0, kr2, ir1081, ir1082, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar9 * ar10)
    ir1086 = 1.0
    ir1087 = 5.0
    ar9 oscil3 ir1086, ir1087, 4
    ar10 = (9.0e-4 * ar9)
    ir1090 = 5.0e-2
    ir1091 = 0.75
    ar9 randi ir1090, ir1091
    ar12 = (1.0 + ar9)
    ar9 = (7.0 * ar12)
    ar12 = (ar10 * ar9)
    ar9 vdelay ar11, ar12, 1.5e-2
    ar10 = (ar8 + ar9)
    ir1098 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1101 = 1.0
    ir1102 = 0.8
    ar8 gbuzz ir1098, kr0, kr2, ir1101, ir1102, 2
    ar9 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar8 * ar9)
    ir1106 = 1.0
    ir1107 = 6.3
    ar8 oscil3 ir1106, ir1107, 4
    ar9 = (8.7e-4 * ar8)
    ir1110 = 5.0e-2
    ir1111 = 0.75
    ar8 randi ir1110, ir1111
    ar12 = (1.0 + ar8)
    ar8 = (7.0 * ar12)
    ar12 = (ar9 * ar8)
    ar8 vdelay ar11, ar12, 1.5e-2
    ar9 = (ar10 + ar8)
    ir1118 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1121 = 1.0
    ir1122 = 0.8
    ar8 gbuzz ir1118, kr0, kr2, ir1121, ir1122, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar8 * ar10)
    ir1126 = 1.0
    ir1127 = 4.4
    ar8 oscil3 ir1126, ir1127, 4
    ar10 = (1.1e-3 * ar8)
    ir1130 = 5.0e-2
    ir1131 = 0.75
    ar8 randi ir1130, ir1131
    ar12 = (1.0 + ar8)
    ar8 = (7.0 * ar12)
    ar12 = (ar10 * ar8)
    ar8 vdelay ar11, ar12, 1.5e-2
    ar10 = (ar9 + ar8)
    ar8 = (ar10 / 4.0)
    ir1139 = 330.0
    ir1140 = 50.0
    ar9 reson ar8, ir1139, ir1140
    ir1142 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1145 = 1.0
    ir1146 = 0.8
    ar8 gbuzz ir1142, kr0, kr2, ir1145, ir1146, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar8 * ar10)
    ir1150 = 1.0
    ir1151 = 4.0
    ar8 oscil3 ir1150, ir1151, 4
    ar10 = (1.2e-3 * ar8)
    ir1154 = 5.0e-2
    ir1155 = 0.75
    ar8 randi ir1154, ir1155
    ar12 = (1.0 + ar8)
    ar8 = (7.0 * ar12)
    ar12 = (ar10 * ar8)
    ar8 vdelay ar11, ar12, 1.5e-2
    ir1161 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1164 = 1.0
    ir1165 = 0.8
    ar10 gbuzz ir1161, kr0, kr2, ir1164, ir1165, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar10 * ar11)
    ir1169 = 1.0
    ir1170 = 5.0
    ar10 oscil3 ir1169, ir1170, 4
    ar11 = (9.0e-4 * ar10)
    ir1173 = 5.0e-2
    ir1174 = 0.75
    ar10 randi ir1173, ir1174
    ar13 = (1.0 + ar10)
    ar10 = (7.0 * ar13)
    ar13 = (ar11 * ar10)
    ar10 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar8 + ar10)
    ir1181 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1184 = 1.0
    ir1185 = 0.8
    ar8 gbuzz ir1181, kr0, kr2, ir1184, ir1185, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar8 * ar10)
    ir1189 = 1.0
    ir1190 = 6.3
    ar8 oscil3 ir1189, ir1190, 4
    ar10 = (8.7e-4 * ar8)
    ir1193 = 5.0e-2
    ir1194 = 0.75
    ar8 randi ir1193, ir1194
    ar13 = (1.0 + ar8)
    ar8 = (7.0 * ar13)
    ar13 = (ar10 * ar8)
    ar8 vdelay ar12, ar13, 1.5e-2
    ar10 = (ar11 + ar8)
    ir1201 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1204 = 1.0
    ir1205 = 0.8
    ar8 gbuzz ir1201, kr0, kr2, ir1204, ir1205, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar8 * ar11)
    ir1209 = 1.0
    ir1210 = 4.4
    ar8 oscil3 ir1209, ir1210, 4
    ar11 = (1.1e-3 * ar8)
    ir1213 = 5.0e-2
    ir1214 = 0.75
    ar8 randi ir1213, ir1214
    ar13 = (1.0 + ar8)
    ar8 = (7.0 * ar13)
    ar13 = (ar11 * ar8)
    ar8 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar10 + ar8)
    ar8 = (ar11 / 4.0)
    ir1222 = 2000.0
    ir1223 = 50.0
    ar10 reson ar8, ir1222, ir1223
    ar8 = (ar9 + ar10)
    ir1226 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1229 = 1.0
    ir1230 = 0.8
    ar9 gbuzz ir1226, kr0, kr2, ir1229, ir1230, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar9 * ar10)
    ir1234 = 1.0
    ir1235 = 4.0
    ar9 oscil3 ir1234, ir1235, 4
    ar10 = (1.2e-3 * ar9)
    ir1238 = 5.0e-2
    ir1239 = 0.75
    ar9 randi ir1238, ir1239
    ar12 = (1.0 + ar9)
    ar9 = (7.0 * ar12)
    ar12 = (ar10 * ar9)
    ar9 vdelay ar11, ar12, 1.5e-2
    ir1245 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1248 = 1.0
    ir1249 = 0.8
    ar10 gbuzz ir1245, kr0, kr2, ir1248, ir1249, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar10 * ar11)
    ir1253 = 1.0
    ir1254 = 5.0
    ar10 oscil3 ir1253, ir1254, 4
    ar11 = (9.0e-4 * ar10)
    ir1257 = 5.0e-2
    ir1258 = 0.75
    ar10 randi ir1257, ir1258
    ar13 = (1.0 + ar10)
    ar10 = (7.0 * ar13)
    ar13 = (ar11 * ar10)
    ar10 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar9 + ar10)
    ir1265 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1268 = 1.0
    ir1269 = 0.8
    ar9 gbuzz ir1265, kr0, kr2, ir1268, ir1269, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar9 * ar10)
    ir1273 = 1.0
    ir1274 = 6.3
    ar9 oscil3 ir1273, ir1274, 4
    ar10 = (8.7e-4 * ar9)
    ir1277 = 5.0e-2
    ir1278 = 0.75
    ar9 randi ir1277, ir1278
    ar13 = (1.0 + ar9)
    ar9 = (7.0 * ar13)
    ar13 = (ar10 * ar9)
    ar9 vdelay ar12, ar13, 1.5e-2
    ar10 = (ar11 + ar9)
    ir1285 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1288 = 1.0
    ir1289 = 0.8
    ar9 gbuzz ir1285, kr0, kr2, ir1288, ir1289, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar9 * ar11)
    ir1293 = 1.0
    ir1294 = 4.4
    ar9 oscil3 ir1293, ir1294, 4
    ar11 = (1.1e-3 * ar9)
    ir1297 = 5.0e-2
    ir1298 = 0.75
    ar9 randi ir1297, ir1298
    ar13 = (1.0 + ar9)
    ar9 = (7.0 * ar13)
    ar13 = (ar11 * ar9)
    ar9 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar10 + ar9)
    ar9 = (ar11 / 4.0)
    ir1306 = 2800.0
    ir1307 = 50.0
    ar10 reson ar9, ir1306, ir1307
    ar9 = (ar8 + ar10)
    ir1310 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1313 = 1.0
    ir1314 = 0.8
    ar8 gbuzz ir1310, kr0, kr2, ir1313, ir1314, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar8 * ar10)
    ir1318 = 1.0
    ir1319 = 4.0
    ar8 oscil3 ir1318, ir1319, 4
    ar10 = (1.2e-3 * ar8)
    ir1322 = 5.0e-2
    ir1323 = 0.75
    ar8 randi ir1322, ir1323
    ar12 = (1.0 + ar8)
    ar8 = (7.0 * ar12)
    ar12 = (ar10 * ar8)
    ar8 vdelay ar11, ar12, 1.5e-2
    ir1329 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1332 = 1.0
    ir1333 = 0.8
    ar10 gbuzz ir1329, kr0, kr2, ir1332, ir1333, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar10 * ar11)
    ir1337 = 1.0
    ir1338 = 5.0
    ar10 oscil3 ir1337, ir1338, 4
    ar11 = (9.0e-4 * ar10)
    ir1341 = 5.0e-2
    ir1342 = 0.75
    ar10 randi ir1341, ir1342
    ar13 = (1.0 + ar10)
    ar10 = (7.0 * ar13)
    ar13 = (ar11 * ar10)
    ar10 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar8 + ar10)
    ir1349 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1352 = 1.0
    ir1353 = 0.8
    ar8 gbuzz ir1349, kr0, kr2, ir1352, ir1353, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar8 * ar10)
    ir1357 = 1.0
    ir1358 = 6.3
    ar8 oscil3 ir1357, ir1358, 4
    ar10 = (8.7e-4 * ar8)
    ir1361 = 5.0e-2
    ir1362 = 0.75
    ar8 randi ir1361, ir1362
    ar13 = (1.0 + ar8)
    ar8 = (7.0 * ar13)
    ar13 = (ar10 * ar8)
    ar8 vdelay ar12, ar13, 1.5e-2
    ar10 = (ar11 + ar8)
    ir1369 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1372 = 1.0
    ir1373 = 0.8
    ar8 gbuzz ir1369, kr0, kr2, ir1372, ir1373, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar8 * ar11)
    ir1377 = 1.0
    ir1378 = 4.4
    ar8 oscil3 ir1377, ir1378, 4
    ar11 = (1.1e-3 * ar8)
    ir1381 = 5.0e-2
    ir1382 = 0.75
    ar8 randi ir1381, ir1382
    ar13 = (1.0 + ar8)
    ar8 = (7.0 * ar13)
    ar13 = (ar11 * ar8)
    ar8 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar10 + ar8)
    ar8 = (ar11 / 4.0)
    ir1390 = 3650.0
    ir1391 = 50.0
    ar10 reson ar8, ir1390, ir1391
    ar8 = (ar9 + ar10)
    ir1394 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1397 = 1.0
    ir1398 = 0.8
    ar9 gbuzz ir1394, kr0, kr2, ir1397, ir1398, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar9 * ar10)
    ir1402 = 1.0
    ir1403 = 4.0
    ar9 oscil3 ir1402, ir1403, 4
    ar10 = (1.2e-3 * ar9)
    ir1406 = 5.0e-2
    ir1407 = 0.75
    ar9 randi ir1406, ir1407
    ar12 = (1.0 + ar9)
    ar9 = (7.0 * ar12)
    ar12 = (ar10 * ar9)
    ar9 vdelay ar11, ar12, 1.5e-2
    ir1413 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1416 = 1.0
    ir1417 = 0.8
    ar10 gbuzz ir1413, kr0, kr2, ir1416, ir1417, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar10 * ar11)
    ir1421 = 1.0
    ir1422 = 5.0
    ar10 oscil3 ir1421, ir1422, 4
    ar11 = (9.0e-4 * ar10)
    ir1425 = 5.0e-2
    ir1426 = 0.75
    ar10 randi ir1425, ir1426
    ar13 = (1.0 + ar10)
    ar10 = (7.0 * ar13)
    ar13 = (ar11 * ar10)
    ar10 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar9 + ar10)
    ir1433 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1436 = 1.0
    ir1437 = 0.8
    ar9 gbuzz ir1433, kr0, kr2, ir1436, ir1437, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar9 * ar10)
    ir1441 = 1.0
    ir1442 = 6.3
    ar9 oscil3 ir1441, ir1442, 4
    ar10 = (8.7e-4 * ar9)
    ir1445 = 5.0e-2
    ir1446 = 0.75
    ar9 randi ir1445, ir1446
    ar13 = (1.0 + ar9)
    ar9 = (7.0 * ar13)
    ar13 = (ar10 * ar9)
    ar9 vdelay ar12, ar13, 1.5e-2
    ar10 = (ar11 + ar9)
    ir1453 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1456 = 1.0
    ir1457 = 0.8
    ar9 gbuzz ir1453, kr0, kr2, ir1456, ir1457, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar9 * ar11)
    ir1461 = 1.0
    ir1462 = 4.4
    ar9 oscil3 ir1461, ir1462, 4
    ar11 = (1.1e-3 * ar9)
    ir1465 = 5.0e-2
    ir1466 = 0.75
    ar9 randi ir1465, ir1466
    ar13 = (1.0 + ar9)
    ar9 = (7.0 * ar13)
    ar13 = (ar11 * ar9)
    ar9 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar10 + ar9)
    ar9 = (ar11 / 4.0)
    ir1474 = 5000.0
    ir1475 = 50.0
    ar10 reson ar9, ir1474, ir1475
    ar9 = (ar8 + ar10)
    ir1478 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1481 = 1.0
    ir1482 = 0.8
    ar8 gbuzz ir1478, kr0, kr2, ir1481, ir1482, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar8 * ar10)
    ir1486 = 1.0
    ir1487 = 4.0
    ar8 oscil3 ir1486, ir1487, 4
    ar10 = (1.2e-3 * ar8)
    ir1490 = 5.0e-2
    ir1491 = 0.75
    ar8 randi ir1490, ir1491
    ar12 = (1.0 + ar8)
    ar8 = (7.0 * ar12)
    ar12 = (ar10 * ar8)
    ar8 vdelay ar11, ar12, 1.5e-2
    ir1497 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1500 = 1.0
    ir1501 = 0.8
    ar10 gbuzz ir1497, kr0, kr2, ir1500, ir1501, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar10 * ar11)
    ir1505 = 1.0
    ir1506 = 5.0
    ar10 oscil3 ir1505, ir1506, 4
    ar11 = (9.0e-4 * ar10)
    ir1509 = 5.0e-2
    ir1510 = 0.75
    ar10 randi ir1509, ir1510
    ar13 = (1.0 + ar10)
    ar10 = (7.0 * ar13)
    ar13 = (ar11 * ar10)
    ar10 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar8 + ar10)
    ir1517 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1520 = 1.0
    ir1521 = 0.8
    ar8 gbuzz ir1517, kr0, kr2, ir1520, ir1521, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar8 * ar10)
    ir1525 = 1.0
    ir1526 = 6.3
    ar8 oscil3 ir1525, ir1526, 4
    ar10 = (8.7e-4 * ar8)
    ir1529 = 5.0e-2
    ir1530 = 0.75
    ar8 randi ir1529, ir1530
    ar13 = (1.0 + ar8)
    ar8 = (7.0 * ar13)
    ar13 = (ar10 * ar8)
    ar8 vdelay ar12, ar13, 1.5e-2
    ar10 = (ar11 + ar8)
    ir1537 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1540 = 1.0
    ir1541 = 0.8
    ar8 gbuzz ir1537, kr0, kr2, ir1540, ir1541, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar8 * ar11)
    ir1545 = 1.0
    ir1546 = 4.4
    ar8 oscil3 ir1545, ir1546, 4
    ar11 = (1.1e-3 * ar8)
    ir1549 = 5.0e-2
    ir1550 = 0.75
    ar8 randi ir1549, ir1550
    ar13 = (1.0 + ar8)
    ar8 = (7.0 * ar13)
    ar13 = (ar11 * ar8)
    ar8 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar10 + ar8)
    ar8 = (ar11 / 4.0)
    ar10 balance ar9, ar8
    kr1 = (p5 / 64.0)
    kr2 = (kr1 ^ 2.0)
    kr1 = (kr2 / 2.0)
    ar8 upsamp kr1
    ar9 = (ar10 * ar8)
    ar8 = (0.15 * ar9)
    arl0 = ar8
    ir1566 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1569 = 1.0
    ir1570 = 0.8
    ar8 gbuzz ir1566, kr0, kr2, ir1569, ir1570, 2
    ar9 madsr 0.1, 0.0, 1.0, 0.1
    ar10 = (ar8 * ar9)
    ir1574 = 1.0
    ir1575 = 4.0
    ar8 oscil3 ir1574, ir1575, 4
    ar9 = (1.2e-3 * ar8)
    ir1578 = 5.0e-2
    ir1579 = 0.75
    ar8 randi ir1578, ir1579
    ar11 = (1.0 + ar8)
    ar8 = (7.0 * ar11)
    ar11 = (ar9 * ar8)
    ar8 vdelay ar10, ar11, 1.5e-2
    ir1585 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1588 = 1.0
    ir1589 = 0.8
    ar9 gbuzz ir1585, kr0, kr2, ir1588, ir1589, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar9 * ar10)
    ir1593 = 1.0
    ir1594 = 5.0
    ar9 oscil3 ir1593, ir1594, 4
    ar10 = (9.0e-4 * ar9)
    ir1597 = 5.0e-2
    ir1598 = 0.75
    ar9 randi ir1597, ir1598
    ar12 = (1.0 + ar9)
    ar9 = (7.0 * ar12)
    ar12 = (ar10 * ar9)
    ar9 vdelay ar11, ar12, 1.5e-2
    ar10 = (ar8 + ar9)
    ir1605 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1608 = 1.0
    ir1609 = 0.8
    ar8 gbuzz ir1605, kr0, kr2, ir1608, ir1609, 2
    ar9 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar8 * ar9)
    ir1613 = 1.0
    ir1614 = 6.3
    ar8 oscil3 ir1613, ir1614, 4
    ar9 = (8.7e-4 * ar8)
    ir1617 = 5.0e-2
    ir1618 = 0.75
    ar8 randi ir1617, ir1618
    ar12 = (1.0 + ar8)
    ar8 = (7.0 * ar12)
    ar12 = (ar9 * ar8)
    ar8 vdelay ar11, ar12, 1.5e-2
    ar9 = (ar10 + ar8)
    ir1625 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1628 = 1.0
    ir1629 = 0.8
    ar8 gbuzz ir1625, kr0, kr2, ir1628, ir1629, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar8 * ar10)
    ir1633 = 1.0
    ir1634 = 4.4
    ar8 oscil3 ir1633, ir1634, 4
    ar10 = (1.1e-3 * ar8)
    ir1637 = 5.0e-2
    ir1638 = 0.75
    ar8 randi ir1637, ir1638
    ar12 = (1.0 + ar8)
    ar8 = (7.0 * ar12)
    ar12 = (ar10 * ar8)
    ar8 vdelay ar11, ar12, 1.5e-2
    ar10 = (ar9 + ar8)
    ar8 = (ar10 / 4.0)
    ir1646 = 330.0
    ir1647 = 50.0
    ar9 reson ar8, ir1646, ir1647
    ir1649 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1652 = 1.0
    ir1653 = 0.8
    ar8 gbuzz ir1649, kr0, kr2, ir1652, ir1653, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar8 * ar10)
    ir1657 = 1.0
    ir1658 = 4.0
    ar8 oscil3 ir1657, ir1658, 4
    ar10 = (1.2e-3 * ar8)
    ir1661 = 5.0e-2
    ir1662 = 0.75
    ar8 randi ir1661, ir1662
    ar12 = (1.0 + ar8)
    ar8 = (7.0 * ar12)
    ar12 = (ar10 * ar8)
    ar8 vdelay ar11, ar12, 1.5e-2
    ir1668 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1671 = 1.0
    ir1672 = 0.8
    ar10 gbuzz ir1668, kr0, kr2, ir1671, ir1672, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar10 * ar11)
    ir1676 = 1.0
    ir1677 = 5.0
    ar10 oscil3 ir1676, ir1677, 4
    ar11 = (9.0e-4 * ar10)
    ir1680 = 5.0e-2
    ir1681 = 0.75
    ar10 randi ir1680, ir1681
    ar13 = (1.0 + ar10)
    ar10 = (7.0 * ar13)
    ar13 = (ar11 * ar10)
    ar10 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar8 + ar10)
    ir1688 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1691 = 1.0
    ir1692 = 0.8
    ar8 gbuzz ir1688, kr0, kr2, ir1691, ir1692, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar8 * ar10)
    ir1696 = 1.0
    ir1697 = 6.3
    ar8 oscil3 ir1696, ir1697, 4
    ar10 = (8.7e-4 * ar8)
    ir1700 = 5.0e-2
    ir1701 = 0.75
    ar8 randi ir1700, ir1701
    ar13 = (1.0 + ar8)
    ar8 = (7.0 * ar13)
    ar13 = (ar10 * ar8)
    ar8 vdelay ar12, ar13, 1.5e-2
    ar10 = (ar11 + ar8)
    ir1708 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1711 = 1.0
    ir1712 = 0.8
    ar8 gbuzz ir1708, kr0, kr2, ir1711, ir1712, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar8 * ar11)
    ir1716 = 1.0
    ir1717 = 4.4
    ar8 oscil3 ir1716, ir1717, 4
    ar11 = (1.1e-3 * ar8)
    ir1720 = 5.0e-2
    ir1721 = 0.75
    ar8 randi ir1720, ir1721
    ar13 = (1.0 + ar8)
    ar8 = (7.0 * ar13)
    ar13 = (ar11 * ar8)
    ar8 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar10 + ar8)
    ar8 = (ar11 / 4.0)
    ir1729 = 2000.0
    ir1730 = 50.0
    ar10 reson ar8, ir1729, ir1730
    ar8 = (ar9 + ar10)
    ir1733 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1736 = 1.0
    ir1737 = 0.8
    ar9 gbuzz ir1733, kr0, kr2, ir1736, ir1737, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar9 * ar10)
    ir1741 = 1.0
    ir1742 = 4.0
    ar9 oscil3 ir1741, ir1742, 4
    ar10 = (1.2e-3 * ar9)
    ir1745 = 5.0e-2
    ir1746 = 0.75
    ar9 randi ir1745, ir1746
    ar12 = (1.0 + ar9)
    ar9 = (7.0 * ar12)
    ar12 = (ar10 * ar9)
    ar9 vdelay ar11, ar12, 1.5e-2
    ir1752 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1755 = 1.0
    ir1756 = 0.8
    ar10 gbuzz ir1752, kr0, kr2, ir1755, ir1756, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar10 * ar11)
    ir1760 = 1.0
    ir1761 = 5.0
    ar10 oscil3 ir1760, ir1761, 4
    ar11 = (9.0e-4 * ar10)
    ir1764 = 5.0e-2
    ir1765 = 0.75
    ar10 randi ir1764, ir1765
    ar13 = (1.0 + ar10)
    ar10 = (7.0 * ar13)
    ar13 = (ar11 * ar10)
    ar10 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar9 + ar10)
    ir1772 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1775 = 1.0
    ir1776 = 0.8
    ar9 gbuzz ir1772, kr0, kr2, ir1775, ir1776, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar9 * ar10)
    ir1780 = 1.0
    ir1781 = 6.3
    ar9 oscil3 ir1780, ir1781, 4
    ar10 = (8.7e-4 * ar9)
    ir1784 = 5.0e-2
    ir1785 = 0.75
    ar9 randi ir1784, ir1785
    ar13 = (1.0 + ar9)
    ar9 = (7.0 * ar13)
    ar13 = (ar10 * ar9)
    ar9 vdelay ar12, ar13, 1.5e-2
    ar10 = (ar11 + ar9)
    ir1792 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1795 = 1.0
    ir1796 = 0.8
    ar9 gbuzz ir1792, kr0, kr2, ir1795, ir1796, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar9 * ar11)
    ir1800 = 1.0
    ir1801 = 4.4
    ar9 oscil3 ir1800, ir1801, 4
    ar11 = (1.1e-3 * ar9)
    ir1804 = 5.0e-2
    ir1805 = 0.75
    ar9 randi ir1804, ir1805
    ar13 = (1.0 + ar9)
    ar9 = (7.0 * ar13)
    ar13 = (ar11 * ar9)
    ar9 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar10 + ar9)
    ar9 = (ar11 / 4.0)
    ir1813 = 2800.0
    ir1814 = 50.0
    ar10 reson ar9, ir1813, ir1814
    ar9 = (ar8 + ar10)
    ir1817 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1820 = 1.0
    ir1821 = 0.8
    ar8 gbuzz ir1817, kr0, kr2, ir1820, ir1821, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar8 * ar10)
    ir1825 = 1.0
    ir1826 = 4.0
    ar8 oscil3 ir1825, ir1826, 4
    ar10 = (1.2e-3 * ar8)
    ir1829 = 5.0e-2
    ir1830 = 0.75
    ar8 randi ir1829, ir1830
    ar12 = (1.0 + ar8)
    ar8 = (7.0 * ar12)
    ar12 = (ar10 * ar8)
    ar8 vdelay ar11, ar12, 1.5e-2
    ir1836 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1839 = 1.0
    ir1840 = 0.8
    ar10 gbuzz ir1836, kr0, kr2, ir1839, ir1840, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar10 * ar11)
    ir1844 = 1.0
    ir1845 = 5.0
    ar10 oscil3 ir1844, ir1845, 4
    ar11 = (9.0e-4 * ar10)
    ir1848 = 5.0e-2
    ir1849 = 0.75
    ar10 randi ir1848, ir1849
    ar13 = (1.0 + ar10)
    ar10 = (7.0 * ar13)
    ar13 = (ar11 * ar10)
    ar10 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar8 + ar10)
    ir1856 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1859 = 1.0
    ir1860 = 0.8
    ar8 gbuzz ir1856, kr0, kr2, ir1859, ir1860, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar8 * ar10)
    ir1864 = 1.0
    ir1865 = 6.3
    ar8 oscil3 ir1864, ir1865, 4
    ar10 = (8.7e-4 * ar8)
    ir1868 = 5.0e-2
    ir1869 = 0.75
    ar8 randi ir1868, ir1869
    ar13 = (1.0 + ar8)
    ar8 = (7.0 * ar13)
    ar13 = (ar10 * ar8)
    ar8 vdelay ar12, ar13, 1.5e-2
    ar10 = (ar11 + ar8)
    ir1876 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1879 = 1.0
    ir1880 = 0.8
    ar8 gbuzz ir1876, kr0, kr2, ir1879, ir1880, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar8 * ar11)
    ir1884 = 1.0
    ir1885 = 4.4
    ar8 oscil3 ir1884, ir1885, 4
    ar11 = (1.1e-3 * ar8)
    ir1888 = 5.0e-2
    ir1889 = 0.75
    ar8 randi ir1888, ir1889
    ar13 = (1.0 + ar8)
    ar8 = (7.0 * ar13)
    ar13 = (ar11 * ar8)
    ar8 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar10 + ar8)
    ar8 = (ar11 / 4.0)
    ir1897 = 3650.0
    ir1898 = 50.0
    ar10 reson ar8, ir1897, ir1898
    ar8 = (ar9 + ar10)
    ir1901 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1904 = 1.0
    ir1905 = 0.8
    ar9 gbuzz ir1901, kr0, kr2, ir1904, ir1905, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar9 * ar10)
    ir1909 = 1.0
    ir1910 = 4.0
    ar9 oscil3 ir1909, ir1910, 4
    ar10 = (1.2e-3 * ar9)
    ir1913 = 5.0e-2
    ir1914 = 0.75
    ar9 randi ir1913, ir1914
    ar12 = (1.0 + ar9)
    ar9 = (7.0 * ar12)
    ar12 = (ar10 * ar9)
    ar9 vdelay ar11, ar12, 1.5e-2
    ir1920 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1923 = 1.0
    ir1924 = 0.8
    ar10 gbuzz ir1920, kr0, kr2, ir1923, ir1924, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar10 * ar11)
    ir1928 = 1.0
    ir1929 = 5.0
    ar10 oscil3 ir1928, ir1929, 4
    ar11 = (9.0e-4 * ar10)
    ir1932 = 5.0e-2
    ir1933 = 0.75
    ar10 randi ir1932, ir1933
    ar13 = (1.0 + ar10)
    ar10 = (7.0 * ar13)
    ar13 = (ar11 * ar10)
    ar10 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar9 + ar10)
    ir1940 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1943 = 1.0
    ir1944 = 0.8
    ar9 gbuzz ir1940, kr0, kr2, ir1943, ir1944, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar9 * ar10)
    ir1948 = 1.0
    ir1949 = 6.3
    ar9 oscil3 ir1948, ir1949, 4
    ar10 = (8.7e-4 * ar9)
    ir1952 = 5.0e-2
    ir1953 = 0.75
    ar9 randi ir1952, ir1953
    ar13 = (1.0 + ar9)
    ar9 = (7.0 * ar13)
    ar13 = (ar10 * ar9)
    ar9 vdelay ar12, ar13, 1.5e-2
    ar10 = (ar11 + ar9)
    ir1960 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1963 = 1.0
    ir1964 = 0.8
    ar9 gbuzz ir1960, kr0, kr2, ir1963, ir1964, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar9 * ar11)
    ir1968 = 1.0
    ir1969 = 4.4
    ar9 oscil3 ir1968, ir1969, 4
    ar11 = (1.1e-3 * ar9)
    ir1972 = 5.0e-2
    ir1973 = 0.75
    ar9 randi ir1972, ir1973
    ar13 = (1.0 + ar9)
    ar9 = (7.0 * ar13)
    ar13 = (ar11 * ar9)
    ar9 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar10 + ar9)
    ar9 = (ar11 / 4.0)
    ir1981 = 5000.0
    ir1982 = 50.0
    ar10 reson ar9, ir1981, ir1982
    ar9 = (ar8 + ar10)
    ir1985 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir1988 = 1.0
    ir1989 = 0.8
    ar8 gbuzz ir1985, kr0, kr2, ir1988, ir1989, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar11 = (ar8 * ar10)
    ir1993 = 1.0
    ir1994 = 4.0
    ar8 oscil3 ir1993, ir1994, 4
    ar10 = (1.2e-3 * ar8)
    ir1997 = 5.0e-2
    ir1998 = 0.75
    ar8 randi ir1997, ir1998
    ar12 = (1.0 + ar8)
    ar8 = (7.0 * ar12)
    ar12 = (ar10 * ar8)
    ar8 vdelay ar11, ar12, 1.5e-2
    ir2004 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir2007 = 1.0
    ir2008 = 0.8
    ar10 gbuzz ir2004, kr0, kr2, ir2007, ir2008, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar10 * ar11)
    ir2012 = 1.0
    ir2013 = 5.0
    ar10 oscil3 ir2012, ir2013, 4
    ar11 = (9.0e-4 * ar10)
    ir2016 = 5.0e-2
    ir2017 = 0.75
    ar10 randi ir2016, ir2017
    ar13 = (1.0 + ar10)
    ar10 = (7.0 * ar13)
    ar13 = (ar11 * ar10)
    ar10 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar8 + ar10)
    ir2024 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir2027 = 1.0
    ir2028 = 0.8
    ar8 gbuzz ir2024, kr0, kr2, ir2027, ir2028, 2
    ar10 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar8 * ar10)
    ir2032 = 1.0
    ir2033 = 6.3
    ar8 oscil3 ir2032, ir2033, 4
    ar10 = (8.7e-4 * ar8)
    ir2036 = 5.0e-2
    ir2037 = 0.75
    ar8 randi ir2036, ir2037
    ar13 = (1.0 + ar8)
    ar8 = (7.0 * ar13)
    ar13 = (ar10 * ar8)
    ar8 vdelay ar12, ar13, 1.5e-2
    ar10 = (ar11 + ar8)
    ir2044 = 1.0
    kr1 = (sr * 0.4)
    kr2 = (kr1 / kr0)
    ir2047 = 1.0
    ir2048 = 0.8
    ar8 gbuzz ir2044, kr0, kr2, ir2047, ir2048, 2
    ar11 madsr 0.1, 0.0, 1.0, 0.1
    ar12 = (ar8 * ar11)
    ir2052 = 1.0
    ir2053 = 4.4
    ar8 oscil3 ir2052, ir2053, 4
    ar11 = (1.1e-3 * ar8)
    ir2056 = 5.0e-2
    ir2057 = 0.75
    ar8 randi ir2056, ir2057
    ar13 = (1.0 + ar8)
    ar8 = (7.0 * ar13)
    ar13 = (ar11 * ar8)
    ar8 vdelay ar12, ar13, 1.5e-2
    ar11 = (ar10 + ar8)
    ar8 = (ar11 / 4.0)
    ar10 balance ar9, ar8
    kr0 = (p5 / 64.0)
    kr1 = (kr0 ^ 2.0)
    kr0 = (kr1 / 2.0)
    ar8 upsamp kr0
    ar9 = (ar10 * ar8)
    ar8 = (0.15 * ar9)
    arl1 = ar8
endif
ar8 = arl0
ar9 = arl1
ar10 = gargg0
ar11 = gargg1
kr0 chnget "volume"
ar12 upsamp kr0
ar13 = (1.0 * ar12)
ar12 = (ar13 * ar8)
ar8 = (ar10 + ar12)
gargg0 = ar8
ar8 = (ar13 * ar9)
ar9 = (ar11 + ar8)
gargg1 = ar9
endin

</CsInstruments>

<CsScore>

f2 0 8192 9  1.0 1.0 0.25
f4 0 8192 10  1.0

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>