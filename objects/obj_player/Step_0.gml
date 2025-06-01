// ========== MOVEMENT INPUT ==========

if(hp <= 0){
    state = PLAYER_STATE.DEAD;
    Player_Death();
    
    if(keyboard_check(vk_space)){
        room_restart()
    }
    
    
}else{
    var rightKey = keyboard_check(ord("D"));
    var leftKey = keyboard_check(ord("A"));
    var jumpKeyPressed = keyboard_check_pressed(ord("W"));
    
    
    //movement and collision
    xsp = (rightKey - leftKey) * moveSpd
    ysp += grav;
    
    if(jumpKeyPressed && place_meeting(x, y+1, obj_ground)){
        ysp = jumpSpd;
    }
    
    if(keyboard_check(ord("O"))){
        room_restart()
    }
    
    horizontalCollision()
    
    verticalCollision(xsp, ysp);
    
    if(keyboard_check(vk_f2)){ //TODO: remove this after debugging
        powerAttackMultiplier = powerAttackRequirement
    }
    
    x += xsp;
    y += ysp;
    
    
    if (keyboard_check(ord("K")) && state != PLAYER_STATE.STAGGER && stamina > (max_stamina / 2) && powerAttackMultiplier >= powerAttackRequirement) {
        state = PLAYER_STATE.POWER_ATTACK;
    }
    
    if (leftKey && (state == PLAYER_STATE.IDLE || state == PLAYER_STATE.RUNNING)) {
        xsp = -moveSpd;
        image_xscale = -spriteSize;
        state = PLAYER_STATE.RUNNING;
    }  else if (rightKey && (state == PLAYER_STATE.IDLE || state == PLAYER_STATE.RUNNING)) {
        xsp = moveSpd;
        image_xscale = spriteSize;
        state = PLAYER_STATE.RUNNING;
    } else if(state == PLAYER_STATE.RUNNING && leftKey == 0 && rightKey == 0){
        state = PLAYER_STATE.IDLE
    }
    
    // ========== DODGE INPUT ==========
    if (keyboard_check_pressed(vk_shift) && canDodge && !dodgeInitialized) {
        state = PLAYER_STATE.DODGING;
    }
    
    // ========== ACTION INPUT ==========
    if (keyboard_check(ord("J")) && state != PLAYER_STATE.STAGGER && stamina > 100) {
        state = PLAYER_STATE.NORMAL_ATTACK;
    }
    
    if (keyboard_check(ord("R")) && healingPotionCount > 0) {
        state = PLAYER_STATE.HEALING;
    }
    
    // ========== SET STATE BASED ON INPUT ==========
    if (state == PLAYER_STATE.DODGING) {
        // Dodge logic will override movement
        show_debug_message("dodge state")
        Player_Dodge();
    }
    else if(state == PLAYER_STATE.HEALING){
        Player_Healing();
    }
    else if (state == PLAYER_STATE.NORMAL_ATTACK) {
        Player_NormalAttack();
    }
    else if (state == PLAYER_STATE.POWER_ATTACK) {
        Player_PowerAttack();
    }
    else if (state == PLAYER_STATE.STAGGER) {
        Player_Stagger();
    }
    else if (state == PLAYER_STATE.RUNNING) {
        sprite_index = spr_knight_running;
    }
    else if (state == PLAYER_STATE.IDLE) {
        sprite_index = spr_knight_idle;
    }   
}