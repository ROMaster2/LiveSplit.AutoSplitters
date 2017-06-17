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
    vars.indexes = new byte[11] {3, 9, 1, 0,  5, 1, 3,  136, 140,  0, 118};
    int ver = 0;
    print(modules.First().EntryPointAddress.ToString());//7927023 -- 9140272 
    print(modules.First().ModuleMemorySize.ToString());//4942318 -- 4952064
    if (modules.First().ModuleMemorySize == 4952064) ver = 0; //Origins
    if (modules.First().ModuleMemorySize == 4942318) ver = 1; //The First Decade (w/Patch)
    switch(ver) {
        case 0:
            vars.indexes[ 0] =   3;
            vars.indexes[ 1] =   9;
            vars.indexes[ 2] =   1;
            vars.indexes[ 3] =   0;
            vars.indexes[ 4] =   5;
            vars.indexes[ 5] =   1;
            vars.indexes[ 6] =   3;
            vars.indexes[ 7] = 136;
            vars.indexes[ 8] = 140;
            vars.indexes[ 9] =   0;
            vars.indexes[10] = 118;
            break;
        case 1:
            vars.indexes[ 0] =   3;//
            vars.indexes[ 1] =   9;//
            vars.indexes[ 2] =   1;//
            vars.indexes[ 3] =   0;
            vars.indexes[ 4] =   5;//
            vars.indexes[ 5] =   1;
            vars.indexes[ 6] =   3;//
            vars.indexes[ 7] =  67;//
            vars.indexes[ 8] =  67;//
            vars.indexes[ 9] =   0;//
            vars.indexes[10] = 118;//
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
    if (old.igt > current.igt && current.igt > 0 && current.menu1 != vars.indexes[0])//reloaded
        vars.reloadedTime += old.igt - current.igt;
    if (current.igt == 0 && old.igt > 0 && current.menu1 != vars.indexes[0]) {//Beat mission
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
    return (current.menu1 == vars.indexes[0] && (current.menu2 == vars.indexes[4] || current.menu2 == 6) && old.start1 == vars.indexes[7] && current.start1 == vars.indexes[8] && old.start2 == vars.indexes[9] && current.start2 == vars.indexes[10]);
}

reset
{
    if (timer.CurrentTime.RealTime.Value.TotalMilliseconds > 400) {
        return (current.menu1 == vars.indexes[1] && current.menu2 == vars.indexes[5] && old.menu2 == vars.indexes[6] && current.start1 == vars.indexes[8] && current.start2 == vars.indexes[10]);
    } else {
        return (current.menu2 == vars.indexes[6] || current.menu2 == 4);
    }
}

split
{
    return (current.menu1 == vars.indexes[2] && current.menu2 == vars.indexes[6] && old.menu1 == vars.indexes[3] && old.menu2 == vars.indexes[5]);
}

isLoading
{
    return true;
}

gameTime
{
    if (current.menu1 != vars.indexes[0]) {
        return TimeSpan.FromMilliseconds(vars.totalIGT);
    } else {
        return TimeSpan.Zero;
    }
}
