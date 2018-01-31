/// tl_draw_debug(x, y);
/*
    Draw standard debug info about the tween system.
    It shows: Total tweens, Total tweenlines, FPS, FPSreal, etc.
*/

/////////////// CONFIG  ////////////////////////

// Set to true if you want the REAL number of tweens in the system (DEFAULT IS false)
// Only use this in true if you are me. Ehm... if you are the tweenline developer. 
// Or if I have asked you to change this to true.
// If false, the internal count will be used. (faster) 
var REAL_TWEEN_COUNT = false; 



//////////////// DO NOT TOUCH ///////////////

var xxx, yyy, t, r, col;
xxx = argument0;
yyy = argument1;
r =1;
col = draw_get_color();
var a =-1;
if (webgl_enabled) {a=0;}
draw_set_font(a);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var tweens, tweenlines;
tweens = tween_system_get_tween_count(REAL_TWEEN_COUNT);
tweenlines = tween_system_get_tweenline_count();

t = "Total tweens: "+string(tweens)+"#";
t+= "Total tweenlines: "+string(tweenlines)+"#";
t+= "FPS: "+string(fps)+"#";
t+= "FPSreal: "+string(fps_real)+"#";
var s = ds_map_size(global._tw_pers_rooms_map);
if (s > 0) {
    t+="Cached persistent rooms: "+string(s);
}
draw_set_color(c_black);
draw_text(xxx-r,yyy-r,t);
draw_text(xxx-r,yyy+r,t);
draw_text(xxx+r,yyy-r,t);
draw_text(xxx+r,yyy+r,t);
draw_set_color(c_white);
draw_text(xxx,yyy,t);

draw_set_color(col);
