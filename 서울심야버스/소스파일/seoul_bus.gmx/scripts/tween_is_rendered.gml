/// tween_is_rendered(tween)
/*

WARNING: This is an advanced function. 

Returns true if a tween will be rendered (updated).

A tween or tweenline can exists but not be inside the Tweenline Engine render list. 
If a tween or tweenline is not in the renderlist, the tween will not be updated. 
It only ucurrs if the tween is deleted from the renderlist by the garbage collector.

*/

return argument0[TLTWEEN.INRENDERLIST];

