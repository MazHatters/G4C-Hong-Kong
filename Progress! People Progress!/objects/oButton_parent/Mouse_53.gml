// --- GUI CLICK DETECTION ---
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Use the gui_x/y variables set in Step event
var _w2 = sprite_get_width(sprite_index) / 2;
var _h2 = sprite_get_height(sprite_index) / 2;

// Check GUI pixels directly
if (point_in_rectangle(_mx, _my, gui_x - _w2, gui_y - _h2, gui_x + _w2, gui_y + _h2))
{
	switch (object_index)
	{
		case oButton_play:
			if (oController.current_music != -1) audio_sound_gain(oController.current_music, 0, 500);
			oController.current_music = audio_play_sound(soGameplay_Lukrembo___Jay__freetouse_com_, 100, true);
			audio_sound_gain(oController.current_music, 0, 0);
			audio_sound_gain(oController.current_music, 1, 500);
			room_goto_next();
		break;
		
		case oButton_quit:
			game_end(0);
		break;
		
		case oButton_approve:
			oController.player_choice = "APPROVE";
			oController.cleanup_ui_buttons();
		break;
		
		case oButton_reject:
			oController.player_choice = "REJECT";
			oController.cleanup_ui_buttons();
		break;

        case oButton_skip:
            global.skips_remaining--;
            oController.player_choice = "SKIP";
            oController.cleanup_ui_buttons();
        break;
		
		case oButton_nextday:
			oController.day += 1;
			oController.start_day(); 
			instance_destroy();
			with(oNPC) { event_perform(ev_create, 0); }
		break;

		case oButton_restart_room:
			with(oController) { event_perform(ev_create, 0); }
			room_restart();
		break;

		case oButton_mainmenu:
			oController.current_slide = 1;
			if (oController.current_music != -1) audio_sound_gain(oController.current_music, 0, 500);
			oController.current_music = audio_play_sound(soMain_menu_Dagored___Harlem_Heat__freetouse_com_, 100, true);
			audio_sound_gain(oController.current_music, 0, 0);
			audio_sound_gain(oController.current_music, 1, 500);
			with(oController) { event_perform(ev_create, 0); }
			room_goto(Main_menu);
		break;
	}
}
