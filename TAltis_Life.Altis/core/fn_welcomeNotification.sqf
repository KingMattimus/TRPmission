/*
    File: fn_welcomeNotification.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called upon first spawn selection and welcomes our player.
*/
disableSerialization;
[
        "",
        0,
        0.2,
        10,
        0,
        0,
        8
] spawn BIS_fnc_dynamicText;

createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayCtrl 2400;
_textSpoiler = _display displayCtrl 1101;
_text2 = _display displayCtrl 1102;

_message = "";
_message = _message + "Welcome to <a href='http://www.troleplay.com' color='#5600FF'>troleplay.com</a> Experience Beyond Roleplay!<br /><br />";
_message = _message + "This is a serious roleplay server so before you spawn in please make sure you read our rules at <a href= 'http://troleplay.com' color='#5600FF'>Tenacious Role Play</a> otherwise you will end up banned and we dont want that!<br /><br />";
_message = _message + "troleplay.com is now currently running on 5.0.0. We hope you enjoy this update and if you have any issues or concerns, please feel free to join us on Teamspeak!<br />";
_message = _message + "Sincerely,<br />";
_message = _message + "Tenacious Role Play's Staff";

//Fill only the first text
_text1 ctrlSetStructuredText (parseText _message);

//Resize StructuredText component to display the scrollbar if needed
_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlCommit 0;
//Hide second text, spoiler text and button
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;
