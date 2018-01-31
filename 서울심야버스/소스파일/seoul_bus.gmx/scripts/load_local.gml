
var file = "save1.ini";

if file_exists(file){

    // Open the file for reading
    ini_open(file);

   
    //load here.
    //global.selectStage = ini_read_string( "map" ,"selectStage" , 'tower1');
    
    global.lightCnt =  ini_read_real( "game" ,"lightCnt" ,0 );
    

    global.lvPassengerSpeed = ini_read_real( "game" ,"lvPassengerSpeed" ,0  );
    global.lvFrontDist  =ini_read_real( "game" ,"lvFrontDist" ,0 );
    global.lvPassengerCnt  =ini_read_real( "game" ,"lvPassengerCnt" ,0  );
    global.lvLightCnt = ini_read_real( "game" ,"lvLightCnt" , 0 );

    // Close the file to prevent memory leaks
    ini_close();


} else {

    // If the file does not exist, set the variables to prevent unknown
    // variable errors
    
    ini_open(file);
    
    
    save_local();//(file);
    

    ini_close();
    
}
