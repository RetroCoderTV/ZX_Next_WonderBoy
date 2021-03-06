;Usage:
;first call check_keys
;compare states of cached values (eg. keypressed_W) before doing movement/actions etc.
;after all actions, call reset_keys


; 32766 B, N, M, Symbol Shift, Space
; 49150 H, J, K, L, Enter
; 57342 Y, U, I, O, P
; 61438 6, 7, 8, 9, 0
; 63486 5, 4, 3, 2, 1
; 64510 T, R, E, W, Q
; 65022 G, F, D, S, A
; 65278 V, C, X, Z, Caps Shift


keypressed_W db FALSE
keypressed_W_Held db FALSE
keypressed_A db FALSE
keypressed_A_Held db FALSE
keypressed_S db FALSE
keypressed_S_Held db FALSE
keypressed_D db FALSE

keypressed_F db FALSE
keypressed_F_Held db FALSE
keypressed_I db FALSE
keypressed_Q db FALSE
keypressed_Q_Held db FALSE
keypressed_O db FALSE
keypressed_P db FALSE
keypressed_Space db FALSE
keypressed_Space_Held db FALSE

check_keys:
    ld a,(keypressed_W)
    cp TRUE
    call z,set_W_Held
    call nz, reset_W_Held

    ld a,(keypressed_S)
    cp TRUE
    call z,set_S_Held
    call nz, reset_S_Held

    ld a,(keypressed_F)
    cp TRUE
    call z, set_F_Held
    call nz, reset_F_Held

    ld a,(keypressed_A)
    cp TRUE
    call z,set_A_Held
    call nz, reset_A_Held

    ld a,(keypressed_Q)
    cp TRUE
    call z,set_Q_Held
    call nz, reset_Q_Held

    ld a,(keypressed_Space)
    cp TRUE
    call z,set_Space_Held
    call nz, reset_Space_Held



    xor a
    ld (keypressed_W),a
    ld (keypressed_A),a
    ld (keypressed_S),a
    ld (keypressed_D),a
    ld (keypressed_F),a
    ld (keypressed_I),a
    ld (keypressed_Q),a
    ld (keypressed_O),a
    ld (keypressed_P),a
    ld (keypressed_Space),a
    

    ld bc,0xFDFE ;ASDFG
    in a,(c)
    rra 
    push af
    call nc, set_A
    pop af
    rra
    push af
    call nc, set_S
    pop af
    rra
    push af
    call nc, set_D
    pop af  
    rra
    push af
    call nc, set_F
    pop af

    ld bc,0xFBFE ;QWERT
    in a,(c)
    rra ;Q
    push af
    call nc, set_Q
    pop af
    rra ;W
    push af
    call nc, set_W
    pop af

    ld bc,0xDFFE ;POIUY
    in a,(c)
    rra ;P
    push af
    call nc, set_P
    pop af
    rra ;O
    push af
    call nc, set_O
    pop af
    rra ;I
    push af
    call nc, set_I
    pop af

    ld bc,32766
    in a,(c)
    rra
    push af
    call nc, set_Space
    pop af


    ret

set_W:
    ld a,TRUE
    ld (keypressed_W),a
    ret

set_W_Held:
    ld a,TRUE
    ld (keypressed_W_Held),a
    ret
reset_W_Held:
    xor a
    ld (keypressed_W_Held),a
    ret

set_A:
    ld a,TRUE
    ld (keypressed_A),a
    ret

set_A_Held:
    ld a,TRUE
    ld (keypressed_A_Held),a
    ret 

reset_A_Held:
    xor a
    ld (keypressed_A_Held),a
    ret

set_S:
    ld a,TRUE
    ld (keypressed_S),a
    ret
set_S_Held:
    ld a,TRUE
    ld (keypressed_S_Held),a
    ret
reset_S_Held:
    xor a
    ld (keypressed_S_Held),a
    ret

set_D:
    ld a,TRUE
    ld (keypressed_D),a
    ret

set_F:
    ld a,TRUE
    ld (keypressed_F),a
    ret


set_F_Held:
    ld a,TRUE
    ld (keypressed_F_Held),a
    ret 

reset_F_Held:
    xor a
    ld (keypressed_F_Held),a
    ret



set_I:
    ld a,TRUE
    ld (keypressed_I),a
    ret


set_Q:
    ld a,TRUE
    ld (keypressed_Q),a
    ret

set_Q_Held:
    ld a,TRUE
    ld (keypressed_Q_Held),a
    ret 

reset_Q_Held:
    xor a
    ld (keypressed_Q_Held),a
    ret

set_O:
    ld a,TRUE
    ld (keypressed_O),a
    ret

set_P:
    ld a,TRUE
    ld (keypressed_P),a
    ret

set_Space:
    ld a,TRUE
    ld (keypressed_Space),a
    ret
set_Space_Held:
    ld a,TRUE
    ld (keypressed_Space_Held),a
    ret 

reset_Space_Held:
    xor a
    ld (keypressed_Space_Held),a
    ret
