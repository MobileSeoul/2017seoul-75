///뒷문 나와서 걷가가 역옆으로 사라짐.
if(state_new)
{

    show_debug_message("pb_state_walk");
    // path_start(path_walk_people, 1, path_action_stop, false);
    
   // path_position = 0;
   
   
   
      alarm[0] = room_speed*5;
   
   
   
}


with( o_station_front)
{
    other.goalx =     x + 70;
}

x = Approach( x, goalx, 1); 

x -= global.busSpeed;

if( floor( x ) == floor(goalx ) )
{
    state_switch( "Destroy");
}


