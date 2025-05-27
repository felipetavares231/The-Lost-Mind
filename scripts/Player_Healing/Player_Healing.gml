function Player_Healing(){
	if (healingPotions > 0) {
		if (!healingInitialized) {

			animationTimer = 30;
			sprite_index = spr_knight_idle;

			healingInitialized = true;
		}

		if (animationTimer > 0) {
			animationTimer -= 1;
			if(hp < max_hp){
				hp += potionStrength
			}
		} else {
			state = PLAYER_STATE.IDLE;
			healingInitialized = false;
			healingPotions -= 1;
		}
	}
}