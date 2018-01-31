var idx = argument0;

if( (device_mouse_x_to_gui(idx) >    gui_x-sprite_width/2 && device_mouse_x_to_gui(idx) <gui_x + sprite_width/2 ) &&

    ( device_mouse_y_to_gui(idx) >  gui_y-sprite_height/2 && device_mouse_y_to_gui(idx) < gui_y + sprite_height/2)   )
{

return true;
}
else
{

return false;
}



