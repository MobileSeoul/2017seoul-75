var _state = argument0;



if( _state == true)
{
    with( o_front_door)
    {
        if( openState == false)
            event_user(0);
        
    }

    
}
else
{

    with( o_front_door)
    {
        if( openState == true)
            event_user(1);
        
    }
    
    
}

