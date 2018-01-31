/// tween_system_get_tweenline_count()
/*
Gets the number of tweenlines active in the tween system
You can use it this function to detect memory leaks.

Example:
    draw_text( 20, 20, "Active tweenlines: "+string(tween_system_get_tweenlines_count()) );
This will draw in the screen the number of active tweenlines

*/

return ds_list_size(global._tw_tl_dslist);
