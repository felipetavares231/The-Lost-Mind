function Player_NormalAttack(){
	if (!normalAttackInitialized) {
        show_debug_message("Initializing normal attack");

        attackTimer = 20;
        attackFrame = 10;

        sprite_index = spr_knight_attacking
		
		show_debug_message("Assigned sprite_index: " + string(sprite_index));
		show_debug_message("Sprite name: " + sprite_get_name(sprite_index));

        normalAttackInitialized = true;
        stamina -= staminaDecreaseFactor;
    }

    if (attackTimer > 0) {
        show_debug_message("Attacking...");

        // Only check for collision once, during the "attack frame"
        if (attackTimer == attackFrame) {
            if (place_meeting(x + image_xscale * 16, y, obj_boss)) {
                
                obj_boss.damage(100)
				
				with(obj_camera){
					shake_time = 10
					shake_magnitude = 6
				}
				
                show_debug_message("Hit Something!");
            }
        }

        attackTimer -= 1;
    } else {
        normalAttackInitialized = false;
        state = PLAYER_STATE.IDLE;
        image_index = 0;
    }
}