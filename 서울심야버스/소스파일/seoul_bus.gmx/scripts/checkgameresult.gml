var _input = argument0;


//stage 1.
if( room == r_ingame)
{
    //정답.
    if( 'yellow' == _input)
    {
       
        
        clicked = true;
        
        gameclear();
    
    }
    else if ( _input == "stay")//오답.
    {
        clicked = true ;
    }
}
else if( room == r_ingame2)
{
    if( 'yellow' == _input)
    {
       
         audio_play_sound( snd_cut, 0, false);
        clicked = true;
        
   
        
        gameover();
    
    }
    else if ( _input == "stay")//오답.
    {
        clicked = true ;
    }
}
else if(room == r_ingame3) //빨간색을 자르면 클리어.
{
    if( 'red' == _input)
    {
        clicked = true;
        
        gameclear();
    
    }
    else if ( _input == "stay")//오답.
    {
        clicked = true ;
    }
    else
    {
        gameover();
    }
}
else if ( room == r_ingame4)
{
    if( 'blue' == _input)
    {
        clicked = true;
        
        //gameclear();
        
        ds_map_replace(  global.map_click , _input , 1);
    }
    else if( "yellow" == _input)
    {
        clicked = true;
        
        //gameclear();
        
        ds_map_replace(  global.map_click , _input , 1);
    }
    else if ( _input == "stay")//오답.
    {
        clicked = true ;
    }
    else
    {
        gameover();
    }
    
     if( ds_map_find_value(global.map_click , "yellow") == 1 &&
        ds_map_find_value( global.map_click, "blue") == 1)
        {
            gameclear();
        }
}
else if(  room == r_ingame5)
{
    if( 'blue' == _input)
    {
        clicked = true;
        
        //gameclear();
        
        ds_map_replace(  global.map_click , _input , 1);
        
         if( ds_map_find_value( global.map_click, "red") == 1)
        {
            gameover();
        }
    }
    else if( "red" == _input)
    {
    
        clicked = true;
        
         ds_map_replace(  global.map_click , _input , 1);
         
         
        if( ds_map_find_value( global.map_click, "blue") == 1)
        {
            gameclear();
        }

        //gameclear();
        
       
    }
    else if ( _input == "stay")//오답.
    {
        clicked = true ;
    }
    else
    {
        gameover();
    }
}
else if(  room == r_ingame6)
{
    
    if( 'blue' == _input)
    {
        clicked = true;
        
        //gameclear();
        
        ds_map_replace(  global.map_click , _input , 1);
        
       
    }
    else if( "green" == _input)
    {
        clicked = true;
        
         ds_map_replace(  global.map_click , _input , 1);
         
         
          if( ds_map_find_value( global.map_click, "blue") == 1 )
        {
            //   gameclear();
        }
        else
        {
            gameover();
        }
        
    }
    else if( "red" == _input)
    {
    
        clicked = true;
        
         ds_map_replace(  global.map_click , _input , 1);
         
         
        if( ds_map_find_value( global.map_click, "blue") == 1 &&
            ds_map_find_value( global.map_click, "green")== 1 )
        {
            gameclear();
        }
        else
        {
            gameover();
        }
        

        //gameclear();
        
       
    }
    else if ( _input == "stay")//오답.
    {
        clicked = true ;
    }
    else
    {
        gameover();
    }


}
else if(  room == r_ingame7)
{
    
    if( 'yellow' == _input)
    {
         clicked = true;
    
         if( global.timerstop == true)
             ds_map_replace(  global.map_click , _input , 1);
         else
            gameover();
         
         
    }
    else if( 'blue' == _input)
    {
        clicked = true;
        
        //gameclear();
        
        if( global.timerstop== true)
        {
            ds_map_replace(  global.map_click , _input , 1);
            global.timerstop = false;    
            
              with(o_secbar)
            {
                event_user(0);
            }
        }
        
       
    }
    else if( "green" == _input)
    {
        clicked = true;
        
         ds_map_replace(  global.map_click , _input , 1);
         
        
        gameover();
        
        
    }
    else if( "red" == _input)
    {
    
        clicked = true;
        
        
        if( global.timerstop == false)
        {
             ds_map_replace(  global.map_click , _input , 1);
            global.timerstop = true;
            
          
            
         }
         
         
        
        //gameclear();
       
    }
    else if ( _input == "stay")//오답.
    {
        clicked = true ;
    }
    else
    {
        gameover();
    }
}
else if(  room == r_ingame8)
{
    
    if( 'yellow' == _input)
    {
         clicked = true;
    
          if( ds_map_find_value( global.map_click, "blue") == 1 )
        {
             ds_map_replace(  global.map_click , _input , 1);
            gameclear();
        }
        else
        {
           gameover();
        }
         
         
    }
    else if( 'blue' == _input)
    {
        clicked = true;

        if( ds_map_find_value( global.map_click, "yellow") == 1 )
        {
        
            gameover();
        }
        else
        {
           ds_map_replace(  global.map_click , _input , 1);
        }
        
       
    }
    else if( "green" == _input)
    {
        clicked = true;
        
           if( ds_map_find_value( global.map_click, "blue") == 1 )
        {
           //  ds_map_replace(  global.map_click , _input , 1);
           // gameclear();
           
           
           
            gameover();
        }
        else
        {
            ds_map_replace(  global.map_click , _input , 1);
        }
        
        
    }
    else if( "red" == _input)
    {
    
        clicked = true;
        
        
        if( ds_map_find_value( global.map_click, "green") == 1 )
        {
             ds_map_replace(  global.map_click , _input , 1);
           // gameclear();
        }
        else
        {
            gameover();
        }
         
        
        //gameclear();
       
    }
    else if ( _input == "stay")//오답.
    {
        clicked = true ;
    }
    else
    {
        gameover();
    }
}
