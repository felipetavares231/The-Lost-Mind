display_set_gui_size(640, 360)

spriteSize = 2

image_xscale = spriteSize;
image_yscale = spriteSize;

max_hp = 300;      // maximum HP capacity
hp = max_hp;          // current HP
displayed_hp = 300; //for smooth drain
bar_max_width = max_hp * 0.6;  // 0.6 pixels per HP max, adjust as needed// max width of the HP bar on screen (pixels)
bar_height = 10;     // height of the HP bar (pixels)

max_stamina = 300;
stamina = max_stamina;
displayed_stamina = max_stamina; //for smooth drain
staminaDecreaseFactor = 100;
staminaIncreaseFactor = 50;
staminaCooldown = 30;


powerAttackMultiplier = 0;
powerAttackInitialized = false;
powerAttackRequirement = 3;
max_powerattack = powerAttackRequirement * 100;
powerAttack = powerAttackMultiplier * 100;
displayed_powerattack = max_powerattack * 100; 


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
    POWER_ATTACK,
}

state = PLAYER_STATE.IDLE

normalAttackInitialized = false;

staggerInitialized = false;

healingInitialized = false;
healingPotionCount = 5;
potionStrength = 5;

dodgeInitialized = false;
canDodge = false;
dodgeCooldown = 60;

deathInitialized = false;

damage = function(_damage, _knockback = 10) {
	if(state != PLAYER_STATE.DODGING && state != PLAYER_STATE.POWER_ATTACK){
		hp -= _damage;
		state = PLAYER_STATE.STAGGER
        
        powerAttackMultiplier = 0;
        
        var distanceToWall = distance_to_object(obj_wall)
    
        if(image_xscale > 0){
            if(distanceToWall >= _knockback){
                x -= _knockback
            }else{
                x -= distanceToWall
            }
        }else{
            if(distanceToWall >= _knockback){
                x += _knockback
            }else{
                x += distanceToWall
            }
            
        }
        
        var damageIndicator = instance_create_depth(x, y, -1, obj_damageIndicator)
        damageIndicator.damage = _damage
	}
}

horizontalCollision = function () {
    if (place_meeting(x + xsp, y, obj_wall)){
        
        var _pixelCheck = sign(xsp);
        
        show_debug_message(xsp)
    
        while (!(place_meeting(x + _pixelCheck, y, obj_wall))){
            x += _pixelCheck
        }
        
        xsp = 0;
    }
}

verticalCollision = function (_xsp, _ysp){
    if(place_meeting(x + _xsp, y + _ysp, obj_ground)){
        var _pixelCheck = sign(_ysp);
        
        while(!place_meeting(x + _xsp, y + _pixelCheck, obj_ground)){
            y += _pixelCheck;
        }
        
        ysp = 0;
        
    }
}


alarm[0] = 1; //dodge timer;

alarm[1] = 1; //stamina timer;