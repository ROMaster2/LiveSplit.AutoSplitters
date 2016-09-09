state("gamemo")
{
    byte battleControl : "gamemo.exe", 0x14F9AC, 0x0;
    byte menuControl : "gamemo.exe", 0x14F9AC, 0x1;
    byte victorySplash : "gamemo.exe", 0x487324, 0xA4;
    string8 missionName : "gamemo.exe", 0x68B230, 0x125D;
    byte menuTransition : "gamemo.exe", 0x71D37C, 0x171C, 0x2F4;
    byte currentScreen : "gamemo.exe", 0x222704, 0x0;
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
    return ((!(old.battleControl == 1 && old.menuControl == 1) && current.victorySplash == 0 && old.victorySplash == 255 && (current.missionName == "SUNLIGHT" || current.missionName == "DRAGON." || current.missionName == "MOON.MAP")) || (current.currentScreen == 3 && old.currentScreen != 3));
}

isLoading
{
    if ((current.victorySplash == 0 && old.victorySplash == 255) || current.currentScreen == 148)
        return true;
    if (current.victorySplash == 255 && current.battleControl == 0 && old.battleControl == 1)
        return false;
}
