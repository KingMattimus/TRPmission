//GOM_fnc_vehicleTuning.sqf
//by Grumpy Old Man
//V0.9
// Allows player to upgrade and modify vehicles.
// Usage:
// _tuning = [player] call GOM_fnc_vehicleTuning;
params ["_unit"];

_unit createDiarySubject ["GOM_veh_tuning", "GOM - Vehicle Tuning"];
_unit createDiarySubject ["GOM_veh_records", "Drag Racing Records"];

_unit createDiaryRecord ["GOM_veh_tuning", ["Guide", "Use this at your own risk. I threw this together in two lazy afternoons, so please bare with me.<br /><br />Usage:<br /><br />Use the scroll menu to open the tuning window.<br />Choose your options.<br />Click on OK.<br />Use the 'measure performance' action to retrieve various values, just do a quarter mile drag and you'll see.<br />Activate Nitro with Primary Weapon button.<br />Deactivate Nitro by releasing the forward button or by using the brake.<br />NOTE: You need to activate the Nitro manually after engaging the brake.<br />This is a safety measure.<br />Some vehicles are capable of reaching speeds above 400km/h. Expect airplane - like behaviour.<br />Try not to crash.<br /><br />Acceleration and top speed values depend on the vehicle.<br /><br />General guidance:<br /><br />When the vehicle slips, get off the gas or tip the brakes.<br />This will give you control over your vehicle.<br />Also try to countersteer when possible and only use nitro on straights.<br /><br />Some vehicles work better than others, seems to be caused by PhysX.<br /><br />The Powerband feature works as follows:<br /><br />If you set the thresholds to 100km/h and 300km/h, the nitro will be most efficient between those two speeds.<br />The low threshold sets the limit until the nitro reaches 100% efficiency.<br />The high threshold sets the limit before the nitro starts losing efficiency.<br />Choosing awkward numbers might break the nitro.<br />It's best to set them to values between 100 for the lower, and 300 for the upper threshold.<br />NOTE: Setting the lower threshold to a higher value could possibly lead to a better acceleration due to the vehicle being easier to control.<br />Strongly depends on the vehicle, so best experiment with these values.<br />Average horsepower is being calculated with the elapsed time over quarter mile formula, taking vehicle mass into account.<br /><br />Enjoy"]];

hint "Vehicle Tuning loaded.\nCheck the diary for details.";

_killHint = [] spawn GOM_fnc_killHint;

this addAction ["Tune Vehicle", {

	params ["_unit"];

	createDialog "GOM_veh_tuning";
	playsound "Simulation_Restart";

	{
		ctrlShow [_x, false];
	} foreach [1900, 1901, 1902, 1003, 1004, 1005, 1006, 1007, 1008, 1009];
ctrlEnable [1604,false];
ctrlEnable [1620,false];
ctrlEnable [1621,false];
	_cars = _unit nearEntities [ ["Car", "Motorcycle", "Tank", "Armor"], 25];
	(findDisplay 66)setvariable ["GOM_fnc_vehTuningCars", _cars];
	if (count _cars isEqualTo 0) exitwith {

		hint "No valid vehicle found. Get within 25m of a valid vehicle first.";
		_killHint = [] spawn GOM_fnc_killHint;
		playsound "Simulation_Restart";
	};

	// set listbox entries
	{

		_vehName = getText (configfile >> "CfgVehicles" >> typeOf _x >> "displayName");

		_driver = assignedDriver _x;
		_driverName = if (_driver isEqualTo objnull) then {"No owner."} else {name _driver};

		lbAdd [1500, format ["%1 - %2", _vehName, _driverName]];

		if (_x getvariable ["GOM_fnc_initMass", "init"] isEqualTo "init") then {

			_x setvariable ["GOM_fnc_initMass", getmass _x];
		};

		if (_x getvariable ["GOM_fnc_MaxSpeedMulti", []] isEqualTo []) then {

			_x setvariable ["GOM_fnc_MaxSpeedMulti", [1, random [1.08, 1.1, 1.14], random [1.18, 1.2, 1.24], random [1.28, 1.3, 1.34]]];
		};

	} foreach _cars;

	// listbox EH:
	sliderSetPosition [1900, 0];
	sliderSetPosition [1901, 1];
	sliderSetPosition [1902, 0];

	buttonSetAction [1604, "
	_nul = call GOM_fnc_InstallFromLB
	"];


	_EHs = [];
	_ID = findDisplay 66 displayCtrl 1500 ctrlAddEventhandler ["lbSelChanged", GOM_fnc_updateLB];
	_EHs pushBack _ID;

	_ID = findDisplay 66 displayCtrl 1501 ctrlAddEventhandler ["lbSelChanged", GOM_fnc_updateLB];
	_EHs pushBack _ID;

	_ID = findDisplay 66 displayCtrl 1502 ctrlAddEventhandler ["lbSelChanged", GOM_fnc_updateLB];
	_EHs pushBack _ID;

	(findDisplay 66) setVariable ["GOM_fnc_lbEHs", _EHs];
	_EHs = [];
	_ID = findDisplay 66 displayCtrl 1900 ctrlAddEventhandler ["SliderPosChanged", GOM_fnc_updateSlider2];
	_EHs pushBack _ID;

	_ID = findDisplay 66 displayCtrl 1901 ctrlAddEventhandler ["SliderPosChanged", GOM_fnc_updateSlider1];
	_EHs pushBack _ID;

	_ID = findDisplay 66 displayCtrl 1902 ctrlAddEventhandler ["SliderPosChanged", GOM_fnc_updateBoostDisplay];
	_EHs pushBack _ID;
	(findDisplay 66) setVariable ["GOM_fnc_sliderEHs", _EHs];

	playsound "Simulation_Restart";
	disableSerialization;
	buttonSetAction [1620, "
	_car = (((findDisplay 66) getvariable ['GOM_fnc_vehTuningCars',[]]) select (lbCurSel 1500));

	ctrlEnable [1620, false];
	_car setdamage 0;
	ctrlSetText [1620, 'Repaired'];

	playsound selectRandom ['FD_Target_PopDown_Large_F','FD_Target_PopDown_Small_F','FD_Target_PopUp_Small_F'];
	"];

	buttonSetAction [1621, "
	ctrlEnable [1621, false];
	ctrlSetText [1621, 'Full'];
	_car = (((findDisplay 66) getvariable ['GOM_fnc_vehTuningCars',[]]) select (lbCurSel 1500));
	_car setfuel 1;
	_car setvariable ['GOM_fnc_NitroVolume',1];
	hintsilent 'Vehicle refuelled.';
	_killHint = [] spawn GOM_fnc_killHint;

	"];
	buttonSetAction [1612, "

	_cars = (findDisplay 66) getvariable ['GOM_fnc_vehTuningCars',[]];
	if (_Cars isEqualTo []) exitwith {true};
		_car = _cars select (lbCurSel 1500);
		closeDialog 0;
		playsound 'Topic_Selection';
		_run = [_car] call GOM_fnc_vehTuning;"];
		buttonSetAction [1613, "closeDialog 0;playsound 'Topic_Deselection';"];
}];

true