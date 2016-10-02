state("Project64")
{
    int inGameTimeF1 : "Project64.exe", 0xD6A1C, 0x207704;
    int inGameTimeF2 : "Project64.exe", 0xD6A1C, 0x207774;
    int inGameTimeF3 : "Project64.exe", 0xD6A1C, 0x2077E4;
    int inGameTimeF4 : "Project64.exe", 0xD6A1C, 0x207854;
    int inGameTimeUpdater : "Project64.exe", 0xD6A1C, 0x370014;
    byte fileSelected : "Project64.exe", 0xD6A1C, 0x32DDF6;
}

state("Project64", "1.6")
{
    int inGameTimeF1 : "Project64.exe", 0xD6A1C, 0x207704;
    int inGameTimeF2 : "Project64.exe", 0xD6A1C, 0x207774;
    int inGameTimeF3 : "Project64.exe", 0xD6A1C, 0x2077E4;
    int inGameTimeF4 : "Project64.exe", 0xD6A1C, 0x207854;
    int inGameTimeUpdater : "Project64.exe", 0xD6A1C, 0x370014;
    byte fileSelected : "Project64.exe", 0xD6A1C, 0x32DDF6;
}

state("Project64", "1.7")
{
    int inGameTimeF1 : "Project64.exe", 0x1002FC, 0x207704;
    int inGameTimeF2 : "Project64.exe", 0x1002FC, 0x207774;
    int inGameTimeF3 : "Project64.exe", 0x1002FC, 0x2077E4;
    int inGameTimeF4 : "Project64.exe", 0x1002FC, 0x207854;
    int inGameTimeUpdater : "Project64.exe", 0x1002FC, 0x370014;
    byte fileSelected : "Project64.exe", 0x1002FC, 0x32DDF6;
}

init
{
    refreshRate = 30;
	switch (modules.First().FileVersionInfo.FileVersion)	
	{
		case "1.6":
			version = "1.6";
			break;
		case "1.7":
		case "1.7.0.55":
			version = "1.7";
			break;
	}
}

start
{
    return (current.fileSelected == 1 && current.inGameTimeUpdater == 0); //Will improve
}

reset
{
}

split
{
}

isLoading
{
    return true;
}

gameTime
{
    if (current.fileSelected == 1)
    return TimeSpan.FromMilliseconds((current.inGameTimeF1 + current.inGameTimeUpdater)*1000/30);
    if (current.fileSelected == 2)
    return TimeSpan.FromMilliseconds((current.inGameTimeF2 + current.inGameTimeUpdater)*1000/30);
    if (current.fileSelected == 3)
    return TimeSpan.FromMilliseconds((current.inGameTimeF3 + current.inGameTimeUpdater)*1000/30);
    if (current.fileSelected == 4)
    return TimeSpan.FromMilliseconds((current.inGameTimeF4 + current.inGameTimeUpdater)*1000/30);
}
