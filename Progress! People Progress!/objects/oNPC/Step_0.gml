if (!instance_exists(oController)) exit; // <- Unlikely possible as oController is persistent

switch (state)
{
	case "ENTERING":
		if (!audio_is_playing(NPC_FootSteps)) NPC_FootSteps = audio_play_sound(soFootsteps, 10, true);
		image_xscale = 1;
		if (x > target_x)
			x -= walk_speed;
		else
		{
			if (audio_is_playing(NPC_FootSteps)) audio_stop_sound(NPC_FootSteps);
			state = "TALKING";
			dialogue_step = 1;
			char_count = 0;
		}
	break;

	case "TALKING":
		if (dialogue_step == 1) full_text = text1;
		if (dialogue_step == 2) full_text = text2;
		if (dialogue_step == 3) full_text = text3;

		if (char_count < string_length(full_text)) char_count += type_speed;

		if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left))
		{
			if (char_count < string_length(full_text))
			{
				char_count = string_length(full_text);
			}
			else
			{
				dialogue_step++;
				if (dialogue_step > 3)
				{
					state = "DECIDING";
					if (!instance_exists(oButton_approve))
					{
						instance_create_depth(0, 0, -10, oButton_approve);
						instance_create_depth(0, 0, -10, oButton_reject);
						instance_create_depth(0, 0, -10, oButton_skip); // NEW
					}
                    // Start NPC Timer
                    oController.npc_timer = 10 * 60;
                    oController.npc_timer_active = true;
				}
				else
				{
					char_count = 0;
				}
			}
		}
	break;

	case "DECIDING":
        // Handle Auto-Skip (NPC Timer runs out)
        if (oController.npc_timer <= 0)
        {
            oController.player_choice = "SKIP";
        }

		if (oController.player_choice == "APPROVE")
		{
            oController.npc_timer_active = false;
            oController.approvals_remaining--; // NEW
			current_response = yes_text;
			full_text = current_response; // Set typewriter to response text
			char_count = 0;
			state = "RESPONSE";
			oController.revenue += profit;
			if (profit >= 0) audio_play_sound(soGetMoney, 10, false);
			else audio_play_sound(soLoseMoney, 10, false);
			var _ft = instance_create_layer(156, 350, "Dialog_choice_revenue", oFloatingText);
			_ft.text = (profit >= 0 ? "+" : "") + string(profit);
			if (profit > 0)
			{
				_ft.text_color = c_yellow;
				_ft.float_direction = 1;
			}
			else if (profit <= 0)
			{
				_ft.text_color = c_red;
				_ft.float_direction = -1;
			}
			io_clear();
		} 
		else if (oController.player_choice == "REJECT")
		{
            oController.npc_timer_active = false;
			current_response = no_text;
			full_text = current_response;
			char_count = 0;
			state = "RESPONSE";
			
			var _final_loss = lose;
			
			// Special Logic for Wife: Lose half of total revenue
			if (identity == "Wife")
			{
				if (oController.revenue > 0)
				{
					_final_loss = -floor(oController.revenue / 2);
				}
				else
				{
					// If revenue is 0 or negative, just apply the standard "lost" amount
					_final_loss = lose;
				}
			}
			
			oController.revenue += _final_loss;
			
			if (_final_loss >= 0) audio_play_sound(soGetMoney, 10, false);
			else audio_play_sound(soLoseMoney, 10, false);
			
			var _ft = instance_create_layer(156, 350, "Dialog_choice_revenue", oFloatingText);
			_ft.text = string(_final_loss);
			
			if (_final_loss > 0)
			{
				_ft.text_color = c_yellow;
				_ft.float_direction = 1;
			}
			else if (_final_loss <= 0)
			{
				_ft.text_color = c_red;
				_ft.float_direction = -1;
			}
			io_clear();
		}
        else if (oController.player_choice == "SKIP") // NEW
        {
            oController.npc_timer_active = false;
            // Play reject dialogue
            current_response = no_text;
            full_text = current_response;
            char_count = 0;
            state = "RESPONSE";
            
            // Re-add to pool
            array_push(oController.npc_master_list, current_npc_data);
            
            // Clean up buttons
            if (instance_exists(oButton_approve)) instance_destroy(oButton_approve);
            if (instance_exists(oButton_reject)) instance_destroy(oButton_reject);
            if (instance_exists(oButton_skip)) instance_destroy(oButton_skip);
            
            io_clear();
        }
	break;

	case "RESPONSE":
		if (char_count < string_length(full_text)) char_count += type_speed;
		
		if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left))
		{
			if (char_count < string_length(full_text)) char_count = string_length(full_text);
			else state = "EXITING";
		}
	break;

	case "EXITING":
		if (!audio_is_playing(NPC_FootSteps)) NPC_FootSteps = audio_play_sound(soFootsteps, 10, true);
	image_xscale = -1;
		x += walk_speed;
		if (x >= 1408)
		{
			if (audio_is_playing(NPC_FootSteps)) audio_stop_sound(NPC_FootSteps);
			oController.player_choice = "WAITING";
			if (oController.day_done)
			{
				oController.show_result = true;
			}
			else
				event_perform(ev_create, 0);
		}
	break;
}