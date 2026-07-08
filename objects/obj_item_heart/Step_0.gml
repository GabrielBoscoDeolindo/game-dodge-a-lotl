float_timer += 0.1;
y = start_y + sin(float_timer) * 2;

if (alarm[0] < 120) {
    if (alarm[0] % 10 > 5) {
        image_alpha = 0.3;
    } else {
        image_alpha = 1;
    }
}