if (shake_magnitude > 0) {
    var _shake_x = cam_start_x + irandom_range(-shake_magnitude, shake_magnitude);
    var _shake_y = cam_start_y + irandom_range(-shake_magnitude, shake_magnitude);
    
    camera_set_view_pos(cam, _shake_x, _shake_y);
    
    shake_magnitude -= shake_fade;
} else {
    shake_magnitude = 0;
    camera_set_view_pos(cam, cam_start_x, cam_start_y);
}