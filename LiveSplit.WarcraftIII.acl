state("War3")
{
    uint igt : "Game.dll", 0xBE3D70;
//  string24 map : "Game.exe", 0xBEE196; 
    byte status : "Game.dll", 0xBB8894, 0x208, 0x34, 0x10, 0x8, 0x278;
    
    string8 victorySplash : "Storm.dll", 0x57268, 0x238, 0x1E8, 0x0;
    
    string7 starter1 : "Game.dll", 0xB6655C, 0x2DC, 0x54, 0x0;
    byte starter2 : "Game.dll", 0xBE5E0B;
}

init
{
}

startup
{
    vars.prevPhase = null;
    vars.totalIGT = 0;
    vars.storedIGT = 0;
    vars.reloadedTime = 0;
}

update
{
    if (vars.prevPhase == TimerPhase.NotRunning && timer.CurrentPhase == TimerPhase.Running) {//New game
        vars.totalIGT = 0;
        vars.storedIGT = 0;
        vars.reloadedTime = 0;
    }
    if (current.igt == 0 && old.igt > 0) {//Beat mission
        vars.storedIGT += vars.reloadedTime + old.igt;
        vars.reloadedTime = 0;
    }
    if (current.igt > 500 && old.igt == 0)//Reloaded
        vars.reloadedTime -= current.igt;
    vars.totalIGT = vars.storedIGT + vars.reloadedTime + current.igt;
    vars.prevPhase = timer.CurrentPhase;
}

start
{
    return (current.status == 4 || (current.starter2 < 16 && old.starter2 > 140 && (
    old.starter1 == "Chasing" || // Only trigger on mission clicks, not campaign clicks 
    old.starter1 == "The Def" || // Will need to fix for clean files or All Campaign runs
    old.starter1 == "Trudgin" ||
    old.starter1 == "Landfal" ||
    old.starter1 == "Enemies")));
}

reset
{
}

split
{
    return (current.victorySplash == "Victory!" && old.victorySplash != "Victory!");
}

isLoading
{
    return true;
}

gameTime
{
    if (!(timer.CurrentTime.RealTime.Value.TotalMilliseconds < 500 && current.status == 0)) {
        return TimeSpan.FromMilliseconds(vars.totalIGT);
    } else {
        return TimeSpan.Zero;
    };
}
