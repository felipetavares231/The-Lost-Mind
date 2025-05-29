if (place_meeting(x + image_xscale * 16, y, obj_player) && image_index == 4) {
    show_debug_message("area attack instance hit player")
    obj_player.damage(30, 10)
    
    with (obj_camera){
        shake_time = 12
        shake_magnitude = 6
    }
}