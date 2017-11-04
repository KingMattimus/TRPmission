/*
*    FORMAT:
*        STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*
*    ARRAY FORMAT:
*        0: STRING (Classname): Item Classname
*        1: STRING (Nickname): Nickname that will appear purely in the shop dialog
*        2: SCALAR (Buy price)
*        3: SCALAR (Sell price): To disable selling, this should be -1
*        4: STRING (Conditions): Same as above conditions string
*
*    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
*    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
*
*/
class WeaponShops {
    //Armory Shops
    class gun {
        name = "Billy Joe's Firearms";
        side = "civ";
        conditions = "license_civ_gun";
        items[] = {
            { "hgun_Rook40_F", "", 6500, 3250, "" },
            { "hgun_Pistol_01_F", "", 7000, 3500, "" }, //Apex DLC
            { "hgun_Pistol_heavy_02_F", "", 9850, 4925, "" },
            { "hgun_ACPC2_F", "", 11500, 5750, "" },
            { "SMG_05_F", "", 18000, 9000, "" }, //Apex DLC
            { "hgun_PDW2000_F", "", 20000, 10000, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, 60, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, 75, "" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "" },
            { "30Rnd_9x21_Mag", "", 250, 125, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 250, 125, "" }, //Apex DLC
            { "10Rnd_9x21_Mag", "", 250, 125, "" } //Apex DLC
        };
        accs[] = {
            { "acc_flashlight_pistol", "", 1000, 500, "" },//Pistol Flashlight
            { "optic_ACO_grn_smg", "", 2500, 1250, "" }
        };
    };

    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        conditions = "license_civ_rebel";
        items[] = {
			{ "FirstAidKit", "", 4500, 2250, "" },
			{ "ToolKit", "", 4500, 2250, "" },
			{ "ItemGPS", "", 4500, 2250, "" },
			{ "ItemMap", "", 4500, 2250, "" },
			{ "ItemRadio", "", 4500, 2250, "" },
			{ "ItemCompass", "", 4500, 2250, "" },
			{ "MineDetector", "", 4500, 2250, "" },
            { "Binocular", "", 4500, 2250, "" },							 
			{ "Rangefinder", "", 4500, 2250, "" },							
            { "NVGoggles_INDEP", "", 4500, 2250, "" },					
            { "NVGoggles", "", 4500, 2250, "" },							
																					
            { "hgun_Rook40_F", "", 20000, 2250, "" },						
            { "30Rnd_9x21_Mag", "", 4500, 2250, "" },							
																					
			{ "hgun_ACPC2_F", "", 4500, 2250, "" },                         
			{ "9Rnd_45ACP_Mag", "", 4500, 2250, "" },						  
																				  	
            { "hgun_PDW2000_F", "", 4500, 2250, "" },                     
            { "30Rnd_9x21_Mag", "", 4500, 2250, "" },					  		
			                                                                      
            { "arifle_sdar_F", "", 4500, 2250, "" },
            { "20Rnd_556x45_UW_mag", "", 4500, 2250, "" },
			
            { "hgun_Pistol_heavy_02_F", "", 4500, 2250, "" },
            { "6Rnd_45ACP_Cylinder", "", 4500, 2250, "" },
			
            { "arifle_Mk20C_F", "", 4500, 2250, "" },
            { "30Rnd_556x45_Stanag", "", 4500, 2250, "" },
			
            { "arifle_TRG20_F", "", 4500, 2250, "" },
            { "30Rnd_556x45_Stanag", "", 4500, 2250, "" },
			
            { "arifle_TRG21_F", "", 4500, 2250, "" },
            { "30Rnd_556x45_Stanag", "", 4500, 2250, "" },
			
            { "arifle_Katiba_F", "", 4500, 2250, "" },
            { "30Rnd_65x39_caseless_green", "", 4500, 2250, "" },
			
            { "SMG_01_F", "", 4500, 2250, "" },
            { "30Rnd_45ACP_Mag_SMG_01", "", 4500, 2250, "" },
			
            { "srifle_DMR_01_F", "", 4500, 2250, "" },
            { "10Rnd_762x54_Mag", "", 4500, 2250, "" },
			
			
			
			{ "LMG_Mk200_F", "", 4500, 2250, "" },
			{"srifle_DMR_03_multicam_F" , "", 4500, 2250, "" },
			
			{ "LMG_Mk200_F", "", 4500, 2250, "" },
			{ "srifle_DMR_03_multicam_F", "", 4500, 2250, "" },
			{ "srifle_DMR_03_khaki_F", "", 4500, 2250, "" },
			{ "srifle_DMR_03_woodland_F", "", 4500, 2250, "" },
			{ "srifle_DMR_06_camo_F", "", 4500, 2250, "" },
			{ "srifle_EBR_F", "", 4500, 2250, "" }      
        };
        mags[] = {
            { "30Rnd_556x45_Stanag", "", 300, 150, "" },
            { "30Rnd_762x39_Mag_F", "", 300, 150, "" }, //Apex DLC
            { "30Rnd_545x39_Mag_F", "", 300, 150, "" }, //Apex DLC
            { "30Rnd_65x39_caseless_green", "", 275, 140, "" },
            { "10Rnd_762x54_Mag", "", 500, 250, "" },
            { "20Rnd_556x45_UW_mag", "", 125, 60, "" },
            { "30Rnd_580x42_Mag_F", "", 125, 60, "" }, //Apex DLC
			{ "100Rnd_580x42_Mag_F", "", 4500, 2250, "" },
			{ "100Rnd_580x42_Mag_Tracer_F", "", 4500, 2250, "" },
			{ "150Rnd_556x45_Drum_Mag_F", "", 4500, 2250, "" },
			{ "150Rnd_556x45_Drum_Mag_Tracer_F", "", 4500, 2250, "" },
			{ "200Rnd_556x45_Box_F", "", 4500, 2250, "" },
			{ "20Rnd_650x39_Cased_Mag_F", "", 4500, 2250, "" },
			{ "30Rnd_545x39_Mag_F", "", 4500, 2250, "" },
			{ "30Rnd_556x45_Stanag", "", 4500, 2250, "" },
			{ "30Rnd_580x42_Mag_F", "", 4500, 2250, "" },
			{ "20Rnd_762x51_Mag", "", 4500, 2250, "" },
			{ "30Rnd_65x39_caseless_green", "", 4500, 2250, "" },
			{ "30Rnd_762x39_Mag_F", "", 4500, 2250, "" },
			{ "10Rnd_762x54_Mag", "", 4500, 2250, "" },
			{ "30Rnd_9x21_Mag_SMG_02", "", 4500, 2250, "" }
		
		};
        accs[] = {
			
			{ "bipod_01_F_blk", "", 4500, 2250, "" },
			{ "bipod_01_F_snd", "", 4500, 2250, "" },
			{ "bipod_01_F_mtp", "", 4500, 2250, "" },		

			
            { "acc_flashlight", "", 4500, 2250, "" },
            { "optic_ACO_grn", "", 4500, 2250, "" },	
            { "optic_Aco", "", 4500, 2250, "" },
            { "optic_MRCO", "", 4500, 2250, "" },
			{ "optic_Hamr", "", 4500, 2250, "" },		
            { "optic_Holosight", "", 4500, 2250, "" },
            { "optic_Arco", "", 4500, 2250, "" },		
            { "acc_pointer_IR", "", 4500, 2250, "" },
            { "SmokeShell", "", 4500, 2250, "" },	
            { "SmokeShellRed", "", 4500, 2250, "" },
            { "SmokeShellGreen", "", 4500, 2250, "" },		
            { "SmokeShellYellow", "", 4500, 2250, "" },
            { "SmokeShellPurple", "", 4500, 2250, "" },		
            { "SmokeShellOrange", "", 4500, 2250, "" },
            { "HandGrenade", "", 4500, 2250, "" },	
            { "SLAMDirectionalMine_Wire_Mag", "", 4500, 2250, "" }
        };
    };

    class gang {
        name = "Hideout Armament";
        side = "civ";
        conditions = "";
        items[] = {
			{ "ToolKit", "", 4500, 2250, "" },
            { "hgun_Rook40_F", "", 1500, 750, "" },
            { "hgun_Pistol_heavy_02_F", "", 2500, 1250, "" },
            { "hgun_ACPC2_F", "", 4500, 2250, "" },
            { "hgun_PDW2000_F", "", 9500, 4750, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, 60, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, 75, "" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "" },
            { "30Rnd_9x21_Mag", "", 250, 125, "" }
        };
        accs[] = {
            { "acc_flashlight_pistol", "", 500, 250, "" },//Pistol Flashlight
            { "optic_ACO_grn_smg", "", 950, 475, "" }
        };
    };

    //Basic Shops
    class genstore {
        name = "Altis General Store";
        side = "civ";
        conditions = "";
        items[] = {
			{ "ToolKit", "", 4500, 2250, "" },
            { "Binocular", "", 150, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "ItemMap", "", 50, 25, "" },
            { "ItemCompass", "", 50, 25, "" },
            { "ItemWatch", "", 50, 25, "" },
            { "FirstAidKit", "", 150, 75, "" },
            { "NVGoggles", "", 2000, 1000, "" },
            { "Chemlight_red", "", 300, 150, "" },
            { "Chemlight_yellow", "", 300, 150, "" },
            { "Chemlight_green", "", 300, 150, "" },
            { "Chemlight_blue", "", 300, 150, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store {
        name = "Altis Fuel Station Store";
        side = "";
        conditions = "";
        items[] = {
			{ "ToolKit", "", 4500, 2250, "" },
            { "Binocular", "", 750, 75, "" },
            { "ItemGPS", "", 500, 50, "" },
            { "ItemMap", "", 250, 25, "" },
            { "ItemCompass", "", 250, 25, "" },
            { "ItemWatch", "", 250, 25, "" },
            { "FirstAidKit", "", 750, 75, "" },
            { "NVGoggles", "", 10000, 1000, "" },
            { "Chemlight_red", "", 1500, 150, "" },
            { "Chemlight_yellow", "", 1500, 150, "" },
            { "Chemlight_green", "", 1500, 150, "" },
            { "Chemlight_blue", "", 1500, 150, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    //Cop Shops
    class cop_basic {
        name = "Altis Cop Shop";
        side = "cop";
        conditions = "";
        items[] = {
			{ "ToolKit", "", 4500, 2250, "" },
            { "Binocular", "", 150, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "FirstAidKit", "", 150, 75, "" },
            { "NVGoggles", "", 2000, 1000, "" },
            { "HandGrenade_Stone", $STR_W_items_Flashbang, 1700, 850, "" },
            { "hgun_P07_F", $STR_W_items_StunPistol, 2000, 1000, "" },
            { "arifle_SDAR_F", $STR_W_items_TaserRifle, 20000, 10000, "" },
            { "hgun_P07_F", "", 7500, 3750, "" },
            { "hgun_P07_khk_F", "", 7500, 3750, "" }, //Apex DLC
            { "hgun_Pistol_heavy_01_F", "", 9500, 4750, "call life_coplevel >= 1" },
            { "arifle_MX_black_F", "", 35000, 17500, "call life_coplevel >= 2" },
			{ "arifle_MXC_black_F", "", 30000, 15000, "call life_coplevel >= 2" },
			{ "arifle_MXM_Black_F", "", 30000, 15000, "call life_coplevel >= 3" },
            { "srifle_DMR_03_f", "", 17500, 8750, "call life_coplevel >= 4" },
            { "arifle_MXM_black_F", "", 30000, 15000, "call life_coplevel >= 7" },
            { "srifle_DMR_07_blk_F", "", 32000, 16000, "call life_coplevel >= 3" },  //Apex DLC Sniper
            { "arifle_MX_SW_Black_F", "", 32000, 16000, "call life_coplevel >= 7" },
            { "srifle_GM6_F", "", 32000, 16000, "call life_coplevel >= 7" },
            { "srifle_DMR_02_F", "", 32000, 16000, "call life_coplevel >= 7" },
            { "srifle_DMR_03_F", "", 32000, 16000, "call life_coplevel >= 7" },
            { "srifle_EBR_F", "", 32000, 16000, "call life_coplevel >= 7" },
            { "arifle_AK12_GL_F", "", 32000, 16000, "call life_coplevel >= 7" },
            { "arifle_SPAR_03_blk_F", "", 32000, 16000, "call life_coplevel >= 7" },
            { "srifle_DMR_01_F", "", 32000, 16000, "call life_coplevel >= 7" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, 60, "" },
            { "20Rnd_556x45_UW_mag", $STR_W_mags_TaserRifle, 125, 60, "" },
            { "11Rnd_45ACP_Mag", "", 130, 65, "call life_coplevel >= 1" },
            { "30Rnd_65x39_caseless_mag", "", 130, 65, "call life_coplevel >= 2" },
            { "30Rnd_65x39_caseless_mag_Tracer", "", 130, 65, "call life_coplevel >= 2" },
            { "30Rnd_9x21_Mag", "", 250, 125, "call life_coplevel >= 2" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "call life_coplevel >= 3" },
            { "20Rnd_762x51_Mag", "", 200, 100, "call life_coplevel >= 4" },
            { "20Rnd_650x39_Cased_Mag_F", "", 200, 100, "call life_coplevel >= 3" } //Apex DLC
        };
        accs[] = {
            { "optic_MRD", "", 2750, 1375, "call life_coplevel >= 1" },
            { "acc_flashlight_pistol", "", 250, 125, "call life_coplevel >= 1" },//Pistol Flashlight
            { "acc_flashlight", "", 750, 375, "call life_coplevel >= 2" },
            { "optic_Holosight", "", 1200, 600, "call life_coplevel >= 2" },
            { "optic_Hamr", "", 1200, 600, "call life_coplevel >= 2" },
            { "optic_MRCO", "", 1200, 600, "call life_coplevel >= 2" },
            { "optic_LRPS", "", 2500, 1250, "call life_coplevel >= 6" },
            { "optic_Arco", "", 2500, 1250, "call life_coplevel >= 2" }
        };
    };

    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        conditions = "";
        items[] = {
            { "ItemGPS", "", 100, 50, "" },
            { "Binocular", "", 150, 75, "" },
            { "FirstAidKit", "", 150, 75, "" },
            { "NVGoggles", "", 1200, 600, "" }
        };
        mags[] = {};
        accs[] = {};
    };
};
