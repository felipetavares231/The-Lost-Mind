function Heimer_Dashing(spriteSize) {
    if (!dashingInitialized) {
        animationTimer = 60;

        var dx = obj_player.x - x;

        if (dx > 0) {
            image_xscale = spriteSize;
            dash_speed = 10;
        } else {
            image_xscale = -spriteSize;
            dash_speed = -10;
        }

        dashingInitialized = true;
    }

    if (animationTimer > 0) {
        x += dash_speed;
        animationTimer -= 1;

        if (place_meeting(x, y, obj_player)) {
			knockback = 80;
            state = BOSS_STATE.NORMAL_ATTACK;
            dashingInitialized = false;
        }
    } else {
        dash_speed = 0;
        state = BOSS_STATE.IDLE;
        dashingInitialized = false;
    }
}
