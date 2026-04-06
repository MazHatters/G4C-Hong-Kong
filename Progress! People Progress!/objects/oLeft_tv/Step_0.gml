if (instance_exists(oController))
{
	if (oController.static_timer > 0)
	{
		sprite_index = sStatic;
		// 1 second transition (60 frames), show each frame for 0.5s (30 frames)
		if (oController.static_timer > 30) image_index = 0;
		else image_index = 1;
		image_speed = 0;
	}
	else
	{
		image_speed = 1;
		if (oController.day == 1)
			sprite_index = NormalForest;
		else if (oController.day == 2)
			sprite_index = sRainforest_day2;
		else if (oController.day == 3)
			sprite_index = FullyCookedForest;
	}
}