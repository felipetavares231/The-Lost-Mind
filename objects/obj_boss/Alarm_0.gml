if(state == BOSS_STATE.IDLE && obj_player.hp > 0){
	state = BOSS_STATE.CHASING
}

var cooldown = choose(120, 60)
show_debug_message(cooldown)

alarm[0] = cooldown