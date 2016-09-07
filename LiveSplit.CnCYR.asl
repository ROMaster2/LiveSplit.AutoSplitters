state("gamemd")
{
    uint battleControl : "gamemd.exe", 0x425C28, 0xC;
    uint victorySplash : "gamemd.exe", 0x487324, 0xA4;
    byte missionIndex : "gamemd.exe", 0x68B230, 0x1260;
    byte scoreScreen : "gamemd.exe", 0xF4B5C, 0x0;
    byte startCampaign : "gamemd.exe", 0x47E298, 0x8, 0xF4;
    byte currentScreen : "gamemd.exe", 0xD8998, 0x260;
}

start
{
    return (current.startCampaign != 0 && old.startCampaign == 0 && current.currentScreen == 64);
}

reset
{
    return ((old.currentScreen == 20 && current.currentScreen == 64) || (old.currentScreen == 64 && current.currentScreen == 232));
}

split
{
    return ((old.battleControl != 257 && current.victorySplash == 0 && old.victorySplash != 0 && current.missionIndex == 55) || (current.battleControl == 257 && current.victorySplash == 0 && current.scoreScreen != 0 && old.scoreScreen == 0));
}

isLoading
{
    if ((current.victorySplash == 0 && old.victorySplash != 0) || current.currentScreen == 64)
        return true;
    if (current.victorySplash != 0 && current.battleControl == 0 && old.battleControl == 1)
        return false;
}
