// Initialize position
if (instance_exists(oMoney_bar))
{
    x = oMoney_bar.x;
    y = oMoney_bar.y - 14; // Offset to sit on top of the bar, based on room placement (78-64=14)
}

target_x = x;
lerp_speed = 0.1;
bar_half_width = 307; // From sMoney_bar_no_highlight 
depth = -9999;