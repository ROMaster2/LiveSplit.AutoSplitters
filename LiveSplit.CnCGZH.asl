state("game")//10C3C
{
    byte cursorControl : "game.dat", 0x61A9C0, 0x48;
    ushort victorySplash : "game.dat", 0x60A7A0, 0x10;
    ushort menuTransistion : "game.dat", 0x61AC64, 0x330, 0x5BC, 0xEC;
    byte map: "game.dat", 0x5E4AC4;
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

isLoading
{
    return current.cursorControl == 1;
}
