state("gamemd")
{
    byte battleControl : "gamemd.exe", 0x14F9AC, 0x0;
    byte menuControl : "gamemd.exe", 0x14F9AC, 0x1;
    byte victorySplash : "gamemd.exe", 0x487324, 0xA4;
    uint igt : "gamemd.exe", 0x49F95C;
//  byte reseter : "gamemd.exe", 0x68B230, 0x61C;
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
    if (vars.prevPhase == TimerPhase.NotRunning && timer.CurrentPhase == TimerPhase.Running) { // New game
        vars.totalIGT = 0;
        vars.storedIGT = 0;
        vars.reloadedTime = 0;
    }
    if (current.igt == 0 && old.igt > 0) { // Beat mission
        vars.storedIGT += vars.reloadedTime + old.igt;
        vars.reloadedTime = 0;
    }
    if (old.igt > current.igt && current.igt > 0) // Reloaded
        vars.reloadedTime += old.igt - current.igt;
    vars.totalIGT = vars.storedIGT + vars.reloadedTime + current.igt;
    vars.prevPhase = timer.CurrentPhase;
}

start
{
    return (current.igt > 0 && old.igt == 0);
}

split
{
    return (!(old.battleControl == 1 && old.menuControl == 1) && current.victorySplash == 0 && old.victorySplash == 255);
}

isLoading
{
    return true;
}

gameTime
{
    return TimeSpan.FromMilliseconds(vars.totalIGT * 32);
}
