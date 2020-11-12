

;0=wX
;1=wY
;2,3=xx
;4=y
;5=attr2
;6=attr3
;7=slot_ID
;8=vy
;9=y direction
;10=vTimer
;11=x pixel offset (yes this elements need rearranging)
;12=x direction
projectiles:
    db OUT_OF_WORLD,0 : dw 0 : db 0, %00000000, %00100100, 20,0,UP,0,0,0
    db OUT_OF_WORLD,0 : dw 0 : db 0, %00000000, %00100100, 21,0,UP,0,0,0
    db OUT_OF_WORLD,0 : dw 0 : db 0, %00000000, %00100100, 22,0,UP,0,0,0
    db OUT_OF_WORLD,0 : dw 0 : db 0, %00000000, %00100100, 22,0,UP,0,0,0
    db END_OF_ARRAY
PROJECTILES_DATA_LENGTH equ 13



PROJECTILE_MAX_VELOCITY equ 4
PROJECTILE_MIN_VELOCITY equ 0

PROJECTILE_X_VELOCITY equ 4

PROJECTILE_VELOCITY_DELAY equ 8

PROJECTILE_MAX_DISTANCE equ 127


projectiles_init:
    
    ret







projectiles_spawn:
    ld ix,projectiles
proj_spwn_start:
    ld a,(ix)
    cp END_OF_ARRAY
    ret z

    ld a,(ix+6)
    bit 7,a
    jp nz,proj_spwn_next

    set 7,a
    ld (ix+6),a



    ;spawn one here...
    ld a,(player_world_x) 
    ld (ix),a

    xor a ;py offset
    ld (ix+4),a

    ld a,(player_world_y)
    ld (ix+1),a

    ld (ix+8),PROJECTILE_MAX_VELOCITY

    ld (ix+9),UP

    xor a
    ld (ix+10),a
    ld (ix+11),a

    ld a,(player_walk_direction)
    ld (ix+12),a


    ret
proj_spwn_next:
    ld de,PROJECTILES_DATA_LENGTH
    add ix,de
    jp proj_spwn_start



projectiles_update:
    ld ix,projectiles
proj_upd_start:
    ld a,(ix)
    cp END_OF_ARRAY
    ret z

    call projectile_update

proj_upd_next:
    ld de,PROJECTILES_DATA_LENGTH
    add ix,de
    jp proj_upd_start



projectiles_draw:
    ld ix,projectiles
proj_drw_start:
    ld a,(ix)
    cp END_OF_ARRAY
    ret z

    
    ld a,(ix+6)
    bit 7,a
    jp z,proj_drw_next

    call projectile_draw

proj_drw_next:
    ld de,PROJECTILES_DATA_LENGTH
    add ix,de
    jp proj_drw_start





projectile_draw:
    ld a,(ix+7)
    nextreg $34,a

    ld a,(ix+12)
    cp LEFT
    jp z,proj_draw_left

    ld a,(ix+2)
    ld l,a
    ld a,(ix+3)
    ld h,a
    ld a,(ix+11)
    push hl ;save hl to restore further down
    add hl,a ;add pixelx offset 
    ld (ix+2),l
    ld (ix+3),h
proj_draw:
    ;attr 0 (x lsb)
    ld a,(ix+2)
    nextreg $35,a

    ;attr 1 (y)
    ld a,(ix+9)
    cp DOWN
    jp z,proj_draw_down

    ld a,(ix+4)
    ld b,a
    ld a,(ix+1)
    add a,a
    add a,a
    add a,a
    add a,a
    sub b
    nextreg $36,a
proj_drw_attr2:
    ;attr 2 
    ld a,(ix+5)
    ld b,a
    ld a,(ix+3) ;X8 (msb)
    or b
    nextreg $37,a

    ;attr 3
    ld a,(ix+6)
    nextreg $38,a

    ;draw routine ends here...
    pop hl
    ld (ix+2),l
    ld (ix+3),h

    ret

proj_draw_left:
    ld a,(ix+2)
    ld l,a
    ld a,(ix+3)
    ld h,a
    ld a,(ix+11)
    ld b,a
    ld a,l
    sub b

    push hl ;save hl to restore further down
    ; neg : add hl,a ;add pixelx offset 
    ld (ix+2),a
    ld (ix+3),h

    jp proj_draw
proj_draw_down:
    ld a,(ix+4)
    ld b,a
    ld a,(ix+1)
    add a,a
    add a,a
    add a,a
    add a,a
    add a,b
    nextreg $36,a
    jp proj_drw_attr2





