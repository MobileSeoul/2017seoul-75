if(state_new)
{
   //goalx = 228;
   
   path_start( path_indoor_people, 1, path_action_stop, false);
   path_position = 0;
   
}

image_alpha = Approach( image_alpha, goalalpha, 0.07);

if( path_position > 0.8)
{
    depth = -1;
}

if( path_position >= 1.0)
{
    goalalpha = 0;
}


if( image_alpha <= 0)
{
 
     global.businpeople += irandom_range(1, 1 +  global.lvPassengerCnt  ) ;
     
    addHeart( 2 ,x,y);
    
    show_bus_quiz(true);
    
    instance_destroy();
    
}

