state("Project64")
{
    int inGameTimeF1 : "Project64.exe", 0xD6A1C, 0x207704;
    int inGameTimeF2 : "Project64.exe", 0xD6A1C, 0x207774;
    int inGameTimeF3 : "Project64.exe", 0xD6A1C, 0x2077E4;
    int inGameTimeF4 : "Project64.exe", 0xD6A1C, 0x207854;
    int inGameTimeUpdater : "Project64.exe", 0xD6A1C, 0x370014;
    byte fileSelected : "Project64.exe", 0xD6A1C, 0x32DDF6;
    byte level : "Project64.exe", 0xD6A1C, 0x349D88;
//    byte world01F1 : "Project64.exe", 0xD6A1C, 0x20770c;
//    byte world01F2 : "Project64.exe", 0xD6A1C, 0x20777c;
//    byte world01F3 : "Project64.exe", 0xD6A1C, 0x2077ec;
//    byte world01F4 : "Project64.exe", 0xD6A1C, 0x20785c;
//    byte world02F1 : "Project64.exe", 0xD6A1C, 0x20770d;
//    byte world02F2 : "Project64.exe", 0xD6A1C, 0x20777d;
//    byte world02F3 : "Project64.exe", 0xD6A1C, 0x2077ed;
//    byte world02F4 : "Project64.exe", 0xD6A1C, 0x20785d;
//    byte world03F1 : "Project64.exe", 0xD6A1C, 0x20770e;
//    byte world03F2 : "Project64.exe", 0xD6A1C, 0x20777e;
//    byte world03F3 : "Project64.exe", 0xD6A1C, 0x2077ee;
//    byte world03F4 : "Project64.exe", 0xD6A1C, 0x20785e;
//    byte world04F1 : "Project64.exe", 0xD6A1C, 0x20770f;
//    byte world04F2 : "Project64.exe", 0xD6A1C, 0x20777f;
//    byte world04F3 : "Project64.exe", 0xD6A1C, 0x2077ef;
//    byte world04F4 : "Project64.exe", 0xD6A1C, 0x20785f;
//    byte world05F1 : "Project64.exe", 0xD6A1C, 0x207710;
//    byte world05F2 : "Project64.exe", 0xD6A1C, 0x207780;
//    byte world05F3 : "Project64.exe", 0xD6A1C, 0x2077f0;
//    byte world05F4 : "Project64.exe", 0xD6A1C, 0x207860;
//    byte world06F1 : "Project64.exe", 0xD6A1C, 0x207711;
//    byte world06F2 : "Project64.exe", 0xD6A1C, 0x207781;
//    byte world06F3 : "Project64.exe", 0xD6A1C, 0x2077f1;
//    byte world06F4 : "Project64.exe", 0xD6A1C, 0x207861;
//    byte world07F1 : "Project64.exe", 0xD6A1C, 0x207712;
//    byte world07F2 : "Project64.exe", 0xD6A1C, 0x207782;
//    byte world07F3 : "Project64.exe", 0xD6A1C, 0x2077f2;
//    byte world07F4 : "Project64.exe", 0xD6A1C, 0x207862;
//    byte world08F1 : "Project64.exe", 0xD6A1C, 0x207713;
//    byte world08F2 : "Project64.exe", 0xD6A1C, 0x207783;
//    byte world08F3 : "Project64.exe", 0xD6A1C, 0x2077f3;
//    byte world08F4 : "Project64.exe", 0xD6A1C, 0x207863;
//    byte world09F1 : "Project64.exe", 0xD6A1C, 0x207714;
//    byte world09F2 : "Project64.exe", 0xD6A1C, 0x207784;
//    byte world09F3 : "Project64.exe", 0xD6A1C, 0x2077f4;
//    byte world09F4 : "Project64.exe", 0xD6A1C, 0x207864;
//    byte world10F1 : "Project64.exe", 0xD6A1C, 0x207715;
//    byte world10F2 : "Project64.exe", 0xD6A1C, 0x207785;
//    byte world10F3 : "Project64.exe", 0xD6A1C, 0x2077f5;
//    byte world10F4 : "Project64.exe", 0xD6A1C, 0x207865;
//    byte world11F1 : "Project64.exe", 0xD6A1C, 0x207716;
//    byte world11F2 : "Project64.exe", 0xD6A1C, 0x207786;
//    byte world11F3 : "Project64.exe", 0xD6A1C, 0x2077f6;
//    byte world11F4 : "Project64.exe", 0xD6A1C, 0x207866;
//    byte world12F1 : "Project64.exe", 0xD6A1C, 0x207717;
//    byte world12F2 : "Project64.exe", 0xD6A1C, 0x207787;
//    byte world12F3 : "Project64.exe", 0xD6A1C, 0x2077f7;
//    byte world12F4 : "Project64.exe", 0xD6A1C, 0x207867;
//    byte world13F1 : "Project64.exe", 0xD6A1C, 0x207718;
//    byte world13F2 : "Project64.exe", 0xD6A1C, 0x207788;
//    byte world13F3 : "Project64.exe", 0xD6A1C, 0x2077f8;
//    byte world13F4 : "Project64.exe", 0xD6A1C, 0x207868;
//    byte world14F1 : "Project64.exe", 0xD6A1C, 0x207719;
//    byte world14F2 : "Project64.exe", 0xD6A1C, 0x207789;
//    byte world14F3 : "Project64.exe", 0xD6A1C, 0x2077f9;
//    byte world14F4 : "Project64.exe", 0xD6A1C, 0x207869;
//    byte world15F1 : "Project64.exe", 0xD6A1C, 0x20771a;
//    byte world15F2 : "Project64.exe", 0xD6A1C, 0x20778a;
//    byte world15F3 : "Project64.exe", 0xD6A1C, 0x2077fa;
//    byte world15F4 : "Project64.exe", 0xD6A1C, 0x20786a;
}

