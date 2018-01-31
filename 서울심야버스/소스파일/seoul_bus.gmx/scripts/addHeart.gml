global.heartCnt += argument0;





var _x = argument1;
if( _x <= 0)
{
    _x = 20;
}

var _tt = noone;
if( argument0>=0)
     _tt = instance_create( _x,argument2-20, o_heart);
else
     _tt = instance_create( _x,argument2-20, o_heartred);
     

with(_tt)
{
    if( argument0 > 0)
    {
        color = c_white;
        
        audio_play_sound(snd_heartup, 1, false);
    }
    else
    {
        color = c_white; //c_black;
    }
    
    text = string(argument0);
}
    
if( global.heartCnt <= 0)
{
    room_goto_transition(r_gameover, transition.fade ,30 );
}

