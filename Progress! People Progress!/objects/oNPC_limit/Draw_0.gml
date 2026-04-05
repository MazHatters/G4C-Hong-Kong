draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (instance_exists(oController))
{
    draw_text(x, y, "Proposals: " + string(oController.npc_count) + "/" + string(oController.npc_limit));
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
