if(state_new)
{
   
     //path_start(path_out_people, 1, path_action_stop, false);
    
    //path_position = 0;
}


with( o_station_front)
{
    other.goalx =     x + 70;
}

//show_debug_message("state destroy:" + string( goalx) );
x = goalx; //Approach( x, goalx, 20); 
y += 1;

if( y >= ystart + 80)
{

    show_debug_message("people destroy : pb_state_destroy");
   instance_destroy();   
}
