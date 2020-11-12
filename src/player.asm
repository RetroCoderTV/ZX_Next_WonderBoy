    




PLAYER_SLOT equ 50

PLAYER_DEFAULT_ATTR3 equ %11000000

PLAYER_HEIGHT equ 32

SCROLL_MARKER_X equ 320/2

PLAYER_WALK_SPEED equ 1



player_world_x db 0 ;in cells
player_world_y db 0

px dw 48
py db 0
player_attr_2 db %00000000
player_attr_3 db PLAYER_DEFAULT_ATTR3
player_attr_4 db %00100000

legs1_attr_3 db %11000010
legs2_attr_3 db %11000011


player_animation_timer db 0
PLAYER_ANIMATION_DELAY equ 4


;movement states:
IDLE equ 0x0
WALKING equ 0xA
JUMPING equ 0xB
ATTACKING equ 0xC
CLIMBING equ 0xD

player_animation_state db JUMPING


vy dw 0

DOWN_FORCE equ 32
UP_FORCE equ 64

MAX_DOWN_SPEED equ 7
MAX_UP_SPEED equ 5



player_collided_solid db FALSE



player_walk_direction db RIGHT
player_jump_direction db DOWN
player_jump_point db 208
PLAYER_JUMP_HEIGHT equ 15
PLAYER_JUMP_ATTR3 equ %11001001
player_grounded db FALSE


player_init:
    call player_init_sprites
    
    ret


draw_debug_sprite:

    ret

player_init_sprites:
    ld a,PLAYER_SLOT
    nextreg $34,a

    ;Ax
    ;xx

    ;attr 0
    ld a,(px)
    nextreg $35,a

    ;attr 1
    ld a,(py)
    nextreg $36,a

    ;attr 2
    ld a,(player_attr_2)
    ld b,a
    ld hl,(px)
    ld a,h
    or b
    nextreg $37,a

    ;attr 3
    ld a,(player_attr_3)
    nextreg $38,a

    ;attr 4
    ld a,(player_attr_4)
    nextreg $39,a

    ;relative sprites...

    ;r1:
    ;AR
    ;xx
    

    ld a,PLAYER_SLOT+1
    nextreg $34,a

    ;a0
    ld a,16
    nextreg $35,a

    ;a1
    ld a,0
    nextreg $36,a

    ;a2
    ld a,%00000001
    nextreg $37,a

    ;a3
    ld a,%11000001
    nextreg $38,a

    ;a4
    ld a,%01000001
    nextreg $39,a

    ;r2:
    ;Ax
    ;Rx
    ld a,PLAYER_SLOT+2
    nextreg $34,a
    
    ;a0
    ld a,0
    nextreg $35,a

    ;a1
    ld a,16
    nextreg $36,a

    ;a2
    ld a,%00000001
    nextreg $37,a

    ;a3
    ld a,(legs1_attr_3)
    nextreg $38,a

    ;a4
    ld a,%01000001
    nextreg $39,a

    ;r3:
    ;Ax
    ;xR

    ld a,PLAYER_SLOT+3
    nextreg $34,a
    
    ;a0
    ld a,16
    nextreg $35,a

    ;a1
    ld a,16
    nextreg $36,a

    ;a2
    ld a,%00000001
    nextreg $37,a

    ;a3
    ld a,(legs2_attr_3)
    nextreg $38,a

    ;a4
    ld a,%01000001
    nextreg $39,a

    ret 
;


player_draw:
       ld a,PLAYER_SLOT
    nextreg $34,a

    ;Ax
    ;xx

    ;attr 0
    ld a,(px)
    nextreg $35,a

    ;attr 1
    ld a,(py)
    nextreg $36,a

    ;attr 2
    ld a,(player_attr_2)
    ld b,a
    ld hl,(px)
    ld a,h
    or b
    nextreg $37,a

    ;attr 3
    ld a,(player_attr_3)
    nextreg $38,a

    ;attr 4
    ld a,(player_attr_4)
    nextreg $39,a

    ;relative sprites...

    ;r1:
    ;AR
    ;xx
    

    ld a,PLAYER_SLOT+1
    nextreg $34,a

    ;a0
    ld a,16
    nextreg $35,a

    ;a1
    ld a,0
    nextreg $36,a

    ;a2
    ld a,%00000001
    nextreg $37,a

    ;a3
    ld a,%11000001
    nextreg $38,a

    ;a4
    ld a,%01000001
    nextreg $39,a

    ;r2:
    ;Ax
    ;Rx
    ld a,PLAYER_SLOT+2
    nextreg $34,a
    
    ;a0
    ld a,0
    nextreg $35,a

    ;a1
    ld a,16
    nextreg $36,a

    ;a2
    ld a,%00000001
    nextreg $37,a

    ;a3
    ld a,(legs1_attr_3)
    nextreg $38,a

    ;a4
    ld a,%01000001
    nextreg $39,a

    ;r3:
    ;Ax
    ;xR

    ld a,PLAYER_SLOT+3
    nextreg $34,a
    
    ;a0
    ld a,16
    nextreg $35,a

    ;a1
    ld a,16
    nextreg $36,a

    ;a2
    ld a,%00000001
    nextreg $37,a

    ;a3
    ld a,(legs2_attr_3)
    nextreg $38,a

    ;a4
    ld a,%01000001
    nextreg $39,a

    ret 



