/// __tl_private_parse_object_to_instance( obj_or_inst); 
/*

    THIS FUNCTION IS PRIVATE, SO DO NOT USE IT!!! 

   __________

THIS COMMENTS ARE FOR MY (I'm the tweenline developer) USE ONLY. SO DON'T USE THIS FUNCTION!!    
       
   Description: 

        
        
*/


var a = argument0;
if (is_array(a)) {
    var size = array_length_1d(a); // arr is the tweens indexes array
} else if (is_real(a)){
    if (object_exists(a)) {
        for (var i=0, size=instance_number(a), obj=a; i<size; i++;) {
            a[i] = instance_find(obj, i);
        }
    } else {
        __tl_private_error(undefined, "Stagger error: target objects does not exists");
        return noone;
    }
} else {
    __tl_private_error(undefined, "stagger error: target object is non real: "+string(a));
    return noone;
}
return a;
