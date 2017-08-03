state("stdrt")
{
    string5 map : "stdrt.exe", 0x525B0, 0x10, 0x0;
    ushort igt : "MMFS2.dll", 0x46D88, 0x34;
}

init
{
    //vars.igtAll = 0;
}

update
{
    //if (current.igt 
}

start
{
    return (current.map == "Intro" && old.map == "File ");
}

reset
{
}

split
{
    return (current.map == "Coin " && old.map != "Coin ");
}

isLoading
{
    return current.igt == 65535;
}

gameTime {
    if (timer.CurrentTime.RealTime.Value.TotalMilliseconds < 500)
        return TimeSpan.Zero;
}

/*Coin Total/SAVING
World *
Black Market*/
