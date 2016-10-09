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
    byte levelArea : "Project64.exe", 0x1002FC, 0x33B249;
    byte music : "Project64.exe", 0x1002FC, 0x22261E;
    byte29 file1Stars : "Project64.exe", 0x1002FC, 0x207708;
    byte29 file2Stars : "Project64.exe", 0x1002FC, 0x207778;
    byte29 file3Stars : "Project64.exe", 0x1002FC, 0x2077e8;
    byte29 file4Stars : "Project64.exe", 0x1002FC, 0x207858;
}

startup
{
    
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
    vars.segment = 0;
    vars.gameOverTime = 0;
    vars.category = timer.Run.CategoryName;
}

update
{
    if (vars.segment % 2 == 1) vars.segment += 1;
    if (vars.category == "Any%" || vars.category == "0 Star" || vars.category == "20 Star") {
        if (vars.segment < 6) {
//               if(vars.segment ==  0) vars.segment += (current.level == 16 && current.levelArea > old.levelArea) ? 1 : 0;
                 if(vars.segment ==  0) vars.segment += (current.level == 17 && old.level == 16) ? 1 : 0;
            else if(vars.segment ==  2) vars.segment += (current.level == 17 && current.music == 19 && old.music == 17) ? 1 : 0;
            else if(vars.segment ==  4) vars.segment += (current.level == 16 && old.level == 30) ? 1 : 0;
//          else if(vars.segment ==  8) vars.segment += (current.level ==  6 && old.level == 16) ? 1 : 0;
        }
        else if (vars.segment < 12) {
                 if(vars.segment ==  6) vars.segment += (current.level == 19 && old.level ==  6) ? 1 : 0;
            else if(vars.segment ==  8) vars.segment += (current.level == 19 && current.music == 0 && old.music == 41) ? 1 : 0;
            else if(vars.segment == 10) vars.segment += (current.level ==  6 && old.level == 30) ? 1 : 0;
//          else if(vars.segment == 16) vars.segment += (current.level == 19 && old.level ==  6) ? 1 : 0;
//          else if(vars.segment == 18) vars.segment += (current.level == 26 && old.level ==  6) ? 1 : 0;
        }
        else {
                 if(vars.segment == 12) vars.segment += (current.level == 21 && old.level == 26) ? 1 : 0;
            else if(vars.segment == 14) vars.segment += (current.level == 21 && current.levelArea > old.levelArea) ? 1 : 0;
            else if(vars.segment == 16) vars.segment += (current.level == 21 && current.music == 33 && old.music ==  0) ? 1 : 0;
            else if(vars.segment == 18) vars.segment += (current.level == 21 && current.music == 31 && old.music == 33) ? 1 : 0;
//          else if(vars.segment == 28) vars.segment += (current.level == 21 && current.music == 33 && old.music == 31) ? 1 : 0;
            else if(vars.segment == 20) vars.segment += (current.level == 25) ? 1 : 0;
        }
    }
    //The following is VERY long because switch doesn't work inside update.
    //For now it's only splitting once a world has all its stars and just exited said world.
    else if (vars.category == "130 Star") {
        if((current.level == 6 || current.level == 16 || current.level == 26) && !(old.level == 6 || old.level == 16 || old.level == 26)) {
            if (old.level < 10) {
                if (current.fileSelected == 2) {
                    vars.segment += (old.level ==  4 && (current.file2Stars[11]|0x80) == 255) ? 1 : 0; //World  5
                    vars.segment += (old.level ==  5 && (current.file2Stars[ 4]|0x80) == 255) ? 1 : 0; //World  4
                    vars.segment += (old.level ==  7 && (current.file2Stars[10]|0x80) == 255) ? 1 : 0; //World  6
                    vars.segment += (old.level ==  8 && (current.file2Stars[ 8]|0x80) == 255) ? 1 : 0; //World  8
                    vars.segment += (old.level ==  9 && (current.file2Stars[ 7]|0x80) == 255) ? 1 : 0; //World  1
                }
                else if (current.fileSelected == 3) {
                    vars.segment += (old.level ==  4 && (current.file3Stars[11]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level ==  5 && (current.file3Stars[ 4]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level ==  7 && (current.file3Stars[10]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level ==  8 && (current.file3Stars[ 8]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level ==  9 && (current.file3Stars[ 7]|0x80) == 255) ? 1 : 0;
                }
                else if (current.fileSelected == 1) {
                    vars.segment += (old.level ==  4 && (current.file1Stars[11]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level ==  5 && (current.file1Stars[ 4]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level ==  7 && (current.file1Stars[10]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level ==  8 && (current.file1Stars[ 8]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level ==  9 && (current.file1Stars[ 7]|0x80) == 255) ? 1 : 0;
                }
                else if (current.fileSelected == 4) {
                    vars.segment += (old.level ==  4 && (current.file4Stars[11]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level ==  5 && (current.file4Stars[ 4]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level ==  7 && (current.file4Stars[10]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level ==  8 && (current.file4Stars[ 8]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level ==  9 && (current.file4Stars[ 7]|0x80) == 255) ? 1 : 0;
                }
            }
            else if (old.level < 20) {
                if (current.fileSelected == 2) {
                    vars.segment += (old.level == 10 && (current.file2Stars[14]|0x80) == 255) ? 1 : 0; //World 10
                    vars.segment += (old.level == 11 && (current.file2Stars[13]|0x80) == 255) ? 1 : 0; //World 11
                    vars.segment += (old.level == 12 && (current.file2Stars[ 5]|0x80) == 255) ? 1 : 0; //World  3
                    vars.segment += (old.level == 13 && (current.file2Stars[19]|0x80) == 255) ? 1 : 0; //World 13
                    vars.segment += (old.level == 14 && (current.file2Stars[18]|0x80) == 255) ? 1 : 0; //World 14
                    vars.segment += (old.level == 15 && (current.file2Stars[17]|0x80) == 255) ? 1 : 0; //World 15
                }
                else if (current.fileSelected == 3) {
                    vars.segment += (old.level == 10 && (current.file3Stars[14]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 11 && (current.file3Stars[13]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 12 && (current.file3Stars[ 5]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 13 && (current.file3Stars[19]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 14 && (current.file3Stars[18]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 15 && (current.file3Stars[17]|0x80) == 255) ? 1 : 0;
                }
                else if (current.fileSelected == 1) {
                    vars.segment += (old.level == 10 && (current.file1Stars[14]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 11 && (current.file1Stars[13]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 12 && (current.file1Stars[ 5]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 13 && (current.file1Stars[19]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 14 && (current.file1Stars[18]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 15 && (current.file1Stars[17]|0x80) == 255) ? 1 : 0;
                }
                else if (current.fileSelected == 4) {
                    vars.segment += (old.level == 10 && (current.file4Stars[14]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 11 && (current.file4Stars[13]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 12 && (current.file4Stars[ 5]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 13 && (current.file4Stars[19]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 14 && (current.file4Stars[18]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 15 && (current.file4Stars[17]|0x80) == 255) ? 1 : 0;
                }
            }
            else {
                if (current.fileSelected == 2) {
                    vars.segment += (old.level == 22 && (current.file2Stars[ 9]|0x80) == 255) ? 1 : 0; //World  7
                    vars.segment += (old.level == 23 && (current.file2Stars[15]|0x80) == 255) ? 1 : 0; //World  9
                    vars.segment += (old.level == 24 && (current.file2Stars[ 6]|0x80) == 255) ? 1 : 0; //World  2
                    vars.segment += (old.level == 36 && (current.file2Stars[12]|0x80) == 255) ? 1 : 0; //World 12
                }
                else if (current.fileSelected == 3) {
                    vars.segment += (old.level == 22 && (current.file3Stars[ 9]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 23 && (current.file3Stars[15]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 24 && (current.file3Stars[ 6]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 36 && (current.file3Stars[12]|0x80) == 255) ? 1 : 0;
                }
                else if (current.fileSelected == 1) {
                    vars.segment += (old.level == 22 && (current.file1Stars[ 9]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 23 && (current.file1Stars[15]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 24 && (current.file1Stars[ 6]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 36 && (current.file1Stars[12]|0x80) == 255) ? 1 : 0;
                }
                else if (current.fileSelected == 4) {
                    vars.segment += (old.level == 22 && (current.file4Stars[ 9]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 23 && (current.file4Stars[15]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 24 && (current.file4Stars[ 6]|0x80) == 255) ? 1 : 0;
                    vars.segment += (old.level == 36 && (current.file4Stars[12]|0x80) == 255) ? 1 : 0;
                }
            }
        }
    }
    if (current.fileSelected == 2 && current.file2IGT < old.file2IGT)
        vars.gameOverTime = old.file2IGT + current.inGameTimeUpdater - current.file2IGT + vars.gameOverTime;
    else if (current.fileSelected == 3 && current.file3IGT < old.file3IGT)
        vars.gameOverTime = old.file3IGT + current.inGameTimeUpdater - current.file3IGT + vars.gameOverTime;
    else if (current.fileSelected == 1 && current.file1IGT < old.file1IGT)
        vars.gameOverTime = old.file1IGT + current.inGameTimeUpdater - current.file1IGT + vars.gameOverTime;
    else if (current.fileSelected == 4 && current.file4IGT < old.file4IGT)
        vars.gameOverTime = old.file4IGT + current.inGameTimeUpdater - current.file4IGT + vars.gameOverTime;
}

start
{
    return (current.level == 35 && old.inGameTimeUpdater > current.inGameTimeUpdater);
}

reset
{
    if (vars.category == "Any%" || vars.category == "0 Star")
        return current.level == 1;
}

split
{
    return (vars.segment % 2 == 1);
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
