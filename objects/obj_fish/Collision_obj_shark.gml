if (!is_invincible && !is_dead) {
    
    global.hp--;
	audio_play_sound(slash, 10, 0);
    effect_create_above(ef_spark, x, y, 0, c_red);
    
    if (instance_exists(obj_camera)) {
        obj_camera.shake_magnitude = 3;
    }
    
    if (global.hp > 0) {
        is_invincible = true;
        invincible_timer = 60; 
    } else {
        is_dead = true; 
    }
}