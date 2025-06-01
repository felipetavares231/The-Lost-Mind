function Player_PowerAttack(){
	if (!powerAttackInitialized) {
        show_debug_message("Initializing power attack");

        attackTimer = 65;
        attackFrameRange = [6, 7, 8, 13]

        sprite_index = spr_knight_powerAttack;
		
		show_debug_message("Assigned sprite_index: " + string(sprite_index));
		show_debug_message("Sprite name: " + sprite_get_name(sprite_index));

        powerAttackInitialized = true;
        stamina -= staminaDecreaseFactor*3;
        
    }

    if (attackTimer > 0) {
        show_debug_message("########-------powerAttacking");
        
        if(array_contains(attackFrameRange, attackTimer)){
            if (place_meeting(x + image_xscale * 16, y, obj_boss)) {
                obj_boss.damage(30)
                obj_boss.state = BOSS_STATE.STAGGER
                
                with(obj_camera){
                    shake_time = 10
                    shake_magnitude = 6
                }
                
                show_debug_message("Hit Something!");
            }
        }
        

        attackTimer -= 1;
    } else {
        show_debug_message("------------powerAttackFinished")
        powerAttackMultiplier = 0;
        powerAttackInitialized = false;
        state = PLAYER_STATE.IDLE;
        image_index = 0;
    }
}