state("Project64", "1.6")
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

state("Project64", "1.7")
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
	switch (modules.First().FileVersionInfo.FileVersion) //Check which version of Project64 is being used. Will probably need to add more.
	{
        case "1.6":
            version = "1.6";
            break;
        case "1.7":
        case "1.7.0.55":
            version = "1.7";
            break;
        default:
            version = "1.6";
            break;
	}
}

start //Starts when touching a file door.
{
//    return (current.level == 1);
//    return (current.fileSelected == 1 && current.inGameTimeUpdater == 0);
    return (current.level == 35 && old.inGameTimeUpdater > current.inGameTimeUpdater);
}

reset //It can reset on resetting PJ64, but I need to know if there's any situation where reseting is viable. I highly doubt it.
{
}

split //Auto-splits when a level has all 7 stars. Doesn't auto-split anywhere else yet.
{
    if (current.fileSelected == 1)
    return (current.level == 25 || (current.level == 16 && old.level == 9 && ((current.file1Stars[7]|0x80) == 255)) || (current.level == 16 && old.level == 24 && ((current.file1Stars[6]|0x80) == 255)) || (current.level == 16 && old.level == 12 && ((current.file1Stars[5]|0x80) == 255)) || (current.level == 16 && old.level == 5 && ((current.file1Stars[4]|0x80) == 255)) || (current.level == 16 && old.level == 4 && ((current.file1Stars[11]|0x80) == 255)) || (current.level == 6 && old.level == 7 && ((current.file1Stars[10]|0x80) == 255)) || (current.level == 6 && old.level == 22 && ((current.file1Stars[9]|0x80) == 255)) || (current.level == 6 && old.level == 8 && ((current.file1Stars[8]|0x80) == 255)) || (current.level == 6 && old.level == 23 && ((current.file1Stars[15]|0x80) == 255)) || (current.level == 6 && old.level == 10 && ((current.file1Stars[14]|0x80) == 255)) || (current.level == 26 && old.level == 11 && ((current.file1Stars[13]|0x80) == 255)) || (current.level == 26 && old.level == 36 && ((current.file1Stars[12]|0x80) == 255)) || (current.level == 26 && old.level == 13 && ((current.file1Stars[19]|0x80) == 255)) || (current.level == 26 && old.level == 14 && ((current.file1Stars[18]|0x80) == 255)) || (current.level == 26 && old.level == 15 && ((current.file1Stars[17]|0x80) == 255)));
    if (current.fileSelected == 2)
    return (current.level == 25 || (current.level == 16 && old.level == 9 && ((current.file2Stars[7]|0x80) == 255)) || (current.level == 16 && old.level == 24 && ((current.file2Stars[6]|0x80) == 255)) || (current.level == 16 && old.level == 12 && ((current.file2Stars[5]|0x80) == 255)) || (current.level == 16 && old.level == 5 && ((current.file2Stars[4]|0x80) == 255)) || (current.level == 16 && old.level == 4 && ((current.file2Stars[11]|0x80) == 255)) || (current.level == 6 && old.level == 7 && ((current.file2Stars[10]|0x80) == 255)) || (current.level == 6 && old.level == 22 && ((current.file2Stars[9]|0x80) == 255)) || (current.level == 6 && old.level == 8 && ((current.file2Stars[8]|0x80) == 255)) || (current.level == 6 && old.level == 23 && ((current.file2Stars[15]|0x80) == 255)) || (current.level == 6 && old.level == 10 && ((current.file2Stars[14]|0x80) == 255)) || (current.level == 26 && old.level == 11 && ((current.file2Stars[13]|0x80) == 255)) || (current.level == 26 && old.level == 36 && ((current.file2Stars[12]|0x80) == 255)) || (current.level == 26 && old.level == 13 && ((current.file2Stars[19]|0x80) == 255)) || (current.level == 26 && old.level == 14 && ((current.file2Stars[18]|0x80) == 255)) || (current.level == 26 && old.level == 15 && ((current.file2Stars[17]|0x80) == 255)));
    if (current.fileSelected == 3)
    return (current.level == 25 || (current.level == 16 && old.level == 9 && ((current.file3Stars[7]|0x80) == 255)) || (current.level == 16 && old.level == 24 && ((current.file3Stars[6]|0x80) == 255)) || (current.level == 16 && old.level == 12 && ((current.file3Stars[5]|0x80) == 255)) || (current.level == 16 && old.level == 5 && ((current.file3Stars[4]|0x80) == 255)) || (current.level == 16 && old.level == 4 && ((current.file3Stars[11]|0x80) == 255)) || (current.level == 6 && old.level == 7 && ((current.file3Stars[10]|0x80) == 255)) || (current.level == 6 && old.level == 22 && ((current.file3Stars[9]|0x80) == 255)) || (current.level == 6 && old.level == 8 && ((current.file3Stars[8]|0x80) == 255)) || (current.level == 6 && old.level == 23 && ((current.file3Stars[15]|0x80) == 255)) || (current.level == 6 && old.level == 10 && ((current.file3Stars[14]|0x80) == 255)) || (current.level == 26 && old.level == 11 && ((current.file3Stars[13]|0x80) == 255)) || (current.level == 26 && old.level == 36 && ((current.file3Stars[12]|0x80) == 255)) || (current.level == 26 && old.level == 13 && ((current.file3Stars[19]|0x80) == 255)) || (current.level == 26 && old.level == 14 && ((current.file3Stars[18]|0x80) == 255)) || (current.level == 26 && old.level == 15 && ((current.file3Stars[17]|0x80) == 255)));
    if (current.fileSelected == 4)
    return (current.level == 25 || (current.level == 16 && old.level == 9 && ((current.file4Stars[7]|0x80) == 255)) || (current.level == 16 && old.level == 24 && ((current.file4Stars[6]|0x80) == 255)) || (current.level == 16 && old.level == 12 && ((current.file4Stars[5]|0x80) == 255)) || (current.level == 16 && old.level == 5 && ((current.file4Stars[4]|0x80) == 255)) || (current.level == 16 && old.level == 4 && ((current.file4Stars[11]|0x80) == 255)) || (current.level == 6 && old.level == 7 && ((current.file4Stars[10]|0x80) == 255)) || (current.level == 6 && old.level == 22 && ((current.file4Stars[9]|0x80) == 255)) || (current.level == 6 && old.level == 8 && ((current.file4Stars[8]|0x80) == 255)) || (current.level == 6 && old.level == 23 && ((current.file4Stars[15]|0x80) == 255)) || (current.level == 6 && old.level == 10 && ((current.file4Stars[14]|0x80) == 255)) || (current.level == 26 && old.level == 11 && ((current.file4Stars[13]|0x80) == 255)) || (current.level == 26 && old.level == 36 && ((current.file4Stars[12]|0x80) == 255)) || (current.level == 26 && old.level == 13 && ((current.file4Stars[19]|0x80) == 255)) || (current.level == 26 && old.level == 14 && ((current.file4Stars[18]|0x80) == 255)) || (current.level == 26 && old.level == 15 && ((current.file4Stars[17]|0x80) == 255)));
}

isLoading //This disables LiveSplit's internal timer for game time.
{
    return true;
}

gameTime //Grabs game time manually. Accurate to the frame.
{
    if (current.fileSelected == 1)
    return TimeSpan.FromMilliseconds((current.file1IGT + current.inGameTimeUpdater)*1000/30);
    if (current.fileSelected == 2)
    return TimeSpan.FromMilliseconds((current.file2IGT + current.inGameTimeUpdater)*1000/30);
    if (current.fileSelected == 3)
    return TimeSpan.FromMilliseconds((current.file3IGT + current.inGameTimeUpdater)*1000/30);
    if (current.fileSelected == 4)
    return TimeSpan.FromMilliseconds((current.file4IGT + current.inGameTimeUpdater)*1000/30);
}
