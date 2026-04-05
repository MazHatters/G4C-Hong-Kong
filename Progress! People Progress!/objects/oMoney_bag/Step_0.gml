if (instance_exists(oController) && instance_exists(oMoney_bar))
{
    // Determine the current quota
    var _quota = 1; 
    if (oController.day == 1) _quota = oController.day1_quota;
    else if (oController.day == 2) _quota = oController.day2_quota;
    else if (oController.day == 3) _quota = oController.day3_quota;
    else _quota = oController.day3_quota;

    // Calculate target X position based on revenue / quota
    // revenue / quota gives a range nominally [0, 1] for profit, but can be negative
    var _ratio = oController.revenue / _quota;
    
    // Map ratio to the bar width
    target_x = oMoney_bar.x + (_ratio * bar_half_width);
    
    // Clamp target_x within the visual bounds of the bar
    target_x = clamp(target_x, oMoney_bar.x - bar_half_width, oMoney_bar.x + bar_half_width);
    
    // Smoothly move towards the target
    x = lerp(x, target_x, lerp_speed);
    
    // Keep y aligned with the bar (in case bar moves or window resizes)
    y = oMoney_bar.y - 14; 
}
