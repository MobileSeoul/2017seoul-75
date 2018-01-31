#define __tl_private_vars_apply
/// __tl_private_vars_apply(tween)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________
   
THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
SRSLY, DON'T USE THIS SCRIPT. YOU CAN HEAVILY BREAK YOUR CODE.

DO YOU EVEN LISTEN TO ME?? DO-NOT-USE-IT

_________________
   
   Description of the script: 
        LOL
   Arguments of the script:
        LOL x2
___________________        

I don't know where do you live... but I will FIND YOU, I will KILL YOU (if you call this script).
    
*/

var _t = argument0, list = _t[TLTWEEN.PARSEDVARS]; 
var size = ds_list_size(list); //cached global
for (var i=0; i<size; i++;) {
    var v1 = ds_list_find_value(list, i++);
    var v2 = ds_list_find_value(list, i);
    script_execute(v1,_t,v2);
}

#define __tl_private_new_tween
/// __tl_private_new_tween(target, duration) 
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

    
   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!! 
   
   Description: 
        Creates an empty tween. All the default values are stored here. 
        
        DO NOT CHANGE IT. 
        DO NOT USE IT TO CREATE A NEW TWEEN. 
        Use tween_* functions instaed.
        
            
*/

var _t;
_t[TLTWEEN.LASTVALUE-1] = 0; //INIT ALL THE ARRAY starting from the last index, to gain speed allocating memmory
_t[TLTWEEN.TYPE] = TLTYPE.TWEEN;
_t[TLTWEEN.INRENDERLIST] = true;

_t[TLTWEEN.ID] = ++global._tw_id;
_t[TLTWEEN.KILLMEPLEASE] = false; // http://t.qkme.me/3sfg2y.jpg
_t[TLTWEEN.AUTOCLEAN] = true;

_t[TLTWEEN.EASE] = global._tw_default_ease;
_t[TLTWEEN.DURATION] = argument1;
//_t[TLTWEEN.MIN] = 0;
//_t[TLTWEEN.MAX] = 0;
//_t[TLTWEEN.DELTA] = 0;
_t[TLTWEEN.TIME] = 0;
_t[TLTWEEN.PLAY] = true;
_t[TLTWEEN.DIR] = 1;
//_t[TLTWEEN.VALUE] = 0;
_t[TLTWEEN.DELAY] = 0;
_t[TLTWEEN.INITIALDELAY] = 0;
_t[TLTWEEN.PARENT] = 0;
_t[TLTWEEN.HASPARENT] = false;
_t[TLTWEEN.USEMODIFIERS] = false;
_t[TLTWEEN.M] = undefined; //Array
_t[TLTWEEN.REPEAT] = 1;
_t[TLTWEEN.YOYO] = false;
_t[TLTWEEN.USEFRAMES] = global._tw_default_useframes;
_t[TLTWEEN.PERSISTENT] = false;

_t[TLTWEEN.FIRSTRENDER] = true;

// ( undefinded is considered an array with 0 elements in array_get_length_1d() )
_t[TLTWEEN.SETTERS] = undefined; //Array
_t[TLTWEEN.SETTERS_NUMB] = 0;
_t[TLTWEEN.SETTERS_TARGET] = argument0;

_t[TLTWEEN.CUSTOM_VARS] = undefined; //Array
_t[TLTWEEN.CUSTOM_VARS_NUMB] = 0;


//an array of parsed vars. It will be applyed in __tl_private_vars_apply
_t[TLTWEEN.PARSEDVARS] = ds_list_create();  //used only by the parsing system
_t[TLTWEEN.PARSEDSETTERS] = ds_map_create(); //used only by the parsing system.
_t[TLTWEEN.PARSEDCV] = ds_map_create(); //used only by the parsing system.  
// all those ds_ will be destroyed in __tl_private_tween_creation_finish, so don't worry. :) 

_t[TLTWEEN.DEBUGARGS] = undefined; // used only by tween_get_string()

// events (oncomplete, onreversecomplete, onstart, onupdate, onrepeat)

_t[TLTWEEN.ONCOMPLETE] = undefined;
_t[TLTWEEN.ONCOMPLETE_PARAMS] = undefined; //Array
_t[TLTWEEN.ONCOMPLETE_TYPE] = -1;
_t[TLTWEEN.ONCOMPLETE_LAZY] = false;

_t[TLTWEEN.ONREVERSECOMPLETE] = undefined;
_t[TLTWEEN.ONREVERSECOMPLETE_PARAMS] = undefined; //Array
_t[TLTWEEN.ONREVERSECOMPLETE_TYPE] = -1;
_t[TLTWEEN.ONREVERSECOMPLETE_LAZY] = false;

_t[TLTWEEN.ONSTART] = undefined;
_t[TLTWEEN.ONSTART_PARAMS] = undefined; //Array
_t[TLTWEEN.ONSTART_TYPE] = -1;
_t[TLTWEEN.ONSTART_LAZY] = false;

_t[TLTWEEN.ONUPDATE] = undefined;
_t[TLTWEEN.ONUPDATE_PARAMS] = undefined; //Array
_t[TLTWEEN.ONUPDATE_TYPE] = -1;
_t[TLTWEEN.ONUPDATE_LAZY] = false;

_t[TLTWEEN.ONREPEAT] = undefined;
_t[TLTWEEN.ONREPEAT_PARAMS] = undefined; //Array
_t[TLTWEEN.ONREPEAT_TYPE] = -1;
_t[TLTWEEN.ONREPEAT_LAZY] = false;


tween_system_get_singleton(); //forces the creation of obj_tweenline controller

