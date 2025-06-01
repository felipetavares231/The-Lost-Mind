
var margin_x = 32;
var margin_y = 32;

var bar_width = sprite_get_width(spr_healthbarfill);
var bar_height = sprite_get_height(spr_healthbarfill);

displayed_hp = lerp(displayed_hp, hp, 0.2);

displayed_hp = clamp(displayed_hp, 0, max_hp);

var hp_percent = displayed_hp / max_hp;

draw_sprite(spr_healthbar, 0, margin_x, margin_y);

var fill_width = bar_width * hp_percent;
draw_sprite_part(
    spr_healthbarfill, 0,
    0, 0,
    fill_width, bar_height,
    margin_x, margin_y
);

//----------------------STAMINA----------
var staminabar_width = sprite_get_width(spr_staminabarfill);
var staminabar_height = sprite_get_height(spr_staminabarfill);

displayed_stamina = lerp(displayed_stamina, stamina, 0.2);

displayed_stamina = clamp(displayed_stamina, 0, max_stamina);

var stamina_percent = displayed_stamina / max_stamina;

draw_sprite(spr_staminabar, 0, margin_x, 50);

var staminafill_width = bar_width * stamina_percent;
draw_sprite_part(
    spr_staminabarfill, 0,
    0, 0,
    staminafill_width, staminabar_height,
    margin_x, 50
);

//---------------------HEALTH POTINOS0-0000-----------

var bottom_y = display_get_gui_height() - 80;

if(healingPotionCount > 0){
    draw_sprite_ext(spr_healthpotionGUI, 0, margin_x, bottom_y, 2, 2, 0, c_white, 1);
}else{
    draw_sprite_ext(spr_emptyhealthpotionGUI, 0, margin_x, bottom_y, 2, 2, 0, c_white, 1);
}
draw_text_transformed(margin_x+50, bottom_y+60, $"X{obj_player.healingPotionCount}", 0.5, 0.5, 0);





