
draw_self();


draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_lifebar); 


draw_set_color(#FFD8E4);


var _time_x = x + 35;
var _time_y = y + 20;

var _seconds = global.frames_survived div 60;
var _time_text = string(_seconds) + "s";


draw_text(_time_x, _time_y, _time_text);





var _score_x = x + 64;
var _score_y = y + 20;

var _score_text = string(score);

draw_text(_score_x, _score_y, _score_text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);