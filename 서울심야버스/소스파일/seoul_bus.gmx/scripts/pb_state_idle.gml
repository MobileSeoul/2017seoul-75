if(state_new)
{
   depth = -3;
}


var _coll = false;
with( o_bus)
{
   _coll =  collStation;
}


with( o_station_front)
{
    //other.goalx =     x + 70;
    
    other.x = x ;
}

//show_debug_message("state_idle destroy:" + string( goalx) );
//x = goalx; //Approach( x, goalx, 20); 
//y += 1;


if( _coll == true)
{
    if( global.busSpeed <= 0)
    {
        state_switch("In");
    
    }
}
