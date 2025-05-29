function Heimer_AreaAttack() {
    if (!areaAttackInitialized) {
        grav = 0;
        attackTimer = 180;
        waveCooldown = 0;
        waveSize = 5;
        maxRadius = 100;
        startupTimer = 60;
        moveSpeed = -2;
        
        areaAttackInitialized = true;

        sprite_index = spr_heimer_idle; // TODO: area attack animation
    }

    // move up for the first 30 frames
    if (startupTimer > 0) {
        y += moveSpeed;
        startupTimer -= 1;
    }

    // attack waves
    if (attackTimer > 0) {
        if (waveCooldown <= 0) {
            for (var i = 0; i < waveSize; i++) {
                var angle = random(360);
                var dist = random(maxRadius);
                var fx = obj_player.x + lengthdir_x(dist, angle);
                var fy = obj_player.y + lengthdir_y(dist, angle);

                instance_create_depth(fx, fy, 0, obj_heimer_area_attack);
            }

            waveCooldown = 120;
        } else {
            waveCooldown -= 1;
        }

        attackTimer -= 1;
    } else {
        areaAttackInitialized = false;
        state = BOSS_STATE.IDLE;
        image_index = 0;
        knockback = 30;
        grav = .25;
    }
}
