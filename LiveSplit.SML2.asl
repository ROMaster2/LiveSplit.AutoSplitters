state("bgb")
{
    byte levelIndex : "bgb.exe", 0x164EBC, 0x4, 0x24, 0x1276;
    byte save1LevelCount : "bgb.exe", 0x164EBC, 0xC, 0x34, 0x42;
//  byte currentLevelCount : "bgb.exe", 0x164EBC, 0xC, 0x34, 0x2C5;
    byte fsx : "bgb.exe", 0x164EBC, 0x1D8, 0x0;
    byte fsy : "bgb.exe", 0x164EBC, 0x1D8, 0x15;
    ushort music1 : "bgb.exe", 0x164EBC, 0xC, 0x34, 0x414;
    ushort music2 : "bgb.exe", 0x164EBC, 0xC, 0x34, 0x424;
    uint frameCounter : "bgb.exe", 0x164E7C, 0x108;
    byte bossHealth : "bgb.exe", 0x164EBC, 0xC, 0x34, 0xFC5;
}

state("gambatte_qt_win32-r571")
{
    byte levelIndex : "gambatte_qt_win32-r571.exe", 0x552038, 0x5C, 0x508, 0x1276;
    byte save1LevelCount : "gambatte_qt_win32-r571.exe", 0x552038, 0x5C, 0x108, 0x42;
    byte fsx : "gambatte_qt_win32-r571.exe", 0x552038, 0x5C, 0x148;
    byte fsy : "gambatte_qt_win32-r571.exe", 0x552038, 0x5C, 0x15D;
    ushort music1 : "gambatte_qt_win32-r571.exe", 0x5520C4, 0x3DC, 0xDD8, 0x414;
    ushort music2 : "gambatte_qt_win32-r571.exe", 0x5520C4, 0x3DC, 0xDD8, 0x424;
    uint frameCounter : "gambatte_qt_win32-r571.exe", 0x552038, 0x88, 0xB8, 0x17C, 0x100;
    byte bossHealth : "gambatte_qt_win32-r571.exe", 0x552038, 0xC, 0x11E8, 0xFC5;
}

state("gambatte")
{
    byte levelIndex : "gambatte.exe", 0x552038, 0x5C, 0x508, 0x1276;
    byte save1LevelCount : "gambatte.exe", 0x552038, 0x5C, 0x108, 0x42;
    byte fsx : "gambatte.exe", 0x552038, 0x5C, 0x148;
    byte fsy : "gambatte.exe", 0x552038, 0x5C, 0x15D;
    ushort music1 : "gambatte.exe", 0x5520C4, 0x3DC, 0xDD8, 0x414;
    ushort music2 : "gambatte.exe", 0x5520C4, 0x3DC, 0xDD8, 0x424;
    uint frameCounter : "gambatte.exe", 0x552038, 0x88, 0xB8, 0x17C, 0x100;
    byte bossHealth : "gambatte.exe", 0x552038, 0xC, 0x11E8, 0xFC5;
}

startup
{
    settings.Add("bosssplit", false, "Split on entering boss area and each Wario phase.");
    settings.Add("himom", false, "^^ will split again if die and retry.");
}

init
{
    vars.gtStart = 0;
    vars.finalWario = false;
}

update
{
    if (current.music1 == 30219 && old.music1 == 30218 && current.music2 == 30240 && old.music2 == 30239 && current.bossHealth == 6)
        vars.finalWario = true;
    if (current.levelIndex == 255 && current.save1LevelCount == 0 && current.fsy == 40 && current.fsx > 112 && old.fsx == 112)
        vars.gtStart = current.frameCounter;
    if (current.levelIndex != 0)
        vars.finalWario = false;
}

start
{
    return (current.levelIndex == 255 && current.save1LevelCount == 0 && current.fsy == 40 && current.fsx > 112 && old.fsx == 112);
}

reset
{
    return (current.levelIndex == 255 && current.save1LevelCount == 0 && old.save1LevelCount > 0);
}

split
{
    return (
        (current.music1 == 24247 && old.music1 == 24245 && current.music2 == 24272 && old.music2 == 24270) ||
        (current.music1 == 26898 && old.music1 == 26897 && current.music2 == 26943 && old.music2 == 26942) ||
        (settings["bosssplit"] && current.bossHealth == 6 && old.bossHealth == 0) ||
        (vars.finalWario && current.bossHealth == 0) // Will not stop splitting at this point since the game is done.
    );
}

gameTime
{
    return TimeSpan.FromMilliseconds((current.frameCounter - vars.gtStart) * 1000 / 60); // Might actually be 59.727500569606 or 59.94. Sue me.
}
