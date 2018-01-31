var _maxlv = array_length_1d( global.arrNeedLight );

if( global.lvPassengerSpeed >= _maxlv )
{
    exit;
}

var _needmoney = getNeedUpgrade(global.lvPassengerSpeed);

if( global.lightCnt >= _needmoney )
{
     audio_play_sound( snd_heartup, 1, false);
    global.lightCnt -= _needmoney;
    
    global.lvPassengerSpeed += 1;
    save_local();
    
}
else
{
    audio_play_sound( snd_fail, 1, false);
}
