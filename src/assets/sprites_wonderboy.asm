

;WBOY SPRITES:
;Idle = A,B
;Walk = C,D,E,F


WBOY_PATTERN_COUNT equ 12
WBOY_PATTERNS_PER_SPRITE equ 4




wBoy_A_1:
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



wBoy_A_2:
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



wBoy_A_3:
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



wBoy_A_4:
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




wBoy_B_1:
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



wBoy_B_2:
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



wBoy_B_3:
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



wBoy_B_4:
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







wBoy_C_1:
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $FC, $E3, $E3, $E3, $FC, $FC, $FC;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $FC, $FC, $D5, $AD, $FC, $FC, $FC, $FC, $FC;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $E3, $D5, $AD, $D5, $FC, $D5, $FC, $FC, $FC;
	db  $E3, $E3, $E3, $E3, $E3, $E3, $E3, $FC, $FC, $D5, $FC, $D5, $FC, $D5, $D5, $FC;
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



wBoy_C_2:
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


