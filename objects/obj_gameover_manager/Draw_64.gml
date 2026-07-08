var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _cx = _gw / 2;
var _cy = _gh / 2;

draw_set_color(c_black);
draw_set_alpha(menu_alpha * 0.6);
draw_rectangle(0, 0, _gw, _gh, false);

draw_set_alpha(menu_alpha); 

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_credits);

var color_main = #FFD8E4;
var color_shadow = #C03A8D;
var offset = 6;

draw_set_color(color_shadow);
draw_text_transformed(_cx + offset, (_gh * 0.25) + offset, "GAME OVER", 2, 2, 0);
draw_set_color(color_main);
draw_text_transformed(_cx, _gh * 0.25, "GAME OVER", 2, 2, 0);

var _score_text = "Points: " + string(score); 

draw_set_color(color_shadow);
draw_text(_cx + offset, _cy + offset, _score_text);
draw_set_color(color_main);
draw_text(_cx, _cy, _score_text);


var _restart_text = "PRESS R TO RESTART OR ESC TO MENU";

draw_set_color(color_shadow);
draw_text_transformed(_cx + offset, (_gh * 0.75) + offset, _restart_text, 0.7, 0.7, 0);
draw_set_color(color_main);
draw_text_transformed(_cx, _gh * 0.75, _restart_text, 0.7, 0.7, 0);

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);