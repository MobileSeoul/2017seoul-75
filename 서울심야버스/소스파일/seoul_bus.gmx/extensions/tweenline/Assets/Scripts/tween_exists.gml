/// tween_exists(index)
/*
    Returns true if a tween exists and false otherwise.

    WARNING: (For advanced users) A tween or tweenline can exists but not be inside the Tweenline Engine render list. 
    Use tween_is_rendered(tween) and tweenline_is_rendered(tween) to get if a tween/tweenline will be rendered (updated). 

    Example:
        var exists = tween_exists(mytween);
*/
if (is_array(argument0)){
    if (argument0[TLTWEEN.TYPE] == TLTYPE.TWEEN) {
        return true;
    }
}
return false;
