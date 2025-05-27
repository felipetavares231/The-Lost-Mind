function Heimer_Chasing() {
    if (!chasingInitialized) {

        chasingTimer = 120; // Chasing duration in steps or seconds?
        endChasingFrame = 120;

        sprite_index = spr_heimer_running;

        chasingInitialized = true;
    }

    target = obj_player
    if (!instance_exists(target)) {
        state = BOSS_STATE.IDLE;
        target = noone;
        chasingInitialized = false;
        return;
    }
	
	choice = irandom(1)

    var dist = point_distance(x, y, target.x, target.y);
    var dir = point_direction(x, y, target.x, target.y);
	
	if (target.x < x) {
		image_xscale = -spriteSize;
	} else {
		image_xscale = spriteSize;
	}

    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);

    if (dist < 20) {
        state = choose(BOSS_STATE.NORMAL_ATTACK, BOSS_STATE.CHARGE)
        chasingInitialized = false;
    }else if (dist > 200){

        if(choice == 0){
            state = BOSS_STATE.DASHING
        }else{
            state = BOSS_STATE.MAGNETIC_PULL
        }

        chasingInitialized = false;
	}

    if (chasingTimer > 0) {
        chasingTimer -= 1;
    } else {
        state = BOSS_STATE.IDLE
        target = noone;
        image_index = 8; // Optional: stop animation or set final frame
        chasingInitialized = false;
    }
}
