state("Project64", "1.6")
{
    int file1IGT : "Project64.exe", 0xD6A1C, 0x207704;
    int file2IGT : "Project64.exe", 0xD6A1C, 0x207774;
    int file3IGT : "Project64.exe", 0xD6A1C, 0x2077E4;
    int file4IGT : "Project64.exe", 0xD6A1C, 0x207854;
    int inGameTimeUpdater : "Project64.exe", 0xD6A1C, 0x370014;
    byte fileSelected : "Project64.exe", 0xD6A1C, 0x32DDF6;
    byte level : "Project64.exe", 0xD6A1C, 0x32DDFA;
    byte levelArea : "Project64.exe", 0xD6A1C, 0x33B249;
    byte music : "Project64.exe", 0xD6A1C, 0x22261E;
}

state("Project64", "1.7")
{
    int file1IGT : "Project64.exe", 0x1002FC, 0x207704;
    int file2IGT : "Project64.exe", 0x1002FC, 0x207774;
    int file3IGT : "Project64.exe", 0x1002FC, 0x2077E4;
    int file4IGT : "Project64.exe", 0x1002FC, 0x207854;
    int inGameTimeUpdater : "Project64.exe", 0x1002FC, 0x370014;
    byte fileSelected : "Project64.exe", 0x1002FC, 0x32DDF6;
    byte level : "Project64.exe", 0x1002FC, 0x32DDFA;
    byte levelArea : "Project64.exe", 0x1002FC, 0x33B249;
    byte music : "Project64.exe", 0x1002FC, 0x22261E;
}

startup
{
    settings.Add("nostart", true, "Enable auto-start");
    settings.Add("noreset", true, "Enable auto-reset");
    //settings.Add("nosplits", true, "Enable auto-splits"); Fuck it, no one will use them
    settings.Add("noend", true, "Enable auto-splitting the final screen");
    settings.Add("nogot", true, "Retain game time lost from game over");
}

init
{
    refreshRate = 30;
	switch (modules.First().FileVersionInfo.FileVersion)
	{
        case "1.7.0.55":
            version = "1.7";
            break;
        default:
            version = "1.6";
            break;
	}
    vars.gameOverTime = 0;
}

update
{
    if (current.fileSelected == 2 && current.file2IGT < old.file2IGT && settings["nogot"])
        vars.gameOverTime = old.file2IGT + current.inGameTimeUpdater - current.file2IGT + vars.gameOverTime;
    else if (current.fileSelected == 3 && current.file3IGT < old.file3IGT)
        vars.gameOverTime = old.file3IGT + current.inGameTimeUpdater - current.file3IGT + vars.gameOverTime;
    else if (current.fileSelected == 1 && current.file1IGT < old.file1IGT)
        vars.gameOverTime = old.file1IGT + current.inGameTimeUpdater - current.file1IGT + vars.gameOverTime;
    else if (current.fileSelected == 4 && current.file4IGT < old.file4IGT)
        vars.gameOverTime = old.file4IGT + current.inGameTimeUpdater - current.file4IGT + vars.gameOverTime;
    //Will need to fix this betteer
    if (current.level == 1)
        vars.gameOverTime = 0;
}

start
{
    return (settings["nostart"] && current.level == 35 && old.inGameTimeUpdater > current.inGameTimeUpdater);
}

reset
{
    return (current.level == 1 && settings["noreset"]);
}

split
{
    return (current.level == 25 && settings["noend"]);
}

isLoading
{
    return true;
}

gameTime
{
    if (current.fileSelected == 2)
        return TimeSpan.FromMilliseconds((current.file2IGT + current.inGameTimeUpdater + vars.gameOverTime)*1000/30);
    else if (current.fileSelected == 3)
        return TimeSpan.FromMilliseconds((current.file3IGT + current.inGameTimeUpdater + vars.gameOverTime)*1000/30);
    else if (current.fileSelected == 1)
        return TimeSpan.FromMilliseconds((current.file1IGT + current.inGameTimeUpdater + vars.gameOverTime)*1000/30);
    else if (current.fileSelected == 4)
        return TimeSpan.FromMilliseconds((current.file4IGT + current.inGameTimeUpdater + vars.gameOverTime)*1000/30);
}
