// --- RELEASE FROM COOLDOWN ---
while (array_length(oController.npc_cooldown_queue) > 10) {
    var _released = array_shift(oController.npc_cooldown_queue);
    array_push(oController.npc_master_list, _released);
}

if (array_length(oController.npc_master_list) == 0 && array_length(oController.npc_cooldown_queue) > 0) {
    var _released = array_shift(oController.npc_cooldown_queue);
    array_push(oController.npc_master_list, _released);
}

// --- NPC SELECTION ---
if (array_length(oController.npc_master_list) > 0)
{
	var _chosen = array_shift(oController.npc_master_list);
    current_npc_data = _chosen;

	identity = _chosen.name;
	text1 = _chosen.dialogue1;
	text2 = _chosen.dialogue2;
	text3 = _chosen.dialogue3;
	yes_text = _chosen.approve;
	no_text = _chosen.reject;
	skip_text = (variable_struct_exists(_chosen, "skip")) ? _chosen.skip : _chosen.reject;
	profit = _chosen.gain;
	lose = _chosen.lost;
	sprite_index = _chosen.sprite;
	oController.npc_count += 1;
}
else
{
    oController.force_loss = true;
    oController.show_result = true;
	instance_destroy();
	exit; 
}

// --- STATE MACHINE ---
state = "ENTERING";
dialogue_step = 1;
current_response = "";
walk_speed = 20; 
target_x = 544;
x = 1408;
y = 512;

// --- TYPEWRITER CONFIG ---
char_count = 0;           
type_speed = 0.5;         
box_height = 150;         
text_padding = 40;        
full_text = "";           

NPC_FootSteps = -1;

// --- HELPER METHODS ---

/// @func process_outcome(choice_type)
process_outcome = function(_type) {
    oController.npc_timer_active = false;
    char_count = 0;
    state = "RESPONSE";
    
    var _val = 0;
    
    switch(_type) {
        case "APPROVE":
            current_response = yes_text;
            _val = profit;
            oController.approvals_remaining--;
            break;
            
        case "REJECT":
            current_response = no_text;
            _val = lose;
            // Special Wife logic
            if (identity == "Wife" && oController.revenue > 0) {
                _val = -floor(oController.revenue / 2);
            }
            oController.total_rejected++;
            break;
            
        case "SKIP":
            current_response = skip_text;
            _val = 0;
            break;
    }
    
    full_text = current_response;
    oController.revenue += _val;
    
    // Effects (Sound & Text)
    if (_type != "SKIP") {
        if (_val >= 0) audio_play_sound(soGetMoney, 10, false);
        else audio_play_sound(soLoseMoney, 10, false);
        
        var _ft = instance_create_layer(156, 350, "Dialog_choice_revenue", oFloatingText);
        _ft.text = (_val >= 0 && _type == "APPROVE" ? "+" : "") + string(_val);
        _ft.text_color = (_val >= 0 ? c_yellow : c_red);
        _ft.float_direction = (_val >= 0 ? 1 : -1);
        
        if (_val < 0) oController.total_lost += _val;
    }
    
    // Cleanup
    oController.cleanup_ui_buttons();
    io_clear();
}