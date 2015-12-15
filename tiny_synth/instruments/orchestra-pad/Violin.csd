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
ir12 = 0.9
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
ir1 = 1.0
ir2 = rnd(ir1)
ir4 = rnd(ir1)
ir6 = rnd(ir1)
ir8 = rnd(ir1)
ir10 = rnd(ir1)
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
ir21 = p4
kr0 = cpsmidinn(ir21)
ir90 = i(kr0)
ir23 = 40.0
ir24 = cent(ir23)
ir25 = (ir24 * -1.0)
kr1 = (kr0 + ir25)
ir27 = (ir90 + ir25)
ir28 = (ir27 / 440.0)
ir29 = logbtwo(ir28)
ir30 = (12.0 * ir29)
ir31 = (69.0 + ir30)
ir32 = (ir31 - 43.0)
ir33 table ir32, 95
ar2 oscil3 ir1, kr1, ir33, ir2
ir35 = (ir24 * -0.5)
kr1 = (kr0 + ir35)
ir37 = (ir90 + ir35)
ir38 = (ir37 / 440.0)
ir39 = logbtwo(ir38)
ir40 = (12.0 * ir39)
ir41 = (69.0 + ir40)
ir42 = (ir41 - 43.0)
ir43 table ir42, 95
ar4 oscil3 ir1, kr1, ir43, ir4
ar6 = (ar2 + ar4)
ir46 = cpsmidinn(ir21)
ir47 = (ir46 / 440.0)
ir48 = logbtwo(ir47)
ir49 = (12.0 * ir48)
ir50 = (69.0 + ir49)
ir51 = (ir50 - 43.0)
ir52 table ir51, 95
ar2 oscil3 ir1, kr0, ir52, ir6
ar4 = (ar6 + ar2)
ir55 = (ir24 * 0.5)
kr1 = (kr0 + ir55)
ir57 = (ir90 + ir55)
ir58 = (ir57 / 440.0)
ir59 = logbtwo(ir58)
ir60 = (12.0 * ir59)
ir61 = (69.0 + ir60)
ir62 = (ir61 - 43.0)
ir63 table ir62, 95
ar2 oscil3 ir1, kr1, ir63, ir8
ar6 = (ar4 + ar2)
ir66 = (ir24 * 1.0)
kr1 = (kr0 + ir66)
ir68 = (ir90 + ir66)
ir69 = (ir68 / 440.0)
ir70 = logbtwo(ir69)
ir71 = (12.0 * ir70)
ir72 = (69.0 + ir71)
ir73 = (ir72 - 43.0)
ir74 table ir73, 95
ar2 oscil3 ir1, kr1, ir74, ir10
ar4 = (ar6 + ar2)
ar2 = (ar4 / 5.0)
ar4 = (ar5 * ar2)
kr0 = (p5 / 64.0)
kr1 = (kr0 ^ 2.0)
kr0 = (kr1 / 2.0)
ar2 upsamp kr0
ar5 = (ar4 * ar2)
ar2 = (ar3 * ar5)
ar3 = (ar0 + ar2)
gargg0 = ar3
ar0 = (ar1 + ar2)
gargg1 = ar0
endin

</CsInstruments>

<CsScore>

