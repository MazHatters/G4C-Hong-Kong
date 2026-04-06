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
	draw_set_font(Font1);

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
			draw_text_ext(_cx, _cy - 100, "Congratulations, you have successfully destroyed nature in exchange for economic growth", 40, 800);
			draw_text(_cx, _cy + 100, "Total Revenue: " + string(revenue));
		}
		else
		{
			// Regular Success
			if (!instance_exists(oButton_nextday)) instance_create_depth(0, 0, -1000, oButton_nextday);
			
			draw_set_color(c_lime);
			draw_text(_cx, _cy - 100, "Project Succeeded!");
			draw_text(_cx, _cy, "Total Revenue: " + string(revenue));
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
		draw_text(_cx, _cy - 100, "Project Failed!");
		draw_text(_cx, _cy, "Total Revenue: " + string(revenue) + " / " + string(_target_quota));
	}

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
}

// --- TOP HUD DISPLAY ---
if (room != Main_menu) {
    draw_set_font(Font1);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    
    // Quota Status
    if (quota_hit) draw_set_color(c_lime);
    else draw_set_color(c_red);
    draw_text(20, 140, "Quota Met: " + (quota_hit ? "YES" : "NO"));
    
    draw_set_color(c_white);
}
