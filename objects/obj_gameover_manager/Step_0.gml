if (menu_alpha < 1) {
    menu_alpha += 0.05;
}

if (keyboard_check_pressed(ord("R"))) {
    room_restart();
}

if (keyboard_check_pressed(vk_escape)) {
    room_goto(room_menu);
}