;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; asm/header.s
;; ------------
;; iNES file header.
;; .

; 0 = NROM
NES_MAPPER		= 04

; 0 = horizontal mirroring,
; 1 = vertical mirroring.
NES_MIRROR		= 1

; 0 = no battery-backed SRAM.
; 1 = battery-backed SRAM at $6000...$7fff.
NES_SRAM		= 0

; ID.
.byte			'N', 'E', 'S', $1a
; 16k PRG ROM.
.byte			$04, $0f
; × 8k CHR chunks.
.byte			NES_MIRROR | (NES_SRAM << 1) | ((NES_MAPPER & $f) << 4)
.byte			(NES_MAPPER & %11110000)
; Padding :P
.byte			$0, $0, $0, $0, $0, $0, $0, $0
