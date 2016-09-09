state("gamemd")
{
    byte battleControl : "gamemd.exe", 0x14F9AC, 0x0;
    byte menuControl : "gamemd.exe", 0x14F9AC, 0x1;
    byte victorySplash : "gamemd.exe", 0x487324, 0xA4;
    byte missionIndex : "gamemd.exe", 0x68B230, 0x1260;
    byte menuTransition : "gamemd.exe", 0x71D37C, 0x6DC, 0x0, 0x0, 0x2E4;
    byte currentScreen : "gamemd.exe", 0x222704, 0x0;
}

start
{
    return (current.menuTransition == 1 && old.menuTransition == 0 && current.currentScreen == 148);
}

reset
{
}

split
{
    return ((!(old.battleControl == 1 && old.menuControl == 1) && current.victorySplash == 0 && old.victorySplash == 255 && current.missionIndex == 55) || (current.currentScreen == 3 && old.currentScreen != 3));
}

isLoading
{
    if ((current.victorySplash == 0 && old.victorySplash == 255) || current.currentScreen == 148)
        return true;
    if (current.victorySplash == 255 && current.battleControl == 0 && old.battleControl == 1)
        return false;
}
