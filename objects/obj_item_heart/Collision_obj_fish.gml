
if (global.hp < 3) {
    global.hp++;
}

score += 50;
audio_play_sound(item, 10, 0);
effect_create_above(ef_ring, x, y, 0, c_lime);
instance_destroy();