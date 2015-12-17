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
ir21 = 0.9
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
ir2 = rnd(ir1)
ir4 = rnd(ir1)
ir6 = rnd(ir1)
ir8 = rnd(ir1)
ir10 = rnd(ir1)
ir12 = rnd(ir1)
ir14 = rnd(ir1)
ir16 = rnd(ir1)
ir18 = rnd(ir1)
ir20 = rnd(ir1)
ar0 = gargg0
ar1 = gargg1
kr0 chnget "volume"
ar2 upsamp kr0
ar3 = (1.0 * ar2)
kr0 linseg 0.0, 0.65, 1.0, 1.0, 1.0
ar2 upsamp kr0
kr0 linsegr 1.0, 1.0, 1.0, 0.75, 0.0
ar4 upsamp kr0
ar5 = (ar2 * ar4)
ir31 = p4
ir32 = cpsmidinn(ir31)
kr0 = (ir32 * 1.0)
ir157 = i(kr0)
ir34 = 40.0
ir35 = cent(ir34)
ir36 = (ir35 * -1.0)
kr1 = (kr0 + ir36)
ir38 = (ir157 + ir36)
ir39 = (ir38 / 440.0)
ir40 = logbtwo(ir39)
ir41 = (12.0 * ir40)
ir42 = (69.0 + ir41)
ir43 = (ir42 - 48.0)
ir44 table ir43, 84
ar2 oscil3 ir1, kr1, ir44, ir2
ir46 = (ir35 * -0.5)
kr1 = (kr0 + ir46)
ir48 = (ir157 + ir46)
ir49 = (ir48 / 440.0)
ir50 = logbtwo(ir49)
ir51 = (12.0 * ir50)
ir52 = (69.0 + ir51)
ir53 = (ir52 - 48.0)
ir54 table ir53, 84
ar4 oscil3 ir1, kr1, ir54, ir4
ar6 = (ar2 + ar4)
ir57 = (ir32 * 1.0)
ir58 = (ir57 / 440.0)
ir59 = logbtwo(ir58)
ir60 = (12.0 * ir59)
ir61 = (69.0 + ir60)
ir62 = (ir61 - 48.0)
ir63 table ir62, 84
ar2 oscil3 ir1, kr0, ir63, ir6
ar4 = (ar6 + ar2)
ir66 = (ir35 * 0.5)
kr1 = (kr0 + ir66)
ir68 = (ir157 + ir66)
ir69 = (ir68 / 440.0)
ir70 = logbtwo(ir69)
ir71 = (12.0 * ir70)
ir72 = (69.0 + ir71)
ir73 = (ir72 - 48.0)
ir74 table ir73, 84
ar2 oscil3 ir1, kr1, ir74, ir8
ar6 = (ar4 + ar2)
ir77 = (ir35 * 1.0)
kr1 = (kr0 + ir77)
ir79 = (ir157 + ir77)
ir80 = (ir79 / 440.0)
ir81 = logbtwo(ir80)
ir82 = (12.0 * ir81)
ir83 = (69.0 + ir82)
ir84 = (ir83 - 48.0)
ir85 table ir84, 84
ar2 oscil3 ir1, kr1, ir85, ir10
ar4 = (ar6 + ar2)
ar2 = (ar4 / 5.0)
ar4 = (ar5 * ar2)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar2 upsamp kr0
ar6 = (ar4 * ar2)
ar4 = (0.75 * ar6)
kr0 = (ir32 * 0.5)
ir155 = i(kr0)
kr1 = (kr0 + ir36)
ir97 = (ir155 + ir36)
ir98 = (ir97 / 440.0)
ir99 = logbtwo(ir98)
ir100 = (12.0 * ir99)
ir101 = (69.0 + ir100)
ir102 = (ir101 - 48.0)
ir103 table ir102, 84
ar6 oscil3 ir1, kr1, ir103, ir12
kr1 = (kr0 + ir46)
ir106 = (ir155 + ir46)
ir107 = (ir106 / 440.0)
ir108 = logbtwo(ir107)
ir109 = (12.0 * ir108)
ir110 = (69.0 + ir109)
ir111 = (ir110 - 48.0)
ir112 table ir111, 84
ar7 oscil3 ir1, kr1, ir112, ir14
ar8 = (ar6 + ar7)
ir115 = (ir32 * 0.5)
ir116 = (ir115 / 440.0)
ir117 = logbtwo(ir116)
ir118 = (12.0 * ir117)
ir119 = (69.0 + ir118)
ir120 = (ir119 - 48.0)
ir121 table ir120, 84
ar6 oscil3 ir1, kr0, ir121, ir16
ar7 = (ar8 + ar6)
kr1 = (kr0 + ir66)
ir125 = (ir155 + ir66)
ir126 = (ir125 / 440.0)
ir127 = logbtwo(ir126)
ir128 = (12.0 * ir127)
ir129 = (69.0 + ir128)
ir130 = (ir129 - 48.0)
ir131 table ir130, 84
ar6 oscil3 ir1, kr1, ir131, ir18
ar8 = (ar7 + ar6)
kr1 = (kr0 + ir77)
ir135 = (ir155 + ir77)
ir136 = (ir135 / 440.0)
ir137 = logbtwo(ir136)
ir138 = (12.0 * ir137)
ir139 = (69.0 + ir138)
ir140 = (ir139 - 48.0)
ir141 table ir140, 84
ar6 oscil3 ir1, kr1, ir141, ir20
ar7 = (ar8 + ar6)
ar6 = (ar7 / 5.0)
ar7 = (ar5 * ar6)
ar5 = (ar7 * ar2)
ar2 = (0.375 * ar5)
ar5 = (ar4 + ar2)
ar2 = (ar3 * ar5)
ar3 = (ar0 + ar2)
gargg0 = ar3
ar0 = (ar1 + ar2)
gargg1 = ar0
endin

