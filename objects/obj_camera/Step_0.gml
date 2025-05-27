// Shake logic
if (shake_time > 0) {
    shake_time -= 1;
    shake_offset_x = random_range(-shake_magnitude, shake_magnitude);
    shake_offset_y = random_range(-shake_magnitude, shake_magnitude);
} else {
    shake_offset_x = 0;
    shake_offset_y = 0;
}

// Follow player
if (instance_exists(obj_player)) {
    var target_x = obj_player.x - camera_get_view_width(global.camera) / 2;
    var target_y = obj_player.y - camera_get_view_height(global.camera) / 2;

    camera_set_view_pos(global.camera, target_x + shake_offset_x, target_y + shake_offset_y);
}

view_xview[0] += random_range(-5, 5);
view_yview[0] += random_range(-5, 5);

