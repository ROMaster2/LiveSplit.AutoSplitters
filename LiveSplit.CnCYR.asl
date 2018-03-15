
startup // Wish it didn't need so many...
{
    vars.prevPhase = null;
    vars.totalIGT = 0;
    vars.storedIGT = 0;
    vars.reloadedTime = 0;
	vars.clampIGT = 0;
	vars.clampOldIGT = 0;
	vars.currentIGT = 0;
	vars.oldIGT = 0;
	vars.toggle = false;
}

update
{
    if (vars.prevPhase == TimerPhase.NotRunning && timer.CurrentPhase == TimerPhase.Running) { // New game
        vars.totalIGT = 0;
        vars.storedIGT = 0;
        vars.reloadedTime = 0;
 		vars.clampIGT = 2147483647;
		vars.clampOldIGT = 0;
		vars.currentIGT = 0;
		vars.oldIGT = 0;
		vars.toggle = false;
   }
	if (current.victorySplash == 0 && old.victorySplash == 255) {
		vars.clampIGT = current.igt;
		vars.clampOldIGT = current.igt;
		vars.toggle = true;
	}
	if (vars.toggle && current.igt == 0) {
		vars.clampIGT = 2147483647;
	}
	if (vars.toggle && old.igt == 0) {
		vars.clampOldIGT = 2147483647;
		vars.toggle = false;
	}
	vars.currentIGT = Math.Min(vars.clampIGT, current.igt);
	vars.oldIGT = Math.Min(vars.clampOldIGT, old.igt);
    if (current.igt == 0 && old.igt > 0) { // Beat mission
        vars.storedIGT += vars.reloadedTime + vars.oldIGT;
        vars.reloadedTime = 0;
    }
    if (old.igt > current.igt && current.igt > 0) // Reloaded
        vars.reloadedTime += vars.oldIGT - vars.currentIGT;
    vars.totalIGT = vars.storedIGT + vars.reloadedTime + vars.currentIGT;
    vars.prevPhase = timer.CurrentPhase;
}

start
{
    return ((current.menuTransition == 1 && old.menuTransition == 0 && current.currentScreen == 148) || (current.igt > 0 && old.igt == 0));
}

reset
{
}

split
{
    return (!(old.battleControl == 1 && old.menuControl == 1) && current.victorySplash == 0 && old.victorySplash == 255);
}
/*
isLoading
{
    if ((current.victorySplash == 0 && old.victorySplash == 255) || current.currentScreen == 148)
        return true;
    if (current.victorySplash == 255 && current.battleControl == 0 && old.battleControl == 1)
        return false;
}
*/
isLoading
{
    return true;
}

gameTime
{
    return TimeSpan.FromMilliseconds(vars.totalIGT * 32);
}
