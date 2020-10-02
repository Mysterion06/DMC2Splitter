/***************************** Created by Austin 'Auddy' Davenport ******************************************/
/*********************************** Credits: Mysterion_06_ ************************************************/               

//  Devil May Cry 2 - Full Game Timer

state("dmc2")
{
	int finalCutsceneD:     0xF2A648;	        // Cutscene for Dante's the final boss
	int finalCutsceneL:     0x158AF98;	        // Cutscene for Lucia's the final boss
	int level:              0x157D288;	        // The level number
	int newGameStartD:      0xF12C20; 	        // Start of a New Game run for Dante
	int newGameStartL:      0x1588A30;	        // Start of a New Game run for Lucia
	int nowLoading:         0x7DB46C;		    // The Now Loading screens
	int plusStart:          0x1588BB8; 		    // Start of a New Game+ run for Dante and also Reset value
	int shatter:            0x157D2B0;		    // Shatter screens, but actually bonus points
    int roomID:             0x152BB98, 0x78;    // Room ID Values for all characters
}

init
{
    vars.split = 0;
    vars.splitException = 0;
    vars.doorSplit = new List<Tuple<int, int, int>>{
        // Chapter 1
        Tuple.Create(135168, 442368, 0),
        Tuple.Create(442368, 135168, 1),
        Tuple.Create(167936, 442368, 2),
        // Chapter 2
        Tuple.Create(188416, 16384, 3),
        Tuple.Create(36864, 188416, 4),
        Tuple.Create(208896, 36864, 5),
        Tuple.Create(36864, 208896, 6),
        // Chapter 3
        Tuple.Create(28672, 237568, 7),
        Tuple.Create(237568, 28672, 8),
        // Chapter 4
        Tuple.Create(45056, 335872, 9),
        Tuple.Create(32768, 45056, 10),
        // Chapter 5
        Tuple.Create(311296, 389120, 11),
        Tuple.Create(303104, 311296, 12),
        Tuple.Create(172032, 188416, 13),
        Tuple.Create(487424, 172032, 14),
        Tuple.Create(585728, 487424, 15),
        // Chapter 6
        Tuple.Create(98304, 389120, 16),
        // Chapter 7
        Tuple.Create(172032, 139264, 17),
        Tuple.Create(98304, 172032, 18),
        Tuple.Create(77824, 98304, 19),
        Tuple.Create(90112, 77824, 20),
        Tuple.Create(20480, 90112, 21),
        Tuple.Create(163840, 20480, 22),
        // Chapter 9
        Tuple.Create(61440, 163840, 23),
        Tuple.Create(77824, 61440, 24),
        Tuple.Create(106496, 77824, 25),
        Tuple.Create(172032, 106496, 26),
        Tuple.Create(139264, 172032, 27),
        Tuple.Create(32768, 139264, 28),
        Tuple.Create(131072, 32768, 29),
        Tuple.Create(139264, 61440, 30),
        // Chapter 10
        Tuple.Create(8192, 364544, 31),
        Tuple.Create(364544, 8192, 32),
        // Chapter 11
        Tuple.Create(122880, 176128, 33),
        Tuple.Create(569344, 122880, 34),
        Tuple.Create(90112, 569344, 35),
        // Chapter 12
        Tuple.Create(32768, 69632, 36),
        // Chapter 14
        Tuple.Create(421888, 389120, 37),
        // Chapter 16
        Tuple.Create(12288, 73728, 38),
        Tuple.Create(65536, 12288, 39),
        Tuple.Create(40960, 65536, 40),
        Tuple.Create(86016, 40960, 41),
        Tuple.Create(49152, 86016, 42),
        Tuple.Create(139264, 49152, 43),
        Tuple.Create(81920, 139264, 44),
        Tuple.Create(12288, 81920, 45),
        Tuple.Create(20480, 12288, 46),
        Tuple.Create(12288, 65536, 47),
        // Chapter 17
        Tuple.Create(57344, 24576, 48),
    };

    vars.doorSplit2 = new List<Tuple<int, int, int>>{
        // Chapter 1
	    Tuple.Create(417792, 167936, 0),
        // Chapter 2
        Tuple.Create(114688, 65536, 1),
        Tuple.Create(86016, 114688, 2),
        Tuple.Create(94208, 86016, 3),
        Tuple.Create(45056, 94208, 4),
        Tuple.Create(28672, 45056, 5),
        // Chapter 3
        Tuple.Create(335872, 237568, 6),
        Tuple.Create(45056, 335872, 7),
        Tuple.Create(32768, 45056, 8),
        // Chapter 4
        Tuple.Create(311296, 389120, 9),
        // Chapter 5
        Tuple.Create(32768, 139264, 10),
        Tuple.Create(131072, 32768, 11),
        Tuple.Create(61440, 131072, 12),
        Tuple.Create(131072, 61440, 13),
        Tuple.Create(32768, 131072, 14),
        Tuple.Create(139264, 32768, 15),
        Tuple.Create(172032, 139264, 16),
        Tuple.Create(98304, 172032, 17),
        Tuple.Create(77824, 98304, 18),
        Tuple.Create(61440, 77824, 19),
        Tuple.Create(163840, 61440, 20),
        // Chapter 6
        Tuple.Create(327680, 8192, 21),
        // Chapter 7
        Tuple.Create(573440, 397312, 22),
        Tuple.Create(397312, 573440, 23),
        // Chapter 8
        Tuple.Create(528384, 454656, 24),
        Tuple.Create(393216, 528384, 25),
        Tuple.Create(376832, 393216, 26),
        Tuple.Create(32768, 376832, 27),
        // Chapter 10
        Tuple.Create(421888, 389120, 28),
        // Chapter 12
        Tuple.Create(12288, 73728, 29),
        Tuple.Create(65536, 12288, 30),
        Tuple.Create(61440, 65536, 31),
        Tuple.Create(49152, 61440, 32),
        Tuple.Create(86016, 49152, 33),
        Tuple.Create(139264, 86016, 34),
        Tuple.Create(12288, 81920, 35),
        Tuple.Create(12288, 81920, 36),
        Tuple.Create(20480, 12288, 37)
        Tuple.Create(65536, 20480, 38),
        // Chapter 13
        Tuple.Create(94208, 98304, 39),
    };
}