f95 0 42 -2  2.0 4.0 6.0 8.0 11.0 13.0 15.0 17.0 19.0 22.0 24.0 26.0 28.0 31.0 33.0 35.0 37.0 39.0 42.0 44.0 46.0 48.0 51.0 53.0 55.0 57.0 59.0 62.0 64.0 66.0 68.0 71.0 73.0 75.0 77.0 79.0 82.0 84.0 86.0 88.0 91.0 93.0
f2 0 8192 9  1.0 173.02 -4.755549699585833 2.0 3813.0 41.25296124941927 3.0 454.04 90.24085273310466 4.0 1899.6 132.00947599814165 5.0 3417.4 -46.06580672851819 6.0 986.9 171.60085964168155 7.0 814.25 -149.54198452914486 8.0 1862.38 -131.2646308644716 9.0 898.19 -139.62981467338162 10.0 521.5 82.56321827835163 11.0 567.77 -99.8665436913025 12.0 397.94 78.38062637389662 13.0 584.15 -160.60006997516973 14.0 558.45 129.94682793567068 15.0 324.64 136.53584257967518 16.0 393.41 -59.759498032144855 17.0 53.85 -48.930595704172305 18.0 182.05 -63.42642792098213 19.0 116.59 169.13714112261903 20.0 99.54 44.576116461178046 21.0 41.28 -178.07528272665988 22.0 149.15 156.1882949526624 23.0 147.38 10.485127650894064 24.0 112.62 -134.5877860762304 25.0 76.83 87.26147219842437 26.0 34.51 55.40501878915061 27.0 54.77 8.250592249883853 28.0 23.94 25.038255647216975 29.0 61.97 -44.51882068166497 30.0 48.0 -101.24164239961647 31.0 34.61 -176.0126346641889 32.0 2.82 -153.72457643359985 33.0 23.41 158.70930925123804 34.0 19.62 75.859612075321 35.0 7.48 -35.0077212824933 36.0 10.57 13.750987083139757 37.0 5.43 85.77178193108425 38.0 7.9 -39.5340878640268 39.0 4.91 -45.664736271926614 40.0 11.79 -147.93770270277855 41.0 12.36 129.48846169956605 42.0 6.67 55.57690612768985 43.0 1.31 57.181187954056156 44.0 8.06 -130.17601105372304 45.0 11.18 31.512678732195283 46.0 2.44 -52.71211715203574 47.0 5.15 109.37764309047415 48.0 8.49 6.990085100596044 49.0 4.99 -56.7228217179515 50.0 6.0 -126.27989804683345 51.0 1.08 5.557690612768986
f6 0 8192 9  1.0 194.98 -176.24181778224124 2.0 1233.31 24.923664088190808 3.0 1472.6 50.649469089564775 4.0 204.13 116.25313663204402 5.0 294.94 171.94463431876002 6.0 1005.97 34.37746770784939 7.0 2859.0 126.56637694439885 8.0 420.27 -110.81003757830122 9.0 171.11 -48.24304635001532 10.0 453.13 -80.27138709782834 11.0 640.32 -133.8429409425603 12.0 54.86 -120.32113697747288 13.0 122.05 -95.9131349048998 14.0 264.7 73.79696401285004 15.0 142.03 38.78924273035674 16.0 119.14 98.37685342396234 17.0 118.8 61.19189251997192 18.0 69.2 128.3998418888175 19.0 62.38 -146.21882931738608 20.0 44.85 -71.50513283232674 21.0 4.44 -171.94463431876002 22.0 13.9 -76.4898656499649 23.0 43.46 -2.9793805346802804 24.0 42.94 153.26621019749518 25.0 3.48 -83.19347185299554 26.0 31.9 136.99420881577984 27.0 37.04 -123.8161795277709 28.0 13.15 -22.6891286871806 29.0 9.3 117.51364378133185 30.0 7.08 -101.35623395864262 31.0 3.9 55.80608924574218 32.0 0.37 -133.09809580889024 33.0 7.17 -137.68175816993684 34.0 1.6 -66.17662533761009 35.0 1.7 49.217074601737714 36.0 4.03 58.44169510334397 37.0 3.44 -138.71308220117228 38.0 3.38 -109.37764309047415 39.0 5.46 -18.391945223699427 40.0 14.35 92.58997969314103 41.0 6.39 -159.91252062101276 42.0 2.34 2.4064227395494577 43.0 4.34 -173.66350770415252 44.0 8.61 -69.21330165180345 45.0 3.78 13.521803965087427
f68 0 8192 9  1.0 237.13 6.7609019825437136 2.0 2452.0 80.21409131831524 3.0 954.95 60.56163894532801 4.0 209.67 -6.7609019825437136 5.0 409.04 -110.23707978317039 6.0 206.21 157.27691476341099 7.0 104.71 24.923664088190808 8.0 71.05 -76.14609097288641 9.0 17.47 -127.48310941660817
f4 0 8192 9  1.0 317.36 -86.00096504913657 2.0 3111.96 -54.25910319888895 3.0 4533.0 150.4014212218411 4.0 2687.77 -99.80924791178941 5.0 1948.12 -21.371325758379708 6.0 4510.94 136.47854680016212 7.0 3970.01 -39.82056676159221 8.0 1203.08 -54.60287787596745 9.0 288.37 -48.3003421295284 10.0 1601.22 19.881635491039564 11.0 1789.13 -138.59849064214615 12.0 603.89 19.079494577856416 13.0 701.15 -131.6084055415501 14.0 671.06 126.45178538537269 15.0 637.43 -164.0378167459547 16.0 237.68 -32.37211542489151 17.0 821.81 83.25076763250863 18.0 135.34 150.8024916784327 19.0 199.6 -28.81977709508041 20.0 82.99 2.864788975654116 21.0 39.82 82.90699295543013 22.0 139.96 127.25392629855585 23.0 112.63 -32.429411204404595 24.0 173.81 162.3762391400753 25.0 57.11 26.699833253096365 26.0 92.44 -96.31420536149137 27.0 61.9 -119.00333404867199 28.0 46.38 92.13161345703638 29.0 22.33 -41.768623265037014 30.0 15.89 -54.25910319888895 31.0 39.45 -155.55804137801852 32.0 27.06 62.33780811023357 33.0 6.01 -83.82372542763945 34.0 34.26 -178.9347194193561 35.0 4.97 56.32175126135992 36.0 7.32 -32.94507322002233 37.0 7.75 173.4343245861002 38.0 11.69 -29.335439110698147 39.0 17.63 -136.24936368210976 40.0 5.95 10.141352973815572 41.0 12.89 -179.33578987594765 42.0 15.49 -78.60980949194895 43.0 9.06 -162.54812647861456 44.0 7.47 109.2057557519349 45.0 9.45 -6.073352628386726 46.0 8.46 -153.3235059770083 47.0 6.54 4.755549699585833
f71 0 8192 9  1.0 369.51 166.61612682404336 2.0 3138.0 -84.56857056130951 3.0 554.5 123.64429218923165 4.0 257.57 -173.31973302707402 5.0 121.61 139.11415265776387 6.0 374.45 -159.396858605395 7.0 65.44 -22.86101602571985 8.0 187.05 -80.38597865685449
f8 0 8192 9  1.0 381.63 -73.16671043820612 2.0 2438.0 -101.35623395864262 3.0 1530.5 126.91015162147734 4.0 915.0 -50.36299019199936 5.0 197.4 158.36553457415954 6.0 574.08 -125.87882759024187 7.0 674.11 -54.54558209645437 8.0 257.8 -28.590593977028078 9.0 326.97 29.908396905828976 10.0 456.99 -137.22339193383218 11.0 187.3 -86.11555660816272 12.0 8.56 112.41431940466751 13.0 248.19 66.63499157371474 14.0 201.84 -126.79556006245119 15.0 123.75 46.58146874413593 16.0 213.29 42.62805995773324 17.0 96.72 -65.25989286540077 18.0 75.75 174.6375359558749 19.0 67.05 14.152057539731334 20.0 36.47 -159.28226704636884 21.0 37.7 -27.100903709687937 22.0 19.88 171.19978918509 23.0 18.58 57.582258410647725 24.0 6.96 94.30885307853349 25.0 20.54 -6.6463104235175505 26.0 24.15 -110.98192491684047 27.0 7.39 -179.62226877351307 28.0 11.79 129.14468702248757 29.0 7.7 20.282705947631143 30.0 2.76 157.39150632243712 31.0 4.08 124.38913732290172 32.0 0.31 115.16451682129545 33.0 4.26 -110.69544601927504 34.0 9.67 111.66947427099744 35.0 9.89 -78.0941474763312 36.0 1.4 81.93296470370771 37.0 0.82 61.822146094615825 38.0 2.14 -96.25690958197829 39.0 2.04 174.40835283782258 40.0 0.29 30.59594625998596 41.0 3.67 114.93533370324313 42.0 9.46 -27.215495268714104 43.0 3.89 -133.04080002937715
f44 0 8192 9  1.0 669.35 145.47398418371603 2.0 573.95 64.97341396783534 3.0 741.17 51.8526804593395 4.0 2490.0 -99.06440277811934 5.0 351.41 -19.938931270552647 6.0 543.34 148.56795627742247 7.0 568.58 -68.98411853375111 8.0 129.62 73.62507667431078 9.0 33.1 -4.354479242994256 10.0 13.97 -124.96209511803254 11.0 23.56 84.85504945887493 12.0 42.57 -161.7459855654314 13.0 13.48 122.15460192189153 14.0 31.98 -87.71983843452904 15.0 20.34 -50.8786522076171 16.0 7.75 89.78248649700001 17.0 15.92 -9.453803619658585
f93 0 8192 9  1.0 1799.0 -127.368517857582 2.0 487.78 -59.35842757555329 3.0 305.57 -146.56260399446455 4.0 142.42 -81.64648580614231
f91 0 8192 9  1.0 2119.0 57.41037107210849 2.0 552.98 88.12090889112062 3.0 157.49 -158.42283035367265 4.0 54.88 -172.91866257048247
f22 0 8192 9  1.0 2135.86 42.91453885529866 2.0 1738.4 80.72975333393299 3.0 1705.93 124.50372888192788 4.0 1287.75 108.74738951583025 5.0 671.27 165.47021123378175 6.0 579.35 72.02079484794447 7.0 2337.0 53.915328521810466 8.0 94.11 -59.07194867798787 9.0 728.12 -76.547161429478 10.0 149.47 -172.63218367291705 11.0 807.59 -162.14705602202298 12.0 341.38 -59.93138537068411 13.0 256.66 52.31104669544416 14.0 43.77 -45.43555315387429 15.0 15.19 146.21882931738608 16.0 46.37 56.78011749746458 17.0 58.91 -36.21093265226803 18.0 42.64 102.50214954890427 19.0 69.95 -16.32929716122846 20.0 63.63 95.34017710976897 21.0 6.98 -84.51127478179643 22.0 8.9 121.00868633162987 23.0 29.73 -101.41352973815572 24.0 25.45 -8.766254265501596 25.0 7.17 11.745634800181875 26.0 10.33 154.3548300082438 27.0 11.53 -0.40107045659157625 28.0 6.19 135.5045185484397 29.0 3.29 -147.88040692326547 30.0 5.68 -146.84908289203
f37 0 8192 9  1.0 2158.46 -105.93989631968921 2.0 1968.78 -99.63736057325018 3.0 1477.01 -78.4379221534097 4.0 1260.0 -25.553917662834717 5.0 2335.0 -165.12643655670325 6.0 785.25 -14.2666490987575 7.0 495.4 2.4637185190625397 8.0 598.2 145.30209684517678 9.0 101.68 -40.90918657234077 10.0 11.42 18.22005788516018 11.0 32.72 -175.43967686905808 12.0 57.96 -128.28525032979132 13.0 34.87 -40.45082033623612 14.0 67.55 109.32034731096107 15.0 33.05 57.41037107210849 16.0 47.69 -1.6615776058793876 17.0 18.13 26.92901637114869 18.0 10.41 -131.83758865960243 19.0 6.27 169.65280313823678 20.0 21.67 32.31481964537843
f75 0 8192 9  1.0 2234.0 73.85425979236311 2.0 296.18 30.939720937064454 3.0 1089.83 50.59217331005169 4.0 359.34 169.2517326816452 5.0 325.68 -22.91831180523293 6.0 99.47 95.45476866879515 7.0 68.6 28.07493196141034
f11 0 8192 9  1.0 2350.29 80.90164067247224 2.0 3685.0 140.26006824802553 3.0 1269.64 109.77871354706573 4.0 667.98 20.7410721837358 5.0 2673.2 -27.387382607253347 6.0 2553.07 -119.74817918234206 7.0 3073.28 38.674651171330574 8.0 688.46 177.38773337250285 9.0 309.06 166.78801416258264 10.0 487.04 -138.25471596506765 11.0 130.76 -104.67938917040141 12.0 192.71 -19.82433971152648 13.0 201.65 -170.51223983093297 14.0 96.92 168.39229598894894 15.0 50.36 170.45494405141991 16.0 107.29 -60.16056848873644 17.0 59.24 -52.482934033983405 18.0 100.76 -154.64130890580918 19.0 30.89 141.74975851536567 20.0 14.39 53.456962285705806 21.0 7.12 139.0568568782508 22.0 15.99 69.6716678879081 23.0 5.85 1.432394487827058 24.0 3.62 93.44941638583727 25.0 1.14 -20.168114388604977 26.0 4.93 143.98429391637586 27.0 3.3 -169.19443690213208 28.0 1.51 -107.9452486026471 29.0 1.5 137.22339193383218 30.0 4.05 -116.99798176571409 31.0 3.28 -52.196455136418 32.0 5.28 -119.00333404867199 33.0 9.12 154.6986046853223 34.0 3.62 110.06519244463115 35.0 2.58 157.39150632243712 36.0 1.66 37.757918699121255 37.0 2.58 1.1459155902616465 38.0 2.05 -171.08519762606383 39.0 5.91 126.1080107082942 40.0 3.81 104.85127650894066
f48 0 8192 9  1.0 2413.0 70.24462568303893 2.0 1560.12 131.66570132106318 3.0 1554.61 30.42405892144671 4.0 463.45 95.16828977122974 5.0 296.24 164.15240830498087 6.0 290.69 -124.38913732290172 7.0 118.39 132.06677177765476 8.0 207.22 -176.9866629159113 9.0 31.65 42.34158106016784 10.0 157.15 24.465297852086152 11.0 65.09 -15.584452027558392 12.0 88.39 -136.87961725675368 13.0 29.45 -110.75274179878814 14.0 65.68 -44.919891138256546 15.0 26.53 27.84574884335801
f17 0 8192 9  1.0 2510.16 -164.66807032059862 2.0 953.18 2.0626480624709633 3.0 751.29 -56.26445548184684 4.0 453.99 -6.990085100596044 5.0 1993.43 -67.15065358933248 6.0 403.69 -136.47854680016212 7.0 2393.37 -1.088619810748564 8.0 3009.0 177.27314181347668 9.0 63.07 -24.293410513546903 10.0 494.43 -33.17425633807466 11.0 550.53 153.3235059770083 12.0 334.75 3.6096341093241864 13.0 136.26 59.81679381165795 14.0 68.44 -61.478371417537325 15.0 150.62 -129.20198280200063 16.0 175.39 20.97025530178813 17.0 72.94 -36.66929888837269 18.0 137.64 -125.70694025170262 19.0 131.43 -45.49284893338737 20.0 72.96 -98.8925154395801 21.0 37.04 135.96288478454437 22.0 33.23 -109.6068262085265 23.0 14.82 95.56936022782132 24.0 18.95 8.250592249883853 25.0 52.57 -110.98192491684047 26.0 25.83 -83.82372542763945 27.0 7.49 118.6595593715935 28.0 19.75 -10.542423430407146 29.0 17.93 -47.38360965731908 30.0 18.12 -109.66412198803955 31.0 2.82 147.65122380521316 32.0 3.8 -147.76581536423933 33.0 9.08 -167.99122553235736 34.0 12.51 2.9793805346802804
f82 0 8192 9  1.0 2611.0 72.93752732015379 2.0 1804.06 50.70676486907786 3.0 186.76 105.59612164261073 4.0 159.62 121.69623568578685 5.0 73.3 78.1514432558443 6.0 154.26 123.70158796874472
f62 0 8192 9  1.0 2720.0 -132.06677177765476 2.0 1044.21 -107.02851613043778 3.0 1238.19 -28.81977709508041 4.0 1356.16 -122.67026393750925 5.0 221.37 97.68930406980537 6.0 550.26 178.99201519886918 7.0 131.26 -11.459155902616464 8.0 193.95 23.49126960036375 9.0 112.29 -148.85443517498788 10.0 166.32 -148.45336471839633
f55 0 8192 9  1.0 2728.15 -128.80091234540907 2.0 3145.94 -37.47143980155584 3.0 4090.0 -115.27910838032165 4.0 2791.93 -166.15776058793872 5.0 824.64 -86.45933128524123 6.0 48.12 5.557690612768986 7.0 596.07 76.71904876801723 8.0 316.16 48.81600414514613 9.0 198.83 137.1660961543191 10.0 151.27 170.68412716947225 11.0 133.52 17.647100090029355 12.0 170.83 -173.94998660171794
f77 0 8192 9  1.0 2852.0 -119.80547496185515 2.0 637.09 -36.49741154983344 3.0 774.6 65.37448442442692 4.0 277.01 -79.12547150756669 5.0 912.24 -174.12187394025716 6.0 141.81 155.21426670094002 7.0 246.47 -73.33859777674537
f84 0 8192 9  1.0 3015.0 -101.47082551766879 2.0 409.84 -80.042203979776 3.0 171.95 -153.26621019749518 4.0 201.62 109.49223464950032 5.0 78.33 -87.60524687550286
f39 0 8192 9  1.0 3110.65 -139.6871104528947 2.0 3300.08 -95.9131349048998 3.0 3757.0 -118.2584889150019 4.0 2775.07 -60.38975160678877 5.0 391.19 -168.67877488651433 6.0 1637.93 22.230762451075943 7.0 902.69 -159.0530839283165 8.0 473.19 -40.508116115749196 9.0 121.04 110.4662629012227 10.0 122.22 -161.51680244737906 11.0 79.99 1.2032113697747289 12.0 95.37 164.89725343865092 13.0 103.08 -15.29797312999298 14.0 63.62 -65.94744221955776 15.0 32.52 -147.8231111437524 16.0 51.82 -77.57848546071348 17.0 44.32 -102.50214954890427 18.0 8.5 95.34017710976897 19.0 27.33 -41.4821443674716
f33 0 8192 9  1.0 3223.0 85.82907771059732 2.0 228.14 -172.57488789340394 3.0 763.62 -105.93989631968921 4.0 608.84 -89.15223292235609 5.0 1631.17 45.55014471290045 6.0 141.02 162.4335349195884 7.0 581.96 70.0154425649866 8.0 447.45 157.1623232043848 9.0 608.12 -96.77257159759604 10.0 75.22 141.46327961780025 11.0 79.78 -36.44011577032036 12.0 32.11 -40.27893299769687 13.0 46.68 172.63218367291705 14.0 73.56 114.99262948275624 15.0 37.67 60.90541362240651 16.0 68.7 -89.55330337894766 17.0 24.05 125.64964447218954 18.0 27.19 141.46327961780025 19.0 32.61 56.89470905649075 20.0 31.53 71.84890750940524 21.0 14.2 -134.01482828109954 22.0 48.51 151.49004103258966
f24 0 8192 9  1.0 3252.0 -100.32490992740715 2.0 2256.36 158.1363514561072 3.0 1084.91 -40.56541189526229 4.0 852.38 -7.448451336700702 5.0 1180.65 -0.40107045659157625 6.0 1011.04 162.7773095966669 7.0 1659.94 85.14152835644033 8.0 339.38 -72.65104842258839 9.0 1164.31 29.278143331185067 10.0 372.21 -41.13836969039311 11.0 313.46 155.09967514191385 12.0 129.45 91.32947254385323 13.0 58.0 -117.05527754522718 14.0 26.69 -143.01026566465347 15.0 30.66 -16.615776058793873 16.0 39.16 117.28446066327953 17.0 47.95 152.9224355204167 18.0 52.72 -128.51443344784363 19.0 26.13 -148.91173095450097 20.0 10.08 -132.1813633366809 21.0 21.6 89.09493714284301 22.0 15.84 -38.330876494252074 23.0 31.73 -131.15003930544546 24.0 2.87 -99.00710699860626 25.0 10.95 -12.948846169956605 26.0 8.4 76.77634454753031 27.0 7.41 -157.39150632243712 28.0 10.86 158.02175989708104
f31 0 8192 9  1.0 3274.75 -78.0941474763312 2.0 3530.88 -57.3530752925954 3.0 3663.0 -143.01026566465347 4.0 1487.72 22.058875112536693 5.0 2130.75 167.18908461917422 6.0 1826.57 80.95893645198532 7.0 279.46 -79.01087994854052 8.0 598.95 69.49978054936886 9.0 478.58 -46.867947641701335 10.0 265.15 -25.210142985756224 11.0 73.18 -79.12547150756669 12.0 41.35 -56.092568143307595 13.0 13.78 159.51145016442118 14.0 60.14 -94.42344463755967 15.0 44.51 69.21330165180345 16.0 45.17 -178.7055363013038 17.0 6.27 157.62068944048949 18.0 11.82 131.20733508495852 19.0 16.59 12.776958831417359 20.0 15.76 44.862595358743455 21.0 16.44 -99.63736057325018 22.0 13.16 20.168114388604977 23.0 2.73 -115.16451682129545 24.0 11.72 98.72062810104086
f28 0 8192 9  1.0 3314.62 158.1363514561072 2.0 3148.08 -81.47459846760306 3.0 691.68 12.146705256773451 4.0 1502.82 119.57629184380282 5.0 2371.46 -1.948056503444799 6.0 3392.0 68.75493541569878 7.0 1137.76 101.70000863572112 8.0 1909.0 40.22163721818379 9.0 1189.75 150.74519589891958 10.0 234.23 -178.18987428568602 11.0 88.19 49.79003239686853 12.0 164.42 93.50671216535035 13.0 40.51 56.550934379412254 14.0 16.51 -66.86417469176708 15.0 57.91 -15.641747807071475 16.0 109.27 -76.60445720899106 17.0 30.81 -9.11002894258009 18.0 64.93 -134.5304902967173 19.0 20.23 133.38457470645562 20.0 58.48 -176.12722622321505 21.0 12.16 30.08028424436822 22.0 20.12 -53.170483388140404 23.0 19.95 -76.43256987045181 24.0 7.16 -79.92761242074984 25.0 8.55 -49.045187263198464
f51 0 8192 9  1.0 3570.0 22.116170892049777 2.0 2293.86 123.98806686631016 3.0 2586.78 -129.6030532585922 4.0 757.93 -89.32412026089534 5.0 1654.62 152.34947772528588 6.0 391.64 176.35640934126738 7.0 182.1 100.78327616351181 8.0 329.74 -9.682986737710912 9.0 193.81 -146.5053082149515 10.0 244.63 155.2715624804531 11.0 43.91 -169.65280313823678 12.0 29.77 51.05053954615635 13.0 47.51 113.50293921541609 14.0 43.62 98.60603654201469
f53 0 8192 9  1.0 3642.28 8.537071147449266 2.0 3816.0 128.80091234540907 3.0 2655.09 -165.41291545426867 4.0 1781.23 64.68693507026994 5.0 2958.01 -61.76485031510275 6.0 95.1 141.3486880587741 7.0 508.87 112.4716151841806 8.0 206.08 39.19031318694831 9.0 216.79 -29.679213787776646 10.0 370.81 77.40659812217422 11.0 186.43 67.37983670738481 12.0 161.66 -110.40896712170964 13.0 176.21 -72.99482309966687
f86 0 8192 9  1.0 3685.0 -81.18811957003766 2.0 1923.79 -141.9216458539049 3.0 375.16 44.11775022507339 4.0 252.76 -133.44187048596874 5.0 105.24 24.12152317500766
f35 0 8192 9  1.0 3753.0 -73.22400621771921 2.0 1008.7 25.038255647216975 3.0 1065.72 -12.261296815799616 4.0 1004.31 146.96367445105616 5.0 3295.21 84.68316212033568 6.0 506.55 17.417916971977025 7.0 1718.45 146.56260399446455 8.0 671.78 30.82512937803829 9.0 233.7 119.06062982818506 10.0 171.07 -24.923664088190808 11.0 26.15 29.965692685342056 12.0 47.75 -81.76107736516848 13.0 63.43 42.742651516759416 14.0 60.46 108.34631905923867 15.0 57.12 -95.6266560073344 16.0 21.8 -100.55409304545947 17.0 30.76 136.70772991821443 18.0 16.56 -90.64192318969623 19.0 16.06 45.206370035821955 20.0 10.58 141.52057539731334 21.0 17.82 -43.602088209455644
f42 0 8192 9  1.0 3756.0 -72.19268218648374 2.0 320.13 -95.97043068441289 3.0 169.36 -18.048170546620934 4.0 1388.33 -111.38299537343204 5.0 678.93 138.7703779806854 6.0 407.95 -152.80784396139055 7.0 511.93 105.88260054017614 8.0 52.78 145.01561794761136 9.0 36.63 -45.7220320514397 10.0 80.39 87.31876797793745 11.0 42.52 175.15319797149266 12.0 36.74 -58.556286662370134 13.0 9.21 -64.62963929075686 14.0 11.23 163.00649271471923 15.0 32.62 -95.74124756636057 16.0 18.0 138.94226531922462 17.0 7.27 125.76423603121569 18.0 17.86 -138.14012440604148
f73 0 8192 9  1.0 3777.0 73.9115555718762 2.0 1118.83 154.46942156726996 3.0 807.02 -64.97341396783534 4.0 86.73 -105.82530476066304 5.0 107.34 -15.2406773504799 6.0 62.0 35.92445375470262 7.0 104.62 10.65701498943331
f79 0 8192 9  1.0 3870.0 101.7573044152342 2.0 1869.63 -1.6615776058793876 3.0 369.6 -129.2592785815137 4.0 101.67 -51.96727201836566 5.0 311.42 63.77020259806063 6.0 204.68 144.61454749101978
f26 0 8192 9  1.0 3875.0 68.12468184105488 2.0 1901.39 117.11257332474027 3.0 564.83 -108.80468529534333 4.0 2137.27 -55.46231456866369 5.0 1508.35 114.19048856957308 6.0 547.83 118.37308047402807 7.0 572.91 71.3332454937875 8.0 429.26 29.163551772158904 9.0 846.08 72.13538640697064 10.0 391.64 18.162762105647097 11.0 466.42 171.88733853924697 12.0 69.51 -55.46231456866369 13.0 38.94 -109.72141776755265 14.0 7.89 -110.75274179878814 15.0 29.43 -162.72001381715378 16.0 18.02 48.70141258611997 17.0 46.6 -102.7313326669566 18.0 23.98 46.753356082675175 19.0 35.04 172.00193009827314 20.0 11.72 99.69465635276323 21.0 10.41 -34.49205926687556 22.0 6.71 61.87944187412891 23.0 5.14 -153.094322858956 24.0 4.73 72.65104842258839 25.0 5.66 113.10186875882451 26.0 18.76 -133.49916626548182 27.0 1.62 103.53347358013976
f64 0 8192 9  1.0 3999.0 -141.978941633418 2.0 3029.67 -31.627270291221446 3.0 941.0 -71.3332454937875 4.0 1055.68 87.20417641891129 5.0 247.29 -107.88795282313401 6.0 173.6 -157.1623232043848 7.0 387.36 10.255944532841735 8.0 178.45 -160.71466153419593 9.0 86.23 -76.26068253191256 10.0 63.14 -162.03246446299678
f88 0 8192 9  1.0 4030.0 100.78327616351181 2.0 2748.93 -23.89234005695533 3.0 571.02 111.55488271197129 4.0 513.53 141.6924627358526 5.0 265.13 -31.111608275603704
f46 0 8192 9  1.0 4218.0 93.56400794486343 2.0 3301.11 63.139949023416726 3.0 874.88 -75.68772473678175 4.0 777.9 -87.77713421404212 5.0 2362.53 75.34395005970325 6.0 1055.36 13.693691303626673 7.0 205.87 -137.22339193383218 8.0 111.24 124.27454576387557 9.0 15.26 59.93138537068411 10.0 97.21 -144.55725171150672 11.0 41.21 116.08124929350477 12.0 10.25 131.37922242349777 13.0 70.95 -142.5518994285488 14.0 31.96 135.84829322551818 15.0 14.7 120.8940947726037
f19 0 8192 9  1.0 4243.0 17.53250853100319 2.0 4200.87 97.40282517223994 3.0 1972.32 118.6595593715935 4.0 3017.49 87.66254265501594 5.0 2108.83 142.83837832611422 6.0 790.26 -60.67623050435417 7.0 1679.66 -46.63876452364901 8.0 686.1 -78.26603481487047 9.0 350.8 -107.20040346897702 10.0 1082.62 136.70772991821443 11.0 197.1 -127.99877143222591 12.0 262.94 58.384399323830884 13.0 321.63 167.4755635167396 14.0 85.57 -20.68377640422272 15.0 125.59 -157.27691476341099 16.0 84.53 -2.7501974166279517 17.0 37.51 161.8605771244576 18.0 59.21 85.25611991546648 19.0 41.63 -139.62981467338162 20.0 42.27 95.56936022782132 21.0 46.89 -139.28603999630312 22.0 8.14 26.92901637114869 23.0 18.0 -162.3762391400753 24.0 40.03 -27.215495268714104 25.0 32.65 38.846538509869816 26.0 11.96 88.40738778868602 27.0 11.04 176.12722622321505 28.0 4.69 -63.541019480008295 29.0 2.43 100.8405719430249 30.0 4.55 -71.2759497142744 31.0 8.91 -132.81161691132482
f57 0 8192 9  1.0 4400.0 98.2049660854231 2.0 748.93 23.433973820850667 3.0 3744.29 -124.15995420484937 4.0 2276.93 -6.302535746439056 5.0 894.34 85.14152835644033 6.0 171.81 35.23690440054563 7.0 430.68 36.26822843178111 8.0 407.02 -65.66096332199233 9.0 21.05 68.75493541569878 10.0 142.1 -126.91015162147734 11.0 227.45 36.612003108859604 12.0 175.04 86.63121862378048
f66 0 8192 9  1.0 4590.0 126.96744740099045 2.0 2736.32 56.436342820386095 3.0 2558.56 8.021409131831525 4.0 604.76 166.9599015011219 5.0 312.45 -60.6189347248411 6.0 239.86 27.559269945792597 7.0 290.14 100.61138882497255 8.0 50.66 -15.29797312999298 9.0 95.19 -60.103272709223354
f59 0 8192 9  1.0 5057.0 97.17364205418761 2.0 955.93 -72.07809062745756 3.0 199.07 -96.54338847954372 4.0 1538.59 86.91769752134589 5.0 143.56 -63.82749837757371 6.0 498.41 -58.84276555993554 7.0 316.37 -69.49978054936886 8.0 388.63 -16.32929716122846 9.0 95.46 120.72220743406447 10.0 78.54 132.63972957278557 11.0 12.35 39.24760896646139
f13 0 8192 9  1.0 5165.0 43.602088209455644 2.0 1634.89 84.51127478179643 3.0 1855.95 169.76739469726294 4.0 670.77 -50.2483986329732 5.0 1414.42 -129.71764481761838 6.0 1411.75 -154.46942156726996 7.0 713.31 -60.9627094019196 8.0 638.34 130.63437728982768 9.0 1417.73 87.94902155258137 10.0 115.85 -96.82986737710912 11.0 65.32 114.59155902616465 12.0 169.85 8.995437383553925 13.0 134.28 43.37290509140332 14.0 268.73 70.35921724206509 15.0 133.73 74.59910492603319 16.0 138.25 81.70378158565539 17.0 74.55 -112.01324894807595 18.0 83.19 -173.66350770415252 19.0 64.86 -88.98034558381684 20.0 81.38 -20.7410721837358 21.0 16.75 -32.142932306839185 22.0 12.15 66.34851267614933 23.0 10.52 53.97262430132355 24.0 7.19 -152.29218194577282 25.0 10.12 -74.02614713090236 26.0 5.94 -44.862595358743455 27.0 12.65 111.95595316856284 28.0 16.41 155.95911183461007 29.0 9.45 -110.81003757830122 30.0 9.93 -80.44327443636757 31.0 17.9 168.44959176846206 32.0 7.88 177.38773337250285 33.0 7.45 84.912345238388 34.0 2.55 107.83065704362093 35.0 1.54 51.738088900313336 36.0 1.84 77.23471078363498 37.0 1.73 153.49539331554755
f15 0 8192 9  1.0 7117.0 95.45476866879515 2.0 2645.16 28.189523520436502 3.0 1612.39 163.75133784838928 4.0 275.27 156.64666118876707 5.0 240.3 -172.05922587778622 6.0 1048.95 74.08344291041544 7.0 1080.19 57.06659639503 8.0 180.47 -0.8021409131831525 9.0 385.91 -48.52952524758073 10.0 175.01 -4.010704565915763 11.0 164.36 -63.541019480008295 12.0 154.34 -24.809072529164645 13.0 287.38 -89.03764136332994 14.0 66.15 -83.6518380891002 15.0 163.09 30.25217158290747 16.0 117.72 88.40738778868602 17.0 20.1 83.6518380891002 18.0 20.83 -84.6258663408226 19.0 30.98 47.44090543683216 20.0 7.51 -33.86180569223165 21.0 9.91 65.89014644004466 22.0 9.61 -117.22716488376642 23.0 5.17 172.91866257048247 24.0 7.42 -125.36316557462413 25.0 2.77 -119.9200665208813 26.0 4.33 -81.30271112906382 27.0 1.97 61.306484078998096 28.0 4.71 -92.41809235460178 29.0 12.53 23.54856537987683 30.0 5.68 143.9269981368628 31.0 6.71 -137.8536455084761 32.0 2.34 99.40817745519783 33.0 3.95 -134.01482828109954 34.0 3.49 138.59849064214615 35.0 5.55 -110.69544601927504 36.0 2.87 133.32727892694257

f0 604800.0

i 22 0.0 -1.0 
i 21 0.0 -1.0 
i 19 0.0 -1.0 

</CsScore>

</CsoundSynthesizer>