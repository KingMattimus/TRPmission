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
            { "hgun_Rook40_F", "", 6500,-1, "" },
            { "hgun_Pistol_01_F", "", 7000,-1, "" }, //Apex DLC
            { "hgun_Pistol_heavy_02_F", "",100,-1, "" },
            { "hgun_ACPC2_F", "", 11500,-1, "" },
            { "SMG_05_F", "", 18000,-1, "" }, //Apex DLC
            { "hgun_PDW2000_F", "", 20000,-1, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125,-1, "" },
            { "6Rnd_45ACP_Cylinder", "", 150,-1, "" },
            { "9Rnd_45ACP_Mag", "", 200,-1, "" },
            { "30Rnd_9x21_Mag", "", 250,-1, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 250,-1, "" }, //Apex DLC
            { "10Rnd_9x21_Mag", "", 250,-1, "" } //Apex DLC
        };
        accs[] = {
            { "acc_flashlight_pistol", "", 1000,-1, "" },//Pistol Flashlight
            { "optic_ACO_grn_smg", "", 2500,-1, "" }
        };
    };

    class rebel {
        name = "Arms Cartel Dealer";
        side = "civ";
        conditions = "license_civ_rebel";
        items[] = {
			{ "FirstAidKit", "", 500,-1, "" },
			{ "ToolKit", "", 500,-1, "" },
			{ "ItemGPS", "", 500,-1, "" },
			{ "ItemMap", "", 500, 10, "" },
			{ "ItemRadio", "", 500,-1, "" },
			{ "ItemCompass", "",500,-1, "" },
			{ "MineDetector", "", 500,50, "" },
            { "Binocular", "", 500,-1, "" },							 
			{ "Rangefinder", "", 500,-1, "" },							
            { "NVGoggles_INDEP", "", 500,-1, "" },					
            { "NVGoggles", "", 500,-1, "" },							
																					
            { "hgun_Rook40_F", "", 5000, 250, "" },						
            { "30Rnd_9x21_Mag", "", 500,-1, "" },							
																					
			{ "hgun_ACPC2_F", "", 4500,-1, "" },                         
			{ "9Rnd_45ACP_Mag", "", 4500,-1, "" },						  
																				  	
            { "hgun_PDW2000_F", "", 4500,-1, "" },                     
            { "30Rnd_9x21_Mag", "", 500,-1, "" },					  		
			                                                                      
            { "arifle_sdar_F", "", 4500,-1, "" },
            { "20Rnd_556x45_UW_mag", "", 500,-1, "" },
			
            { "hgun_Pistol_heavy_02_F", "", 4500,-1, "" },
            { "6Rnd_45ACP_Cylinder", "", 500,-1, "" },
			
            { "arifle_Mk20C_F", "", 4500,-1, "" },
            { "30Rnd_556x45_Stanag", "", 500,-1, "" },
			
            { "arifle_TRG20_F", "", 4500,-1, "" },
            { "30Rnd_556x45_Stanag", "", 500,-1, "" },
			
            { "arifle_TRG21_F", "", 4500,-1, "" },
            { "30Rnd_556x45_Stanag", "", 500,-1, "" },
			
            { "arifle_Katiba_F", "", 4500,-1, "" },
            { "30Rnd_65x39_caseless_green", "", 500,-1, "" },
			
            { "SMG_01_F", "", 4500, 2250, "" },
            { "30Rnd_45ACP_Mag_SMG_01", "", 500,-1, "" },
			
            { "srifle_DMR_01_F", "", 8500,-1, "" },
            { "10Rnd_762x54_Mag", "", 4500,-1, "" },
			
			
			
			{ "LMG_Mk200_F", "", 10500,-1, "" },
			{"srifle_DMR_03_multicam_F" , "", 8500,-1, "" },
			
			{ "srifle_DMR_03_multicam_F", "", 00,-1, "" },
			{ "srifle_DMR_03_khaki_F", "", 6500,-1, "" },
			{ "srifle_DMR_03_woodland_F", "", 6500,-1, "" },
			{ "srifle_DMR_06_camo_F", "", 6500,-1, "" },
			{ "srifle_EBR_F", "", 6500,-1, "" }      
        };
        mags[] = {
            { "30Rnd_556x45_Stanag", "", 300,-1, "" },
            { "30Rnd_762x39_Mag_F", "", 300,-1, "" }, //Apex DLC
            { "30Rnd_545x39_Mag_F", "", 300,-1, "" }, //Apex DLC
            { "30Rnd_65x39_caseless_green", "", 275,-1, "" },
            { "10Rnd_762x54_Mag", "", 500,-1, "" },
            { "20Rnd_556x45_UW_mag", "", 125,-1, "" },
            { "30Rnd_580x42_Mag_F", "", 125,-1, "" }, //Apex DLC
			{ "100Rnd_580x42_Mag_F", "", 4500,-1, "" },
			{ "100Rnd_580x42_Mag_Tracer_F", "", 4050,-1, "" },
			{ "150Rnd_556x45_Drum_Mag_F", "", 4500,-1, "" },
			{ "150Rnd_556x45_Drum_Mag_Tracer_F", "", 4500,-1, "" },
			{ "200Rnd_556x45_Box_F", "", 4500,-1, "" },
			{ "20Rnd_650x39_Cased_Mag_F", "", 500,-1, "" },
			{ "30Rnd_545x39_Mag_F", "", 500,-1, "" },
			{ "30Rnd_556x45_Stanag", "", 500,-1, "" },
			{ "30Rnd_580x42_Mag_F", "", 500,-1, "" },
			{ "20Rnd_762x51_Mag", "", 500,-1, "" },
			{ "30Rnd_65x39_caseless_green", "", 500,-1, "" },
			{ "30Rnd_762x39_Mag_F", "", 500,-1, "" },
			{ "10Rnd_762x54_Mag", "", 500,-1, "" },
			{ "30Rnd_9x21_Mag_SMG_02", "", 500,-1, "" }
		
		};
        accs[] = {
			
			{ "bipod_01_F_blk", "", 4500,-1, "" },
			{ "bipod_01_F_snd", "", 4500,-1, "" },
			{ "bipod_01_F_mtp", "", 4500,-1, "" },		

			
            { "acc_flashlight", "", 4500,-1, "" },
            { "optic_ACO_grn", "", 4500,-1, "" },	
            { "optic_Aco", "", 4500,-1, "" },
            { "optic_MRCO", "", 4500,-1, "" },
			{ "optic_Hamr", "", 4500,-1, "" },		
            { "optic_Holosight", "", 4500,-1, "" },
            { "optic_Arco", "", 4500,-1, "" },		
            { "acc_pointer_IR", "", 4500,-1, "" },
            { "SmokeShell", "", 4500,-1, "" },	
            { "SmokeShellRed", "", 4500,-1, "" },
            { "SmokeShellGreen", "", 4500,-1, "" },		
            { "SmokeShellYellow", "", 4500,-1, "" },
            { "SmokeShellPurple", "", 4500,-1, "" },		
            { "SmokeShellOrange", "", 4500,-1, "" },
            { "HandGrenade", "", 4500,-1, "" },	
            { "SLAMDirectionalMine_Wire_Mag", "", 4500,-1, "" }
        };
    };

    class gang {
        name = "Hideout Armament";
        side = "civ";
        conditions = "";
        items[] = {
			{ "ToolKit", "", 500, 2250, "" },
            { "hgun_Rook40_F", "", 1500,-1, "" },
            { "hgun_Pistol_heavy_02_F", "", 2500,-1, "" },
            { "hgun_ACPC2_F", "", 4500,-1, "" },
            { "hgun_PDW2000_F", "", 9500,-1, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125,-1, "" },
            { "6Rnd_45ACP_Cylinder", "", 150,-1, "" },
            { "9Rnd_45ACP_Mag", "", 200,-1, "" },
            { "30Rnd_9x21_Mag", "", 250,-1, "" }
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
			{ "ToolKit", "", 500,-1, "" },
            { "Binocular", "",100,-1, "" },
            { "ItemGPS", "", 100,-1, "" },
            { "ItemMap", "", 100,-1, "" },
            { "ItemCompass", "",-1, 25, "" },
            { "ItemWatch", "", 100, 25, "" },
            { "FirstAidKit", "", 150, 75, "" },
            { "NVGoggles", "", 2000,-1, "" },
            { "Chemlight_red", "", 300,-1, "" },
            { "Chemlight_yellow", "", 300,-1, "" },
            { "Chemlight_green", "", 300,-1, "" },
            { "Chemlight_blue", "", 300,-1, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store {
        name = "Altis Fuel Station Store";
        side = "";
        conditions = "";
        items[] = {
			{ "ToolKit", "", 500, -1, "" },
            { "Binocular", "", 100,-1, "" },
            { "ItemGPS", "", 500,-1, "" },
            { "ItemMap", "", 250,-1, "" },
            { "ItemCompass", "", 250,-1, "" },
            { "ItemWatch", "", 250,-1, "" },
            { "FirstAidKit", "", 750,-1, "" },
            { "NVGoggles", "", 1000,-1, "" },
            { "Chemlight_red", "", 500,-1, "" },
            { "Chemlight_yellow", "", 500,-1, "" },
            { "Chemlight_green", "", 500,-1, "" },
            { "Chemlight_blue", "", 500,-1, "" }
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
			{ "ToolKit", "", 4500, -1, "" },
            { "Binocular", "", 150, -1, "" },
            { "ItemGPS", "", 100,-1, "" },
            { "FirstAidKit", "", 150, -1, "" },
            { "NVGoggles", "", 2000, -1, "" },
            { "HandGrenade_Stone", $STR_W_items_Flashbang, 1700, -1, "" },
            { "hgun_P07_F", $STR_W_items_StunPistol, 2000, -1, "" },
            { "arifle_SDAR_F", $STR_W_items_TaserRifle, 20000, -1, "" },
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
            { "ItemGPS", "", 100,-1, "" },
            { "Binocular", "", 150, -1, "" },
            { "FirstAidKit", "", 150, -1, "" },
            { "NVGoggles", "", 1200, -1, "" }
        };
        mags[] = {};
        accs[] = {};
    };
};
