	
    
;;;;;Tiles

   



caveman_palette:
    incbin 'assets/cavetiles2.nxp',0

    MMU 6,16
    org $c000

    incbin 'assets/cavetiles2.til',0,TILE_DEFINITIONS_SIZE


; 	;courtesy of ped7g:
;     ; patch tile gfx with grid gfx
; tileN=1
;     DUP 128-tileN
;         ORG $C000 + tileN*32
;         DB $FF
;         DB {b $ } | $F0
;         ORG $C000 + tileN*32 + 1*4
;         DB {b $ } | $F0
;         ORG $C000 + tileN*32 + 2*4
;         DB {b $ } | $F0
;         ORG $C000 + tileN*32 + 6*4 + 3
;         DB {b $ } | $0F
;         ORG $C000 + tileN*32 + 7*4 + 3
;         DB $FF
; tileN=tileN+1
;     EDUP



;;
;;Caveman Walk Animation:
; A>B>C>D>A>B>C>D

;;;sprites
;WBOY SPRITES:
;Idle = A,B
;Walk = C,D,E,F


;size (in patterns) for the head and body parts
WBOY_HEAD_SIZE equ 2
WBOY_BODY_SIZE equ 2

;animation frame counts
WBOY_FRAMECOUNT_IDLE equ 2
WBOY_FRAMECOUNT_RUN equ 4

;animation start patterns...
WBOY_ANIMATION_IDLE equ 2
WBOY_ANIMATION_RUN equ 6

WBOY_PATTERN_COUNT equ 12
WBOY_PATTERNS_PER_SPRITE equ 4

    MMU 6,14
    org $c000


wBoy_Head1: ;0
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $D5, $FC, $E3, $E3, $E3, $FC, $FC, $FC;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $FC, $FC, $FC, $D5, $AD, $FC, $FC, $FC, $FC, $FC;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $D5, $AD, $FC, $FC, $D5, $FC, $FC, $FC;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $FC, $FC, $FC, $FC, $D5, $FC, $D5, $D5, $FC;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $D5, $D5, $D5, $D5, $FC, $FC;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $D5, $D5, $D5, $D5, $FC, $FC;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $D5, $D5, $D5, $D5, $FC, $FC, $FC;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $D5, $D5, $D5, $FC, $FC, $AC, $FC;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $D5, $D5, $FC, $FC, $FC, $AD, $FC;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $D5, $D5, $FC, $FC, $FC, $AD, $AD;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $D5, $D5, $F6, $AD, $FC, $AD, $AD;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $D5, $D5, $F6, $AD, $FC, $AD, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $D5, $D5, $FC, $AC, $AD, $AD;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $D5, $D5, $FC, $FC, $AC, $AD;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $D5, $D5, $FC, $FC, $AC, $AD;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $D5, $D5, $FC, $FC, $AC;



wBoy_Head2: ;1
	db  $FC, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $FF, $FF, $FC, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $FC, $FC, $FF, $FF, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $FC, $FC, $FC, $FF, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $FC, $FC, $FC, $FC, $FC, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $FF, $FC, $FC, $FC, $FF, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $FF, $AC, $FC, $FC, $AC, $FC, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $FC, $AD, $FC, $AD, $AD, $FC, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $AD, $AD, $F6, $F6, $F6, $AD, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $FF, $FF, $F6, $FF, $F6, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $FF, $FF, $20, $F6, $20, $FF, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $FF, $FF, $20, $F6, $20, $FF, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $F6, $F6, $F6, $F6, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $F6, $FF, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $F6, $E1, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $AD, $F6, $F6, $F6, $F6, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;


;bodies:

legs1_A: ;2
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $AD, $AD;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $AC, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $F6, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $F6, $F6, $AD;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $AD, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $10, $AD, $AD, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $10, $10, $AD, $AD, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $10, $10, $AD, $AD, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $10, $10, $20, $20, $AD, $AD;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $20, $E3, $E3, $20, $20;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;



legs1_B: ;3
	db  $AC, $AD, $AD, $AD, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $F6, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $AD, $F6, $F6, $F6, $F6, $AD, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $AD, $AD, $F6, $F6, $F6, $AD, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $AD, $F6, $F6, $AC, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $AD, $F6, $AD, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $10, $10, $10, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $10, $10, $10, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $F6, $10, $10, $10, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $F6, $AD, $20, $10, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $AC, $AC, $AD, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $AD, $AD, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $AD, $AD, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $AD, $AD, $F6, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $20, $AD, $AD, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $E3, $20, $20, $20, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;










legs2_A: ;4
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $AD, $AD;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $AC, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $F6, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $F6, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $10, $14, $14, $14;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $10, $10, $10, $14, $14;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $10, $10, $10, $AD, $F6, $14;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $10, $AD, $F6, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $AD, $F6, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $AD, $F6, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $AD, $F6, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $AD, $AD, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $AD, $AD, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $20, $20;



legs2_B: ;5
	db  $AC, $AD, $AD, $AD, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $F6, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $AD, $F6, $F6, $F6, $F6, $AD, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $AD, $F6, $F6, $F6, $AD, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $AD, $F6, $F6, $AD, $AC, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $AD, $F6, $F6, $AD, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $AC, $AD, $AD, $AD, $F6, $F6, $10, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $10, $10, $AD, $AD, $F6, $F6, $10, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $14, $10, $AD, $AD, $F6, $F6, $20, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $14, $14, $AD, $AD, $F6, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $20, $14, $20, $AD, $F6, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $E3, $20, $E3, $20, $20, $20, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;









wBoy_C_3:
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $F6, $AD, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $F6, $AC, $AD;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $F6, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $F6, $F6, $F6, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $20, $F6, $F6, $AD;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $10, $10, $10, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $10, $10, $AC, $F6, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $10, $10, $10, $AD, $AD, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $20, $20, $AD, $AD, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $AD, $F6;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $AD, $AD;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $AD, $AD;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20, $AD;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $20;



wBoy_C_4:
	db  $AC, $AD, $AD, $AD, $FC, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $F6, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $F6, $F6, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $F6, $F6, $F6, $AD, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $AC, $F6, $F6, $F6, $F6, $AD, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $AC, $AD, $AD, $F6, $AD, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $AD, $10, $14, $14, $14, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $10, $14, $14, $10, $14, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $10, $14, $10, $14, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $20, $AD, $14, $14, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $AC, $AD, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $AC, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $F6, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $AD, $F6, $F6, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;
	db  $20, $20, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3;



    
;;;;;;Fonts
    
    
    
    MMU 6,17
	org 0xC000

	ds 64,0
	; incbin "fonts/font1.spr"
	; incbin "fonts/font2.spr"
	; incbin "fonts/font3.spr"
	; incbin "fonts/font4.spr"
	; incbin "fonts/font5.spr"
	; incbin "fonts/font6.spr"
	incbin "fonts/font7.spr"
	; incbin "fonts/font8.spr"
	; incbin "fonts/font9.spr"
	; incbin "fonts/font10.spr"
	; incbin "fonts/font11.spr"
	; incbin "fonts/font12.spr"
	; incbin "fonts/font13.spr"
	; incbin "fonts/font14.spr"
	; incbin "fonts/font15.spr"
	; incbin "fonts/font16.spr"
	; ; incbin "fonts/font17.spr"
	; incbin "fonts/font18.spr" *not mapped same as others (?)
	



;; Layer2

	MMU 7 n,40
	org $e000
	incbin "assets/skybigrotated.bmp", 1078