state("Generals_Origin")
{
    byte cursorControl : "Generals_Origin.exe", 0x56D380, 0xA7;
    ushort victorySplash : "Generals_Origin.exe", 0x56D38C, 0xF;
    byte menuTransistion : "Generals_Origin.exe", 0x56B9F0, 0x74, 0x58, 0x3F;
    byte menuAssist : "Generals_Origin.exe", 0x56B9F0, 0x74, 0x58, 0x3E;
    byte map: "Generals_Origin.exe", 0x53FB1C;
}

start
{
    return ((current.victorySplash > 0 && old.victorySplash > 0 && current.menuTransistion == 250 && old.menuTransistion == 0 && current.menuAssist == 255 && old.menuAssist == 0) || (current.cursorControl == 1 && old.cursorControl == 0 && current.map > 1)); //trigger happy
}

split
{
    return (current.victorySplash > 255 && old.victorySplash <= 255);
}

isLoading
{
    if (current.victorySplash > 255)
        return true;
    if (current.cursorControl == 1 && old.cursorControl == 0 && current.map > 1)
        return false;
    if (current.victorySplash > 0 && old.victorySplash > 0 && current.menuTransistion == 200 && old.menuTransistion == 250 && current.menuAssist == 255 && old.menuAssist == 255 && current.map == 1)
        return true;
}

gameTime
{
    if (current.map == 1 && timer.CurrentTime.RealTime.Value.TotalMilliseconds < 500)
        return TimeSpan.Zero;
}
