;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; asm/reset.s
;; -----------
;; Handles boot-up and reset.
;; Basically, it just clears and initializes memory, stack, et cetera.
;; .

extern nesbin_reset

handle_reset:
	; Disable IRQs and decimal mode.
	sei
	
	; Clear some variables and flags.
	cld
	clc
	clv
	lda	#$00
	tax
	tay
	
	; Clear NES' internal RAM.
	rs_clr_int_ram:
		; Intended underflow :P
		dex
		
		sta	$0000, x
		sta	$0100, x
		sta	$0200, x
		sta	$0300, x
		sta	$0400, x
		sta	$0500, x
		sta	$0600, x
		sta	$0700, x
		bne	rs_clr_int_ram
	
	; [TODO] Add PPU and APU initialization code.
	
	; Jump to C function "nesbin_reset".
	jmp nesbin_reset