projectile_update:
    call projectile_check_in_view
    call projectile_calculate_screen_pos

    ld a,(frame_counter)
    and %00000011
    call z,projectile_rotate
    
    ld a,(ix+6)
    bit 7,a
    ret z

    call proj_move_sideways
    
    ld a,(ix+10)
    inc a
    ld (ix+10),a


    ld a,(ix+9)
    cp DOWN
    jp z,p_upd_dwn
    ;move projectile up
    ld a,(ix+4) ;y pixel offset
    add a,(ix+8) ;y Vel
    ld (ix+4),a
    cp MAX_SCROLL
    call z,proj_up_one
    ret
p_upd_dwn:   
    ;move projectile down
    ld a,(ix+4) ;y scroll
    add a,(ix+8) ;y Vel
    ld (ix+4),a
    cp MAX_SCROLL
    call z,proj_down_one
    ret



proj_move_sideways:
    ld a,(ix+12)
    cp LEFT
    push af
    call z,proj_move_left
    pop af
    ret z

    call proj_move_right
    ret
proj_move_left:
 
    ld a,(ix+11)
    add a,(ix+8)
    ld (ix+11),a 

    ld a,(ix+11)
    cp 127
    call nc, projectile_kill


    ld a,(ix+2)
    ld l,a
    ld a,(ix+3)
    ld h,a
    ld a,(ix+11)
    SUB_HL_A ;see macros

    ld a,h
    bit 0,a
    ret nz
    
    ld a,l
    or a
    call m, projectile_kill
    ;TODO: study M flag

    ret

proj_move_right:
    ld a,(ix+11)
    add a,(ix+8)
    ld (ix+11),a 

    ld a,(ix+11)
    cp 127
    call nc, projectile_kill

    ld a,(ix+2)
    ld l,a
    ld a,(ix+3)
    ld h,a
    ld a,(ix+11)
    add hl,a

    ld a,h
    bit 0,a
    ret z
    
    ld a,l
    cp LOW 320
    call nc, projectile_kill


    ret





proj_up_one:
    ld a,(ix+1)
    dec a
    ld (ix+1),a
    ld (ix+4),0
    cp 0
    call z,projectile_kill ;kill it if top of screen
    
    ld a,(ix+10)
    cp PROJECTILE_VELOCITY_DELAY
    ret c

    ld a,(ix+8)
    and %11111110
    rrca
    ld (ix+8),a
    cp 0
    ld (ix+9),DOWN

    xor a
    ld (ix+10),a
    
    ret

proj_down_one:
    ld a,(ix+1)
    inc a
    ld (ix+1),a
    ld (ix+4),0
    cp 15
    call z,projectile_kill ;kill it if top of screen
    
    ld a,(ix+10)
    cp PROJECTILE_VELOCITY_DELAY
    ret c
    
    ld a,(ix+8)
    cp PROJECTILE_MAX_VELOCITY
    ret z
    add a,a
    ld (ix+8),a

    xor a
    ld (ix+10),a


    ret











projectile_rotate:
    ld a,(ix+5)
    add a,2
    and %00001110
    ld (ix+5),a
    ret



projectile_kill:
    res 7,(ix+6)
    call projectile_draw

    ld (ix),OUT_OF_WORLD


    ret



projectile_calculate_screen_pos:
    ld a,(scroll_direction)
    cp LEFT
    jp z,proj_screen_moving_left
    cp RIGHT
    jp z,proj_screen_moving_right

    ret


proj_screen_moving_left:
    ;X (scroll left)
    ld a,(cam_x)
    ld b,a
    ld a,(ix+0) ;wX
    sub b ;wX-camX
    ld hl,0
    add hl,a
    add hl,hl
    add hl,hl
    add hl,hl  
    add hl,hl  
    ld a,(current_scroll)
    ld b,a
    ld a,16
    sub b
    add hl,a
    ld (ix+2),l
    ld (ix+3),h ;X8
    ret

proj_screen_moving_right:
    ;X (scroll left)
    ld a,(cam_x)
    ld b,a
    ld a,(ix) ;wX
    sub b ;wX-camX
    ld hl,0
    add hl,a
    add hl,hl
    add hl,hl
    add hl,hl  
    add hl,hl  
    ld a,(current_scroll)
    ld b,a
    ld a,16
    sub b
    add hl,a  
    ld (ix+2),l
    ld (ix+3),h ;X8

    ret



projectile_check_in_view:
    ld a,(ix)
    ld b,a
    ld a,(cam_x)
    add a,VIEW_WIDTH_META
    cp b
    jp c, proj_set_not_inview

    ld a,(cam_x)
    ld b,a
    ld a,(ix)
    cp b
    jp c, proj_set_not_inview

   
    ; set to inview=yes
    set 7,(ix+6)

    ret

proj_set_not_inview:
    ld (ix),OUT_OF_WORLD
    bit 7,(ix+6)
    ret z

    res 7,(ix+6)
    call projectile_draw

    
    ret