player_update:
    ld a,(player_animation_timer)
    inc a
    ld (player_animation_timer),a

 


    ld a,(keypressed_Q)
    cp TRUE
    call z,throw_hammer

    ld a,(player_animation_state)
    cp WALKING
    jp z, player_update_walking
    cp JUMPING
    jp z, player_update_jumping
    cp IDLE
    jp z,player_update_idle


    ret

player_update_idle:
    ld a,IDLE
    ld (player_animation_state),a
    ld a,(player_animation_timer)
    cp 15 ;frame time 
    call nc, player_animate_idle

    ret

player_walking_start:
    ld a,(player_animation_state)
    cp WALKING
    jp z,player_update_walking

    ld hl,0
    ld (vy),hl

    ld a,WALKING
    ld (player_animation_state),a

    ld a,PLAYER_DEFAULT_ATTR3
    ld (player_attr_3),a

    ret
player_update_walking:
    

    call check_grounded

    ld a,(keypressed_Space)
    cp TRUE
    call z,player_jump_start

    ld a,(keypressed_A)
    cp TRUE
    jp z,plyr_move_left_start

    ld a,(keypressed_D)
    cp TRUE
    jp z,plyr_move_right_start

    ;else idle walking state...
    ld a,IDLE
    ld (player_animation_state),a
    


    ret

player_jump_start:
    ld a,(keypressed_Space_Held)
    cp TRUE
    ret z

    ld a,(player_animation_state)
    cp JUMPING
    ret z

    ld a,PLAYER_JUMP_ATTR3
    ld (player_attr_3),a

    ld a,JUMPING
    ld (player_animation_state),a
    
    ld a,(py)
    ld (player_jump_point),a

    ld a,UP
    ld (player_jump_direction),a

    jp player_update


player_update_jumping:  
    ld a,(keypressed_A)
    cp TRUE
    call z,plyr_move_left_start

    ld a,(keypressed_D)
    cp TRUE
    call z,plyr_move_right_start

    call player_calculate_world_position

    call check_collision_jumping
    
    ld a,(player_jump_point)
    sub PLAYER_JUMP_HEIGHT
    ld b,a
    ld a,(py)
    cp b
    call c,plyr_set_jump_down

    
    ld a,(player_jump_direction)
    cp UP
    push af
    call z, apply_force_up
    pop af
    cp DOWN
    push af
    call z, apply_force_down
    pop af
    

    
    call apply_velocity

   
    ret




plyr_set_jump_down:
    ld a,DOWN
    ld (player_jump_direction),a
    ret

apply_force_up:
    ld hl,(vy)
    ld a,h
    cp -MAX_UP_SPEED
    ret z
    
    add hl,-UP_FORCE*2
    ld (vy),hl
    ret
apply_force_down:
    ld hl,(vy)
    ld a,h
    cp MAX_DOWN_SPEED
    ret z
    add hl,DOWN_FORCE
    ld (vy),hl
    ret

apply_velocity:
    ld hl,py
    ld b,(hl)
    ld hl,(vy)
    ld a,h
    add a,b
    ld (py),a
    ret



plyr_move_left_start:
    ld a,LEFT
    ld (player_walk_direction),a

    ld a,(player_attr_2)
    bit 3,a
    jp nz,plyr_move_left

    ld a,(player_attr_2)
    set 3,a
    ld (player_attr_2),a

    ld hl,(px)
    add hl,32 ;2 relatives width (plus anchor)
    ld (px),hl

    ret
plyr_move_left:
    
    call player_calculate_world_position
    ; ; ; ; ; ; ; ; call check_collision_left

    ld a,(player_collided_solid)
    cp TRUE
    ret z

    ld a,(player_animation_timer)
    cp PLAYER_ANIMATION_DELAY
    call nc, player_animate_walk

    ld hl,(px)
    ld a,h
    cp 0
    jp nz,p_move_left
    ld a,l
    cp SCROLL_MARKER_X+16
    jp c,scroll_left
    jp nc,p_move_left
        
