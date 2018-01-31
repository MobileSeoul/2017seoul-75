/// tween_system_get_tween_count([real_number = false])
/*
Gets the number of tweens active in the tween system
You can use it this function to detect memory leaks.

If the optional parameter real_number is passed and is true, the function will 
return ALL the tweens that are procesed by the system, including those 
that are in the waiting line to be cleared. 
The default is false. It means that it will show only the tweens that are in the render list. 

Example:

    draw_text( 20, 20, "Active tweens: "+string(tween_system_get_tween_count()) );
    
This will draw in the screen the number of active tweens

*/
if (argument_count>0) {
    if (argument[0]) {
        return ds_list_size(global._tw_dslist);
    }
}

var g = global._tw_dslist, num = ds_list_size(g);
for (var i=0, s = num; i<s; i++) {
    var tween = ds_list_find_value(g, i);
    if (!tween[TLTWEEN.INRENDERLIST]) {
        num--;
    }
} 
return num;
