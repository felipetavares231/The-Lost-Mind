event_inherited()
hp = 1000;
max_hp = 1000;
displayed_hp = 1000;

spd = 5

spriteSize = 3
image_xscale = spriteSize
image_yscale = spriteSize

xsp = 0
ysp = 0
grav = .25

enum BOSS_STATE {
	DASHING,
	NORMAL_ATTACK,
	MAGNETIC_PULL,
	CHASING,
	IDLE,
	DEAD,
	STAGGER,
	CHARGE,
    AREA_ATTACK,
}

state = BOSS_STATE.IDLE;

alarm[0] = 120

dashingInitialized = false;

animationTimer = 0;
dash_speed = 0;
dashingInitialized = false;

normalAttackInitialized = false;

deathInitialized = false;

chasingInitialized = false;

magneticPullInitialized = false;

staggerInitialized = false;

chargeAttackInitialized = false;

areaAttackInitialized = false;

knockback = 30;

damage = function(_damage, _knockback = 0) {
    hp -= _damage;
    
    if(random(100) < 5){ //5% chance of boss getting staggered
        state = BOSS_STATE.STAGGER
        
        hp -= _damage * 3;
        
        var criticalHitIndicator = instance_create_depth(x, y, -1, obj_damageIndicator)
        
        criticalHitIndicator.color = c_fuchsia;
        criticalHitIndicator.damage = -_damage * 3;
        
        with(obj_camera){
            shake_time = 30
            shake_magnitude = 30
        }
    }
    
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
    damageIndicator.damage = -_damage
	
}
