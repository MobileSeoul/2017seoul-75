/// draw_surface_clip(sprite, x, y, clipx, clipy, clipw, cliph)
var s = argument0;
var sw = surface_get_width(s);
var sh = surface_get_height(s);
var sx =  surface_get_width(s)/2;
var sy =  surface_get_height(s)/2;


//var si = argument1;
var _x = argument1;
var _y = argument2;
var cx1 = argument3;
var cy1 = argument4;
var cx2 = cx1 + argument5;
var cy2 = cy1 + argument6;
//
var bx1 = _x -  surface_get_width(s)/2;
var by1 = _y -  surface_get_height(s)/2;
var bx2 = bx1 +surface_get_width(s);
var by2 = by1 + surface_get_height(s);
//
switch (rectangle_in_rectangle(bx1, by1, bx2, by2, cx1, cy1, cx2, cy2)) {
case 1:
{
    draw_surface(s, _x, _y);
    return true;
}
case 2:
{
    var lx1 = max(0, cx1 - bx1);
    var ly1 = max(0, cy1 - by1);
    var lx2 = sw + min(0, cx2 - bx2);
    var ly2 = sh + min(0, cy2 - by2);
   // draw_sprite_part(s, si, lx1, ly1, lx2 - lx1, ly2 - ly1, _x + lx1 - sx, _y + ly1 - sy);
   draw_surface_part(s, lx1, ly1, lx2 - lx1, ly2 - ly1, _x + lx1 - sx, _y + ly1 - sy);
    return true;
}
}
return false;
