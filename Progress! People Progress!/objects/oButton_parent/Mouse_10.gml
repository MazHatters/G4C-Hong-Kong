audio_play_sound(soMouseHover, 10, false);

switch (object_index)
{
	case oButton_approve:		sprite_index = sApproveSmall; break;
    case oButton_reject:		sprite_index = sRejectSmall; break;
    case oButton_nextday:		sprite_index = sNextDaySmall; break;
    case oButton_restart_room:	sprite_index = sRestartSmall; break;
    case oButton_mainmenu:		sprite_index = sMenuSmall; break;
	case oButton_play:			sprite_index = sPlaySmall; break;
	case oButton_quit:			sprite_index = sQuitSmall; break;
}