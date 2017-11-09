#include "..\..\script_macros.hpp"

//---------------------------------
//By Repentz 
//---------------------------------


#define INFINITE 1e+1000
#define IDC_LIFE_BAR_FOOD 2200
#define IDC_LIFE_BAR_FOOD_RING 3200
#define IDC_LIFE_BAR_WATER 2201
#define IDC_LIFE_BAR_WATER_RING 3201
#define IDC_LIFE_BAR_HEALTH 2202
#define IDC_LIFE_BAR_HEALTH_RING 3202
#define IDC_LIFE_BAR_Speaker 3007
#define IDC_LIFE_BAR_SeatBelt 4203

disableSerialization;
if(isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};

//[LIFE_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;

if(!isNil "life_seatbelt") then {
    if ( vehicle player != player ) then {
        if(life_seatbelt) then {
            LIFEctrl(IDC_LIFE_BAR_SeatBelt) ctrlSetText "icons\seatbeltOn.paa";
        } else {
            LIFEctrl(IDC_LIFE_BAR_SeatBelt) ctrlSetText "icons\seatbeltOff.paa";
        };
    } else {
        LIFEctrl(IDC_LIFE_BAR_SeatBelt) ctrlSetText "";
    };
};



if((player getVariable["Earplugs",0]) > 0) then
{
	LIFEctrl(IDC_LIFE_BAR_Speaker) ctrlSetText "icons\earplugsY.paa";
} else {
	LIFEctrl(IDC_LIFE_BAR_Speaker) ctrlSetText "icons\earplugsN.paa";
};


if(!isNil "life_thirst") then
{
	if (life_thirst <= 100) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "icons\water0.paa";
	};

	if (life_thirst <= 90) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "icons\water1.paa";
	};

	if (life_thirst <= 80) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "icons\water2.paa";
	};

	if (life_thirst <= 70) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "icons\water3.paa";
	};

	if (life_thirst <= 60) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "icons\water4.paa";
	};

	if (life_thirst <= 50) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "icons\water5.paa";
	};

	if (life_thirst <= 40) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "icons\water6.paa";
	};

	if (life_thirst <= 30) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "icons\water7.paa";
	};

	if (life_thirst <= 20) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "icons\water8.paa";
	};

	if (life_thirst <= 10) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "icons\water9.paa";
	};

	if (life_thirst <= 0) then
	{
		LIFEctrl(IDC_LIFE_BAR_WATER_RING) ctrlSetText "icons\water10.paa";
	};
};

if (damage player >= 0) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "icons\health0.paa";
};

if (damage player >= 0.01) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "icons\health1.paa";
};

if (damage player >= 0.02) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "icons\health2.paa";
};

if (damage player >= 0.03) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "icons\health3.paa";
};

if (damage player >= 0.07) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "icons\health4.paa";
};

if (damage player >= 0.13) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "icons\health5.paa";
};

if (damage player >= 0.2) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "icons\health6.paa";
};

if (damage player >= 0.3) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "icons\health7.paa";
};

if (damage player >= 0.4) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "icons\health8.paa";
};

if (damage player >= 0.7) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "icons\health9.paa";
};

if (damage player >= 1) then
{
	LIFEctrl(IDC_LIFE_BAR_HEALTH_RING) ctrlSetText "icons\health10.paa";
};

if(!isNil "life_hunger") then
{
	if (life_hunger <= 100) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "icons\food0.paa";
	};

	if (life_hunger <= 90) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "icons\food1.paa";
	};

	if (life_hunger <= 80) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "icons\food2.paa";
	};

	if (life_hunger <= 70) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "icons\food3.paa";
	};

	if (life_hunger <= 60) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "icons\food4.paa";
	};

	if (life_hunger <= 50) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "icons\food5.paa";
	};

	if (life_hunger <= 40) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "icons\food6.paa";
	};

	if (life_hunger <= 30) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "icons\food7.paa";
	};

	if (life_hunger <= 20) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "icons\food8.paa";
	};

	if (life_hunger <= 10) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "icons\food9.paa";
	};

	if (life_hunger <= 0) then
	{
		LIFEctrl(IDC_LIFE_BAR_FOOD_RING) ctrlSetText "icons\food1.paa";
	};
};