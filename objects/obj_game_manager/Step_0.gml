if (global.hp > 0) {
    global.frames_survived++;
    
    if (global.frames_survived % 60 == 0) {
        score += 10;
    }
    
    var _seconds = global.frames_survived div 60;
    var in_tier3_grace = (_seconds >= 45 && _seconds < 55);
    
    if (global.frames_survived % 480 == 0 && !in_tier3_grace) {
        current_spawn_rate = max(min_spawn_rate, current_spawn_rate - 4);
    }
}