if(state_new)
{
    goalalpha = 0;
    
   // draw_set_colour( c_red);
   color = c_red;
}

 
x = Approach( x, goalx, 1);
x -= global.busSpeed;

image_alpha = Approach( image_alpha, goalalpha, 0.07);


if( image_alpha <= 0)
{
    instance_destroy();
    
    addHeart(-1,x,y);
    //global.heartCnt -=1;
   
    
    
    
}

