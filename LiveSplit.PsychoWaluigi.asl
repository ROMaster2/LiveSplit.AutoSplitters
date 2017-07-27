state("stdrt")
{
    string5 map : "stdrt.exe", 0x525B0, 0x10, 0x0;
    ushort igt : "MMFS2.dll", 0x46D88, 0x34;
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
}
