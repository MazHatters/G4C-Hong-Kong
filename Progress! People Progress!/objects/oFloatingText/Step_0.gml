y -= float_speed * float_direction;
image_alpha -= fade_speed;

if (image_alpha <= 0)
{
    instance_destroy();
}
