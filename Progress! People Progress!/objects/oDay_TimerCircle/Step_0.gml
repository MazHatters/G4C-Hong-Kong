// Top Left position
x = 83;
y = 82;

if (instance_exists(oController))
{
	// 10 sprites (0 to 9)
	// Percentage of day passed (0 to 1)
	var _percent = 1 - (oController.day_timer / oController.max_day_timer);
	image_index = floor(_percent * 9);
	image_index = clamp(image_index, 0, 9);
}
