// Bounded City Parallax
var _city_left = 768;
var _city_right = 1006;
var _half_w = sprite_width / 2;

if (x > _city_right + _half_w) 
{
	x = _city_left - _half_w;
	hspeed = random_range(0.3, 1.2);
}
