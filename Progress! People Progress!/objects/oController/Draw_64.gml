if (show_result)
{
	var _gw = display_get_gui_width();
	var _gh = display_get_gui_height();
	var _cx = _gw / 2;
	var _cy = _gh / 2;

	// 1. Draw Background Dimmer
	draw_set_color(c_black);
	draw_set_alpha(result_fade_alpha);
	draw_rectangle(0, 0, _gw, _gh, false);
	draw_set_alpha(1.0);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fDialog);

	// 2. Mission Success/Failure Logic
	var _target_quota = get_current_quota();
	var _success = (revenue >= _target_quota && !force_loss);
    
    // UI Button Cleanup & Spawning
    if (!instance_exists(oButton_restart_room)) 
    {
        if (_success && day < 3) {
            if (!instance_exists(oButton_nextday)) instance_create_depth(0, 0, -1000, oButton_nextday);
        } else {
            instance_create_depth(0, 0, -1000, oButton_restart_room);
            instance_create_depth(0, 0, -1000, oButton_mainmenu);
        }
    }

    // Header Text
    var _header_y = _cy - 300;
    if (_success) {
        draw_set_color(day == 3 ? c_orange : c_lime);
        var _msg = day == 3 ? "Congratulations, you have successfully destroyed nature in exchange for economic growth" : "Project succeeded!";
        draw_text_ext(_cx, _header_y, _msg, 40, 800);
    } else {
        draw_set_color(c_red);
        draw_text(_cx, _header_y, "Project failed!");
    }

    // Stats Block
    var _stats_y = _cy - 200;
    var _spacing = 40;
    draw_set_color(c_white);
    draw_text(_cx, _stats_y + (0 * _spacing), "Total proposals: " + string(total_proposals));
    draw_text(_cx, _stats_y + (1 * _spacing), "Total revenue: " + string(revenue));
    draw_text(_cx, _stats_y + (2 * _spacing), "Total lost: " + string(total_lost));
    draw_text(_cx, _stats_y + (3 * _spacing), "Total proposals rejected: " + string(total_rejected));

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
