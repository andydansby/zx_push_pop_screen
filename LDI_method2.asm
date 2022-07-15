;image must be 224 pixels wide and 192 pixels tall
;data outputted
;gfx
;byte sort priority
;x char
;char line
;y char
;mask
;frame
;interleave line


	org $8000


	
start:  ; ;ld a, data
	ld sp, $c000 ; normal stack location, keep out of bankable
	di
	;transfers a byte of data from the memory location pointed to by hl to the memory location pointed to by de  then hl and de are incremented and bc is decremented
	
point_to_LUT:

	ld (spstore),sp
				;SP points to line address table


; about 18304 t-states to 32 y columns 4 character rows
start_copy:

	;ld a, $20; used to subtract when you get to the end of a row
	
grab_index:
	;ld ix, Pixel_LUT	;Screen start
	;why 16??
	
	;ld	sp, ix
	
	ld	sp, Pixel_LUT
	
	
	;ldi
	;transfers a byte of data from the memory location pointed to by hl to the memory location pointed to by de  then hl and de are incremented and bc is decremented
	
	
	ld hl, data
	; get the address of the data
	ld bc, 3260; the number of pixels to copy
	
	;in incements of 28
	
popit:
	pop de; pops the first address off from the stack
	;10t
	
	;Start dumping the line
	ldi	;01		16t
	ldi	;02		16t
	ldi	;03		16t
	ldi	;04		16t
	ldi	;05		16t
	ldi	;06		16t
	ldi	;07		16t
	ldi	;08		16t
	ldi	;09		16t
	ldi	;10		16t
	ldi	;11		16t
	ldi	;12		16t
	ldi	;13		16t
	ldi	;14		16t
	ldi	;15		16t
	ldi	;16		16t
	ldi	;17		16t
	ldi	;18		16t
	ldi	;19		16t
	ldi	;20		16t
	ldi	;21		16t
	ldi	;22		16t
	ldi	;23		16t
	ldi	;24		16t
	ldi	;25		16t
	ldi	;26		16t
	ldi	;27		16t
	ldi	;28		16t
	;448t

	jp pe,popit	;Loop, continue until BC = 0

	ld sp, (spstore)
ei


endless:
	jp endless


	org $C000
data:
incbin "girl.bin"




Pixel_LUT:
defw $4000
defw $4100
defw $4200
defw $4300
defw $4400
defw $4500
defw $4600
defw $4700
defw $4020
defw $4120
defw $4220
defw $4320
defw $4420
defw $4520
defw $4620
defw $4720
defw $4040
defw $4140
defw $4240
defw $4340
defw $4440
defw $4540
defw $4640
defw $4740
defw $4060
defw $4160
defw $4260
defw $4360
defw $4460
defw $4560
defw $4660
defw $4760
defw $4080
defw $4180
defw $4280
defw $4380
defw $4480
defw $4580
defw $4680
defw $4780
defw $40A0
defw $41A0
defw $42A0
defw $43A0
defw $44A0
defw $45A0
defw $46A0
defw $47A0
defw $40C0
defw $41C0
defw $42C0
defw $43C0
defw $44C0
defw $45C0
defw $46C0
defw $47C0
defw $40E0
defw $41E0
defw $42E0
defw $43E0
defw $44E0
defw $45E0
defw $46E0
defw $47E0
defw $4800
defw $4900
defw $4A00
defw $4B00
defw $4C00
defw $4D00
defw $4E00
defw $4F00
defw $4820
defw $4920
defw $4A20
defw $4B20
defw $4C20
defw $4D20
defw $4E20
defw $4F20
defw $4840
defw $4940
defw $4A40
defw $4B40
defw $4C40
defw $4D40
defw $4E40
defw $4F40
defw $4860
defw $4960
defw $4A60
defw $4B60
defw $4C60
defw $4D60
defw $4E60
defw $4F60
defw $4880
defw $4980
defw $4A80
defw $4B80
defw $4C80
defw $4D80
defw $4E80
defw $4F80
defw $48A0
defw $49A0
defw $4AA0
defw $4BA0
defw $4CA0
defw $4DA0
defw $4EA0
defw $4FA0
defw $48C0
defw $49C0
defw $4AC0
defw $4BC0
defw $4CC0
defw $4DC0
defw $4EC0
defw $4FC0
defw $48E0
defw $49E0
defw $4AE0
defw $4BE0
defw $4CE0
defw $4DE0
defw $4EE0
defw $4FE0
defw $5000
defw $5100
defw $5200
defw $5300
defw $5400
defw $5500
defw $5600
defw $5700
defw $5020
defw $5120
defw $5220
defw $5320
defw $5420
defw $5520
defw $5620
defw $5720
defw $5040
defw $5140
defw $5240
defw $5340
defw $5440
defw $5540
defw $5640
defw $5740
defw $5060
defw $5160
defw $5260
defw $5360
defw $5460
defw $5560
defw $5660
defw $5760
defw $5080
defw $5180
defw $5280
defw $5380
defw $5480
defw $5580
defw $5680
defw $5780
defw $50A0
defw $51A0
defw $52A0
defw $53A0
defw $54A0
defw $55A0
defw $56A0
defw $57A0
defw $50C0
defw $51C0
defw $52C0
defw $53C0
defw $54C0
defw $55C0
defw $56C0
defw $57C0
defw $50E0
defw $51E0
defw $52E0
defw $53E0
defw $54E0
defw $55E0
defw $56E0
defw $57E0


spstore:
	defw	0		;Original SP value