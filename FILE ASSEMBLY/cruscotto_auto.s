	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_stottomenu                     ; -- Begin function stottomenu
	.p2align	2
_stottomenu:                            ; @stottomenu
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #272
	.cfi_def_cfa_offset 272
	stp	x28, x27, [sp, #240]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #256]            ; 16-byte Folded Spill
	add	x29, sp, #256
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	adrp	x8, ___stdinp@GOTPAGE
	ldr	x8, [x8, ___stdinp@GOTPAGEOFF]
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	adrp	x8, ___stdoutp@GOTPAGE
	ldr	x8, [x8, ___stdoutp@GOTPAGEOFF]
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
	str	x0, [sp, #120]
	str	w1, [sp, #116]
	str	w2, [sp, #112]
	str	w3, [sp, #108]
	str	wzr, [sp, #80]
	ldr	w8, [sp, #112]
	subs	w8, w8, #0
                                        ; kill: def $x8 killed $w8
	str	x8, [sp, #48]                   ; 8-byte Folded Spill
	subs	x8, x8, #6
	cset	w8, hi
	tbnz	w8, #0, LBB0_112
; %bb.1:
	ldr	x11, [sp, #48]                  ; 8-byte Folded Reload
	adrp	x10, lJTI0_0@PAGE
	add	x10, x10, lJTI0_0@PAGEOFF
Ltmp0:
	adr	x8, Ltmp0
	ldrsw	x9, [x10, x11, lsl #2]
	add	x8, x8, x9
	br	x8
LBB0_2:
	str	wzr, [sp, #80]
	bl	_getchar
	strb	w0, [sp, #107]
	b	LBB0_3
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #80]
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_7
	b	LBB0_4
LBB0_4:                                 ;   in Loop: Header=BB0_3 Depth=1
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x2, [x8]
	sub	x0, x29, #124
	mov	w1, #100
	bl	_fgets
	ldursb	w8, [x29, #-124]
	subs	w8, w8, #10
	cset	w8, ne
	tbnz	w8, #0, LBB0_6
	b	LBB0_5
LBB0_5:                                 ;   in Loop: Header=BB0_3 Depth=1
	mov	w8, #1
	str	w8, [sp, #80]
	b	LBB0_6
LBB0_6:                                 ;   in Loop: Header=BB0_3 Depth=1
	b	LBB0_3
LBB0_7:
	b	LBB0_113
LBB0_8:
	str	wzr, [sp, #80]
	bl	_getchar
	strb	w0, [sp, #107]
	b	LBB0_9
LBB0_9:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #80]
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_13
	b	LBB0_10
LBB0_10:                                ;   in Loop: Header=BB0_9 Depth=1
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x2, [x8]
	sub	x0, x29, #124
	mov	w1, #100
	bl	_fgets
	ldursb	w8, [x29, #-124]
	subs	w8, w8, #10
	cset	w8, ne
	tbnz	w8, #0, LBB0_12
	b	LBB0_11
LBB0_11:                                ;   in Loop: Header=BB0_9 Depth=1
	mov	w8, #1
	str	w8, [sp, #80]
	b	LBB0_12
LBB0_12:                                ;   in Loop: Header=BB0_9 Depth=1
	b	LBB0_9
LBB0_13:
	b	LBB0_113
LBB0_14:
	str	wzr, [sp, #80]
	bl	_getchar
	strb	w0, [sp, #107]
	b	LBB0_15
LBB0_15:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #80]
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_28
	b	LBB0_16
LBB0_16:                                ;   in Loop: Header=BB0_15 Depth=1
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	adrp	x8, _blocco_porte@PAGE
	ldrsw	x8, [x8, _blocco_porte@PAGEOFF]
	mov	x9, #10
	mul	x9, x8, x9
	adrp	x8, _stati@PAGE
	add	x8, x8, _stati@PAGEOFF
	add	x8, x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x2, [x8]
	sub	x0, x29, #124
	mov	w1, #100
	bl	_fgets
	ldursb	w8, [x29, #-124]
	subs	w8, w8, #10
	cset	w8, ne
	tbnz	w8, #0, LBB0_18
	b	LBB0_17
LBB0_17:                                ;   in Loop: Header=BB0_15 Depth=1
	mov	w8, #1
	str	w8, [sp, #80]
	b	LBB0_27
LBB0_18:                                ;   in Loop: Header=BB0_15 Depth=1
	ldursb	w8, [x29, #-124]
	subs	w8, w8, #27
	cset	w8, ne
	tbnz	w8, #0, LBB0_26
	b	LBB0_19
LBB0_19:                                ;   in Loop: Header=BB0_15 Depth=1
	ldursb	w8, [x29, #-123]
	subs	w8, w8, #91
	cset	w8, ne
	tbnz	w8, #0, LBB0_26
	b	LBB0_20
LBB0_20:                                ;   in Loop: Header=BB0_15 Depth=1
	ldursb	w8, [x29, #-122]
	str	w8, [sp, #28]                   ; 4-byte Folded Spill
	subs	w8, w8, #65
	cset	w8, eq
	tbnz	w8, #0, LBB0_22
	b	LBB0_21
LBB0_21:                                ;   in Loop: Header=BB0_15 Depth=1
	ldr	w8, [sp, #28]                   ; 4-byte Folded Reload
	subs	w8, w8, #66
	cset	w8, eq
	tbnz	w8, #0, LBB0_23
	b	LBB0_24
LBB0_22:                                ;   in Loop: Header=BB0_15 Depth=1
	adrp	x9, _blocco_porte@PAGE
	ldr	w8, [x9, _blocco_porte@PAGEOFF]
	subs	w8, w8, #0
	cset	w8, eq
	and	w8, w8, #0x1
	str	w8, [x9, _blocco_porte@PAGEOFF]
	b	LBB0_25
LBB0_23:                                ;   in Loop: Header=BB0_15 Depth=1
	adrp	x9, _blocco_porte@PAGE
	ldr	w8, [x9, _blocco_porte@PAGEOFF]
	subs	w8, w8, #0
	cset	w8, eq
	and	w8, w8, #0x1
	str	w8, [x9, _blocco_porte@PAGEOFF]
	b	LBB0_25
LBB0_24:                                ;   in Loop: Header=BB0_15 Depth=1
	b	LBB0_25
LBB0_25:                                ;   in Loop: Header=BB0_15 Depth=1
	b	LBB0_26
LBB0_26:                                ;   in Loop: Header=BB0_15 Depth=1
	b	LBB0_27
LBB0_27:                                ;   in Loop: Header=BB0_15 Depth=1
	b	LBB0_15
LBB0_28:
	b	LBB0_113
LBB0_29:
	str	wzr, [sp, #80]
	bl	_getchar
	strb	w0, [sp, #107]
	b	LBB0_30
LBB0_30:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #80]
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_43
	b	LBB0_31
LBB0_31:                                ;   in Loop: Header=BB0_30 Depth=1
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	adrp	x8, _back_home@PAGE
	ldrsw	x8, [x8, _back_home@PAGEOFF]
	mov	x9, #10
	mul	x9, x8, x9
	adrp	x8, _stati@PAGE
	add	x8, x8, _stati@PAGEOFF
	add	x8, x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x2, [x8]
	sub	x0, x29, #124
	mov	w1, #100
	bl	_fgets
	ldursb	w8, [x29, #-124]
	subs	w8, w8, #10
	cset	w8, ne
	tbnz	w8, #0, LBB0_33
	b	LBB0_32
LBB0_32:                                ;   in Loop: Header=BB0_30 Depth=1
	mov	w8, #1
	str	w8, [sp, #80]
	b	LBB0_42
LBB0_33:                                ;   in Loop: Header=BB0_30 Depth=1
	ldursb	w8, [x29, #-124]
	subs	w8, w8, #27
	cset	w8, ne
	tbnz	w8, #0, LBB0_41
	b	LBB0_34
LBB0_34:                                ;   in Loop: Header=BB0_30 Depth=1
	ldursb	w8, [x29, #-123]
	subs	w8, w8, #91
	cset	w8, ne
	tbnz	w8, #0, LBB0_41
	b	LBB0_35
LBB0_35:                                ;   in Loop: Header=BB0_30 Depth=1
	ldursb	w8, [x29, #-122]
	str	w8, [sp, #24]                   ; 4-byte Folded Spill
	subs	w8, w8, #65
	cset	w8, eq
	tbnz	w8, #0, LBB0_37
	b	LBB0_36
LBB0_36:                                ;   in Loop: Header=BB0_30 Depth=1
	ldr	w8, [sp, #24]                   ; 4-byte Folded Reload
	subs	w8, w8, #66
	cset	w8, eq
	tbnz	w8, #0, LBB0_38
	b	LBB0_39
LBB0_37:                                ;   in Loop: Header=BB0_30 Depth=1
	adrp	x9, _back_home@PAGE
	ldr	w8, [x9, _back_home@PAGEOFF]
	subs	w8, w8, #0
	cset	w8, eq
	and	w8, w8, #0x1
	str	w8, [x9, _back_home@PAGEOFF]
	b	LBB0_40
LBB0_38:                                ;   in Loop: Header=BB0_30 Depth=1
	adrp	x9, _back_home@PAGE
	ldr	w8, [x9, _back_home@PAGEOFF]
	subs	w8, w8, #0
	cset	w8, eq
	and	w8, w8, #0x1
	str	w8, [x9, _back_home@PAGEOFF]
	b	LBB0_40
LBB0_39:                                ;   in Loop: Header=BB0_30 Depth=1
	b	LBB0_40
LBB0_40:                                ;   in Loop: Header=BB0_30 Depth=1
	b	LBB0_41
LBB0_41:                                ;   in Loop: Header=BB0_30 Depth=1
	b	LBB0_42
LBB0_42:                                ;   in Loop: Header=BB0_30 Depth=1
	b	LBB0_30
LBB0_43:
	b	LBB0_113
LBB0_44:
	ldr	w8, [sp, #108]
	subs	w8, w8, #2244
	cset	w8, ne
	tbnz	w8, #0, LBB0_63
	b	LBB0_45
LBB0_45:
	str	wzr, [sp, #80]
	bl	_getchar
	strb	w0, [sp, #107]
	b	LBB0_46
LBB0_46:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #80]
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_62
	b	LBB0_47
LBB0_47:                                ;   in Loop: Header=BB0_46 Depth=1
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	adrp	x8, _lampeggio@PAGE
	ldr	w9, [x8, _lampeggio@PAGEOFF]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x2, [x8]
	sub	x0, x29, #124
	mov	w1, #100
	bl	_fgets
	ldursb	w8, [x29, #-124]
	subs	w8, w8, #10
	cset	w8, ne
	tbnz	w8, #0, LBB0_49
	b	LBB0_48
LBB0_48:                                ;   in Loop: Header=BB0_46 Depth=1
	mov	w8, #1
	str	w8, [sp, #80]
	b	LBB0_61
LBB0_49:                                ;   in Loop: Header=BB0_46 Depth=1
	ldursb	w8, [x29, #-124]
	subs	w8, w8, #27
	cset	w8, ne
	tbnz	w8, #0, LBB0_60
	b	LBB0_50
LBB0_50:                                ;   in Loop: Header=BB0_46 Depth=1
	ldursb	w8, [x29, #-123]
	subs	w8, w8, #91
	cset	w8, ne
	tbnz	w8, #0, LBB0_60
	b	LBB0_51
LBB0_51:                                ;   in Loop: Header=BB0_46 Depth=1
	ldursb	w8, [x29, #-122]
	subs	w8, w8, #67
	cset	w8, ne
	tbnz	w8, #0, LBB0_58
	b	LBB0_52
LBB0_52:                                ;   in Loop: Header=BB0_46 Depth=1
	adrp	x0, l_.str.6@PAGE
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_printf
	mov	x9, sp
	adrp	x8, _lampeggio@PAGE
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	adrp	x8, _lampeggio@PAGE
	add	x8, x8, _lampeggio@PAGEOFF
	str	x8, [x9]
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_scanf
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldr	w8, [x8, _lampeggio@PAGEOFF]
	subs	w8, w8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB0_54
	b	LBB0_53
LBB0_53:                                ;   in Loop: Header=BB0_46 Depth=1
	mov	w8, #2
	adrp	x9, _lampeggio@PAGE
	str	w8, [x9, _lampeggio@PAGEOFF]
	b	LBB0_57
LBB0_54:                                ;   in Loop: Header=BB0_46 Depth=1
	adrp	x8, _lampeggio@PAGE
	ldr	w8, [x8, _lampeggio@PAGEOFF]
	subs	w8, w8, #5
	cset	w8, le
	tbnz	w8, #0, LBB0_56
	b	LBB0_55
LBB0_55:                                ;   in Loop: Header=BB0_46 Depth=1
	mov	w8, #5
	adrp	x9, _lampeggio@PAGE
	str	w8, [x9, _lampeggio@PAGEOFF]
	b	LBB0_56
LBB0_56:                                ;   in Loop: Header=BB0_46 Depth=1
	b	LBB0_57
LBB0_57:                                ;   in Loop: Header=BB0_46 Depth=1
	bl	_getchar
	strb	w0, [sp, #107]
	b	LBB0_59
LBB0_58:                                ;   in Loop: Header=BB0_46 Depth=1
	b	LBB0_59
LBB0_59:                                ;   in Loop: Header=BB0_46 Depth=1
	b	LBB0_60
LBB0_60:                                ;   in Loop: Header=BB0_46 Depth=1
	b	LBB0_61
LBB0_61:                                ;   in Loop: Header=BB0_46 Depth=1
	b	LBB0_46
LBB0_62:
	b	LBB0_79
LBB0_63:
	bl	_getchar
	strb	w0, [sp, #107]
	b	LBB0_64
LBB0_64:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_71 Depth 2
	ldr	w8, [sp, #80]
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_78
	b	LBB0_65
LBB0_65:                                ;   in Loop: Header=BB0_64 Depth=1
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x2, [x8]
	sub	x0, x29, #124
	mov	w1, #100
	bl	_fgets
	ldursb	w8, [x29, #-124]
	subs	w8, w8, #10
	cset	w8, ne
	tbnz	w8, #0, LBB0_67
	b	LBB0_66
LBB0_66:                                ;   in Loop: Header=BB0_64 Depth=1
	mov	w8, #1
	str	w8, [sp, #80]
	b	LBB0_77
LBB0_67:                                ;   in Loop: Header=BB0_64 Depth=1
	ldursb	w8, [x29, #-124]
	subs	w8, w8, #27
	cset	w8, ne
	tbnz	w8, #0, LBB0_76
	b	LBB0_68
LBB0_68:                                ;   in Loop: Header=BB0_64 Depth=1
	ldursb	w8, [x29, #-123]
	subs	w8, w8, #91
	cset	w8, ne
	tbnz	w8, #0, LBB0_76
	b	LBB0_69
LBB0_69:                                ;   in Loop: Header=BB0_64 Depth=1
	ldursb	w8, [x29, #-122]
	subs	w8, w8, #67
	cset	w8, ne
	tbnz	w8, #0, LBB0_74
	b	LBB0_70
LBB0_70:                                ;   in Loop: Header=BB0_64 Depth=1
	adrp	x0, l_.str.9@PAGE
	add	x0, x0, l_.str.9@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	bl	_fflush
	mov	x0, #0
	bl	_time
	str	x0, [sp, #72]
	b	LBB0_71
LBB0_71:                                ;   Parent Loop BB0_64 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	x0, #0
	bl	_time
	ldr	x8, [sp, #72]
	subs	x8, x0, x8
	subs	x8, x8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB0_73
	b	LBB0_72
LBB0_72:                                ;   in Loop: Header=BB0_71 Depth=2
	b	LBB0_71
LBB0_73:                                ;   in Loop: Header=BB0_64 Depth=1
	mov	w8, #1
	str	w8, [sp, #80]
	b	LBB0_75
LBB0_74:                                ;   in Loop: Header=BB0_64 Depth=1
	b	LBB0_75
LBB0_75:                                ;   in Loop: Header=BB0_64 Depth=1
	b	LBB0_76
LBB0_76:                                ;   in Loop: Header=BB0_64 Depth=1
	b	LBB0_77
LBB0_77:                                ;   in Loop: Header=BB0_64 Depth=1
	b	LBB0_64
LBB0_78:
	b	LBB0_79
LBB0_79:
	b	LBB0_113
LBB0_80:
	str	wzr, [sp, #80]
	bl	_getchar
	strb	w0, [sp, #107]
	b	LBB0_81
LBB0_81:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_88 Depth 2
	ldr	w8, [sp, #80]
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_95
	b	LBB0_82
LBB0_82:                                ;   in Loop: Header=BB0_81 Depth=1
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x2, [x8]
	sub	x0, x29, #124
	mov	w1, #100
	bl	_fgets
	ldursb	w8, [x29, #-124]
	subs	w8, w8, #10
	cset	w8, ne
	tbnz	w8, #0, LBB0_84
	b	LBB0_83
LBB0_83:                                ;   in Loop: Header=BB0_81 Depth=1
	mov	w8, #1
	str	w8, [sp, #80]
	b	LBB0_94
LBB0_84:                                ;   in Loop: Header=BB0_81 Depth=1
	ldursb	w8, [x29, #-124]
	subs	w8, w8, #27
	cset	w8, ne
	tbnz	w8, #0, LBB0_93
	b	LBB0_85
LBB0_85:                                ;   in Loop: Header=BB0_81 Depth=1
	ldursb	w8, [x29, #-123]
	subs	w8, w8, #91
	cset	w8, ne
	tbnz	w8, #0, LBB0_93
	b	LBB0_86
LBB0_86:                                ;   in Loop: Header=BB0_81 Depth=1
	ldursb	w8, [x29, #-122]
	subs	w8, w8, #67
	cset	w8, ne
	tbnz	w8, #0, LBB0_91
	b	LBB0_87
LBB0_87:                                ;   in Loop: Header=BB0_81 Depth=1
	adrp	x0, l_.str.9@PAGE
	add	x0, x0, l_.str.9@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	bl	_fflush
	mov	x0, #0
	bl	_time
	str	x0, [sp, #64]
	b	LBB0_88
LBB0_88:                                ;   Parent Loop BB0_81 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	x0, #0
	bl	_time
	ldr	x8, [sp, #64]
	subs	x8, x0, x8
	subs	x8, x8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB0_90
	b	LBB0_89
LBB0_89:                                ;   in Loop: Header=BB0_88 Depth=2
	b	LBB0_88
LBB0_90:                                ;   in Loop: Header=BB0_81 Depth=1
	mov	w8, #1
	str	w8, [sp, #80]
	b	LBB0_92
LBB0_91:                                ;   in Loop: Header=BB0_81 Depth=1
	b	LBB0_92
LBB0_92:                                ;   in Loop: Header=BB0_81 Depth=1
	b	LBB0_93
LBB0_93:                                ;   in Loop: Header=BB0_81 Depth=1
	b	LBB0_94
LBB0_94:                                ;   in Loop: Header=BB0_81 Depth=1
	b	LBB0_81
LBB0_95:
	b	LBB0_113
LBB0_96:
	str	wzr, [sp, #80]
	bl	_getchar
	strb	w0, [sp, #107]
	b	LBB0_97
LBB0_97:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_104 Depth 2
	ldr	w8, [sp, #80]
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_111
	b	LBB0_98
LBB0_98:                                ;   in Loop: Header=BB0_97 Depth=1
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.10@PAGE
	add	x0, x0, l_.str.10@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #32]                   ; 8-byte Folded Reload
	ldr	x2, [x8]
	sub	x0, x29, #124
	mov	w1, #100
	bl	_fgets
	ldursb	w8, [x29, #-124]
	subs	w8, w8, #10
	cset	w8, ne
	tbnz	w8, #0, LBB0_100
	b	LBB0_99
LBB0_99:                                ;   in Loop: Header=BB0_97 Depth=1
	mov	w8, #1
	str	w8, [sp, #80]
	b	LBB0_110
LBB0_100:                               ;   in Loop: Header=BB0_97 Depth=1
	ldursb	w8, [x29, #-124]
	subs	w8, w8, #27
	cset	w8, ne
	tbnz	w8, #0, LBB0_109
	b	LBB0_101
LBB0_101:                               ;   in Loop: Header=BB0_97 Depth=1
	ldursb	w8, [x29, #-123]
	subs	w8, w8, #91
	cset	w8, ne
	tbnz	w8, #0, LBB0_109
	b	LBB0_102
LBB0_102:                               ;   in Loop: Header=BB0_97 Depth=1
	ldursb	w8, [x29, #-122]
	subs	w8, w8, #67
	cset	w8, ne
	tbnz	w8, #0, LBB0_107
	b	LBB0_103
LBB0_103:                               ;   in Loop: Header=BB0_97 Depth=1
	adrp	x0, l_.str.11@PAGE
	add	x0, x0, l_.str.11@PAGEOFF
	bl	_printf
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	ldr	x0, [x8]
	bl	_fflush
	mov	x0, #0
	bl	_time
	str	x0, [sp, #56]
	b	LBB0_104
LBB0_104:                               ;   Parent Loop BB0_97 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	x0, #0
	bl	_time
	ldr	x8, [sp, #56]
	subs	x8, x0, x8
	subs	x8, x8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB0_106
	b	LBB0_105
LBB0_105:                               ;   in Loop: Header=BB0_104 Depth=2
	b	LBB0_104
LBB0_106:                               ;   in Loop: Header=BB0_97 Depth=1
	mov	w8, #1
	str	w8, [sp, #80]
	b	LBB0_108
LBB0_107:                               ;   in Loop: Header=BB0_97 Depth=1
	b	LBB0_108
LBB0_108:                               ;   in Loop: Header=BB0_97 Depth=1
	b	LBB0_109
LBB0_109:                               ;   in Loop: Header=BB0_97 Depth=1
	b	LBB0_110
LBB0_110:                               ;   in Loop: Header=BB0_97 Depth=1
	b	LBB0_97
LBB0_111:
	b	LBB0_113
LBB0_112:
	b	LBB0_113
LBB0_113:
	ldur	x9, [x29, #-24]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB0_115
	b	LBB0_114
LBB0_114:
	bl	___stack_chk_fail
LBB0_115:
	ldp	x29, x30, [sp, #256]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #240]            ; 16-byte Folded Reload
	add	sp, sp, #272
	ret
	.cfi_endproc
	.p2align	2
lJTI0_0:
	.long	LBB0_2-Ltmp0
	.long	LBB0_8-Ltmp0
	.long	LBB0_14-Ltmp0
	.long	LBB0_29-Ltmp0
	.long	LBB0_44-Ltmp0
	.long	LBB0_80-Ltmp0
	.long	LBB0_96-Ltmp0
                                        ; -- End function
	.globl	_stampaMenu                     ; -- Begin function stampaMenu
	.p2align	2
_stampaMenu:                            ; @stampaMenu
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	sub	sp, sp, #144
	adrp	x8, _dt@GOTPAGE
	ldr	x8, [x8, _dt@GOTPAGEOFF]
	stur	x8, [x29, #-80]                 ; 8-byte Folded Spill
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	stur	w0, [x29, #-12]
	stur	wzr, [x29, #-20]
	stur	wzr, [x29, #-28]
	ldur	w8, [x29, #-12]
	subs	w8, w8, #2244
	cset	w8, ne
	tbnz	w8, #0, LBB1_2
	b	LBB1_1
LBB1_1:
	mov	w8, #7
	stur	w8, [x29, #-24]
	b	LBB1_3
LBB1_2:
	mov	w8, #5
	stur	w8, [x29, #-24]
	b	LBB1_3
LBB1_3:
	ldur	w8, [x29, #-24]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	stur	x9, [x29, #-40]
	mov	x9, #100
	mul	x9, x8, x9
	add	x9, x9, #15
	and	x9, x9, #0xfffffffffffffff0
	stur	x9, [x29, #-96]                 ; 8-byte Folded Spill
	adrp	x16, ___chkstk_darwin@GOTPAGE
	ldr	x16, [x16, ___chkstk_darwin@GOTPAGEOFF]
	blr	x16
	ldur	x10, [x29, #-96]                ; 8-byte Folded Reload
	mov	x9, sp
	subs	x9, x9, x10
	mov	sp, x9
	stur	x9, [x29, #-88]                 ; 8-byte Folded Spill
	stur	x8, [x29, #-48]
	ldur	w8, [x29, #-12]
	subs	w8, w8, #2244
	cset	w8, ne
	tbnz	w8, #0, LBB1_5
	b	LBB1_4
LBB1_4:
	ldur	x0, [x29, #-88]                 ; 8-byte Folded Reload
	adrp	x1, l_.str.12@PAGE
	add	x1, x1, l_.str.12@PAGEOFF
	mov	x2, #100
	stur	x2, [x29, #-104]                ; 8-byte Folded Spill
	bl	___strcpy_chk
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	ldur	x2, [x29, #-104]                ; 8-byte Folded Reload
	add	x0, x8, #100
	adrp	x1, l_.str.13@PAGE
	add	x1, x1, l_.str.13@PAGEOFF
	bl	___strcpy_chk
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	ldur	x2, [x29, #-104]                ; 8-byte Folded Reload
	add	x0, x8, #200
	adrp	x1, l_.str.14@PAGE
	add	x1, x1, l_.str.14@PAGEOFF
	bl	___strcpy_chk
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	ldur	x2, [x29, #-104]                ; 8-byte Folded Reload
	add	x0, x8, #300
	adrp	x1, l_.str.15@PAGE
	add	x1, x1, l_.str.15@PAGEOFF
	bl	___strcpy_chk
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	ldur	x2, [x29, #-104]                ; 8-byte Folded Reload
	add	x0, x8, #400
	adrp	x1, l_.str.16@PAGE
	add	x1, x1, l_.str.16@PAGEOFF
	bl	___strcpy_chk
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	ldur	x2, [x29, #-104]                ; 8-byte Folded Reload
	add	x0, x8, #500
	adrp	x1, l_.str.17@PAGE
	add	x1, x1, l_.str.17@PAGEOFF
	bl	___strcpy_chk
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	ldur	x2, [x29, #-104]                ; 8-byte Folded Reload
	add	x0, x8, #600
	adrp	x1, l_.str.18@PAGE
	add	x1, x1, l_.str.18@PAGEOFF
	bl	___strcpy_chk
	b	LBB1_6
LBB1_5:
	ldur	x0, [x29, #-88]                 ; 8-byte Folded Reload
	adrp	x1, l_.str.12@PAGE
	add	x1, x1, l_.str.12@PAGEOFF
	mov	x2, #100
	stur	x2, [x29, #-112]                ; 8-byte Folded Spill
	bl	___strcpy_chk
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	ldur	x2, [x29, #-112]                ; 8-byte Folded Reload
	add	x0, x8, #100
	adrp	x1, l_.str.13@PAGE
	add	x1, x1, l_.str.13@PAGEOFF
	bl	___strcpy_chk
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	ldur	x2, [x29, #-112]                ; 8-byte Folded Reload
	add	x0, x8, #200
	adrp	x1, l_.str.14@PAGE
	add	x1, x1, l_.str.14@PAGEOFF
	bl	___strcpy_chk
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	ldur	x2, [x29, #-112]                ; 8-byte Folded Reload
	add	x0, x8, #300
	adrp	x1, l_.str.15@PAGE
	add	x1, x1, l_.str.15@PAGEOFF
	bl	___strcpy_chk
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	ldur	x2, [x29, #-112]                ; 8-byte Folded Reload
	add	x0, x8, #400
	adrp	x1, l_.str.19@PAGE
	add	x1, x1, l_.str.19@PAGEOFF
	bl	___strcpy_chk
	b	LBB1_6
LBB1_6:
	adrp	x0, l_.str.20@PAGE
	add	x0, x0, l_.str.20@PAGEOFF
	bl	_printf
	stur	wzr, [x29, #-52]
	b	LBB1_7
LBB1_7:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-52]
	subs	w8, w8, #5
	cset	w8, ge
	tbnz	w8, #0, LBB1_10
	b	LBB1_8
LBB1_8:                                 ;   in Loop: Header=BB1_7 Depth=1
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	ldursw	x9, [x29, #-52]
	mov	x10, #100
	mul	x9, x9, x10
	add	x8, x8, x9
	sub	sp, sp, #16
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.21@PAGE
	add	x0, x0, l_.str.21@PAGEOFF
	bl	_printf
	add	sp, sp, #16
	b	LBB1_9
LBB1_9:                                 ;   in Loop: Header=BB1_7 Depth=1
	ldur	w8, [x29, #-52]
	add	w8, w8, #1
	stur	w8, [x29, #-52]
	b	LBB1_7
LBB1_10:
	adrp	x0, l_.str.22@PAGE
	add	x0, x0, l_.str.22@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.23@PAGE
	add	x0, x0, l_.str.23@PAGEOFF
	bl	_printf
	b	LBB1_11
LBB1_11:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_13 Depth 2
	ldur	w8, [x29, #-28]
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB1_52
	b	LBB1_12
LBB1_12:                                ;   in Loop: Header=BB1_11 Depth=1
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.20@PAGE
	add	x0, x0, l_.str.20@PAGEOFF
	bl	_printf
	stur	wzr, [x29, #-56]
	b	LBB1_13
LBB1_13:                                ;   Parent Loop BB1_11 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldur	w8, [x29, #-56]
	ldur	w9, [x29, #-24]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB1_31
	b	LBB1_14
LBB1_14:                                ;   in Loop: Header=BB1_13 Depth=2
	mov	x0, #0
	bl	_time
	mov	x8, x0
	sub	x0, x29, #64
	stur	x8, [x29, #-64]
	bl	_localtime
	ldur	x9, [x29, #-80]                 ; 8-byte Folded Reload
	stur	x0, [x29, #-72]
	ldur	x8, [x29, #-72]
	ldr	w8, [x8, #20]
	add	w8, w8, #1900
	str	w8, [x9]
	ldur	x8, [x29, #-72]
	ldr	w8, [x8, #16]
	add	w8, w8, #1
	str	w8, [x9, #4]
	ldur	x8, [x29, #-72]
	ldr	w8, [x8, #12]
	str	w8, [x9, #8]
	ldur	x8, [x29, #-72]
	ldr	w8, [x8, #8]
	str	w8, [x9, #12]
	ldur	x8, [x29, #-72]
	ldr	w8, [x8, #4]
	str	w8, [x9, #16]
	ldur	w8, [x29, #-56]
	subs	w8, w8, #0
                                        ; kill: def $x8 killed $w8
	stur	x8, [x29, #-120]                ; 8-byte Folded Spill
	subs	x8, x8, #5
	cset	w8, hi
	tbnz	w8, #0, LBB1_25
; %bb.15:                               ;   in Loop: Header=BB1_13 Depth=2
	ldur	x11, [x29, #-120]               ; 8-byte Folded Reload
	adrp	x10, lJTI1_1@PAGE
	add	x10, x10, lJTI1_1@PAGEOFF
Ltmp1:
	adr	x8, Ltmp1
	ldrsw	x9, [x10, x11, lsl #2]
	add	x8, x8, x9
	br	x8
LBB1_16:                                ;   in Loop: Header=BB1_13 Depth=2
	adrp	x0, l_.str.22@PAGE
	add	x0, x0, l_.str.22@PAGEOFF
	bl	_printf
	b	LBB1_26
LBB1_17:                                ;   in Loop: Header=BB1_13 Depth=2
	ldur	x8, [x29, #-80]                 ; 8-byte Folded Reload
	ldr	w9, [x8, #8]
                                        ; implicit-def: $x11
	mov	x11, x9
	ldr	w9, [x8, #4]
                                        ; implicit-def: $x10
	mov	x10, x9
	ldr	w9, [x8]
                                        ; implicit-def: $x8
	mov	x8, x9
	sub	sp, sp, #32
	mov	x9, sp
	str	x11, [x9]
	str	x10, [x9, #8]
	str	x8, [x9, #16]
	adrp	x0, l_.str.24@PAGE
	add	x0, x0, l_.str.24@PAGEOFF
	bl	_printf
	add	sp, sp, #32
	b	LBB1_26
LBB1_18:                                ;   in Loop: Header=BB1_13 Depth=2
	ldur	x8, [x29, #-80]                 ; 8-byte Folded Reload
	ldr	w9, [x8, #12]
                                        ; implicit-def: $x10
	mov	x10, x9
	ldr	w9, [x8, #16]
                                        ; implicit-def: $x8
	mov	x8, x9
	sub	sp, sp, #16
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str.25@PAGE
	add	x0, x0, l_.str.25@PAGEOFF
	bl	_printf
	add	sp, sp, #16
	b	LBB1_26
LBB1_19:                                ;   in Loop: Header=BB1_13 Depth=2
	adrp	x8, _blocco_porte@PAGE
	ldrsw	x8, [x8, _blocco_porte@PAGEOFF]
	mov	x9, #10
	mul	x9, x8, x9
	adrp	x8, _stati@PAGE
	add	x8, x8, _stati@PAGEOFF
	add	x8, x8, x9
	sub	sp, sp, #16
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.26@PAGE
	add	x0, x0, l_.str.26@PAGEOFF
	bl	_printf
	add	sp, sp, #16
	b	LBB1_26
LBB1_20:                                ;   in Loop: Header=BB1_13 Depth=2
	adrp	x8, _back_home@PAGE
	ldrsw	x8, [x8, _back_home@PAGEOFF]
	mov	x9, #10
	mul	x9, x8, x9
	adrp	x8, _stati@PAGE
	add	x8, x8, _stati@PAGEOFF
	add	x8, x8, x9
	sub	sp, sp, #16
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.26@PAGE
	add	x0, x0, l_.str.26@PAGEOFF
	bl	_printf
	add	sp, sp, #16
	b	LBB1_26
LBB1_21:                                ;   in Loop: Header=BB1_13 Depth=2
	ldur	w8, [x29, #-12]
	subs	w8, w8, #2244
	cset	w8, ne
	tbnz	w8, #0, LBB1_23
	b	LBB1_22
LBB1_22:                                ;   in Loop: Header=BB1_13 Depth=2
	adrp	x8, _lampeggio@PAGE
	ldr	w9, [x8, _lampeggio@PAGEOFF]
                                        ; implicit-def: $x8
	mov	x8, x9
	sub	sp, sp, #16
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.27@PAGE
	add	x0, x0, l_.str.27@PAGEOFF
	bl	_printf
	add	sp, sp, #16
	b	LBB1_24
LBB1_23:                                ;   in Loop: Header=BB1_13 Depth=2
	adrp	x0, l_.str.22@PAGE
	add	x0, x0, l_.str.22@PAGEOFF
	bl	_printf
	b	LBB1_24
LBB1_24:                                ;   in Loop: Header=BB1_13 Depth=2
	b	LBB1_26
LBB1_25:                                ;   in Loop: Header=BB1_13 Depth=2
	adrp	x0, l_.str.22@PAGE
	add	x0, x0, l_.str.22@PAGEOFF
	bl	_printf
	b	LBB1_26
LBB1_26:                                ;   in Loop: Header=BB1_13 Depth=2
	ldur	w8, [x29, #-56]
	ldur	w9, [x29, #-20]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB1_28
	b	LBB1_27
LBB1_27:                                ;   in Loop: Header=BB1_13 Depth=2
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	ldursw	x9, [x29, #-56]
	mov	x10, #100
	mul	x9, x9, x10
	add	x8, x8, x9
	sub	sp, sp, #16
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.28@PAGE
	add	x0, x0, l_.str.28@PAGEOFF
	bl	_printf
	add	sp, sp, #16
	b	LBB1_29
LBB1_28:                                ;   in Loop: Header=BB1_13 Depth=2
	ldur	x8, [x29, #-88]                 ; 8-byte Folded Reload
	ldursw	x9, [x29, #-56]
	mov	x10, #100
	mul	x9, x9, x10
	add	x8, x8, x9
	sub	sp, sp, #16
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.29@PAGE
	add	x0, x0, l_.str.29@PAGEOFF
	bl	_printf
	add	sp, sp, #16
	b	LBB1_29
LBB1_29:                                ;   in Loop: Header=BB1_13 Depth=2
	b	LBB1_30
LBB1_30:                                ;   in Loop: Header=BB1_13 Depth=2
	ldur	w8, [x29, #-56]
	add	w8, w8, #1
	stur	w8, [x29, #-56]
	b	LBB1_13
LBB1_31:                                ;   in Loop: Header=BB1_11 Depth=1
	adrp	x0, l_.str.22@PAGE
	add	x0, x0, l_.str.22@PAGEOFF
	bl	_printf
	bl	_getchar
	sturb	w0, [x29, #-13]
	ldursb	w8, [x29, #-13]
	subs	w8, w8, #27
	cset	w8, ne
	tbnz	w8, #0, LBB1_51
	b	LBB1_32
LBB1_32:                                ;   in Loop: Header=BB1_11 Depth=1
	bl	_getchar
	subs	w8, w0, #91
	cset	w8, ne
	tbnz	w8, #0, LBB1_51
	b	LBB1_33
LBB1_33:                                ;   in Loop: Header=BB1_11 Depth=1
	bl	_getchar
	sturb	w0, [x29, #-13]
	ldursb	w8, [x29, #-13]
	subs	w8, w8, #65
                                        ; kill: def $x8 killed $w8
	stur	x8, [x29, #-128]                ; 8-byte Folded Spill
	subs	x8, x8, #3
	cset	w8, hi
	tbnz	w8, #0, LBB1_49
; %bb.34:                               ;   in Loop: Header=BB1_11 Depth=1
	ldur	x11, [x29, #-128]               ; 8-byte Folded Reload
	adrp	x10, lJTI1_0@PAGE
	add	x10, x10, lJTI1_0@PAGEOFF
Ltmp2:
	adr	x8, Ltmp2
	ldrsw	x9, [x10, x11, lsl #2]
	add	x8, x8, x9
	br	x8
LBB1_35:                                ;   in Loop: Header=BB1_11 Depth=1
	ldur	w8, [x29, #-20]
	ldur	w9, [x29, #-24]
	subs	w9, w9, #1
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB1_37
	b	LBB1_36
LBB1_36:                                ;   in Loop: Header=BB1_11 Depth=1
	ldur	w8, [x29, #-20]
	add	w8, w8, #1
	stur	w8, [x29, #-20]
	b	LBB1_40
LBB1_37:                                ;   in Loop: Header=BB1_11 Depth=1
	ldur	w8, [x29, #-20]
	ldur	w9, [x29, #-24]
	subs	w9, w9, #1
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB1_39
	b	LBB1_38
LBB1_38:                                ;   in Loop: Header=BB1_11 Depth=1
	stur	wzr, [x29, #-20]
	b	LBB1_39
LBB1_39:                                ;   in Loop: Header=BB1_11 Depth=1
	b	LBB1_40
LBB1_40:                                ;   in Loop: Header=BB1_11 Depth=1
	b	LBB1_50
LBB1_41:                                ;   in Loop: Header=BB1_11 Depth=1
	ldur	w8, [x29, #-20]
	subs	w8, w8, #0
	cset	w8, le
	tbnz	w8, #0, LBB1_43
	b	LBB1_42
LBB1_42:                                ;   in Loop: Header=BB1_11 Depth=1
	ldur	w8, [x29, #-20]
	subs	w8, w8, #1
	stur	w8, [x29, #-20]
	b	LBB1_46
LBB1_43:                                ;   in Loop: Header=BB1_11 Depth=1
	ldur	w8, [x29, #-20]
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB1_45
	b	LBB1_44
LBB1_44:                                ;   in Loop: Header=BB1_11 Depth=1
	ldur	w8, [x29, #-24]
	subs	w8, w8, #1
	stur	w8, [x29, #-20]
	b	LBB1_45
LBB1_45:                                ;   in Loop: Header=BB1_11 Depth=1
	b	LBB1_46
LBB1_46:                                ;   in Loop: Header=BB1_11 Depth=1
	b	LBB1_50
LBB1_47:                                ;   in Loop: Header=BB1_11 Depth=1
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	w8, #1
	stur	w8, [x29, #-28]
	b	LBB1_50
LBB1_48:                                ;   in Loop: Header=BB1_11 Depth=1
	ldur	x0, [x29, #-88]                 ; 8-byte Folded Reload
	ldur	w1, [x29, #-24]
	ldur	w2, [x29, #-20]
	ldur	w3, [x29, #-12]
	bl	_stottomenu
	b	LBB1_50
LBB1_49:                                ;   in Loop: Header=BB1_11 Depth=1
	b	LBB1_50
LBB1_50:                                ;   in Loop: Header=BB1_11 Depth=1
	b	LBB1_51
LBB1_51:                                ;   in Loop: Header=BB1_11 Depth=1
	b	LBB1_11
LBB1_52:
	ldur	x8, [x29, #-40]
	stur	x8, [x29, #-136]                ; 8-byte Folded Spill
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB1_54
	b	LBB1_53
LBB1_53:
	bl	___stack_chk_fail
LBB1_54:
	ldur	x8, [x29, #-136]                ; 8-byte Folded Reload
	mov	sp, x8
	mov	sp, x29
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
	.p2align	2
lJTI1_0:
	.long	LBB1_41-Ltmp2
	.long	LBB1_35-Ltmp2
	.long	LBB1_48-Ltmp2
	.long	LBB1_47-Ltmp2
	.p2align	2
lJTI1_1:
	.long	LBB1_16-Ltmp1
	.long	LBB1_17-Ltmp1
	.long	LBB1_18-Ltmp1
	.long	LBB1_19-Ltmp1
	.long	LBB1_20-Ltmp1
	.long	LBB1_21-Ltmp1
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	w8, [x29, #-8]
	subs	w8, w8, #2
	cset	w8, ne
	tbnz	w8, #0, LBB2_2
	b	LBB2_1
LBB2_1:
	ldr	x8, [sp, #16]
	ldr	x0, [x8, #8]
	bl	_atoi
	str	w0, [sp, #12]
	b	LBB2_3
LBB2_2:
	mov	w8, #1
	str	w8, [sp, #12]
	b	LBB2_3
LBB2_3:
	ldr	w0, [sp, #12]
	bl	_stampaMenu
	mov	w0, #0
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__data
	.globl	_stati                          ; @stati
_stati:
	.asciz	"OFF\000\000\000\000\000\000"
	.asciz	"ON\000\000\000\000\000\000\000"

	.globl	_blocco_porte                   ; @blocco_porte
	.p2align	2
_blocco_porte:
	.long	1                               ; 0x1

	.globl	_back_home                      ; @back_home
	.p2align	2
_back_home:
	.long	1                               ; 0x1

	.globl	_end                            ; @end
.zerofill __DATA,__common,_end,4,2
	.globl	_lampeggio                      ; @lampeggio
	.p2align	2
_lampeggio:
	.long	3                               ; 0x3
	.long	2                               ; 0x2
	.long	5                               ; 0x5

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"\033[2J"

l_.str.1:                               ; @.str.1
	.asciz	"\n***********************************\n********* Sotto Menu Data *********\n***********************************\n\nFUSO ORARIO UTILIZZATO : GMT+2\n"

l_.str.2:                               ; @.str.2
	.asciz	"\n***********************************\n********** Sotto Menu Ora *********\n***********************************\n\nFUSO ORARIO UTILIZZATO : GMT+2\n"

l_.str.3:                               ; @.str.3
	.asciz	"\n**************************************\n* Sotto Menu Blocco Automatico Porte *\n**************************************\n\n\nSTATO ATTUALE: %s\n1) USARE FRECCIE SU/GIU' PER MODIFICARE CAMBIARE STATO\n"

l_.str.4:                               ; @.str.4
	.asciz	"\n*************************************\n******** Sotto Menu Back-Home *******\n*************************************\n\nSTATO ATTUALE: %s\n1) USARE FRECCIE SU/GIU' PER MODIFICARE CAMBIARE STATO\n"

l_.str.5:                               ; @.str.5
	.asciz	"\n*************************************\n* Sotto Menu Check Frecce Direzione *\n*************************************\n\nSTATO ATTUALE: %d\n1) FRECCIA DESTRA PER MODIFICARE QUANTITA' LAMPEGGI\n"

l_.str.6:                               ; @.str.6
	.asciz	"\nINSERIRE N\302\260 LAMPEGGI ( Minimo = 2 e Massimo = 5 ): "

l_.str.7:                               ; @.str.7
	.asciz	"%d"

l_.str.8:                               ; @.str.8
	.asciz	"\n***********************************\n******* Sotto Menu Check Olio *****\n***********************************\n\n1) UTILIZZARE FRECCIA DESTRA PER ESEGUIRE UN CHECK DELL'OLIO\n"

l_.str.9:                               ; @.str.9
	.asciz	"\nCHECK OLIO ESEGUITO CORRETTAMENTE\n"

l_.str.10:                              ; @.str.10
	.asciz	"\n************************************\n* Sotto Menu Reset Pressione Gomme *\n************************************\n\n1) UTILIZZARE FRECCIA DESTRA PER ESEGUIRE UN RESET DELLA PRESSIONE\n"

l_.str.11:                              ; @.str.11
	.asciz	"\nPRESSIONE RESETTATA CORRETTAMENTE\n"

l_.str.12:                              ; @.str.12
	.asciz	"1) Data: "

l_.str.13:                              ; @.str.13
	.asciz	"2) Ora: "

l_.str.14:                              ; @.str.14
	.asciz	"3) Blocco Automatico Porte: "

l_.str.15:                              ; @.str.15
	.asciz	"4) Back-Home: "

l_.str.16:                              ; @.str.16
	.asciz	"5) Frecce Direzione: "

l_.str.17:                              ; @.str.17
	.asciz	"6) Check olio;"

l_.str.18:                              ; @.str.18
	.asciz	"7) Reset Pressione Gomme"

l_.str.19:                              ; @.str.19
	.asciz	"5) Check Olio;"

l_.str.20:                              ; @.str.20
	.asciz	"Setting Automobile:\n"

l_.str.21:                              ; @.str.21
	.asciz	"- %s\n"

l_.str.22:                              ; @.str.22
	.asciz	"\n"

l_.str.23:                              ; @.str.23
	.asciz	"Premi freccia sinistra o destra per scorrere il menu\n"

	.comm	_dt,20,2                        ; @dt
l_.str.24:                              ; @.str.24
	.asciz	"%02d/%02d/%04d\n"

l_.str.25:                              ; @.str.25
	.asciz	"%02d:%02d\n"

l_.str.26:                              ; @.str.26
	.asciz	"%s\n"

l_.str.27:                              ; @.str.27
	.asciz	"%d\n"

l_.str.28:                              ; @.str.28
	.asciz	"> %s"

l_.str.29:                              ; @.str.29
	.asciz	"  %s"

.subsections_via_symbols
