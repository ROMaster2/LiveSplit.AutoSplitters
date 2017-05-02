state("INK")
{
    byte levelID: "INK.exe", 0x59D310;
    float igt: "gameoverlayrenderer.dll", 0x10203C;
}

init
{
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

gameTime
{
    return TimeSpan.FromSeconds(current.igt - vars.igtStart);
}

//isLoading
//{
//    return true;
//}

reset
{
    return (current.levelID == 2 && old.levelID > 2);
}
