if (irandom_range(1, 100) <= 50) {
    
    var spawn_x = irandom_range(20, room_width - 20);
    var spawn_y = irandom_range(20, room_height - 20);
    
    instance_create_layer(spawn_x, spawn_y, "Instances", obj_item_heart);
}
alarm[0] = spawn_timer;