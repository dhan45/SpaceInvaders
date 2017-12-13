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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r1, #4352
	mov	r3, #67108864
	mov	r2, #7936
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r0, .L20
	ldr	r3, .L20+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L20+8
	mov	r3, #400
	mov	r2, #100663296
	ldr	r1, .L20+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L20+16
	ldr	r1, .L20+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r10, #8
	mov	ip, #50
	mov	fp, #13
	ldr	r3, .L20+24
	ldr	r0, [r3]
	ldr	r7, .L20+28
	ldr	r1, .L20+32
	add	lr, r0, #1
	ldr	r2, .L20+36
	str	lr, [r3]
	str	ip, [r1]
	mov	lr, pc
	bx	r2
	mov	ip, r10
	stmia	r7, {r10, fp}
	mov	r10, #152
	str	r10, [r7, #8]
	mov	r10, #114
	mov	r8, #0
	mov	r9, #1
	ldr	r3, .L20+40
	str	r10, [r7, #12]
	mov	r10, #3
	mov	r6, r8
	mov	r0, r9
	mov	r2, r3
	mov	r1, #44
	mov	r5, #24
	mov	r4, #4
	mov	lr, #40
	str	r10, [r7, #32]
	str	r8, [r7, #16]
	str	r8, [r7, #20]
	str	r9, [r7, #36]
.L2:
	str	r1, [r2, #12]
	add	r1, r1, #16
	cmp	r1, #204
	str	ip, [r2]
	str	ip, [r2, #4]
	str	r5, [r2, #8]
	str	r4, [r2, #16]
	str	r0, [r2, #20]
	str	lr, [r2, #24]
	str	r6, [r2, #28]
	str	r0, [r2, #36]
	add	r2, r2, #40
	bne	.L2
	mov	r0, #0
	mov	r8, #8
	mov	r7, r0
	mov	r6, #11
	mov	r5, #4
	mov	ip, #1
	mov	r4, #20
	ldr	r1, .L20+40
	ldr	lr, .L20+44
.L3:
	smull	r2, r9, lr, r0
	mov	r2, r0, asr #31
	rsb	r2, r2, r9, asr #2
	add	r9, r2, r2, lsl #2
	sub	r9, r0, r9, asl #1
	mov	r9, r9, asl #4
	mov	r2, r2, asl #4
	add	r0, r0, #1
	add	r9, r9, #42
	add	r2, r2, #40
	cmp	r0, #20
	str	r8, [r1, #400]
	str	r6, [r1, #404]
	str	r5, [r1, #416]
	str	ip, [r1, #420]
	str	r4, [r1, #424]
	str	r7, [r1, #428]
	str	ip, [r1, #436]
	str	r9, [r1, #412]
	str	r2, [r1, #408]
	add	r1, r1, #40
	bne	.L3
	mov	r0, #0
	mov	r8, #8
	mov	r7, #12
	mov	r6, #4
	mov	lr, #1
	mov	r5, #10
	ldr	r4, .L20+44
.L4:
	smull	r2, r1, r4, r0
	mov	r2, r0, asr #31
	rsb	r1, r2, r1, asr #2
	add	r2, r1, r1, lsl #2
	sub	r2, r0, r2, asl #1
	mov	ip, r1, asl #4
	mov	r2, r2, asl #4
	add	r0, r0, #1
	add	r2, r2, #42
	add	ip, ip, #72
	cmp	r0, #20
	str	r1, [r3, #1228]
	str	r2, [r3, #1212]
	str	ip, [r3, #1208]
	str	r8, [r3, #1200]
	str	r7, [r3, #1204]
	str	r6, [r3, #1216]
	str	lr, [r3, #1220]
	str	r5, [r3, #1224]
	str	lr, [r3, #1236]
	mov	ip, #8
	add	r3, r3, #40
	mov	r1, #4
	mov	r2, #1
	bne	.L4
	mov	r0, #0
	mov	r4, #16
	mov	r8, #184
	mvn	r7, #0
	mov	r6, #240
	ldr	lr, .L20+48
	ldr	r5, [lr]
	ldr	r3, .L20+52
	cmp	r5, r0
	str	r4, [r3, #4]
	str	ip, [r3]
	str	r4, [r3, #8]
	str	r2, [r3, #32]
	str	r8, [r3, #12]
	str	r7, [r3, #20]
	str	r6, [r3, #24]
	str	r0, [r3, #16]
	str	r0, [r3, #36]
	ble	.L9
	mvn	ip, #1
	ldr	r3, .L20+56
	cmp	r5, #1
	str	ip, [r3, #16]
	stmia	r3, {r1, r2}
	str	r0, [r3, #20]
	str	r0, [r3, #24]
	beq	.L9
	str	r1, [r3, #28]
	str	r2, [r3, #32]
	str	ip, [r3, #44]
	str	r0, [r3, #48]
	str	r0, [r3, #52]
.L9:
	ldr	r2, [lr, #4]
	cmp	r2, #0
	ble	.L1
	mov	lr, #7
	mov	ip, #3
	mov	r0, #2
	mov	r1, #0
	ldr	r3, .L20+60
	rsb	r2, r2, r2, lsl #3
	add	r2, r3, r2, lsl #2
.L10:
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #24]
	add	r3, r3, #28
	cmp	r2, r3
	bne	.L10
.L1:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	bgPal
	.word	loadPalette
	.word	DMANow
	.word	bgTiles
	.word	100726784
	.word	bgMap
	.word	counter
	.word	player
	.word	aliensRemaining
	.word	srand
	.word	alien
	.word	1717986919
	.word	.LANCHOR0
	.word	bonus
	.word	pBullet
	.word	aBullet
	.size	initGame, .-initGame
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L42
	ldr	r2, [r3, #12]
	sub	r1, r2, #1
	cmp	r1, #237
	movhi	r0, #0
	str	lr, [sp, #-4]!
	strhi	r0, [r3, #20]
	ldr	r0, .L42+4
	ldr	r0, [r0]
	tst	r0, #1
	beq	.L24
	ldr	r0, .L42+8
	ldr	r0, [r0]
	tst	r0, #1
	bne	.L24
	ldr	r1, .L42+12
	ldr	ip, [r1]
	cmp	ip, #0
	ble	.L22
	ldr	r1, .L42+16
	ldr	r0, [r1, #24]
	cmp	r0, #0
	beq	.L27
	cmp	ip, #1
	beq	.L22
	ldr	r0, [r1, #52]
	cmp	r0, #0
	bne	.L22
	mov	r0, #1
.L27:
	mov	lr, #1
	ldr	ip, [r3, #4]
	rsb	r0, r0, r0, lsl #3
	ldr	r3, [r3, #8]
	add	ip, ip, ip, lsr #31
	add	r1, r1, r0, lsl #2
	add	r2, r2, ip, asr lr
	str	lr, [r1, #24]
	str	r3, [r1, #8]
	str	r2, [r1, #12]
	ldr	lr, [sp], #4
	bx	lr
.L24:
	mov	r0, #67108864
	ldr	ip, [r0, #304]
	tst	ip, #32
	beq	.L41
	ldr	r1, [r0, #304]
	tst	r1, #16
	moveq	r1, #1
	addeq	r2, r2, r1
	streq	r2, [r3, #12]
	streq	r1, [r3, #20]
.L22:
	ldr	lr, [sp], #4
	bx	lr
.L41:
	mvn	r2, #0
	str	r1, [r3, #12]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L43:
	.align	2
.L42:
	.word	player
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	pBullet
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	playerShoot
	.type	playerShoot, %function
playerShoot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L53
	ldr	r1, [r3]
	cmp	r1, #0
	str	lr, [sp, #-4]!
	ble	.L44
	ldr	r3, .L53+4
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L47
	cmp	r1, #1
	beq	.L44
	ldr	r2, [r3, #52]
	cmp	r2, #0
	beq	.L48
.L44:
	ldr	lr, [sp], #4
	bx	lr
.L48:
	mov	r2, #1
.L47:
	mov	lr, #1
	ldr	ip, .L53+8
	ldr	r1, [ip, #4]
	ldr	r0, [ip, #12]
	rsb	r2, r2, r2, lsl #3
	ldr	ip, [ip, #8]
	add	r1, r1, r1, lsr #31
	add	r3, r3, r2, lsl #2
	add	r1, r0, r1, asr lr
	str	lr, [r3, #24]
	str	ip, [r3, #8]
	str	r1, [r3, #12]
	ldr	lr, [sp], #4
	bx	lr
.L54:
	.align	2
.L53:
	.word	.LANCHOR0
	.word	pBullet
	.word	player
	.size	playerShoot, .-playerShoot
	.align	2
	.global	collision
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #36]
	cmp	r3, #0
	beq	.L57
	ldr	ip, [r1, #8]
	ldr	r3, [r1]
	ldr	r2, [r0, #8]
	add	r3, ip, r3
	cmp	r2, r3
	bgt	.L60
	ldr	r3, [r0]
	add	r2, r2, r3
	cmp	ip, r2
	bgt	.L60
	ldr	r2, [r0, #12]
	ldr	ip, [r0, #4]
	ldr	r3, [r1, #12]
	add	ip, r2, ip
	cmp	ip, r3
	blt	.L60
	ldr	r0, [r1, #4]
	add	r3, r3, r0
	cmp	r2, r3
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L57:
	mov	r0, r3
	bx	lr
.L60:
	mov	r0, #0
	bx	lr
	.size	collision, .-collision
	.global	__aeabi_idivmod
	.align	2
	.global	updateAliens
	.type	updateAliens, %function
updateAliens:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L103
	ldr	r3, .L103+4
	ldr	r5, [r4]
	smull	r1, r2, r3, r5
	mov	r3, r5, asr #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, asl #3
	bne	.L62
	ldr	ip, .L103+8
	ldr	r3, [ip]
	cmp	r3, #0
	ldr	r3, .L103+12
	beq	.L100
	ldr	r0, [r3, #8]
	cmp	r0, #0
	ble	.L69
	ldr	r3, .L103+16
	add	r0, r0, r0, lsl #2
	add	r0, r3, r0, lsl #3
.L68:
	ldr	r2, [r3, #36]
	cmp	r2, #0
	beq	.L67
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #20]
	ldr	lr, [r3, #16]
	rsb	r2, r2, #0
	add	r1, r1, lr
	str	r1, [r3, #8]
	str	r2, [r3, #20]
.L67:
	add	r3, r3, #40
	cmp	r0, r3
	bne	.L68
.L69:
	mov	r2, #0
	ldr	r3, [ip, #4]
	add	r3, r3, #1
	stmia	ip, {r2, r3}
.L62:
	ldr	r6, .L103+20
	ldr	r3, [r6, #36]
	cmp	r3, #0
	beq	.L101
.L80:
	ands	r5, r5, #1
	bne	.L61
	ldr	r0, [r6, #20]
	ldr	r3, [r6, #12]
	add	r3, r0, r3
	cmp	r3, #0
	movgt	r1, #0
	movle	r1, #1
	ldr	r2, [r6, #4]
	rsb	r2, r2, #240
	cmp	r3, r2
	movlt	r2, r1
	orrge	r2, r1, #1
	str	r3, [r6, #12]
	cmp	r2, #0
	ldr	r3, .L103+20
	rsbne	r0, r0, #0
	strne	r0, [r3, #20]
	strne	r5, [r3, #36]
.L61:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L100:
	ldr	r6, [r3, #8]
	cmp	r6, #0
	ble	.L65
	ldr	r1, .L103+16
	mov	r3, r1
	add	r0, r6, r6, lsl #2
	add	r0, r1, r0, lsl #3
.L71:
	ldr	r2, [r3, #36]
	cmp	r2, #0
	ldrne	r2, [r3, #12]
	ldrne	lr, [r3, #20]
	addne	r2, r2, lr
	strne	r2, [r3, #12]
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L71
	mov	r3, #0
.L73:
	ldr	r2, [r1, #36]
	cmp	r2, #0
	add	r3, r3, #1
	beq	.L72
	ldr	lr, [r1, #12]
	cmp	lr, #1
	movgt	r0, #0
	movle	r0, #1
	ldr	r2, [r1, #4]
	rsb	r2, r2, #239
	cmp	lr, r2
	movlt	r2, r0
	orrge	r2, r0, #1
	cmp	r2, #0
	bne	.L102
.L72:
	cmp	r3, r6
	add	r1, r1, #40
	bne	.L73
.L65:
	ldr	r3, [ip, #4]
	ldr	r6, .L103+20
	add	r3, r3, #1
	str	r3, [ip, #4]
	ldr	r3, [r6, #36]
	cmp	r3, #0
	bne	.L80
.L101:
	ldr	r3, .L103+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L103+28
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r0
	add	r3, r3, #1
	rsb	r1, r3, r3, lsl #5
	add	r1, r3, r1, lsl #2
	mov	r0, r5
	mov	r1, r1, asl #3
	ldr	r3, .L103+32
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	moveq	r3, #1
	ldreq	r5, [r4]
	streq	r3, [r6, #36]
	beq	.L80
.L76:
	ldr	r3, [r6, #36]
	cmp	r3, #0
	beq	.L61
	ldr	r5, [r4]
	b	.L80
.L102:
	mov	r3, #1
	str	r3, [ip]
	b	.L65
.L104:
	.align	2
.L103:
	.word	counter
	.word	1717986919
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	alien
	.word	bonus
	.word	rand
	.word	1431655766
	.word	__aeabi_idivmod
	.size	updateAliens, .-updateAliens
	.align	2
	.global	updateAlienAtk
	.type	updateAlienAtk, %function
updateAlienAtk:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r10, .L130
	ldr	r3, [r10, #8]
	cmp	r3, #0
	ble	.L105
	mov	r9, #0
	mov	r4, #1
	ldr	r8, .L130+4
	ldr	r6, .L130+8
	ldr	r5, .L130+12
	ldr	r7, .L130+16
	b	.L114
.L128:
	ldr	r2, [r8, #28]
	cmp	r2, #0
	strne	r4, [r8, #-372]
	strne	r3, [r8, #28]
.L112:
	ldr	r3, [r10, #8]
	add	r9, r9, #1
	cmp	r3, r9
	add	r8, r8, #40
	ble	.L105
.L114:
	ldr	r3, [r8, #36]
	cmp	r3, #0
	beq	.L128
	ldr	r3, [r8, #28]
	cmp	r3, #0
	beq	.L112
	mov	lr, pc
	bx	r6
	smull	r2, r3, r5, r0
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #10
	add	r2, r3, r3, lsl #4
	add	r2, r3, r2, lsl #3
	add	r2, r2, r2, lsl #3
	add	r3, r2, r3
	subs	r0, r0, r3
	bne	.L112
	ldr	r1, [r10, #4]
	cmp	r1, #0
	ble	.L112
	ldr	r3, [r7, #24]
	cmp	r3, #0
	ldrne	r3, .L130+16
	beq	.L129
.L111:
	add	r0, r0, #1
	cmp	r0, r1
	add	r3, r3, #28
	beq	.L112
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L111
.L109:
	ldr	r3, [r8, #4]
	ldr	r2, [r8, #12]
	add	r3, r3, r3, lsr #31
	rsb	r0, r0, r0, lsl #3
	ldr	r1, [r8, #8]
	add	r3, r2, r3, asr #1
	add	r0, r7, r0, lsl #2
	sub	r3, r3, #1
	str	r4, [r0, #24]
	str	r1, [r0, #8]
	str	r3, [r0, #12]
	b	.L112
.L105:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L129:
	mov	r0, r3
	b	.L109
.L131:
	.align	2
.L130:
	.word	.LANCHOR0
	.word	alien
	.word	rand
	.word	-730910155
	.word	aBullet
	.size	updateAlienAtk, .-updateAlienAtk
	.align	2
	.global	alienShoot
	.type	alienShoot, %function
alienShoot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L143
	ldr	ip, [r3, #4]
	cmp	ip, #0
	bxle	lr
	str	lr, [sp, #-4]!
	ldr	lr, .L143+4
	ldr	r3, [lr, #24]
	cmp	r3, #0
	movne	r2, lr
	movne	r3, #0
	bne	.L136
	b	.L134
.L137:
	ldr	r1, [r2, #24]
	cmp	r1, #0
	beq	.L134
.L136:
	add	r3, r3, #1
	cmp	r3, ip
	add	r2, r2, #28
	bne	.L137
	ldr	lr, [sp], #4
	bx	lr
.L134:
	mov	ip, #1
	ldr	r2, [r0, #4]
	ldr	r1, [r0, #12]
	add	r2, r2, r2, lsr #31
	ldr	r0, [r0, #8]
	rsb	r3, r3, r3, lsl #3
	add	r2, r1, r2, asr ip
	add	r3, lr, r3, lsl #2
	sub	r2, r2, #1
	str	ip, [r3, #24]
	str	r0, [r3, #8]
	str	r2, [r3, #12]
	ldr	lr, [sp], #4
	bx	lr
.L144:
	.align	2
.L143:
	.word	.LANCHOR0
	.word	aBullet
	.size	alienShoot, .-alienShoot
	.align	2
	.global	getScore
	.type	getScore, %function
getScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L146
	ldr	r0, [r3, #8]
	bx	lr
.L147:
	.align	2
.L146:
	.word	.LANCHOR1
	.size	getScore, .-getScore
	.align	2
	.global	pixelateAliens
	.type	pixelateAliens, %function
pixelateAliens:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L168
	ldr	r2, .L168+4
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	mov	r0, r2
	mov	r1, r3
	mov	r6, #512
	mov	r8, #12
	mov	r7, #10
	ldr	r4, .L168+8
	ldr	r5, [r4, #4]
	add	lr, r3, #80
	and	r5, r5, #1
.L152:
	ldr	ip, [r0, #36]
	cmp	ip, #0
	streqh	r6, [r1, #80]	@ movhi
	beq	.L151
	ldr	ip, [r0, #8]
	ldr	r9, [r0, #12]
	cmp	r5, #0
	orr	ip, ip, #16384
	strneh	r7, [r1, #84]	@ movhi
	streqh	r8, [r1, #84]	@ movhi
	strh	ip, [r1, #80]	@ movhi
	strh	r9, [r1, #82]	@ movhi
.L151:
	add	r1, r1, #8
	cmp	r1, lr
	add	r0, r0, #40
	bne	.L152
	mov	r5, #512
	mov	r7, #8
	mov	r6, #6
	ldr	lr, [r4, #4]
	ldr	ip, .L168+12
	ldr	r1, .L168+4
	and	lr, lr, #1
.L156:
	ldr	r0, [r1, #436]
	cmp	r0, #0
	streqh	r5, [r3, #160]	@ movhi
	beq	.L155
	add	r0, r1, #408
	ldmia	r0, {r0, r8}
	cmp	lr, #0
	orr	r0, r0, #16384
	strneh	r6, [r3, #164]	@ movhi
	streqh	r7, [r3, #164]	@ movhi
	strh	r0, [r3, #160]	@ movhi
	strh	r8, [r3, #162]	@ movhi
.L155:
	add	r3, r3, #8
	cmp	r3, ip
	add	r1, r1, #40
	bne	.L156
	mov	r6, #2
	mov	r5, #512
	mov	r7, #4
	ldr	r1, .L168+16
	ldr	lr, [r4, #4]
	add	r3, r1, r6
	and	lr, lr, #1
	add	ip, r1, #162
.L160:
	ldr	r0, [r2, #1236]
	cmp	r0, #0
	streqh	r5, [r3, #-2]	@ movhi
	beq	.L159
	ldr	r0, [r2, #1208]
	ldr	r4, [r2, #1212]
	cmp	lr, #0
	orr	r0, r0, #16384
	strh	r0, [r3, #-2]	@ movhi
	strh	r4, [r1, #2]	@ movhi
	strneh	r6, [r3, #2]	@ movhi
	streqh	r7, [r3, #2]	@ movhi
.L159:
	add	r3, r3, #8
	cmp	r3, ip
	add	r2, r2, #40
	add	r1, r1, #8
	bne	.L160
	ldr	r3, .L168+20
	ldr	r2, [r3, #36]
	cmp	r2, #0
	bne	.L167
	mov	r2, #512
	ldr	r3, .L168+24
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L167:
	mov	r0, #0
	add	r1, r3, #8
	ldmia	r1, {r1, ip}
	ldr	r2, .L168+24
	orr	r3, r1, #16384
	strh	r3, [r2]	@ movhi
	strh	ip, [r2, #2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L169:
	.align	2
.L168:
	.word	shadowOAM
	.word	alien
	.word	.LANCHOR1
	.word	shadowOAM+160
	.word	shadowOAM+320
	.word	bonus
	.word	shadowOAM+488
	.size	pixelateAliens, .-pixelateAliens
	.align	2
	.global	pixelatePlayer
	.type	pixelatePlayer, %function
pixelatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #33
	ldr	r1, .L171
	add	r2, r1, #8
	ldr	r3, .L171+4
	ldmia	r2, {r2, ip}
	add	r1, r3, #496
	orr	r2, r2, #16384
	add	r3, r3, #500
	strh	r2, [r1]	@ movhi
	strh	ip, [r1, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	bx	lr
.L172:
	.align	2
.L171:
	.word	player
	.word	shadowOAM
	.size	pixelatePlayer, .-pixelatePlayer
	.align	2
	.global	pixelatePlayerBullet
	.type	pixelatePlayerBullet, %function
pixelatePlayerBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L186
	ldr	r2, [r3]
	cmp	r2, #0
	bxle	lr
	ldr	r3, .L186+4
	ldr	r1, [r3, #24]
	cmp	r1, #0
	str	lr, [sp, #-4]!
	moveq	r0, #512
	movne	lr, #41
	ldrne	r1, .L186+8
	ldreq	r1, .L186+8
	ldrne	ip, [r3, #8]
	ldrne	r0, [r3, #12]
	streqh	r0, [r1]	@ movhi
	strneh	lr, [r1, #4]	@ movhi
	strneh	ip, [r1]	@ movhi
	strneh	r0, [r1, #2]	@ movhi
	cmp	r2, #1
	beq	.L173
	ldr	r3, [r3, #52]
	cmp	r3, #0
	ldr	r2, .L186+4
	movne	r0, #41
	moveq	r2, #512
	addne	r1, r2, #36
	ldrne	r3, .L186+12
	ldmneia	r1, {r1, r2}
	ldreq	r3, .L186+12
	strneh	r0, [r3, #4]	@ movhi
	strneh	r1, [r3]	@ movhi
	strneh	r2, [r3, #2]	@ movhi
	streqh	r2, [r3]	@ movhi
.L173:
	ldr	lr, [sp], #4
	bx	lr
.L187:
	.align	2
.L186:
	.word	.LANCHOR0
	.word	pBullet
	.word	shadowOAM+504
	.word	shadowOAM+512
	.size	pixelatePlayerBullet, .-pixelatePlayerBullet
	.align	2
	.global	pixelateAlienBullet
	.type	pixelateAlienBullet, %function
pixelateAlienBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L198
	ldr	ip, [r3, #4]
	cmp	ip, #0
	bxle	lr
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r1, #0
	mov	r4, #512
	mov	r7, #39
	mov	r6, #40
	ldr	r2, .L198+4
	ldr	r3, .L198+8
	ldr	lr, [r2]
	ldr	r2, .L198+12
.L193:
	ldr	r0, [r3, #24]
	cmp	r0, #0
	streqh	r4, [r2, #-2]	@ movhi
	beq	.L192
	ldr	r5, [r3, #8]
	ldr	r0, [r3, #12]
	cmp	lr, #0
	streqh	r6, [r2, #2]	@ movhi
	strneh	r7, [r2, #2]	@ movhi
	strh	r5, [r2, #-2]	@ movhi
	strh	r0, [r2]	@ movhi
.L192:
	add	r1, r1, #1
	cmp	r1, ip
	add	r3, r3, #28
	add	r2, r2, #8
	blt	.L193
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L199:
	.align	2
.L198:
	.word	.LANCHOR0
	.word	counter
	.word	aBullet
	.word	shadowOAM+522
	.size	pixelateAlienBullet, .-pixelateAlienBullet
	.align	2
	.global	pixelateScore
	.type	pixelateScore, %function
pixelateScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #99
	stmfd	sp!, {r4, r5, lr}
	ble	.L201
	mov	lr, #8
	mov	ip, #24
	ldr	r3, .L207
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	ldr	r1, .L207+4
	rsb	r3, r2, r3, asr #5
	add	r3, r3, #75
	strh	r3, [r1, #4]	@ movhi
	strh	lr, [r1]	@ movhi
	strh	ip, [r1, #2]	@ movhi
.L202:
	ldr	r3, .L207
	smull	ip, r3, r0, r3
	mov	r4, #8
	mov	lr, #30
	rsb	r3, r2, r3, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	ldr	ip, .L207+8
	sub	r3, r0, r3, asl #2
	smull	r5, ip, r3, ip
	mov	r3, r3, asr #31
	rsb	r3, r3, ip, asr #2
	add	r3, r3, #75
	strh	r3, [r1, #12]	@ movhi
	strh	r4, [r1, #8]	@ movhi
	strh	lr, [r1, #10]	@ movhi
.L203:
	mov	lr, #8
	mov	ip, #36
	ldr	r3, .L207+8
	smull	r4, r3, r0, r3
	rsb	r2, r2, r3, asr #2
	add	r2, r2, r2, lsl #2
	sub	r0, r0, r2, asl #1
	add	r0, r0, #75
	strh	lr, [r1, #16]	@ movhi
	strh	r0, [r1, #20]	@ movhi
	strh	ip, [r1, #18]	@ movhi
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L201:
	cmp	r0, #9
	ldr	r1, .L207+4
	mov	r2, r0, asr #31
	ble	.L203
	b	.L202
.L208:
	.align	2
.L207:
	.word	1374389535
	.word	shadowOAM
	.word	1717986919
	.size	pixelateScore, .-pixelateScore
	.align	2
	.global	pixelateLife
	.type	pixelateLife, %function
pixelateLife:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r2, #33
	mov	r4, #160
	mov	lr, #176
	mov	ip, #192
	ldr	r3, .L217
	ldr	r1, .L217+4
	cmp	r0, #2
	strh	r4, [r3, #26]	@ movhi
	strh	lr, [r3, #34]	@ movhi
	strh	ip, [r3, #42]	@ movhi
	strh	r1, [r3, #24]	@ movhi
	strh	r1, [r3, #32]	@ movhi
	strh	r1, [r3, #40]	@ movhi
	strh	r2, [r3, #28]	@ movhi
	strh	r2, [r3, #36]	@ movhi
	strh	r2, [r3, #44]	@ movhi
	bgt	.L209
	mov	r2, #512
	strh	r2, [r3, #40]	@ movhi
	beq	.L209
	cmp	r0, #1
	strh	r2, [r3, #32]	@ movhi
	strneh	r2, [r3, #24]	@ movhi
.L209:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L218:
	.align	2
.L217:
	.word	shadowOAM
	.word	16392
	.size	pixelateLife, .-pixelateLife
	.align	2
	.global	pixelate
	.type	pixelate, %function
pixelate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	bl	pixelateAlienBullet
	ldr	r3, .L232
	ldr	r2, [r3]
	cmp	r2, #0
	ble	.L226
	ldr	r3, .L232+4
	ldr	r1, [r3, #24]
	cmp	r1, #0
	moveq	r0, #512
	movne	lr, #41
	ldrne	r1, .L232+8
	ldreq	r1, .L232+8
	ldrne	ip, [r3, #8]
	ldrne	r0, [r3, #12]
	streqh	r0, [r1]	@ movhi
	strneh	lr, [r1, #4]	@ movhi
	strneh	ip, [r1]	@ movhi
	strneh	r0, [r1, #2]	@ movhi
	cmp	r2, #1
	beq	.L226
	ldr	r3, [r3, #52]
	cmp	r3, #0
	ldr	r2, .L232+4
	movne	r0, #41
	moveq	r2, #512
	addne	r1, r2, #36
	ldrne	r3, .L232+12
	ldmneia	r1, {r1, r2}
	ldreq	r3, .L232+12
	strneh	r0, [r3, #4]	@ movhi
	strneh	r1, [r3]	@ movhi
	strneh	r2, [r3, #2]	@ movhi
	streqh	r2, [r3]	@ movhi
.L226:
	bl	pixelateAliens
	mov	r2, #33
	ldr	r5, .L232+16
	ldr	r3, [r5, #8]
	ldr	r4, .L232+20
	ldr	r1, [r5, #12]
	ldr	r0, .L232+24
	orr	r3, r3, #16384
	strh	r3, [r4]	@ movhi
	strh	r1, [r4, #2]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	ldr	r0, [r0, #8]
	bl	pixelateScore
	ldr	r0, [r5, #32]
	bl	pixelateLife
	sub	r1, r4, #496
	mov	r3, #512
	ldr	r4, .L232+28
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L233:
	.align	2
.L232:
	.word	.LANCHOR0
	.word	pBullet
	.word	shadowOAM+504
	.word	shadowOAM+512
	.word	player
	.word	shadowOAM+496
	.word	.LANCHOR1
	.word	DMANow
	.size	pixelate, .-pixelate
	.align	2
	.global	hideSprites1
	.type	hideSprites1, %function
hideSprites1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L238
.L235:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L235
	stmfd	sp!, {r4, lr}
	mov	r3, #512
	ldr	r4, .L238+4
	mov	r2, #117440512
	ldr	r1, .L238
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L239:
	.align	2
.L238:
	.word	shadowOAM
	.word	DMANow
	.size	hideSprites1, .-hideSprites1
	.align	2
	.global	updateBullet
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, [r0, #24]
	cmp	r3, #0
	mov	r6, r0
	ldr	fp, [r0, #8]
	beq	.L242
	ldr	r3, [r0, #16]
	ldr	r4, .L262
	add	fp, fp, r3
	str	fp, [r0, #8]
	mov	r1, r4
	bl	collision
	cmp	r0, #0
	bne	.L260
.L243:
	mov	r5, #0
	mov	r8, r5
	ldr	r10, .L262+4
	ldr	r4, .L262+8
	ldr	r7, [r10]
	ldr	r9, .L262+12
.L247:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L244
	mov	r1, r4
	mov	r0, r6
	bl	collision
	cmp	r0, #0
	beq	.L244
	str	r8, [r4, #36]
	str	r8, [r6, #24]
	ldr	r2, [r9, #8]
	ldr	r3, [r4, #24]
	sub	r7, r7, #1
	add	r3, r3, r2
	str	r7, [r10]
	str	r3, [r9, #8]
.L244:
	add	r5, r5, #1
	cmp	r5, #50
	add	r4, r4, #40
	bne	.L247
	cmp	r7, #0
	beq	.L261
.L242:
	cmp	fp, #0
	movlt	r3, #0
	strlt	r3, [r6, #24]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L260:
	mov	r2, #0
	ldr	r1, .L262+12
	ldr	r3, [r4, #24]
	ldr	r0, [r1, #8]
	add	r3, r3, r0
	str	r2, [r4, #36]
	str	r3, [r1, #8]
	str	r2, [r6, #24]
	b	.L243
.L261:
	bl	hideSprites1
	ldr	r3, .L262+16
	mov	lr, pc
	bx	r3
	ldr	fp, [r6, #8]
	b	.L242
.L263:
	.align	2
.L262:
	.word	bonus
	.word	aliensRemaining
	.word	alien
	.word	.LANCHOR1
	.word	goToWin
	.size	updateBullet, .-updateBullet
	.align	2
	.type	updateAlienBullet.part.0, %function
updateAlienBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, [r0, #8]
	ldr	r4, [r0, #16]
	ldr	r6, .L272
	add	r4, r3, r4
	str	r4, [r0, #8]
	mov	r1, r6
	mov	r5, r0
	bl	collision
	cmp	r0, #0
	beq	.L265
	mov	r2, #0
	ldr	r3, [r6, #32]
	sub	r3, r3, #1
	cmp	r3, r2
	str	r3, [r6, #32]
	str	r2, [r5, #24]
	beq	.L271
.L265:
	ldr	r3, [r5]
	add	r4, r4, r3
	cmp	r4, #159
	movgt	r3, #0
	strgt	r3, [r5, #24]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L271:
	bl	hideSprites1
	ldr	r3, .L272+4
	mov	lr, pc
	bx	r3
	ldr	r4, [r5, #8]
	b	.L265
.L273:
	.align	2
.L272:
	.word	player
	.word	goToLose
	.size	updateAlienBullet.part.0, .-updateAlienBullet.part.0
	.align	2
	.global	updateAlienBullet
	.type	updateAlienBullet, %function
updateAlienBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateAlienBullet.part.0
	.size	updateAlienBullet, .-updateAlienBullet
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L290
	ldr	r3, [r2]
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r6, .L290+4
	add	r3, r3, #1
	str	r3, [r2]
	bl	updatePlayer
	ldr	r3, [r6]
	cmp	r3, #0
	movgt	r5, #0
	ldrgt	r4, .L290+8
	ble	.L281
.L280:
	mov	r0, r4
	bl	updateBullet
	ldr	r3, [r6]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #28
	bgt	.L280
.L281:
	bl	updateAliens
	bl	updateAlienAtk
	ldr	r3, [r6, #4]
	cmp	r3, #0
	ble	.L276
	mov	r5, #0
	ldr	r4, .L290+12
	b	.L283
.L282:
	ldr	r3, [r6, #4]
	cmp	r3, r5
	add	r4, r4, #28
	ble	.L276
.L283:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L282
	mov	r0, r4
	bl	updateAlienBullet.part.0
	ldr	r3, [r6, #4]
	cmp	r3, r5
	add	r4, r4, #28
	bgt	.L283
.L276:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L291:
	.align	2
.L290:
	.word	counter
	.word	.LANCHOR0
	.word	pBullet
	.word	aBullet
	.size	update, .-update
	.global	score
	.comm	aliensRemaining,4,4
	.global	drop
	.comm	counter,4,4
	.global	flip
	.comm	shadowOAM,1024,4
	.global	alienBulletLength
	.global	bulletLength
	.global	alienLength
	.comm	aBullet,140,4
	.comm	pBullet,56,4
	.comm	bonus,40,4
	.comm	alien,2000,4
	.comm	player,40,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	bulletLength, %object
	.size	bulletLength, 4
bulletLength:
	.word	2
	.type	alienBulletLength, %object
	.size	alienBulletLength, 4
alienBulletLength:
	.word	5
	.type	alienLength, %object
	.size	alienLength, 4
alienLength:
	.word	50
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	drop, %object
	.size	drop, 4
drop:
	.space	4
	.type	flip, %object
	.size	flip, 4
flip:
	.space	4
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
