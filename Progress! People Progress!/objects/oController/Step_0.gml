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

// --- MISSION PARAMETERS: TIMER & QUOTA ---
if (room != Main_menu && !show_result) {
    // Day Timer Countdown
    if (day_timer > 0) day_timer--;
    
    // NPC Timer Countdown (Starts when NPC is in DECIDING state)
    if (npc_timer_active && npc_timer > 0) npc_timer--;
    
    // Update Quota Status
    var _target_quota = 0;
    switch(day) {
        case 1: _target_quota = day1_quota; break;
        case 2: _target_quota = day2_quota; break;
        case 3: _target_quota = day3_quota; break;
    }
    quota_hit = (revenue >= _target_quota);

    // AUTO-WIN LOGIC
    if (quota_hit && !day_done) {
        day_done = true;
    }

    // Global Loss Check
    var _out_of_time = (day_timer <= 0);
    var _out_of_approvals = (approvals_remaining <= 0);
    
    // Check for Day End / Loss
    if (_out_of_time || _out_of_approvals) {
        if (!day_done) {
            day_done = true;
        }
    }
}

// Fade logic
if (day_done && !instance_exists(oNPC)) {
    show_result = true;
}

if (show_result) {
    if (result_fade_alpha < 0.6) result_fade_alpha += 0.02;
}