if (show_result)
{
	var _gw = display_get_gui_width();
	var _gh = display_get_gui_height();
	var _cx = _gw / 2;
	var _cy = _gh / 2;

	// 1. Draw Background Dimmer (Drawn at depth 0)
	draw_set_color(c_black);
	draw_set_alpha(result_fade_alpha);
	draw_rectangle(0, 0, _gw, _gh, false);
	draw_set_alpha(1.0);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fDialog);

	// 2. Mission Success/Failure Logic
	var _target_quota = (day == 1) ? day1_quota : ((day == 2) ? day2_quota : day3_quota);

	if (revenue >= _target_quota && !force_loss)
	{
		if (day == 3)
		{
			// Final Success: Destroyed Nature
			if (!instance_exists(oButton_restart_room)) 
			{
				instance_create_depth(0, 0, -1000, oButton_restart_room);
				instance_create_depth(0, 0, -1000, oButton_mainmenu);
			}
			
			draw_set_color(c_orange);
			draw_text_ext(_cx, _cy - 300, "Congratulations, you have successfully destroyed nature in exchange for economic growth", 40, 800);
			draw_text(_cx, _cy - 270, "Total proposals: " + string(total_proposals));
			draw_text(_cx, _cy - 240, "Total revenue: " + string(revenue));
			draw_text(_cx, _cy - 210, "Total lost: " + string(total_lost));
			draw_text(_cx, _cy - 180, "Total proposals rejected: " + string(total_rejected));
		}
		else
		{
			// Regular Success
			if (!instance_exists(oButton_nextday)) instance_create_depth(0, 0, -1000, oButton_nextday);
			
			draw_set_color(c_lime);
			draw_text(_cx, _cy - 300, "Project succeeded!");
			draw_text(_cx, _cy - 250, "Total proposals: " + string(total_proposals));
			draw_text(_cx, _cy - 200, "Total revenue: " + string(revenue));
			draw_text(_cx, _cy - 150, "Total lost: " + string(total_lost));
			draw_text(_cx, _cy - 100, "Total proposals rejected: " + string(total_rejected));
		}
	}
	else
	{
		// Spawn exactly once
		if (!instance_exists(oButton_restart_room)) 
		{
			instance_create_depth(0, 0, -1000, oButton_restart_room);
			instance_create_depth(0, 0, -1000, oButton_mainmenu);
		}
		
		draw_set_color(c_red);
		draw_text(_cx, _cy - 300, "Project failed!");
		draw_text(_cx, _cy - 200, "Total proposals: " + string(total_proposals));
		draw_text(_cx, _cy - 100, "Total revenue: " + string(revenue));
		draw_text(_cx, _cy , "Total lost: " + string(total_lost));
		draw_text(_cx, _cy + 100, "Total proposals rejected: " + string(total_rejected));
	}

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
}
