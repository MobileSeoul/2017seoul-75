var _maxlv = array_length_1d( global.arrNeedLight );

if( global.lvPassengerCnt >= _maxlv )
{
    exit;
}


var _needmoney = getNeedUpgrade(global.lvPassengerCnt);

if( global.lightCnt >= _needmoney )
{
     audio_play_sound( snd_heartup, 1, false);
    global.lightCnt -= _needmoney;
    
    global.lvPassengerCnt +=1;
    
    save_local();
}
else
{
    audio_play_sound( snd_fail, 1, false);
}

