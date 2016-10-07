state("Project64", "1.6 Any%")
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

state("Project64", "1.7 Any%")
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

state("Project64", "1.6 130 Star")
{
    int file1IGT : "Project64.exe", 0xD6A1C, 0x207704;
    int file2IGT : "Project64.exe", 0xD6A1C, 0x207774;
    int file3IGT : "Project64.exe", 0xD6A1C, 0x2077E4;
    int file4IGT : "Project64.exe", 0xD6A1C, 0x207854;
    int inGameTimeUpdater : "Project64.exe", 0xD6A1C, 0x370014;
    byte fileSelected : "Project64.exe", 0xD6A1C, 0x32DDF6;
    byte level : "Project64.exe", 0xD6A1C, 0x32DDFA;
    byte29 file1Stars : "Project64.exe", 0xD6A1C, 0x207708;
    byte29 file2Stars : "Project64.exe", 0xD6A1C, 0x207778;
    byte29 file3Stars : "Project64.exe", 0xD6A1C, 0x2077e8;
    byte29 file4Stars : "Project64.exe", 0xD6A1C, 0x207858;
}

state("Project64", "1.7 130 Star")
{
    int file1IGT : "Project64.exe", 0x1002FC, 0x207704;
    int file2IGT : "Project64.exe", 0x1002FC, 0x207774;
    int file3IGT : "Project64.exe", 0x1002FC, 0x2077E4;
    int file4IGT : "Project64.exe", 0x1002FC, 0x207854;
    int inGameTimeUpdater : "Project64.exe", 0x1002FC, 0x370014;
    byte fileSelected : "Project64.exe", 0x1002FC, 0x32DDF6;
    byte level : "Project64.exe", 0x1002FC, 0x32DDFA;
    byte29 file1Stars : "Project64.exe", 0x1002FC, 0x207708;
    byte29 file2Stars : "Project64.exe", 0x1002FC, 0x207778;
    byte29 file3Stars : "Project64.exe", 0x1002FC, 0x2077e8;
    byte29 file4Stars : "Project64.exe", 0x1002FC, 0x207858;
}

init
{
    refreshRate = 30; //Game runs at 30 fps, so using this over the default 60 reduces CPU usage.
	switch (modules.First().FileVersionInfo.FileVersion + " " + timer.Run.CategoryName) //Check which version of Project64 is being used. Will probably need to add more.
	{
        case " Any%":
        case " 0 Star":
            version = "1.6 Any%";
            break;
        case "1.7.0.55 Any%":
        case "1.7.0.55 0 Star":
            version = "1.7 Any%";
            break;
        case " 80 Star":
        case " 130 Star":
        case " 130 Star BLJless":
        case " 20 Star":
            version = "1.6 130 Star";
            break;
        case "1.7.0.55 80 Star":
        case "1.7.0.55 130 Star":
        case "1.7.0.55 130 Star BLJless":
        case "1.7.0.55 20 Star":
            version = "1.7 130 Star";
            break;
        default:
            version = "1.6 130 Star";
            break;
	}
    vars.gameOverTime = 0;
}

update //Saves game time lost from game over
{
    if (current.level == 1)
        vars.gameOverTime = 0; //Resets value on reset
    if (current.fileSelected == 1 && current.file1IGT < old.file1IGT)
        vars.gameOverTime = old.file1IGT + current.inGameTimeUpdater - current.file1IGT + vars.gameOverTime;
    if (current.fileSelected == 2 && current.file2IGT < old.file2IGT)
        vars.gameOverTime = old.file2IGT + current.inGameTimeUpdater - current.file2IGT + vars.gameOverTime;
    if (current.fileSelected == 3 && current.file3IGT < old.file3IGT)
        vars.gameOverTime = old.file3IGT + current.inGameTimeUpdater - current.file3IGT + vars.gameOverTime;
    if (current.fileSelected == 4 && current.file4IGT < old.file4IGT)
        vars.gameOverTime = old.file4IGT + current.inGameTimeUpdater - current.file4IGT + vars.gameOverTime;
}

start //Starts when touching a file door.
{
    return (current.level == 35 && old.inGameTimeUpdater > current.inGameTimeUpdater);
}

reset //Resets on...reset.
{
    if (version == "1.6 Any%" || version == "1.7 Any%")
        return current.level == 1;
}

