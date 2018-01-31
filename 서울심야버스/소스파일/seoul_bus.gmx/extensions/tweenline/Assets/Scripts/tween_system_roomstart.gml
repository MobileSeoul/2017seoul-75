/// tween_system_roomstart()
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
    tween_system_roomstart();

ENJOY!

_______________________

WARNING: For Playstation 4 and Playstation Vita developers, due to a GameMaker BUG in those platforms
you SHOULD add this code to the begining of your game:

    // Due to a bug with GMS extensions auto init, tweenline must be initialized manually
    if (os_type == os_ps4 || os_type == os_psvita) { tween_system_init();}
    
In all the other platforms, the extension should init automatically. If not, please email me. 


*/

/// restore all the persistent tweens and tweenlines fot the current room
var g = global._tw_pers_rooms_map;
if (ds_map_exists(g, room)) {
    if (room_persistent) {
        var arr = ds_map_find_value(g, room);
        for(var i=0, size = array_length_1d(arr); i<size; i++) {
            var t = arr[i];
            switch(t[TLTWEEN.TYPE]) {
                case TLTYPE.TWEEN:
                    __tl_private_tween_revive(t);
                    break;
                case TLTYPE.TIMELINE: 
                    __tl_private_tweenline_revive(t);
                    break;
            }
        }
    }
    ds_map_delete(g, room);
}