p_move_left:
    add hl,-PLAYER_WALK_SPEED
    ld (px),hl
    ret


plyr_move_right_start:
    ld a,RIGHT
    ld (player_walk_direction),a

    ld a,(player_attr_2)
    bit 3,a
    jp z,plyr_move_right

    ld a,(player_attr_2)
    res 3,a
    ld (player_attr_2),a

    ld hl,(px)
    add hl,-32
    ld (px),hl
    ret
plyr_move_right:
    call player_calculate_world_position
    ; ; ; ; ; ; ; ; ; ; call check_collision_right

    ld a,(player_collided_solid)
    cp TRUE
    ret z

    ld a,(player_animation_timer)
    cp PLAYER_ANIMATION_DELAY
    call nc, player_animate_walk

    ld hl,(px)
    ld a,l
    cp SCROLL_MARKER_X-16
    jp nc,scroll_right
    jp c,p_move_right
        
p_move_right
    add hl,PLAYER_WALK_SPEED
    ld (px),hl
    ret











player_animate_idle:
    xor a
    ld (player_animation_timer),a

    ld a,(player_animation_state)
    cp IDLE
    ret nz
  
    ld a,(legs1_attr_3)
    and %00111111 ;mask out top 2 bits
    cp 4        ;WBOY_ANIMATION_IDLE+((WBOY_FRAMECOUNT_IDLE-1)*WBOY_BODY_SIZE)
    jp z,plyr_set_idle_startframe
   
    add a,2
    add a,PLAYER_DEFAULT_ATTR3
    ld (legs1_attr_3),a
    inc a
    ld (legs2_attr_3),a

    ret

plyr_set_idle_startframe: 
    ld a,2
    add a,PLAYER_DEFAULT_ATTR3
    ld (legs1_attr_3),a
    inc a
    ld (legs2_attr_3),a
    ret

player_animate_walk:
    ; xor a
    ; ld (player_animation_timer),a

    ; ld a,(player_animation_state)
    ; cp WALKING
    ; ret nz
    
    ; ld a,(player_attr_3)
    ; and %00111111 ;mask out top 2 bits
    ; cp SPRITE_PLAYER_COUNT-SPRITE_SEGMENTS
    ; jp z,player_set_to_default_frame
    ; add a,SPRITE_SEGMENTS
    ; add a,PLAYER_DEFAULT_ATTR3
    ; ld (player_attr_3),a
    ret

player_set_to_default_frame:
    ld a,PLAYER_DEFAULT_ATTR3
    ld (player_attr_3),a
    ret


player_calculate_world_position:
    ld a,(py)
    and %11110000
    rrca
    rrca
    rrca
    rrca
    ld (player_world_y),a

    ld a,(player_walk_direction)
    cp RIGHT
    jp z, p_wp_r
 
p_wp_l:
    ld hl,(px)
    ; add hl,32
    ld a,l
    and %11110000
    rrca
    rrca
    rrca 
    rrca
    ld b,a
    ld a,(cam_x)
    ld c,a
    ld a,b
    add a,c    
    ld (player_world_x),a
    ret
p_wp_r:
    ld hl,(px)
    add hl,24
    ld a,l
    and %11110000
    rrca
    rrca
    rrca 
    rrca
    ld b,a
    ld a,(cam_x)
    ld c,a
    ld a,b
    add a,c    
    ld (player_world_x),a
    ret



check_collision_jumping:
    ld a,(player_animation_state)
    cp JUMPING
    ret nz

    ld a,(player_jump_direction)
    cp DOWN
    ret nz


    ld hl,superlevel
    ld a,(player_world_y)
    cp 6
    ret c
    sub 6
    ld d,a
    ld e,LEVEL_WIDTH_META
    mul d,e
    add hl,de
    ld a,(player_world_x)
    ld e,a
    ld d,0
    add hl,de
    ld a,(hl)
    call check_solid
    jp z,collided_jumping

    ld hl,superlevel
    ld a,(player_world_y)
    cp 6
    ret c
    sub 6
    ld d,a
    ld e,LEVEL_WIDTH_META
    mul d,e
    add hl,de
    ld a,(player_world_x)
    add a,1
    ld e,a
    ld d,0
    add hl,de
    ld a,(hl)
    call check_solid
    jp z,collided_jumping

    

    ret


collided_jumping:
    
    ;snap to nearest cell
    ld a,(player_world_y)
    add a,a
    add a,a
    add a,a
    add a,a
    ld (py),a
   
    ld a,(player_jump_direction)
    cp UP
    ret z

    ;collided
    call player_walking_start
    

    
    ret

    
