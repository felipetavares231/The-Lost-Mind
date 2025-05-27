function Heimer_MagneticPull() {
    if (!magneticPullInitialized) {

        animationTimer = 60

        sprite_index = spr_heimer_magneticpull
		

        magneticPullInitialized = true;
    }
	
	target = obj_player

    if (animationTimer > 0) {
		
		var dist = point_distance(x, y, target.x, target.y);
	    var dir = point_direction(x, y, target.x, target.y);
		
		 var dx = obj_player.x - x;

        if (dx > 0) {
            image_xscale = spriteSize;
            target.x -= 10;
        } else {
            image_xscale = -spriteSize;
            target.x += 10;
        }
		
        animationTimer -= 1;
    } else {
        magneticPullInitialized = false;
        state = BOSS_STATE.NORMAL_ATTACK;
        image_index = 0;
    }
}
