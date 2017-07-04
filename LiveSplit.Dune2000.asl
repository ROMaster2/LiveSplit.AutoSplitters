state("dune2000-spawn")
{
    byte starter : "dune2000-spawn.exe", 0x395608;
    byte victorySplash : "dune2000-spawn.exe", 0x117400;
    byte splitter : "dune2000-spawn.exe", 0xDE604;
    byte reseter : "dune2000-spawn.exe", 0x397A98;
    byte isInGame : "dune2000-spawn.exe", 0x113F28;
}

start
{
    return (current.starter == 0 && old.starter == 0);
}

reset
{
//    return current.reseter == 111;
}

split
{
    if (timer.CurrentTime.RealTime.Value.TotalMilliseconds > 30000)
        return (current.splitter == 1 && old.splitter == 0);
}

isLoading
{
    return !(current.isInGame == 1 && current.victorySplash == 0);
}

gameTime
{
    if (timer.CurrentTime.RealTime.Value.TotalMilliseconds < 2000)
        return TimeSpan.Zero;
}
