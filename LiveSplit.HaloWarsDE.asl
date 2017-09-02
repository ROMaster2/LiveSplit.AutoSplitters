state("xgameFinal")
{
    uint igt : "xgameFinal.exe", 0x1620AB0, 0x18, 0xB0, 0x48, 0x0, 0x244;
    uint starter : "xgameFinal.exe", 0x1626070, 0x8, 0xC0, 0x0, 0x230, 0x0;
}

init
{
}

startup
{
    vars.prevPhase = null;
    vars.totalIGT = 0;
    vars.storedIGT = 0;
}

update
{
    if (vars.prevPhase == TimerPhase.NotRunning && timer.CurrentPhase == TimerPhase.Running) {//New game
        vars.totalIGT = 0;
        vars.storedIGT = 0;
    }
    if (old.igt > current.igt)
        vars.storedIGT += old.igt - current.igt;
    vars.totalIGT = vars.storedIGT + current.igt;
    vars.prevPhase = timer.CurrentPhase;
}

start
{
    return (current.starter == null && old.starter > 0);
}

reset
{
}

split
{
}

isLoading
{
    return true;
}

gameTime
{
    if (timer.CurrentTime.RealTime.Value.TotalMilliseconds > 2000) {
        return TimeSpan.FromMilliseconds(vars.totalIGT);
    } else {
        return TimeSpan.Zero;
    }
}
