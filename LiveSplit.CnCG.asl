state("generals_origin")
{
    byte cursorControl : "generals_origin.exe", 0x56D380, 0xA7;
    ushort victorySplash : "generals_origin.exe", 0x56D38C, 0xF;
    byte menuTransistion : "generals_origin.exe", 0x56B9F0, 0x74, 0x58, 0x3F;
    byte menuAssist : "generals_origin.exe", 0x56B9F0, 0x74, 0x58, 0x3E;
    byte map: "generals_origin.exe", 0x53FB1C;
    byte frameRate : "generals_origin.exe", 0x56AE98, 0x8;
    uint frameCounter : "generals_origin.exe", 0x56C97C;
}
state("generals")
{
    byte cursorControl : "generals.exe", 0x56D380, 0xA7;
    ushort victorySplash : "generals.exe", 0x56D38C, 0xF;
    byte menuTransistion : "generals.exe", 0x56B9F0, 0x74, 0x58, 0x3F;
    byte menuAssist : "generals.exe", 0x56B9F0, 0x74, 0x58, 0x3E;
    byte map : "generals.exe", 0x53FB1C;
    byte frameRate : "generals.exe", 0x56AE98, 0x8;
    uint frameCounter : "generals.exe", 0x56C97C;
}

startup
{
    vars.prevPhase = null;
	vars.lastCounter = 0;
    vars.storedIGT = 0;
    vars.currentIGT = 0;
    vars.totalIGT = 0;
    vars.divisor = 1f;
}

update
{
    if (vars.prevPhase == TimerPhase.NotRunning && timer.CurrentPhase == TimerPhase.Running) {//New game
        vars.lastCounter = current.frameCounter;
        vars.storedIGT = 0;
        vars.currentIGT = 0;
        vars.totalIGT = 0;
		vars.divisor = 1f;
    }
    if (current.map != old.map || current.frameRate != old.frameRate) {
        vars.storedIGT += vars.currentIGT;
		vars.lastCounter = current.frameCounter;
    }
    switch ((uint)current.frameRate) { // Framecounter/rate are weird
        case 20: vars.divisor = 980.105; break;
        case 23: vars.divisor = 966.25 ; break;
        case 30: vars.divisor = 960    ; break;
        default: vars.divisor = (1000 - current.frameRate); break;
    }
    if (current.map == 1) {
        vars.currentIGT = 0;
    } else {
        vars.currentIGT  = (current.frameCounter - vars.lastCounter) * vars.divisor / current.frameRate;
    }
    vars.totalIGT = vars.currentIGT + vars.storedIGT;
    vars.prevPhase = timer.CurrentPhase;
}

start
{
    return (current.victorySplash > 0 && old.victorySplash > 0 && current.menuTransistion == 250 && old.menuTransistion == 0 && current.menuAssist == 255 && old.menuAssist == 0); //trigger happy
}

split
{
    return (current.victorySplash == 268 && old.victorySplash != 268);
}

/*
isLoading
{
    if (current.cursorControl == 1 && old.cursorControl == 0)
        return false;
    if (current.map == 1 || (current.victorySplash == 268 && old.victorySplash != 268))
        return true;
    if (current.victorySplash > 0 && old.victorySplash > 0 && current.menuTransistion == 200 && old.menuTransistion == 250 && current.menuAssist == 255 && old.menuAssist == 255)
        return true;
}
*/
isLoading
{
    return true;
}

gameTime
{
    return TimeSpan.FromMilliseconds(vars.totalIGT);
}