return _t;


#define __tl_private_setters_capture
/// __tl_private_setters_capture(tween)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
         
        
        
*/

var _t = argument0; //tween
var target = _t[TLTWEEN.SETTERS_TARGET];
// This is the main singleton of the obj_tweenline controller. 
// It's used to store certain temporal values. 
var tweenlineController = tween_system_get_singleton();


for (var captureNumber = 0; captureNumber<2; captureNumber++) {

    if (captureNumber ==0) { // Setters
        var array_of_setters = _t[TLTWEEN.SETTERS];
        var number_of_setters = _t[TLTWEEN.SETTERS_NUMB];
    } else { // Custom vars
        var array_of_setters = _t[TLTWEEN.CUSTOM_VARS];
        var number_of_setters = _t[TLTWEEN.CUSTOM_VARS_NUMB];
    }
    
    for (var i=0; i<number_of_setters;i++) {
        var capture = -1; //should capture value (can be -1 for nocapture, TLTWEEN.MIN or TLTWEEN.MAX)
    
        if (is_undefined(array_of_setters[i,TLSETTER.MIN])) {
            capture = TLSETTER.MIN;
        } else {
            if (is_undefined(array_of_setters[i,TLSETTER.MAX])) {
                capture = TLSETTER.MAX;
            }
        }
        
        //If some value needs to be captured
        if (capture!=-1) {        
            // Capture value:
            if (captureNumber ==0) { // SETTER CAPTURE
                tweenlineController.temp_getter_script = array_of_setters[i,TLSETTER.SETTER];
                with (target) { tweenlineController.temp_getter_value = script_execute(tweenlineController.temp_getter_script); }
                var othervalue = tweenlineController.temp_getter_value;
            } else { // CUSTOM VAR CAPTURE
                var othervalue = cv_get(target,array_of_setters[i,TLSETTER.SETTER]);
                if (is_undefined(othervalue)) {
                    othervalue = 0; 
                    cv_set(target,array_of_setters[i,TLSETTER.SETTER],0);
                }
            }
            
            // If the captured value is not a real, show alert
            if (!is_real(othervalue)) {
                __tl_private_error(_t, "Alert. Cannot interpolate non real value: "+string(othervalue));
                array_of_setters[@ i,capture] = 0;
                array_of_setters[@ i,TLSETTER.DELTA] = 0;
                continue;
            }
            
            //write value to array:
            array_of_setters[@ i,capture] = othervalue; 
        }
        
    
        
        // calculate delta
        array_of_setters[@ i,TLSETTER.DELTA] =  array_of_setters[i,TLSETTER.MAX] - array_of_setters[i,TLSETTER.MIN]; 
        
    }
}
_t[@ TLTWEEN.FIRSTRENDER] = false;

#define __tl_private_tween_creation_finish
/// __tl_private_tween_creation_finish(tween)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
         Give the finishing touches to the tween (?)
         (Free memory from the ds_map ussed by the parsing system and saves the number of setters)
        
        
*/
var _t = argument0;
_t[@ TLTWEEN.SETTERS_NUMB] = ds_map_size(_t[ TLTWEEN.PARSEDSETTERS]);
_t[@ TLTWEEN.CUSTOM_VARS_NUMB] = ds_map_size(_t[TLTWEEN.PARSEDCV]);

ds_list_destroy(_t[ TLTWEEN.PARSEDVARS]); 
_t[@ TLTWEEN.PARSEDVARS] = undefined;

ds_map_destroy(_t[ TLTWEEN.PARSEDSETTERS]); 
_t[@ TLTWEEN.PARSEDSETTERS] = undefined;

ds_map_destroy(_t[ TLTWEEN.PARSEDCV]); 
_t[@ TLTWEEN.PARSEDCV] = undefined;

ds_list_add(global._tw_dslist, _t);

#define __tl_private_callback_set
/// __tl_private_callback_set(tween, callback, callback_type,  callback_script)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        tween: the tween
        callback (enum): TLTWEEN.ONREPEAT, TLTWEEN.ONCOMPLETE, etc.
        callback_type (enum): TLTWEEN.ONREPEAT_TYPE, TLTWEEN.ONCOMPLETE_TYPE, etc.
        callback_script: (string or script) "user0", "user4", scr_myscript, etc.
        
        
        
*/
var tween = argument0;
var callback_enum = argument1;
var callback_type = argument2;
var callback_script = argument3;
if (is_string(callback_script)) {
    if (string_pos("user",callback_script)!=0) {
        var str = string_digits(callback_script);
        tween[@ callback_type] = TLEVENT.USER;
        tween[@ callback_enum] = real(str);
        return true;
    } else if (callback_script == "lazy") { 
        tween[@ callback_type] = TLEVENT.LAZY;
        tween[@ callback_enum] = -2;
        return true;
    }
} else if (script_exists(callback_script)) {
    tween[@ callback_type] = TLEVENT.SCRIPT;
    tween[@ callback_enum] = callback_script;
    return true;
}
__tl_private_error(tween, "Unknown callback "+string(callback_script));

#define __tl_private_params_set
/// __tl_private_params_set(tween, callback_type, params)
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        
        
        
*/

var p = argument2;
if (is_array(p)) {
    for (var i=0, s=array_length_1d(p); i<s; i++) {
        if (p[i]=="_self") {
            p[@ i] = argument0;
        }
    }
    argument0[@ argument1] = p; 
} else {
    var a;
    if (p=="_self") {
        a[0] = argument0;
    } else {
        a[0] = argument2;
    }
    argument0[@ argument1] = a; 
}