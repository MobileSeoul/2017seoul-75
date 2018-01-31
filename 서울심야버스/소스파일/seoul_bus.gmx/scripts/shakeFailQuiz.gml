var _tt = argument0;
var _tt2 = argument1;

var shakeyArr = array(_tt,0,0, -_tt , 0,0, _tt2,0,0, -_tt2,0,0);
var shakeArrLen = array_length_1d( shakeyArr);

y += shakeyArr[shakeidx2];

shakeidx2+=1;


if( shakeidx2 >= shakeArrLen)
{
    shakeidx2 = 0;
    shakestate = false;
}   

