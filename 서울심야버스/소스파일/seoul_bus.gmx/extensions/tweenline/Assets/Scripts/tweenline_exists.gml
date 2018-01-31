/// tweenline_exists(tweenline)
/*
Returns true if a tweenline exists and false otherwise.

WARNING: (For advanced users) A tween or tweenline can exists but not be inside the Tweenline Engine render list. 
Use tween_is_rendered(tween) and tweenline_is_rendered(tween) to get if a tween/tweenline will be rendered (updated). 


EXAMPLE: 
if (tweenline_exists(tweenline)) {
    tweenline_play(tweenline);
}


*/
if (is_array(argument0)){
    if (argument0[TLTWEEN.TYPE] == TLTYPE.TIMELINE) {
        return true;
    }
}
return false;
