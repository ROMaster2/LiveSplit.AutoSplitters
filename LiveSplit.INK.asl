state("INK")
{
    byte levelID: "INK.exe", 0x59D310;
//    string10 igt: "INK.exe", 0x59F51C, 0x451;
}

start
{
    return (current.levelID == 3 && old.levelID == 2);
}

split
{
    return (current.levelID > old.levelID);
}

gameTime
{
//    return TimeSpan.Parse(current.igt);
}

reset
{
    return (current.levelID == 2 && old.levelID > 2);
}
