global.curStation += 1;
global.nextStation = global.curStation+1;
global.prevStation = global.curStation-1;




var _stationName = '';


 _stationName = ds_list_find_value( global.listStation , global.curStation);
 
 if( _stationName == undefined)
 {
    _stationName = "ending";
      return _stationName;
 }
 else
     return _stationName;
//_stationName = listStation[| global.curStation];
