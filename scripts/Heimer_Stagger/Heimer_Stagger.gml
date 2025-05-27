function Heimer_Stagger(){
	if (!staggerInitialized) {

        animationTimer = 10;

        sprite_index = spr_heimer_stagger

        staggerInitialized = true;
    }

    if (animationTimer > 0) {

        animationTimer -= 1;
    } else {
		state = BOSS_STATE.IDLE
		staggerInitialized = false;
    }
}