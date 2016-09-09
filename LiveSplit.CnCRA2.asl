state("Game")
{
    byte battleControl : "Game.exe", 0x132C7C, 0x0;
    byte menuControl : "Game.exe", 0x132C7C, 0x1;
    byte victorySplash : "Game.exe", 0x43996C, 0xA4;
    byte missionIndex : "Game.exe", 0x63D290, 0x83F;
    byte menuTransition : "Game.exe", 0x6D081C, 0x6E4, 0x54;
    byte currentScreen : "Game.exe", 0x1FF6C4, 0x0;
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
    return ((!(old.battleControl == 1 && old.menuControl == 1) && current.victorySplash == 0 && old.victorySplash == 255 && current.missionIndex == 12849) || (current.currentScreen == 3 && old.currentScreen != 3));
}

isLoading
{
    if ((current.victorySplash == 0 && old.victorySplash == 255) || current.currentScreen == 148)
        return true;
    if (current.victorySplash == 255 && current.battleControl == 0 && old.battleControl == 1)
        return false;
}
