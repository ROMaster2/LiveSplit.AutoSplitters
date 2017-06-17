state("cnc3game.dat")
{
    byte resumer : "cnc3game.dat", 0x81135C;
    byte starter : "cnc3game.dat", 0x80CA5C, 0x1F;
    byte victory : "cnc3game.dat", 0x8128FC, 0x228;
}

start
{
    return (current.starter > 0 && old.starter == 0);
}

reset
{
    //return (current.starter == 0 && old.starter > 0);
}

split
{
    return (current.victory == 1 && old.victory == 0);
}

isLoading
{
    if (current.victory == 1 || timer.CurrentTime.RealTime.Value.TotalMilliseconds < 500)
        return true;
    if (current.resumer == 1 && old.resumer == 0)
        return false;
}

gameTime
{
    if (timer.CurrentTime.RealTime.Value.TotalMilliseconds < 500)
        return TimeSpan.Zero;
}
