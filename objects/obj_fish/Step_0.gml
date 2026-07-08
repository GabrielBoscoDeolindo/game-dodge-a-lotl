if (!is_dead) {
    var key_right = keyboard_check(ord("D"));
    var key_left = keyboard_check(ord("A"));
    var key_down = keyboard_check(ord("S"));
    var key_up = keyboard_check(ord("W"));

    var h_input = key_right - key_left;
    var v_input = key_down - key_up;

    if (h_input != 0 || v_input != 0) {
        move_dir = point_direction(0, 0, h_input, v_input);
        
        hsp = lengthdir_x(move_speed, move_dir);
        vsp = lengthdir_y(move_speed, move_dir);
        
        if (h_input == 0 && v_input == -1)       sprite_index = spr_left;
        else if (h_input == 0 && v_input == 1)   sprite_index = spr_right;
        else if (h_input == -1 && v_input == 0)  sprite_index = spr_left;
        else if (h_input == 1 && v_input == 0)   sprite_index = spr_right;
        else if (h_input == -1 && v_input == -1) sprite_index = spr_left;
        else if (h_input == 1 && v_input == -1)  sprite_index = spr_right;
        else if (h_input == -1 && v_input == 1)  sprite_index = spr_down_left;
        else if (h_input == 1 && v_input == 1)   sprite_index = spr_down_right;

    } else {
        hsp = 0;
        vsp = 0;
        sprite_index = spr_idle;
    }

    x += hsp;
    y += vsp;

    x = clamp(x, 8, room_width - 8);
    y = clamp(y, 8, room_height - 8);

    // iframes
    if (is_invincible) {
        invincible_timer--;
        
        if (invincible_timer % 10 > 5) {
            image_alpha = 0.3;
        } else {
            image_alpha = 1;
        }
        
        if (invincible_timer <= 0) {
            is_invincible = false;
            image_alpha = 1; 
        }
    }
} else {
    hsp = 0;
    vsp = 0;  
    image_angle += 4;  
    image_alpha -= 0.02;
    
if (image_alpha <= 0) {
        instance_create_depth(0, 0, -9999, obj_gameover_manager);
        instance_destroy();
    }
}