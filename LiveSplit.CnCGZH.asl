state("game.dat")
{
    byte cursorControl : "game.dat", 0x61A9C0, 0x48;
  //ushort victorySplash : "game.dat", 0x60A7A0, 0x10;
  //ushort menuTransistion : "game.dat", 0x61AC64, 0x330, 0x5BC, 0xEC;
    byte map: "game.dat", 0x62A340;
}

state("generals_origin")
{
    byte cursorControl : "generals_origin.exe", 0x62B5FC, 0x48;
    ushort victorySplash : "generals_origin.exe", 0x62C018, 0x10;
    ushort menuTransistion : "generals_origin.exe", 0x62B8A0, 0x330, 0x5BC, 0xEC;
    byte map: "generals_origin.exe", 0x5F5700;
}

state("generals")
{
    byte cursorControl : "generals.exe", 0x62B5FC, 0x48;
    ushort victorySplash : "generals.exe", 0x62C018, 0x10;
    ushort menuTransistion : "generals.exe", 0x62B8A0, 0x330, 0x5BC, 0xEC;
    byte map: "generals.exe", 0x5F5700;
}

start
{
    return ((current.menuTransistion == 256 && old.menuTransistion == 1 && current.map == 1) || (current.cursorControl == 1 && old.cursorControl == 0));
}

split
{
    return (current.victorySplash == 1 && old.victorySplash == 0 && current.map > 1);
}

isLoading
{
    if (current.map == 1 || (current.victorySplash == 1 && old.victorySplash == 0 && current.map > 1))
        return true;
    if (current.cursorControl == 1 && old.cursorControl == 0)
        return false;
}

gameTime
{
    if (current.map == 1 && timer.CurrentTime.RealTime.Value.TotalMilliseconds < 500)
        return TimeSpan.Zero;
}
