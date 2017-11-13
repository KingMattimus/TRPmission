#include "..\..\script_macros.hpp"
/* 
	File: fn_jailBreakout.sqf
*/
private["_adoor1","_adoor2","_adoor3","_adoor4"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_adoor1 = nearestObject [[20900.7,19212.5,0.001441],"Land_BackAlley_01_l_gate_F"];
_adoor2 = nearestObject [[20903.4,19206.6,0.00144291],"Land_BackAlley_01_l_gate_F"];
_adoor3 = nearestObject [[20907,19221.8,0.00143909],"Land_BackAlley_01_l_gate_F"];
_adoor4 = nearestObject [[20904.3,19217.5,0.00143909],"Land_BackAlley_01_l_gate_F"];

if(isNull _unit) exitWith {};
if(!alive player) exitWith {};
if(playerSide != civilian) exitWith {hint "Only civilians can do this!";};
if(vehicle player != player) exitWith {hint "You need to be outside of your vehicle!";};
if(currentWeapon player == "" || currentWeapon player == "Binocular") exitWith {hint "The guards do not feel threatened in any way!";};
//if({side _x == west} count playableUnits < 2) exitWith {hint "There needs to be two or more cops online for you to initiate a robbery!";}; // Spectral does not want a limit on when to jailbreak
if(_unit getVariable["inarmory",false]) exitWith {hint "Someone is already breaking out the prisoners!";};
if(time - (_unit getVariable["lastarmory",-9000]) < 30*60) exitWith {hint "The Armory is currently under lockdown and you are unable to get near to the walls."};

_unit setVariable["lastarmory",time,true];
_unit setVariable["inarmory",true,true];

//Give the cops a hint
[0,"%1 is attempting to break into the armory! Go and stop them fast!",true,[]] remoteExecCall ["life_fnc_broadcast",west];
hint "You are currently hacking the prison gates, you need to stay within 1000 meters of your current location or you will stop the breakout. The breakout will take around four minutes to complete.";
[0,"STR_ISTR_AlertArm",true,[]] remoteExecCall ["life_fnc_broadcast",west];
[0,"STR_ISTR_AlertArm",true,[]] remoteExecCall ["life_fnc_broadcast",civilian];
[0,"STR_ISTR_AlertArm",true,[]] remoteExecCall ["life_fnc_broadcast",independent];
[] remoteExec ["life_fnc_demoChargeTimer",[west,player]];

// Charge all the players in the group with doing a jailbreak
/*{
	if (EQUAL(group _x,group player)) then {
		        if (life_HC_isActive) then {
            [getPlayerUID player,profileName,"26"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
        } else {
            [getPlayerUID player,profileName,"26"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
        };
	};
} foreach playableUnits; */


/*
//Alarm Bell
_unit spawn {
	for "_i" from 0 to 20 do {
		[[_this, "jailbreak",1000],"life_fnc_playSound",true,false] spawn life_fnc_MP;	
		sleep 2.087;
	};
};

*/

_time = time + (1 * 60);

armoryDefused = false;

_ok = true;
while {true} do {
	if(round(_time - time) < 1) exitWith {_ok = true;};
	if (armoryDefused) exitWith {_ok = false;};
	sleep 1;
};


_unit setVariable["inarmory",false,true]; 

if(_ok) then {
	hint "The prisoners have been released";
	[] spawn life_fnc_unlockarmory;
	//unlock jail here 
} else {
	hint "You failed to break into the armory.";	
	};