state("Project64", "1.6")
{
    int inGameTimeF1 : "Project64.exe", 0xD6A1C, 0x207704;
    int inGameTimeF2 : "Project64.exe", 0xD6A1C, 0x207774;
    int inGameTimeF3 : "Project64.exe", 0xD6A1C, 0x2077E4;
    int inGameTimeF4 : "Project64.exe", 0xD6A1C, 0x207854;
    int inGameTimeUpdater : "Project64.exe", 0xD6A1C, 0x370014;
    byte fileSelected : "Project64.exe", 0xD6A1C, 0x32DDF6;
    byte level : "Project64.exe", 0xD6A1C, 0x349D88;
//    byte world01F1 : "Project64.exe", 0xD6A1C, 0x20770c;
//    byte world01F2 : "Project64.exe", 0xD6A1C, 0x20777c;
//    byte world01F3 : "Project64.exe", 0xD6A1C, 0x2077ec;
//    byte world01F4 : "Project64.exe", 0xD6A1C, 0x20785c;
//    byte world02F1 : "Project64.exe", 0xD6A1C, 0x20770d;
//    byte world02F2 : "Project64.exe", 0xD6A1C, 0x20777d;
//    byte world02F3 : "Project64.exe", 0xD6A1C, 0x2077ed;
//    byte world02F4 : "Project64.exe", 0xD6A1C, 0x20785d;
//    byte world03F1 : "Project64.exe", 0xD6A1C, 0x20770e;
//    byte world03F2 : "Project64.exe", 0xD6A1C, 0x20777e;
//    byte world03F3 : "Project64.exe", 0xD6A1C, 0x2077ee;
//    byte world03F4 : "Project64.exe", 0xD6A1C, 0x20785e;
//    byte world04F1 : "Project64.exe", 0xD6A1C, 0x20770f;
//    byte world04F2 : "Project64.exe", 0xD6A1C, 0x20777f;
//    byte world04F3 : "Project64.exe", 0xD6A1C, 0x2077ef;
//    byte world04F4 : "Project64.exe", 0xD6A1C, 0x20785f;
//    byte world05F1 : "Project64.exe", 0xD6A1C, 0x207710;
//    byte world05F2 : "Project64.exe", 0xD6A1C, 0x207780;
//    byte world05F3 : "Project64.exe", 0xD6A1C, 0x2077f0;
//    byte world05F4 : "Project64.exe", 0xD6A1C, 0x207860;
//    byte world06F1 : "Project64.exe", 0xD6A1C, 0x207711;
//    byte world06F2 : "Project64.exe", 0xD6A1C, 0x207781;
//    byte world06F3 : "Project64.exe", 0xD6A1C, 0x2077f1;
//    byte world06F4 : "Project64.exe", 0xD6A1C, 0x207861;
//    byte world07F1 : "Project64.exe", 0xD6A1C, 0x207712;
//    byte world07F2 : "Project64.exe", 0xD6A1C, 0x207782;
//    byte world07F3 : "Project64.exe", 0xD6A1C, 0x2077f2;
//    byte world07F4 : "Project64.exe", 0xD6A1C, 0x207862;
//    byte world08F1 : "Project64.exe", 0xD6A1C, 0x207713;
//    byte world08F2 : "Project64.exe", 0xD6A1C, 0x207783;
//    byte world08F3 : "Project64.exe", 0xD6A1C, 0x2077f3;
//    byte world08F4 : "Project64.exe", 0xD6A1C, 0x207863;
//    byte world09F1 : "Project64.exe", 0xD6A1C, 0x207714;
//    byte world09F2 : "Project64.exe", 0xD6A1C, 0x207784;
//    byte world09F3 : "Project64.exe", 0xD6A1C, 0x2077f4;
//    byte world09F4 : "Project64.exe", 0xD6A1C, 0x207864;
//    byte world10F1 : "Project64.exe", 0xD6A1C, 0x207715;
//    byte world10F2 : "Project64.exe", 0xD6A1C, 0x207785;
//    byte world10F3 : "Project64.exe", 0xD6A1C, 0x2077f5;
//    byte world10F4 : "Project64.exe", 0xD6A1C, 0x207865;
//    byte world11F1 : "Project64.exe", 0xD6A1C, 0x207716;
//    byte world11F2 : "Project64.exe", 0xD6A1C, 0x207786;
//    byte world11F3 : "Project64.exe", 0xD6A1C, 0x2077f6;
//    byte world11F4 : "Project64.exe", 0xD6A1C, 0x207866;
//    byte world12F1 : "Project64.exe", 0xD6A1C, 0x207717;
//    byte world12F2 : "Project64.exe", 0xD6A1C, 0x207787;
//    byte world12F3 : "Project64.exe", 0xD6A1C, 0x2077f7;
//    byte world12F4 : "Project64.exe", 0xD6A1C, 0x207867;
//    byte world13F1 : "Project64.exe", 0xD6A1C, 0x207718;
//    byte world13F2 : "Project64.exe", 0xD6A1C, 0x207788;
//    byte world13F3 : "Project64.exe", 0xD6A1C, 0x2077f8;
//    byte world13F4 : "Project64.exe", 0xD6A1C, 0x207868;
//    byte world14F1 : "Project64.exe", 0xD6A1C, 0x207719;
//    byte world14F2 : "Project64.exe", 0xD6A1C, 0x207789;
//    byte world14F3 : "Project64.exe", 0xD6A1C, 0x2077f9;
//    byte world14F4 : "Project64.exe", 0xD6A1C, 0x207869;
//    byte world15F1 : "Project64.exe", 0xD6A1C, 0x20771a;
//    byte world15F2 : "Project64.exe", 0xD6A1C, 0x20778a;
//    byte world15F3 : "Project64.exe", 0xD6A1C, 0x2077fa;
//    byte world15F4 : "Project64.exe", 0xD6A1C, 0x20786a;
}

