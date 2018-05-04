state("Warcraft III")
{
	uint igt : "Game.dll", 0xD30110;
	byte status : "Game.dll", 0xD0DEF8, 0x34, 0x10, 0x8, 0x338;
	string8 victorySplash : "Storm.dll", 0x58280, 0x23C, 0x1C, 0x0;
	string7 starter1 : "Game.dll", 0xCB1C94, 0x200, 0x1E8, 0x0;
	byte starter2 : "Game.dll", 0xD321AB;
	string24 map : "Game.dll", 0xD3A536;
	string4 loadgame : "Game.dll", 0xCB1D2C, 0x2DC, 0x54, 0x0;
}

state("war3")
{
	uint igt : "Game.dll", 0xAB7E98;
	byte status : "Storm.dll", 0x5571C, 0x0, 0x0, 0x98, 0x278;
	string8 victorySplash : "Storm.dll", 0x554F0, 0x220, 0x1E8, 0x0;
	string7 starter1 : "Game.dll", 0xAACABC, 0x2DC, 0x54, 0x0;
	byte starter2 : "Game.dll", 0xAB55CB;
	string24 map : "Game.dll", 0xAAE7CE;
	string4 loadgame : "Game.dll", 0xAACABC, 0x2DC, 0x54, 0x0;
}

startup
{
	settings.Add("starttype", true, "On=Campaign mode; Off=Mission mode");
}

init
{
	vars.atInterlude = false;
	vars.prevPhase = null;
	vars.currIGT = 0;
	vars.totalIGT = 0;
	vars.storedIGT = 0;
	vars.reloadedTime = 0;
	vars.starter1Stored = "";
}

update
{
	if (!current.map.Contains("Interlude") && !vars.atInterlude) {//Don't include interludes
		vars.currIGT = current.igt;
	} else {
		vars.currIGT = 0;
		vars.atInterlude = true;
	}
	if (vars.prevPhase == TimerPhase.NotRunning && timer.CurrentPhase == TimerPhase.Running && !vars.atInterlude) {//New game
		vars.currIGT = 0;
		vars.totalIGT = 0;
		vars.storedIGT = 0;
		vars.reloadedTime = 0;
	}
	if (current.igt == 0 && old.igt > 0 && !vars.atInterlude) {//Beat mission
		vars.storedIGT += vars.reloadedTime + old.igt;
		vars.reloadedTime = 0;
	}
	if (current.igt > 500 && old.igt == 0 && !vars.atInterlude)//Reloaded
		vars.reloadedTime -= current.igt;
	vars.totalIGT = vars.storedIGT + vars.reloadedTime + vars.currIGT;
	vars.prevPhase = timer.CurrentPhase;
	
	if (current.starter1 != null) 
		vars.starter1Stored = current.starter1;
	if (current.igt > 0 && old.igt == 0 && !current.map.Contains("Interlude")) {
		vars.atInterlude = false;
	}
}

start
{
	if (settings["starttype"]) {
		return (current.starter2 < 16 && old.starter2 > 140);
/*		return (current.starter2 < 16 && old.starter2 > 140 && (
			vars.starter1Stored == "Chasing" ||
			vars.starter1Stored == "The Def" ||
			vars.starter1Stored == "Trudgin" ||
			vars.starter1Stored == "Landfal" ||
			vars.starter1Stored == "Enemies"));*/
	} else {
		return (current.status == 4 && current.igt == 0);
	};
}

/*reset
{
	return (current.status == 0 && current.igt == 0 && !settings["starttype"]);
}*/

split
{
	return (
			/*(current.status == 0 && old.status == 4 && current.loadgame != "Load") ||*/
			(current.loadgame == "Over" && old.loadgame == "Vict")  && !current.map.Contains("Interlude")
			);
}

isLoading
{
	return true;
}

gameTime
{
	return TimeSpan.FromMilliseconds(vars.totalIGT);
}
