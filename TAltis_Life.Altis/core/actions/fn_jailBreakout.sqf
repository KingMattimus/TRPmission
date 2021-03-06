#include <macro.h>
/* 
	File: fn_jailBreakout.sqf
*/
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _unit) exitWith {};
if(!alive player) exitWith {};
if(playerSide != civilian) exitWith {hint "Only civilians can do this!";};
if(vehicle player != player) exitWith {hint "You need to be outside of your vehicle!";};
if(currentWeapon player == "" || currentWeapon player == "Binocular") exitWith {hint "The guards do not feel threatened in any way!";};
if({side _x == west} count playableUnits < 2) exitWith {hint "There needs to be two or more cops online for you to initiate a robbery!";}; // Spectral does not want a limit on when to jailbreak
if(_unit getVariable["inbreakout",false]) exitWith {hint "Someone is already breaking out the prisoners!";};
if(time - (_unit getVariable["lastbreakout",-9000]) < 30*60) exitWith {hint "The jail is currently under lockdown and you are unable to get near to the walls."};

_unit setVariable["lastbreakout",time,true];
_unit setVariable["inbreakout",true,true];

 //Give the cops a hint
  [0,"%1 is attempting to break prisoners out of the jail! Go and stop them fast!",true,[]] remoteExecCall ["life_fnc_broadcast",west];
  hint "You are currently hacking the prison gates, you need to stay within 1000 meters of your current location or you will stop the breakout. The breakout will take around four minutes to complete.";

[[_unit,player],"life_fnc_breakoutTimer",group player, false] spawn life_fnc_MP; //Show the countdown to all prisoners, cops and the player.
[[_unit,player],"life_fnc_breakoutTimer",west, false] spawn life_fnc_MP;


// Charge all the players in the group with doing a jailbreak
{
	if (EQUAL(group _x,group player)) then {
		        if (life_HC_isActive) then {
            [getPlayerUID player,profileName,"26"] remoteExecCall ["HC_fnc_wantedAdd",HC_Life];
        } else {
            [getPlayerUID player,profileName,"26"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
        };
	};
} foreach playableUnits;


/*
//Alarm Bell
_unit spawn {
	for "_i" from 0 to 20 do {
		[[_this, "jailbreak",1000],"life_fnc_playSound",true,false] spawn life_fnc_MP;	
		sleep 2.087;
	};
};

*/

_time = time + (12 * 60);

jailDefused = false;


_ok = true;
while {true} do {
	if(round(_time - time) < 1) exitWith {_ok = true;};
	if (jailDefused) exitWith {_ok = false;};
	if(!alive player) exitWith {_ok = false;};
	if(player distance _unit > 2500) exitWith {_ok = false;};
	if(life_isDowned) exitWith {_ok = false;};
	if(player getVariable["restrained",false]) exitWith {_ok = false;};
	sleep 1;
};
_unit setVariable["inbreakout",false,true]; 

if(_ok) then {
	[[profileName],"life_fnc_jailBreakoutCompleted",true,false] spawn life_fnc_MP;
	
} else {
	hint "You failed to break out any prisoners.";	
	};