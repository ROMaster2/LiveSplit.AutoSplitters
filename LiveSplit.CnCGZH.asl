state("generals_origin")
{
    byte cursorControl : "generals_origin.exe", 0x62B5FC, 0x48;
    ushort victorySplash : "generals_origin.exe", 0x56D38C, 0xF;
    ushort menuTransistion : "generals_origin.exe", 0x56B9F0, 0x47B0C8, 0x5F0, 0x228;
    byte map: "generals_origin.exe", 0x5F5700;
}

state("generals")
{
    byte cursorControl : "generals.exe", 0x62B5FC, 0x48;
    ushort victorySplash : "generals.exe", 0x56D38C, 0xF;
    ushort menuTransistion : "generals.exe", 0x47B0C8, 0x5F0, 0x228;
    byte map: "generals.exe", 0x5F5700;
}

start
{
    return (current.menuTransistion == 256 && old.menuTransistion == 1 && current.map == 1); //trigger happy
}

split
{
    return (current.victorySplash == 268 && old.victorySplash != 268);
}

isLoading
{
    if (current.cursorControl == 1 && old.cursorControl == 0)
        return false;
    if (current.map == 1 || (current.victorySplash == 268 && old.victorySplash != 268))
        return true;
}
