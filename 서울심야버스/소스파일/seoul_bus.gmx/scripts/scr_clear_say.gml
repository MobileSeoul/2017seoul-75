var stagelv = argument0;
var search = argument1;

var stagelv2 = '';
switch( stagelv)
{
    case r_ingame:  stagelv2 = "stage1"; break;
    case r_ingame2:  stagelv2 = "stage2"; break;
     case r_ingame3:  stagelv2 = "stage3"; break;
      case r_ingame4:  stagelv2 = "stage4"; break;
       case r_ingame5:  stagelv2 = "stage5"; break;
        case r_ingame6:  stagelv2 = "stage6"; break;
         case r_ingame7:  stagelv2 = "stage7"; break;
          case r_ingame8:  stagelv2 = "stage8"; break;
    default :  stagelv2 = "stage2"; break;
}




ini_open("say_clear.ini");

var findstr = ini_read_string( stagelv2, string(search), "No String Found!");




ini_close();

findstr = string_replace_all( findstr, "*" , "#");


return findstr;
