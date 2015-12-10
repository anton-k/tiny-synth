<CsoundSynthesizer>
<CsOptions>

; instr 130 always on - uses lineto for envelope - max two keys pressed at once
;-+K -+Om0d+M -+P ; CsoundAV
-M0 -odac ; other Csounds, add -b1000 for flCsound

</CsOptions>
<CsInstruments>

sr	= 44100	
kr	= 4410
ksmps	= 10
nchnls	= 1

gknum	init	0
gknotes	init	0

	instr 128 ; dummy

	endin

	instr 129

kstatus, kchan, kb1, kb2	midiin
	if kstatus == 144 goto on
	if kstatus == 128 goto off
	goto fin
on:
	if kb2 == 0 goto off
knum2	=	gknum
gknum	=	kb1
	if gknotes > 1 goto skip
gkval	=	1
gkglit	=	.05 ; variable attack time
skip:
gknotes	=	gknotes + 1
	goto fin
off:	if gknotes > 1 goto contin
gkval	=	0
gkglit	=	.5 ; variable release time
	goto last
contin:
gknum	=	(kb1 == gknum? knum2: gknum)
last:
gknotes	=	(gknotes > 0? gknotes - 1: gknotes)

fin:	endin

	instr 130

kamp	lineto	gkval * 512, gkglit
kamp	table	kamp, 1
kfreq	=	cpsoct((gknum / 12) + 3)
kport	=	.2 ; variable glide time
kfreq	lineto	kfreq, (gknotes == 1? .02: kport)
asig	lfo	kamp * 5000, kfreq
	out	asig

	endin

</CsInstruments>
<CsScore>

f1 0 512 16 1 511 2.2 1000 ; loudness curve - do not change
i129 0 3600
i130 0 3600
e

</CsScore>
</CsoundSynthesizer>