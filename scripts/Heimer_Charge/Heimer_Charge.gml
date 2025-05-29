function Heimer_Charge(){
	 if (!chargeAttackInitialized) {

        attackTimer = 20;
        attackFrame = 10;

        sprite_index = spr_heimer_charge
		
        chargeAttackInitialized = true;
    }

    if (attackTimer > 0) {
        

        // Only check for collision once, during the "attack frame"
        if (attackTimer == attackFrame) {
            if (place_meeting(x + image_xscale * 16, y, obj_player)) {
                with (obj_player) {
					if(state != PLAYER_STATE.DODGING){
						hp -= (80 + other.knockback);
						state = PLAYER_STATE.STAGGER;
                        chargeKnockback();
					}
                }
				
				with (obj_camera){
					shake_time = 20
					shake_magnitude = 12
				}
				
            }
        }

        attackTimer -= 1;
    } else {
        chargeAttackInitialized = false;
        state = BOSS_STATE.IDLE;
        image_index = 0;
		knockback = 30;
    }
}

chargeKnockback = function chargeKnockback() {
    var distanceToWall = distance_to_object(obj_wall)
    
    if(image_xscale > 0){
        if(distanceToWall >= 250){
            x -= 250
        }else{
            x -= distanceToWall
        }
    }else{
        if(distanceToWall >= 250){
            x += 250    
        }else{
            x += distanceToWall
        }
        
    }
}