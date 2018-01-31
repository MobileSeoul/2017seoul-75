var ininame = argument0;
var search = argument1;

switch( global.language)
{
    case 0: var lang = "english"; break;
    case 1: var lang = "korean"; break;
    default : var lang = "english"; break;
}



ini_open(ininame);

var findstr = ini_read_string( lang, string(search), "No String Found!");



ini_close();

findstr = string_replace_all( findstr, "*" , "#");

findstr = string_replace_all( findstr, "@station",  global.goalStationName );




return findstr;
