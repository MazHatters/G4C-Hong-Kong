// Check if we have anyone left in the pool
if (array_length(oController.npc_master_list) > 0)
{
	var _found = false;
	var _attempts = 0;
	var _max_attempts = array_length(oController.npc_master_list);
	var chosen = undefined;

	while (!_found && _attempts < _max_attempts)
	{
		chosen = oController.npc_master_list[0];
		// A "loss NPC" is one where both Approve and Reject lead to a revenue reduction (or zero)
		var _is_loss_npc = (chosen.gain < 0 && chosen.lost < 0);
		
		if (_is_loss_npc && (oController.loss_npc_count >= 1 || oController.day == 1))
		{
			// Daily limit reached OR Day 1 restriction. Recycle to the end of the pool.
			array_push(oController.npc_master_list, array_shift(oController.npc_master_list));
			_attempts++;
		}
		else
		{
			// Valid NPC found (either not a loss NPC, or we haven't reached the daily limit yet)
			_found = true;
			array_shift(oController.npc_master_list);
			if (_is_loss_npc) oController.loss_npc_count += 1;
		}
	}

	// Safety: If after max attempts we only have loss NPCs, just take the first one anyway
	if (!_found && chosen != undefined)
	{
		chosen = array_shift(oController.npc_master_list);
	}

	identity = chosen.name;
	text1 = chosen.dialogue1;
	text2 = chosen.dialogue2;
	text3 = chosen.dialogue3;
	yes_text = chosen.approve;
	no_text = chosen.reject;
	profit = chosen.gain;
	lose = chosen.lost;
	sprite_index = chosen.sprite;
	oController.npc_count += 1;
}
else
{
	// Mission Complete: No more NPCs left in the deck
	instance_destroy();
	exit; 
}

// --- STATE MACHINE INITIALIZATION ---
state = "ENTERING";
dialogue_step = 1;
current_response = "";
walk_speed = 20; // Standard value: 20, test value: 100
target_x = 544;

// Position Reset for New Identity
x = 1408;
y = 512;

//depth = -1;

// --- TYPEWRITER CONFIG ---
char_count = 0;           // How many characters to show right now
type_speed = 0.5;         // Speed of text (higher = faster)
box_height = 150;         // Height of the black dialogue bar
text_padding = 40;        // Space from the edge of the box
full_text = "";           // The complete string we are currently typing

NPC_FootSteps = -1;