state("stdrt")
{
    string5 map : "stdrt.exe", 0x525B0, 0x10, 0x0;
    ushort igt : "MMFS2.dll", 0x46D88, 0x34;
    uint irisHealth : "stdrt.exe", 0x52534, 0x10, 0x1EF0, 0x1138;
}

start
{
    return (current.map == "Intro" && old.map == "File ");
}

split
{
    return (current.map == "Coin " && old.map != "Coin ") ||
    (current.map == "The F" && current.irisHealth == 0 && old.irisHealth > 0 && old.irisHealth < 13); //Final Boss
}

isLoading
{
    return current.igt == 65535;
}

gameTime {
    if (timer.CurrentTime.RealTime.Value.TotalMilliseconds < 2000)
        return TimeSpan.Zero;
}

/*Coin Total/SAVING
World *
Black Market*/
