// Shake logic
if (shake_time > 0) {
    shake_time -= 1;
    shake_offset_x = random_range(-shake_magnitude, shake_magnitude);
    shake_offset_y = random_range(-shake_magnitude, shake_magnitude);
} else {
    shake_offset_x = 0;
    shake_offset_y = 0;
}

if (instance_exists(obj_player)) {
    
    var room_w = room_width;
    var room_h = room_height;
    var cam_w = camera_get_view_width(global.camera);
    var cam_h = camera_get_view_height(global.camera);

    
    var target_x = obj_player.x - cam_w / 2 + shake_offset_x;
    var target_y = obj_player.y - cam_h / 2 + shake_offset_y;

    target_x = clamp(target_x, 0, room_w - cam_w);
    target_y = clamp(target_y, 0, room_h - cam_h);

    camera_set_view_pos(global.camera, target_x, target_y);
}
