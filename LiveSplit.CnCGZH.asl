state("generals_origin")
{
    byte cursorControl : "generals_origin.exe", 0x62B5FC, 0x48;
    ushort victorySplash : "generals_origin.exe", 0x56D38C, 0xF;
    ushort menuTransistion : "generals_origin.exe", 0x62B8A0, 0x330, 0x5BC, 0xEC;
    byte map: "generals_origin.exe", 0x5F5700;
}

state("generals")
{
    byte cursorControl : "generals.exe", 0x62B5FC, 0x48;
    ushort victorySplash : "generals.exe", 0x56D38C, 0xF;
    ushort menuTransistion : "generals.exe", 0x62B8A0, 0x330, 0x5BC, 0xEC;
    byte map: "generals.exe", 0x5F5700;
}

start
{
    return (current.menuTransistion == 256 && old.menuTransistion == 1 && current.map == 1);
}

split
{
    return (current.victorySplash == 268 && old.victorySplash != 268);
}

isLoading
{
    if (current.map == 1 || (current.victorySplash == 268 && old.victorySplash != 268))
        return true;
    if (current.cursorControl == 1 && old.cursorControl == 0)
        return false;
}
