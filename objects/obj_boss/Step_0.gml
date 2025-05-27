switch(state){
case BOSS_STATE.IDLE: Heimer_Idle() break;
case BOSS_STATE.DEAD: Heimer_Death() break;
case BOSS_STATE.STAGGER: Heimer_Stagger() break;
case BOSS_STATE.CHASING: Heimer_Chasing() break;
case BOSS_STATE.NORMAL_ATTACK: Heimer_NormalAttack() break;
case BOSS_STATE.MAGNETIC_PULL: Heimer_MagneticPull() break;
case BOSS_STATE.CHARGE: Heimer_Charge() break;
case BOSS_STATE.DASHING: Heimer_Dashing(spriteSize) break;
};

if(hp <= 0){
	state = BOSS_STATE.DEAD
}

ysp += 0.1
xsp = 0

if (keyboard_check(ord("L"))){
	state = BOSS_STATE.NORMAL_ATTACK
}
	
if place_meeting(x, y-1, obj_ground){
	ysp = 0
}


move_and_collide(xsp, ysp, obj_ground)