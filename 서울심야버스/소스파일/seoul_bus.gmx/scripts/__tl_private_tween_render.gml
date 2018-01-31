#define __tl_private_tween_render
/// __tl_private_tween_render(tween, progress);
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        Render the tween
        
        WARNING, this script do not check that (0 < progress < 1). YOU SHOULD MANUALLY CLAMP progress LIKE: clamp(progress, 0, 1); 
        It is like this for optimization purposes 
        
   TODO: replace merge_colour with a faster function. 
   
*/


//Comment this line if it gives you an error. This line is to give a SPEED BOOST of the main rendering loop of the tweenline engine. 
gml_pragma("forceinline");


var t = argument0[TLTWEEN.SETTERS_TARGET];
if (instance_exists(t)) {

    // If the values are not captured, capture it!
    if (argument0[TLTWEEN.FIRSTRENDER]) { __tl_private_setters_capture(argument0); }
    
    
    // RECALCULTE THE VALUE (THIS IS THE MOST IMPORTANT PART OF THE ENGINE) [!] 
    if (argument0[@ TLTWEEN.USEMODIFIERS]) {
        var value = script_execute_ext(argument0[TLTWEEN.EASE],argument0[TLTWEEN.M]);  // The M array is really array(EASE, M1, M2, M3... ); 
    } else {
        var value = script_execute(argument0[TLTWEEN.EASE],argument1);  
    }


    var s = argument0[TLTWEEN.SETTERS_NUMB];
    if(s>0) {
        var a = argument0[TLTWEEN.SETTERS];
        with(t) {
            for (var i=0; i<s; i++) { 
                if (a[i,TLSETTER.IS_COLOR]) {
                    script_execute(a[i,TLSETTER.SETTER],merge_colour(a[i,TLSETTER.MIN],a[i,TLSETTER.MAX],value)); 
                } else {
                    script_execute(a[i,TLSETTER.SETTER],a[i,TLSETTER.MIN]+value*a[i,TLSETTER.DELTA]); 
                }
                
            }
        }
        
    }
    
    var s = argument0[TLTWEEN.CUSTOM_VARS_NUMB];
    if(s>0) {
        var a = argument0[TLTWEEN.CUSTOM_VARS];
        for (var i=0; i<s; i++) {
            if (a[i,TLSETTER.IS_COLOR]) {
                cv_set(t, a[i,TLSETTER.SETTER],merge_colour(a[i,TLSETTER.MIN],a[i,TLSETTER.MAX],value)); 
            } else {
                cv_set(t, a[i,TLSETTER.SETTER],a[i,TLSETTER.MIN]+value*a[i,TLSETTER.DELTA]); 
            }
        }
    }

} else if (argument0[TLTWEEN.AUTOCLEAN]) {  // If the instance does not exists and the tween is setted as autoclean tween
    tween_destroy(argument0);
}

#define __tl_private_timeline_back_to_the_future
/// __tl_private_timeline_back_to_the_future(tweenline,fromtime, totime);
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 
        Back to the future (the movie)
        
   TODO: optimize this script. :) 
   
*/

var tweenline = argument0, fromtime = argument1, totime = argument2;

if (fromtime==totime) {return false;}

// PHASE 1: SIMULATE FUTURE VALUES!! 
// We need to travel from "fromtime" to "totime". (fromtime < tottime)
if (fromtime<totime) {
    var size = tweenline_get_size(tweenline);
    var list = tweenline_get_list(tweenline);
    var prior_start = ds_priority_create(); //YEAH! Priority queues are usefull for something!! 
    var last_time_rendered = fromtime;
    var cache_tween, cache_target;
    for(var i=0; i<size; i++) { 
        var tween = ds_list_find_value(list, i); // get tween i
        cache_tween[i] = tween;
        cache_target[i] = tween_get_target(tween);

        //adds into those priority queues the start values of the tween which are (totime >= tween_get_starttime >= fromtime)
        // If the tween values are not captured yet

        if (tween[ TLTWEEN.FIRSTRENDER]) {
            var starttime= tween_get_starttime(tween);
            if (starttime>=fromtime && starttime<=totime) {
                ds_priority_add(prior_start, tween, starttime);
            }
        }
    }
    
    
    // For each tween that need to capture setters
    while (!ds_priority_empty(prior_start)) {
        var tween = ds_priority_delete_min(prior_start);
        
        
        //Process Tween:
        
        // if the values has not been captured, capture them (catch 'em all!)
        // https://www.youtube.com/watch?v=qyXTgqJtoGM
        // To capture tween values, we need to ensure that all the values corresponding to that target at that time are correct. 
        // So, we need to render the values of the tweens with the same target of our current tween.
        // First, we are going to check that the moment (time) we are going to render it's not the same that the last time rendered.
        var time_start= tween_get_starttime(tween);
        if (last_time_rendered != time_start) {
            last_time_rendered = time_start;
            
            //Then, for each tween in the tweenline, 
            var tween_to_process_target = tween_get_target(tween);
            for (var i=0; i<size; i++) {
                // we are going to check if the target is the same target of our current tween (And it's not the same tween)
                if (cache_target[i]==tween_to_process_target) {
                    var ttt = cache_tween[i];
                    if (ttt[TLTWEEN.ID]!=tween[TLTWEEN.ID] && ttt[TLTWEEN.INITIALDELAY]<=totime) {
                        //And then, render the tween in the current time
                        ttt[@ TLTWEEN.TIME]=time_start;
                        tween_render(ttt);
                    }
                }
            }
        }
        // If we pass this point, then the values are correctly setted. So It's safe to capture the values.
        __tl_private_setters_capture(tween);
            
    
    }
    
    ds_priority_destroy(prior_start);
}


/// PHASE 2!!!! RENDER ALL TWEENS between fromtime and totime in order of aparision
var list = tweenline_get_list(tweenline);
var size = ds_list_size(list); 
if (totime-fromtime>0) {
    for (var i=0; i<size; i++) {// foreach tween in order of starttime
        var tween = ds_list_find_value(list,i); // get tween 
        var starttime = tween_get_starttime(tween);
        var endtime = tween_get_endtime(tween);
        if (endtime<=totime && endtime>fromtime) {
            tween[@ TLTWEEN.TIME] = endtime;
            tween_render(tween); // RENDER The tween at the "totime" time
        }
    }
} else {
    for (var i=size-1; i>=0; i--) {// foreach tween in reverse order of starttime
        var tween = ds_list_find_value(list,i); // get tween 
        var starttime = tween_get_starttime(tween);
        var endtime = tween_get_endtime(tween);
        if (starttime<fromtime && starttime>totime) {
            tween[@ TLTWEEN.TIME] = starttime;
            tween_render(tween); // RENDER The tween at the "totime" time
        }
    }

}



// PHASE 3!!! RENDER THE TWEENS!! 
// Well, our objective now is to render those tweens in the final "totime" time.
var list2 = tweenline_get_tweens_at_time( tweenline, totime, true);
var size2 = ds_list_size(list2);

for (var i=0; i<size2; i++) {// foreach tween in order of starttime
    var tween = ds_list_find_value(list2,i); // get tween 
    tween[@ TLTWEEN.TIME] = totime;
    tween_render(tween); // RENDER The tween at the "totime" time
}
ds_list_destroy(list2);

for (var i=0; i<size; i++) {
    var tween = ds_list_find_value(list,i); // get tween 
    tween[@ TLTWEEN.TIME] = totime;
}
ds_list_destroy(list);

tweenline[@ TLTIMELINE.TIME] = totime;