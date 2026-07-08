var key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
var key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
var key_enter = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

// Alterna a seleção
if (key_up || key_down) {
    if (global.menu_selected == 0) {
        global.menu_selected = 1;
    } else {
        global.menu_selected = 0;
    }
}

// Executa a ação baseada em quem está selecionado
if (key_enter) {
    if (global.menu_selected == 0) {
        room_goto(room_main);
    } else if (global.menu_selected == 1) {
        room_goto(room_credits);
    }
}