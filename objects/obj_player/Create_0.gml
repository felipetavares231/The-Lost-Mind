spriteSize = 2

image_xscale = spriteSize;
image_yscale = spriteSize;

max_hp = 300;      // maximum HP capacity
hp = 300;          // current HP
displayed_hp = 300; //for smooth drain
bar_max_width = max_hp * 0.6;  // 0.6 pixels per HP max, adjust as needed// max width of the HP bar on screen (pixels)
bar_height = 10;     // height of the HP bar (pixels)

showHPBar = false;
alarm[1] = 180; //alarm to disable hp bar

xsp = 0;
ysp = 0;
moveSpd = 5;
jumpSpd = -5;
grav = .25;
moveDir = 1

enum PLAYER_STATE {
	NORMAL_ATTACK,
	IDLE,
	RUNNING,
	STAGGER,
	DODGING,
	HEALING,
    DEAD,
}

state = PLAYER_STATE.IDLE

normalAttackInitialized = false;

staggerInitialized = false;

healingInitialized = false;
healingPotions = 5;
potionStrength = 5;

dodgeInitialized = false;
canDodge = false;
dodgeCooldown = 60;

deathInitialized = false;

damage = function(_damage, _knockback = 10) {
	if(state != PLAYER_STATE.DODGING){
		hp -= (20 + _knockback);
		state = PLAYER_STATE.STAGGER
		if(image_xscale > 0){
			x -= _knockback
		}else{
			x += _knockback
		}
	}
}

alarm[0] = 1;