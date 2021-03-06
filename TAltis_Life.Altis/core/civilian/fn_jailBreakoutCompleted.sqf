#include "..\..\script_macros.hpp"

/*
	File: fn_jailBreakoutCompleted.sqf
*/
hint "jail breakout fired";
if(isDedicated) exitWith {};
hint "isdedicated";
if(!life_is_arrested) exitWith {}; //We dont need to be broken out, as we are not in jail!
hint "variable is not getting set.";
_action = [
	format["%1 has broken into the jail from the outside, escape now?",_this select 0],
	"Breakout",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	hint "You decided to run for it!";
	life_escape = true;
	life_arrested = false;
	
} else {
	hint "You decided to serve your time.";
	life_escape = false;
};
sleep 5;
life_escape = false;