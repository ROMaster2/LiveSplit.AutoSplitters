state("Warcraft III")
{
	uint igt : "Warcraft III.exe", 0xD78A5C;
	byte status : "Warcraft III.exe", 0xD61B18, 0x400;
	string8 victorySplash : "Warcraft III.exe", 0x648D24, 0x174, 0x54, 0x0;
//	string7 starter1 : "Game.dll", 0xCB1C94, 0x200, 0x1E8, 0x0;
//	byte starter2 : "Game.dll", 0xD321AB;
	string24 map : "Warcraft III.exe", 0xD3F89E;
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
	
	if (current.igt > 0 && old.igt == 0 && !current.map.Contains("Interlude")) {
		vars.atInterlude = false;
	}
}

start
{
	return (current.status == 4 && current.igt == 0);
}

split
{
	return (
			(current.victorySplash == "Overview" && old.victorySplash == "Victory!")  && !current.map.Contains("Interlude")
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
