// Draw the base TV content (screen)
draw_self();

// Draw static overlay if timer is active
if (instance_exists(oController) && oController.static_timer > 0)
{
	var _s1 = asset_get_index("sStatic1");
	var _s2 = asset_get_index("sStatic2");
	if (_s1 != -1 && _s2 != -1)
	{
		draw_sprite(choose(_s1, _s2), 0, x, y);
	}
}
