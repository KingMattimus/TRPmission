_pdoor1 = nearestObject [[19380.8,14315.6,0.00146675],"Land_BackAlley_01_l_gate_F"];
_pdoor2 = nearestObject [[19380.6,14315.5,0.00141144],"Land_BackAlley_01_l_gate_F"];
_pdoor3 = nearestObject [[19405,14288.3,0.00144005],"Land_BackAlley_01_l_gate_F"];
_pdoor4 = nearestObject [[19405.3,14293.5,0.00141716],"Land_BackAlley_01_l_gate_F"];

_pdoor1 setVariable ["locked",false,true];
_pdoor2 setVariable ["locked",false,true];
_pdoor3 setVariable ["locked",false,true];
_pdoor4 setVariable ["locked",false,true];






_pdoor1 setVariable ["bis_disabled_Door_1",0,true];
_pdoor2 setVariable ["bis_disabled_Door_1",0,true];
_pdoor3 setVariable ["bis_disabled_Door_1",0,true];
_pdoor4 setVariable ["bis_disabled_Door_1",0,true];
_pdoor1 animate ["Door_1_rot", 1];
_pdoor3 animate ["Door_1_rot", 1];
_pdoor4 animate ["Door_1_rot", 1];
_pdoor2 animate ["Door_1_rot", 1];
//Wait for a bit then close and lock doors
sleep 300;
_pdoor1 animate ["Door_1_rot", 0];
_pdoor3 animate ["Door_1_rot", 0];
_pdoor4 animate ["Door_1_rot", 0];
_pdoor2 animate ["Door_1_rot", 0];
_pdoor1 setVariable ["locked",true,true];
_pdoor2 setVariable ["locked",true,true];
_pdoor3 setVariable ["locked",true,true];
_pdoor4 setVariable ["locked",true,true];

_pdoor1 setVariable ["bis_disabled_Door_1",1,true];
_pdoor2 setVariable ["bis_disabled_Door_1",1,true];
_pdoor3 setVariable ["bis_disabled_Door_1",1,true];
_pdoor4 setVariable ["bis_disabled_Door_1",1,true];