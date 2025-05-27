// Sprite sizes
var bar_width = sprite_get_width(spr_bosshealthbarfill);
var bar_height = sprite_get_height(spr_bosshealthbarfill);

// Screen center (GUI coordinates)
var center_x = display_get_gui_width() * 0.5;
var bottom_y = display_get_gui_height() - 64; // adjust as needed

// Smooth transition
displayed_hp = lerp(displayed_hp, hp, 0.2);
displayed_hp = clamp(displayed_hp, 0, max_hp);

var hp_percent = displayed_hp / max_hp;

var fill_width = bar_width * hp_percent;
draw_sprite_part(
    spr_bosshealthbarfill, 0,
    0, 0,
    fill_width, bar_height,
    center_x - bar_width * 0.5, bottom_y
);

draw_sprite(spr_bosshealthbar, 0, center_x - bar_width * 0.5, bottom_y);

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_text(center_x, bottom_y - 10, "HEIMER - THE FUTURE GUARD");
