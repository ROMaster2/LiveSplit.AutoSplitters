state("Game")
{
    uint igt : "Game.exe", 0x455ED0;
}

init
{
    vars.totalIGT = 0;
}

update
{
    if (timer.CurrentTime.RealTime < TimeSpan.FromSeconds(10.0))
        vars.totalIGT = 0;
    if (current.igt == 0 && old.igt > 0)
        vars.totalIGT = vars.totalIGT + old.igt;
}

start
{
    return current.igt == 123456789;
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
    return TimeSpan.FromMilliseconds(vars.totalIGT + current.igt);
}
