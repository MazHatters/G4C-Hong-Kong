var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

// We update our "Internal GUI Coordinates" instead of physical x/y
switch (object_index)
{
    case oButton_approve:		gui_x = 352; gui_y = 288; break;
    case oButton_reject:		gui_x = 672; gui_y = 288; break;
    case oButton_nextday:		gui_x = _gw / 2; gui_y = (_gh / 2) + 100; break;
    case oButton_restart_room:	gui_x = _gw / 2; gui_y = (_gh / 2) + 100; break;
    case oButton_mainmenu:		gui_x = _gw / 2; gui_y = (_gh / 2) + 200; break;
	case oButton_play:			gui_x = 320; gui_y = 448;  break;
	case oButton_quit:			gui_x = 1088; gui_y = 640; break;
    case oButton_skip:          gui_x = 512;  gui_y = 384; break;
}

// Physical x/y MUST match for point_in_rectangle to work in Global Pressed
x = gui_x;
y = gui_y;