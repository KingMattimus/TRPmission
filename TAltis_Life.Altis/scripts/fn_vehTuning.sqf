//GOM_fnc_vehTuning.sqf
//by Grumpy Old Man
//V0.9
params ["_vehicle"];
_IDs = _vehicle getvariable ["GOM_fnc_nitroActionIDs",[-1]];

if (_IDs select 0 > -1) exitWith {};

	{_vehicle removeAction _x} foreach _IDs;


	_displayEHs = player getvariable ["GOM_fnc_displayEHs",[]];
	if !(_displayEHs isEqualTo []) then {

		(findDisplay 46) displayRemoveEventHandler ["KeyDown",(_displayEHs select 0)];
		(findDisplay 46) displayRemoveEventHandler ["KeyUp",(_displayEHs select 1)];

	};
	_stackedID = _vehicle getVariable ["GOM_fnc_stackedEH",""];
	if !(_stackedID isEqualTo "") then {

		[_stackedID, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;

	};

	_engineID = _vehicle getVariable ["GOM_fnc_nitroEngineEH",-1];
	_vehicle removeEventHandler ["Engine",_engineID];
	_nitroStages = [0,random [0.33,0.35,0.40],random [0.53,0.55,0.60],random [0.73,0.75,0.80]];
	_vehicle setvariable ["GOM_fnc_nitroStages",_nitroStages];
	_vehicle setvariable ["GOM_fnc_NitroOff",false];
	_vehicle setvariable ["GOM_fnc_NitroActivated",false];
	_nitroActionIDs = [];

	_ID =	_vehicle addAction ["Ejection Seat",{(_this select 1) call GOM_fnc_ejectionSeat;},nil,0,false,true,"","_this in crew _target AND _target getvariable [""GOM_fnc_EjectionSeatsInstalled"",false]"];
	_nitroActionIDs pushBack _ID;


	_ID =	_vehicle addAction ["'Fog' Machine (3 Charges)",{(_this select 0) spawn GOM_fnc_fogMachine;},nil,0,false,true,"","_this isequalto driver _target AND _target getvariable [""GOM_fnc_FogMachineInstalled"",false] AND _target getvariable [""GOM_fnc_FogMachineRounds"",0] > 0"];
	_nitroActionIDs pushBack _ID;
	_vehicle setvariable ["GOM_fnc_FOGactionID",_ID];
	_ID =	_vehicle addaction ["Cruise-Control On",{(_this select 0) setvariable ["GOM_fnc_CruiseControl",speed (_this select 0)]},nil,0,false,true,"","((vehicle _target getvariable [""GOM_fnc_CruiseControl"",-1])< 0) AND _this isEqualTo driver _target AND isEngineOn _target AND _target getvariable [""GOM_fnc_CruiseControlInstalled"",false]"];
	_nitroActionIDs pushBack _ID;

	_ID = _vehicle addaction ["Cruise-Control Off",{_this select 0 setvariable ["GOM_fnc_CruiseControl",-1]},nil,0,false,true,"","((vehicle _target getvariable [""GOM_fnc_CruiseControl"",-1])> 0) AND _this isEqualTo driver _target AND isEngineOn _target AND _target getvariable [""GOM_fnc_CruiseControlInstalled"",false]"];
	_nitroActionIDs pushBack _ID;

	_ID = _vehicle addaction [format ["Activate Nitro (%1)"],{

	params ["_veh"];
	_veh setvariable ["GOM_fnc_NitroActivated",true];
	playSound "ZoomIn";

},nil,0,false,true,"DefaultAction","!(_target getvariable [""GOM_fnc_NitroActivated"",false]) AND _this isEqualTo driver _target AND _target getvariable ['GOM_fnc_NitroVolume',-1] > 0"];
_nitroActionIDs pushBack _ID;

_ID = _vehicle addAction [format ["Deactivate Nitro (%1)",actionKeysNames "CarBack"],{

params ["_veh"];
_veh setvariable ["GOM_fnc_NitroActivated",false];
playSound "ZoomOut";

},nil,0,false,true,"CarBack","(vehicle _target getvariable [""GOM_fnc_NitroActivated"",false]) AND _this isEqualTo driver _target AND _target getvariable ['GOM_fnc_NitroVolume',-1] > 0"];
_nitroActionIDs pushBack _ID;

//_ID = _vehicle addaction ["Measure Performance",{

//params ["_veh"];
//_veh setvariable ["GOM_fnc_nitroMeasuring",true];
//playSound "Topic_Selection";
//_acc = [_veh] spawn GOM_fnc_acceleration;
//_qm = [_veh] spawn GOM_fnc_quartermile

//},nil,0,false,true,"","(!(vehicle _target getvariable [""GOM_fnc_nitroMeasuring"",false])) AND _this isEqualTo driver _target"];
//_nitroActionIDs pushBack _ID;
//
_ID = _vehicle addaction ["Check Nitro Volume",{

params ["_veh"];
_nitroSize = _veh getvariable ['GOM_fnc_nitroSize',-1];
_nitroVolume = _veh getvariable ['GOM_fnc_NitroVolume',-1];
if (_nitroVolume < 0)exitWith {hint "You have no Nitro installed!";
_killHint = [] spawn GOM_fnc_killHint;
};
_bottlesize = 5; //average size of a nitro bottle in litres
hintsilent format ["Nitro left: %1l / %2l.",[_nitroVolume * (_nitroSize * _bottlesize),2] call GOM_fnc_roundNum,(_nitroSize * _bottlesize)];	_killHint = [] spawn GOM_fnc_killHint;


},nil,0,false,true,"","((vehicle _target getvariable [""GOM_fnc_NitroVolume"",-1])>= 0) AND _this isEqualTo driver _target"];
_nitroActionIDs pushBack _ID;

_vehicle setvariable ["GOM_fnc_nitroActionIDs",_nitroActionIDs];
disableSerialization;
_display = (findDisplay 46);
_displayEHs = [];
_ID = _display displayAddEventHandler ["KeyDown","_veh = vehicle player;if ((_this select 1) isEqualTo 17) then {_veh setvariable ['GOM_fnc_NitroOff',false];_veh setvariable ['GOM_fnc_CruiseControl',-1]} else {_veh setvariable ['GOM_fnc_NitroOff',true]};if ((_this select 1) in [30,31,32]) then {_veh setvariable ['GOM_fnc_NitroOff',true];};if ((_this select 1) isEqualTo 31) then {_veh setvariable ['GOM_fnc_CruiseControl',-1];_veh setvariable ['GOM_fnc_braking',true]}"];

_displayEHs pushBack _ID;

_ID =_display displayAddEventHandler ["KeyUp","_veh = vehicle player;if ((_this select 1) isEqualTo 17) then {_veh setvariable ['GOM_fnc_NitroOff',true]};if ((_this select 1) isEqualTo 31) then {_veh setvariable ['GOM_fnc_braking',false]}"];
_displayEHs pushBack _ID;
player setvariable ["GOM_fnc_displayEHs",_displayEHs];
_stackedEHID = "GOM_fnc_nitroOnEachFrameID";
_vehicle setVariable ["GOM_fnc_stackedEH",_stackedEHID];

_addEH = [_stackedEHID,"onEachFrame",{

_veh = vehicle player;
_speed = speed _veh;
_onGround = isTouchingGround _veh;
_playerDrives = player isequalto driver _veh;
if (_veh getvariable ["GOM_fnc_CruiseControl",-1] > 0 AND isEngineOn _veh AND alive _veh) then {

	_CruiseSpeed = (_veh getvariable ["GOM_fnc_CruiseControl",-1]) * 0.27777777777778;

	if (isTouchingGround _veh) then {

		_dir = getDirVisual _veh;
		_vel = velocity _veh;
		_vel params ["","","_velZ"];

		_veh setVelocity [
		(_CruiseSpeed * (sin _dir)),
		(_CruiseSpeed * (cos _dir)),
		_velZ
		];

	};

};



if (_playerDrives AND _veh getvariable ["GOM_fnc_calcVel",false] AND  _veh getvariable ['GOM_fnc_NitroVolume',1] > 0) then {

	_speedMulti = _veh getvariable ["GOM_fnc_speedMulti",0];
	_speedMulti = (_speedMulti * (16 / diag_fps));
	_calcMulti = _speedmulti;
	_finalMulti = _speedMulti;
	_lowThreshold = call compile (_veh getvariable ["GOM_fnc_nitroLowThreshold","100"]);
	_highThreshold = call compile  (_veh getvariable ["GOM_fnc_nitroHighThreshold","300"]);

	if (_speed <= _lowThreshold) then {

		_finalMulti = _speedMulti / (_lowThreshold / _speed);

	};

	if (_speed >= _highThreshold) then {

		_finalMulti = _speedMulti / (_speed / _highThreshold);

	};

	_vel = velocity _veh;
	_dir = getDirVisual _veh;
	_vel params ["_velX","_velY","_velZ"];

	_calc = [
	_velX + (_finalMulti * (sin _dir)),
	_velY + (_finalMulti * (cos _dir)),
	_velZ - 0.008
	];

	_velMag =vectorMagnitude _vel;
	_calcMag = vectorMagnitude _calc;
	_condition =(_velMag - _calcMag <= -0.05);

	_calc params ["_calcX","_calcY"];
	_nitroVolume = _veh getvariable ['GOM_fnc_NitroVolume',0];
	_nitroInstalled = _veh getvariable ['GOM_fnc_NitroInstalled',false];
	_nitroSize = _veh getVariable ["GOM_fnc_nitroSize",-1];
	_nitroConsumption = _veh getvariable ["GOM_fnc_NitroStage",1];
	_nitroVolume = _nitroVolume - (((1 + (_nitroConsumption * 0.1)) * 0.003 / _nitroSize));
	_fuel = fuel _veh;
	_fuel = _fuel - ((1 + (_nitroConsumption * 0.1)) * 0.0003);
	_veh setfuel _fuel;

_bottlesize = 5; //average size of a nitro bottle in litres
_actualvolume = [_nitroVolume * (_nitroSize * _bottlesize),2] call GOM_fnc_roundNum;
if (_actualvolume <= 0) then {_actualvolume = 0};
_nitroBarInfo = parsetext format ["Nitro: %1l / %2l.",_actualvolume,(_nitroSize * _bottlesize)];
with uiNamespace do {

GOM_NitroBar progressSetPosition _nitroVolume;
GOM_NitroInfo ctrlSetStructuredText _nitroBarInfo;
GOM_NitroInfo ctrlCommit 0;
GOM_NitroBar ctrlCommit 0;

};




if (_nitroVolume < 0) then {_nitroVolume = 0;};
	_veh setVariable ['GOM_fnc_NitroVolume',_nitroVolume];

	if (_condition AND _onGround) then {

		_veh setVelocity _calc;

	};

	if (_condition AND !_onGround) then {

		_veh setVelocity [
		_velX,
		_velY,
		_velZ - 0.008
		];

	};

};


}] call BIS_fnc_addStackedEventHandler;

GOM_fnc_acceleration = {

params ["_veh"];
_texts = [];

waituntil {_veh getvariable ["GOM_fnc_nitroMeasuring",false]};

_getmaxspeed = getnumber (configfile >> "CfgVehicles" >> typeOf _veh >> "maxSpeed");

if (_getmaxspeed <= 300) then {_getmaxspeed = 300};

	_maxspeedMulti = _veh getvariable ["GOM_fnc_MaxSpeed",1];
	_maxspeed = _getmaxspeed * _maxspeedMulti;
	_vehName = getText (configfile >> "CfgVehicles" >> typeOf _veh >> "displayName");
	_vehDifferential = getText (configfile >> "CfgVehicles" >> typeOf _veh >> "differentialType");
	_diffTypes = ["","all_open", "all_limited", "front_open", "front_limited", "rear_open", "rear_limited"];
	_diffReferences = ["N/A","4WD","4WD, limited-slip differential","FWD","FWD, limited-slip differential","RWD","RWD, limited-slip differential"];

	_vehDiffText = if (_vehDifferential in _diffTypes) then {_diffReferences select (_diffTypes find _vehDifferential)} else {_diffReferences select 0};

	_mass = getMass _veh;
	_nitroStageText = format ["Nitro Kit Stage %1.",_veh getvariable ["GOM_fnc_NitroStage",0]];
	_brakeIndex = _veh getVariable ["GOM_fnc_brakeType",0];
	_brakeTypes = ["Stock Brakes.","Aftermarket Brakes.","High Performance Brakes.","High End Brakes."];
	_lowThreshold = _veh getvariable ['GOM_fnc_nitroLowThreshold',"N/A"];
	_highThreshold = _veh getvariable ['GOM_fnc_nitroHighThreshold',"N/A"];
	_braketext = format ["%1",_braketypes select _brakeIndex];
	_powerBandText = format ["Nitro settings:<br />Lower Threshold: %1km/h.<br />Upper Threshold: %2km/h.",_lowThreshold,_highThreshold];
	_text = format ["--- NEW RUN ---<br />Run start time: %1.<br />%2 in %3 - %4kg.<br />Top Speed: %5km/h.<br />%6<br />%7<br /><br />%8",[daytime] call BIS_fnc_timeToString,name player,_vehName,[getmass _veh,2] call GOM_fnc_roundNum,[_maxspeed,2] call GOM_fnc_roundNum,_nitroStageText,_braketext,_powerbandText];
	_log = _veh getvariable ["GOM_fnc_performanceLog",[]];
	_log set [0,_text];
	_veh setVariable ["GOM_fnc_performanceLog",_log];

	waituntil {player != _veh};

	hintsilent "Ready to measure, accelerate!";	_killHint = [] spawn GOM_fnc_killHint;

	playsound "FD_Start_F";

	waituntil {speed _veh > 0};

	_vInit = 0;
	_starttime = time;
	_kmhToMphMulti = 0.27777777777778;

	waituntil {speed _veh >= 96.5606};

	_accel = (((speed _veh * _kmhToMphMulti) - _vInit) / (time - _starttime));
	_text = format ["0 - 60 (mph): %1s. Acceleration (0 - 60mph): %2m/s².",[(time - _starttime),2] call GOM_fnc_roundNum,[_accel,2] call GOM_fnc_roundNum];
	_log = _veh getvariable ["GOM_fnc_performanceLog",[]];
	_log set [1,_text];
	_veh setVariable ["GOM_fnc_performanceLog",_log];

	waituntil {speed _veh >= 100};

	_accel = (((speed _veh * _kmhToMphMulti) - _vInit) / (time - _starttime));
	_text = format ["0 - 100 (km/h): %1s. Acceleration (0 - 100km/h): %2m/s².",[(time - _starttime),2] call GOM_fnc_roundNum,[_accel,2] call GOM_fnc_roundNum];
	_log = _veh getvariable ["GOM_fnc_performanceLog",[]];
	_log set [2,_text];
	_veh setVariable ["GOM_fnc_performanceLog",_log];

	waituntil {speed _veh isEqualto 0};

	sleep 3;

	waituntil {!(_veh getvariable ["GOM_fnc_nitroMeasuring",false])};



};

GOM_fnc_quartermile = {

params ["_veh"];

_texts = [];
_kmhToMphMulti = 0.27777777777778;

waituntil {_veh getvariable ["GOM_fnc_nitroMeasuring",false]};

waituntil {speed _veh > 0};

_vInit = 0;
_startpos = getposATL _veh;
_starttime = time;

waituntil {getposatl _veh distance2d _startpos >= 201};

_accel = (((speed _veh * _kmhToMphMulti) - _vInit) / (time - _starttime));
_text = format ["Eighth mile: %1s. Acceleration: %2m/s². Speed: %3km/h.",[(time - _starttime),2] call GOM_fnc_roundNum,[_accel,2] call GOM_fnc_roundNum,[speed _veh,2] call GOM_fnc_roundNum];
_log = _veh getvariable ["GOM_fnc_performanceLog",[]];
_log set [3,_text];
_veh setVariable ["GOM_fnc_performanceLog",_log];

waituntil {getposatl _veh distance2d _startpos >= 402};

_accel = (((speed _veh * _kmhToMphMulti) - _vInit) / (time - _starttime));
_text = format ["Quarter mile: %1s. Acceleration: %2m/s². Speed: %3km/h.",[(time - _starttime),2] call GOM_fnc_roundNum,[_accel,2] call GOM_fnc_roundNum,[speed _veh,2] call GOM_fnc_roundNum];
_log = _veh getvariable ["GOM_fnc_performanceLog",[]];
_log set [4,_text];
_veh setVariable ["GOM_fnc_performanceLog",_log];
_horsepower = (getmass _veh * 2.20462)/(((time - _starttime)/5.825)^3);
_text = format ["Calculated horsepower: %1hp.",[_horsepower,2] call GOM_fnc_roundNum];
_log = _veh getvariable ["GOM_fnc_performanceLog",[]];
_log set [0,format ["%1<br />%2",_log select 0,_text]];
_veh setVariable ["GOM_fnc_performanceLog",_log];
playsound "FD_Finish_F";
hintsilent "Measuring finished. Logging results to Diary.";
_killHint = [] spawn GOM_fnc_killHint;

waituntil {speed _veh isEqualto 0};

sleep 3;

_log = _veh getvariable ["GOM_fnc_performanceLog",[]];
reverse _log;

{

	player createDiaryRecord ["GOM_veh_records",["Records",_x]];

} foreach  _log;

_veh setvariable ["GOM_fnc_nitroMeasuring",false];

};

_engineID = _vehicle addEventHandler ["Engine",{
params ["_vehicle","_engineOn"];
if !(player isEqualTo driver _vehicle) exitWith {true};
	_runECU = _this spawn {

	params ["_vehicle","_engineOn"];


	if (_engineOn) then {


	_nitroVolume = _vehicle getVariable ["GOM_fnc_NitroVolume",0];
	_nitroSize = _vehicle getvariable ['GOM_fnc_nitroSize',-1];
	_bottlesize = 5; //average size of a nitro bottle in litres
	_nitroBarInfo = parsetext format ["Nitro: %1l / %2l.",[_nitroVolume * (_nitroSize * _bottlesize),2] call GOM_fnc_roundNum,(_nitroSize * _bottlesize)];
if (_nitroVolume > 0) then {
	with uiNamespace do {

		GOM_NitroBar = findDisplay 46 ctrlCreate ["RscProgress", -1];
		GOM_NitroBar ctrlSetPosition [0,1.15,1,0.05];
		GOM_NitroBar ctrlSetFade 1;
		GOM_NitroBar ctrlCommit 0;
		GOM_NitroBar progressSetPosition 0;
		GOM_NitroInfo = findDisplay 46 ctrlCreate ["RscStructuredText", 15099];
		GOM_NitroInfo ctrlSetPosition [0,1.15,1,0.05];
		GOM_NitroInfo ctrlSetFade 0;
		GOM_NitroInfo ctrlCommit 0;
		GOM_NitroInfo ctrlSetStructuredText _nitroBarInfo;
		GOM_NitroBar ctrlSetFade 0;
		GOM_NitroBar progressSetPosition _nitroVolume;
		GOM_NitroBar ctrlCommit 2;

	};
};

};

while {isEngineOn _vehicle AND driver _vehicle isEqualTo player AND alive _vehicle} do {

	_getmaxspeed = getnumber (configfile >> "CfgVehicles" >> typeOf _vehicle >> "maxSpeed");

	if (_getmaxspeed <= 300) then {_getmaxspeed = 300};

		_maxspeedMulti = _vehicle getvariable ["GOM_fnc_MaxSpeed",1];
		_maxspeed = _getmaxspeed * _maxspeedMulti;
		_nitroStages = _vehicle getvariable ["GOM_fnc_nitroStages",[0]];
		_speedX = _nitroStages select (_vehicle getvariable ["GOM_fnc_NitroStage",0]);
		_vehicle setvariable ["GOM_fnc_speedMulti",_speedX];

		if (speed _vehicle >= 10 AND _vehicle getvariable ["GOM_fnc_NitroActivated",false] AND speed _vehicle < (_maxspeed) AND !(_vehicle getvariable ["GOM_fnc_NitroOff",false])) then {

			_vehicle setvariable ["GOM_fnc_calcVel",true];

		} else {

		_vehicle setvariable ["GOM_fnc_calcVel",false];

	};

	_oldTick = diag_tickTime;

	waituntil {diag_tickTime >= _oldTick + 0.04};

};


if (!_engineOn OR !(driver _vehicle isEqualTo player)) then {
	_vehicle setvariable ["GOM_fnc_CruiseControl",-1];
	with uiNamespace do {

	GOM_NitroBar ctrlSetFade 1;
	GOM_NitroBar ctrlCommit 2;
	ctrlDelete GOM_NitroBar;
	GOM_NitroInfo ctrlSetFade 1;
	GOM_NitroInfo ctrlCommit 2;
	ctrlDelete GOM_NitroInfo;

};
};

true
};

}];

_vehicle setvariable ["GOM_fnc_nitroEngineEH",_engineID];
true