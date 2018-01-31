#define __tl_private
/********************


THESE ARE PRIVATE FUNCTIONS

SO, DO NOT USE IT!!! 



***************************************/

#define __tl_private_array_find_value
/// __tl_private_array_find_value(array, key)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        It's like ds_map_find_value(list, key) but with arrays ussed 
        as maps. (Even indexes used as key and odd indexes used as values.)
        
        
*/

var size = array_length_1d(argument0)-1;
for (var i=0; i<size; i++;) {
    if (argument0[i++]==argument1){return argument0[i];}
}
return undefined;

#define __tl_private_array_join
/// __tl_private_array_join(array1, array2)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        It's like ds_map_find_value(list, key) but with arrays ussed 
        as maps. (Even indexes used as key and odd indexes used as values.)
        
        
*/

// Yeah! One line bitches! It's super portable... 
for (var i=0, size1 = array_length_1d(argument0), size2 = array_length_1d(argument1)-1; i<size2; i++;) {argument0[size1+i]=argument1[i];}return argument0;

#define __tl_private_tween_revive
/// __tl_private_tween_revive(tween)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        Revive a die tween :) 
        If the tween is revived, returns the tween index.
        If not, returns false.
        
*/


var _t = argument0;
if (_t[TLTWEEN.KILLMEPLEASE] || !_t[TLTWEEN.INRENDERLIST]) {
    _t[@TLTWEEN.INRENDERLIST] = true;
    _t[@TLTWEEN.KILLMEPLEASE] = false;
    ds_list_add(global._tw_dslist, _t);
    return _t;
}
return false;


#define __tl_private_tweenline_revive
/// __tl_private_tweenline_revive(tweenline)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        Revive a died tweenline :) 
        If the tweenline is revived, returns the tweenline index.
        If not, returns false.
        
*/


var _t = argument0;
if (!_t[TLTWEEN.INRENDERLIST]) {
    ds_list_add(global._tw_tl_dslist, _t);
    return _t;
}
return false;


#define __tl_private_perform_event
/// __tl_private_perform_event( tween, enum_callback, enum_callback_type, enum_callback_params, enum_callback_lazy);
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        argument0 - ARRAY tween
        argument1 - ENUM callback
        argument2 - ENUM callback_type
        argument3 - ENUM callback_params
        argument4 - ENUM callback_lazy
        
        
*/


switch (argument0[argument2]) {
    case TLEVENT.SCRIPT:  {
        with(argument0[TLTWEEN.SETTERS_TARGET]) {
            var s = argument0[argument1], a = argument0[argument3];
            switch (array_length_1d(a)) {
                case 0: return script_execute(s); break;
                case 1: return script_execute(s,a[0]); break;
                case 2: return script_execute(s,a[0],a[1]); break;
                case 3: return script_execute(s,a[0],a[1],a[2]); break;
                case 4: return script_execute(s,a[0],a[1],a[2],a[3]); break;
                case 5: return script_execute(s,a[0],a[1],a[2],a[3],a[4]); break;
                case 6: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5]); break;
                case 7: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6]); break;
                case 8: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7]); break;
                case 9: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8]); break;
                case 10: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9]); break;
                case 11: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10]); break;
                case 12: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11]); break;
                case 13: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12]); break;
                case 14: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13]); break;
                default: return script_execute(s,a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],a[9],a[10],a[11],a[12],a[13],a[14]); break;
            }
        } 
    } break;
    case TLEVENT.USER: {
        with(argument0[TLTWEEN.SETTERS_TARGET]) {
            event_user(argument0[argument1]);
        }
        return false;
    } break;
    case TLEVENT.LAZY: {
        if (global._tw_lazy_eneabled) {
            argument0[@ argument4] = true;
            ds_list_add(global._tw_lazy_todo_reset, argument4);
            ds_list_add(global._tw_lazy_todo_tweens, argument0);
        }
        return false;
    } break;
}

#define __tl_private_lazy_reset
/// __tl_private_lazy_reset();
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 

        
        
*/
var reset = global._tw_lazy_todo_reset, tweens = global._tw_lazy_todo_tweens;
var size = ds_list_size(reset);
for (var i=0; i<size; i++) {
    var _t = ds_list_find_value(tweens,i);
    _t[@ ds_list_find_value(reset,i)] = false;
}
ds_list_clear(reset);
ds_list_clear(tweens);