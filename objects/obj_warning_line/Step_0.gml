lifetime--;

if (is_tracking) {
    if (lifetime > lock_time) {
        if (instance_exists(obj_fish)) {
            image_angle = point_direction(x, y, obj_fish.x, obj_fish.y);
        }
        image_alpha += flash_speed * 2;
        if (image_alpha >= 1 || image_alpha <= 0.2) flash_speed = -flash_speed;
        
    } else {
        image_alpha = 1; 
    }
} else {
    image_alpha += flash_speed;
    if (image_alpha >= 1 || image_alpha <= 0.2) flash_speed = -flash_speed;
}

// tiro
if (lifetime <= 0) {
    var spawn_shark = instance_create_layer(x, y, "Instances", obj_shark);
    spawn_shark.direction = image_angle;
    spawn_shark.image_angle = image_angle;
    spawn_shark.speed = 6;
    
    instance_destroy();
}