
       global.clear = true;
       
       with( o_char_info)
        {
            
            
             audio_play_sound( snd_cut, 0, false);
            audio_play_sound( snd_bombclear, 1, false);
            
           
            clearstate = true;
            saystate = false;
            global.sayidx = 1;
           //clearmessage = "오호~ 해체 솜씨가 장난 아닌데?"
           
        }
        
        /*
        with( o_globalinit)
        {
            alarm[0] = room_speed*3.5;
        }
        */
