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

enum BOSS_STATE {
	DASHING,
	NORMAL_ATTACK,
	MAGNETIC_PULL,
	CHASING,
	IDLE,
	DEAD,
	STAGGER,
	CHARGE,
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

knockback = 30;