check_grounded:
    ld a,(player_jump_direction)
    cp DOWN
    ret nz

    ld hl,superlevel
    ld a,(player_world_y)
    cp 6
    ret c
    sub 6
    ld d,a
    ld e,LEVEL_WIDTH_META
    mul d,e
    add hl,de
    ld a,(player_world_x)
    ld e,a
    ld d,0
    add hl,de
    ld a,(hl)
    call check_solid
    jp z,grounded_true


    jp grounded_false
grounded_true:

    ld a,TRUE
    ld (player_grounded),a 
    ret

grounded_false:
    ld a,FALSE
    ld (player_grounded),a
    

    ld a,JUMPING
    ld (player_animation_state),a

    ret


; check_collision_left:
;     ld hl,level1
;     ld a,(player_world_y)
;     add a,2
;     ld d,a
;     ld e,WORLD_WIDTH
;     mul d,e
;     add hl,de
;     ld a,(player_world_x)
;     ld e,a
;     ld d,0
;     add hl,de
;     ld a,(hl)
;     cp 12
;     jp c,collided_solid_sideways

;     ld a,FALSE
;     ld (player_collided_solid),a

;     ret



; check_collision_right:
;     ld hl,(px)
;     ld a,h
;     cp 0
;     jp nz, check_collision_right_x8

;     ld hl,level1
;     ld a,(player_world_y)
;     ld d,a
;     ld e,WORLD_WIDTH
;     mul d,e
;     add hl,de
;     ld a,(player_world_x)
;     add a,1
;     ld e,a
;     ld d,0
;     add hl,de
;     ld a,(hl)
;     cp 12
;     jp c,collided_solid_sideways

;     ld hl,level1
;     ld a,(player_world_y)
;     add a,1
;     ld d,a
;     ld e,WORLD_WIDTH
;     mul d,e
;     add hl,de
;     ld a,(player_world_x)
;     add a,1
;     ld e,a
;     ld d,0
;     add hl,de
;     ld a,(hl)
;     cp 12
;     jp c,collided_solid_sideways

;     ld hl,level1
;     ld a,(player_world_y)
;     add a,2
;     ld d,a
;     ld e,WORLD_WIDTH
;     mul d,e
;     add hl,de
;     ld a,(player_world_x)
;     add a,1
;     ld e,a
;     ld d,0
;     add hl,de
;     ld a,(hl)
;     cp 12
;     jp c,collided_solid_sideways

;     ld hl,level1
;     ld a,(player_world_y)
;     add a,3
;     ld d,a
;     ld e,WORLD_WIDTH
;     mul d,e
;     add hl,de
;     ld a,(player_world_x)
;     add a,1
;     ld e,a
;     ld d,0
;     add hl,de
;     ld a,(hl)
;     cp 12
;     jp c,collided_solid_sideways



;     ld a,FALSE
;     ld (player_collided_solid),a

;     ret

; check_collision_right_x8:
;     ld hl,level1
;     ld a,(player_world_y)
;     ld d,a
;     ld e,WORLD_WIDTH
;     mul d,e
;     add hl,de
;     ld a,(player_world_x)
;     add a,33
;     ld e,a
;     ld d,0
;     add hl,de
;     ld a,(hl)
;     cp 12
;     jp c,collided_solid_sideways

;     ld hl,level1
;     ld a,(player_world_y)
;     add a,1
;     ld d,a
;     ld e,WORLD_WIDTH
;     mul d,e
;     add hl,de
;     ld a,(player_world_x)
;     add a,33
;     ld e,a
;     ld d,0
;     add hl,de
;     ld a,(hl)
;     cp 12
;     jp c,collided_solid_sideways

;     ld hl,level1
;     ld a,(player_world_y)
;     add a,2
;     ld d,a
;     ld e,WORLD_WIDTH
;     mul d,e
;     add hl,de
;     ld a,(player_world_x)
;     add a,33
;     ld e,a
;     ld d,0
;     add hl,de
;     ld a,(hl)
;     cp 12
;     jp c,collided_solid_sideways

;     ld hl,level1
;     ld a,(player_world_y)
;     add a,3
;     ld d,a
;     ld e,WORLD_WIDTH
;     mul d,e
;     add hl,de
;     ld a,(player_world_x)
;     add a,33
;     ld e,a
;     ld d,0
;     add hl,de
;     ld a,(hl)
;     cp 12
;     jp c,collided_solid_sideways



;     ld a,FALSE
;     ld (player_collided_solid),a

;     ret






; collided_solid_sideways:
;     ld a,TRUE
;     ld (player_collided_solid),a
;     ret



throw_hammer:
    ld a,(keypressed_Q_Held)
    cp TRUE
    ret z


    call projectiles_spawn
    ret