state("Project64")
{
    int inGameTimeF1 : "Project64.exe", 0x1002FC, 0x207704;
    int inGameTimeF2 : "Project64.exe", 0x1002FC, 0x207774;
    int inGameTimeF3 : "Project64.exe", 0x1002FC, 0x2077E4;
    int inGameTimeF4 : "Project64.exe", 0x1002FC, 0x207854;
    int inGameTimeUpdater : "Project64.exe", 0x1002FC, 0x370014;
    byte fileSelected : "Project64.exe", 0x1002FC, 0x32DDF6; //This'll be added later
}

start
{
    return (current.fileSelected == 1 && old.fileSelected == 0);
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
    if (current.fileSelected > 1)
    return TimeSpan.FromMilliseconds((current.inGameTimeF1 + current.inGameTimeF2 + current.inGameTimeF3 + current.inGameTimeF4 + current.inGameTimeUpdater)*1000/30);
}
