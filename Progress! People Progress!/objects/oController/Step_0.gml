// --- COMMAND & CONTROL INPUTS ---
if (keyboard_check_pressed(ord("Q")) || keyboard_check_pressed(vk_escape))
    game_end();

if (keyboard_check_pressed(ord("R")))
    game_restart();

// --- FULLSCREEN TOGGLE PROTOCOL ---
if (keyboard_check_pressed(vk_f11)) {
    if (window_get_fullscreen()) {
        window_set_fullscreen(false);
        window_set_size(1280, 720); 
    } else {
        window_set_fullscreen(true);
    }
    // Alarm 0 will handle the heavy lifting once the window has settled
    alarm[0] = 1; 
}

// --- DYNAMIC RESOLUTION & GUI ANCHORING ---
if (window_has_focus()) 
{
    var _ww = window_get_width();
    var _wh = window_get_height();

    // Only re-calibrate if the window dimensions have shifted
    if (surface_get_width(application_surface) != _ww || surface_get_height(application_surface) != _wh) 
    {
        // 1. Resize the World Surface
        surface_resize(application_surface, _ww, _wh);
        
        // 2. Lock the GUI to the Window Pixels (DEPRECATED: Using fixed resolution now)
        // display_set_gui_size(_ww, _wh);
        display_set_gui_maximize(); // CRITICAL: Prevents GUI "Ghosting" or Offset
        
        // 3. Prevent Camera Stretching
        camera_set_view_size(view_camera[0], _ww, _wh);
    }
}

// --- MISSION PARAMETERS: QUOTA SCALING ---
// Optimized using a switch to save CPU cycles
switch(day)
{
    case 1: npc_limit = 5;  break;
    case 2: npc_limit = 10; break;
    case 3: npc_limit = 15; break;
    default: npc_limit = 5; break;
}