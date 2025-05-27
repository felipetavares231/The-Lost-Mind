// ========== MOVEMENT INPUT ==========
var move_x = 0;
if (keyboard_check(ord("A"))) {
    move_x = -1;
    image_xscale = -spriteSize;
} 
if (keyboard_check(ord("D"))) {
    move_x = 1;
    image_xscale = spriteSize;
}

// ========== DODGE INPUT ==========
if (keyboard_check_pressed(vk_shift) && canDodge && !dodgeInitialized) {
    state = PLAYER_STATE.DODGING;
}

// ========== ACTION INPUT ==========
if (keyboard_check(ord("J")) && state != PLAYER_STATE.STAGGER) {
    state = PLAYER_STATE.NORMAL_ATTACK;
}

if (keyboard_check(ord("R")) && healingPotions > 0) {
    state = PLAYER_STATE.HEALING;
}

// ========== SET STATE BASED ON INPUT ==========
if (state == PLAYER_STATE.DODGING) {
    // Dodge logic will override movement
    Player_Dodge();
}
else if(state == PLAYER_STATE.HEALING){
	Player_Healing();
	showHPBar = true;
}
else if (state == PLAYER_STATE.NORMAL_ATTACK) {
    Player_NormalAttack();
}
else if (state == PLAYER_STATE.STAGGER) {
    Player_Stagger();
	showHPBar = true;
}
else if (move_x != 0) {
    state = PLAYER_STATE.RUNNING;
    xsp = move_x * 3;
    sprite_index = spr_knight_running;
}
else if (state != PLAYER_STATE.STAGGER) {
    state = PLAYER_STATE.IDLE;
    sprite_index = spr_knight_idle;
}

// ========== GRAVITY & JUMP ==========
ysp += 0.1;

if (place_meeting(x, y + 1, obj_ground)) {
    ysp = 0;
    if (keyboard_check(ord("W"))) {
        ysp = -2;
    }
}

move_and_collide(xsp, ysp, obj_ground);
