// Position the bar below the buttons
// (Adjust these coordinates as needed for your UI)
x = 448; 
y = 384;

if (instance_exists(oController))
{
	// Only show when an NPC is deciding
	var _npc = instance_find(oNPC, 0);
	if (_npc != noone && _npc.state == "DECIDING")
	{
		visible = true;
		// Map 10s timer to 11 frames (0-10)
		// Assuming frame 0 is full (10s) and frame 10 is empty (0s)
		image_index = 10 - floor(oController.npc_timer / 60);
		image_index = clamp(image_index, 0, 10);
	}
	else
	{
		visible = false;
	}
}
