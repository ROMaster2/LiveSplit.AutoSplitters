state("INK", "child")
{
    byte levelID: "INK.exe", 0x59D310;
    float igt: "gameoverlayrenderer.dll", 0x10203C;
}

init
{
    refreshRate = 30;
    if (modules.First().ModuleMemorySize == 4163584)
    {
    	version = "child";
    }
    vars.igtStart = 0f;
}

update
{
    if (current.levelID == 3 && old.levelID == 2)
        vars.igtStart = current.igt;
}

start
{
    return (current.levelID == 3 && old.levelID == 2);
}

split
{
    return (current.levelID > old.levelID);
}

//gameTime
//{
//    return TimeSpan.FromSeconds(current.igt - vars.igtStart);
//}

isLoading
{
    return current.igt == old.igt;
}

reset
{
    return (current.levelID == 2 && old.levelID > 2);
}