state("Project64", "1.7")
{
    int inGameTimeF1 : "Project64.exe", 0x1002FC, 0x207704;
    int inGameTimeF2 : "Project64.exe", 0x1002FC, 0x207774;
    int inGameTimeF3 : "Project64.exe", 0x1002FC, 0x2077E4;
    int inGameTimeF4 : "Project64.exe", 0x1002FC, 0x207854;
    int inGameTimeUpdater : "Project64.exe", 0x1002FC, 0x370014;
    byte fileSelected : "Project64.exe", 0x1002FC, 0x32DDF6;
    byte level : "Project64.exe", 0x1002FC, 0x32DDFA;
//    byte world01F1 : "Project64.exe", 0x1002FC, 0x20770f;
//    byte world01F2 : "Project64.exe", 0x1002FC, 0x20777f;
//    byte world01F3 : "Project64.exe", 0x1002FC, 0x2077ef;
//    byte world01F4 : "Project64.exe", 0x1002FC, 0x20785f;
//    byte world02F1 : "Project64.exe", 0x1002FC, 0x20770e;
//    byte world02F2 : "Project64.exe", 0x1002FC, 0x20777e;
//    byte world02F3 : "Project64.exe", 0x1002FC, 0x2077ee;
//    byte world02F4 : "Project64.exe", 0x1002FC, 0x20785e;
//    byte world03F1 : "Project64.exe", 0x1002FC, 0x20770d;
//    byte world03F2 : "Project64.exe", 0x1002FC, 0x20777d;
//    byte world03F3 : "Project64.exe", 0x1002FC, 0x2077ed;
//    byte world03F4 : "Project64.exe", 0x1002FC, 0x20785d;
//    byte world04F1 : "Project64.exe", 0x1002FC, 0x20770c;
//    byte world04F2 : "Project64.exe", 0x1002FC, 0x20777c;
//    byte world04F3 : "Project64.exe", 0x1002FC, 0x2077ec;
//    byte world04F4 : "Project64.exe", 0x1002FC, 0x20785c;
//    byte world05F1 : "Project64.exe", 0x1002FC, 0x207713;
//    byte world05F2 : "Project64.exe", 0x1002FC, 0x207783;
//    byte world05F3 : "Project64.exe", 0x1002FC, 0x2077f3;
//    byte world05F4 : "Project64.exe", 0x1002FC, 0x207863;
//    byte world06F1 : "Project64.exe", 0x1002FC, 0x207712;
//    byte world06F2 : "Project64.exe", 0x1002FC, 0x207782;
//    byte world06F3 : "Project64.exe", 0x1002FC, 0x2077f2;
//    byte world06F4 : "Project64.exe", 0x1002FC, 0x207862;
//    byte world07F1 : "Project64.exe", 0x1002FC, 0x207711;
//    byte world07F2 : "Project64.exe", 0x1002FC, 0x207781;
//    byte world07F3 : "Project64.exe", 0x1002FC, 0x2077f1;
//    byte world07F4 : "Project64.exe", 0x1002FC, 0x207861;
//    byte world08F1 : "Project64.exe", 0x1002FC, 0x207710;
//    byte world08F2 : "Project64.exe", 0x1002FC, 0x207780;
//    byte world08F3 : "Project64.exe", 0x1002FC, 0x2077f0;
//    byte world08F4 : "Project64.exe", 0x1002FC, 0x207860;
//    byte world09F1 : "Project64.exe", 0x1002FC, 0x207717;
//    byte world09F2 : "Project64.exe", 0x1002FC, 0x207787;
//    byte world09F3 : "Project64.exe", 0x1002FC, 0x2077f7;
//    byte world09F4 : "Project64.exe", 0x1002FC, 0x207867;
//    byte world10F1 : "Project64.exe", 0x1002FC, 0x207716;
//    byte world10F2 : "Project64.exe", 0x1002FC, 0x207786;
//    byte world10F3 : "Project64.exe", 0x1002FC, 0x2077f6;
//    byte world10F4 : "Project64.exe", 0x1002FC, 0x207866;
//    byte world11F1 : "Project64.exe", 0x1002FC, 0x207715;
//    byte world11F2 : "Project64.exe", 0x1002FC, 0x207785;
//    byte world11F3 : "Project64.exe", 0x1002FC, 0x2077f5;
//    byte world11F4 : "Project64.exe", 0x1002FC, 0x207865;
//    byte world12F1 : "Project64.exe", 0x1002FC, 0x207714;
//    byte world12F2 : "Project64.exe", 0x1002FC, 0x207784;
//    byte world12F3 : "Project64.exe", 0x1002FC, 0x2077f4;
//    byte world12F4 : "Project64.exe", 0x1002FC, 0x207864;
//    byte world13F1 : "Project64.exe", 0x1002FC, 0x20771b;
//    byte world13F2 : "Project64.exe", 0x1002FC, 0x20778b;
//    byte world13F3 : "Project64.exe", 0x1002FC, 0x2077fb;
//    byte world13F4 : "Project64.exe", 0x1002FC, 0x20786b;
//    byte world14F1 : "Project64.exe", 0x1002FC, 0x20771a;
//    byte world14F2 : "Project64.exe", 0x1002FC, 0x20778a;
//    byte world14F3 : "Project64.exe", 0x1002FC, 0x2077fa;
//    byte world14F4 : "Project64.exe", 0x1002FC, 0x20786a;
//    byte world15F1 : "Project64.exe", 0x1002FC, 0x207719;
//    byte world15F2 : "Project64.exe", 0x1002FC, 0x207789;
//    byte world15F3 : "Project64.exe", 0x1002FC, 0x2077f9;
//    byte world15F4 : "Project64.exe", 0x1002FC, 0x207869;
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
    return (current.level == 1); //Will improve
}

reset
{
}

split
{
    return (current.level == 25 || (current.level == 16 && old.level == 35)); //GTA start and end of game
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
