/// tween_system_roomend()
/*
DO NOT CALL THIS SCRIPT MANUALLY. 
To set up Tweenline copy the obj_tweenline from the Extension into your project and all the TWEENLINE scripts.
You are ready to use tweenline. :) 


If you don't have the obj_tweenline you can create from scratch. Simply create a new object and name it obj_tweenline.
Then add the following codes:

    // Create Event:
    if (singleton()) {exit;} depth = 1000000;

    // Step > Normal Step event
    tween_system_step();
    
    // Other > Room start event
    tween_system_roomstart();
    
    // Other > Room end event
    tween_system_roomend();
    

ENJOY!

_______________________

WARNING: For Playstation 4 and Playstation Vita developers, due to a GameMaker BUG in those platforms
you SHOULD add this code to the begining of your game:

    // Due to a bug with GMS extensions auto init, tweenline must be initialized manually
    if (os_type == os_ps4 || os_type == os_psvita) { tween_system_init();}
    
In all the other platforms, the extension should init automatically. If not, please email me. 


*/

cv_system_gc(); // Garbage collector for Custom Vars system. 

var stored_arr  = undefined;
var stored_size = 0;

// For each tween
for (var g = global._tw_dslist, size = ds_list_size(g), i=0; i<size; i++) {
    var tween = ds_list_find_value(g, i);
    
    var target = tween[TLTWEEN.SETTERS_TARGET];
    if (instance_exists(target)) {
        if (!target.persistent) { // If the tween target is not persistent
            if (room_persistent) { //If room is persistent
                // Store Tween
                stored_arr[stored_size++] = tween;
            }
            // Remove tween from renderlist
            ds_list_delete(g,i);
            i--;
            size--;
            tween[@TLTWEEN.INRENDERLIST] = false;
        }
    } else {
        __tl_private_error(tween, "Garbage collector warning. For some reason the instance with ID " + string(target) + " does not exists when performing garbage collection. This should not happen. Please report it. ");
    }
}
if (room_persistent) {
    // Store ALL the tweenlines
    for (var g = global._tw_tl_dslist, size = ds_list_size(g), i=0; i<size; i++) {
        var tweenline = ds_list_find_value(g, i);
        //Store Tweenline
        stored_arr[stored_size++] = tweenline;
        // And remove from renderlist
        ds_list_delete(g,i);
        size--;
        i--;
        tweenline[@TLTWEEN.INRENDERLIST] = false;
    }
    if (stored_size > 0) { //If there are any stored tweens/tweenlines
        // Store the array "arr" inside the ds_map
        ds_map_add(global._tw_pers_rooms_map, room, stored_arr);
    }
} else {
    // Delete ALL the tweenlines (reverse cleaning)
    for (var g = global._tw_tl_dslist, i = ds_list_size(g)-1; i>=0; i--) {
        var tweenline = ds_list_find_value(g, i);
        tweenline_destroy(tweenline);
    }
}


