state("bgb")
{
    byte levelIndex : "bgb.exe", 0x164EBC, 0x4, 0x24, 0x1276;
    byte save1LevelCount : "bgb.exe", 0x164EBC, 0xC, 0x34, 0x42;
//  byte currentLevelCount : "bgb.exe", 0x164EBC, 0xC, 0x34, 0x2C5;
    byte fsx : "bgb.exe", 0x164EBC, 0x1D8, 0x0;
    byte fsy : "bgb.exe", 0x164EBC, 0x1D8, 0x15;
    ushort music1 : "bgb.exe", 0x164EBC, 0xC, 0x34, 0x414;
    ushort music2 : "bgb.exe", 0x164EBC, 0xC, 0x34, 0x424;
}

state("gambatte_qt_win32-r571")
{
    byte levelIndex : "gambatte_qt_win32-r571.exe", 0x552038, 0x5C, 0x508, 0x1276;
    byte save1LevelCount : "gambatte_qt_win32-r571.exe", 0x552038, 0x5C, 0x108, 0x42;
    byte fsx : "gambatte_qt_win32-r571.exe", 0x552038, 0x5C, 0x148;
    byte fsy : "gambatte_qt_win32-r571.exe", 0x552038, 0x5C, 0x15D;
    ushort music1 : "gambatte_qt_win32-r571.exe", 0x5520C4, 0x3DC, 0xDD8, 0x414;
    ushort music2 : "gambatte_qt_win32-r571.exe", 0x5520C4, 0x3DC, 0xDD8, 0x424;
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
        (current.music1 == 26898 && old.music1 == 26897 && current.music2 == 26943 && old.music2 == 26942)
    );
}