</CsInstruments>

<CsScore>

f84 0 37 -2  2.0 4.0 6.0 8.0 11.0 13.0 15.0 17.0 19.0 22.0 24.0 26.0 28.0 31.0 33.0 35.0 37.0 39.0 42.0 44.0 46.0 48.0 51.0 53.0 55.0 57.0 59.0 62.0 64.0 66.0 68.0 71.0 73.0 75.0 77.0 79.0 82.0
f2 0 8192 9  1.0 983.6 149.7138718676841 2.0 2957.0 -50.305694412486275 3.0 1419.21 115.68017883691321 4.0 790.14 -136.93691303626676 5.0 1128.71 51.05053954615635 6.0 427.98 165.18373233621637 7.0 290.77 -122.26919348091768 8.0 486.62 7.964113352318444 9.0 221.42 176.12722622321505 10.0 75.69 174.58024017636185 11.0 102.28 58.556286662370134 12.0 34.48 -74.08344291041544 13.0 21.73 -127.31122207806891 14.0 11.8 -18.44924100321251 15.0 8.98 157.5633936609764 16.0 9.9 -72.82293576112762 17.0 7.3 80.15679553880217 18.0 3.75 -164.15240830498087 19.0 5.11 -16.959550735872366 20.0 10.63 108.17443172069942 21.0 4.51 -76.43256987045181 22.0 1.32 8.766254265501596 23.0 1.57 102.78862844646969 24.0 3.24 -89.49600759943459 25.0 1.8 93.04834592924568 26.0 6.28 -92.41809235460178 27.0 3.66 80.27138709782834 28.0 5.5 -136.93691303626676 29.0 2.91 71.50513283232674 30.0 2.34 -26.413354355530952 31.0 1.54 -135.04615231233504 32.0 0.62 21.48591731740587 33.0 1.01 129.94682793567068 34.0 1.25 -171.4289723031423 35.0 0.37 -33.231552117587746 36.0 1.13 165.47021123378175 37.0 0.22 66.69228735322781
f4 0 8192 9  1.0 1231.99 -23.94963583646841 2.0 3478.0 -76.31797831142566 3.0 1246.74 -96.37150114100446 4.0 843.53 -175.15319797149266 5.0 1248.37 163.1210842737454 6.0 171.14 97.05905049516146 7.0 240.19 -58.384399323830884 8.0 421.03 -132.35325067522018 9.0 143.93 -176.29911356175433 10.0 22.99 -77.00552766558265 11.0 32.43 104.56479761137524 12.0 40.4 60.27516004776261 13.0 8.46 23.94963583646841 14.0 15.19 -87.26147219842437 15.0 10.35 -112.4716151841806 16.0 9.4 166.61612682404336 17.0 7.31 145.64587152225525 18.0 5.94 51.2224268846956 19.0 3.28 106.85662879189853 20.0 4.14 -34.434763487362474 21.0 1.09 20.282705947631143 22.0 3.12 -74.77099226457243 23.0 2.91 -172.97595834999555 24.0 1.57 81.18811957003766 25.0 3.98 56.436342820386095 26.0 0.49 81.93296470370771 27.0 2.57 -78.26603481487047 28.0 0.55 -72.02079484794447 29.0 4.88 -177.50232493152905 30.0 2.41 17.074142294898532 31.0 0.41 -20.97025530178813 32.0 0.9 -34.72124238492789 33.0 1.29 -98.94981121909318 34.0 4.39 -175.95533888467585 35.0 1.27 177.38773337250285
f59 0 8192 9  1.0 2784.0 78.38062637389662 2.0 497.78 55.06124411207211 3.0 72.11 -54.316398978402034 4.0 48.11 46.06580672851819 5.0 13.68 -71.21865393476133 6.0 21.48 136.36395524113593 7.0 17.42 148.45336471839633 8.0 6.52 167.1317888396611
f62 0 8192 9  1.0 2853.0 -87.94902155258137 2.0 369.94 127.13933473952966 3.0 128.53 -119.2325171667243 4.0 45.86 -165.18373233621637 5.0 18.2 100.1530225888679 6.0 24.02 -67.03606203030631 7.0 12.67 -167.70474663479197 8.0 9.88 -9.052733163067007
f6 0 8192 9  1.0 2971.72 -123.07133439410084 2.0 5270.0 84.68316212033568 3.0 1008.52 27.501974166279513 4.0 941.55 128.51443344784363 5.0 1658.88 9.396507840145501 6.0 37.81 -56.207159702333755 7.0 260.72 -109.09116419290874 8.0 116.74 107.20040346897702 9.0 73.68 -27.616565725305676 10.0 74.05 -132.2959548957071 11.0 72.56 100.89786772253795 12.0 7.97 -118.02930579694959 13.0 9.16 4.411775022507339 14.0 10.6 -170.51223983093297 15.0 10.45 98.94981121909318 16.0 1.86 179.39308565546074 17.0 6.3 139.3433357758162 18.0 9.37 158.1936472356203 19.0 4.06 48.07115901147606 20.0 2.03 -146.67719555349075 21.0 6.45 171.65815542119464 22.0 3.76 -172.91866257048247 23.0 2.43 133.44187048596874 24.0 3.64 -90.41274007164391 25.0 6.59 -167.5328592962527 26.0 3.89 79.64113352318442 27.0 1.71 -48.128454790989146 28.0 0.58 154.81319624434843 29.0 3.4 68.18197762056796 30.0 2.32 88.23550045014677 31.0 2.17 -151.3181536940504 32.0 4.44 124.04536264582323 33.0 2.71 99.23629011665858
f75 0 8192 9  1.0 3073.0 65.94744221955776 2.0 210.88 124.90479933851948 3.0 155.57 4.297183463481174 4.0 53.67 134.64508185574346 5.0 49.74 94.70992353512509
f11 0 8192 9  1.0 3280.12 -67.15065358933248 2.0 4388.0 -92.81916281119337 3.0 1204.04 -115.3936999393478 4.0 978.06 153.3235059770083 5.0 346.33 14.495832216809827 6.0 168.02 -54.316398978402034 7.0 421.69 -170.34035249239375 8.0 35.6 -170.51223983093297 9.0 3.38 -17.188733853924695 10.0 46.75 -64.28586461367837 11.0 25.89 -149.37009719060563 12.0 9.7 161.00114043176134 13.0 4.19 36.612003108859604 14.0 2.86 -50.764060648590934 15.0 6.11 -70.47380880109127 16.0 8.57 -118.02930579694959 17.0 1.04 82.90699295543013 18.0 0.93 57.06659639503 19.0 0.66 3.437746770784939 20.0 2.15 -89.78248649700001 21.0 5.02 43.83127132750797 22.0 2.41 57.75414574918698 23.0 1.72 -37.47143980155584 24.0 0.98 -100.72598038399872 25.0 2.58 -26.92901637114869 26.0 4.78 37.98710181717358 27.0 3.41 6.359831525952138 28.0 1.08 -160.82925309322206 29.0 3.23 105.9971920992023 30.0 1.2 39.992454100131454
f73 0 8192 9  1.0 3350.0 70.70299191914359 2.0 250.03 -47.154426539266744 3.0 292.56 108.80468529534333 4.0 10.98 169.30902846115825 5.0 15.62 -3.6669298888372683
f8 0 8192 9  1.0 3366.87 168.79336644554056 2.0 4666.0 40.851890792827696 3.0 931.67 -84.05290854569176 4.0 1009.54 65.94744221955776 5.0 716.99 -151.26085791453735 6.0 205.57 -29.908396905828976 7.0 9.82 123.30051751215316 8.0 108.8 39.47679208451372 9.0 12.38 -153.3235059770083 10.0 8.12 -145.07291372712444 11.0 25.55 -4.5263665815335035 12.0 22.36 155.15697092142696 13.0 21.07 22.402649789615186 14.0 1.12 -94.9391066531774 15.0 4.99 -95.68395178684747 16.0 5.73 133.78564516304723 17.0 2.04 -89.78248649700001 18.0 0.8 -52.13915935690492 19.0 1.1 151.20356213502424 20.0 3.57 39.877862541105294 21.0 2.87 135.27533543038737 22.0 7.04 -42.51346839870708 23.0 9.01 -178.9347194193561 24.0 2.17 25.095551426730058 25.0 1.7 45.14907425630887 26.0 4.2 138.25471596506765 27.0 4.43 58.67087822139629 28.0 2.83 -107.83065704362093 29.0 1.72 58.67087822139629 30.0 1.26 129.54575747907913 31.0 2.07 -107.14310768946395
f79 0 8192 9  1.0 3562.0 -103.30429046208742 2.0 482.52 -64.57234351124379 3.0 196.8 110.5235586807358 4.0 61.9 22.574537128154436 5.0 26.77 11.3445643435903
f57 0 8192 9  1.0 3610.0 78.55251371243587 2.0 404.42 64.40045617270454 3.0 214.83 26.986312150661774 4.0 38.31 57.3530752925954 5.0 10.47 36.55470732934652 6.0 13.31 -131.66570132106318 7.0 18.02 156.2455907321755 8.0 9.82 146.73449133300383
f46 0 8192 9  1.0 3628.0 -88.00631733209445 2.0 893.64 125.4204613541372 3.0 559.79 -109.6068262085265 4.0 100.0 -102.84592422598276 5.0 62.94 77.75037279925272 6.0 20.49 -11.745634800181875 7.0 5.03 165.87128169037334 8.0 3.6 128.28525032979132 9.0 6.73 -5.500394833255903 10.0 9.01 -48.64411680660689 11.0 7.42 106.45555833530696 12.0 2.67 -10.026761414789405
f37 0 8192 9  1.0 3797.0 86.11555660816272 2.0 271.99 80.38597865685449 3.0 203.56 53.8007369627843 4.0 19.28 112.1278405071021 5.0 49.8 102.84592422598276 6.0 9.03 60.217864268249514 7.0 9.85 67.95279450251563 8.0 3.98 113.10186875882451 9.0 3.56 -151.83381570966816 10.0 0.78 -167.18908461917422 11.0 1.36 -76.43256987045181 12.0 1.86 -92.01702189801023 13.0 3.93 -132.69702535229865 14.0 0.8 71.50513283232674 15.0 2.26 -83.76642964812635
f31 0 8192 9  1.0 3925.0 -85.37071147449265 2.0 1245.36 -117.45634800181874 3.0 239.12 -108.5182063977779 4.0 284.85 -165.41291545426867 5.0 33.17 93.965078401455 6.0 36.69 -45.14907425630887 7.0 13.13 142.43730786952267 8.0 10.02 -31.97104496829994 9.0 7.89 -134.4731945172042 10.0 1.72 22.173466671562856 11.0 3.17 -94.13696573999427 12.0 1.61 -5.557690612768986 13.0 0.47 -126.50908116488579 14.0 1.35 -51.16513110518252 15.0 0.55 -25.382030324295467 16.0 1.36 -14.782311114375238 17.0 0.27 52.196455136418
f19 0 8192 9  1.0 4028.0 -99.23629011665858 2.0 1913.7 -93.85048684242884 3.0 259.05 73.62507667431078 4.0 736.43 -57.52496263113465 5.0 370.07 -105.19505118601916 6.0 81.01 10.714310768946394 7.0 58.64 101.01245928156413 8.0 59.02 -55.290427230124436 9.0 16.39 -160.54277419565668 10.0 6.08 106.45555833530696 11.0 7.78 -9.91216985576324 12.0 5.12 -92.81916281119337 13.0 6.23 -169.53821157921058 14.0 2.06 149.37009719060563 15.0 3.05 -9.511099399171666 16.0 1.56 -13.120733508495851 17.0 5.37 178.47635318325146 18.0 3.91 83.30806341202168 19.0 2.9 -46.46687718510977 20.0 3.27 -163.00649271471923 21.0 2.33 120.83679899309062 22.0 1.28 -99.69465635276323 23.0 1.68 -90.52733163067008
f51 0 8192 9  1.0 4055.0 90.41274007164391 2.0 644.76 90.64192318969623 3.0 231.29 -5.729577951308232e-2 4.0 47.45 76.77634454753031 5.0 18.44 86.00096504913657 6.0 5.34 116.48231975009637 7.0 10.8 -61.53566719705042 8.0 9.67 -39.591383643539885 9.0 17.4 -82.56321827835163 10.0 8.34 -14.782311114375238
f55 0 8192 9  1.0 4291.0 -92.81916281119337 2.0 103.03 -132.238659116194 3.0 144.55 110.06519244463115 4.0 4.04 -130.86356040788002 5.0 19.76 154.9277878033746 6.0 1.66 158.5374219126988 7.0 18.59 -128.80091234540907 8.0 9.1 76.94823188606956 9.0 8.12 -109.14845997242182
f44 0 8192 9  1.0 4304.0 86.40203550572814 2.0 329.98 -42.97183463481174 3.0 419.64 82.27673938078622 4.0 30.68 101.92919175377344 5.0 33.73 -167.8766339733312 6.0 2.8 -98.54874076250161 7.0 15.84 -60.103272709223354 8.0 4.66 -174.23646549928336 9.0 10.0 158.93849236929037 10.0 5.66 128.97279968394832 11.0 2.07 131.78029288008932 12.0 6.78 -151.0889705759981
f15 0 8192 9  1.0 4336.0 132.63972957278557 2.0 4223.74 -29.278143331185067 3.0 578.52 70.58840036011742 4.0 935.1 144.72913905004594 5.0 310.03 19.19408613688258 6.0 130.91 111.26840381440587 7.0 126.87 -157.62068944048949 8.0 94.7 -28.705185536054245 9.0 53.16 58.32710354431781 10.0 44.84 -155.72992871655777 11.0 25.54 -12.490479933851947 12.0 12.33 101.92919175377344 13.0 8.55 -140.89032182266942 14.0 10.14 -44.23234178409955 15.0 7.54 109.49223464950032 16.0 4.91 -94.30885307853349 17.0 5.62 95.9131349048998 18.0 6.36 -128.22795455027824 19.0 6.0 -23.20479070279834 20.0 3.61 159.7406332824735 21.0 6.75 -79.92761242074984 22.0 3.24 133.95753250158648 23.0 7.68 106.6847414533593 24.0 5.73 -12.605071492878112 25.0 4.17 143.2967445622189 26.0 1.31 -43.945862886534144
f42 0 8192 9  1.0 4475.0 -99.522769014224 2.0 304.98 60.44704738630185 3.0 309.23 -98.77792388055393 4.0 44.63 113.7894181129815 5.0 55.52 -71.39054127330057 6.0 12.01 166.32964792647797 7.0 19.53 20.798367963248886 8.0 1.11 -155.38615403947927 9.0 3.44 62.85347012585131 10.0 7.45 -117.34175644279259 11.0 5.63 9.969465635276324 12.0 8.73 -70.41651302157818 13.0 8.2 16.386592940741544
f39 0 8192 9  1.0 4476.0 -78.03685169681813 2.0 1424.38 158.42283035367265 3.0 418.71 -70.58840036011742 4.0 59.43 109.95060088560498 5.0 50.49 -32.54400276343076 6.0 15.98 -107.37229080751626 7.0 13.39 109.77871354706573 8.0 4.99 -66.06203377858391 9.0 4.73 -112.81538986125909 10.0 2.55 148.73984361596172 11.0 3.84 38.846538509869816 12.0 6.86 -88.69386668625143 13.0 0.11 -43.945862886534144 14.0 1.01 -30.42405892144671
f22 0 8192 9  1.0 4561.0 124.15995420484937 2.0 3295.16 23.54856537987683 3.0 637.36 41.02377813136694 4.0 762.84 172.51759211389088 5.0 482.85 -58.90006133944863 6.0 113.66 -85.77178193108425 7.0 41.9 -162.3762391400753 8.0 55.56 -69.27059743131653 9.0 24.53 125.1339824565718 10.0 17.3 -92.76186703168028 11.0 9.16 -7.276563998161455 12.0 10.63 123.87347530728397 13.0 5.42 -125.64964447218954 14.0 3.49 147.70851958472622 15.0 3.75 -118.14389735597574 16.0 1.16 -55.290427230124436 17.0 0.75 -172.34570477535163 18.0 1.07 -61.249188299485 19.0 4.3 109.2057557519349 20.0 0.89 17.58980431051627 21.0 2.05 -147.99499848229166 22.0 0.79 13.06343772898277
f64 0 8192 9  1.0 4725.0 -102.04378331279962 2.0 327.59 76.26068253191256 3.0 104.99 179.96604345059157 4.0 41.12 68.35386495910721 5.0 8.85 -23.26208648231142 6.0 19.12 179.90874767107852 7.0 14.0 -71.16135815524825
f53 0 8192 9  1.0 4758.0 73.39589355625846 2.0 594.64 86.23014816718889 3.0 297.49 52.71211715203574 4.0 24.94 114.82074214421698 5.0 29.76 101.87189597426038 6.0 10.45 -169.13714112261903 7.0 8.44 -16.959550735872366 8.0 11.8 -139.74440623240778 9.0 3.58 -122.44108081945693
f66 0 8192 9  1.0 4792.0 80.95893645198532 2.0 107.16 40.049749879644544 3.0 91.22 103.93454403673132 4.0 32.58 124.21724998436248 5.0 6.21 -82.73510561689088 6.0 24.76 15.183381570966816 7.0 10.7 97.40282517223994
f13 0 8192 9  1.0 4816.0 -90.29814851261774 2.0 3902.84 -102.04378331279962 3.0 581.58 -149.8284634267103 4.0 712.1 19.938931270552647 5.0 1121.24 -61.421075638024256 6.0 198.24 -163.4648589508239 7.0 90.95 45.49284893338737 8.0 31.53 171.88733853924697 9.0 8.56 175.43967686905808 10.0 17.6 113.50293921541609 11.0 8.74 -8.708958485988513 12.0 12.24 -94.88181087366432 13.0 9.51 -106.62744567384621 14.0 3.26 -30.59594625998596 15.0 1.29 -153.38080175652138 16.0 3.29 149.25550563157944 17.0 2.11 131.09274352593235 18.0 7.53 34.72124238492789 19.0 2.46 -0.6302535746439055 20.0 4.2 -152.63595662285132 21.0 8.3 166.84530994209572 22.0 5.12 56.207159702333755 23.0 4.79 -38.38817227376516 24.0 4.51 -127.7122925346605 25.0 3.07 120.09195385942056 26.0 1.5 16.443888720254627 27.0 2.82 -51.16513110518252 28.0 1.78 -109.6068262085265
f17 0 8192 9  1.0 4930.0 118.43037625354118 2.0 3719.05 -3.20856365273261 3.0 777.19 81.24541534955073 4.0 969.72 164.32429564352012 5.0 563.63 -53.05589182911423 6.0 375.99 104.16372715478367 7.0 61.75 -158.36553457415954 8.0 44.39 128.85820812492213 9.0 32.09 76.31797831142566 10.0 19.04 -96.02772646392597 11.0 11.48 45.83662361046586 12.0 12.15 -177.10125447493746 13.0 11.55 -53.39966650619273 14.0 6.45 68.18197762056796 15.0 3.18 -60.217864268249514 16.0 0.66 -87.94902155258137 17.0 5.08 -147.536632246187 18.0 2.68 84.96964101790108 19.0 0.53 -28.36141085897575 20.0 4.72 -139.45792733484237 21.0 3.67 -168.1631128708966 22.0 2.75 69.3278932108296 23.0 3.33 -166.9599015011219 24.0 2.12 58.61358244188321 25.0 1.67 77.75037279925272
f35 0 8192 9  1.0 4994.0 -90.1262611740785 2.0 614.22 156.9331400863325 3.0 541.82 -101.29893817912955 4.0 134.58 -155.78722449607082 5.0 18.86 -150.91708323745885 6.0 44.3 108.28902327972558 7.0 13.06 -60.16056848873644 8.0 13.26 125.24857401559797 9.0 7.09 -67.4371324868979 10.0 4.43 159.85522484149968 11.0 6.26 103.99183981624441 12.0 2.7 -36.72659466788577 13.0 0.67 -126.05071492878113 14.0 1.25 -21.31402997886662 15.0 2.6 -47.039834980240585
f82 0 8192 9  1.0 5076.0 -105.02316384747989 2.0 155.5 -95.11099399171665 3.0 215.08 -86.97499330085897 4.0 33.27 -41.36755280844544
f68 0 8192 9  1.0 5119.0 71.2759497142744 2.0 216.49 47.039834980240585 3.0 121.38 43.25831353237716 4.0 7.52 -47.78468011391066 5.0 27.89 172.46029633437777 6.0 27.08 -139.51522311435545
f26 0 8192 9  1.0 5168.0 -99.80924791178941 2.0 4385.69 -85.599894592545 3.0 1120.91 85.82907771059732 4.0 731.42 16.04281826366305 5.0 336.81 -157.73528099951565 6.0 99.07 155.55804137801852 7.0 94.38 50.764060648590934 8.0 45.32 -108.63279795680407 9.0 23.49 154.98508358288768 10.0 10.32 83.3653591915348 11.0 9.32 -46.69606030316209 12.0 7.09 -103.64806513916592 13.0 1.72 157.79257677902874 14.0 7.63 103.36158624160052 15.0 5.65 -67.03606203030631 16.0 9.01 -157.33421054292404 17.0 4.85 124.79020777949329 18.0 1.75 -35.17960862103254 19.0 2.87 -160.71466153419593 20.0 1.88 174.2937612787964
f48 0 8192 9  1.0 5280.0 -102.7313326669566 2.0 793.54 59.58761069360562 3.0 752.79 -82.73510561689088 4.0 126.83 -49.61814505832929 5.0 67.7 -127.13933473952966 6.0 25.4 50.93594798713019 7.0 18.25 -44.69070802020421 8.0 4.16 -57.3530752925954 9.0 22.15 -10.542423430407146 10.0 8.51 179.96604345059157
f33 0 8192 9  1.0 5363.0 -94.13696573999427 2.0 882.58 124.96209511803254 3.0 642.1 -54.029920080836625 4.0 226.53 -2.1199438419840457 5.0 74.0 -114.13319279006 6.0 7.68 42.226989501141674 7.0 20.45 -88.12090889112062 8.0 11.34 124.96209511803254 9.0 9.2 -40.56541189526229 10.0 1.56 22.86101602571985 11.0 3.55 90.7565147487224 12.0 3.55 -17.303325412950862 13.0 2.07 113.56023499492916 14.0 2.39 -11.917522138721122 15.0 2.21 129.37387014053988 16.0 1.04 -43.029130414324825
f77 0 8192 9  1.0 5847.0 85.71448615157115 2.0 586.31 2.7501974166279517 3.0 134.92 19.308677695908745 4.0 106.1 118.71685515110659 5.0 28.66 100.55409304545947
f71 0 8192 9  1.0 5896.0 80.84434489295916 2.0 59.77 -83.82372542763945 3.0 101.66 -168.5068875479751 4.0 3.13 -171.08519762606383 5.0 49.24 34.0336930307709 6.0 12.19 102.61674110793044
f28 0 8192 9  1.0 6412.0 -107.77336126410785 2.0 2984.17 -101.81460019474727 3.0 717.38 -31.22619983462987 4.0 852.73 -99.35088167568475 5.0 151.4 -43.20101775286407 6.0 56.41 -32.02834074781302 7.0 12.28 -169.07984534310594 8.0 37.88 116.25313663204402 9.0 22.51 26.413354355530952 10.0 3.03 -46.18039828754436 11.0 3.89 -36.49741154983344 12.0 4.09 79.98490820026291 13.0 8.02 10.714310768946394 14.0 9.92 165.29832389524248 15.0 8.82 129.7749405971315 16.0 5.68 15.52715624804531 17.0 2.8 158.02175989708104 18.0 2.89 107.31499502800318
f24 0 8192 9  1.0 6413.0 -118.14389735597574 2.0 4098.45 -80.15679553880217 3.0 673.33 -131.32192664398465 4.0 1508.45 -33.86180569223165 5.0 151.25 -82.73510561689088 6.0 137.58 84.22479588423103 7.0 47.66 30.99701671657754 8.0 65.95 -101.64271285620804 9.0 27.54 146.27612509689916 10.0 13.02 13.349916626548183 11.0 17.45 -49.274370381250804 12.0 7.39 108.69009373631717 13.0 1.49 150.17223810378877 14.0 5.9 37.07036934496426 15.0 4.82 -100.26761414789407 16.0 5.88 -176.87207135688516 17.0 14.77 116.19584085253096 18.0 10.07 3.552338329811104 19.0 8.41 -121.98271458335228 20.0 4.49 165.18373233621637 21.0 2.48 60.103272709223354

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>