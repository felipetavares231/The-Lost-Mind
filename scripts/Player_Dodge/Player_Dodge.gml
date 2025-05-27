function Player_Dodge(){
	if (canDodge) {
		if (!dodgeInitialized) {
			show_debug_message("Initializing Dodge");

			animationTimer = 10;
			sprite_index = spr_knight_dodging;
			dodgeSpeed = sign(image_xscale) * 6;

			dodgeInitialized = true;
		}

		if (animationTimer > 0) {
			show_debug_message("##########dodging!");
			x += dodgeSpeed;
			animationTimer -= 1;
		} else {
			state = PLAYER_STATE.IDLE;
			dodgeInitialized = false;
			canDodge = false;
		}
	}
}
