// Top-left margin from screen edge
var margin_x = 32;
var margin_y = 32;

// Bar dimensions (based on your fill sprite)
var bar_width = sprite_get_width(spr_healthbarfill);
var bar_height = sprite_get_height(spr_healthbarfill);

// Smooth animation when losing/gaining HP
displayed_hp = lerp(displayed_hp, hp, 0.2);

// Clamp the value to avoid overshoot
displayed_hp = clamp(displayed_hp, 0, max_hp);

// Health percentage
var hp_percent = displayed_hp / max_hp;

// Draw background/frame sprite
draw_sprite(spr_healthbar, 0, margin_x, margin_y);

// Draw fill (cropped to percentage)
var fill_width = bar_width * hp_percent;
draw_sprite_part(
    spr_healthbarfill, 0,
    0, 0,
    fill_width, bar_height,
    margin_x, margin_y
);
