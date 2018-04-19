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
    byte frameRate : "generals_origin.exe", 0x629B00, 0x8;
    uint frameCounter : "generals_origin.exe", 0x62B5D4;
}


state("generals")
{
    byte cursorControl : "generals.exe", 0x62B5FC, 0x48;
    ushort victorySplash : "generals.exe", 0x62C018, 0x10;
    ushort menuTransistion : "generals.exe", 0x62B8A0, 0x330, 0x5BC, 0xEC;
    byte map : "generals.exe", 0x5F5700;
    byte frameRate : "generals.exe", 0x629B00, 0x8;
    uint frameCounter : "generals.exe", 0x62B5D4;
}

startup
{
    vars.prevPhase = null;
    vars.lastCounter = 0;
    vars.storedIGT = 0;
    vars.currentIGT = 0;
    vars.totalIGT = 0;
}

update
{
    if (vars.prevPhase == TimerPhase.NotRunning && timer.CurrentPhase == TimerPhase.Running) {//New game
        vars.lastCounter = current.frameCounter;
        vars.storedIGT = 0;
        vars.currentIGT = 0;
        vars.totalIGT = 0;
    }
    if (current.map != old.map || current.frameRate != old.frameRate) {
        vars.storedIGT += vars.currentIGT;
        vars.lastCounter = current.frameCounter;
    }
    if (current.map == 1) {
        vars.currentIGT = 0;
    } else {
        vars.currentIGT  = (current.frameCounter - vars.lastCounter) * Math.Floor((1000f / current.frameRate) - 1f);
    }
    vars.totalIGT = vars.currentIGT + vars.storedIGT;
    vars.prevPhase = timer.CurrentPhase;
}

start
{
    return ((current.menuTransistion == 256 && old.menuTransistion == 1 && current.map == 1) || (current.cursorControl == 1 && old.cursorControl == 0)); //trigger happy
}

split
{
    return (current.victorySplash == 1 && old.victorySplash == 0 && current.map > 2);
}

isLoading
{
    return true;
}

gameTime
{
    return TimeSpan.FromMilliseconds(vars.totalIGT);
}
