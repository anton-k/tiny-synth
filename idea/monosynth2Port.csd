<CsoundSynthesizer>
<CsOptions>

; instr 130 gated - uses linsegr for envelope - max two keys pressed at once
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
	schedkwhen	1, 0, 0, 130, 0, -1
skip:
knotes	=	knotes + 1
	goto fin
off:	if knotes > 1 goto contin
	schedkwhen	1, 0, 0, -130, 0, 0
	goto last
contin:
gknum	=	(kb1 == gknum? knum2: gknum)
last:
knotes	=	(knotes > 0? knotes - 1: knotes)

fin:	endin

	instr 130

iatt	=	.05 ; variable attack time
irel	=	.5 ; variable release time
kamp	linsegr	0, iatt, 5000, .1, 5000, irel, 0
kfreq	=	cpsoct((gknum / 12) + 3)
kport	=	.2 ; variable glide time
kfreq	lineto	kfreq, kport
asig	lfo	kamp, kfreq
	out	asig

	endin

</CsInstruments>
<CsScore>

f 1 0 512 16 1 511 2.2 1000
i129 0 3600
e

</CsScore>
</CsoundSynthesizer>