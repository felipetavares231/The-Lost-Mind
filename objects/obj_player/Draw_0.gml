draw_self()

if(state == PLAYER_STATE.HEALING){
	draw_sprite(spr_healing, floor(image_index), x, y+10);
}

if(state == PLAYER_STATE.DEAD){
    var cam_middle_x = camera_get_view_x(camera_get_active()) + (camera_get_view_width(camera_get_active())/2);
    var cam_middle_y = camera_get_view_y(camera_get_active()) + (camera_get_view_height(camera_get_active())/2);
    
    draw_text(cam_middle_x, cam_middle_y, "You Died. Press SPACE to try again.")
}