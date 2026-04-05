if (room == Main_menu)
{
	// Stop any gameplay music that might be playing (using sound index for safety)
	audio_stop_sound(soGameplay_Lukrembo___Jay__freetouse_com_);
	
	if (!audio_is_playing(soMain_menu_Dagored___Harlem_Heat__freetouse_com_))
	{
		if (current_music != -1) audio_stop_sound(current_music);
		current_music = audio_play_sound(soMain_menu_Dagored___Harlem_Heat__freetouse_com_, 100, true);
		audio_sound_gain(current_music, 1, 0);
	}
}
