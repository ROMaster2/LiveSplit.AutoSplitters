state("generals_origin")
{
    byte cursorControl : "generals_origin.exe", 0x56D380, 0xA7;
    ushort victorySplash : "generals_origin.exe", 0x56D38C, 0xF;
    byte menuTransistion : "generals_origin.exe", 0x56B9F0, 0x74, 0x58, 0x3F;
    byte menuAssist : "generals_origin.exe", 0x56B9F0, 0x74, 0x58, 0x3E;
}

state("generals")
{
    byte cursorControl : "generals.exe", 0x56D380, 0xA7;
    ushort victorySplash : "generals.exe", 0x56D38C, 0xF;
    byte menuTransistion : "generals.exe", 0x56B9F0, 0x74, 0x58, 0x3F;
    byte menuAssist : "generals.exe", 0x56B9F0, 0x74, 0x58, 0x3E;
}

start
{
    return (current.victorySplash > 0 && old.victorySplash > 0 && current.menuTransistion == 250 && old.menuTransistion == 0 && current.menuAssist == 255 && old.menuAssist == 0);
}

reset
{
}

split
{
    return (current.victorySplash == 268 && old.victorySplash != 268);
}

isLoading
{
    if (current.cursorControl == 1 && old.cursorControl == 0)
        return false;
    if (current.victorySplash == 268 && old.victorySplash != 268)
        return true;
    if (current.victorySplash > 0 && old.victorySplash > 0 && current.menuTransistion == 200 && old.menuTransistion == 250 && current.menuAssist == 255 && old.menuAssist == 255)
        return true;
}
