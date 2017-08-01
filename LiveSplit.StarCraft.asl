state("StarCraft")
{
    uint sortaIGT : "StarCraft.exe", 0xFEFA4;
    string12 victory : "StarCraft.exe", 0x250888, 0x2E8;
    byte starter1 : "storm.dll", 0x31217;
    byte starter2 : "storm.dll", 0x316B3;
}

init
{
    vars.starterA = false;
    vars.starterB = false;
    vars.nowStart = false;
}

update
{
    if (vars.nowStart == true) {
        vars.starterA = false;
        vars.starterB = false;
        vars.nowStart = false;
    }
    if (current.starter1 == 6 && old.starter1 < 5 && old.starter1 > 1)
        vars.starterA = true;
    if (current.starter2 < 5 && current.starter2 > 1 && old.starter2 == 234)
        vars.starterB = true;
    if (vars.starterA == true && vars.starterB == true)
        vars.nowStart = true;
}

start
{
    return (vars.nowStart); //testing
}

split
{
    return (current.victory == "ongratulatio" && old.victory != "ongratulatio");
}

gameTime
{
    if (timer.CurrentTime.RealTime.Value.TotalMilliseconds < 500)
        return TimeSpan.Zero;
}

isLoading {
    if (current.victory == "ongratulatio" || timer.CurrentTime.RealTime.Value.TotalMilliseconds < 500)
        return true;
    if (current.sortaIGT == 0)
        return false;
}
