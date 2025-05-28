// ========== MOVEMENT INPUT ==========

var rightKey = keyboard_check(ord("D"));
var leftKey = keyboard_check(ord("A"));
var jumpKeyPressed = keyboard_check_pressed(vk_space);


//movement and collision
xsp = (rightKey - leftKey) * moveSpd;
ysp += grav;

if(jumpKeyPressed && place_meeting(x, y+1, obj_ground)){
    ysp = jumpSpd;
}

//horizontal collision
if (place_meeting(x + xsp, y, obj_ground)){
    
    var _pixelCheck = sign(xsp);
    
    show_debug_message(xsp)

    while (!(place_meeting(x + _pixelCheck, y, obj_ground))){
        x += _pixelCheck
    }
    
    xsp = 0;
}

if(place_meeting(x + xsp, y + ysp, obj_ground)){
    var _pixelCheck = sign(ysp);
    
    while(!place_meeting(x + xsp, y + _pixelCheck, obj_ground)){
        y += _pixelCheck;
    }
    
    ysp = 0;
    
}

x += xsp;
y += ysp;

if (leftKey) {
    image_xscale = -spriteSize;
} 
if (rightKey) {
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
else if (state != PLAYER_STATE.STAGGER) {
    state = PLAYER_STATE.IDLE;
    sprite_index = spr_knight_idle;
}