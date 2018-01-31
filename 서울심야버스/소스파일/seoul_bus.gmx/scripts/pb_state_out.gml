if(state_new)
{
   
    show_debug_message("pb_State_out: ");
    path_start(path_out_people, 1, path_action_stop, false);
    
    path_position = 0;
    
  
    chatitem = instance_create( x,y, o_chatitem );
}

if( path_position >= 0.2)
{
    depth = -3;
}


if( path_position >= 1)
{
    state_switch("Walk");    
}
