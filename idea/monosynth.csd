<CsoundSynthesizer>
<CsOptions>

; instr 130 always on - uses lineto for envelope - max two keys pressed at once
-+K -+Om0d+M -+P ; CsoundAV
;-M0 -odac ; other Csounds, add -b1000 for flCsound

</CsOptions>
<CsInstruments>

sr	= 44100	
kr	= 4410	
ksmps	= 10
nchnls	= 1

gknum	init	0

	instr 128 ; dummy

	endin

	instr 129

knotes	init	0
kstatus, kchan, kb1, kb2	midiin
	if kstatus == 144 goto on
	if kstatus == 128 goto off
	goto fin
on:
	if kb2 == 0 goto off
knum2	=	gknum
gknum	=	kb1
	if knotes > 0 goto skip
gkval	=	5000
gkglit	=	.05 ; variable attack time
skip:
knotes	=	knotes + 1
	goto fin
off:	if knotes > 1 goto contin
gkval	=	0
gkglit	=	.5 ; variable release time
	goto last
contin:
gknum	=	(kb1 == gknum? knum2: gknum)
last:
knotes	=	(knotes > 0? knotes - 1: knotes)

fin:	endin

	instr 130

kamp	lineto	gkval, gkglit
asig	lfo	kamp, cpsoct((gknum / 12) + 3)
	out	asig

	endin

</CsInstruments>
<CsScore>

i129 0 3600
i130 0 3600
e

</CsScore>
</CsoundSynthesizer>