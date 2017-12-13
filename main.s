	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"main.c"
	.text
	.align	2
	.global	goToSplash
	.type	goToSplash, %function
goToSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r0, .L3
	ldr	r3, .L3+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L3+8
	mov	r3, #5376
	mov	r2, #100663296
	ldr	r1, .L3+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L3+16
	ldr	r1, .L3+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #120
	mov	r1, #118
	mov	r2, #124
	mov	r0, #68
	mov	lr, #69
	mov	r9, #106
	mov	r8, #67
	mov	r7, #112
	mov	r6, #60
	mov	r5, #130
	ldr	ip, .L3+24
	strh	r3, [ip, #80]	@ movhi
	strh	r3, [ip, #88]	@ movhi
	strh	r3, [ip, #96]	@ movhi
	strh	r3, [ip, #104]	@ movhi
	strh	r3, [ip, #112]	@ movhi
	strh	r1, [ip, #98]	@ movhi
	mov	r3, #512
	mov	r1, ip
	strh	r2, [ip, #106]	@ movhi
	strh	r0, [ip, #108]	@ movhi
	mov	r2, #117440512
	mov	r0, #3
	strh	r9, [ip, #82]	@ movhi
	strh	r8, [ip, #84]	@ movhi
	strh	r7, [ip, #90]	@ movhi
	strh	r6, [ip, #100]	@ movhi
	strh	r5, [ip, #114]	@ movhi
	strh	lr, [ip, #92]	@ movhi
	strh	lr, [ip, #116]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	mov	r2, #0
	ldr	r0, .L3+28
	ldr	r3, .L3+32
	strh	r0, [r1, #80]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	str	r2, [r3]
	bx	lr
.L4:
	.align	2
.L3:
	.word	splashPal
	.word	loadPalette
	.word	DMANow
	.word	splashTiles
	.word	100726784
	.word	splashMap
	.word	shadowOAM
	.word	8528
	.word	state
	.size	goToSplash, .-goToSplash
	.align	2
	.type	updateLose.part.3, %function
updateLose.part.3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	ldr	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToSplash
.L9:
	.align	2
.L8:
	.word	buttons
	.size	updateLose.part.3, .-updateLose.part.3
	.set	updateWin.part.2,updateLose.part.3
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	mov	r0, #0
	mov	r2, #1
	ldr	r3, .L11
	strh	r0, [r1, #80]	@ movhi
	str	r2, [r3]
	bx	lr
.L12:
	.align	2
.L11:
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #67108864
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, #75
	mov	lr, #62
	mov	r9, #105
	mov	r8, #66
	mov	r7, #111
	mov	r1, #60
	mov	r6, #117
	mov	r2, #70
	mov	r0, #123
	mov	r4, #67
	mov	r5, #129
	ldr	r10, .L15
	strh	r10, [ip, #80]	@ movhi
	ldr	ip, .L15+4
	strh	r3, [ip, #120]	@ movhi
	strh	r3, [ip, #96]	@ movhi
	strh	r3, [ip, #128]	@ movhi
	strh	r3, [ip, #80]	@ movhi
	strh	r3, [ip, #136]	@ movhi
	strh	r9, [ip, #122]	@ movhi
	strh	r8, [ip, #124]	@ movhi
	strh	r7, [ip, #98]	@ movhi
	strh	r1, [ip, #100]	@ movhi
	strh	r6, [ip, #130]	@ movhi
	mov	r3, #512
	strh	r2, [ip, #132]	@ movhi
	strh	r0, [ip, #82]	@ movhi
	mov	r2, #117440512
	strh	r4, [ip, #84]	@ movhi
	strh	r5, [ip, #138]	@ movhi
	ldr	r4, .L15+8
	strh	lr, [ip, #140]	@ movhi
	mov	r1, ip
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L15+12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	str	r2, [r3]
	bx	lr
.L16:
	.align	2
.L15:
	.word	8528
	.word	shadowOAM
	.word	DMANow
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L25
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+4
	mov	lr, pc
	bx	r3
	ldr	r2, .L25+8
	ldr	r3, .L25+12
	ldr	r2, [r2]
	smull	r0, r1, r3, r2
	mov	r3, r2, asr #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, asl #1
	ldreq	r3, .L25+16
	ldmeqia	r3, {r1, r2}
	addeq	r1, r1, #1
	addeq	r2, r2, #1
	stmeqia	r3, {r1, r2}
	ldr	r3, .L25+20
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L17
	ldr	r3, .L25+24
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L24
.L17:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L24:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L26:
	.align	2
.L25:
	.word	update
	.word	pixelate
	.word	timer
	.word	1717986919
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.size	updateGame, .-updateGame
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L41
	ldr	r3, [r3]
	tst	r3, #8
	stmfd	sp!, {r4, lr}
	beq	.L28
	ldr	r2, .L41+4
	ldr	r2, [r2]
	ands	r2, r2, #8
	moveq	ip, #67108864
	moveq	r0, #1
	ldreq	r1, .L41+8
	streqh	r2, [ip, #80]	@ movhi
	streq	r0, [r1]
.L28:
	tst	r3, #4
	beq	.L29
	ldr	r3, .L41+4
	ldr	r3, [r3]
	tst	r3, #4
	beq	.L40
.L29:
	ldr	r2, .L41+12
	ldr	r3, .L41+16
	ldr	r1, [r2]
	smull	r2, r3, r1, r3
	mov	r2, r1, asr #31
	add	r3, r3, r1
	rsb	r3, r2, r3, asr #3
	rsb	r3, r3, r3, lsl #4
	cmp	r1, r3
	bne	.L27
	ldr	r1, .L41+20
	ldr	r2, [r1]
	subs	r2, r2, #1
	movmi	r2, #16
	rsbpl	r3, r2, #16
	orrpl	r3, r2, r3, asl #8
	strpl	r2, [r1]
	movmi	r3, r2
	strmi	r2, [r1]
	mov	r2, #67108864
	movpl	r3, r3, asl #16
	movpl	r3, r3, lsr #16
	strh	r3, [r2, #82]	@ movhi
.L27:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L40:
	bl	goToSplash
	b	.L29
.L42:
	.align	2
.L41:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	timer
	.word	-2004318071
	.word	.LANCHOR1
	.size	updatePause, .-updatePause
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r2, #0
	ldr	r0, .L45
	ldr	r3, .L45+4
	stmfd	sp!, {r4, lr}
	strh	r0, [r1, #80]	@ movhi
	ldr	r0, .L45+8
	ldr	r1, .L45+12
	str	r2, [r3]
	str	r2, [r3, #4]
	ldr	r4, .L45+16
	mov	lr, pc
	bx	r1
	mov	r3, #1744
	mov	r2, #100663296
	ldr	r1, .L45+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L45+24
	ldr	r1, .L45+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L45+32
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L46:
	.align	2
.L45:
	.word	8528
	.word	.LANCHOR0
	.word	smileyPal
	.word	loadPalette
	.word	DMANow
	.word	smileyTiles
	.word	100726784
	.word	smileyMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	updateWin
	.type	updateWin, %function
updateWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L49
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	updateWin.part.2
.L50:
	.align	2
.L49:
	.word	oldButtons
	.size	updateWin, .-updateWin
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r2, #0
	ldr	ip, .L53
	ldr	r0, .L53+4
	ldr	r3, .L53+8
	stmfd	sp!, {r4, lr}
	strh	ip, [r1, #80]	@ movhi
	strh	r0, [r1, #82]	@ movhi
	ldr	r0, .L53+12
	ldr	r1, .L53+16
	str	r2, [r3]
	str	r2, [r3, #4]
	ldr	r4, .L53+20
	mov	lr, pc
	bx	r1
	mov	r3, #1616
	mov	r2, #100663296
	ldr	r1, .L53+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L53+28
	ldr	r1, .L53+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L53+36
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
	.word	8528
	.word	2821
	.word	.LANCHOR0
	.word	gameOverPal
	.word	loadPalette
	.word	DMANow
	.word	gameOverTiles
	.word	100726784
	.word	gameOverMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	updateLose
	.type	updateLose, %function
updateLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L58
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L58+8
	ldr	r3, [r3]
	tst	r3, #8
	ldmnefd	sp!, {r4, lr}
	bne	updateLose.part.3
.L55:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	updateAliens
	.word	pixelateAliens
	.word	oldButtons
	.size	updateLose, .-updateLose
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L64
.L61:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L61
	stmfd	sp!, {r4, lr}
	mov	r3, #512
	ldr	r4, .L64+4
	mov	r2, #117440512
	ldr	r1, .L64
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	shadowOAM
	.word	DMANow
	.size	hideSprites, .-hideSprites
	.align	2
	.global	updateSplash
	.type	updateSplash, %function
updateSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, .L80
	ldr	r3, .L80+4
	ldr	r1, [r5]
	smull	r2, r3, r1, r3
	mov	r2, r1, asr #31
	add	r3, r3, r1
	ldr	r4, .L80+8
	rsb	r3, r2, r3, asr #4
	rsb	r3, r3, r3, lsl #4
	cmp	r1, r3, asl #1
	ldr	r3, [r4, #8]
	addeq	r3, r3, #1
	streq	r3, [r4, #8]
	tst	r3, #1
	str	r0, [r4]
	str	r0, [r4, #4]
	beq	.L69
	bl	hideSprites
.L70:
	ldr	r3, .L80+12
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L71
	ldr	r3, .L80+16
	ldr	r3, [r3]
	ands	r6, r3, #8
	beq	.L79
.L71:
	ldr	r2, [r5]
	ldr	r3, .L80+20
	smull	r0, r1, r3, r2
	mov	r3, r2, asr #31
	rsb	r3, r3, r1, asr #1
	add	r3, r3, r3, lsl #2
	cmp	r2, r3
	bne	.L66
	ldr	r1, [r4, #8]
	tst	r1, #1
	movne	r1, #16
	ldr	r2, .L80+24
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	rsbeq	r2, r3, #16
	orreq	r3, r3, r2, asl #8
	movne	r3, r1
	strne	r1, [r2]
	mov	r2, #67108864
	moveq	r3, r3, asl #16
	moveq	r3, r3, lsr #16
	strh	r3, [r2, #82]	@ movhi
.L66:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L69:
	bl	goToSplash
	b	.L70
.L79:
	ldr	r3, .L80+28
	mov	lr, pc
	bx	r3
	bl	hideSprites
	mov	r1, #67108864
	mov	r2, #1
	ldr	r3, .L80+32
	strh	r6, [r1, #80]	@ movhi
	str	r2, [r3]
	b	.L71
.L81:
	.align	2
.L80:
	.word	timer
	.word	-2004318071
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	1717986919
	.word	.LANCHOR1
	.word	initGame
	.word	state
	.size	updateSplash, .-updateSplash
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r7, fp, lr}
	mov	r2, #4352
	mov	r4, #67108864
	mov	r3, #7936
	ldr	r5, .L96
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	ldr	r2, .L96+4
	mov	r3, #256
	ldr	r1, .L96+8
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r2, .L96+12
	ldr	r1, .L96+16
	mov	r0, #3
	mov	r3, #2400
	mov	lr, pc
	bx	r5
	ldr	r3, .L96+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L96+24
	mov	lr, pc
	bx	r3
	ldr	r7, .L96+28
	ldr	r10, .L96+32
	ldr	r9, .L96+36
	ldr	fp, .L96+40
	ldr	r6, .L96+44
	ldr	r5, .L96+48
	ldr	r8, .L96+52
.L90:
	ldr	r2, [r7]
	str	r2, [r10]
	ldr	r3, [r9]
	ldr	r1, [r4, #304]
	str	r1, [r7]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L83
.L85:
	.word	.L84
	.word	.L86
	.word	.L87
	.word	.L88
	.word	.L89
.L89:
	tst	r2, #8
	bne	.L95
.L83:
	ldrh	r3, [r6, #4]
	ldrh	r2, [r6]
	strh	r2, [r4, #16]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	mov	lr, pc
	bx	r8
	b	.L90
.L88:
	ldr	r3, .L96+56
	mov	lr, pc
	bx	r3
	b	.L83
.L87:
	ldr	r3, .L96+60
	mov	lr, pc
	bx	r3
	b	.L83
.L84:
	mov	lr, pc
	bx	fp
	b	.L83
.L86:
	ldr	r3, .L96+64
	mov	lr, pc
	bx	r3
	b	.L83
.L95:
	ldr	r3, .L96+68
	mov	lr, pc
	bx	r3
	b	.L83
.L97:
	.align	2
.L96:
	.word	DMANow
	.word	83886592
	.word	spaceSprites1Pal
	.word	100728832
	.word	spaceSprites1Tiles
	.word	hideSprites
	.word	goToSplash
	.word	buttons
	.word	oldButtons
	.word	state
	.word	updateSplash
	.word	.LANCHOR0
	.word	timer
	.word	waitForVblank
	.word	updateLose
	.word	updatePause
	.word	updateGame
	.word	updateWin.part.2
	.size	main, .-main
	.text
	.align	2
	.global	delay
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	rsb	r3, r0, r0, lsl #5
	add	r0, r0, r3, lsl #2
	mov	r0, r0, asl #3
	sub	sp, sp, #8
	cmp	r0, r2
	str	r2, [sp, #4]
	ble	.L98
.L100:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r0
	str	r3, [sp, #4]
	bne	.L100
.L98:
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	delay, .-delay
	.comm	timer,4,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.global	signal
	.global	vOff
	.global	hOff
	.comm	state,4,4
	.global	ghost_blend
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	ghost_blend, %object
	.size	ghost_blend, 4
ghost_blend:
	.word	16
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	signal, %object
	.size	signal, 4
signal:
	.space	4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
