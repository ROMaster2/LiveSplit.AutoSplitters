state("Game")
{
    uint igt : "Game.exe", 0x455ED0;
    byte menu1 : "Game.exe", 0x42FE64;
    byte menu2 : "Game.exe", 0x42FE20, 0x4;
    byte start1 : "Game.exe", 0x14EA48, 0x30C;
    byte start2 : "Game.exe", 0x458A8, 0x16;
}

init
{
	refreshRate = 30;
    vars.ind = new byte[2] {136, 140};
    switch(modules.First().ModuleMemorySize) {
        case 4952064: //Origins
            vars.ind[0] = 136;
            vars.ind[1] = 140;
            break;
        case 4942318: //The First Decade (w/Patch)
            vars.ind[0] =  67;
            vars.ind[1] =  67;
            break;
        default:
            break;
    }
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
    vars.totalIGT = vars.storedIGT + vars.reloadedTime + current.igt;
    if (old.igt > current.igt && current.igt > 0 && current.menu1 != 3)//reloaded
        vars.reloadedTime += old.igt - current.igt;
    if (current.igt == 0 && old.igt > 0 && current.menu1 != 3) {//Beat mission
        vars.storedIGT += vars.reloadedTime + old.igt;
        vars.reloadedTime = 0;
    }
    if (timer.CurrentPhase == TimerPhase.Running && vars.prevPhase == TimerPhase.NotRunning) {//New game
        vars.totalIGT = 0;
        vars.storedIGT = 0;
        vars.reloadedTime = 0;
    }
    vars.prevPhase = timer.CurrentPhase;
}

start
{
    return (current.menu1 == 3 && (current.menu2 == 5 || current.menu2 == 6) && old.start1 == vars.ind[0] && current.start1 == vars.ind[1] && old.start2 == 0 && current.start2 == 118);
}

reset
{
    if (timer.CurrentTime.RealTime.Value.TotalMilliseconds > 400) {
        return (current.menu1 == 9 && current.menu2 == 1 && old.menu2 == 3 && current.start1 == vars.ind[1] && current.start2 == 118);
    } else {
        return (current.menu2 == 3 || current.menu2 == 4);
    }
}

split
{
    return (current.menu1 == 1 && current.menu2 == 3 && old.menu1 == 0 && old.menu2 == 1);
}

isLoading
{
    return true;
}

gameTime
{
    if (current.menu1 != 3) {
        return TimeSpan.FromMilliseconds(vars.totalIGT);
    } else {
        return TimeSpan.Zero;
    }
}
