_adoor1 = nearestObject [[20900.7,19212.5,0.001441],"Land_BackAlley_01_l_gate_F"];
_adoor2 = nearestObject [[20903.4,19206.6,0.00144291],"Land_BackAlley_01_l_gate_F"];
_adoor3 = nearestObject [[20907,19221.8,0.00143909],"Land_BackAlley_01_l_gate_F"];
_adoor4 = nearestObject [[20904.3,19217.5,0.00143909],"Land_BackAlley_01_l_gate_F"];



_adoor1 setVariable ["locked",false,true];
_adoor2 setVariable ["locked",false,true];
_adoor3 setVariable ["locked",false,true];
_adoor4 setVariable ["locked",false,true];
_adoor1 setVariable ["bis_disabled_Door_1",0,true];
_adoor2 setVariable ["bis_disabled_Door_1",0,true];
_adoor3 setVariable ["bis_disabled_Door_1",0,true];
_adoor4 setVariable ["bis_disabled_Door_1",0,true];

_adoor1 animate ["Door_1_rot", 1];
_adoor3 animate ["Door_1_rot", 1];
_adoor4 animate ["Door_1_rot", 1];
_adoor2 animate ["Door_1_rot", 1];

//gates
_agate1 = nearestObject [[20910.4,19236.1,0.00143719],"Land_Net_Fence_Gate_F"];
_agate2 = nearestObject [[20914,19237.8,0.00143623],"Land_Net_Fence_Gate_F"];
_agate1 setVariable ["locked",false,true];
_agate2 setVariable ["locked",false,true];
_agate1 setVariable ["bis_disabled_Door_1",0,true];
_agate1 setVariable ["bis_disabled_Door_2",0,true];
_agate2 setVariable ["bis_disabled_Door_1",0,true];
_agate2 setVariable ["bis_disabled_Door_2",0,true];
_agate1 animate ["Door_1_rot", 1];
_agate1 animate ["Door_2_rot", 1];
_agate2 animate ["Door_1_rot", 1];
_agate2 animate ["Door_2_rot", 1];

//Wait for a bit then close and lock doors
sleep 600;

_adoor1 animate ["Door_1_rot", 0];
_adoor3 animate ["Door_1_rot", 0];
_adoor4 animate ["Door_1_rot", 0];
_adoor2 animate ["Door_1_rot", 0];

_adoor1 setVariable ["locked",true,true];
_adoor2 setVariable ["locked",true,true];
_adoor3 setVariable ["locked",true,true];
_adoor4 setVariable ["locked",true,true];

_adoor1 setVariable ["bis_disabled_Door_1",1,true];
_adoor2 setVariable ["bis_disabled_Door_1",1,true];
_adoor3 setVariable ["bis_disabled_Door_1",1,true];
_adoor4 setVariable ["bis_disabled_Door_1",1,true];

//gates
_agate1 animate ["Door_1_rot", 0];
_agate1 animate ["Door_2_rot", 0];
_agate2 animate ["Door_1_rot", 0];
_agate2 animate ["Door_2_rot", 0];


_agate2 setVariable ["locked",true,true];
_agate1 setVariable ["locked",true,true];

_agate1 setVariable ["bis_disabled_Door_1",1,true];
_agate1 setVariable ["bis_disabled_Door_2",1,true];
_agate2 setVariable ["bis_disabled_Door_1",1,true];
_agate2 setVariable ["bis_disabled_Door_2",1,true];