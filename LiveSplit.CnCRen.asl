state("Game")
{
    uint igt : "Game.exe", 0x455ED0;
}

startup
{
    vars.prevPhase = null;
    vars.loadedTime = 0;
}

update
{
    if (current.igt == 0 && old.igt > 0)
        vars.loadedTime += old.igt;
    if (timer.CurrentPhase == TimerPhase.Running && vars.prevPhase == TimerPhase.NotRunning)
        vars.loadedTime = 0;
    vars.prevPhase = timer.CurrentPhase;
}

start
{
    return current.igt == 0 && old.igt > 0;
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
    return TimeSpan.FromMilliseconds(current.igt + vars.loadedTime);
}
