if(state == BOSS_STATE.IDLE){
	state = BOSS_STATE.CHASING
}

var cooldown = choose(120, 180, 300, 60)
show_debug_message(cooldown)

alarm[0] = cooldown