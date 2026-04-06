switch (object_index)
{
	case oButton_approve:		sprite_index = sApproveBig; break;
    case oButton_reject:		sprite_index = sRejectBig; break;
    case oButton_nextday:		sprite_index = sNextDayBig; break;
    case oButton_restart_room:	sprite_index = sRestartBig; break;
    case oButton_mainmenu:		sprite_index = sMenuBig; break;
	case oButton_play:			sprite_index = sPlayBig; break;
	case oButton_quit:			sprite_index = sQuitBig; break;
	case oButton_skip:			
		switch (global.skips_remaining)
		{
			case 3: sprite_index = sButton_skip3big; break;
			case 2: sprite_index = sButton_skip2big; break;
			case 1: sprite_index = sButton_skip1big; break;
			default: sprite_index = sSkip_big; break;
		}
	break;
}