split //Micro-splits
{
    if (version == "1.6 Any%" || version == "1.7 Any%")
        return (
//      (current.level == 16 && current.levelArea > old.levelArea) || //Coconut Clip
        (current.level == 17 && old.level == 16 && current.inGameTimeUpdater > 600) || //Into Bowser 1
        (current.level == 17 && current.music == 19 && old.music == 17) || //Bowser's Fiery Castle
        (current.level == 16 && old.level == 30) || //Bowser
//      (current.level == 6 && old.level == 16) || //Out of BFC
        (current.level == 19 && old.level == 6) || //Cannon Skip (and again)
        (current.level == 19 && current.music == 0 && old.music == 41) || //Shadow Factory
        (current.level == 6 && old.level == 30) || //Shadow Mario
//      (current.level == 26 && old.level == 6) || //TO THE MOOOOON!
        (current.level == 21 && old.level == 26) || //RMC Clip
        (current.level == 21 && current.levelArea > old.levelArea && current.inGameTimeUpdater > 600) || //Rashay's Moon Cellar
        (current.level == 21 && current.music == 33 && old.music == 0) || //Rashay Phase One
        (current.level == 21 && current.music == 31 && old.music == 33) || //Rashay Phase Two
        (current.level == 21 && current.music == 33 && old.music == 31) || //Peach
        (current.level == 25) //End
        );
    if (version == "1.6 130 Star" || version == "1.7 130 Star") {
        if (current.fileSelected == 1)
            return (current.level == 25 || (current.level == 16 && old.level == 9 && ((current.file1Stars[7]|0x80) == 255)) || (current.level == 16 && old.level == 24 && ((current.file1Stars[6]|0x80) == 255)) || (current.level == 16 && old.level == 12 && ((current.file1Stars[5]|0x80) == 255)) || (current.level == 16 && old.level == 5 && ((current.file1Stars[4]|0x80) == 255)) || (current.level == 16 && old.level == 4 && ((current.file1Stars[11]|0x80) == 255)) || (current.level == 6 && old.level == 7 && ((current.file1Stars[10]|0x80) == 255)) || (current.level == 6 && old.level == 22 && ((current.file1Stars[9]|0x80) == 255)) || (current.level == 6 && old.level == 8 && ((current.file1Stars[8]|0x80) == 255)) || (current.level == 6 && old.level == 23 && ((current.file1Stars[15]|0x80) == 255)) || (current.level == 6 && old.level == 10 && ((current.file1Stars[14]|0x80) == 255)) || (current.level == 26 && old.level == 11 && ((current.file1Stars[13]|0x80) == 255)) || (current.level == 26 && old.level == 36 && ((current.file1Stars[12]|0x80) == 255)) || (current.level == 26 && old.level == 13 && ((current.file1Stars[19]|0x80) == 255)) || (current.level == 26 && old.level == 14 && ((current.file1Stars[18]|0x80) == 255)) || (current.level == 26 && old.level == 15 && ((current.file1Stars[17]|0x80) == 255)));
        if (current.fileSelected == 2)
            return (current.level == 25 || (current.level == 16 && old.level == 9 && ((current.file2Stars[7]|0x80) == 255)) || (current.level == 16 && old.level == 24 && ((current.file2Stars[6]|0x80) == 255)) || (current.level == 16 && old.level == 12 && ((current.file2Stars[5]|0x80) == 255)) || (current.level == 16 && old.level == 5 && ((current.file2Stars[4]|0x80) == 255)) || (current.level == 16 && old.level == 4 && ((current.file2Stars[11]|0x80) == 255)) || (current.level == 6 && old.level == 7 && ((current.file2Stars[10]|0x80) == 255)) || (current.level == 6 && old.level == 22 && ((current.file2Stars[9]|0x80) == 255)) || (current.level == 6 && old.level == 8 && ((current.file2Stars[8]|0x80) == 255)) || (current.level == 6 && old.level == 23 && ((current.file2Stars[15]|0x80) == 255)) || (current.level == 6 && old.level == 10 && ((current.file2Stars[14]|0x80) == 255)) || (current.level == 26 && old.level == 11 && ((current.file2Stars[13]|0x80) == 255)) || (current.level == 26 && old.level == 36 && ((current.file2Stars[12]|0x80) == 255)) || (current.level == 26 && old.level == 13 && ((current.file2Stars[19]|0x80) == 255)) || (current.level == 26 && old.level == 14 && ((current.file2Stars[18]|0x80) == 255)) || (current.level == 26 && old.level == 15 && ((current.file2Stars[17]|0x80) == 255)));
        if (current.fileSelected == 3)
        return (current.level == 25 || (current.level == 16 && old.level == 9 && ((current.file3Stars[7]|0x80) == 255)) || (current.level == 16 && old.level == 24 && ((current.file3Stars[6]|0x80) == 255)) || (current.level == 16 && old.level == 12 && ((current.file3Stars[5]|0x80) == 255)) || (current.level == 16 && old.level == 5 && ((current.file3Stars[4]|0x80) == 255)) || (current.level == 16 && old.level == 4 && ((current.file3Stars[11]|0x80) == 255)) || (current.level == 6 && old.level == 7 && ((current.file3Stars[10]|0x80) == 255)) || (current.level == 6 && old.level == 22 && ((current.file3Stars[9]|0x80) == 255)) || (current.level == 6 && old.level == 8 && ((current.file3Stars[8]|0x80) == 255)) || (current.level == 6 && old.level == 23 && ((current.file3Stars[15]|0x80) == 255)) || (current.level == 6 && old.level == 10 && ((current.file3Stars[14]|0x80) == 255)) || (current.level == 26 && old.level == 11 && ((current.file3Stars[13]|0x80) == 255)) || (current.level == 26 && old.level == 36 && ((current.file3Stars[12]|0x80) == 255)) || (current.level == 26 && old.level == 13 && ((current.file3Stars[19]|0x80) == 255)) || (current.level == 26 && old.level == 14 && ((current.file3Stars[18]|0x80) == 255)) || (current.level == 26 && old.level == 15 && ((current.file3Stars[17]|0x80) == 255)));
        if (current.fileSelected == 4)
        return (current.level == 25 || (current.level == 16 && old.level == 9 && ((current.file4Stars[7]|0x80) == 255)) || (current.level == 16 && old.level == 24 && ((current.file4Stars[6]|0x80) == 255)) || (current.level == 16 && old.level == 12 && ((current.file4Stars[5]|0x80) == 255)) || (current.level == 16 && old.level == 5 && ((current.file4Stars[4]|0x80) == 255)) || (current.level == 16 && old.level == 4 && ((current.file4Stars[11]|0x80) == 255)) || (current.level == 6 && old.level == 7 && ((current.file4Stars[10]|0x80) == 255)) || (current.level == 6 && old.level == 22 && ((current.file4Stars[9]|0x80) == 255)) || (current.level == 6 && old.level == 8 && ((current.file4Stars[8]|0x80) == 255)) || (current.level == 6 && old.level == 23 && ((current.file4Stars[15]|0x80) == 255)) || (current.level == 6 && old.level == 10 && ((current.file4Stars[14]|0x80) == 255)) || (current.level == 26 && old.level == 11 && ((current.file4Stars[13]|0x80) == 255)) || (current.level == 26 && old.level == 36 && ((current.file4Stars[12]|0x80) == 255)) || (current.level == 26 && old.level == 13 && ((current.file4Stars[19]|0x80) == 255)) || (current.level == 26 && old.level == 14 && ((current.file4Stars[18]|0x80) == 255)) || (current.level == 26 && old.level == 15 && ((current.file4Stars[17]|0x80) == 255)));
    }
}

isLoading //This disables LiveSplit's internal timer for game time.
{
    return true;
}

gameTime //Grabs game time manually. Accurate to the frame.
{
    if (current.fileSelected == 1)
        return TimeSpan.FromMilliseconds((current.file1IGT + current.inGameTimeUpdater + vars.gameOverTime)*1000/30);
    if (current.fileSelected == 2)
        return TimeSpan.FromMilliseconds((current.file2IGT + current.inGameTimeUpdater + vars.gameOverTime)*1000/30);
    if (current.fileSelected == 3)
        return TimeSpan.FromMilliseconds((current.file3IGT + current.inGameTimeUpdater + vars.gameOverTime)*1000/30);
    if (current.fileSelected == 4)
        return TimeSpan.FromMilliseconds((current.file4IGT + current.inGameTimeUpdater + vars.gameOverTime)*1000/30);
}
