if (!instance_exists(obj_fish)) exit;

var cx = obj_fish.x;
var cy = obj_fish.y;

var mid_x = room_width / 2;
var mid_y = room_height / 2;

var spawn_warning = function(_sx, _sy, _tx, _ty) {
    var warn = instance_create_layer(_sx, _sy, "Instances", obj_warning_line);
    warn.image_angle = point_direction(_sx, _sy, _tx, _ty);
    warn.image_xscale = 15; 
};

var _seconds = global.frames_survived div 60;
var pattern_id = 1;

if (_seconds < 15) {
    // TIER 1
    pattern_id = choose(1, 2, 3);
} else if (_seconds < 45) {
    // TIER 2
    pattern_id = choose(1, 2, 3, 4, 5, 6, 9); 
} else if (_seconds < 90) {
    // TIER 3
    pattern_id = choose(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);
} else {
    // TIER 4
    pattern_id = choose(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14);
}

switch(pattern_id) {

    case 1:
        var num_lines = choose(3, 4, 5); 
        var base_angle = random(360); 
        var angle_step = 360 / num_lines;
        
        for (var i = 0; i < 360; i += angle_step) {
            var current_angle = base_angle + i;
            var sx = cx + lengthdir_x(200, current_angle);
            var sy = cy + lengthdir_y(200, current_angle);
            spawn_warning(sx, sy, cx, cy);
        }
        break;

    case 2:
        // THE CAGE 
        var offset = 45; 
        spawn_warning(cx - 200, cy - offset, cx, cy - offset); 
        spawn_warning(cx + 200, cy + offset, cx, cy + offset); 
        spawn_warning(cx - offset, cy - 200, cx - offset, cy); 
        spawn_warning(cx + offset, cy + 200, cx + offset, cy); 
        break;

    case 3:
        // THE HOURGLASS
        var base_dir = random(360);
        for (var i = -35; i <= 35; i += 35) {
            if (i == 0) continue; 
            var sx1 = cx + lengthdir_x(200, base_dir + i);
            var sy1 = cy + lengthdir_y(200, base_dir + i);
            spawn_warning(sx1, sy1, cx, cy);

            var sx2 = cx + lengthdir_x(200, base_dir + 180 + i);
            var sy2 = cy + lengthdir_y(200, base_dir + 180 + i);
            spawn_warning(sx2, sy2, cx, cy);
        }
        break;

    case 4:
        // THE COMB
        var comb_spacing = 30;
        spawn_warning(cx - 200, cy, cx, cy); 
        spawn_warning(cx - 200, cy - comb_spacing, cx, cy - comb_spacing);
        spawn_warning(cx - 200, cy + comb_spacing, cx, cy + comb_spacing);
        spawn_warning(cx - 200, cy - (comb_spacing*2), cx, cy - (comb_spacing*2));
        spawn_warning(cx - 200, cy + (comb_spacing*2), cx, cy + (comb_spacing*2));
        break;
        
    case 5:
        // THE MAW
        var missing_angle = choose(0, 45, 90, 135, 180, 225, 270, 315);
        for (var i = 0; i < 360; i += 45) {
            if (i == missing_angle) continue;
            var sx = cx + lengthdir_x(200, i);
            var sy = cy + lengthdir_y(200, i);
            spawn_warning(sx, sy, cx, cy);
        }
        break;

    case 6:
        // THE SHURIKEN
        var base_angle = random(360);
        var offset = 28;
        for(var i = 0; i < 360; i += 90) {
            var current_angle = base_angle + i;
            var tx = cx + lengthdir_x(offset, current_angle + 90);
            var ty = cy + lengthdir_y(offset, current_angle + 90);
            var sx = tx + lengthdir_x(200, current_angle);
            var sy = ty + lengthdir_y(200, current_angle);
            spawn_warning(sx, sy, tx, ty);
        }
        break;

    case 7:
        // THE NUKE
        var base_angle = random(360);
        for (var i = 0; i < 360; i += 30) {
            var current_angle = base_angle + i;
            var sx = cx + lengthdir_x(200, current_angle);
            var sy = cy + lengthdir_y(200, current_angle);
            spawn_warning(sx, sy, cx, cy);
        }
        break;

    case 8:
        // THE TUNNEL
        var dir = random(360);
        var tunnel_width = 35;
        
        var tx1 = cx + lengthdir_x(tunnel_width, dir + 90);
        var ty1 = cy + lengthdir_y(tunnel_width, dir + 90);
        spawn_warning(tx1 + lengthdir_x(200, dir), ty1 + lengthdir_y(200, dir), tx1, ty1);
        
        var tx2 = cx + lengthdir_x(tunnel_width, dir - 90);
        var ty2 = cy + lengthdir_y(tunnel_width, dir - 90);
        spawn_warning(tx2 + lengthdir_x(200, dir), ty2 + lengthdir_y(200, dir), tx2, ty2);
        
        var sx_back = cx + lengthdir_x(200, dir + 180);
        var sy_back = cy + lengthdir_y(200, dir + 180);
        spawn_warning(sx_back, sy_back, cx, cy);
        break;

    case 9:
        // THE SCISSORS
        var dir = random(360);
        var sx1 = cx + lengthdir_x(200, dir - 30);
        var sy1 = cy + lengthdir_y(200, dir - 30);
        spawn_warning(sx1, sy1, cx, cy);
        
        var sx2 = cx + lengthdir_x(200, dir + 30);
        var sy2 = cy + lengthdir_y(200, dir + 30);
        spawn_warning(sx2, sy2, cx, cy);
        
        var sx3 = cx + lengthdir_x(200, dir);
        var sy3 = cy + lengthdir_y(200, dir);
        var tx3 = cx + lengthdir_x(40, dir);
        var ty3 = cy + lengthdir_y(40, dir);
        spawn_warning(sx3, sy3, tx3, ty3);
        break;
        
    case 10:
        // THE SNIPER
        var spawn_angle = random(360);
        var sx = cx + lengthdir_x(200, spawn_angle);
        var sy = cy + lengthdir_y(200, spawn_angle);
        
        var warn = instance_create_layer(sx, sy, "Instances", obj_warning_line);
        warn.image_angle = point_direction(sx, sy, cx, cy);
        warn.image_xscale = 15;
        warn.is_tracking = true;
        warn.lifetime = 90; 
        warn.lock_time = 20; 
        break;

    case 11:
        // THE GRID
        var grid_space = 40;
        spawn_warning(mid_x - grid_space, mid_y - 400, mid_x - grid_space, mid_y + 400);
        spawn_warning(mid_x + grid_space, mid_y - 400, mid_x + grid_space, mid_y + 400);
        spawn_warning(mid_x - 400, mid_y - grid_space, mid_x + 400, mid_y - grid_space);
        spawn_warning(mid_x - 400, mid_y + grid_space, mid_x + 400, mid_y + grid_space);
        break;

    case 12:
        // THE TIDAL WAVE
        var is_horizontal = choose(true, false);
        var is_positive_safe = choose(true, false);
        var safe_offset = is_positive_safe ? 60 : -60;
        
        if (is_horizontal) {
            spawn_warning(mid_x - 400, mid_y + safe_offset, mid_x + 400, mid_y + safe_offset);
            spawn_warning(mid_x - 400, mid_y + safe_offset + 35, mid_x + 400, mid_y + safe_offset + 35);
            spawn_warning(mid_x - 400, mid_y + safe_offset - 35, mid_x + 400, mid_y + safe_offset - 35);
        } else {
            spawn_warning(mid_x + safe_offset, mid_y - 400, mid_x + safe_offset, mid_y + 400);
            spawn_warning(mid_x + safe_offset + 35, mid_y - 400, mid_x + safe_offset + 35, mid_y + 400);
            spawn_warning(mid_x + safe_offset - 35, mid_y - 400, mid_x + safe_offset - 35, mid_y + 400);
        }
        break;
        
    case 13:
        // THE CROSSFIRE
        var angle1 = random(360);
        var angle2 = angle1 + 90; 

        var sx1 = cx + lengthdir_x(200, angle1);
        var sy1 = cy + lengthdir_y(200, angle1);
        var warn1 = instance_create_layer(sx1, sy1, "Instances", obj_warning_line);
        warn1.image_xscale = 15;
        warn1.is_tracking = true;
        warn1.lifetime = 80;
        warn1.lock_time = 20;

        var sx2 = cx + lengthdir_x(200, angle2);
        var sy2 = cy + lengthdir_y(200, angle2);
        var warn2 = instance_create_layer(sx2, sy2, "Instances", obj_warning_line);
        warn2.image_xscale = 15;
        warn2.is_tracking = true;
        warn2.lifetime = 80;
        warn2.lock_time = 20;
        break;
        
    case 14:
        // THE HUNTER PACK
        for (var i = 0; i < 3; i++) {
            var spawn_angle = random(360);
            var sx = cx + lengthdir_x(200, spawn_angle);
            var sy = cy + lengthdir_y(200, spawn_angle);

            var warn = instance_create_layer(sx, sy, "Instances", obj_warning_line);
            warn.image_xscale = 15;
            warn.is_tracking = true;
            warn.lock_time = 20;
            warn.lifetime = 60 + (i * 30); 
        }
        break;
}

alarm[0] = current_spawn_rate;