startup
{
    settings.Add("NG or NG+");
    settings.CurrentDefaultParent = "NG or NG+";
    settings.Add("Dante/Lucia NG");
    settings.Add("Dante/Lucia NG+");

    settings.CurrentDefaultParent = null;
    settings.Add("Options");
    settings.CurrentDefaultParent = "Options";
    settings.Add("Doorsplitter Dante NG+");
    settings.Add("Doorsplitter Dante NG");
    settings.Add("Doorsplitter Lucia NG+");
    settings.Add("Doorsplitter Lucia NG");
}

start
{
	// Settings for Dante and Lucia New Game Start
	if(current.newGameStartD == 32 && old.newGameStartD != 32 && settings["Dante/Lucia NG"]){
        vars.split = 0;
        vars.splitException = 0;
		return true;
	}
	

	
	// Settings for New Game+ Start
	if(current.newGameStartL == 335675395 && old.newGameStartL == 184680451 && settings["Dante/Lucia NG+"]){
        vars.split = 0;
        vars.splitException = 0;
		return true;
	}
}

split
{
	// Split if a bullet screen is active
	if(current.shatter != 0 && old.shatter == 0){
		return true;
	}
	
	// Split if the death cutscene for the final boss for Dante plays
	if(current.finalCutsceneD != 0 && old.finalCutsceneD == 0 && current.level == 4609){
		return true;
	}
	
	// Split if the death cutscene for the final boss for Lucia plays
	if(current.finalCutsceneL != 0 && old.finalCutsceneL == 0 && current.level == 3329){
		return true;
	}

    // Doorsplitter Dante NG+ and NG
    if((settings["Doorsplitter Dante NG+"] || settings["Doorsplitter Dante NG"]) && vars.doorSplit.Contains(Tuple.Create(current.roomID, old.roomID, vars.split))){
        vars.split++;
        return true;        
    }

    // Doorsplitter Lucia NG+ and NG
    if((settings["Doorsplitter Lucia NG+"] || settings["Doorsplitter Lucia NG"]) && vars.doorSplit2.Contains(Tuple.Create(current.roomID, old.roomID, vars.split))){
        vars.split++;
        return true;        
    }

    // Dante NG Doorsplitter Exception
    if(settings["Doorsplitter Dante NG"]){
        if((current.roomID == 77824 && old.roomID == 90112 && vars.splitException == 0)
        ||
        (current.roomID == 61440 && old.roomID == 77824 && vars.splitException == 1)
        ||
        (current.roomID == 77824 && old.roomID == 61440 && vars.splitException == 2)
        ||
        (current.roomID == 98304 && old.roomID == 77824 && vars.splitException == 3)
        ||
        (current.roomID == 77824 && old.roomID == 98304 && vars.splitException == 4)
        ||
        (current.roomID == 90112 && old.roomID == 77824 && vars.splitException == 5)){
            vars.splitException++;
            return true;
        }
    }

    // Lucia NG Doorsplitter Exception
    if(settings["Doorsplitter Lucia NG"]){
        if((current.roomID == 61440 && old.roomID == 131072 && vars.splitException == 0)
        ||
        (current.roomID == 131072 && old.roomID == 61440 && vars.splitException == 1)){
            vars.splitException++;
            return true;
        }
    }
}

// isLoading
// {
// 	// Pause the timer if the Now Loading screen is on
// 	if(current.nowLoading != 0){
// 		return true;
// 	}
// 	else{
// 		return false;
// 	}
// }

reset
{
	// Reset if we are on the Main Menu
	if(current.plusStart == 0 && current.newGameStartL == 258){
        vars.split = 0;
        vars.splitException = 0;
		return true;
	}
}
