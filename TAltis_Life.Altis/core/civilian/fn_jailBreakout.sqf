#include "..\..\script_macros.hpp"
/* 
	File: fn_jailBreakout.sqf
*/
private["_pdoor1","_pdoor2","_pdoor3","_pdoor4"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_pdoor1 = nearestObject [[19380.8,14315.6,0.00146675],"Land_BackAlley_01_l_gate_F"];
_pdoor2 = nearestObject [[19380.6,14315.5,0.00141144],"Land_BackAlley_01_l_gate_F"];
_pdoor3 = nearestObject [[19405,14288.3,0.00144005],"Land_BackAlley_01_l_gate_F"];
_pdoor4 = nearestObject [[19405.3,14293.5,0.00141716],"Land_BackAlley_01_l_gate_F"];

if(isNull _unit) exitWith {};
if(!alive player) exitWith {};
if(playerSide != civilian) exitWith {hint "Only civilians can do this!";};
if(vehicle player != player) exitWith {hint "You need to be outside of your vehicle!";};
if(currentWeapon player == "" || currentWeapon player == "Binocular") exitWith {hint "The guards do not feel threatened in any way!";};
//if({side _x == west} count playableUnits < 2) exitWith {hint "There needs to be two or more cops online for you to initiate a robbery!";}; // Spectral does not want a limit on when to jailbreak
if(_unit getVariable["inbreakout",false]) exitWith {hint "Someone is already breaking out the prisoners!";};
if(time - (_unit getVariable["lastbreakout",-9000]) < 30*60) exitWith {hint "The jail is currently under lockdown and you are unable to get near to the walls."};

_unit setVariable["lastbreakout",time,true];
_unit setVariable["inbreakout",true,true];

//Give the cops a hint
[0,"%1 is attempting to break prisoners out of the jail! Go and stop them fast!",true,[]] remoteExecCall ["life_fnc_broadcast",west];
hint "You are currently hacking the prison gates, you need to stay within 1000 meters of your current location or you will stop the breakout. The breakout will take around four minutes to complete.";
[0,"STR_ISTR_AlertJail",true,[]] remoteExecCall ["life_fnc_broadcast",west];
[0,"STR_ISTR_AlertJail",true,[]] remoteExecCall ["life_fnc_broadcast",civilian];
[0,"STR_ISTR_AlertJail",true,[]] remoteExecCall ["life_fnc_broadcast",independent];
[] remoteExec ["life_fnc_demoChargeTimer",[west,player]];


_time = time + (1 * 60);

jailDefused = false;

_ok = true;
[] spawn {
	while {true} do {
		hint "tick tock.";
		if(round(_time - time) < 1) exitWith {_ok = true;};
		if (!life_is_alive) exitWith {_ok = false;};
		if (life_istazed) exitWith {_ok = false;}; //Tazed
		if (life_isknocked) exitWith {_ok = false;}; //Knocked
		sleep 1;
	};
};
_unit setVariable["inbreakout",false,true]; 

if(_ok) then {
	hint "The prisoners have been released";
	[] spawm life_fnc_jailBreakoutCompleted;
	[] spawn life_fnc_unlockJail;
	//unlock jail here 
} else {
	hint "You failed to break out any prisoners.";	
	};