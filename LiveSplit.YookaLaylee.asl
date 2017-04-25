state("YookaLaylee64")
{
    bool isLoad1: "YookaLaylee64.exe", 0x1325088, 0x2EC;
//  byte isLoad2: "AkSoundEngine.dll", 0x1A2FB8; // Thanks TRS for NOTHING :^)
    float cameraTilt: "AkSoundEngine.dll", 0x198764;
    uint starter: "YookaLaylee64.exe", 0x13218E8, 0x78, 0x10, 0x20, 0x64;
//  uint slot0gametime : "YookaLaylee64.exe", 0x01298200, 0xA48, 0x5D0, 0x88;
}

start
{
    return (current.starter == 65536 && old.starter < 2);
}

split
{
    return (timer.CurrentSplitIndex == (timer.Run.Count - 1) && current.cameraTilt == old.cameraTilt && current.cameraTilt < -0.09842f && current.cameraTilt > -0.09843f);
}

isLoading
{
    return (current.isLoad1 && current.cameraTilt == 0);
}
