function Player_Healing(){
	if (healingPotionCount > 0) {
		if (!healingInitialized) {

			animationTimer = 30;
			sprite_index = spr_knight_idle;

			healingInitialized = true;
		}

		if (animationTimer > 0) {
			animationTimer -= 1;
			if(hp < max_hp){
				hp += potionStrength
                var healingIndicator = instance_create_depth(x+irandom(15), y+irandom(15), 0, obj_damageIndicator)
                healingIndicator.color = choose(#61eb34, #a2f587, #28a300, #3fff00);
                healingIndicator.damage = potionStrength;
			}
		} else {
			state = PLAYER_STATE.IDLE;
			healingInitialized = false;
			healingPotionCount -= 1;
		}
	}
}