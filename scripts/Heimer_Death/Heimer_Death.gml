function Heimer_Death(){
	if (!deathInitialized) {

        deathTimer = 10;
        deathFrame = 10;

        sprite_index = spr_heimer_death

        deathInitialized = true;
    }

    if (deathTimer > 0) {

        deathTimer -= 1;
    } else {
        image_index = 8;
    }
}