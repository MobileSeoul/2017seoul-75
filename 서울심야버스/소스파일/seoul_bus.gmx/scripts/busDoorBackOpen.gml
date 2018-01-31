var _state = argument0;

show_debug_message("busDoorBackOpen:"+ string(_state) );


if( _state == true)
{
  
    
    
    with( o_back_door)
    {
        if( openState == false)
            event_user(0);
    }
    
}
else
{

  
    
    
    with( o_back_door)
    {
        if( openState == true)
            event_user(1);
    }
    
}

