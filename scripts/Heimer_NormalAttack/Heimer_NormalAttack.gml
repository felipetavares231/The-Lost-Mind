function Heimer_NormalAttack() {
    if (!normalAttackInitialized) {

        attackTimer = 20;
        attackFrame = 10;

        sprite_index = spr_heimer_normalAttack
		
        normalAttackInitialized = true;
    }

    if (attackTimer > 0) {

        // Only check for collision once, during the "attack frame"
        if (attackTimer == attackFrame) {
            if (place_meeting(x + image_xscale * 16, y, obj_player)) {
                obj_player.damage(40, obj_boss.knockback)
				
				with (obj_camera){
					shake_time = 12
					shake_magnitude = 6
				}
            }
        }

        attackTimer -= 1;
    } else {
        normalAttackInitialized = false;
        state = BOSS_STATE.IDLE;
        image_index = 0;
		knockback = 30;
    }
}
