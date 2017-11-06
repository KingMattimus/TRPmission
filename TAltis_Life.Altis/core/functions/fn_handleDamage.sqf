#include "..\..\script_macros.hpp"
/*
    File: fn_handleDamage.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_part","",[""]],
    ["_damage",0,[0]],
    ["_source",objNull,[objNull]],
    ["_projectile","",[""]],
    ["_index",0,[0]]
];
private["_curWep"];
_curWep = "";
/*
//Handle the tazer first (Top-Priority).
if (!isNull _source) then {
    if (_source != _unit) then {
        if (currentWeapon _source in ["hgun_P07_snds_F","arifle_SDAR_F"] && _projectile in ["B_9x21_Ball","B_556x45_dual"]) then {
            if (side _source isEqualTo west && playerSide isEqualTo civilian) then {
                _damage = 0;
                if (alive player && !life_istazed && !life_isknocked && !(_unit getVariable ["restrained",false])) then {
                    private ["_distance"];
                    _distance = 35;
                    if (_projectile == "B_556x45_dual") then {_distance = 100;};
                    if (_unit distance _source < _distance) then {
                        if !(isNull objectParent player) then {
                            if (typeOf (vehicle player) == "B_Quadbike_01_F") then {
                                player action ["Eject",vehicle player];
                                [_unit,_source] spawn life_fnc_tazed;
                            };
                        } else {
                            [_unit,_source] spawn life_fnc_tazed;
                        };
                    };
                };
            };

            //Temp fix for super tasers on cops.
            if (side _source isEqualTo west && (playerSide isEqualTo west || playerSide isEqualTo independent)) then {
                _damage = 0;
            };
        };
    };
};
*/

if(isPlayer _source && _source isKindOf "Man") then {
	_curWep = currentWeapon _source;
	_curMag = currentMagazine _source;
};

if((_curWep in ["srifle_DMR_06_olive_F","srifle_DMR_03_F","arifle_MXM_Black_F","arifle_MX_Black_F","arifle_MXC_Black_F","srifle_DMR_02_F","arifle_sdar_F","arifle_SPAR_03_blk_F","arifle_AK12_GL_F"]) && (_source getVariable ["nonLethals",true]) && (_projectile != "")) then {
	if(((getDammage _unit) >= 0.9) || (_damage >= 0.9)) then {
		_damage = 0.001;
		[_unit,_source] spawn life_fnc_tazed;
	};
}else{
	if((_curWep in ["SMG_02_F","hgun_P07_F","hgun_P07_snds_F"]) && (_projectile != "")) then {
		if(((getDammage _unit) >= 0.9) || (_damage >= 0.9)) then {
			_damage = 0.001;
			[_unit,_source] spawn life_fnc_tazed;
		};
	};
};
if(vehicle _source isKindOf "LandVehicle") then {
 if(_source != _unit AND {alive _unit} AND {isPlayer _source}) then {
 _damage = 0.001;
 };
};
[] spawn life_fnc_hudUpdate;
_damage;