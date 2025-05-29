function Player_Death(){
	if (!deathInitialized) {

        deathTimer = 26;
        deathFrame = 12;

        sprite_index = spr_knight_death

        deathInitialized = true;
    }

    if (deathTimer > 0) {
        deathTimer -= 1;
    } else {
        image_index = 8;
    }
}