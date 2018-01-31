if(state_new)
{
    depth  = -3;
   goalx = 228;
   
   alarm[0] = room_speed*4;
}

 
x = Approach( x, goalx, 1 + (0.1 * global.lvPassengerSpeed ) );

x -= global.busSpeed;

if( floor(x) == floor( goalx) )
{
    state_switch("InDoor");

    
}
