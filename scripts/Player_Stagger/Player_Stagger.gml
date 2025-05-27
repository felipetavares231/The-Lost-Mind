function Player_Stagger(){
	if (!staggerInitialized) {
    

        animationTimer = 10;

        sprite_index = spr_knight_stagger

        staggerInitialized = true;
    }

    if (animationTimer > 0) {

        animationTimer -= 1;
    } else {
		state = PLAYER_STATE.IDLE
		staggerInitialized = false;
    }
}