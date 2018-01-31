var _val = argument0;

if( _val == true)
{
    with( o_uibox_char)
    {
        msg_reset();
        visible = true;
        faceid = s_who_man1;
        sceneName = 'say.ini';
        global.sayidx = 1;
        saystate = false;
       var _idx = irandom_range( global.curStation+1, ds_list_size( global.listStation ) -1);
        
       randomize();
        var _tt=    choose( 0,1,2,3,4,5,6,7);
            
        
        // 가짜 역 이름 나옴.
        if( _tt <= 2)
        {
             stationName =    getFakeStationName();
            global.goalStationName = stationName;
            
            
            global.existStation = 0;
        }
        else if( _tt == 3) // 반대로 타야하는 역 이름.
        {
            if( global.curStation >=1)
            {
                    _idx = irandom_range(  0 , global.curStation -1 );
           
                    stationName =    getStationName( _idx );
                    global.goalStationName = stationName;
            
                     global.existStation = 2;
            }
             else
             {
                
                    stationName = getStationName(_idx);
                    global.goalStationName = stationName;
                    
                    global.existStation = 1;
             
             }
        }
        else // 앞으로 나올 역이름.
        {
        
            stationName = getStationName(_idx);
            global.goalStationName = stationName;
            
            global.existStation = 1;
            
        }
       
        
    }
    
    var _a = noone;
    
    _a =instance_create( 70,242, o_bt_select_station );
    with( _a)
    {
        action  = 'go';;
    }
    
    
     _a = instance_create( 160,242, o_bt_select_station );
     with(_a)
     {
        action = 'dontgo';
     }
     
     _a = instance_create( 250,242, o_bt_select_station );
     with( _a)
     {
        action = 'reverse';
     }
    
    
    instance_create(  0 ,0, o_mapWindow2);
    
}
else
{
     global.clicked = false;
     
    with(o_bt_select_station)
    {
        instance_destroy();
    }
    
    with(o_uibox_char)
    {
        visible = false;//();
    }
    
    with( o_mapWindow2)
    {
        instance_destroy();
    }
}


