if (instance_exists(oController))
{
	var _quota = 1; // Prevent division by zero
	if (oController.day == 1) _quota = oController.day1_quota;
	else if (oController.day == 2) _quota = oController.day2_quota;
	else if (oController.day == 3) _quota = oController.day3_quota;
	else _quota = oController.day3_quota;

	var _percent = oController.revenue / _quota;

	if (_percent < 0.16) sprite_index = sMoney1;
	else if (_percent < 0.33) sprite_index = sMoney2;
	else if (_percent < 0.50) sprite_index = sMoney3;
	else if (_percent < 0.66) sprite_index = sMoney4;
	else if (_percent < 0.83) sprite_index = sMoney5;
	else if (_percent >= 1) sprite_index = sMoney6;
}

draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (instance_exists(oController))
{
	var _quota = 0;
	if (oController.day == 1) _quota = oController.day1_quota;
	else if (oController.day == 2) _quota = oController.day2_quota;
	else if (oController.day == 3) _quota = oController.day3_quota;
	else _quota = oController.day3_quota;

	//draw_text(x, y, "Revenue: " + string(oController.revenue) + " / " + string(_quota));
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
