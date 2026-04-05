var _w = window_get_width();
var _h = window_get_height();

// Resize the surface and GUI to match the screen
// surface_resize(application_surface, _w, _h);
// display_set_gui_size(_w, _h);

// Center the window (only matters when exiting fullscreen)
if (!window_get_fullscreen()) {
    window_center();
}