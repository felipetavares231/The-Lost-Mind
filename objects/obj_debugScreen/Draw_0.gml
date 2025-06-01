// Get camera corners
var cam = camera_get_active();
var cam_top_left_x = camera_get_view_x(cam);
var cam_top_left_y = camera_get_view_y(cam);

// Debug HUD position
var hud_x = cam_top_left_x + 100;
var hud_y = cam_top_left_y + 100;
var line_height = 12;
var scale = 0.5;

// Text color
draw_set_color(c_white);

if(showScreen){
    draw_text_transformed(hud_x, hud_y,                $"HP: {obj_player.hp} / {obj_player.max_hp}", scale, scale, 0);
    draw_text_transformed(hud_x, hud_y + line_height,  $"Displayed HP: {obj_player.displayed_hp}", scale, scale, 0);
    draw_text_transformed(hud_x, hud_y + line_height*2, $"STAMINA: {obj_player.stamina} / {obj_player.max_stamina}", scale, scale, 0);
    draw_text_transformed(hud_x, hud_y + line_height*3, $"Displayed Stamina: {obj_player.displayed_stamina}", scale, scale, 0);
    draw_text_transformed(hud_x, hud_y + line_height*4, $"State: {obj_player.state}", scale, scale, 0);
    draw_text_transformed(hud_x, hud_y + line_height*5, $"Potions: {obj_player.healingPotions}", scale, scale, 0);
    draw_text_transformed(hud_x, hud_y + line_height*6, $"Dodge Ready: {obj_player.canDodge}", scale, scale, 0);
    draw_text_transformed(hud_x, hud_y + line_height*7, $"X Speed: {obj_player.xsp}, Y Speed: {obj_player.ysp}", scale, scale, 0);
    draw_text_transformed(hud_x, hud_y + line_height*8, $"X: {obj_player.x}, Y: {obj_player.y}", scale, scale, 0);
}


