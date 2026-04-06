if (!instance_exists(oController)) exit;

switch (state)
{
	case "ENTERING":
		if (!audio_is_playing(NPC_FootSteps)) NPC_FootSteps = audio_play_sound(soFootsteps, 10, true);
		image_xscale = 1;
		if (x > target_x) x -= walk_speed;
		else {
			if (audio_is_playing(NPC_FootSteps)) audio_stop_sound(NPC_FootSteps);
			state = "TALKING";
			dialogue_step = 1;
			char_count = 0;
			oController.total_proposals++;
		}
	break;

	case "TALKING":
		if (dialogue_step == 1) full_text = text1;
		else if (dialogue_step == 2) full_text = text2;
		else if (dialogue_step == 3) full_text = text3;

		if (char_count < string_length(full_text)) char_count += type_speed;
        
        if (oController.show_result) exit;

		if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
			if (char_count < string_length(full_text)) char_count = string_length(full_text);
			else {
				dialogue_step++;
				if (dialogue_step > 3) {
					state = "DECIDING";
					if (!instance_exists(oButton_approve)) {
						instance_create_depth(0, 0, -10, oButton_approve);
						instance_create_depth(0, 0, -10, oButton_reject);
						if (global.skips_remaining > 0) instance_create_depth(0, 0, -10, oButton_skip);
					}
                    oController.npc_timer = 10 * 60;
                    oController.npc_timer_active = true;
				} else char_count = 0;
			}
		}
	break;

	case "DECIDING":
        if (oController.npc_timer <= 0) oController.player_choice = "REJECT";

		if (oController.player_choice != "WAITING") {
            process_outcome(oController.player_choice);
            oController.player_choice = "WAITING";
        }
	break;

	case "RESPONSE":
		if (char_count < string_length(full_text)) char_count += type_speed;
        if (oController.show_result) exit;

		if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
			if (char_count < string_length(full_text)) char_count = string_length(full_text);
			else state = "EXITING";
		}
	break;

	case "EXITING":
		if (!audio_is_playing(NPC_FootSteps)) NPC_FootSteps = audio_play_sound(soFootsteps, 10, true);
	    image_xscale = -1;
		x += walk_speed;
		if (x >= 1408) {
			if (audio_is_playing(NPC_FootSteps)) audio_stop_sound(NPC_FootSteps);
			
            // RECYCLE NPC: Push back to cooldown queue
            array_push(oController.npc_cooldown_queue, current_npc_data);
            
			if (oController.day_done) oController.show_result = true;
			else event_perform(ev_create, 0);
		}
	break;
}