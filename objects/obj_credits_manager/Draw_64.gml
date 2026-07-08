var display_w = display_get_gui_width();
var display_h = display_get_gui_height();
var center_x = display_w / 2;
var center_y = display_h / 2;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_credits);

var color_main = #FFD8E4;
var color_shadow = #C03A8D;
var offset = 6; 

// --- HEAD ---
draw_set_color(color_shadow);
draw_text_transformed(center_x + offset, (display_h * 0.15) + offset, "Thanks for playing", 1.5, 1.5, 0);
draw_set_color(color_main);
draw_text_transformed(center_x, display_h * 0.15, "Thanks for playing", 1.5, 1.5, 0);

// --- MAIN ---
var credits_text = "Gabriel Deolindo";
draw_set_color(color_shadow);
draw_text_transformed(center_x + offset, center_y + offset, credits_text, 1, 1, 0);
draw_set_color(color_main);
draw_text_transformed(center_x, center_y, credits_text, 1, 1, 0);

// --- FOOTER ---
var footer_text = "PRESS ESC TO RETURN";
draw_set_color(color_shadow);
draw_text_transformed(center_x + offset, (display_h * 0.9) + offset, footer_text, 0.8, 0.8, 0);
draw_set_color(color_main);
draw_text_transformed(center_x, display_h * 0.9, footer_text, 0.8, 0.8, 0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);