/// save_game_ini(file)


var file = '';

// Choose a file depending on the argument supplied
file = "save1.ini";


// Open the file for reading
ini_open(file);


show_debug_message("save_game_ini ......");

 ini_write_real( "game" ,"lightCnt" ,global.lightCnt  );
  ini_write_real( "game" ,"lvPassengerSpeed" ,global.lvPassengerSpeed  );
   ini_write_real( "game" ,"lvFrontDist" ,global.lvFrontDist  );
    ini_write_real( "game" ,"lvPassengerCnt" ,global.lvPassengerCnt  );
     ini_write_real( "game" ,"lvLightCnt" ,global.lvLightCnt  );

// Close the file to prevent memory leaks
ini_close();
